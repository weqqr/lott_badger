lottmapgen = {}

local areas_mod = minetest.global_exists("areas")
local protect_houses = minetest.setting_getbool("protect_structures") or true

local lottmapgen_list = {
	-- Description      Technical name  Area name        Area owner       Area bounding box (from placement point)
	{ "Angmar Fort",    "angmarfort",   "Angmar Fort",   "Orc Guard",     {x= 4, y=15, z=4}, {x=22, y=25, z=22} },
	{ "Gondor Fort",    "gondorfort",   "Gondor Castle", "Gondor Guard",  {x=-2, y=15, z=5}, {x=23, y=35, z=24} },
	{ "Rohan Fort",     "rohanfort",    "Rohan Fort",    "Rohan Guard",   {x= 4, y=15, z=4}, {x=29, y=25, z=29} },
	{ "Orc Fort",       "orcfort",      "Orc Fort",      "Orc Guard",     {x= 4, y=15, z=4}, {x=26, y=45, z=26} },
	{ "Mallorn House",  "mallornhouse", "Elven House",   "Elven Guard",   {x= 3, y=15, z=3}, {x=10, y=35, z=10} },
	{ "Lorien House",   "lorienhouse",  "Elven House",   "Elven Guard",   {x= 2, y=15, z=2}, {x=12, y=45, z=12} },
	{ "Mirkwood House", "mirkhouse",    "Elven House",   "Elven Guard",   {x= 4, y=15, z=4}, {x=15, y=30, z=15} },
	{ "Hobbit Hole",    "hobbithole",   "Hobbit Hole",   "Hobbit Family", {x= 0, y=15, z=0}, {x=30, y=10, z=20} },
}

local buildings = {}

local function place_building(name, pos, offset1, offset2, area_name, area_owner)
	worldedit.deserialize(pos, buildings[name])
	if areas_mod and protect_houses then
		local pos1 = {
			x = pos.x - offset1.x,
			y = pos.y - offset1.y,
			z = pos.z - offset1.z,
		}
		local pos2 = {
			x = pos.x + offset2.x,
			y = pos.y + offset2.y,
			z = pos.z + offset2.z,
		}
		areas:add(area_owner, area_name, pos1, pos2, nil)
		areas:save()
	end
end

local fmt = string.format
local function load_building(name)
	local filename = fmt("%s/schems/%s.we", minetest.get_modpath("lottmapgen"), name)
	local file = io.open(filename)
	local content = file:read("*a")
	file:close()
	buildings[name] = content
end

for i in ipairs(lottmapgen_list) do
	local description = lottmapgen_list[i][1]
	local name = lottmapgen_list[i][2]
	local area_name = lottmapgen_list[i][3]
	local area_owner = lottmapgen_list[i][4]
	local offset1 = lottmapgen_list[i][5]
	local offset2 = lottmapgen_list[i][6]

	load_building(name)

	-- The node being placed by the mapgen
	minetest.register_node("lottmapgen:"..name, {
		description = description,
		drawtype = "glasslike",
		walkable = false,
		tiles = {"lottother_air.png"},
		pointable = false,
		sunlight_propagates = true,
		is_ground_content = true,
		groups = {not_in_creative_inventory = 1},
		on_place = function(itemstack, placer, pointed_thing)
			local pos = pointed_thing.above
			place_building(name, pos, offset1, offset2, area_name, area_owner)
			return itemstack
		end,
	})

	-- ABM that places a building
	minetest.register_abm({
		nodenames = {"lottmapgen:"..name},
		interval = 0.1,
		chance = 1,
		action = function(pos)
			minetest.remove_node(pos)
			place_building(name, pos, offset1, offset2, area_name, area_owner)
		end,
	})
end
