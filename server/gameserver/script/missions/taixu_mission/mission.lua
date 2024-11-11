Include("\\script\\missions\\taixu_mission\\head.lua")
Include("\\script\\lib\\floyd.lua")
Import("\\script\\lib\\npccmdhead.lua")
Include("\\settings\\static_script\\misc\\missionaward_head.lua");
Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\head.lua")

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

thisFile = "\\script\\missions\\taixu_mission\\mission.lua";


--tbTaiXu.msPosition.exitPos = {426,1535,2959};--������ʱ���ʼ��
g_tmission_name = "Th�i H� Huy�n C�nh"

function this:mission_name()
	return g_tmission_name
end


function this:stage()
	return GetMissionV(MV_STAGE)
end

stageFight0 = {
	name = "Giai �o�n chu�n b�",
	maxsecond = 10, --20��
	actionsType = "second",
	guage = {
		msg = "Giai �o�n chu�n b�",
		time = 10,
		cyc = 0,
		id = 2,
	},
};

stageFight1 = {
	name = "�i 1",
	maxsecond = 30*60, --30����
	actionsType = "second",
	guage = {
		msg = "",
		time = 30*60,
		cyc = 0,
		id = 2,
	},
};
stageFight2 = {
	name = "K�t Th�c T�t ��p",
	maxsecond = 60, --1����
	actionsType = "second",
};

stageFight0 = inherit(cycPhase, stageFight0);
stageFight1 = inherit(cycPhase, stageFight1);
stageFight2 = inherit(cycPhase, stageFight2);

nEasyBossPassNum = 75 -- ÿһ����Ҫɱ����С�ӱ�����~~

tNPCPos = 
{ 
	{ {1543,3297}, --��Ӣ��ˢ�µ�
		{1529 ,3251},{1561 ,3251},{ 1529 ,3320},{1561 ,3320},--�ӱ��������ˢ������(�����������ˢ)--�߽�
	},--����ѩ��
	{ {1625, 3300},
		{1607 ,3248},{1638 ,3248},{1607 ,3316},{1638 ,3316},
	},
	{ {1542, 3458},
		{1528 ,3409},{1557 ,3409},{1528 ,3478},{1557 ,3478},
	},
	{ {1625, 3470},
		{1610 ,3406},{1643 ,3406},{1610 ,3484},{1643 ,3484},
	},
	}

----------------------------------------------------------------------
function create_enter_exit_pos(nPlace,nMapId)
	if tEnterPos[nPlace] then
		tbTaiXu.msPosition.entryPos = {tEnterPos[nPlace],};
	end

	if tExitPos[nMapId] then
		tbTaiXu.msPosition.exitPos = tExitPos[nMapId]
	end
end


function get_route_count()
	local tRoute = {};
	local nCount = 0;
	local players = this.msCamp:reflash(0)
	local oldPlayerIdx = PlayerIndex;
	for i, p in players do
		PlayerIndex = p;
		local nRoute = GetPlayerRoute();
		if not tRoute[nRoute] then
			tRoute[nRoute] = nRoute;
			nCount = nCount + 1;
		end 
	end
	PlayerIndex = oldPlayerIdx;
	return min(nCount, 8);
end

function get_box_npc_num()
	local tNum = {1,2,3,4,5,6,7,8,};
	return tNum[get_route_count()];
end

function tbTaiXu:onLeave()
	self.msOption:restoreState();
	local m,x,y = this.msPosition:getExitPos();
	if NewWorld(m,x,y) == 1 then
		SetLogoutRV(0)	-- NewWorld�ɹ������0, ��Ϊ����п���������leave	
	end
	if GetMSPlayerCount(tbTaiXu.missionID) == 0 then
		CloseMission(tbTaiXu.missionID);
	end
end

function jump_stage_award(nCount)
	for i = 1, nCount do
		local nCurStage = 10 * i;
		-- hv_get_mission_award(HV_TAIXU);
		-- Observer:onEvent(OE_TX_Pass_Mission, {1, nCurStage});
	end
	this.msCamp:turnPlayer(0, OnAchivement, 10 * nCount);
end

