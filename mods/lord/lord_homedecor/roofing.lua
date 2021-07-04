local S = minetest.get_translator("lord_homedecor")

minetest.register_node("lord_homedecor:skylight", {
	description = S("Glass Skylight"),
	drawtype = "raillike",
	tiles = { "default_glass.png" },
	wield_image = "default_glass.png",
	inventory_image = "homedecor_skylight_inv.png",
	groups = { snappy = 3 },
	paramtype = "light",
	sounds = default.node_sound_glass_defaults(),
	selection_box = lord_homedecor.nodebox.slab_y(0.1),
	collision_box = lord_homedecor.nodebox.slab_y(0.1),
})

minetest.register_node("lord_homedecor:skylight_frosted", {
	description = S("Glass Skylight Frosted"),
	drawtype = "raillike",
	tiles = { "homedecor_skylight_frosted.png" },
	wield_image = "homedecor_skylight_frosted.png",
	inventory_image = "homedecor_skylight_frosted_inv.png",
	use_texture_alpha = true,
	groups = { snappy = 3 },
	paramtype = "light",
	sounds = default.node_sound_glass_defaults(),
	selection_box = lord_homedecor.nodebox.slab_y(0.1),
	collision_box = lord_homedecor.nodebox.slab_y(0.1),
})

for _, s in pairs({"terracotta", "wood", "glass"}) do
	minetest.register_node("lord_homedecor:shingles_"..s, {
		description = S("Shingles ("..s..")"),
		drawtype = "raillike",
		tiles = { "homedecor_shingles_"..s..".png" },
		wield_image = "homedecor_shingles_"..s..".png",
		inventory_image = "homedecor_shingles_"..s.."_inv.png",
		paramtype = "light",
		walkable = false,
		groups = { snappy = 3 },
		sounds = default.node_sound_wood_defaults(),
		selection_box = lord_homedecor.nodebox.slab_y(0.1),
	})
end

local slope_cbox = {
	type = "fixed",
	fixed = {
		{-0.5,  -0.5,  -0.5, 0.5, -0.25, 0.5},
		{-0.5, -0.25, -0.25, 0.5,     0, 0.5},
		{-0.5,     0,     0, 0.5,  0.25, 0.5},
		{-0.5,  0.25,  0.25, 0.5,   0.5, 0.5}
	}
}

local ocorner_cbox = {
	type = "fixed",
	fixed = {
		{-0.5,  -0.5,  -0.5,   0.5, -0.25, 0.5},
		{-0.5, -0.25, -0.25,  0.25,     0, 0.5},
		{-0.5,     0,     0,     0,  0.25, 0.5},
		{-0.5,  0.25,  0.25, -0.25,   0.5, 0.5}
	}
}

local icorner_cbox = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5}, -- NodeBox5
		{-0.5, -0.5, -0.25, 0.5, 0, 0.5}, -- NodeBox6
		{-0.5, -0.5, -0.5, 0.25, 0, 0.5}, -- NodeBox7
		{-0.5, 0, -0.5, 0, 0.25, 0.5}, -- NodeBox8
		{-0.5, 0, 0, 0.5, 0.25, 0.5}, -- NodeBox9
		{-0.5, 0.25, 0.25, 0.5, 0.5, 0.5}, -- NodeBox10
		{-0.5, 0.25, -0.5, -0.25, 0.5, 0.5}, -- NodeBox11
	}
}

lord_homedecor.register_outer_corner = function(modname, subname, groups, slope_image, description)
	local tiles = slope_image

	if type(slope_image) ~= "table" then
		tiles = { "homedecor_slope_outer_corner_"..slope_image..".png" }
	end
	--print("Modname = "..modname)
	minetest.register_node(modname..":shingle_outer_corner_" .. subname, {
		description = S(description.. " (outer corner)"),
		drawtype = "mesh",
		mesh = "homedecor_slope_outer_corner.obj",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		selection_box = ocorner_cbox,
		collision_box = ocorner_cbox,
		groups = groups,
		on_place = minetest.rotate_node,
		sounds = default.node_sound_wood_defaults()
	})
end

lord_homedecor.register_inner_corner = function(modname, subname, groups, slope_image, description)
	local tiles = slope_image

	if type(slope_image) ~= "table" then
		tiles = { "homedecor_slope_outer_corner_"..slope_image..".png" }
	end

	minetest.register_node(modname..":shingle_inner_corner_" .. subname, {
		description = S(description.. " (inner corner)"),
		drawtype = "mesh",
		mesh = "homedecor_slope_inner_corner.obj",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		collision_box = icorner_cbox,
		groups = groups,
		on_place = minetest.rotate_node,
		sounds = default.node_sound_wood_defaults()
	})
end

