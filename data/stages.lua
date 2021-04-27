-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 8,
		multiplier = 250
	},
	{
		minlevel = 8,
		maxlevel = 50,
		multiplier = 200
	},
	{
		minlevel = 50,
		maxlevel = 80,
		multiplier = 180
	},
	{
		minlevel = 80,
		maxlevel = 130,
		multiplier = 150
	},
	{
		minlevel = 130,
		maxlevel = 180,
		multiplier = 110
	},
	{
		minlevel = 180,
		maxlevel = 220,
		multiplier = 90
	},
	{
		minlevel = 220,
		maxlevel = 260,
		multiplier = 60
	},
	{
		minlevel = 260,
		maxlevel = 310,
		multiplier = 40
	},
	{
		minlevel = 310,
		maxlevel = 330,
		multiplier = 20
	},
	{
		minlevel = 330,
		maxlevel = 450,
		multiplier = 10
	},
	{
		minlevel = 450,
		maxlevel = 550,
		multiplier = 5
	},
	{
		minlevel = 550,
		maxlevel = 600,
		multiplier = 4
	},
	{
		minlevel = 600,
		maxlevel = 700,
		multiplier = 3
	},
	{
		minlevel = 700,
		maxlevel = 750,
		multiplier = 2
	}, 
	{
		minlevel = 750,
		multiplier = 1
	}
}

skillsStages = {
	{
		minlevel = 10,
		maxlevel = 60,
		multiplier = 15
	}, {
		minlevel = 61,
		maxlevel = 80,
		multiplier = 10
	}, {
		minlevel = 81,
		maxlevel = 110,
		multiplier = 6
	}, {
		minlevel = 111,
		maxlevel = 125,
		multiplier = 4
	}, {
		minlevel = 126,
		multiplier = 2
	}
}

magicLevelStages = {
	{
		minlevel = 0,
		maxlevel = 60,
		multiplier = 10
	}, {
		minlevel = 61,
		maxlevel = 80,
		multiplier = 7
	}, {
		minlevel = 81,
		maxlevel = 100,
		multiplier = 5
	}, {
		minlevel = 101,
		maxlevel = 110,
		multiplier = 4
	}, {
		minlevel = 111,
		maxlevel = 125,
		multiplier = 3
	}, {
		minlevel = 126,
		multiplier = 2
	}
}
