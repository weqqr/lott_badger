local SL = minetest.get_translator("lottores")

minetest.register_node("lottores:limestone_ore", {
	description = SL("Limestone Ore"),
	tiles = {"default_stone.png^lottores_limestone_ore.png"},
	is_ground_content = true,
	groups = {cracky=3},
	drop = 'lottores:limestone_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:rough_rock", {
	description = SL("Rough Rock"),
	tiles = {"default_stone.png^lottores_rough_rock.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = 'lottores:rough_rock_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:silver_ore", {
	description = SL("Silver Ore"),
	tiles = {"default_stone.png^lottores_silver_ore.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = 'lottores:silver_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:tin_ore", {
	description = SL("Tin Ore"),
	tiles = {"default_stone.png^lottores_tin_ore.png"},
	is_ground_content = true,
	groups = {cracky=3},
	drop = "lottores:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:lead_ore", {
	description = SL("Lead Ore"),
	tiles = {"default_stone.png^lottores_lead_ore.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = "lottores:lead_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:mithril_ore", {
	description = SL("Mithril Ore"),
	tiles = {"default_stone.png^lottores_mithril_ore.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = "lottores:mithril_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:blue_gem_ore", {
	description = SL("Blue Gem Ore"),
	tiles = {"default_stone.png^lottores_bluegem_ore.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = {
		items = {
			{
				items = {'lottores:blue_gem'},
				rarity = 5,
			},
			{
				items = {''},
			}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:white_gem_ore", {
	description = SL("White Gem Ore"),
	tiles = {"default_stone.png^lottores_whitegem_ore.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = {
		items = {
			{
				items = {'lottores:white_gem'},
				rarity = 5,
			},
			{
				items = {''},
			}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:red_gem_ore", {
	description = SL("Red Gem Ore"),
	tiles = {"default_stone.png^lottores_redgem_ore.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = {
		items = {
			{
				items = {'lottores:red_gem'},
				rarity = 5,
			},
			{
				items = {''},
			}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:tilkal", {
	description = SL("Tilkal"),
	tiles = {"lottores_tilkal.png"},
	sounds = default.node_sound_metal_defaults(),
	groups = {forbidden=1},
})

minetest.register_node("lottores:limestone", {
	description = SL("Limestone"),
	tiles = {"lottores_limestone_ore.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:marble", {
	description = SL("Marble"),
	tiles = {"lottores_marble.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:geodes_crystal_1", {
	description = SL("Geodes Crystal"),
	drawtype = "nodebox",
	tiles = {"lottores_geodes_crystal.png"},
     paramtype = "light",
	sunlight_propagates = true,
     light_source = 8,
     alpha = 200,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
     node_box = {
        type = "fixed",
        fixed = {
            {-0.1875,-0.5,-0.125,0.1875,0.3125,0.1875},
            {0.0625,-0.5,-0.25,0.3125,0,0},
            {0.0625,-0.5,0.1875,0.25,0.1875,0.375},
            {-0.3125,-0.5,-0.3125,-0.0625,0.0625,0},
            {-0.375,-0.5,0.0625,-0.125,-0.0625,0.3125},
        }
    },
     on_place = function(itemstack, placer, pointed_thing)
		local stack = ItemStack("lottores:geodes_crystal_"..math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("lottores:geodes_crystal_1 "..itemstack:get_count()-(1-ret:get_count()))
	end,
})

minetest.register_node("lottores:geodes_crystal_2", {
	drawtype = "nodebox",
	tiles = {"lottores_geodes_crystal.png"},
     paramtype = "light",
	sunlight_propagates = true,
     light_source = 8,
     alpha = 200,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3,not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults(),
     drop = "lottores:geodes_crystal_1",
     node_box = {
        type = "fixed",
        fixed = {
            {-0.1875,-0.5,-0.125,0.1875,0.5,0.1875},
            {0.1875,-0.5,-0.25,0.5,0.1875,0},
            {0.0625,-0.5,0.1875,0.375,0.375,0.375},
            {-0.375,-0.5,-0.3125,-0.0625,0.25,0},
            {-0.5,-0.5,-0.0625,-0.125,0,0.3125},
            {0,-0.5,-0.5,0.3125,-0.0625,-0.1875},
        }
    }
})

minetest.register_node("lottores:geodes_crystal_3", {
	drawtype = "nodebox",
	tiles = {"lottores_geodes_crystal.png"},
     paramtype = "light",
	sunlight_propagates = true,
     light_source = 8,
     alpha = 200,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3,not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults(),
     drop = "lottores:geodes_crystal_1",
     node_box = {
        type = "fixed",
        fixed = {
            {-0.125,-0.5,-0.25,0.25,0.5,0.1875},
            {-0.125,-0.5,-0.4375,0.125,0.25,-0.1875},
            {0,-0.5,-0.125,0.461539,0,0.3125},
            {-0.5,-0.5,0,-0.0625,0.25,0.413465},
            {-0.375,-0.5,-0.25,-0.0625,-0.0625,0.0625},
            {0.1875,-0.5,-0.5,0.5,-0.25,-0.1875},
            {-0.4375,-0.5,-0.5,-0.0625,-0.25,-0.125},
        }
    }
})

minetest.register_node("lottores:geodes_crystal_4", {
	drawtype = "nodebox",
	tiles = {"lottores_geodes_crystal.png"},
     paramtype = "light",
	sunlight_propagates = true,
     light_source = 8,
     alpha = 200,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3,not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults(),
     drop = "lottores:geodes_crystal_1",
     node_box = {
        type = "fixed",
        fixed = {
            {0.125,-0.5,-0.25,0.5,-0.125,0.125},
            {-0.125,-0.5,-0.0625,0.1875,0.375,0.3125},
            {0.0625,-0.5,-0.5,0.375,-0.0625,-0.125},
            {-0.3125,-0.5,-0.3125,0,-0.1875,0.0625},
            {-0.0625,-0.5,-0.1875,0.375,0.25,0.125},
            {-0.375,-0.5,0.125,0,0.25,0.5},
        }
    }
})

minetest.register_node("lottores:geodes_crystal_5", {
	drawtype = "nodebox",
	tiles = {"lottores_geodes_crystal.png"},
     paramtype = "light",
	sunlight_propagates = true,
     light_source = 8,
     alpha = 200,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3,not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults(),
     drop = "lottores:geodes_crystal_1",
     node_box = {
        type = "fixed",
        fixed = {
            {-0.3125,-0.5,-0.1875,0,0.5,0.125},
            {-0.1875,-0.5,-0.3125,0.1875,0.125,0},
            {-0.25,-0.5,-0.5,0.0625,0.3125,-0.1875},
            {0.0625,-0.5,-0.125,0.375,-0.125,0.1875},
            {0.0625,-0.5,-0.375,0.3125,-0.25,-0.1875},
            {-0.1875,-0.5,0,0.125,0.0625,0.5},
        }
    }
})

minetest.register_node("lottores:silver_block", {
	description = SL("Silver Block"),
	tiles = {"lottores_silver_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("lottores:tin_block", {
	description = SL("Tin Block"),
	tiles = {"lottores_tin_block.png"},
	is_ground_content = true,
	groups = {cracky=1},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("lottores:lead_block", {
	description = SL("Lead Block"),
	tiles = {"lottores_lead_block.png"},
	is_ground_content = true,
	groups = {cracky=1},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("lottores:mithril_block", {
	description = SL("Mithril Block"),
	tiles = {"lottores_mithril_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("lottores:galvorn_block", {
	description = SL("Galvorn Block"),
	tiles = {"lottores_galvorn_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2,forbidden=1},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("lottores:ithildin_0", {
	description = SL("Ithildin"),
	tiles = {"ithildin_0.png"},
	drawtype = "glasslike",
	paramtype = "light",
	walkable = false,
	pointable = false,
	sunlight_propagates = true,
	drop = "lottores:ithildin_1",
	groups = {snappy=2,cracky=3, not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lottores:ithildin_1", {
	description = SL("Ithildin"),
	tiles = {"ithildin_1.png"},
	inventory_image = {"ithildin_1.png"},
	wield_image = {"ithildin_1.png"},
	paramtype = "light",
	drawtype = 'glasslike',
	walkable = false,
	pointable = true,
	sunlight_propagates = true,
	light_source = 8,
	drop = "lottores:ithildin_1",
	groups = {snappy=2,cracky=3,forbidden=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lottores:ithildin_stone_0", {
	description = SL("Ithildin Stone"),
	tiles = {"default_stone.png"},
	drawtype = 'normal',
	walkable = true,
	pointable = true,
	sunlight_propagates = false,
	drop = "lottores:ithildin_stone_1",
	groups = {snappy=2,cracky=3, not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lottores:ithildin_stone_1", {
	description = SL("Ithildin Stone"),
	tiles = {"ithildin_1.png"},
	drawtype = 'glasslike',
	walkable = false,
	pointable = true,
	sunlight_propagates = false,
	light_source = 8,
	drop = "lottores:ithildin_stone_1",
	groups = {snappy=2,cracky=3,forbidden=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lottores:ithildin_stonelamp_0", {
	description = SL("Ithildin Stonelamp"),
	tiles = {"default_stone.png"},
	drawtype = 'normal',
	walkable = true,
	pointable = true,
	sunlight_propagates = false,
	drop = "lottores:ithildin_stonelamp_1",
	groups = {snappy=2,cracky=3, not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lottores:ithildin_stonelamp_1", {
	description = SL("Ithildin Stonelamp"),
	tiles = {"default_stone.png^ithildin_lamp_1.png"},
	drawtype = 'normal',
	walkable = true,
	pointable = true,
	sunlight_propagates = false,
	light_source = 8,
	drop = "lottores:ithildin_stonelamp_1",
	groups = {snappy=2,cracky=3,forbidden=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lottores:ithildin_lamp_0", {
	description = SL("Ithildin Lamp"),
	tiles = {"ithildin_lamp_0.png"},
	paramtype = "light",
	drawtype = 'glasslike',
	walkable = false,
	pointable = false,
	sunlight_propagates = true,
	drop = "lottores:ithildin_lamp_1",
	groups = {snappy=2,cracky=3, not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lottores:ithildin_lamp_1", {
	description = SL("Ithildin Lamp"),
	tiles = {"default_stone.png^ithildin_lamp_1.png"},
	paramtype = "light",
	drawtype = 'glasslike',
	walkable = true,
	pointable = true,
	sunlight_propagates = true,
	light_source = 8,
	drop = "lottores:ithildin_lamp_1",
	groups = {snappy=2,cracky=3,forbidden=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lottores:mineral_pearl", {
	description = SL("Pearl Ore"),
	tiles = {"default_sand.png^lottores_mineral_pearl.png"},
	paramtype = "light",
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	drop = {
		items = {
		{
				items = {'lottores:pearl'},
			},
			{
				items = {'default:sand'},
			}
		}
	},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("lottores:mineral_salt", {
	description = SL("Salt Mineral"),
	tiles = {"default_dirt.png^lottores_mineral_salt.png"},
	paramtype = "light",
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	drop = {
		items = {
			{
				items = {'lottores:salt'},
			},
			{
				items = {'default:dirt'},
			}
		}
	},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node( "lottores:pearl_block", {
	description = SL("Pearl Block"),
     alpha = 200,
	tiles = { "default_sand.png^lottores_pearl_block.png" },
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
     sounds = default.node_sound_glass_defaults(),
})

minetest.register_node( "lottores:salt_block", {
	description = SL("Salt Block"),
	tiles = { "default_clay.png^lottores_salt_block.png" },
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	on_use = minetest.item_eat(9),
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:salt", {
	description = SL("Salt"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"lottores_salt.png"},
	inventory_image = "lottores_salt.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=1},
	on_use = minetest.item_eat(1),
	sounds = default.node_sound_defaults(),
})

minetest.register_craftitem("lottores:limestone_lump", {
	description = SL("Limestone Lump"),
	inventory_image = "lottores_limestone_lump.png",
})

minetest.register_craftitem("lottores:rough_rock_lump", {
	description = SL("Rough Rock Lump"),
	inventory_image = "lottores_rough_rock_lump.png",
})

minetest.register_craftitem("lottores:silver_lump", {
	description = SL("Silver Lump"),
	inventory_image = "lottores_silver_lump.png",
})

minetest.register_craftitem("lottores:silver_ingot", {
	description = SL("Silver Ingot"),
	inventory_image = "lottores_silver_ingot.png",
})

minetest.register_craftitem("lottores:tin_lump", {
	description = SL("Tin Lump"),
	inventory_image = "lottores_tin_lump.png",
})

minetest.register_craftitem("lottores:tin_ingot", {
	description = SL("Tin Ingot"),
	inventory_image = "lottores_tin_ingot.png",
})

minetest.register_craftitem("lottores:lead_lump", {
	description = SL("Lead Lump"),
	inventory_image = "lottores_lead_lump.png",
})

minetest.register_craftitem("lottores:lead_ingot", {
	description = SL("Lead Ingot"),
	inventory_image = "lottores_lead_ingot.png",
})

minetest.register_craftitem("lottores:mithril_lump", {
	description = SL("Mithril Lump"),
	inventory_image = "lottores_mithril_lump.png",
})

minetest.register_craftitem("lottores:mithril_ingot", {
	description = SL("Mithril Ingot"),
	inventory_image = "lottores_mithril_ingot.png",
})

minetest.register_craftitem("lottores:galvorn_ingot", {
	description = SL("Galvorn Ingot"),
	inventory_image = "lottores_galvorn_ingot.png",
     groups = {forbidden=1},
})

minetest.register_craftitem("lottores:tilkal_ingot", {
	description = SL("Tilkal Ingot"),
	inventory_image = "lottores_tilkal_ingot.png",
     groups = {forbidden=1},
})

minetest.register_craftitem("lottores:blue_gem", {
	description = SL("Blue Gem"),
	inventory_image = "lottores_bluegem.png",
})

minetest.register_craftitem("lottores:red_gem", {
	description = SL("Red Gem"),
	inventory_image = "lottores_redgem.png",
})

minetest.register_craftitem("lottores:white_gem", {
	description = SL("White Gem"),
	inventory_image = "lottores_whitegem.png",
})

minetest.register_craftitem("lottores:pearl", {
	description = SL("Pearl"),
	inventory_image = "lottores_pearl.png",
})

dofile(minetest.get_modpath("lottores") .. "/mapgen.lua")
dofile(minetest.get_modpath("lottores") .. "/functions.lua")
dofile(minetest.get_modpath("lottores") .. "/stairs.lua")
dofile(minetest.get_modpath("lottores") .. "/crafting.lua")

lord.mod_loaded()