function stageFight0.onInit()
	local tCurPhase = this.msPhases[1]:getCurPhase();
	
	local nJump = GetMissionV(tbTaiXu.mv6);
	local self = this.msPhases[1]
	if nJump == 1 then
		SetMissionV(self.step,   GetMissionV(self.step)   + 10 * 60 * g_nfrequency);
		SetMissionV(self.second, GetMissionV(self.second) + 10 * 60);
		SetMissionV(MV_STAGE, 40);
		this.msCamp:turnPlayer(1, StopTimeGuage, self.guage.id);
		this.msCamp:turnPlayer(1, StartTimeGuage, self.guage.msg, self.maxsecond - GetMissionV(self.second), self.guage.cyc, self.guage.id);
		this.msCamp:turnPlayer(1, jump_stage_award, 4);
		this.msCamp:turnPlayer(1, Msg2Player, "C�c h� �� ch�n Nh�y �i, th�i gian v��t �i gi�m c�n 20 ph�t.");
	elseif nJump == 2 then
		SetMissionV(this.msPhases[1].step,   GetMissionV(this.msPhases[1].step)   + 10 * 60 * g_nfrequency);
		SetMissionV(this.msPhases[1].second, GetMissionV(this.msPhases[1].second) + 10 * 60);
		SetMissionV(MV_STAGE, 60);
		this.msCamp:turnPlayer(1, StopTimeGuage, self.guage.id);
		this.msCamp:turnPlayer(1, StartTimeGuage, self.guage.msg, self.maxsecond - GetMissionV(self.second), self.guage.cyc, self.guage.id);
		this.msCamp:turnPlayer(1, jump_stage_award, 6);
		this.msCamp:turnPlayer(1, Msg2Player, "C�c h� �� ch�n Nh�y �i, th�i gian v��t �i gi�m c�n 20 ph�t.");
	end
	
	this.msCamp:turnPlayer(0,function ()
		Msg2Player("Th�i H� Huy�n C�nh s�p b�t ��u, h�y tranh th� chu�n b� s�n s�ng!");
	end)
end

function stageFight0.onTimeout()
	local tCurPhase = this.msPhases[1]:getCurPhase();
	tCurPhase:onFinish();
end

function stageFight1.create_some_npc()
	local nStage = GetMissionV(MV_STAGE);
	local nMap = GetMissionV(this.mv4);
	if nStage > getn(tNPCTemplate) or nStage <=  0 or not tNPCTemplate[nStage] then
		return 0;
	end
	if not tNPCPos[nMap] then
		return 0;
	end
	--
	this.msCamp:turnPlayer(0,Msg2Player,format("V�o �i %d/%d.",nStage,g_MaxLevel))
	local nBoxNpcNum = get_box_npc_num();--���������
	local tNpc = tNPCTemplate[nStage];-- ����"template","name"������..���� --��Ӣ�ֺ�С�ӱ�
	local tPos = tNPCPos[nMap];
	local nMaxZBNum = tNpc[1][3]; --С�ӱ�����
	local nMapId	= this.msPosition:getMapID();
	local xStart	= tPos[2][1];
	local xEnd		= tPos[3][1];
	local yStart	= tPos[2][2];
	local yEnd		= tPos[4][2];
	local x = 0;
	local y = 0;
	local nNpcIdx = 0;
	if tNpc[2] and tNpc[2][1] and tNpc[2][2] then --������Ӣ��
 		local nJYIdx = CreateNpc(tNpc[2][1],tNpc[2][2],nMapId,tPos[1][1],tPos[1][2]);  
 		SetNpcScript(nJYIdx,thisFile);
	end
	if tNpc[1] and tNpc[1][1] and tNpc[1][1] then --��С�ӱ�       
		for i = 1,nMaxZBNum do 
			x = random(xStart,xEnd)
			y = random(yStart, yEnd)     	
			nNpcIdx = CreateNpc(tNpc[1][1],tNpc[1][2],nMapId,x,y) 
			SetNpcScript(nNpcIdx,thisFile);
		end 
	end
	if nBoxNpcNum then
		for i = 1,nBoxNpcNum do 
				x = random(xStart, xEnd)
				y = random(yStart, yEnd)
				nNpcIdx = CreateNpc(tBoxNpc[1],tBoxNpc[2],nMapId,x,y);
				SetNpcScript(nNpcIdx,thisFile);
		end
	end
end

