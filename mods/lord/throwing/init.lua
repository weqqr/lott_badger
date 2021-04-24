throwing                    = {}

throwing.arrows             = {}

local HIT_RADIUS = 4
local DONT_PUNCH_SAME_MOBS = true
local BASE_LIQUID_VISCOSITY = 50

local function node_ok(pos, fallback)
	fallback   = fallback or "default:dirt"
	local node = minetest.get_node_or_nil(pos)
	if not node then
		return minetest.registered_nodes[fallback]
	end
	if minetest.registered_nodes[node.name] then
		return node
	end
	return minetest.registered_nodes[fallback]
end

function throwing:arrow_type(arrow_name)
	if throwing.arrows[arrow_name] ~= nil then
		return throwing.arrows[arrow_name].arrow_type or "none"
	else
		return "none"
	end
end

local function acceleration(velocity, k, mass)
	if mass == nil or mass == 0.0 then
		return { x = 0.0, y = 0.0, z = 0.0 }
	end
	if k == nil or k == 0 then
		return { x = 0.0, y = -9.81, z = 0.0 }
	end
	return { x = -velocity.x * k, y = -9.81 - velocity.y * k, z = -velocity.z * k }
end

-- owner	: player or entity or node position
-- owner_type	: "player" or "entity" or "node"
-- arrow_name	: registered arrow name
-- pos		: launch position
-- dir		: launch direction
-- distance	: initial offset from launch position

function throwing:shoot(owner, owner_type, arrow_name, pos, dir, distance)
	local dl  = (dir.x ^ 2 + dir.y ^ 2 + dir.z ^ 2) ^ 0.5;
	dir.x     = dir.x / dl
	dir.y     = dir.y / dl
	dir.z     = dir.z / dl

	pos.x     = pos.x + dir.x * distance
	pos.y     = pos.y + dir.y * distance
	pos.z     = pos.z + dir.z * distance

	--minetest.log("action", "pos = "..pos.x.." "..pos.y.." "..pos.z)

	local obj = minetest.add_entity(pos, arrow_name)
	obj:set_armor_groups({ immortal = 1 })
	local entity = obj:get_luaentity()
	if entity then
		local ownvel = { x = 0, y = 0, z = 0 }
		local vec    = {}
		local v      = entity.velocity or 1 -- or set to default
		vec.x        = v * dir.x
		vec.y        = v * dir.y
		vec.z        = v * dir.z
		entity.switch   = 1

		if owner_type == "player" then
			entity.owner_id = owner:get_player_name() -- add unique owner id to arrow
			ownvel          = owner:get_player_velocity()
		elseif owner_type == "entity" then
			entity.owner_id = tostring(owner) -- add unique owner id to arrow
			ownvel          = owner:get_velocity() or ownvel
		elseif owner_type == "node"  then
			entity.owner_id = tostring(owner)
			ownvel          = {x=0, y=0, z=0}
		else
			-- INVALID!
			minetest.log("Invalid arrow owner: "..owner_type)
			return false
		end
		vec = { x = vec.x + ownvel.x, y = vec.y + ownvel.y, z = vec.z + ownvel.z }

		-- arrow velocity will be setted on first step
		entity.inited = false
		entity.launch_velocity = vec
		obj:set_velocity({ x = 0, y = 0, z = 0 })
		local yaw = 0
		if vec.x ~= 0 or vec.z ~= 0 then
			yaw = math.atan2(vec.z, vec.x)
		end
		obj:set_yaw(yaw + math.pi)
		obj:set_acceleration(acceleration(vec, entity.kfr, entity.mass))
		entity.owner = owner
		entity.owner_type = owner_type
		entity.launched = false
		entity.lastpos = pos
	end
	return true
end

local function calculate_damage(arrow)
	local v      = arrow.object:get_velocity()
	local v2     = v.x ^ 2 + v.y ^ 2 + v.z ^ 2

	local dc     = arrow.definition.damage_coefficient or 0.1
	local mass   = arrow.definition.mass or 0
	local damage = mass * v2 / 2 * dc
	--minetest.log("action", "damage = "..tostring(damage))
	return damage
