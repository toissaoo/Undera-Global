local setting = {
    centerRoom = {x = 33424, y = 31472, z = 13},
    storage = Storage.GraveDanger.Azaram,
    bossPosition = {x = 33424, y = 31472, z = 13},
    kickPosition = {x = 33423, y = 31497, z = 13},
    playerTeleport = {x = 33424, y = 31466, z = 13}
}

local vlarkorthLever = Action()

-- Start Script
function vlarkorthLever.onUse(creature, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 9825 and item.actionid == 20003 then
	local clearOberonRoom = Game.getSpectators(Position(setting.centerRoom), false, false, 10, 10, 10, 10)       
	for index, spectatorcheckface in ipairs(clearOberonRoom) do
		if spectatorcheckface:isPlayer() then
			creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting against the boss! You need wait awhile.")
			return false
		end
	end	
	for index, removeOberon in ipairs(clearOberonRoom) do
		if (removeOberon:isMonster()) then
			removeOberon:remove()
		end
	end
		Game.createMonster("Lord Azaram", setting.bossPosition, false, true)
local players = {}
	for i = 0, 4 do
		local player1 = Tile({x = (Position(item:getPosition()).x - 2) + i, y = Position(item:getPosition()).y + 1, z = Position(item:getPosition()).z}):getTopCreature()
		players[#players+1] = player1
	end
		for i, player in ipairs(players) do
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			player:teleportTo(Position(setting.playerTeleport), false)
			doSendMagicEffect(player:getPosition(), CONST_ME_TELEPORT)
			setPlayerStorageValue(player,setting.storage, os.time() + 20 * 60 * 60)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have 20 minute(s) to defeat the boss.')
				addEvent(function()
					local spectatorsOberon = Game.getSpectators(Position(setting.centerRoom), false, false, 10, 10, 10, 10)
						for u = 1, #spectatorsOberon, 1 do
							if spectatorsOberon[u]:isPlayer() and (spectatorsOberon[u]:getName() == player:getName()) then
								player:teleportTo(Position(setting.kickPosition))
								player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
								player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Time is over.')
							end
						end
				end, 20 * 60 * 1000)
		end
	end
	return true
end

vlarkorthLever:aid(20003)
vlarkorthLever:register()
