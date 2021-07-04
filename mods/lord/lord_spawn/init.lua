local SL = minetest.get_translator("lord_spawn")

-- Some modified from: Minetest: builtin/static_spawn.lua

spawn = {}

function spawn.pos_from_conf(conf)
	local t = {}

	t.x = tonumber(string.split(minetest.settings:get(conf), ",")[1])
	t.y = tonumber(string.split(minetest.settings:get(conf), ",")[2])
	t.z = tonumber(string.split(minetest.settings:get(conf), ",")[3])

	if t.x and t.y and t.z then
		return t
	else
		return false
	end
end

function spawn.check_conf(config_setting)
	if not minetest.settings:get(config_setting) then
		minetest.log('action', "The \"" .. config_setting .. "\" setting is not set")
		return false
	end

	if not spawn.pos_from_conf(config_setting) then
		minetest.log('action', "The " .. config_setting .. " setting is invalid: \""..
				core.setting_get(config_setting).."\"")
		return false
	end
	return true
end

function spawn.put_player_at_spawn(obj, config_setting)
	if not spawn.check_conf(config_setting) then
		return false
	end

	local spawnpoint = spawn.pos_from_conf(config_setting)

	minetest.log('action', "Moving " .. obj:get_player_name() ..
			" to " .. config_setting .. " at "..
			minetest.pos_to_string(spawnpoint))

	obj:setpos(spawnpoint)

	return true
end

minetest.register_chatcommand("spawn", {
	description = SL("Teleport to Spawn"),
	func = function(name, _)
		local player = minetest.get_player_by_name(name)
		local setting = races.get_race(name).."_spawn_pos"
		if (minetest.settings:get_bool("dynamic_spawn") ~= true) or (not spawn.check_conf(setting)) then
			local ok = spawn.put_player_at_spawn(player, "common_spawn_pos")
			if ok then
				return true, SL("Teleporting to common Spawn...")
			end
		end
		if spawn.put_player_at_spawn(player, setting) then
			return true,
			SL("Teleporting to "..races.get_race(name).." Spawn...")
		end
		return false, SL("Teleport failed")
	end
})

minetest.register_chatcommand("spawn_to", {
	params = "<race>",
	privs = "server",
	description = SL("Teleport to specified Spawn"),
	func = function(name, race)
		local player = minetest.get_player_by_name(name)
		local setting = race.."_spawn_pos"
		if spawn.put_player_at_spawn(player, setting) then
			return true,
			SL("Teleporting to "..race.." Spawn...")
		end
		return false, SL("Teleport failed")
	end
})

--Halls

local function tp_to_hall(hall, obj)
	if not spawn.check_conf("hall_of_"..hall.."_pos") then
		return false
	end

	local hall_pos = spawn.pos_from_conf("hall_of_"..hall.."_pos")

	minetest.log('action', "Moving "..obj:get_player_name()..
			" to "..hall.." at "..
			minetest.pos_to_string(hall_pos))

	obj:setpos(hall_pos)

	return true
end

function spawn.register_hall(hall, desc)
	if spawn.check_conf("hall_of_"..hall.."_pos") then
		minetest.register_chatcommand(hall, {
			description = SL("Teleport to the Hall of "..desc),
			func = function(name, _)
				local ok = tp_to_hall(hall, minetest.get_player_by_name(name))
				if ok then
					return true, SL("Teleporting to Hall of "..desc.."...")
				end
			return false, SL("Teleport failed")
			end
		})
	end
end

spawn.register_hall("death", "Death")
spawn.register_hall("life", "Life")

minetest.register_on_newplayer(function(obj)
	return spawn.put_player_at_spawn(obj, "common_spawn_pos")
end)

minetest.register_on_respawnplayer(function(obj)
	local name = obj:get_player_name()
	local a
	if beds.spawn[name] == nil then
		if minetest.settings:get_bool("dynamic_spawn")
		and spawn.check_conf(races.get_race(name).."_spawn_pos") then
			a = spawn.put_player_at_spawn(obj, races.get_race(name).."_spawn_pos")
		else
			a = spawn.put_player_at_spawn(obj, "common_spawn_pos")
		end
	end
	return a
end)

if minetest.setting_getbool("msg_loading_mods") then minetest.log("action",
	minetest.get_current_modname().." mod LOADED") end