--function stageFight1.onInit()
function stageFight1.Init()
	local nStage =	GetMissionV(MV_STAGE);
	local nMap = GetMissionV(this.mv4);
	if nStage > g_MaxLevel or nStage < 0 then
		return 0;
	end
	-- logserver begin
	-- this.msCamp:turnPlayer(0, function() sendSwitchStageLog(this:name, %nStage+1, this:mission_stage()) end)
	-- logserver end
	nStage = nStage + 1;
	local nSec = GetMissionV(MV_TIMER_SECOND);
	this.msCamp:turnPlayer(0, StopTimeGuage, stageFight1.guage.id);
	stageFight1.guage.msg = format("�i %d", nStage)
	this.msCamp:turnPlayer(0, StartTimeGuage, stageFight1.guage.msg, stageFight1.maxsecond - nSec - 1, stageFight1.guage.cyc, stageFight1.guage.id);

	SetMissionV(MV_STAGE,nStage);
	SetMissionV(this.mv2,0);
	SetMissionV(this.mv3,0);
	SetMissionV(this.mv5,0);
	create_traps(nMap);
end

--����߽�
tBorders =
{
--	{{1524,3321}, {1518,3250},{1568,3321}, {1567,3241},},--����ѩ��
--	{{1606,3328}, {1605,3242},{1648,3329}, {1645,3231},},--���ϴ�ɫ
--	{{1566,3401}, {1525,2285},{1562,3489}, {1521,3490},},--���ҵ���
--	{{1648,3395}, {1604,3394},{1644,3497}, {1602,3496},},--嫺���ɳ
	{{1515,3235}, {1515,3330},{1570,3235}, {1570,3330},},--����ѩ��
	{{1600,3230}, {1600,3330},{1650,3230}, {1650,3330},},--���ϴ�ɫ
	{{1515,3395}, {1515,3495},{1570,3395}, {1570,3495},},--���ҵ���
	{{1600,3390}, {1600,3500},{1650,3390}, {1650,3500},},--嫺���ɳ
}

function create_traps(n)
		local m = this.msPosition:getMapID();
		local tBorderPoints = tBorders[n];
		local tPath = {
			"\\script\\missions\\taixu_mission\\trap\\trap1.lua",
			"\\script\\missions\\taixu_mission\\trap\\trap2.lua",
			"\\script\\missions\\taixu_mission\\trap\\trap3.lua",
			"\\script\\missions\\taixu_mission\\trap\\trap4.lua",}
		local tTraps = {
		{m, tBorderPoints[1] ,tBorderPoints[2],tPath[n]},
		{m, tBorderPoints[1] ,tBorderPoints[3],tPath[n]},
		{m, tBorderPoints[3] ,tBorderPoints[4],tPath[n]},
		{m, tBorderPoints[4] ,tBorderPoints[2],tPath[n]},
	};
	gf_CreateTraps(tTraps);
end

function onTrap(id)
	if tNPCPos[id] and tNPCPos[id][1] then
		local tPoints = tNPCPos[id][1];
		SetPos(tPoints[1],tPoints[2]);
	end
end

function taixu_confirmClose() 
	SetMissionV(MV_MISSION_STATUS,1);
	CloseMission(this.missionID);
end


--����1����ʾ����һ�أ�nStage���ľ�Ӣ�֡�
--2������һ�ص��ӱ�
--0������һ����û�����NPC
function get_boss_type(nStage,sNpcName)
	if	getn(tBossType) < nStage or not tBossType[nStage] or not tBossType[nStage][sNpcName] then
		return 0;
	end
	return tBossType[nStage][sNpcName];
end

function onNpcDeath(npcIdx, f,x)
	if GetMissionV(this.msPhases[1].curPhaseLv) >= getn(this.msPhases[1].phases) then return 0; end
	local nEasyBoss = GetMissionV(this.mv2);
	local nHardBoss = GetMissionV(this.mv3);
	local nStage = GetMissionV(MV_STAGE);
	local nIsGetAward = GetMissionV(this.mv5);
	local nBossType = get_boss_type(nStage,GetNpcName(npcIdx))
	local bShowMsg = 0;
	if 1 == nBossType then --��Ӣ��
		nHardBoss = nHardBoss + 1;
		bShowMsg = 1;
		SetMissionV(this.mv3,nHardBoss);
	elseif 2 == nBossType then --С�ӱ�
		nEasyBoss = nEasyBoss + 1;
		if mod(nEasyBoss, 5) == 0 then
			bShowMsg = 1;
		end
		SetMissionV(this.mv2,nEasyBoss);
	end
	if bShowMsg == 1 then
		this:Msg2MSAll(format("��i �� di�t qu�i (%d/%d, %d/1)", 
			nEasyBoss, nEasyBossPassNum, nHardBoss));
	end
	RemoveNpc(npcIdx)
	--print("nEasyBoss , nHardBoss = " , nEasyBoss , nHardBoss)
	if nEasyBoss >= nEasyBossPassNum and nHardBoss >= 1 and nIsGetAward == 0 then
		taixu_passStage(nStage);
	end 
