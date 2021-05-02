local mType = Game.createMonsterType("Yirkas Blue Scales")
local monster = {}

monster.description = "a yirkas blue scales"
monster.experience = 4900
monster.outfit = {
	lookType = 1196,
	lookHead = 95,
	lookBody = 95,
	lookLegs = 95,
	lookFeet = 95,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 6300
monster.maxHealth = 6300
monster.race = "blood"
monster.corpse = 39032
monster.speed = 250
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
}

monster.loot = {
	{name = "platinum coin", chance = 35000, maxCount = 9},
	{name = "ultimate health potion", chance = 25000, maxCount = 3},
	{name = "blue goanna scale", chance = 25000, maxCount = 4},
	{name = "green gem", chance = 5000},
	{name = "blue gem", chance = 5000},
	{name = "gemmed figurine", chance = 5000},
	{name = "giant sword", chance = 5000},
	{name = "gold ingot", chance = 5000},
	{name = "lizard heart", chance = 5000},
	{name = "war axe", chance = 5000},
	{name = "yirkas' egg", chance = 5000},
	{name = "alloy legs", chance = 2500},
	{name = "assassin dagger", chance = 2500},
	{name = "demon shield", chance = 2500},
	{name = "demonrage sword", chance = 2500},
	{name = "gold ring", chance = 2500},
	{name = "jade hammer", chance = 2500},
	{name = "magic plate armor", chance = 2500},
	{name = "magma legs", chance = 2500},
	{name = "ornate crossbow", chance = 2500},
	{name = "ring of green plasma", chance = 2500},
	{name = "spellbook of mind control", chance = 2500},
	{name = "spellweaver's robe", chance = 2500},
	{name = "red silk flower", chance = 1000},

}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage =-520, maxDamage = -850, condition = {type = CONDITION_POISON, totalDamage = 15, interval = 4000}},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_ENERGYDAMAGE, minDamage = -50, maxDamage = -180, range = 7, radius = 3, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYHIT, target = true},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -300, maxDamage = -490, range = 3, radius = 1, shootEffect = CONST_ANI_EARTH, effect = CONST_ME_EXPLOSIONHIT, target = true}
	}
	
	monster.defenses = {
		defense = 78,
		armor = 78,
		{name ="speed", interval = 2000, chance = 5, speedChange = 350, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000}
	}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 15},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)