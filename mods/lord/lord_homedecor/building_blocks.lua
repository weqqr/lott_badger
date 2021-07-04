local SL = minetest.get_translator("lord_homedecor")

minetest.register_node("lord_homedecor:Adobe", {
	tiles = {"building_blocks_Adobe.png"},
	description = SL("Adobe"),
	is_ground_content = true,
	groups = {crumbly=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("lord_homedecor:Roofing", {
	tiles = {"building_blocks_Roofing.png"},
	is_ground_content = true,
	description = SL("Roof block"),
	groups = {snappy=3},
})
minetest.register_craft({
	output = 'lord_homedecor:terrycloth_towel 2',
	recipe = {
		{"farming:string", "farming:string", "farming:string"},
	}
})
minetest.register_craft({
	output = 'lord_homedecor:gravel_spread 4',
	recipe = {
		{"default:gravel", "default:gravel", "default:gravel"},
	}
})
minetest.register_craft({
	output = 'lord_homedecor:brobble_spread 4',
	recipe = {
		{"default:clay_brick", "default:cobble", "default:clay_brick"},
	}
})
minetest.register_craft({
	output = 'lord_homedecor:Fireplace 1',
	recipe = {
		{"default:steel_ingot", "lord_homedecor:sticks", "default:steel_ingot"},
	}
})
minetest.register_craft({
	output = 'lord_homedecor:Adobe 3',
	recipe = {
		{"default:sand"},
		{"default:clay"},
		{"group:stick"},
	}
})

minetest.register_craft({
	output = 'lord_homedecor:Roofing 10',
	recipe = {
		{"lord_homedecor:Adobe", "lord_homedecor:Adobe"},
		{"lord_homedecor:Adobe", "lord_homedecor:Adobe"},
	}
})
minetest.register_craft({
	output = 'lord_homedecor:BWtile 10',
	recipe = {
		{"lottores:marble", "default:obsidian"},
		{"default:obsidian", "lottores:marble"},
	}
})
minetest.register_craft({
	output = 'lord_homedecor:grate 1',
	recipe = {
		{"default:steel_ingot", "default:steel_ingot"},
		{"default:glass", "default:glass"},
	}
})
minetest.register_craft({
	output = 'lord_homedecor:woodglass 1',
	recipe = {
		{"default:wood"},
		{"default:glass"},
	}
})
minetest.register_craft({
	output = 'lord_homedecor:hardwood 2',
	recipe = {
		{"default:wood", "default:junglewood"},
		{"default:junglewood", "default:wood"},
	}
})

minetest.register_craft({
	output = 'lord_homedecor:hardwood 2',
	recipe = {
		{"default:junglewood", "default:wood"},
		{"default:wood", "default:junglewood"},
	}
})

-- если есть lottblocks
if minetest.get_modpath("lottblocks") then
	minetest.register_craft({
		output = 'lord_homedecor:sticks 2',
		recipe = {
			{'group:stick', ''           , 'group:stick'},
			{'group:stick', 'group:stick', 'group:stick'},
			{'group:stick', 'group:stick', 'group:stick'},
		}
	})
else
	minetest.register_craft({
		output = 'lord_homedecor:sticks',
		recipe = {
			{'group:stick', 'group:stick'},
			{'group:stick', 'group:stick'},
		}
	})
end

minetest.register_craft({
	output = 'default:stick 4',
	recipe = {
		{'lord_homedecor:sticks'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "lord_homedecor:smoothglass",
	recipe = "default:glass"
})

minetest.register_node("lord_homedecor:smoothglass", {
	drawtype = "glasslike",
	description = SL("Streak Free Glass"),
	tiles = {"building_blocks_sglass.png"},
	inventory_image = minetest.inventorycube("building_blocks_sglass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {snappy=3,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lord_homedecor:grate", {
	drawtype = "glasslike",
	description = SL("Grate"),
	tiles = {"building_blocks_grate.png"},
	inventory_image = minetest.inventorycube("building_blocks_grate.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {cracky=1},
})

minetest.register_node("lord_homedecor:Fireplace", {
	description = SL("Fireplace"),
	tiles = {
		"building_blocks_cast_iron.png",
		"building_blocks_cast_iron.png",
		"building_blocks_cast_iron.png",
		"building_blocks_cast_iron_fireplace.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = default.LIGHT_MAX,
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {cracky=2},
})

minetest.register_node("lord_homedecor:woodglass", {
	drawtype = "glasslike",
	description = SL("Wood Framed Glass"),
	tiles = {"building_blocks_wglass.png"},
	inventory_image = minetest.inventorycube("building_blocks_wglass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {snappy=3,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})
minetest.register_node("lord_homedecor:terrycloth_towel", {
	drawtype = "raillike",
	description = SL("Terrycloth towel"),
	tiles = {"building_blocks_towel.png"},
	inventory_image = "building_blocks_towel_inv.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
                -- but how to specify the dimensions for curved and sideways rails?
                fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {crumbly=3},
})
--********************************************************
-- Canopy - Навес
--
minetest.register_node("lord_homedecor:canopy", {
	drawtype = "raillike",
	description = SL("Canopy"),
	tiles = {"building_blocks_canopy.png"},
	inventory_image = "building_blocks_canopy_inv.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
                -- but how to specify the dimensions for curved and sideways rails?
                fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {crumbly=3},
})
minetest.register_craft({
	output = 'lord_homedecor:canopy 2',
	recipe = {
		{"wool:red", "wool:white", "wool:red"},
	}
})

--********************************************************
-- Chess board tiling
--
minetest.register_node("lord_homedecor:BWtile", {
	drawtype = "raillike",
	description = SL("Chess board tiling"),
	tiles = {"building_blocks_BWtile.png"},
	inventory_image = "building_blocks_bwtile_inv.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
                -- but how to specify the dimensions for curved and sideways rails?
                fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {crumbly=3},
})
minetest.register_node("lord_homedecor:brobble_spread", {
	drawtype = "raillike",
	description = SL("Brobble Spread"),
	tiles = {"building_blocks_brobble.png"},
	inventory_image = "building_blocks_brobble_spread_inv.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
                -- but how to specify the dimensions for curved and sideways rails?
                fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {crumbly=3},
})
minetest.register_node("lord_homedecor:gravel_spread", {
	drawtype = "raillike",
	description = SL("Gravel Spread"),
	tiles = {"default_gravel.png"},
	inventory_image = "building_blocks_gravel_spread_inv.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
                -- but how to specify the dimensions for curved and sideways rails?
                fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {crumbly=2},
	sounds = default.node_sound_gravel_defaults(),
})
minetest.register_node("lord_homedecor:hardwood", {
	tiles = {"building_blocks_hardwood.png"},
	is_ground_content = true,
	description = SL("Hardwood"),
	groups = {choppy=1,flammable=1},
	sounds = default.node_sound_wood_defaults(),
})

-- Register scaffolding nodes and crafts
local texture_plank = "default_wood.png"
local texture_top = texture_plank.."^scaffolding_wooden_top.png"
local texture_side = "scaffolding_wooden_side.png"
local texture_bottom = texture_top.."^scaffolding_wooden_bottom.png"

minetest.register_node("lord_homedecor:scaffolding", {
	description = SL("Scaffolding"),
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			-- side crosses
			{-0.5, -0.5, -0.5, -0.45, 0.5, 0.5},
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.45},
			{0.45, -0.5, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, 0.45, 0.5, 0.5, 0.5},
			-- top plank
			{-0.5, 0.4, -0.5, 0.5, 0.5, 0.5},
		},
	},
	tiles = {texture_top, texture_bottom, texture_side, texture_side, texture_side, texture_side},
	drop = "lord_homedecor:scaffolding",
	paramtype = "light",
	sunlight_propagates = false,
	groups = {dig_immediate=3, material=1, dropping_node = 1, scaffolding=1},
	sounds = default.node_sound_wood_defaults(),
	climbable = true,
	walkable = false

})


minetest.register_craft({
	output = "lord_homedecor:scaffolding 3",
	recipe = {
		{"group:wood","group:wood","group:wood"},
		{"","group:stick",""},
		{"group:stick","","group:stick"}
	}
})


stairs.register_stair_and_slab("hardwood", "lord_homedecor:hardwood",
		{choppy=1,flammable=1},
		{"building_blocks_hardwood.png"},
		SL("Hardwood stair"),
		SL("Hardwood slab"),
		default.node_sound_wood_defaults())
stairs.register_stair_and_slab("grate", "lord_homedecor:grate",
		{cracky=1},
		{"building_blocks_grate.png"},
		SL("Grate stair"),
		SL("Grate slab"),
		default.node_sound_leaves_defaults())
stairs.register_stair_and_slab("adobe", "lord_homedecor:Adobe",
		{cracky=3},
		{"building_blocks_Adobe.png"},
		SL("Adobe stair"),
		SL("Adobe slab"),
		default.node_sound_stone_defaults())
stairs.register_stair_and_slab("roofing", "lord_homedecor:Roofing",
		{cracky=3},
		{"building_blocks_Roofing.png"},
		SL("Roofing stair"),
		SL("Roofing slab"),
		default.node_sound_stone_defaults())


minetest.register_craft({
	type = "fuel",
	recipe = "lord_homedecor:hardwood",
	burntime = 28,
})


minetest.register_craftitem("lord_homedecor:sticks", {
	description = SL("Small bundle of sticks"),
	image = "building_blocks_sticks.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_alias("fakegrass", "lord_homedecor:fakegrass")
minetest.register_alias("adobe", "lord_homedecor:Adobe")
minetest.register_alias("building_blocks_roofing", "lord_homedecor:Roofing")
minetest.register_alias("hardwood", "lord_homedecor:hardwood")
minetest.register_alias("sticks", "lord_homedecor:sticks")
minetest.register_alias("lord_homedecor:faggot", "lord_homedecor:sticks")

minetest.register_craft({
	type = "fuel",
	recipe = "lord_homedecor:sticks",
	burntime = 5,
})
