local config = {
    [30013] = Position(33558, 31467, 9)
	
}
local requiredLevel = 250
local feasterentrance = MoveEvent()

function feasterentrance.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player and player:getLevel() <= requiredLevel then
        return true
    end

    local targetPosition = config[item.uid]
    if not targetPosition then
        return true
    end

    player:teleportTo(targetPosition)
    targetPosition:sendMagicEffect(CONST_ME_MORTAREA)
    return true
end

feasterentrance:type("stepin")

for index, value in pairs(config) do
    feasterentrance:uid(index)
end

feasterentrance:register()