end


-- hit different types of targets
local function hit_node(pos, arrow, callback, collision)
	local node = node_ok(pos).name
	if arrow.owner_type == "node" then
		if arrow.owner.x == math.floor(pos.x) and
		   arrow.owner.y == math.floor(pos.y) and
		   arrow.owner.z == math.floor(pos.z) then
			return false
		end
	end
	if minetest.registered_nodes[node].walkable then
		--minetest.log("Hitting "..tostring(node))
		if callback then
			callback(arrow, pos, node)
		end
		if arrow.drop == true then
			pos.y         = pos.y + 1
			arrow.lastpos = (arrow.lastpos or pos)
			minetest.add_item(collision, arrow.object:get_luaentity().name)
		end
		return true
	end
	return false
end

local function hit_player(player, arrow, callback, owner_id, collision)
	if callback then
		callback(arrow, player)
	end
	local s   = collision
	local p   = player:get_pos()
	local vec = { x = s.x - p.x, y = s.y - p.y, z = s.z - p.z }

	local puncher
	if arrow.owner_type == "player" or arrow.owner_type == "entity" then
		puncher = arrow.owner
	else
		puncher = arrow.object
	end
	player:punch(puncher, 1.0, {
		full_punch_interval = 1.0,
		damage_groups       = { fleshy = calculate_damage(arrow) },
	}, vec)

	return true
end

-- when arrow is punched
local function arrow_on_punch(arrow, puncher, time_from_last_punch, tool_capabilities, dir)
	if arrow.can_drop_on_punch and
		(arrow:can_drop_on_punch(puncher, time_from_last_punch, tool_capabilities, dir) == false)
	then
		return
	end
	local pos     = arrow.object:get_pos()
	pos.y         = pos.y + 1
	arrow.lastpos = (arrow.lastpos or pos)
	minetest.add_item(arrow.lastpos, arrow.object:get_luaentity().name)
	arrow.object:remove()
end

local function hit_mob(mob, arrow, callback, owner_id, collision)
	local entity = mob:get_luaentity() and mob:get_luaentity().name or ""

--	minetest.log("hit mob at "..collision.x.." "..collision.y.." "..collision.z)
	if entity ~= "__builtin:item"
		and entity ~= "__builtin:falling_node"
		and entity ~= "gauges:hp_bar"
		and entity ~= "signs:text"
		and entity ~= "itemframes:item" then

		--minetest.log("Hitting "..tostring(entity))
		if callback then
			callback(arrow, mob)
		end
		local s   = collision
		local p   = mob:get_pos()
		local vec = { x = s.x - p.x, y = s.y - p.y, z = s.z - p.z }

		local puncher
		if arrow.owner_type == "player" or arrow.owner_type == "entity" then
			puncher = arrow.owner
		else
			puncher = arrow.object
		end

		mob:punch(puncher, 1.0, {
			full_punch_interval = 1.0,
			damage_groups       = { fleshy = calculate_damage(arrow) },
		}, vec)

		return true
	end
	return false
end


