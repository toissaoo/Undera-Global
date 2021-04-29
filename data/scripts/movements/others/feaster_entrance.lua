local config = {
		-- Port Hope Entrance --
    [14518] = Position(33615, 31414, 8),
	[14519] = Position(33615, 31414, 8)
	
}
local requiredLevel = 250
local feasterentrance = MoveEvent()

function feasterentrance.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player and player:getLevel() <= requiredLevel then
        return true
    end

    local targetPosition = config[item.aid]
    if not targetPosition then
        return true
    end

    player:teleportTo(targetPosition)
    targetPosition:sendMagicEffect(CONST_ME_MORTAREA)
    return true
end

feasterentrance:type("stepin")

for index, value in pairs(config) do
    feasterentrance:aid(index)
end

feasterentrance:register()