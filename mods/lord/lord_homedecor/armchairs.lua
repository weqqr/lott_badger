local SL = minetest.get_translator("lord_homedecor")

local armchair_cbox = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.5, 0.5, 0, 0.5 },
		{-0.5, -0.5, 0.4, 0.5, 0.5, 0.5 }
	}
}

for i in ipairs(lrfurn.colors) do
	local colour = lrfurn.colors[i][1]
	local hue = lrfurn.colors[i][2]

	minetest.register_node("lord_homedecor:armchair_"..colour, {
		description = SL("Armchair ("..colour..")"),
		drawtype = "mesh",
		mesh = "lrfurn_armchair.obj",
		tiles = {
			"lrfurn_bg_white.png^[colorize:"..hue.."^lrfurn_sofa_overlay.png",
			"lrfurn_sofa_bottom.png"
		},
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy=3},
		sounds = default.node_sound_wood_defaults(),
		node_box = armchair_cbox,
		on_rightclick = function(pos, node, clicker)
			if not clicker:is_player() then
				return
			end
			pos.y = pos.y-0.5
			clicker:set_pos(pos)
			clicker:set_hp(20)
		end
	})

	minetest.register_craft({
		output = "lord_homedecor:armchair_"..colour,
		recipe = {
			{"wool:"..colour, "", "", },
			{"stairs:slab_wood", "", "", },
			{"group:stick", "", "", }
		}
	})

	minetest.register_craft({
		output = "lord_homedecor:armchair_"..colour,
		recipe = {
			{"wool:"..colour, "", "", },
			{"stairs:slab_lebethronwood", "", "", },
			{"group:stick", "", "", }
		}
	})

end

if minetest.settings:get("log_mods") then
	minetest.log("action", "armchairs loaded")
end
