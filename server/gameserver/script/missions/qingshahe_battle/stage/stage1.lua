
tStage01 = {
	name = "Chê ng­êi ch¬i",
	nStageId = 0,
	maxsecond = 120*60,
	actionsType = "second",
	guage = {
		msg = "Chê ng­êi ch¬i",
		time =  120*60,
		cyc = 0,
		id = 1,
	},
};
function tStage01:CreateNpcs()
end

function tStage01:onTimeout()
    self:onFinish();
end



function tStage01.Init()
	tStage01:CreateNpcs();
	InitMatch()
end

function check_player()
    local camp1 = this.msCamp:getCount(this.missionID,1)
    local camp2 = this.msCamp:getCount(this.missionID,2)
    if camp1 == QSH_CAMP_NUM and camp2 == QSH_CAMP_NUM then
        self:onFinish();
        return
    end
    local msg = format("Chê ng­êi ch¬i... §éi 1 [%d]: §éi 2 [%d]",camp1,camp2)
    Msg2SubWorld(msg)
end

tStage01 = inherit(cycPhase, tStage01);
tStage01.actions = {
	[1] = tStage01.Init,
};
tStage01.cycActions = {
		[5] = {
            [0] = check_player,
            start = 1,
		},
};

tStage01.triggers = {
	
};
