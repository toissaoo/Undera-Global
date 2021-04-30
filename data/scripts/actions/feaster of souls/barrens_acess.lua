local goPos = {x = 33876, y = 31884, z = 8}

local barrenStone = Action()
function barrenStone.onUse(creature, item, position, fromPosition, pos, target, toPosition)
    local player = creature:getPlayer()
    if not player then
        return
    end

    if player:getLevel() >= 250 then
        position:sendMagicEffect(CONST_ME_TELEPORT)
        player:teleportTo(goPos)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:sendCancelMessage('You do not have enough level.')
    end
end

barrenStone:aid(20015)
barrenStone:register()