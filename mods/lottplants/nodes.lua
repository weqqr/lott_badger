local SL = lord.require_intllib()

-- LEAVES

minetest.register_node("lottplants:alderleaf", {
	description = SL("Alder Leaf"),
	drawtype = "mesh",
	mesh = "leaves_model.obj",
	tiles = {"lottplants_alderleaf.png"},
	paramtype = "light",
	walkable=false,
		--climbable=true,
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "lottplants:alderleaf",
	liquid_alternative_source = "lottplants:alderleaf",
	liquid_renewable = false,
	liquid_range = 0,

	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottplants:aldersapling'},
				rarity = 20,
			},
			{
				items = {'lottplants:alderleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottplants:appleleaf", {
	description = SL("Apple Leaf"),
	drawtype = "mesh",
	mesh = "leaves_model.obj",
	tiles = {"lottplants_appleleaf.png"},
	paramtype = "light",
	walkable=false,
		--climbable=true,
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "lottplants:appleleaf",
	liquid_alternative_source = "lottplants:appleleaf",
	liquid_renewable = false,
	liquid_range = 0,

	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottplants:applesapling'},
				rarity = 20,
			},
			{
				items = {'lottplants:appleleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottplants:birchleaf", {
	description = SL("Birch Leaf"),
	drawtype = "mesh",
	mesh = "leaves_model.obj",
	tiles = {"lottplants_birchleaf.png"},
	paramtype = "light",
	walkable=false,
		--climbable=true,
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "lottplants:birchleaf",
	liquid_alternative_source = "lottplants:birchleaf",
	liquid_renewable = false,
	liquid_range = 0,

	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottplants:birchsapling'},
				rarity = 20,
			},
			{
				items = {'lottplants:birchleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottplants:beechleaf", {
	description = SL("Beech Leaf"),
	drawtype = "mesh",
	mesh = "leaves_model.obj",
	tiles = {"lottplants_beechleaf.png"},
	paramtype = "light",
	walkable=false,
		--climbable=true,
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "lottplants:beechleaf",
	liquid_alternative_source = "lottplants:beechleaf",
	liquid_renewable = false,
	liquid_range = 0,

	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottplants:beechsapling'},
				rarity = 20,
			},
			{
				items = {'lottplants:beechleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottplants:culumaldaleaf", {
	description = SL("Culumalda Leaf"),
	drawtype = "mesh",
	mesh = "leaves_model.obj",
	tiles = {"lottplants_culumaldaleaf.png"},
	paramtype = "light",
	walkable=false,
		--climbable=true,
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "lottplants:culumaldaleaf",
	liquid_alternative_source = "lottplants:culumaldaleaf",
	liquid_renewable = false,
	liquid_range = 0,

	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottplants:culumaldasapling'},
				rarity = 20,
			},
			{
				items = {'lottplants:culumaldaleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottplants:yellowflowers", {
	description = SL("Yellow Flowers on Culumalda Leaf"),
	drawtype = "mesh",
	mesh = "leaves_model.obj",
	tiles = {"lottplants_yellowflowers.png"},
	paramtype = "light",
	walkable=false,
		--climbable=true,
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "lottplants:yellowflowers",
	liquid_alternative_source = "lottplants:yellowflowers",
	liquid_renewable = false,
	liquid_range = 0,

	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
    drop = {
	    	max_items = 3,
		    items = {
		        { items = {'lottplants:culumaldaleaf'} },
		    	{ items = {'lottplants:culumaldasapling'}, rarity = 20 },
		    	{ items = {'lottplants:yellowflowers'} },
		    }
	    },
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottplants:elmleaf", {
	description = SL("Elm Leaf"),
	drawtype = "mesh",
	mesh = "leaves_model.obj",
	tiles = {"lottplants_elmleaf.png"},
	paramtype = "light",
	walkable=false,
		--climbable=true,
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "lottplants:elmleaf",
	liquid_alternative_source = "lottplants:elmleaf",
	liquid_renewable = false,
	liquid_range = 0,

	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottplants:elmsapling'},
				rarity = 20,
			},
			{
				items = {'lottplants:elmleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottplants:firleaf", {
	description = SL("Fir Leaf"),
	drawtype = "mesh",
	mesh = "leaves_model.obj",
	tiles = {"lottplants_firleaf.png"},
	paramtype = "light",
	walkable=false,
		--climbable=true,
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "lottplants:firleaf",
	liquid_alternative_source = "lottplants:firleaf",
	liquid_renewable = false,
	liquid_range = 0,

	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottplants:firsapling'},
				rarity = 20,
			},
			{
				items = {'lottplants:firleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottplants:lebethronleaf", {
	description = SL("Lebethron Leaf"),
	drawtype = "mesh",
	mesh = "leaves_model.obj",
	tiles = {"lottplants_lebethronleaf.png"},
	paramtype = "light",
	walkable=false,
		--climbable=true,
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "lottplants:lebethronleaf",
	liquid_alternative_source = "lottplants:lebethronleaf",
	liquid_renewable = false,
	liquid_range = 0,

	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottplants:lebethronsapling'},
				rarity = 20,
			},
			{
				items = {'lottplants:lebethronleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottplants:mallornleaf", {
	description = SL("Mallorn Leaf"),
	drawtype = "mesh",
	mesh = "leaves_model.obj",
	tiles = {"lottplants_mallornleaf.png"},
	paramtype = "light",
	walkable=false,
	--climbable=true,
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "lottplants:mallornleaf",
	liquid_alternative_source = "lottplants:mallornleaf",
	liquid_renewable = false,
	liquid_range = 0,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottplants:mallornsapling'},
				rarity = 20,
			},
			{
				items = {'lottplants:mallornleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottplants:pineleaf", {
	description = SL("Pine Leaf"),
	drawtype = "mesh",
	mesh = "leaves_model.obj",
	tiles = {"lottplants_pineleaf.png"},
	paramtype = "light",
	walkable=false,
		--climbable=true,
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "lottplants:pineleaf",
	liquid_alternative_source = "lottplants:pineleaf",
	liquid_renewable = false,
	liquid_range = 0,

	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottplants:pinesapling'},
				rarity = 20,
			},
			{
				items = {'lottplants:pineleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottplants:plumleaf", {
	description = SL("Plum Leaf"),
	drawtype = "mesh",
	mesh = "leaves_model.obj",
	tiles = {"lottplants_plumleaf.png"},
	paramtype = "light",
	walkable=false,
		--climbable=true,
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "lottplants:plumleaf",
	liquid_alternative_source = "lottplants:plumleaf",
	liquid_renewable = false,
	liquid_range = 0,

	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottplants:plumsapling'},
				rarity = 20,
			},
			{
				items = {'lottplants:plumleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottplants:rowanleaf", {
	description = SL("Rowan Leaf"),
	drawtype = "mesh",
	mesh = "leaves_model.obj",
	tiles = {"lottplants_rowanleaf.png"},
	walkable=false,
		--climbable=true,
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "lottplants:rowanleaf",
	liquid_alternative_source = "lottplants:rowanleaf",
	liquid_renewable = false,
	liquid_range = 0,

	paramtype = "light",
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
    drop = {
	    	max_items = 1,
		    items = {
		    	{ items = {'lottplants:rowansapling'}, rarity = 20 },
		    	{ items = {'lottfarming:berries'}, rarity = 200 },
		    	{ items = {'lottplants:rowanleaf'} },
		    }
	    },
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottplants:rowanberry", {
	description = SL("Rowan Leaf with Berries"),
	drawtype = "mesh",
	mesh = "leaves_model.obj",
	tiles = {"lottplants_rowanleaf.png^lottplants_rowanberry.png"},
	paramtype = "light",
	walkable=false,
		--climbable=true,
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "lottplants:rowanberry",
	liquid_alternative_source = "lottplants:rowanberry",
	liquid_renewable = false,
	liquid_range = 0,

	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
    drop = {
	    	max_items = 2,
		    items = {
		          { items = {'lottplants:rowanleaf'} },
		    	  { items = {'lottfarming:berries'} },
		    }
	    },
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottplants:whiteleaf", {
	description = SL("White Leaf"),
	drawtype = "mesh",
	mesh = "leaves_model.obj",
	tiles = {"lottplants_whiteleaf.png"},
	paramtype = "light",
	walkable=false,
		--climbable=true,
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "lottplants:whiteleaf",
	liquid_alternative_source = "lottplants:whiteleaf",
	liquid_renewable = false,
	liquid_range = 0,

	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottplants:whitesapling'},
				rarity = 20,
			},
			{
				items = {'lottplants:whiteleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottplants:yavannamireleaf", {
	description = SL("Yavannamire Leaf"),
	drawtype = "mesh",
	mesh = "leaves_model.obj",
	tiles = {"lottplants_yavannamireleaf.png"},
	paramtype = "light",
	walkable=false,
		--climbable=true,
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "lottplants:yavannamireleaf",
	liquid_alternative_source = "lottplants:yavannamireleaf",
	liquid_renewable = false,
	liquid_range = 0,

	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottplants:yavannamiresapling'},
				rarity = 20,
			},
			{
				items = {'lottplants:yavannamireleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_alias("lottmapgen:mirkleaves", "lottplants:mirkleaf")
minetest.register_node("lottplants:mirkleaf", {
	description = SL("Mirkwood Leaves"),
	drawtype = "mesh",
	mesh = "leaves_model.obj",
	tiles = {"lottplants_mirkleaf.png"},
	paramtype = "light",
	sunlight_propagates = false,
	waving = 1,
	is_ground_content = false,
	walkable=false,
		--climbable=true,
	liquid_viscosity = 8,
	liquidtype = "source",
	liquid_alternative_flowing = "lottplants:mirkleaf",
	liquid_alternative_source = "lottplants:mirkleaf",
	liquid_renewable = false,
	liquid_range = 0,

	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1, not_in_creative_inventory =1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'lottplants:mirksapling'},
				rarity = 20,
			},
			{
				items = {'lottplants:mirkleaf'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

--
-- TREE
--

-- сосна
minetest.register_node("lottplants:pinetrunk", {
	description = SL("Pine Trank"),
	tiles = {"lottplants_pinetree_top.png", "lottplants_pinetree_top.png", "lottplants_pinetree.png"},
	paramtype2 = "facedir",
    drop = "lottplants:pinetree",
	groups = {tree=1,choppy=3,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
})

minetest.register_node("lottplants:pinetree", {
	description = SL("Pine Tree"),
	tiles = {"lottplants_pinetree_top.png", "lottplants_pinetree_top.png", "lottplants_pinetree.png"},
	paramtype2 = "facedir",
	groups = {tree=1,choppy=3,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type == "node" and
			minetest.registered_nodes[minetest.get_node(pointed_thing.above).name].buildable_to == true then

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0
			local p3 = {x = p1.x, y = p1.y, z = p1.z}
			p3.y = p3.y + 1

			if minetest.is_protected(p1, placer:get_player_name()) or
			minetest.is_protected(p3, placer:get_player_name()) then
				minetest.record_protection_violation(p1, placer:get_player_name())
				return itemstack
			end

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {}
				local x = math.abs(placer_pos.x - p1.x)
				local y = math.abs(placer_pos.y - p1.y +1)  -- единичку добавляем что бы получить смещение относительно головы игрока (более реально)
				local z = math.abs(placer_pos.z - p1.z)

				if z>x then param2 = 6 else param2 = 13 end
				if y>math.max(x,z) then param2 = 0 end

				--print(tostring(x)..","..tostring(y)..","..tostring(z))
				--print(tostring(param2))
			end
			minetest.set_node(p1,{name = "lottplants:pinetrunk", param2 = param2})
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end
	end,
	on_dig = function(pos, node, digger)
		default.dig_tree(pos, node, "lottplants:pinetree", digger, 13, 2, "lottplants:pinetree")
	end,
})

-- берёза
minetest.register_node("lottplants:birchtrunk", {
	description = SL("Birch Trunk"),
	tiles = {"lottplants_birchtree_top.png", "lottplants_birchtree_top.png", "lottplants_birchtree.png"},
	paramtype2 = "facedir",
    drop = "lottplants:birchtree",
	groups = {tree=1,choppy=3,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
})

minetest.register_node("lottplants:birchtree", {
	description = SL("Birch Tree"),
	tiles = {"lottplants_birchtree_top.png", "lottplants_birchtree_top.png", "lottplants_birchtree.png"},
	paramtype2 = "facedir",
	groups = {tree=1,choppy=3,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type == "node" and
			minetest.registered_nodes[minetest.get_node(pointed_thing.above).name].buildable_to == true then

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0
			local p3 = {x = p1.x, y = p1.y, z = p1.z}
			p3.y = p3.y + 1

			if minetest.is_protected(p1, placer:get_player_name()) or
			minetest.is_protected(p3, placer:get_player_name()) then
				minetest.record_protection_violation(p1, placer:get_player_name())
				return itemstack
			end

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {}
				local x = math.abs(placer_pos.x - p1.x)
				local y = math.abs(placer_pos.y - p1.y +1)  -- единичку добавляем что бы получить смещение относительно головы игрока (более реально)
				local z = math.abs(placer_pos.z - p1.z)

				if z>x then param2 = 6 else param2 = 13 end
				if y>math.max(x,z) then param2 = 0 end

				--print(tostring(x)..","..tostring(y)..","..tostring(z))
				--print(tostring(param2))
			end
			minetest.set_node(p1,{name = "lottplants:birchtrunk", param2 = param2})
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end
	end,
	on_dig = function(pos, node, digger)
		default.dig_tree(pos, node, "lottplants:birchtree", digger, 12, 3, "lottplants:birchtree")
	end,
})

-- ольха
minetest.register_node("lottplants:aldertrunk", {
	description = SL("Alder Trunk"),
	tiles = {"lottplants_aldertree_top.png", "lottplants_aldertree_top.png", "lottplants_aldertree.png"},
	paramtype2 = "facedir",
    drop = "lottplants:aldertree",
	groups = {tree=1,choppy=2,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
})

minetest.register_node("lottplants:aldertree", {
	description = SL("Alder Tree"),
	tiles = {"lottplants_aldertree_top.png", "lottplants_aldertree_top.png", "lottplants_aldertree.png"},
	paramtype2 = "facedir",
	groups = {tree=1,choppy=2,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type == "node" and
			minetest.registered_nodes[minetest.get_node(pointed_thing.above).name].buildable_to == true then

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0
			local p3 = {x = p1.x, y = p1.y, z = p1.z}
			p3.y = p3.y + 1

			if minetest.is_protected(p1, placer:get_player_name()) or
			minetest.is_protected(p3, placer:get_player_name()) then
				minetest.record_protection_violation(p1, placer:get_player_name())
				return itemstack
			end

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {}
				local x = math.abs(placer_pos.x - p1.x)
				local y = math.abs(placer_pos.y - p1.y +1)  -- единичку добавляем что бы получить смещение относительно головы игрока (более реально)
				local z = math.abs(placer_pos.z - p1.z)

				if z>x then param2 = 6 else param2 = 13 end
				if y>math.max(x,z) then param2 = 0 end

				--print(tostring(x)..","..tostring(y)..","..tostring(z))
				--print(tostring(param2))
			end
			minetest.set_node(p1,{name = "lottplants:aldertrunk", param2 = param2})
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end
	end,
	on_dig = function(pos, node, digger)
		default.dig_tree(pos, node, "lottplants:aldertree", digger, 10, 2, "lottplants:aldertree")
	end,
})

-- лебетрон
minetest.register_node("lottplants:lebethrontrunk", {
	description = SL("Lebethron Trunk"),
	tiles = {"lottplants_lebethrontree_top.png", "lottplants_lebethrontree_top.png", "default_tree.png"},
	paramtype2 = "facedir",
    drop = "lottplants:lebethrontree",
	groups = {tree=1,choppy=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
})

minetest.register_node("lottplants:lebethrontree", {
	description = SL("Lebethron Tree"),
	tiles = {"lottplants_lebethrontree_top.png", "lottplants_lebethrontree_top.png", "default_tree.png"},
	paramtype2 = "facedir",
	groups = {tree=1,choppy=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type == "node" and
			minetest.registered_nodes[minetest.get_node(pointed_thing.above).name].buildable_to == true then

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0
			local p3 = {x = p1.x, y = p1.y, z = p1.z}
			p3.y = p3.y + 1

			if minetest.is_protected(p1, placer:get_player_name()) or
			minetest.is_protected(p3, placer:get_player_name()) then
				minetest.record_protection_violation(p1, placer:get_player_name())
				return itemstack
			end

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {}
				local x = math.abs(placer_pos.x - p1.x)
				local y = math.abs(placer_pos.y - p1.y +1)  -- единичку добавляем что бы получить смещение относительно головы игрока (более реально)
				local z = math.abs(placer_pos.z - p1.z)

				if z>x then param2 = 6 else param2 = 13 end
				if y>math.max(x,z) then param2 = 0 end

				--print(tostring(x)..","..tostring(y)..","..tostring(z))
				--print(tostring(param2))
			end
			minetest.set_node(p1,{name = "lottplants:lebethrontrunk", param2 = param2})
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end
	end,
	on_dig = function(pos, node, digger)
		default.dig_tree(pos, node, "lottplants:lebethrontree", digger, 10, 2, "lottplants:lebethrontree")
	end,
})

-- маллорн
minetest.register_node("lottplants:mallorntrunk", {
	description = SL("Mallorn Trunk"),
	tiles = {"lottplants_mallorntree_top.png", "lottplants_mallorntree_top.png", "lottplants_mallorntree.png"},
	paramtype2 = "facedir",
    drop = "lottplants:mallorntree",
	groups = {tree=1,choppy=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
})

minetest.register_node("lottplants:mallorntree", {
	description = SL("Mallorn Tree"),
	tiles = {"lottplants_mallorntree_top.png", "lottplants_mallorntree_top.png", "lottplants_mallorntree.png"},
	paramtype2 = "facedir",
	groups = {tree=1,choppy=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type == "node" and
			minetest.registered_nodes[minetest.get_node(pointed_thing.above).name].buildable_to == true then

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0
			local p3 = {x = p1.x, y = p1.y, z = p1.z}
			p3.y = p3.y + 1

			if minetest.is_protected(p1, placer:get_player_name()) or
			minetest.is_protected(p3, placer:get_player_name()) then
				minetest.record_protection_violation(p1, placer:get_player_name())
				return itemstack
			end

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {}
				local x = math.abs(placer_pos.x - p1.x)
				local y = math.abs(placer_pos.y - p1.y +1)  -- единичку добавляем что бы получить смещение относительно головы игрока (более реально)
				local z = math.abs(placer_pos.z - p1.z)

				if z>x then param2 = 6 else param2 = 13 end
				if y>math.max(x,z) then param2 = 0 end

				--print(tostring(x)..","..tostring(y)..","..tostring(z))
				--print(tostring(param2))
			end
			minetest.set_node(p1,{name = "lottplants:mallorntrunk", param2 = param2})
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end
	end,
	on_dig = function(pos, node, digger)
		default.dig_tree(pos, node, "lottplants:mallorntree", digger, 30, 5, "lottplants:mallorntree")
	end,
})

-- молодой маллорн
minetest.register_node("lottplants:mallorntrunk_young", {
	description = SL("Young Mallorn Trunk"),
	tiles = {"lottplants_mallorntree_top.png", "lottplants_mallorntree_top.png", "lottplants_mallorntree.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.1875, 0.125, 0.5, 0.1875},
			{-0.1875, -0.5, -0.125, 0.1875, 0.5, 0.125},
		},
	},
	paramtype2 = "facedir",
    drop = "lottplants:mallorntree_young",
	groups = {tree=1,choppy=1,flammable=2,fuel=1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
})

minetest.register_node("lottplants:mallorntree_young", {
	description = SL("Young Mallorn Trее"),
	tiles = {"lottplants_mallorntree_top.png", "lottplants_mallorntree_top.png", "lottplants_mallorntree.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.1875, 0.125, 0.5, 0.1875},
			{-0.1875, -0.5, -0.125, 0.1875, 0.5, 0.125},
		},
	},
	paramtype2 = "facedir",
	groups = {tree=1,choppy=1,flammable=2,fuel=1},
	sounds = default.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type == "node" and
			minetest.registered_nodes[minetest.get_node(pointed_thing.above).name].buildable_to == true then

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0
			local p3 = {x = p1.x, y = p1.y, z = p1.z}
			p3.y = p3.y + 1

			if minetest.is_protected(p1, placer:get_player_name()) or
			minetest.is_protected(p3, placer:get_player_name()) then
				minetest.record_protection_violation(p1, placer:get_player_name())
				return itemstack
			end

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {}
				local x = math.abs(placer_pos.x - p1.x)
				local y = math.abs(placer_pos.y - p1.y +1)  -- единичку добавляем что бы получить смещение относительно головы игрока (более реально)
				local z = math.abs(placer_pos.z - p1.z)

				if z>x then param2 = 6 else param2 = 13 end
				if y>math.max(x,z) then param2 = 0 end

				--print(tostring(x)..","..tostring(y)..","..tostring(z))
				--print(tostring(param2))
			end
			minetest.set_node(p1,{name = "lottplants:mallorntrunk_young", param2 = param2})
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end
	end,
	on_dig = function(pos, node, digger)
		default.dig_tree(pos, node, "lottplants:mallorntree_young", digger, 10, 1,"lottplants:mallorntree_young")
	end,
})

-- SAPLINGS

minetest.register_node("lottplants:aldersapling", {
	description = SL("Alder Sapling"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"lottplants_aldersapling.png"},
	inventory_image = "lottplants_aldersapling.png",
	wield_image = "lottplants_aldersapling.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2, sapling=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("lottplants:applesapling", {
	description = SL("Apple Tree Sapling"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"lottplants_applesapling.png"},
	inventory_image = "lottplants_applesapling.png",
	wield_image = "lottplants_applesapling.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2, sapling=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("lottplants:birchsapling", {
	description = SL("Birch Sapling"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"lottplants_birchsapling.png"},
	inventory_image = "lottplants_birchsapling.png",
	wield_image = "lottplants_birchsapling.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2, sapling=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("lottplants:beechsapling", {
	description = SL("Beech Sapling"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"lottplants_beechsapling.png"},
	inventory_image = "lottplants_beechsapling.png",
	wield_image = "lottplants_beechsapling.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2, sapling=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("lottplants:culumaldasapling", {
	description = SL("Culumalda Sapling"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"lottplants_culumaldasapling.png"},
	inventory_image = "lottplants_culumaldasapling.png",
	wield_image = "lottplants_culumaldasapling.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2, sapling=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("lottplants:elmsapling", {
	description = SL("Elm Sapling"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"lottplants_elmsapling.png"},
	inventory_image = "lottplants_elmsapling.png",
	wield_image = "lottplants_elmsapling.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2, sapling=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("lottplants:firsapling", {
	description = SL("Fir Sapling"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"lottplants_firsapling.png"},
	inventory_image = "lottplants_firsapling.png",
	wield_image = "lottplants_firsapling.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2, sapling=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("lottplants:lebethronsapling", {
	description = SL("Lebethron Sapling"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"lottplants_lebethronsapling.png"},
	inventory_image = "lottplants_lebethronsapling.png",
	wield_image = "lottplants_lebethronsapling.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2, sapling=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("lottplants:mallornsapling", {
	description = SL("Mallorn Sapling"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"lottplants_mallornsapling.png"},
	inventory_image = "lottplants_mallornsapling.png",
	wield_image = "lottplants_mallornsapling.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2, sapling=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("lottplants:pinesapling", {
	description = SL("Pine Sapling"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"lottplants_pinesapling.png"},
	inventory_image = "lottplants_pinesapling.png",
	wield_image = "lottplants_pinesapling.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2, sapling=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("lottplants:plumsapling", {
	description = SL("Plum Tree Sapling"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"lottplants_plumsapling.png"},
	inventory_image = "lottplants_plumsapling.png",
	wield_image = "lottplants_plumsapling.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2, sapling=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("lottplants:rowansapling", {
	description = SL("Rowan Sapling"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"lottplants_rowansapling.png"},
	inventory_image = "lottplants_rowansapling.png",
	wield_image = "lottplants_rowansapling.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2, sapling=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("lottplants:whitesapling", {
	description = SL("White Tree Sapling"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"lottplants_whitesapling.png"},
	inventory_image = "lottplants_whitesapling.png",
	wield_image = "lottplants_whitesapling.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2, sapling=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("lottplants:yavannamiresapling", {
	description = SL("Yavannamire Sapling"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"lottplants_yavannamiresapling.png"},
	inventory_image = "lottplants_yavannamiresapling.png",
	wield_image = "lottplants_yavannamiresapling.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2, sapling=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("lottplants:mirksapling", {
	description = SL("Mirkwood Sapling"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"lottplants_mirksapling.png"},
	inventory_image = "lottplants_mirksapling.png",
	wield_image = "lottplants_mirksapling.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2, sapling=1},
	sounds = default.node_sound_defaults(),
})

-- FRUITS

minetest.register_node("lottplants:plum", {
	description = SL("Plum"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"lottplants_plum.png"},
	inventory_image = "lottplants_plum.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {fleshy=3,dig_immediate=3,flammable=2,leafdecay=3,leafdecay_drop=1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="lottplants:plum", param2=1})
		end
	end,
})

minetest.register_node("lottplants:yavannamirefruit", {
	description = SL("Yavannamire Fruit"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"lottplants_yavannamirefruit.png"},
	inventory_image = "lottplants_yavannamirefruit.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {fleshy=3,dig_immediate=3,flammable=2,leafdecay=3,leafdecay_drop=1},
	on_use = minetest.item_eat(4),
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="lottplants:yavannamirefruit", param2=1})
		end
	end,
})

--Wood

minetest.register_node("lottplants:pinewood", {
	description = SL("Pine Planks"),
	tiles = {"lottplants_pinewood.png"},
	groups = {choppy=3,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
})

minetest.register_node("lottplants:birchwood", {
	description = SL("Birch Planks"),
	tiles = {"lottplants_birchwood.png"},
	groups = {choppy=3,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
})

minetest.register_node("lottplants:alderwood", {
	description = SL("Alder Planks"),
	tiles = {"lottplants_alderwood.png"},
	groups = {choppy=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
})

minetest.register_node("lottplants:lebethronwood", {
	description = SL("Lebethron Planks"),
	tiles = {"lottplants_lebethronwood.png"},
	groups = {choppy=1,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
})

minetest.register_node("lottplants:mallornwood", {
	description = SL("Mallorn Planks"),
	tiles = {"lottplants_mallornwood.png"},
	groups = {choppy=1,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
	paramtype2 = "facedir",
})

--Lorien grass

minetest.register_node("lottplants:lorien_grass_1", {
	description = SL("Lorien Grass"),
	drawtype = "plantlike",
	tiles = {"lottplants_lorien_grass_1.png"},
	-- use a bigger inventory image
	inventory_image = "lottplants_lorien_grass_3.png",
	wield_image = "lottplants_lorien_grass_3.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	buildable_to = true,
	groups = {snappy=3,flammable=3,flora=1,attached_node=1, grass=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("lottplants:lorien_grass_"..math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("lottplants:lorien_grass_1 "..itemstack:get_count()-(1-ret:get_count()))
	end,
})
minetest.register_node("lottplants:lorien_grass_2", {
	description = SL("Lorien Grass"),
	drawtype = "plantlike",
	tiles = {"lottplants_lorien_grass_2.png"},
	inventory_image = "lottplants_lorien_grass_2.png",
	wield_image = "lottplants_lorien_grass_2.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	is_ground_content = true,
	drop = "lottplants:lorien_grass_1",
	groups = {snappy=3,flammable=3,flora=1,attached_node=1,not_in_creative_inventory=1, grass=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})
minetest.register_node("lottplants:lorien_grass_3", {
	description = SL("Lorien Grass"),
	drawtype = "plantlike",
	tiles = {"lottplants_lorien_grass_3.png"},
	inventory_image = "lottplants_lorien_grass_3.png",
	wield_image = "lottplants_lorien_grass_3.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	is_ground_content = true,
	drop = "lottplants:lorien_grass_1",
	groups = {snappy=3,flammable=3,flora=1,attached_node=1,not_in_creative_inventory=1, grass=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})
minetest.register_node("lottplants:lorien_grass_4", {
	description = SL("Lorien Grass"),
	drawtype = "plantlike",
	tiles = {"lottplants_lorien_grass_4.png"},
	inventory_image = "lottplants_lorien_grass_4.png",
	wield_image = "lottplants_lorien_grass_4.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	is_ground_content = true,
	drop = "lottplants:lorien_grass_1",
	groups = {snappy=3,flammable=3,flora=1,attached_node=1,not_in_creative_inventory=1, grass=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})

--Stairs & Slabs

stairs.register_stair_and_slab("birchwood", "lottplants:birchwood",
		{snappy=2,choppy=3,flammable=3, wooden=1},
		{"lottplants_birchwood.png"},
		SL("Birch Wood Stair"),
		SL("Birch Wood Slab"),
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("pinewood", "lottplants:pinewood",
		{snappy=2,choppy=3,flammable=3, wooden=1},
		{"lottplants_pinewood.png"},
		SL("Pine Wood Stair"),
		SL("Pine Wood Slab"),
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("alderwood", "lottplants:alderwood",
		{snappy=2,choppy=2,flammable=3, wooden=1},
		{"lottplants_alderwood.png"},
		SL("Alder Wood Stair"),
		SL("Alder Wood Slab"),
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("lebethronwood", "lottplants:lebethronwood",
		{snappy=2,choppy=1,flammable=3, wooden=1},
		{"lottplants_lebethronwood.png"},
		SL("Lebethron Wood Stair"),
		SL("Lebethron Wood Slab"),
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("mallornwood", "lottplants:mallornwood",
		{snappy=2,choppy=1,flammable=3, wooden=1},
		{"lottplants_mallornwood.png"},
		SL("Mallorn Wood Stair"),
		SL("Mallorn Wood Slab"),
		default.node_sound_wood_defaults())



--Crafting

minetest.register_craft({
	output = 'lottplants:birchwood 4',
	recipe = {
		{'lottplants:birchtree'},
	}
})

minetest.register_craft({
	output = 'lottplants:pinewood 4',
	recipe = {
		{'lottplants:pinetree'},
	}
})

minetest.register_craft({
	output = 'lottplants:alderwood 4',
	recipe = {
		{'lottplants:aldertree'},
	}
})

minetest.register_craft({
	output = 'lottplants:lebethronwood 4',
	recipe = {
		{'lottplants:lebethrontree'},
	}
})

minetest.register_craft({
	output = 'lottplants:mallornwood 4',
	recipe = {
		{'lottplants:mallorntree'},
	}
})

minetest.register_craft({
	output = 'lottplants:mallornwood 2',
	recipe = {
		{'lottplants:mallorntree_young'},
	}
})

--Fireflies / Светлячки

minetest.register_node("lottplants:fireflies", {
	description = SL("Fireflies"),
	drawtype = "glasslike",
	tiles = {
		{
			name = "lottplants_fireflies.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2,
			},
		},
	},
	alpha = 100,
	paramtype = "light",
	light_source = 8,
	walkable = false,
	pointable = true,
	diggable = true,
	climbable = false,
	buildable_to = true,
	drop = "",
})

minetest.register_abm({
	nodenames = {"air"},
	neighbors = {
		"lottplants_elanor",
		"lottplants:niphredil",
	},
	interval = 15,
	chance = 600,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.get_timeofday() > 0.74 or minetest.get_timeofday() < 0.22 then
			--local water_nodes = minetest.find_nodes_in_area(minp, maxp, "group:water")
			--if #water_nodes > 0 then
			if minetest.find_node_near(pos, 3, "lottplants:fireflies") == nil then
				minetest.set_node(pos, {name = "lottplants:fireflies"})
			end
		end
	end,
})
