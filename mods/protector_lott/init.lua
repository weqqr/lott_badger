local SL = rawget(_G, "intllib") and intllib.Getter() or function(s) return s end

minetest.register_privilege("delprotect", SL("Ignore player protection"))

prot = {}

prot.gui_bg = "bgcolor[#080808BB;true]"
prot.gui_bg_img = "background[5,5;1,1;gui_formbg.png;true]"
prot.gui_slots = "listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"

function prot.get_hotbar_bg(x,y)
	local out = ""
	for i=0,7,1 do
		out = out .."image["..x+i..","..y..";1,1;gui_hb_bg.png]"
	end
	return out
end

-- get static spawn position
local statspawn = (minetest.setting_get_pos("static_spawnpoint") or {x = 0, y = 2, z = 0})

protector = {}
protector.mod = "redo"
protector.radius = (tonumber(minetest.setting_get("protector_radius")) or 5)
protector.pvp = minetest.setting_getbool("protector_pvp")
protector.spawn = (tonumber(minetest.setting_get("protector_pvp_spawn")) or 0)
protector.damage = (tonumber(minetest.setting_get("protector_damage")) or 1)

protector.get_member_list = function(meta)
	return meta:get_string("members"):split(" ")
end

protector.set_member_list = function(meta, list)
	meta:set_string("members", table.concat(list, " "))
end

protector.is_member = function (meta, name)
	for _, n in ipairs(protector.get_member_list(meta)) do
		if n == name then
			return true
		end
	end
	return false
end

protector.add_member = function(meta, name)
	if protector.is_member(meta, name) then return end
	local list = protector.get_member_list(meta)
	table.insert(list, name)
	protector.set_member_list(meta,list)
end

protector.del_member = function(meta, name)
	local list = protector.get_member_list(meta)
	for i, n in ipairs(list) do
		if n == name then
			table.remove(list, i)
			break
		end
	end
	protector.set_member_list(meta, list)
end

-- Protector Interface

protector.generate_formspec = function(meta)

	local formspec = "size[8,7]"
		..prot.gui_bg..prot.gui_bg_img..prot.gui_slots
		.."label[0,1;"..SL("PUNCH node to show protected area or USE for area check").."]"
		.."label[0,2;"..SL("Members: (type player name then press Enter to add)").."]"

	local members = protector.get_member_list(meta)
	local npp = 12
	local i = 0
	for _, member in ipairs(members) do
			if i < npp then
				formspec = formspec .. "button[" .. (i % 4 * 2)
				.. "," .. math.floor(i / 4 + 3)
				.. ";1.5,.5;protector_member;" .. member .. "]"
				.. "button[" .. (i % 4 * 2 + 1.25) .. ","
				.. math.floor(i / 4 + 3)
				.. ";.75,.5;protector_del_member_" .. member .. ";X]"
			end
			i = i + 1
	end

	if i < npp then
		formspec = formspec .. "field[" .. (i % 4 * 2 + 1 / 3) .. ","
		.. (math.floor(i / 4 + 3) + 1 / 3) .. ";1.433,.5;protector_add_member;;]"
	end

	formspec = formspec .. "button_exit[2.5,6.2;3,0.5;close_me;"..SL("Close").."]"

	return formspec
end

-- ACTUAL PROTECTION SECTION

-- Infolevel:
-- 0 for no info
-- 1 for "This area is owned by <owner> !" if you can't dig
-- 2 for "This area is owned by <owner>.
-- 3 for checking protector overlaps

