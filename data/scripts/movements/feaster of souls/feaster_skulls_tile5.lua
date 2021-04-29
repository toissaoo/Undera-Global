local config = {
	[30011] = Position(33570, 31467, 9),
    [30012] = Position(33558, 31467, 9)
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
    targetPosition:sendMagicEffect(CONST_ME_MORTAREA)
    return true
end

variavelName:type("stepin")

for index, value in pairs(config) do
    variavelName:uid(index)
end

variavelName:register()