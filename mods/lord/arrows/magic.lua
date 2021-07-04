-- Mob Attacks

local SL = minetest.get_translator("arrows")

local flame_node = function(pos)
	local n = minetest.get_node(pos).name
	local fbd = minetest.registered_nodes[n].groups.forbidden
	if fbd == nil then
		if minetest.registered_nodes[n].groups.flammable or math.random(1, 100) <= 30 then
			minetest.set_node(pos, { name = "fire:basic_flame" })
		else
			minetest.remove_node(pos)
		end
	end
end

local flame_area = function(p1, p2)
	for y = p1.y, p2.y do
		for z = p1.z, p2.z do
			minetest.punch_node({ x = p1.x - 1, y = y, z = z })
			minetest.punch_node({ x = p2.x + 1, y = y, z = z })
		end
	end

	for x = p1.x, p2.x do
		for z = p1.z, p2.z do
			minetest.punch_node({ x = x, y = p1.y - 1, z = z })
			minetest.punch_node({ x = x, y = p2.y + 1, z = z })
		end
	end

	for x = p1.x, p2.x do
		for y = p1.y, p2.y do
			minetest.punch_node({ x = x, y = y, z = p1.z - 1 })
			minetest.punch_node({ x = x, y = y, z = p2.z + 1 })
		end
	end

	for x = p1.x, p2.x do
		for y = p1.y, p2.y do
			for z = p1.z, p2.z do
				flame_node({ x = x, y = y, z = z })
			end
		end
	end
end

throwing:register_arrow("arrows:darkball", {
	visual            = "sprite",
	visual_size       = { x = 1, y = 1 },
	textures          = { "lottmobs_darkball.png" },
	velocity          = 5,
	arrow_type        = "magic",
	drop_on_punch     = true,
	hit_player        = function(self, player)
		local s   = self.object:getpos()
		local p   = player:getpos()
		local vec = { x = s.x - p.x, y = s.y - p.y, z = s.z - p.z }
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups       = { fleshy = 4 },
		}, vec)
		local pos = self.object:getpos()
		local p1  = { x = pos.x - 1, y = pos.y - 1, z = pos.z - 1 }
		local p2  = { x = pos.x + 1, y = pos.y + 1, z = pos.z + 1 }
		flame_area(p1, p2)
	end,
	hit_mob           = function(self, mob)
		local s   = self.object:getpos()
		local p   = mob:getpos()
		local vec = { x = s.x - p.x, y = s.y - p.y, z = s.z - p.z }
		mob:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups       = { fleshy = 4 },
		}, vec)
		local pos = self.object:getpos()
		local p1  = { x = pos.x - 1, y = pos.y - 1, z = pos.z - 1 }
		local p2  = { x = pos.x + 1, y = pos.y + 1, z = pos.z + 1 }
		flame_area(p1, p2)
	end,
	hit_node          = function(self, pos, node)
		local p1 = { x = pos.x - 1, y = pos.y - 2, z = pos.z - 1 }
		local p2 = { x = pos.x + 1, y = pos.y + 1, z = pos.z + 1 }
		flame_area(p1, p2)
	end,
	can_drop_on_punch = function(self, puncher, time_from_last_punch, tool_capabilities, dir)
		return false
	end,
})

minetest.register_craftitem("arrows:darkball", {
	description     = SL("Darkball"),
	inventory_image = "lottmobs_darkball.png",
})

minetest.register_craft({
	type     = "fuel",
	recipe   = "arrows:darkball",
	burntime = 20,
})

-- fireball (weapon)
throwing:register_arrow("arrows:fireball", {
	visual            = "sprite",
	visual_size       = { x = 1, y = 1 },
	textures          = { "mobs_fireball.png" },
	drop_on_punch     = true,
	velocity          = 18,
	arrow_type        = "magic",
	tail              = 1,
	tail_texture      = "mobs_fireball.png",
	tail_size         = 10,
	glow              = 5,
	expire            = 0.1,

	hit_player        = function(self, player)
		local s   = self.object:getpos()
		local p   = player:getpos()
		local vec = { x = s.x - p.x, y = s.y - p.y, z = s.z - p.z }
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups       = { fleshy = 4 },
		}, vec)
		local pos = self.object:getpos()
		local p1  = { x = pos.x - 1, y = pos.y - 1, z = pos.z - 1 }
		local p2  = { x = pos.x + 1, y = pos.y + 1, z = pos.z + 1 }
		flame_area(p1, p2)
	end,

	hit_mob           = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups       = { fleshy = 8 },
		}, nil)
	end,

	hit_node          = function(self, pos, node)
		local p1 = { x = pos.x - 1, y = pos.y - 2, z = pos.z - 1 }
		local p2 = { x = pos.x + 1, y = pos.y + 1, z = pos.z + 1 }
		flame_area(p1, p2)
	end,
	can_drop_on_punch = function(self, puncher, time_from_last_punch, tool_capabilities, dir)
		return false
	end,
})

minetest.register_craftitem("arrows:fireball", {
	description     = "Fireball",
	inventory_image = "mobs_fireball.png",
})

minetest.register_craft({
	type     = "fuel",
	recipe   = "arrows:fireball",
	burntime = 40,
})

