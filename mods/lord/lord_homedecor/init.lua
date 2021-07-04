-- Minetest 0.4 mod: lord_homedecor
-- See README.txt for licensing and other information.

local SL = minetest.get_translator("lord_homedecor")
local modpath = minetest.get_modpath("lord_homedecor")

-- Definitions made by this mod that other mods can use too
lord_homedecor = {}

lord_homedecor = {
	modpath = modpath,

	-- infinite stacks
	expect_infinite_stacks = default.creative and not minetest.get_modpath("unified_inventory")
}


lrfurn = {}
screwdriver = screwdriver or {}

lrfurn.fdir_to_fwd = {
	{  0,  1 },
	{  1,  0 },
	{  0, -1 },
	{ -1,  0 },
}

lrfurn.colors = { -- mod changed to use colorize feature of minetest engine (cg72)
	{ "black",       "#000000:230" },
	{ "brown",       "#251005:225" },
	{ "blue",        "#0000d0:225" },
	{ "cyan",        "#009fa7:250" },
	{ "dark_grey",   "#101010:175" },
	{ "dark_green",  "#007000:230" },
	{ "green",       "#00d000:250" },
	{ "grey",        "#101010:100" },
	{ "magenta",     "#e0048b:250" },
	{ "orange",      "#ff6600:240" },
	{ "pink",        "#ff90b0:250" },
	{ "red",         "#800000:240" },
	{ "violet",      "#9000d0:250" },
	{ "white",       "#000000:000" },
	{ "yellow",      "#dde000:240" }
}

function lrfurn.check_forward(pos, fdir, long, placer)
	if not fdir or fdir > 3 then fdir = 0 end

	local pos2 = { x = pos.x + lrfurn.fdir_to_fwd[fdir+1][1],     y=pos.y, z = pos.z + lrfurn.fdir_to_fwd[fdir+1][2]     }
	local pos3 = { x = pos.x + lrfurn.fdir_to_fwd[fdir+1][1] * 2, y=pos.y, z = pos.z + lrfurn.fdir_to_fwd[fdir+1][2] * 2 }

	local node2 = minetest.get_node(pos2)
	if node2 and node2.name ~= "air" then
		return false
	elseif minetest.is_protected(pos2, placer:get_player_name()) then
		if not long then
			minetest.chat_send_player(
				placer:get_player_name(),
				SL("Someone else owns the spot where other end goes!")
			)
		else
			minetest.chat_send_player(
				placer:get_player_name(),
				SL("Someone else owns the spot where the middle or far end goes!")
			)
		end
		return false
	end

	if long then
		local node3 = minetest.get_node(pos3)
		if node3 and node3.name ~= "air" then
			return false
		elseif minetest.is_protected(pos3, placer:get_player_name()) then
			minetest.chat_send_player(placer:get_player_name(), SL("Someone else owns the spot where the other end goes!"))
			return false
		end
	end

	return true
end

function lord_homedecor.find_ceiling(itemstack, placer, pointed_thing)
	-- most of this is copied from the rotate-and-place function in builtin
	local unode = core.get_node_or_nil(pointed_thing.under)
	if not unode then
		return
	end
	local undef = core.registered_nodes[unode.name]
	if undef and undef.on_rightclick then
		undef.on_rightclick(pointed_thing.under, unode, placer,
				itemstack, pointed_thing)
		return
	end

	local above = pointed_thing.above
	local under = pointed_thing.under
	local iswall = (above.y == under.y)
	local isceiling = not iswall and (above.y < under.y)
	local anode = core.get_node_or_nil(above)
	if not anode then
		return
	end
	local pos = pointed_thing.above
	local node = anode

	if undef and undef.buildable_to then
		pos = pointed_thing.under
		node = unode
	end

	if core.is_protected(pos, placer:get_player_name()) then
		core.record_protection_violation(pos,
				placer:get_player_name())
		return
	end

	local ndef = core.registered_nodes[node.name]
	if not ndef or not ndef.buildable_to then
		return
	end
	return isceiling, pos
end

-- Load files
dofile(minetest.get_modpath("lord_homedecor").."/building_blocks.lua")

-- load different handler subsystems
dofile(modpath.."/handlers/init.lua")

dofile(modpath.."/longsofas.lua")
dofile(modpath.."/sofas.lua")
dofile(modpath.."/armchairs.lua")
dofile(modpath.."/coffeetable.lua")
dofile(modpath.."/endtable.lua")
dofile(modpath.."/exterior.lua")
--dofile(modpath.."/roofing.lua")
dofile(modpath.."/furniture_medieval.lua")
dofile(modpath.."/furniture_recipes.lua")
dofile(modpath.."/shutters.lua")
dofile(modpath.."/lighting.lua")
dofile(modpath.."/misc-nodes.lua")
dofile(modpath.."/window_treatments.lua")
dofile(modpath.."/crafts.lua")
dofile(modpath.."/roofing.lua")


lord.mod_loaded()
