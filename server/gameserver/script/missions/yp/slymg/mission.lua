Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\script\\missions\\yp\\slymg\\head.lua")
Import("\\script\\lib\\npccmdhead.lua")

---------------------------------------------------------
stageFight = {
	name = "tbSLYMG",
	frequency = 18*2,
	maxsecond = firePhases.maxsecond,
	actionsType = "second",	
}

function stageFight:createSomeNpc()
	local m = this.msPosition:getMapID();
	local tNpcList = {
		{"Xa phu Trung Nguy�n", "Xa phu", 1705, 3414},
		{"Xa phu", "Xa phu B�c B�", 1705, 3254},
		{"Xa phu", "Xa phu Nam B�", 1674, 3548},
		{"Xa phu", "Xa phu ��ng B�", 1803, 3396},
		{"Xa phu", "Xa phu T�y B�", 1588, 3355},
	}
	mg_CreateNpcList(tNpcList, m);
end

function stageFight.init()
	self = stageFight;
	if this.debugVersion then
		this:Msg2MSAll("B�n �� NPC...");
	end
	self:createSomeNpc();
end

function stageFight:onNpcDeath(event, data)
	self = stageFight;
--	if this.debugVersion then
--		print("stageFight:onNpcDeath",event, data)	
--		gf_PrintTable(data,2)
--	end
end

function stageFight:onNpcRemove(event, data)
	self = stageFight;
--	print("stageFight:onNpcRemove",event, data)	
--	local sNpcName = GetNpcName(data); --������npc������
--	local m = this.msPosition:getMapID();
end

function stageFight:onTalk()
	self = stageFight;
	local strNpcName = GetTargetNpcName();
	local tSay = {};
	local msg = nil;
	if strNpcName == "Xa phu" then
		msg = "T�i s� ph� tr�ch ti�p �ng c�c v�, h� tr� m�i ng��i tr� v� Th�t L�c Nhai!";
		tinsert(tSay, "B�i c�nh c�u chuy�n/mg_BgStory");
		tinsert(tSay, "Gi�i thi�u th�i gian gia nh�p/mg_TimeInfo");
		tinsert(tSay, "Gi�i thi�u n�i dung ho�t ��ng/mg_FunctionInfo");
		tinsert(tSay, format("\n Tr� v� Th�t L�c Nhai/#DelMSPlayer(%d, 0)", this.missionID));
	elseif strNpcName == "Xa phu B�c B�" then
		msg = "T�i s� ph� tr�ch h� tr� c�c v� ti�n v�o s�nh B�c ph�n �� Thi�n �m Gi�o!";
		tinsert(tSay, format("\n S�nh B�c Ph�n �� Thi�n �m/#mg_GotoLevel1(%d)", 1));
	elseif strNpcName == "Xa phu Nam B�" then
		msg = "T�i s� ph� tr�ch h� tr� c�c v� ti�n v�o s�nh Nam ph�n �� Thi�n �m Gi�o!";
		tinsert(tSay, format("\n S�nh Nam Ph�n �� Thi�n �m/#mg_GotoLevel1(%d)", 2));
	elseif strNpcName == "Xa phu ��ng B�" then
		msg = "T�i s� ph� tr�ch h� tr� c�c v� ti�n v�o s�nh ��ng ph�n �� Thi�n �m Gi�o!";
		tinsert(tSay, format("\n S�nh ��ng Ph�n �� Thi�n �m/#mg_GotoLevel1(%d)", 3));
	elseif strNpcName == "Xa phu T�y B�" then
		msg = "T�i s� ph� tr�ch h� tr� c�c v� ti�n v�o s�nh T�y ph�n �� Thi�n �m Gi�o!";
		tinsert(tSay, format("\n S�nh T�y Ph�n �� Thi�n �m/#mg_GotoLevel1(%d)", 4));
	end
	tinsert(tSay, "T�i v�n ch�a mu�n v�/nothing");
	Say(format("<color=gold>%s<color>:", strNpcName)..msg, getn(tSay), tSay);
end

function stageFight:onPlayerDeath(event, data)
	self = stageFight;
end

function stageFight:Breathe()
	self = stageFight;
	local p1 = mg_GetMissionState();
	if p1 == SLYMG_MISSION_CLOSE then return 0; end
	if GetMissionV(this.mv1) ~= p1 then SetMissionV(this.mv1, p1); end
	if p1 > SLYMG_MISSION_READY then mg_NoticePer2Min(); end
	local p2 = GetMissionV(this.mv2);
	if p1 == p2 then return 0; end
	if p1 > p2 then
		SetMissionV(this.mv2, p1);
		local tProgress = {
			[SLYMG_MISSION_READY] = self.ProgressReady,
			[SLYMG_MISSION_STEP_1] = self.ProgressStart,
			[SLYMG_MISSION_STEP_2] = self.ProgressStep1,
			[SLYMG_MISSION_STEP_3] = self.ProgressStep2,
			[SLYMG_MISSION_END] = self.ProgressStep3,
		}
		for i = p2+1, p1 do
			tProgress[i]();
		end
	else
		local msg = "Thi�n �m Gi�o Th�t L�c Nhai Ph�n �� �� s�p, c�c hi�p kh�ch �� chi�n th�ng tr� v�.";
		Msg2Global(msg);
		AddLocalNews(msg);
		mg_MapClean();
		SetMissionV(this.mv2, SLYMG_MISSION_CLOSE);
	end