protector.can_dig = function(r, pos, digger, onlyowner, infolevel)

	--print("function protector.can_dig")
	--print("digger="..tostring(digger))
	if not digger then 
		--print("не указан digger")
		return false 
	end
	
	-- Find the protector nodes
	local positions = minetest.find_nodes_in_area(
		{x = pos.x - r, y = pos.y - r, z = pos.z - r},
		{x = pos.x + r, y = pos.y + r, z = pos.z + r},
		{"group:protector"})
	
	-- специально для мобов 
	-- можно спавнится и копать только если нет протектов(проверка на areas в основной функции будет далее)	
	if digger == "" then 	
		if #positions < 1 then
			--print("мобам можно спавнится или копать")
			return true
		else
			--print("мобам нельзя спавнится или копать")
			return false
		end
	end	
	
	if not minetest.get_player_by_name(digger) then 
		--print("невозможно идентифицировать игрока")
		return false 
	end

	-- Delprotect privileged users can override protections

	if minetest.check_player_privs(digger, {delprotect = true}) and infolevel == 1 then
		return true
	end

	if minetest.registered_nodes[minetest.get_node(pos).name].groups["corpse"] then
		return true
	end

	if infolevel == 3 then infolevel = 1 end


	local dig_player = minetest.get_player_by_name(digger)
	local meta, owner, members
	for _, p in ipairs(positions) do
		meta = minetest.get_meta(p)
		owner = meta:get_string("owner")
		members = meta:get_string("members")

		if owner ~= digger then
			if onlyowner or not protector.is_member(meta, digger) then
				if infolevel == 1 then
					minetest.get_player_by_name(digger):set_hp(dig_player:get_hp()-protector.damage)
					minetest.chat_send_player(digger,
					SL("This area is owned by").." " .. owner .. "!")
				elseif infolevel == 2 then
					minetest.chat_send_player(digger,
					SL("This area is owned by").." " .. owner .. ".")
					minetest.chat_send_player(digger,
					SL("Protection located at:").." " .. minetest.pos_to_string(p))
					if members ~= "" then
						minetest.chat_send_player(digger,
						SL("Members:").." ".. members .. ".")
					end
				end
				return false
			end
		end

		if infolevel == 2 then
			minetest.chat_send_player(digger,
			SL("This area is owned by").." " .. owner .. ".")
			minetest.chat_send_player(digger,
			SL("Protection located at:").." " .. minetest.pos_to_string(positions[1]))
			if members ~= "" then
				minetest.chat_send_player(digger,
				SL("Members:").." ".. members .. ".")
			end
			break
		end

	end

	if infolevel == 2 then
		if #positions < 1 then
			minetest.chat_send_player(digger,
			SL("This area is not protected."))
		end
		minetest.chat_send_player(digger, SL("You can build here."))
	end

	return true
end

-- Can node be added or removed, if so return node else true (for protected)

function protector.drop_wielded_item(digger)
	local player = minetest.get_player_by_name(digger)

	-- Stop random crashes
	if player == nil then
		return
	end

	local itemstack = player:get_wielded_item()
	minetest.item_drop(itemstack, player, player:getpos()) -- Drop entire itemstack
	player:set_wielded_item("") -- Remove itemstack from inventory
end

protector.old_is_protected = minetest.is_protected

function minetest.is_protected(pos, digger)

	if not protector.can_dig(protector.radius, pos, digger, false, 1) then
-- hurt here
--player = minetest.get_player_by_name(digger)
--player:set_hp(player:get_hp()-2)

		-- The hack explained:
		-- 1. Player places the node
		-- 2. Server returns the node to player's inventory
		-- 3. Some time (like 0.1s, nobody will feel this lag) passes and we
		--    drop the item
		-- 4. ???
		-- 5. PROFIT
		minetest.after(0.1, protector.drop_wielded_item, digger)
		return true
	end
	return protector.old_is_protected(pos, digger)

end

-- Make sure protection block doesn't overlap another protector's area

protector.old_node_place = minetest.item_place

function minetest.item_place(itemstack, placer, pointed_thing)

	local item_name = minetest.registered_items[itemstack:get_name()]
	if item_name then
	    if item_name.groups.protector then
		local user = placer:get_player_name()
		local pos = pointed_thing.under
		if not protector.can_dig(protector.radius * 2, pos, user, true, 3) then
			minetest.chat_send_player(user,
			SL("Overlaps into another protected area!"))
			return protector.old_node_place(itemstack, placer, pos)
		end
	    end
	end

	return protector.old_node_place(itemstack, placer, pointed_thing)
end

-- END

--= Protection Logo

minetest.register_node("protector_lott:protect2", {
	description = SL("Protection Logo"),
	tiles = {"protector_logo.png"},
	wield_image = "protector_logo.png",
	inventory_image = "protector_logo.png",
	sounds = default.node_sound_stone_defaults(),
	groups = {dig_immediate = 2, unbreakable = 1, protector = 1},
	paramtype = 'light',
	paramtype2 = "wallmounted",
	light_source = 2,
	drawtype = "nodebox",
	sunlight_propagates = true,
	walkable = true,
	node_box = {
		type = "wallmounted",
		wall_top    = {-0.375, 0.4375, -0.5, 0.375, 0.5, 0.5},
		wall_bottom = {-0.375, -0.5, -0.5, 0.375, -0.4375, 0.5},
		wall_side   = {-0.5, -0.5, -0.375, -0.4375, 0.5, 0.375},
	},
	selection_box = {type = "wallmounted"},

	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", SL("Protection").." ("..SL("owned by").." " .. meta:get_string("owner") .. ")")
		meta:set_string("members", "")
	end,

	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type ~= "node" then return end
		protector.can_dig(protector.radius, pointed_thing.under, user:get_player_name(), false, 2)
	end,

	on_rightclick = function(pos, node, clicker, itemstack)
		local meta = minetest.get_meta(pos)
		if protector.can_dig(1, pos, clicker:get_player_name(), true, 1) then
			minetest.show_formspec(clicker:get_player_name(),
			"protector_lott:node_" .. minetest.pos_to_string(pos), protector.generate_formspec(meta))
		end
	end,

	on_punch = function(pos, node, puncher)
		if not protector.can_dig(1, pos, puncher:get_player_name(), true, 1) then
			return
		end
		minetest.add_entity(pos, "protector_lott:display")
	end,

	can_dig = function(pos, player)
		return protector.can_dig(1, pos, player:get_player_name(), true, 1)
	end,
})