lord_homedecor.register_slope = function(modname, subname, recipeitem, groups, slope_image, description)
	local tiles = slope_image

	if type(slope_image) ~= "table" then
		tiles = { "homedecor_slope_outer_corner_"..slope_image..".png" }
	end

	minetest.register_node(modname..":shingle_side_" .. subname, {
		description = S(description),
		drawtype = "mesh",
		mesh = "homedecor_slope.obj",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		selection_box = slope_cbox,
		collision_box = slope_cbox,
		groups = groups,
		on_place = minetest.rotate_node,
		sounds = default.node_sound_wood_defaults()
	})

	-- convert between flat shingles and slopes
	-- конвертировать между плоской черепицы и склонов

	minetest.register_craft({
		output = modname..":shingle_side_"..subname.." 3",
		recipe = {
			{recipeitem, recipeitem, recipeitem}
		}
	})

	minetest.register_craft({
		output = recipeitem.." 3",
		recipe = {
			{modname..":shingle_side_"..subname, modname..":shingle_side_"..subname, modname..":shingle_side_"..subname},
		}
	})

	-- craft outer corners

	minetest.register_craft({
		output = modname..":shingle_outer_corner_"..subname.." 3",
		recipe = {
			{ "", recipeitem, "" },
			{ recipeitem, "", recipeitem }
		}
	})

	minetest.register_craft({
		output = modname..":shingle_outer_corner_"..subname.." 3",
		recipe = {
			{ "", modname..":shingle_side_"..subname, "" },
			{ modname..":shingle_side_"..subname, "", modname..":shingle_side_"..subname },
		}
	})

	-- craft inner corners

	minetest.register_craft({
		output = modname..":shingle_inner_corner_"..subname.." 3",
		recipe = {
			{recipeitem, recipeitem},
			{"", recipeitem}
		}
	})

	minetest.register_craft({
		output = modname..":shingle_inner_corner_"..subname.." 3",
		recipe = {
			{modname..":shingle_side_"..subname, modname..":shingle_side_"..subname},
			{"", modname..":shingle_side_"..subname}
		}
	})
	-- convert between flat shingles and inner/outer corners
	-- конвертировать между плоской черепицы и внутренний/внешний углы
	minetest.register_craft({
		type = "shapeless",
		output = recipeitem.." 1",
		recipe = { modname..":shingle_outer_corner_"..subname }
	})

	minetest.register_craft({
		type = "shapeless",
		output = recipeitem.." 1",
		recipe = { modname..":shingle_inner_corner_"..subname }
	})
end

minetest.register_craft( {
	output = "lord_homedecor:roof_tile_terracotta 8",
	recipe = {
		{ "lord_homedecor:shingle_outer_corner_terracotta", "lord_homedecor:shingle_outer_corner_terracotta" }
	}
})

minetest.register_craft( {
	output = "lord_homedecor:roof_tile_terracotta 8",
	recipe = {
		{ "lord_homedecor:shingle_inner_corner_terracotta", "lord_homedecor:shingle_inner_corner_terracotta" }
	}
})

minetest.register_craft( {
	output = "lord_homedecor:roof_tile_terracotta 8",
	recipe = {
		{ "lord_homedecor:shingle_side_terracotta", "lord_homedecor:shingle_side_terracotta" }
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "lord_homedecor:shingle_inner_corner_wood",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "lord_homedecor:shingle_outer_corner_wood",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "lord_homedecor:shingle_side_wood",
	burntime = 30,
})

lord_homedecor.register_roof = function(modname, subname, groups, slope_image , description)
	lord_homedecor.register_outer_corner(modname, subname, groups, slope_image, description)
	lord_homedecor.register_inner_corner(modname, subname, groups, slope_image, description)
end

-- corners

lord_homedecor.register_roof("lord_homedecor", "wood",
	{ snappy = 3 },
	{ "homedecor_shingles_wood.png" },
	"Wood Shingles"
)


lord_homedecor.register_roof("lord_homedecor", "terracotta",
	{ snappy = 3 },
	{ "homedecor_shingles_terracotta.png" },
	"Terracotta Shingles"
)

-- register just the slopes
-- modname, subname, recipeitem, groups, slope_image, description
lord_homedecor.register_slope("lord_homedecor", "wood",
	"lord_homedecor:shingles_wood",
	{ snappy = 3 },
	{ "homedecor_shingles_wood.png" },
	"Wood Shingles"
)

lord_homedecor.register_slope("lord_homedecor", "terracotta",
	"lord_homedecor:shingles_terracotta",
	{ snappy = 3 },
	{ "homedecor_shingles_terracotta.png" },
	"Terracotta Shingles"
)


-- мансардное окно
--lord_homedecor.register_slope("lord_homedecor", "glass",
	--"lord_homedecor:shingles_glass",
	--{ snappy = 3 },
	--{ "homedecor_shingles_glass.png", "homedecor_shingles_wood.png" },
	--"Glass Shingles"
--)
minetest.register_node("lord_homedecor:shingle_side_glass", {
	description = S("Glass Shingles"),
	drawtype = "mesh",
	mesh = "homedecor_slope.obj",
	tiles = { "homedecor_shingles_glass.png", "homedecor_shingles_wood.png" },
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = slope_cbox,
	collision_box = slope_cbox,
	groups = { snappy = 3 },
	on_place = minetest.rotate_node,
	sounds = default.node_sound_wood_defaults()
})

minetest.register_craft( {
	output = "lord_homedecor:shingle_side_glass",
	recipe = {
		{ "lord_homedecor:shingles_wood", "lord_homedecor:skylight" }
	}
})
minetest.register_craft( {
	output = "lord_homedecor:shingle_side_glass",
	recipe = {
		{ "lord_homedecor:skylight", "lord_homedecor:shingles_wood" }
	}
})
--

lord_homedecor.register("chimney", {
	description = S("Chimney"),
	mesh = "homedecor_chimney.obj",
	tiles = {
		"homedecor_chimney_tb.png",
		"default_brick.png"
	},
	selection_box = lord_homedecor.nodebox.bar_y(0.25),
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})
