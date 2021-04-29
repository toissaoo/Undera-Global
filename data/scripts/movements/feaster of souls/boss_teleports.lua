local UniqueTable = {
	-- Unazz entrance
	[4602] = {
		storage = Storage.FeasterOfSoul.Unazz,
		value = 200,
		range = 10,
		timer = Storage.FeasterOfSoul.UnazzTimer,
		newPos = {x = 33573, y = 31494, z = 8},
		bossName = "Unaz the Mean",
		bossPos = {x = 33573, y = 31494, z = 8}
	}
}

local entranceTeleport = MoveEvent()
function entranceTeleport.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local setting = UniqueTable[item.uid]
	if not setting then
		return true
	end

	if roomIsOccupied(setting.bossPos, setting.range, setting.range) then
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("Someone is fighting against the boss! You need wait a while.", TALKTYPE_MONSTER_SAY)
		return true
	end

	if player:getStorageValue(setting.timer) >= os.time() then
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("You have to wait to challenge this enemy again!", TALKTYPE_MONSTER_SAY)
		return true
	end

	if player:getStorageValue(Storage.FirstDragon.Questline) < 1 or player:getStorageValue(setting.storage) < setting.value then
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("You don't have permission to use this portal", TALKTYPE_MONSTER_SAY)
		return true
	end
	
	if player:getStorageValue(setting.storage) >= setting.value then
		local monster = Game.createMonster(setting.bossName, setting.bossPos, true, true)
		if not monster then
			return true
		end

		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(setting.newPos)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("You have ten minutes to kill and loot this boss. Otherwise you will lose that chance and will be kicked out.", TALKTYPE_MONSTER_SAY)
		player:setStorageValue(setting.timer, os.time() + 2 * 3600)
		addEvent(clearBossRoom, 60 * 30 * 1000, player.uid, monster.uid, setting.bossPos, setting.range, fromPosition)
		return true
	end
	return true
end

for index, value in pairs(UniqueTable) do
	entranceTeleport:uid(index)
end

entranceTeleport:register()