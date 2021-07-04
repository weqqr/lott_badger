local S = minetest.get_translator("lord_homedecor")

lord_homedecor.register("window_flowerbox", {
	description = S("Window flowerbox"),
	tiles = {
		"homedecor_flowerbox_top.png",
		"homedecor_flowerbox_bottom.png",
		"homedecor_flowerbox_sides.png"
	},
	inventory_image = "homedecor_flowerbox_inv.png",
	sounds = default.node_sound_stone_defaults(),
	groups = { snappy = 3 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, 0.25, -0.125, 0.375, 0.5, 0.375}, -- NodeBox1
			{-0.3125, 0.4375, 0.375, -0.25, 0.4875, 0.5}, -- NodeBox2
			{0.25, 0.4375, 0.375, 0.3125, 0.4875, 0.5}, -- NodeBox3
		}
	}
})

lord_homedecor.register("stained_glass", {
	description = S("Stained Glass"),
	tiles = {"homedecor_stained_glass.png"},
	inventory_image = "homedecor_stained_glass.png",
	groups = {snappy=3},
	use_texture_alpha = true,
	light_source = 3,
	sounds = default.node_sound_glass_defaults(),
	node_box = {
		type = "fixed",
		fixed = { {-0.5, -0.5, 0.46875, 0.5, 0.5, 0.5} }
	}
})
