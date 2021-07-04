local SL = minetest.get_translator("lord_base_commands")

-- Эти команды были переопределены в изначальном LOTT, подключались в их `default`-мод, который они скопировали из MTG
dofile(minetest.get_modpath(minetest.get_current_modname()).."/chatcommands.lua")


local function redefinition(chatcommand, new_description)
	if minetest.chatcommands[chatcommand] then
		if new_description then
			minetest.chatcommands[chatcommand].description = SL(new_description)
		else
			minetest.chatcommands[chatcommand].description = SL(minetest.chatcommands[chatcommand].description)
		end
	end
end

redefinition("admin")
redefinition("auth_reload")
redefinition("ban")
redefinition("clearinv")
redefinition("clearobjects")
redefinition("clearpassword")
redefinition("days")
redefinition("deleteblocks")
redefinition("emergeblocks")
redefinition("fixlight")
redefinition("give")
redefinition("giveme")
redefinition("grant")
redefinition("grantme")
redefinition("help")
redefinition("kick")
redefinition("last-login")
redefinition("me")
redefinition("mods")
redefinition("msg")
redefinition("mvol")
redefinition("privs")
redefinition("pulverize")
redefinition("remove_player")
redefinition("revoke")
redefinition("rollback")
redefinition("rollback_check", "Check who has last touched a node or near it, max <seconds> ago")
redefinition("set")
redefinition("setpassword")
redefinition("shutdown")
redefinition("spawnentity")
redefinition("status")
redefinition("svol")
redefinition("teleport")
redefinition("time")
redefinition("unban")

lord.mod_loaded()
