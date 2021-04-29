local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME,44)
combat:setArea(createCombatArea(AREA_BEAM5))

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end