minetest.register_craft({
	output = "protector_lott:protect2 4",
	recipe = {
		{"default:stone", "default:stone", "default:stone"},
		{"default:stone", "default:copper_ingot", "default:stone"},
		{"default:stone", "default:stone", "default:stone"},
	}
})

-- If name entered or button press
minetest.register_on_player_receive_fields(function(player,formname,fields)

	if string.sub(formname, 0, string.len("protector_lott:node_")) == "protector_lott:node_" then

		local pos_s = string.sub(formname, string.len("protector_lott:node_") + 1)
		local pos = minetest.string_to_pos(pos_s)
		local meta = minetest.get_meta(pos)

		if not protector.can_dig(1, pos, player:get_player_name(), true, 1) then
			return
		end

		if fields.protector_add_member then
			for _, i in ipairs(fields.protector_add_member:split(" ")) do
				protector.add_member(meta, i)
			end
		end

		for field, value in pairs(fields) do
			if string.sub(field, 0, string.len("protector_del_member_")) == "protector_del_member_" then
				protector.del_member(meta, string.sub(field,string.len("protector_del_member_") + 1))
			end
		end

		if not fields.close_me then
			minetest.show_formspec(player:get_player_name(), formname, protector.generate_formspec(meta))
		end

	end

end)

minetest.register_entity("protector_lott:display", {
	physical = false,
	collisionbox = {0, 0, 0, 0, 0, 0},
	visual = "wielditem",
	-- wielditem seems to be scaled to 1.5 times original node size
	visual_size = {x = 1.0 / 1.5, y = 1.0 / 1.5},
	textures = {"protector_lott:display_node"},
	on_activate = function(self, staticdata)
		if mobs and mobs.entity == false then self.object:remove() end
	end,
	on_step = function(self, dtime)
		self.timer = (self.timer or 0) + dtime
		if self.timer > 10 then
			self.object:remove()
		end
	end,
})

-- Display-zone node, Do NOT place the display as a node,
-- it is made to be used as an entity (see above)
local x = protector.radius
minetest.register_node("protector_lott:display_node", {
	tiles = {"protector_display.png"},
	use_texture_alpha = true,
	walkable = false,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			-- sides
			{-(x+.55), -(x+.55), -(x+.55), -(x+.45), (x+.55), (x+.55)},
			{-(x+.55), -(x+.55), (x+.45), (x+.55), (x+.55), (x+.55)},
			{(x+.45), -(x+.55), -(x+.55), (x+.55), (x+.55), (x+.55)},
			{-(x+.55), -(x+.55), -(x+.55), (x+.55), (x+.55), -(x+.45)},
			-- top
			{-(x+.55), (x+.45), -(x+.55), (x+.55), (x+.55), (x+.55)},
			-- bottom
			{-(x+.55), -(x+.55), -(x+.55), (x+.55), -(x+.45), (x+.55)},
			-- middle (surround protector)
			{-.55,-.55,-.55, .55,.55,.55},
		},
	},
	selection_box = {
		type = "regular",
	},
	paramtype = "light",
	groups = {dig_immediate = 3, not_in_creative_inventory = 1},
	drop = "",
})

-- Disable PVP in your own protected areas
if minetest.setting_getbool("enable_pvp") and protector.pvp then

	if minetest.register_on_punchplayer then

		minetest.register_on_punchplayer(
		function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)

			if not player or not hitter then
				print("[Protector] on_punchplayer called with nil objects")
			end

			if not hitter:is_player() then
				return false
			end

			-- no pvp at spawn area
			local pos = player:getpos()
			if pos.x < statspawn.x + protector.spawn
			and pos.x > statspawn.x - protector.spawn
			and pos.y < statspawn.y + protector.spawn
			and pos.y > statspawn.y - protector.spawn
			and pos.z < statspawn.z + protector.spawn
			and pos.z > statspawn.z - protector.spawn then
				return true
			end

			if minetest.is_protected(pos, hitter:get_player_name()) then
				return true
			else
				return false
			end

		end)
	else
		print("[Protector] pvp_protect not active, update your version of Minetest")

	end
else
	print("[Protector] pvp_protect is disabled")
end

dofile(minetest.get_modpath(minetest.get_current_modname()).."/".."blocks.lua")
dofile(minetest.get_modpath(minetest.get_current_modname()).."/".."doors.lua")
dofile(minetest.get_modpath(minetest.get_current_modname()).."/".."chests.lua")

if minetest.setting_getbool("msg_loading_mods") then minetest.log("action", minetest.get_current_modname().." mod LOADED") end