local function find_collision(pos, dir, linelen, cbox)
--	minetest.log(cbox[1].." "..cbox[2].." "..cbox[3].." "..cbox[4].." "..cbox[5].." "..cbox[6])
	local x1 = cbox[1]
	local x2 = cbox[4]

	local y1 = cbox[2]
	local y2 = cbox[5]

	local z1 = cbox[3]
	local z2 = cbox[6]

	-- we are inside box
	if pos.x >= x1 and pos.x <= x2 and pos.y >= y1 and pos.y <= y2 and pos.z >= z1 and pos.z <= z2 then
		return 0
	end

	local ts = {}
	local t

	t = (x1 - pos.x)/dir.x
	if t >= 0 and t <= linelen then
		local p = {x=pos.x + dir.x*t, y=pos.y+dir.y*t, z=pos.z+dir.z*t}
		if p.y >= y1 and p.y <= y2 and p.z >= z1 and p.z <= z2 then
			table.insert(ts, t)
		end
	end
	t = (x2 - pos.x)/dir.x
	if t >= 0 and t <= linelen then
		local p = {x=pos.x + dir.x*t, y=pos.y+dir.y*t, z=pos.z+dir.z*t}
		if p.y >= y1 and p.y <= y2 and p.z >= z1 and p.z <= z2 then
			table.insert(ts, t)
		end
	end

	t = (y1 - pos.y)/dir.y
	if t >= 0 and t <= linelen then
		local p = {x=pos.x + dir.x*t, y=pos.y+dir.y*t, z=pos.z+dir.z*t}
		if p.x >= x1 and p.x <= x2 and p.z >= z1 and p.z <= z2 then
			table.insert(ts, t)
		end
	end
	t = (y2 - pos.y)/dir.y
	if t >= 0 and t <= linelen then
		local p = {x=pos.x + dir.x*t, y=pos.y+dir.y*t, z=pos.z+dir.z*t}
		if p.x >= x1 and p.x <= x2 and p.z >= z1 and p.z <= z2 then
			table.insert(ts, t)
		end
	end

	t = (z1 - pos.z)/dir.z
	if t >= 0 and t <= linelen then
		local p = {x=pos.x + dir.x*t, y=pos.y+dir.y*t, z=pos.z+dir.z*t}
		if p.x >= x1 and p.x <= x2 and p.y >= y1 and p.y <= y2 then
			table.insert(ts, t)
		end
	end
	t = (z2 - pos.z)/dir.z
	if t >= 0 and t <= linelen then
		local p = {x=pos.x + dir.x*t, y=pos.y+dir.y*t, z=pos.z+dir.z*t}
		if p.x >= x1 and p.x <= x2 and p.y >= y1 and p.y <= y2 then
			table.insert(ts, t)
		end
	end

	if table.getn(ts) == 0 then
		return nil
	end
--	minetest.log("found "..tostring(cbox))
	table.sort(ts)
	return ts[1]
end

local function hit_objects(pos1, pos2, arrow)
	local area = {
		x1=math.min(pos1.x, pos2.x),
		y1=math.min(pos1.y, pos2.y),
		z1=math.min(pos1.z, pos2.z),
		x2=math.max(pos1.x, pos2.x),
		y2=math.max(pos1.y, pos2.y),
		z2=math.max(pos1.z, pos2.z),
	}

	-- find collisions with entities and playes
	local entities = minetest.get_objects_inside_radius(pos1, HIT_RADIUS)
	local collisions = {}

	local dir = {x=pos2.x-pos1.x, y=pos2.y-pos1.y, z=pos2.z-pos1.z}
	local dl = math.sqrt(dir.x*dir.x + dir.y*dir.y + dir.z*dir.z)
	dir.x = dir.x / dl
	dir.y = dir.y / dl
	dir.z = dir.z / dl

	-- find collisions with nodes
	for x = math.floor(area.x1), math.floor(area.x2)+1 do
	for y = math.floor(area.y1), math.floor(area.y2)+1 do
	for z = math.floor(area.z1), math.floor(area.z2)+1 do
--		minetest.log("owner = "..arrow.owner.x.." "..arrow.owner.y.." "..arrow.owner.z)
--		minetest.log("current = "..x.." "..y.." "..z)
		local isowner = (arrow.owner_type == "node" and arrow.owner.x == x and arrow.owner.y == y and arrow.owner.z == z)
		if (not isowner) or arrow.launched then
			local node = minetest.get_node_or_nil({x=x,y=y,z=z})
			if node ~= nil and minetest.registered_nodes[node.name].walkable then
				local collision_box = {x-0.5, y-0.5, z-0.5, x+0.5, y+0.5, z+0.5}
				local d = find_collision(pos1, dir, dl, collision_box)
				if d ~= nil then
					table.insert(collisions, {d=d, obj={x=x,y=y,z=z}, objtype="node"})
				end
			end
		end
	end
	end
	end

	for _, player in pairs(entities) do
		local isowner = (player == arrow.owner)
		local isself = (player == arrow.object)
		if (not isself) and ((not isowner) or arrow.launched) then
			local ppos
			local collision_box
			local ptype
			if player:is_player() then
				collision_box = player:get_properties().collisionbox
				ppos = player:getpos()
				ptype = "player"
			else
				collision_box = player:get_luaentity().collisionbox
				ppos = player:getpos()
				ptype = "entity"
			end

			if collision_box ~= nil then
				local box = {}
