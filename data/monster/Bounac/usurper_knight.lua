local mType = Game.createMonsterType("Usurper Knight")
local monster = {}

monster.description = "a usurper knight"
monster.experience = 6900
monster.outfit = {
	lookType = 1316,
	lookHead = 76,
	lookBody = 57,
	lookLegs = 76,
	lookFeet = 95,
	lookAddons = 1,
	lookMount = 0
}

monster.raceId = 679
monster.Bestiary = {
	class = "Human",
	race = BESTY_RACE_HUMAN,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 1,
	Locations = "Bounac, the Order of the Lion settlement."
	}

monster.health = 8200
monster.maxHealth = 8200
monster.race = "blood"
monster.corpse = 9867
monster.speed = 130
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 8
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
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
	interval = 5000,
	chance = 10,
	{text = "This town is ours now!", yell = false},
	{text = "You don't deserve Bounac!", yell = false},
	{text = "Do you really think you can stand?", yell = false}
}

monster.loot = {
	{name = "Platinum Coin", chance = 90000, maxCount = 5},
	{name = "Leather Legs", chance = 81000},
	{name = "Violet Gem", chance = 55000},
	{name = "Knight Legs", chance = 50000},
	{name = "Meat", chance = 80000, maxCount = 3},
	{name = "Lion Crest", chance = 65000},
	{name = "Lion Cloack Patch", chance = 65000},
	{name = "Great Mana Potion", chance = 39000, maxCount = 1},
	{name = "Magma Legs", chance = 30000},
	{name = "Green Gem", chance = 32000},
	{name = "Blue Gem", chance = 32000},
	{name = "Gold Ingot", chance = 32000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -500},
	{name ="usurper knight ice beam", interval = 2000, chance = 20, minDamage = -150, maxDamage = -400, target = false}
}

monster.defenses = {
	defense = 0,
	armor = 17
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 65},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 90},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 80},
	{type = COMBAT_HOLYDAMAGE , percent = 85},
	{type = COMBAT_DEATHDAMAGE , percent = -15}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
