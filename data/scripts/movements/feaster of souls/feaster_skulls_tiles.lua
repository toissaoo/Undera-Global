local config = {
    [30003] = Position(33534, 31444, 8),
	[30004] = Position(33545, 31444, 8),
	[30005] = Position(33482, 31452, 9),
	[30006] = Position(33485, 31435, 8),
	[30007] = Position(33540, 31412, 9),
	[30008] = Position(33530, 31410, 9),
	[30009] = Position(33550, 31440, 9),
	[30010] = Position(33538, 31440, 9),
	[30011] = Position(33571, 31467, 9),
    [30012] = Position(33557, 31467, 9)
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
    targetPosition:sendMagicEffect(CONST_ME,206)
    return true
end

variavelName:type("stepin")

for index, value in pairs(config) do
    variavelName:uid(index)
end

variavelName:register()