local SL = minetest.get_translator("lord_base_privs")

minetest.register_privilege("interact",		SL("Can interact with things and modify the world"))
minetest.register_privilege("teleport",		SL("Can use /teleport command"))
minetest.register_privilege("bring",		SL("Can teleport other players"))
minetest.register_privilege("settime",		SL("Can use /time"))
minetest.register_privilege("privs",		SL("Can modify privileges"))
minetest.register_privilege("basic_privs",	SL("Can modify 'shout' and 'interact' privileges"))
minetest.register_privilege("server",		SL("Can do server maintenance stuff"))
minetest.register_privilege("shout",		SL("Can speak in chat"))
minetest.register_privilege("ban",			SL("Can ban and unban players"))
minetest.register_privilege("kick",			SL("Can kick players"))
minetest.register_privilege("give",			SL("Can use /give and /giveme"))
minetest.register_privilege("password",		SL("Can use /setpassword and /clearpassword"))
minetest.register_privilege("rollback",		SL("Can use the rollback functionality"))
minetest.register_privilege("fly", {
	description = SL("Can fly using the free_move mode"),
	give_to_singleplayer = false,
})
minetest.register_privilege("fast", {
	description = SL("Can walk fast using the fast_move mode"),
	give_to_singleplayer = false,
})
minetest.register_privilege("noclip", {
	description = SL("Can fly through walls"),
	give_to_singleplayer = false,
})

lord.mod_loaded()
