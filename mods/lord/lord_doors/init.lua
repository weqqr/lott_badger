local SL = minetest.get_translator("lord_doors")

local name = "gondor"
local description = "Gondor"
local groups_door = {snappy=1,bendy=2,cracky=1,melty=2,level=2,door=1, steel_item=1}

doors.register_door("lord_doors:door_" .. name, {
	description =  SL(description .. " Door"),
	inventory_image = "lord_doors_" .. name .. ".png",
	groups = groups_door,
	tiles_bottom = {"lord_doors_" .. name .."_b.png", "lord_doors_edge_" .. name ..".png"},
	tiles_top = {"lord_doors_" .. name .. "_a.png", "lord_doors_edge_" .. name ..".png"},
	sounds = default.node_sound_wood_defaults(),
	sunlight = true,
})
