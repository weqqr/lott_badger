local SL = lord.require_intllib()

local function register_road(name, mainMaterial, desc) -- функция регистрации всех нодов дороги

  local function table_concat(s,t) -- функция объединение таблиц
    for i, v in pairs(t) do
      s[i] = v
    end
  end

  local mn = "roads:"..name -- имя мода с материалом
  local roadName = mn.."road" -- дорога
  local borderName = mn.."border" -- бордюр
  local innerCornerBorderName = mn.."inner_corner_border" -- бордюр (внутренний угол)
  local outerCornerBorderName = mn.."outer_corner_border" -- бордюр (внешний угол)
  local stepRoadName = mn.."step_road" -- ступенька дороги
  local stepBorderName = mn.."step_border" -- ступнька с бордюром
  local borderItemName = mn.."border_item" -- бордюр(итем)

  local spGroups = {not_in_creative_inventory = 1} -- специальная группа
  table_concat(spGroups, desc.groups)

  -- textures: filling, border_x, border_z, border_top, step_border_x,
  -- step_border_z, incorn_border_top, outcorn_border_top

  minetest.register_node(roadName, {
    description = SL(desc.description.." road"),
    tiles = {"roads_"..name.."_filling.png"},
    groups = desc.groups,
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
      type = "fixed",
      fixed = {
      {-0.5, -0.5, -0.5, 0.5, 0.25, 0.5}}
    },
  })

  -- бордюр

  minetest.register_node(borderName, {
    description = SL(desc.description.." border"),
    tiles = {"roads_"..name.."_filling.png^roads_"..name.."_border_top.png",
             "roads_"..name.."_filling.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_x.png",
             "roads_"..name.."_filling.png^(roads_"..name.."_border_x.png^[transformFX)",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png"},
    groups = desc.groups,
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.25, 0.5},
            {-.5, 0.25, 0.25, 0.5, 0.5, 0.5},
        },
    },
    on_place = function(itemstack, placer, pointed_thing)
      local dir = minetest.dir_to_facedir(placer:get_look_dir())
      if dir == 0 then
        minetest.set_node(pointed_thing.above, {name=borderName})

      elseif dir == 1 then
        minetest.set_node(pointed_thing.above, {name=borderName.."A"})

      elseif dir == 2 then
        minetest.set_node(pointed_thing.above, {name=borderName.."B"})

      elseif dir == 3 then
        minetest.set_node(pointed_thing.above, {name=borderName.."C"})
      end
    end
  })

  minetest.register_node(borderName.."A", {
    description = desc.description.." border A",
    tiles = {"roads_"..name.."_filling.png^(roads_"..name.."_border_top.png^[transformR270)",
             "roads_"..name.."_filling.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png",
             "roads_"..name.."_filling.png^(roads_"..name.."_border_x.png^[transformFX)",
             "roads_"..name.."_filling.png^roads_"..name.."_border_x.png"},
    groups = spGroups,
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.25, 0.5},
            {0.25, 0.25, -0.5, 0.5, 0.5, 0.5},
        },
    },
    drop = borderName,
  })

  minetest.register_node(borderName.."B", {
    description = desc.description.." border B",
    tiles = {"roads_"..name.."_filling.png^(roads_"..name.."_border_top.png^[transformR180)",
             "roads_"..name.."_filling.png",
             "roads_"..name.."_filling.png^(roads_"..name.."_border_x.png^[transformFX)",
             "roads_"..name.."_filling.png^roads_"..name.."_border_x.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png"},
    groups = spGroups,
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.25, 0.5},
            {-0.5, 0.25, -0.5, 0.5, 0.5, -0.25},
        },
    },
    drop = borderName,
  })

  minetest.register_node(borderName.."C", {
    description = desc.description.." border C",
    tiles = {"roads_"..name.."_filling.png^(roads_"..name.."_border_top.png^[transformR90)",
             "roads_"..name.."_filling.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_x.png",
             "roads_"..name.."_filling.png^(roads_"..name.."_border_x.png^[transformFX)"},
    groups = spGroups,
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.25, 0.5},
            {-0.5, 0.25, -0.5, -0.25, 0.5, 0.5},
        },
    },
    drop = borderName,
  })

  -- внутренний угол

  minetest.register_node(innerCornerBorderName, {
    description = SL(desc.description.." inner corner border"),
    tiles = {"roads_"..name.."_filling.png^roads_"..name.."_incorn_border_top.png",
             "roads_"..name.."_filling.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png^(roads_"..name.."_border_x.png^[transformFX)",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png^roads_"..name.."_border_x.png"},
    groups = desc.groups,
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.25, 0.5},
            {-0.5, 0.25, 0.25, 0.5, 0.5, 0.5},
            {0.25, 0.25, -0.5, 0.5, 0.5, 0.25}
        },
    },
    on_place = function(itemstack, placer, pointed_thing)
      local dir = minetest.dir_to_facedir(placer:get_look_dir())
      if dir == 0 then
        minetest.set_node(pointed_thing.above, {name=innerCornerBorderName})

      elseif dir == 1 then
        minetest.set_node(pointed_thing.above, {name=innerCornerBorderName.."A"})

      elseif dir == 2 then
        minetest.set_node(pointed_thing.above, {name=innerCornerBorderName.."B"})

      elseif dir == 3 then
        minetest.set_node(pointed_thing.above, {name=innerCornerBorderName.."C"})
      end
    end
  })

  minetest.register_node(innerCornerBorderName.."A", {
    description = desc.description.." inner corner border A",
    tiles = {"roads_"..name.."_filling.png^(roads_"..name.."_incorn_border_top.png^[transformR270)",
             "roads_"..name.."_filling.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png^roads_"..name.."_border_x.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png^(roads_"..name.."_border_x.png^[transformFX)",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png"},
    groups = spGroups,
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.25, 0.5},
            {0.25, 0.25, -0.5, 0.5, 0.5, 0.5},
            {-0.5, 0.25, -0.5, 0.25, 0.5, -0.25}
        },
    },
    drop = innerCornerBorderName,
  })

  minetest.register_node(innerCornerBorderName.."B", {
    description = desc.description.." inner corner border B",
    tiles = {"roads_"..name.."_filling.png^(roads_"..name.."_incorn_border_top.png^[transformR180)",
             "roads_"..name.."_filling.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png^(roads_"..name.."_border_x.png^[transformFX)",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png^roads_"..name.."_border_x.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png"},
    groups = spGroups,
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.25, 0.5},
            {-0.5, 0.25, -0.5, 0.5, 0.5, -0.25},
            {-0.5, 0.25, -0.25, -0.25, 0.5, 0.5}
        },
    },
    drop = innerCornerBorderName,
  })

  minetest.register_node(innerCornerBorderName.."C", {
    description = desc.description.." inner corner border C",
    tiles = {"roads_"..name.."_filling.png^(roads_"..name.."_incorn_border_top.png^[transformR90)",
             "roads_"..name.."_filling.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png^roads_"..name.."_border_x.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_z.png^(roads_"..name.."_border_x.png^[transformFX)"},
    groups = spGroups,
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.25, 0.5},
            {-0.5, 0.25, -0.5, -0.25, 0.5, 0.5},
            {-0.25, 0.25, 0.25, 0.5, 0.5, 0.5}
        },
    },
    drop = innerCornerBorderName,
  })

  -- внешний угол

  minetest.register_node(outerCornerBorderName, {
    description = SL(desc.description.." outer corner border"),
    tiles = {"roads_"..name.."_filling.png^roads_"..name.."_outcorn_border_top.png",
             "roads_"..name.."_filling.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_x.png",
             "roads_"..name.."_filling.png^(roads_"..name.."_border_x.png^[transformFX)",
             "roads_"..name.."_filling.png^(roads_"..name.."_border_x.png^[transformFX)",
             "roads_"..name.."_filling.png^roads_"..name.."_border_x.png"},
    groups = desc.groups,
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.25, 0.5},
            {0.25, 0.25, 0.25, 0.5, 0.5, 0.5},
        },
    },
    on_place = function(itemstack, placer, pointed_thing)
      local dir = minetest.dir_to_facedir(placer:get_look_dir())
      if dir == 0 then
        minetest.set_node(pointed_thing.above, {name=outerCornerBorderName})

      elseif dir == 1 then
        minetest.set_node(pointed_thing.above, {name=outerCornerBorderName.."A"})

      elseif dir == 2 then
        minetest.set_node(pointed_thing.above, {name=outerCornerBorderName.."B"})

      elseif dir == 3 then
        minetest.set_node(pointed_thing.above, {name=outerCornerBorderName.."C"})
      end
    end
   })

  minetest.register_node(outerCornerBorderName.."A", {
    description = desc.description.." outer corner border A",
    tiles = {"roads_"..name.."_filling.png^(roads_"..name.."_outcorn_border_top.png^[transformR270)",
             "roads_"..name.."_filling.png",
             "roads_"..name.."_filling.png^(roads_"..name.."_border_x.png^[transformFX)",
             "roads_"..name.."_filling.png^roads_"..name.."_border_x.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_x.png",
             "roads_"..name.."_filling.png^(roads_"..name.."_border_x.png^[transformFX)"},
    groups = spGroups,
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.25, 0.5},
            {0.25, 0.25, -0.5, 0.5, 0.5, -0.25},
        },
    },
    drop = outerCornerBorderName,
   })

   minetest.register_node(outerCornerBorderName.."B", {
    description = desc.description.." outer corner border B",
    tiles = {"roads_"..name.."_filling.png^(roads_"..name.."_outcorn_border_top.png^[transformR180)",
             "roads_"..name.."_filling.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_x.png",
             "roads_"..name.."_filling.png^(roads_"..name.."_border_x.png^[transformFX)",
             "roads_"..name.."_filling.png^(roads_"..name.."_border_x.png^[transformFX)",
             "roads_"..name.."_filling.png^roads_"..name.."_border_x.png"},
    groups = spGroups,
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.25, 0.5},
            {-0.5, 0.25, -0.5, -0.25, 0.5, -0.25},
        },
    },
    drop = outerCornerBorderName,
   })

  minetest.register_node(outerCornerBorderName.."C", {
    description = desc.description.." outer corner border C",
    tiles = {"roads_"..name.."_filling.png^(roads_"..name.."_outcorn_border_top.png^[transformR90)",
             "roads_"..name.."_filling.png",
             "roads_"..name.."_filling.png^(roads_"..name.."_border_x.png^[transformFX)",
             "roads_"..name.."_filling.png^roads_"..name.."_border_x.png",
             "roads_"..name.."_filling.png^roads_"..name.."_border_x.png",
             "roads_"..name.."_filling.png^(roads_"..name.."_border_x.png^[transformFX)"},
    groups = spGroups,
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.25, 0.5},
            {-0.5, 0.25, 0.25, -0.25, 0.5, 0.5},
        },
    },
    drop = outerCornerBorderName,
   })
  -- ступенька

  minetest.register_node(stepRoadName, {
    description = SL(desc.description.." step road"),
    tiles = {"roads_"..name.."_filling.png"},
    groups = desc.groups,
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, -0.25, 0.5}
        },
    },
  })

  -- ступенька-бордюр

  minetest.register_node(stepBorderName, {
    description = SL(desc.description.." step border"),
    tiles = {"roads_"..name.."_filling.png^roads_"..name.."_border_top.png",
             "roads_"..name.."_filling.png",
             "roads_"..name.."_filling.png^roads_"..name.."_step_border_x.png",
             "roads_"..name.."_filling.png^(roads_"..name.."_step_border_x.png^[transformFX)",
             "roads_"..name.."_filling.png^roads_"..name.."_step_border_z.png"},
    groups = desc.groups,
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
            {-0.5, -0.25, 0.25, 0.5, 0, 0.5}
        },
    },
    on_place = function(itemstack, placer, pointed_thing)
      local dir = minetest.dir_to_facedir(placer:get_look_dir())
      if dir == 0 then
        minetest.set_node(pointed_thing.above, {name=stepBorderName})

      elseif dir == 1 then
        minetest.set_node(pointed_thing.above, {name=stepBorderName.."A"})

      elseif dir == 2 then
        minetest.set_node(pointed_thing.above, {name=stepBorderName.."B"})

      elseif dir == 3 then
        minetest.set_node(pointed_thing.above, {name=stepBorderName.."C"})
      end
    end
  })

  minetest.register_node(stepBorderName.."A", {
    description = desc.description.." step border A",
    tiles = {"roads_"..name.."_filling.png^(roads_"..name.."_border_top.png^[transformR270)",
             "roads_"..name.."_filling.png",
             "roads_"..name.."_filling.png^roads_"..name.."_step_border_z.png",
             "roads_"..name.."_filling.png^roads_"..name.."_step_border_z.png",
             "roads_"..name.."_filling.png^(roads_"..name.."_step_border_x.png^[transformFX)",
             "roads_"..name.."_filling.png^roads_"..name.."_step_border_x.png"},
    groups = spGroups,
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
            {0.25, -0.25, -0.5, 0.5, 0, 0.5}
        },
    },
    drop = stepBorderName,
  })

  minetest.register_node(stepBorderName.."B", {
    description = desc.description.." step border B",
    tiles = {"roads_"..name.."_filling.png^(roads_"..name.."_border_top.png^[transformR180)",
             "roads_"..name.."_filling.png",
             "roads_"..name.."_filling.png^(roads_"..name.."_step_border_x.png^[transformFX)",
             "roads_"..name.."_filling.png^roads_"..name.."_step_border_x.png",
             "roads_"..name.."_filling.png^roads_"..name.."_step_border_z.png"},
    groups = spGroups,
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
            {-0.5, -0.25, -0.5, 0.5, 0, -0.25}
        },
    },
    drop = stepBorderName,
  })

  minetest.register_node(stepBorderName.."C", {
    description = desc.description.." step border C",
    tiles = {"roads_"..name.."_filling.png^(roads_"..name.."_border_top.png^[transformR90)",
             "roads_"..name.."_filling.png",
             "roads_"..name.."_filling.png^roads_"..name.."_step_border_z.png",
             "roads_"..name.."_filling.png^roads_"..name.."_step_border_z.png",
             "roads_"..name.."_filling.png^roads_"..name.."_step_border_x.png",
             "roads_"..name.."_filling.png^(roads_"..name.."_step_border_x.png^[transformFX)"},
    groups = spGroups,
    drawtype = "nodebox",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
            {-0.5, -0.25, -0.5, -0.25, 0, 0.5}
        },
    },
    drop = stepBorderName,
  })

  -- бордюр(итем)

  minetest.register_craftitem(borderItemName, {
  description = SL(desc.description.." border"),
  inventory_image = "roads_"..name.."_border_item.png"
  })

  -- крафты

  minetest.register_craft({
    output = borderItemName.." 8",
    recipe = {{mainMaterial, mainMaterial}},
  })

  minetest.register_craft({
    output = roadName.." 8",
    recipe = {{mainMaterial, mainMaterial,mainMaterial},
              {mainMaterial, mainMaterial,mainMaterial}},
  })

  minetest.register_craft({
    output = borderName,
    recipe = {{borderItemName},
              {roadName}},
  })

  minetest.register_craft({
    output = innerCornerBorderName,
    recipe = {{borderItemName, ""},
              {roadName, borderItemName}},
  })

  minetest.register_craft({
    output = outerCornerBorderName,
    recipe = {{"", borderItemName},
              {roadName, ""}},
  })

  minetest.register_craft({
    output = stepRoadName.." 6",
    recipe = {{roadName, roadName}},
  })

  minetest.register_craft({
    output = stepBorderName,
    recipe = {{borderItemName},
              {stepRoadName}},
  })

  return true
end



register_road("stonebrick", "default:stonebrick", {description = "Stonebrick", groups = {cracky = 2}})

register_road("sandstone",  "default:sandstone", {description = "Sandstone", groups = {crumbly = 3}})
