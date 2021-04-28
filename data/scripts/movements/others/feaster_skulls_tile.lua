local config = {
    [30003] = Position(33535, 31444, 8),
	[30004] = Position(33544, 31444, 8),
	[30005] = Position(33481, 31452, 9),
	[30006] = Position(33484, 31435, 8),
	[30007] = Position(33540, 31411, 9),
	[30008] = Position(33531, 31410, 9),
	[30009] = Position(33549, 31440, 9),
	[30010] = Position(33539, 31440, 9),
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