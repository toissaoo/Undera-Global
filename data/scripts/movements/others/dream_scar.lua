local config = {
    [30001] = Position(32208, 32092, 13),
    [30002] = Position(32208, 32092, 13)
}

local variavelName = MoveEvent()

function variavelName.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    local targetPosition = config[item.uid]
    if not targetPosition then
        return true
    end

    player:teleportTo(targetPosition)
    targetPosition:sendMagicEffect(CONST_ME_TELEPORT)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been teleported to Dream Scar.")
    return true
end

variavelName:type("stepin")

for index, value in pairs(config) do
    variavelName:uid(index)
end

variavelName:register()