end


function stageFight1:onTimeout()
	local nJump = GetMissionV(tbTaiXu.mv6);
	if nJump > 0 then
		this:Msg2MSAll("20 ph�t ch�a th� v��t �i, v��t �i k�t th�c th�t b�i!");
	else
		this:Msg2MSAll("30 ph�t ch�a th� v��t �i, v��t �i k�t th�c th�t b�i!");
	end
	WriteLog(format("[Th�i H� Huy�n C�nh] [30 ph�t ch�a th� v��t �i, v��t �i k�t th�c th�t b�i!]"));
	local m = this.msPosition:getMapID();
	ClearMapNpc(m);	
	taixu_reviveAll();
	taixu_confirmClose();
end


--��ӪΪnCamp�Ľ�ɫ����Ѫ��������
function taixu_reviveAll(nCamp)
	nCamp = nCamp or 0;
	this.msCamp:turnPlayer(nCamp,function ()
		if IsPlayerDeath() ~= 0 or GetLife() <= 1 then
			RevivePlayer(0);
		end
	end)
end

function taixu_setPos(nPosX,nPosY,nMv)
	SetPos(nPosX,nPosY);
	SetFightState(1); --ս��״̬ ����ȥ�����ʵ��������ս��״̬
end


function taixu_award(n)
	local nRouteCount = get_route_count();
	local nRoutePunish = 1
	if nRouteCount < 8 then
		nRoutePunish = 2
	end
	local baseAward = {
		exp = 25000000,	-- ����
		rep = 33,		-- ����
		shi = 33,		-- ʦ������
		zhen= 120,		-- ����
	}
	local nExpPower = 2;
	if sf2019_check_main_date() == 1 then
		baseAward.exp = baseAward.exp * 2; -- �������鷭����
		nExpPower = 3; -- ����ҩƷ������2��������3��
	end
	local nExp = floor(baseAward.exp / nRoutePunish)
	local nRep = floor(baseAward.rep / nRoutePunish)
	local nShi = floor(baseAward.shi / nRoutePunish)
	local nZhen = floor(baseAward.zhen / nRoutePunish)
	local nType, nTime, nSpeed = GetExistXclInfo()
	local nBongLaiAddRate = 0
	if nTime > 0 then
		nBongLaiAddRate = nSpeed / 100
	end
	local nNow = GetTime()
	if GetTask(TAIXU_TASKID_EXP_DRUG_TIME) >= nNow then
		nExp = nExp * (nExpPower + nBongLaiAddRate);
		if GetTask(TAIXU_TASKID_EXP_DRUG_TYPE) == 1 then
			nRep = nRep * 2;
			nShi = nShi * 2;
			nZhen = nZhen * 2;
		end
	end
	--LongDaiKa: ph�n th��ng th�i h� m�i
	--ModifyReputation(nRep,0) -- 0��ʾ����ÿ������
	--gf_Modify("Exp",nExp);
	--gf_Modify("ShiMen",nShi);
	--AwardGenuineQi(nZhen);
end

function OnAchivement(nStageId)
	local nMax = max(GetTask(TASKID_TXHJ_SPE_ACH_TASK_1), nStageId);
	SetTask(TASKID_TXHJ_SPE_ACH_TASK_1, nStageId);
	-- OnAchEvent(2, TASKID_TXHJ_SPE_ACH_TASK_1);
end