end

function stageFight:ProgressReady()
	local msg = "Th�t L�c Nhai �� truy�n th�ng tin, m�t ��o �� m�, c�c hi�p kh�ch mu�n c� h�y ��n Thi�n �m Gi�o Th�t L�c Nhai ph�n �� ti�n v� Th�t L�c Nhai M�t C�c �� chu�n b�.!";
	Msg2Global(msg);
	AddLocalNews(msg);
end

function stageFight:ProgressStart()
	local msg = "M�t ��o Thi�n �m Gi�o Th�t L�c Nhai Ph�n �� �� ��ng, ch�c c�c hi�p kh�ch v�o ph�n �� c� th� tranh �o�t v�ng th�nh c�ng.";
	Msg2Global(msg);
	AddLocalNews(msg);
	mg_CreateMonster();
	mg_Func2AllPlayer(SLYMG_LEVEL_MAP1);
end

function stageFight:ProgressStep1()
	mg_CreateBoss(SLYMG_LEVEL_MAP1, SLYMG_LEVEL_BOSS1, "Gi�a ��i ���ng h�n lo�n ph�t hi�n m�t th�m t� �n n�p, kh�ng bi�t anh ta l�m c� thu�n l�i kh�ng");
end

function stageFight:ProgressStep2()
	mg_CreateBoss(SLYMG_LEVEL_MAP2, SLYMG_LEVEL_BOSS2, "Ph�n �� bi�n th�nh Tu L�c Tr��ng, xu�t hi�n ��i gi�a ��i ���ng ");
end

function stageFight:ProgressStep3()
	mg_CreateBoss(SLYMG_LEVEL_MAP3, SLYMG_LEVEL_BOSS3, "�m thanh th�m thi�t, tr��ng l�o Ti�u Nhi�m Nguy�t Thi�n �m Gi�o xu�t hi�n r�i!");
end

----------------------------------------------------------------------
stageFight = inherit(cycPhase, stageFight);

stageFight.actions = {
	[2] = stageFight.init,
}
stageFight.cycActions = {
	[5] = {
		[0] = stageFight.Breathe,
	},
}
stageFight.triggers = {
	NpcDeath = { 
		{action = stageFight.onNpcDeath},
	},
	NpcRemove = {
		{action = stageFight.onNpcRemove},
	},
	Talk = {
		{action = stageFight.onTalk},
	},
	PlayerDeath = {
		{action = stageFight.onPlayerDeath},
	},
};
----------------------------------------------------------------------
firePhases.phases = {stageFight};

function firePhases:onTimeout()
	Msg2MSAll(this.missionID, "K�t th�c �i!");
	CloseMission(this.missionID);
end

----------------------------------------------------------------------
tbSLYMG = gf_CopyInherit(missionBase, tbSLYMG);

tbSLYMG.msOption.bForbitTeam = 0; --�������
tbSLYMG.msOption.nInitFightState = nil; --ս��״̬
tbSLYMG.msOption.nRestoreFightState = nil; --ս��״̬
tbSLYMG.msOption.bRestoreTempEffect = 0; --�Ƿ������ʱ״̬
tbSLYMG.msOption.szInitDeahScript = "\\script\\missions\\yp\\slymg\\player_death.lua";

tbSLYMG.msPhases[1] = firePhases;

tbSLYMG.msPosition.entryPos = {
	{1708, 3407},
};
tbSLYMG.msPosition.exitPos = {6300, 1378, 3256};

function tbSLYMG:onLogin()
	this.msOption:setState(1);
	this.msCamp:addPlayer(this.missionID, 1);	
	SetFightState(1);
end

tbSLYMG.msOption.OnPlayerJoin = function(self, nCamp)
	mg_SetPlayerState();
end

tbSLYMG.msOption.OnPlayerLeave = function(self, nCamp)
	if this.debugVersion then
		print("tbSLYMG.msOption.OnPlayerLeave")
	end
	SetLogoutRV(0);
	SetDeathPunish(0);
	ForbidChangePK(0);
	SetPKFlag(0, 0);
	SetDeathScript("");
	RestoreAll();
	SetFightState(0);
end

this = tbSLYMG;
