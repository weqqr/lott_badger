local SL = minetest.get_translator("lord_names_rules")

-- правила формирования имени
local rules = {
	{
		match = function(name)
			return #name > 2
		end,
		description = SL("Your name must contain more than 2 symbols;"),
	},
	{
		match = function(name)
			return #name < 14
		end,
		description = SL("Your name must be less than 14 symbols;"),
	},
	{
		match = function(name)
			return not string.match(name, '[^%a_-]')
		end,
		description = SL("Your name must contain letters only; '-' and '_' are also allowed;"),
	},
	{
		match = function(name)
			return string.match(name, "^[A-Z]")
		end,
		description = SL("Your name must begin with capital letters;"),
	},
}

-- возвращает true, если name удовлетворяет всем условиям, и false в противном случае
local function is_correct_name(name)
	for _, rule in pairs(rules) do
		if not rule.match(name) then
			return false
		end
	end

	return true
end

-- если игрок уже зарегистрирован, возвращает true
local function registered_player(name)
	local file = minetest.get_worldpath() .. "/players/" .. name
	return os.rename(file, file)
end

minetest.register_on_prejoinplayer(function(name, ip)
	local list_rules = ""
	for _, rule in pairs(rules) do
		list_rules = list_rules .. "\n- " .. rule.description
	end
	if not minetest.is_singleplayer() and    -- не синглплеер
			not is_correct_name(name) and    -- имя некорректное
			not registered_player(name) then -- игрок не зарегистрирован
		return "\n"..SL("Invalid character name")..list_rules
	end
end)

minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	if not minetest.is_singleplayer() and not is_correct_name(name) then -- ошибка в имени
		minetest.chat_send_player(name, SL("Invalid character name. Contact to the administration."))
	end
end)

lord.mod_loaded()