--				minetest.log("cb "..tostring(collision_box[0]).." pos "..tostring(ppos.x))
				box[1] = collision_box[1] + ppos.x
				box[4] = collision_box[4] + ppos.x

				box[2] = collision_box[2] + ppos.y
				box[5] = collision_box[5] + ppos.y

				box[3] = collision_box[3] + ppos.z
				box[6] = collision_box[6] + ppos.z
				local d = find_collision(pos1, dir, dl, box)
				if d ~= nil then
					table.insert(collisions, {d=d, obj=player, objtype=ptype})
				end
			end
		end
	end


	-- check if collision present
	if table.getn(collisions) == 0 then
		return false
	end

	-- find nearest collisions
	local nearest = nil
	local mind = nil
	local collision_point
	for _, collision in pairs(collisions) do
		if mind == nil or mind > collision.d then
			nearest = collision
			mind = collision.d
			collision_point = {x=pos1.x+dir.x*mind, y=pos1.y+dir.y*mind, z=pos1.z+dir.z*mind}
		end
	end

	local hit
	-- hit nearest collision
	if nearest.objtype == "player" then
		-- hit player
		hit = hit_player(nearest.obj, arrow, arrow.hit_player, arrow.owner_id, collision_point)
	elseif nearest.objtype == "entity" then
		-- hit entity
		local hit_same_mob = true

		if DONT_PUNCH_SAME_MOBS and arrow.owner_type == "entity" then
			local target = nearest.obj:get_entity_name()
			local archer = arrow.owner:get_entity_name()
--			minetest.log("target = "..target.." archer "..archer)
			if target == archer then
				hit_same_mob = false
			end
		end

		if hit_same_mob then
			hit = hit_mob(nearest.obj, arrow, arrow.hit_mob, arrow.owner_id, collision_point)
		else
			hit = true
		end
	elseif nearest.objtype == "node" then
		-- hit node
		hit = hit_node(nearest.obj, arrow, arrow.hit_node, collision_point)
	else
		minetest.log("Invalid collision type")
		return false
	end

	return hit
end

local function inside_owner(arrow)
	local owner_type = arrow.owner_type
	local box = {}
	local collision_box
	if owner_type == "player" then
		collision_box = arrow.owner:get_properties().collisionbox
	elseif owner_type == "entity" then
		local entity = arrow.owner:get_luaentity()
		if entity == nil then
			minetest.log("entity is nil!")
			minetest.log("is_player = "..tostring(arrow.owner:is_player()))
			minetest.log(tostring(arrow.owner))
			return false
		end
		collision_box = entity.collisionbox
	elseif owner_type == "node" then
		box = {arrow.owner.x-0.5,arrow.owner.y-0.5,arrow.owner.z-0.5,arrow.owner.x+0.5,arrow.owner.y+0.5,arrow.owner.z+0.5}
	else
		return false
	end

	if box == nil then
		minetest.log("Collision box == nil")
		return false
	end

	if owner_type == "player" or owner_type == "entity" then
		local ppos = arrow.owner:getpos()
		box[1] = collision_box[1] + ppos.x
		box[4] = collision_box[4] + ppos.x

		box[2] = collision_box[2] + ppos.y
		box[5] = collision_box[5] + ppos.y

		box[3] = collision_box[3] + ppos.z
		box[6] = collision_box[6] + ppos.z
	end

	local pos = arrow.object:get_pos()

