-- Mob Api

dofile(minetest.get_modpath("mobs").."/materials.lua")
dofile(minetest.get_modpath("mobs").."/api.lua")
dofile(minetest.get_modpath("mobs").."/bee.lua")
dofile(minetest.get_modpath("mobs").."/tarantula.lua")
dofile(minetest.get_modpath("mobs").."/kraken.lua")
dofile(minetest.get_modpath("mobs").."/spawn.lua")

if minetest.setting_getbool("msg_loading_mods") then minetest.log("action", minetest.get_current_modname().." mod LOADED") end
