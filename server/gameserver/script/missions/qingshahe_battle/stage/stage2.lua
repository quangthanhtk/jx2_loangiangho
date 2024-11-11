
tStage02 = {
	name = "§ang thi ®Êu",
	nStageId = 0,
	maxsecond = 120 * 60,
	actionsType = "second",
	guage = {
		msg = "§ang thi ®Êu",
		time =  120 * 60,
		cyc = 0,
		id = 1,
	},
};
function tStage02:onTimeout()
    self:onFinish();
end

function tStage02:OnPlayerDeath()
	tRevivePos = {
		{1529, 3397}, {1732, 3105},
	}
	local camp = GetTask(QSH_TSK_PLAYER_CAMP)
	local tPos = tRevivePos[camp]
	local fetterTime = GetReviveTime()
	SetPos(tPos[1],tPos[2])
	RevivePlayer(0)
	Msg2Player(format("B¹n ®· träng th­¬ng, cÇn nghØ ng¬i ë lÒu tr¹i %d gi©y.",fetterTime))
	CastState("state_fetter", 1, fetterTime * 18)
	CastState("state_invincibility",100 ,(fetterTime-1) * 18)
end
function tStage02.Init()
    print("stage2 init")
	-- print(format("MpID:[%d] MpIdx:[%d]",this.msPosition.getMapID(),this.msPosition.getMapIdx()))
	-- SetMissionV(this.mv6, this.msPosition:getMapID());
    -- tStage02:CreateNpcs();
end

function tStage02.CreateSaber()
	local dynamicMapid = this.msPosition:getMapID()
	CreateMinions(1,1,"qsh_jinzhansongbing","Tèng Binh",dynamicMapid)
	CreateMinions(1,2,"qsh_jinzhansongbing","Tèng Binh",dynamicMapid)
	CreateMinions(1,3,"qsh_jinzhansongbing","Tèng Binh",dynamicMapid)

	CreateMinions(2,1,"qsh_jinzhanliaobing","Liªu Binh",dynamicMapid)
	CreateMinions(2,2,"qsh_jinzhanliaobing","Liªu Binh",dynamicMapid)
	CreateMinions(2,3,"qsh_jinzhanliaobing","Liªu Binh",dynamicMapid)
end

function tStage02.CreateArcher()
	local dynamicMapid = this.msPosition:getMapID()
	CreateMinions(1,1,"qsh_yuanchengsongbing","Tèng nâ binh",dynamicMapid)
	CreateMinions(1,2,"qsh_yuanchengsongbing","Tèng nâ binh",dynamicMapid)
	CreateMinions(1,3,"qsh_yuanchengsongbing","Tèng nâ binh",dynamicMapid)

	CreateMinions(2,1,"qsh_yuanchengliaobing","Liªu Cung Binh",dynamicMapid)
	CreateMinions(2,2,"qsh_yuanchengliaobing","Liªu Cung Binh",dynamicMapid)
	CreateMinions(2,3,"qsh_yuanchengliaobing","Liªu Cung Binh",dynamicMapid)
end

-- function tStage02.onNpcDeath(event, data)
-- 	print("111")
-- 	local szName = GetNpcName(data[1]);
-- 	print("Dead"..szName)
-- end

function tStage02.CreateAllMinions()
	for i = 1, 5 do 
		tStage02:CreateSaber()
	end
	for i = 1, 2 do
		tStage02:CreateArcher()
	end
end

tStage02 = inherit(cycPhase, tStage02);
tStage02.actions = {
	[1] = tStage02.Init,
};
tStage02.cycActions = {
		-- [5] = {
        --     [0] = check_player,
        --     start = 1,
		-- },
		[40] = {
			[1] = tStage02.CreateAllMinions,
			start = 1,
		},
};

tStage02.triggers = {
	PlayerDeath = {
		{action = tStage02.OnPlayerDeath},
	},
	-- NpcDeath = {
	-- 	{action = tStage02.OnNpcDeath},
	-- },
};