--	minetest.log("******************")
--	minetest.log(pos.x.." "..pos.y.." "..pos.z)
--	minetest.log(box[1].." "..box[2].." "..box[3].." "..box[4].." "..box[5].." "..box[6])

	if pos.x < box[1] or pos.x > box[4] then
		return false
	end

	if pos.y < box[2] or pos.y > box[5] then
		return false
	end

	if pos.z < box[3] or pos.z > box[6] then
		return false
	end

	return true
end

local function arrow_step(self, dtime)
	self.timer = self.timer + dtime

	local pos  = self.object:get_pos()
--	minetest.log("pos = "..pos.x.." "..pos.y.." "..pos.z)

	-- start arrow move
	if self.inited == false then
		self.inited = true
		self.object:set_velocity(self.launch_velocity)

		-- arrow sound
		-- TODO: should be on the all arrow path
		local fly_sound = self.definition.fly_sound
		if fly_sound and fly_sound.sound then
			minetest.sound_play(fly_sound.sound, {
				pos = pos,
				gain = 1.0,
				max_hear_distance = fly_sound.sound_distance or 5,
			})
		end
	end

	if self.switch == 0
		or self.timer > self.ttl
		or not within_limits(pos, 0) then
		self.object:remove(); -- print ("removed arrow")
		return
	end

	-- does arrow have a tail (fireball)
	if self.definition.tail
		and self.definition.tail == 1
		and self.definition.tail_texture then
		minetest.add_particle({
			pos                = pos,
			velocity           = { x = 0, y = 0, z = 0 },
			acceleration       = { x = 0, y = 0, z = 0 },
			expirationtime     = self.definition.expire or 0.25,
			collisiondetection = false,
			texture            = self.definition.tail_texture,
			size               = self.definition.tail_size or 5,
			glow               = self.definition.glow or 0,
		})
	end

	-- calculate movement
	local res = false
	local vel = self.object:get_velocity()

	-- check for nodes, mobs and players hit
	if  vel.x ~= 0 or vel.y ~= 0 or vel.z ~= 0  then
		local pos1 = self.lastpos
		local pos2 = pos
		res = hit_objects(pos1, pos2, self)
	end

	if res == true then
		-- if hit node - remove arrow entity
		self.object:remove();
	else
		-- if not hit - accelerate arrow with gravity and viscosity
		local k    = self.k
		local node = minetest.registered_nodes[minetest.get_node(pos).name]
		if node and node.liquid_viscosity then
			k = k * BASE_LIQUID_VISCOSITY * node.liquid_viscosity
		end
		local acc = acceleration(vel, k, self.definition.mass)
		self.object:set_acceleration(acc)
	end
	self.lastpos = pos

	if not inside_owner(self) then
		self.launched = true
	end
end


-- register arrow for shoot attack
function throwing:register_arrow(name, def)

	if not name or not def then return end -- errorcheck

	local dop = def.drop_on_punch
	if dop == nil then
		dop = def.drop
	end
	if dop == nil then
		dop = false
	end

	local k               = def.kfr and def.mass and def.mass > 0 and def.kfr / def.mass or 0

	throwing.arrows[name] = def
	minetest.register_entity(name, {
		definition                  = def,
		ttl                         = def.ttl or 150,
		physical                    = false,
		visual                      = def.visual,
		visual_size                 = def.visual_size,
		textures                    = def.textures,
		velocity                    = def.velocity,
		mass                        = def.mass or 0,
		k                           = k,
		hit_player                  = def.hit_player,
		hit_node                    = def.hit_node,
		hit_mob                     = def.hit_mob,
		drop                        = def.drop or false, -- drops arrow as registered item when true
		drop_on_punch               = dop, -- drops arrow as registered item when true
		can_drop_on_punch           = def.can_drop_on_punch,
		collisionbox                = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }, -- remove box around arrows
		timer                       = 0,
		switch                      = 0,
		owner_id                    = def.owner_id,
		rotate                      = def.rotate,
		automatic_face_movement_dir = def.rotate and (def.rotate - (math.pi / 180)) or false,

		on_step                     = def.on_step or arrow_step,
--		on_punch                    = dop and (def.on_punch or arrow_on_punch) or nil,
	})
end

