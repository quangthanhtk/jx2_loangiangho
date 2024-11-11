
tStage03 = {
	name = "Giao di÷n k’t thÛc",
	nStageId = 0,
	maxsecond = 10,
	actionsType = "second",
	guage = {
		msg = "Giao di÷n k’t thÛc",
		time =  10,
		cyc = 0,
		id = 3,
	},
};
function tStage03:CreateNpcs()
end

function tStage03:onTimeout()
    this:Close()
end

function tStage03:OnPlayerDeath()
end

function tStage03.Init()
end

tStage03 = inherit(cycPhase, tStage03);
tStage03.actions = {
	[1] = tStage03.Init,
};
tStage03.cycActions = {
};

tStage03.triggers = {
};
