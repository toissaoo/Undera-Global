local config = {
	[4600] = {
		timer = 65021,
		range = 8,
		newPos = Position{33562, 31493, 8},
		bossName = 'Unaz the Mean',
		bossPos = Position(33573, 31495, 8)
	}
}

local unazzEntrance = MoveEvent()

function unazzEntrance.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local teleport = config[item.actionid]
	if not teleport then
		return
	end

	if player:getStorageValue(teleport.timer) > os.time() then
		position:sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('You have to wait to challenge this enemy again!', TALKTYPE_MONSTER_SAY)
		return true
	end

	if roomIsOccupied(teleport.bossPos, teleport.range, teleport.range) then
		position:sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
		player:say('Someone is fighting against the boss! You need wait awhile.', TALKTYPE_MONSTER_SAY)
		return true
	end
	clearRoom(teleport.bossPos, teleport.range, teleport.range, fromPosition)
	local monster = Game.createMonster(teleport.bossName, teleport.bossPos, true, true)
	if not monster then
		return true

	end
	position:sendMagicEffect(CONST_ME_TELEPORT)
	player:teleportTo(teleport.newPos)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:say(
		'You have ten minutes to kill and loot this boss. \z
		Otherwise you will lose that chance and will be kicked out.', TALKTYPE_MONSTER_SAY)
	addEvent(clearBossRoom, 60 * 10 * 2000, player.uid, monster.uid, teleport.bossPos, teleport.range, teleport.range, fromPosition)
	player:setStorageValue(teleport.timer, os.time() + 2 * 3600)
	return true
end

unazzEntrance:type("stepin")
unazzEntrance:aid(4600)
unazzEntrance:register()