function taixu_passStage(nStage)
	--print("comeing taixu_passStage")
	local nCurStage = GetMissionV(MV_STAGE);--�ڼ���
	if nStage ~= nCurStage or nCurStage <= 0 or g_MaxLevel < nCurStage then
		WriteLog(format("[Th�i H� Huy�n C�nh] [�i Th�n B�] [nStage:%d nCurStage:%d]", tonumber(nStage), tonumber(nCurStage)));
		return 0;
	end
	
	-----------------add by wangjing-----------------
	this.msCamp:turnPlayer(0, OnAchivement, nCurStage);
	-------------------------------------------------
	--taixu_reviveAll();--�����Ѫ ����
	local nAreaType = GetMissionV(this.mv4);
	--this.msCamp:turnPlayer(0,taixu_setPos,tEnterPos[nAreaType][1],tEnterPos[nAreaType][2]);
	local m = this.msPosition:getMapID();
	ClearMapNpc(m); 
	SetMissionV(this.mv5, 1);
	--print("over	ClearMapNpc(m); ")
	this.msCamp:turnPlayer(0,taixu_award,1); --������ 
	--print("give award over")      
	if mod(nCurStage, 10) == 0 and nCurStage >= 10 then
		local stateId = nCurStage / 10
		AddRuntimeStat(68, stateId, 0, 1) --ͳ��ÿ10��ͨ���������
		if GetTeamSize() > 0 and GetTeamMember(0) == PlayerIndex then
			AddRuntimeStat(69, stateId, 0, 1) --ͳ��ÿ10��ͨ���Ķ�����
		end
	end
	
	local nOldPlayerIndex = PlayerIndex;
	PlayerIndex = GetTeamMember(0);
	WriteLog(format("[Th�i H� Huy�n C�nh] [V��t �i %d] [��i tr��ng: %s]", nCurStage, GetName()));
	PlayerIndex = nOldPlayerIndex;
--	---------------------
--	Observer:onEvent(OE_HDTTD_PASS_STAGE,nStage);
	---------------------
	local tCurPhase = this.msPhases[1]:getCurPhase();
	if tCurPhase then 
		
		this.msCamp:turnPlayer(0,
			function (nStage)
				StopTimeGuage(stageFight1.guage.id)
				FireEvent("event_mission_stage_finish", "new_taixu", nStage)
			end , 
			nCurStage);

		if nCurStage == g_MaxLevel then
			this.msCamp:turnPlayer(0, WAward.ThaiHu2_HoanThanhTatCaAi, WAward);
			this.msCamp:turnPlayer(0,Msg2Player,format("�� v��t t�t c� �i, s�p v� th�nh."))
			tCurPhase:onFinish();
		else        
			this.msPhases[1]:setPhase(2);
		end
	end
end

function check_exp_drug()
	local nNow = GetTime()
	local nLast = GetTask(TAIXU_TASKID_EXP_DRUG_TIME);
	local nType = GetTask(TAIXU_TASKID_EXP_DRUG_TYPE);
	if nLast <= nNow then
		return
	end
	Msg2Player(format("%s �ang c� hi�u l�c, Th�i H� Huy�n C�nh nh�n %s. C�n %d gi�y.",tTxExpItem[nType][2],tTxExpItem[nType][3],nLast - nNow))
end


this = tbTaiXu;


stageFight0.actions = {
	[1] = stageFight0.Init,
	[20] = stageFight0.finish,
}


stageFight1.actions = {
	[1] = stageFight1.Init,
	[5] = stageFight1.create_some_npc,
};

stageFight1.cycActions = {
	[60] = {
		[0] = check_exp_drug,
		start = 1,
	},
};


stageFight2.actions = {
	[15] = taixu_confirmClose, --ͨ�سɹ����ͳ��ؿ�
};

tbTaiXu.msOption.bSetPkFlag = 0; --����ģʽ
tbTaiXu.msOption.bSetPkCamp = 0;
tbTaiXu.msOption.szInitDeahScript = thisFile;


TaixuPhaseDriver = {
	timerID = 124, --��ʱ�� ΨһID���鿴���ñ� CH
	maxsecond = 30*60,
	guage = {
		msg = "Th�i H� Huy�n C�nh",
		time = 30*60,
		cyc = 0,
		id = 1,
	},
	phases= {
		stageFight0,
		stageFight1,
		stageFight2,
	},
};
TaixuPhaseDriver = gf_CopyInherit(phaseBase,TaixuPhaseDriver)

function TaixuPhaseDriver:setPhase(n)
	if type(n) ~= "number" then return end
	if not n or not self.phases[n] then return end
	SetMissionV(self.curPhaseLv,n);	
	local tCurPhase = self:getCurPhase();
	if tCurPhase  then
		tCurPhase:onInit(self);
	end
end

function TaixuPhaseDriver:onTimeout()
	local nJump = GetMissionV(tbTaiXu.mv6);
	if nJump > 0 then
		this:Msg2MSAll("20 ph�t ch�a th� v��t �i, v��t �i k�t th�c th�t b�i!");
	else
		this:Msg2MSAll("30 ph�t ch�a th� v��t �i, v��t �i k�t th�c th�t b�i!");
	end
	taixu_confirmClose();
end


tbTaiXu.msPhases = {
	TaixuPhaseDriver,
}


