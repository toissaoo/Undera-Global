local UniqueTable = {
	-- Unaz The Mean entrance
	[30014] = {
		range = 10,
		timer = 65021,
		newPos = {x = 33571, y = 31496, z = 8},
		bossName = "Unaz The Mean",
		bossPos = {x = 33571, y = 31496, z = 8}
	},
	-- Irgix The Flimsy entrance
	[30015] = {
		range = 10,
		timer = 65022,
		newPos = {x = 33467, y = 31401, z = 8},
		bossName = "Irgix The Flimsy",
		bossPos = {x = 33467, y = 31401, z = 8}
	},
	-- Vok The Freakish entrance
	[30016] = {
		range = 10,
		timer = 65023,
		newPos = {x = 33507, y = 31490, z = 9},
		bossName = "Vok The Freakish",
		bossPos = {x = 33507, y = 31490, z = 9}
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
	
	if  player:getStorageValue(setting.timer) < os.time() then
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