local SL = lord.require_intllib()

-- Minetest 0.4 mod: stairs
-- See README.txt for licensing and other information.

stairs = {}

-- Node will be called stairs:stair_<subname>
function stairs.register_stair(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":stairs:stair_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under  -- куда смотрим
			local p1 = pointed_thing.above  -- куда ставим
			local p3 = placer:getpos()      -- позиция игрока
			local param2 = 0
			local p1_={x=p1.x,y=p1.y+1,z=p1.z} -- узел над местом установки
			
			-- проверим на заприваченность территории
			if minetest.is_protected(p1, placer:get_player_name()) or
			minetest.is_protected(p1_, placer:get_player_name()) then
				minetest.record_protection_violation(p1, placer:get_player_name())
				return itemstack
			end

			local dir={
				x = (p1.x - p3.x),
				y = (p1.y - p3.y),
				z = (p1.z - p3.z)
				}
			param2 = minetest.dir_to_facedir(dir)  -- определяем направление относительно игрока
			-- 2 - игрок севернее   надо 4 если на стену
			-- 1 - игрок западнее	надо 19
			-- 3 - игрок восточнее	надо 13
			-- 0 - игрок южнее		надо 10
			
			-- стороны света и координаты
			-- +z север, -z юг
			-- +x восток, -x запад
			
			--         С
			--        +z
			--   З -x    +x В
			--        -z
			--         Ю
			
			local y1 = (p0.y - p1.y)  
			if y1>0 then 			-- ставим на потолок
				if param2==0 then
					param2=20
				elseif param2==1 then
					param2=23 
				elseif param2==2 then
					param2=22 
				else
					param2=21 
				end
			end
			
			if y1==0 then 			-- ставим на стену
				if param2==0 then
					param2=10
				elseif param2==1 then
					param2=19 
				elseif param2==2 then
					param2=4 
				else
					param2=13 
				end
			end
			
			
			
			--print("param2="..tostring(param2))
			minetest.set_node(p1,{name = "stairs:stair_" .. subname, param2 = param2})
			if not minetest.setting_getbool("creative_mode") then	
				itemstack:take_item()
			end
			return itemstack
			--return minetest.item_place(itemstack, placer, pointed_thing, 13)
		end,
	})

	-- for replace ABM
	minetest.register_node(":stairs:stair_" .. subname.."upside_down", {
		--replace_name = "stairs:stair_" .. subname,
		--groups = {slabs_replace=1},
		drop = "stairs:stair_" .. subname,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0, -0.5, 0.5, 0.5, 0.5},
				{-0.5, -0.5, 0, 0.5, 0, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0, -0.5, 0.5, 0.5, 0.5},
				{-0.5, -0.5, 0, 0.5, 0, 0.5},
			},
		},
	})

	minetest.register_craft({
		output = 'stairs:stair_' .. subname .. ' 4',
		recipe = {
			{recipeitem, "", ""},
			{recipeitem, recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
		},
	})

	-- Flipped recipe for the silly minecrafters
	minetest.register_craft({
		output = 'stairs:stair_' .. subname .. ' 4',
		recipe = {
			{"", "", recipeitem},
			{"", recipeitem, recipeitem},
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- Node will be called stairs:slab_<subname>
function stairs.register_slab(subname, recipeitem, groups, images, description, sounds, drop)
	local name = "stairs:slab_"..subname
	if minetest.registered_nodes[name] then
		recipeitem = recipeitem or name
		groups = groups or minetest.registered_nodes[name].groups
		groups.not_in_creative_inventory = 1
		images = images or minetest.registered_nodes[name].tiles
		description = description or minetest.registered_nodes[name].description
		sounds = sounds or minetest.registered_nodes[name].sounds
	else
		if not (recipeitem and groups and images and description and sounds) then
			print("Name="..name)
			print(recipeitem)
			print(groups)
			print("images="..tostring(images))
			print("description="..description)
			print("sounds="..tostring(sounds))
			print("=== block not registered ===")
			return
		end
	end
	drop = drop or name
	minetest.register_node(":"..name, {
		drawtype = "nodebox",
		tiles = images,
		drop = drop,
		paramtype = "light",
		paramtype2 = "wallmounted",
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "wallmounted",
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			wall_top = {-0.5, 0, -0.5, 0.5, 0.5, 0.5},
			wall_side = {-0.5, -0.5, -0.5, 0, 0.5, 0.5},
		},
		selection_box = {
			type = "wallmounted",
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			wall_top = {-0.5, 0, -0.5, 0.5, 0.5, 0.5},
			wall_side = {-0.5, -0.5, -0.5, 0, 0.5, 0.5},
		}
	})
	groups.not_in_creative_inventory = 0
	--print(name)
	minetest.register_node(":"..name, {
		description = description,
		drawtype = "nodebox",
		groups = groups,
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end
			local p1 = pointed_thing.under
			local p2 = pointed_thing.above
			local dir = {x=p1.x-p2.x,y=p1.y-p2.y,z=p1.z-p2.z}
			local pressed = placer:get_player_control()
			local p3 = placer:getpos()
			local param2 = 0
			local p1_={x=p1.x,y=p1.y+1,z=p1.z} -- узел над местом установки
			
			-- проверим на заприваченность территории
			if minetest.is_protected(p1, placer:get_player_name()) or
			minetest.is_protected(p1_, placer:get_player_name()) then
				minetest.record_protection_violation(p1, placer:get_player_name())
				return itemstack
			end
			
			local dir1={
				x = (p1.x - p3.x),
				y = (p1.y - p3.y),
				z = (p1.z - p3.z)
				}
			param2 = minetest.dir_to_facedir(dir)  -- определяем направление по сторонам света
			--print("param2 = "..tostring(param2))
			if pressed.sneak then
				dir.y = 1
			end	
			-- определим положение установки
			-- 0,1,2,3 - 4,5,6,7 - 8,9,10,11 - 12,13,14,15 - 16,17,18,19 - 20,21,22,23
			print("dir.y = "..tostring(dir.y))
			if dir.y == 0 then
			-- если ставим на стену   dir.y == 0
				if param2==0 then
					-- север
					param2=8
				elseif param2==1 then
					-- восток
					param2=17 
				elseif param2==2 then
					-- юг
					param2=6 
				else
					-- запад
					param2=15 
				end
			--param2=minetest.dir_to_wallmounted(dir)
			elseif dir.y < 0 then
			-- если ставим на пол     dir.y < 0
				param2 = minetest.dir_to_facedir(dir1)
			else
			-- если ставим на потолок dir.y > 0
				param2 = minetest.dir_to_facedir(dir1)
				if param2==0 then
					param2=20
				elseif param2==1 then
					param2=23 
				elseif param2==2 then
					param2=22 
				else
					param2=21 
				end
			end
			print("param2="..tostring(param2))
			if pressed.sneak then
				minetest.set_node(pointed_thing.above, {name=name, param2=param2})
			elseif pressed.aux1 then
				-- обычная установка полублока без склеивания
				return minetest.item_place(itemstack, placer, pointed_thing, 20)
			else	
				if (minetest.get_node(pointed_thing.under).name == name
					and minetest.get_node(pointed_thing.under).param2 == param2) or
						(minetest.get_node(pointed_thing.under).name == name
						and minetest.get_node(pointed_thing.under).param2 == 0) then
					minetest.set_node(pointed_thing.under, {name=recipeitem, param2=param2})	-- замена двух полублоков на блок
				elseif minetest.registered_nodes[minetest.get_node(pointed_thing.above).name].buildable_to then
					minetest.set_node(pointed_thing.above, {name=name, param2=param2})
				else
					return itemstack
				end
			end

			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end,
	})

	minetest.register_craft({
		output = name.." 6",
		recipe = {
			{recipeitem, recipeitem, recipeitem},
		},
	})
	--minetest.register_alias(name.."upside_down", name.."_r")
	minetest.register_alias(name.."upside_down", name)
	minetest.register_alias(name.."_r", name)
end

-- Nodes will be called stairs:{stair,slab}_<subname>
function stairs.register_stair_and_slab(subname, recipeitem, groups, images, desc_stair, desc_slab, sounds)
	stairs.register_stair(subname, recipeitem, groups, images, desc_stair, sounds)
	stairs.register_slab(subname, recipeitem, groups, images, desc_slab, sounds)
end

stairs.register_stair_and_slab("wood", "default:wood",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3, wooden = 1},
		{"default_wood.png"},
		SL("Wooden Stair"),
		SL("Wooden Slab"),
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("stone", "default:stone",
		{cracky=3},
		{"default_stone.png"},
		SL("Stone Stair"),
		SL("Stone Slab"),
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("cobble", "default:cobble",
		{cracky=3},
		{"default_cobble.png"},
		SL("Cobble Stair"),
		SL("Cobble Slab"),
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick", "default:brick",
		{cracky=3},
		{"default_brick.png"},
		SL("Brick Stair"),
		SL("Brick Slab"),
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("sandstone", "default:sandstone",
		{crumbly=2,cracky=2},
		{"default_sandstone.png"},
		SL("Sandstone Stair"),
		SL("Sandstone Slab"),
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("junglewood", "default:junglewood",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3, wooden = 1},
		{"default_junglewood.png"},
		SL("Junglewood Stair"),
		SL("Junglewood Slab"),
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("stonebrick", "default:stonebrick",
		{cracky=3},
		{"default_stone_brick.png"},
		SL("Stone Brick Stair"),
		SL("Stone Brick Slab"),
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("desert_stonebrick", "default:desert_stonebrick",
		{cracky=3},
		{"default_desert_stone_brick.png"},
		SL("Desert Stone Brick Stair"),
		SL("Desert Stone Brick Slab"),
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("desert_stone", "default:desert_stone",
		{cracky=3},
		{"default_desert_stone.png"},
		SL("Desert Stone Stair"),
		SL("Desert Stone Slab"),
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("desert_cobble", "default:desert_cobble",
		{cracky=3},
		{"default_desert_cobble.png"},
		SL("Desert Cobble Stair"),
		SL("Desert Cobble Slab"),
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("sandstonebrick", "default:sandstonebrick",
		{cracky=3},
		{"default_sandstone_brick.png"},
		SL("Sandstone Brick Stair"),
		SL("Sandstone Brick Slab"),
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("obsidian", "default:obsidian",
		{cracky=3},
		{"default_obsidian.png"},
		SL("Obsidian Stair"),
		SL("Obsidian Slab"),
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("mossycobble", "default:mossycobble",
		{cracky=3},
		{"default_mossycobble.png"},
		SL("Mossycobble Stair"),
		SL("Mossycobble Slab"),
		default.node_sound_stone_defaults())
		
if minetest.setting_getbool("msg_loading_mods") then minetest.log("action", minetest.get_current_modname().." mod LOADED") end
