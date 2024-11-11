Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\activity_head.lua")

GH_ACITIVITY_ID = 145;
GH_BUY_COST = 29;
GH_TRIGGER_ID = 1539;
GH_AC_TIMES = 8;
GH_TEAM_LIMIT = 5;

--�����������
GH_TASK_GROUP = TaskManager:Create(7, 11)
GH_TASK_GROUP.DaySeq = 1;
GH_TASK_GROUP.DayTimes = 2;
GH_TASK_GROUP.AcIndex = 3;
GH_TASK_GROUP.Trigger = 4;
GH_TASK_GROUP.AcTime = 5; 
GH_TASK_GROUP.BoxAward = 6;

function VET_201501_AddGouHuoDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(GH_ACITIVITY_ID) == 1 then
		tinsert(tbSayDialog, "K�ch ho�t L�a tr�i/Gh_Acivite")
		tinsert(tbSayDialog, "B�n C�i Kh�/Gh_Buy") 
	end
  return tbSayDialog, szSayHead 
end

function Gh_Acivite()
	gf_TeamOperateEX(GH_DailyReset);
	if GetCaptainName() ~= GetName() then
		Talk(1,"","Ch� c� ��i tr��ng m�i ���c k�ch ho�t L�a tr�i!");
		return 0;
	end
	local nCamp, nPk = GetPKFlag();
	if nCamp == 0 and nPk == 0 then
		Talk(1,"","� tr�ng th�i luy�n c�ng kh�ng ���c k�ch ho�t L�a tr�i!");
		return 0;
	end
	local nTeamSize = GetTeamSize()
	if nTeamSize < GH_TEAM_LIMIT then
		Talk(1,"",format("S� ng��i t� ��i kh�ng �� %d ng��i, kh�ng ���c k�ch ho�t L�a tr�i!", GH_TEAM_LIMIT));
		return 0;
	end
	local nMapID, nX, nY = GetWorldPos();
	if gf_MapIsAllow({100,150,200,300,350,400,500}, nMapID) == 1 then
		Talk(1,"","Kh�ng th� k�ch ho�t L�a tr�i t�i th�nh th�!");
		return 0;
	end
	if GetTime() - GH_TASK_GROUP:GetTask(GH_TASK_GROUP.AcTime) < 30*10 then
		Talk(1,"","Hi�n nay L�a tr�i ch�a k�t th�c,kh�ng th� k�ch ho�t l�i.")
		return 0;
	end
	if gf_CheckTeam(
		function ()
			if GetItemCount(2, 1, 30768) < 1 then
				return 0;
			end
			return 1;
		end, "Nh�ng ��i vi�n n�y trong t�i kh�ng c� c�i kh�, kh�ng th� k�ch ho�t L�a tr�i") ~= 1 then
			return 0;
	end
	if gf_CheckTeam(
		function ()
			if GH_TASK_GROUP:GetTask(GH_TASK_GROUP.DayTimes) >= GH_AC_TIMES then
				return 0;
			end
			return 1;
		end, format("Nh�ng ��i vi�n n�y h�m nay �� nh�n th��ng v��t qua %d l�n, kh�ng th� k�ch ho�t L�a tr�i", GH_AC_TIMES)) ~= 1 then
			return 0;
	end
	
	local nNpcIndex = CreateNpc("L�a tr�i", "L�a tr�i", nMapID, nX, nY);
	SetNpcLifeTime(nNpcIndex, 10*60);
	
	local oldPlayerIndex = PlayerIndex
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if DelItem(2, 1, 30768, 1) == 1 then
			Gh_CreateTrigger(nNpcIndex);
		end
	end
	PlayerIndex = oldPlayerIndex
	if GetCaptainName() == GetName() then
		if random(100) <= 15 then
			Gh_RandBoss();
		end
	end
	gf_Msg2Team("T� ��i �� k�ch ho�t th�nh c�ng L�a tr�i!");
end

function Gh_Buy()
	AskClientForNumber("Gh_Buy_Callback", 0, floor(GetItemCount(2, 1, 30230)/GH_BUY_COST), "H�y nh�p s� l��ng v�o", "");
end

function Gh_Buy_Callback(nNum)
	if nNum <= 0 then return end
	if gf_Judge_Room_Weight(nNum, nNum) ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 30230, nNum*GH_BUY_COST) ~= 1 then
		return 0;
	end
	gf_AddItemEx2({2, 1, 30768, nNum}, "C�i Kh�", "Ho�t ��ng ph� th�ng 1 n�m 2015", "L�a tr�i", 24*3600, 1);
end

function GH_DailyReset()
	local nDate = gf_TodayDate();
	if GH_TASK_GROUP:GetTask(GH_TASK_GROUP.DaySeq) ~= nDate then
		GH_TASK_GROUP:SetTask(GH_TASK_GROUP.DayTimes, 0);
		GH_TASK_GROUP:SetTask(GH_TASK_GROUP.BoxAward, 0);
		GH_TASK_GROUP:SetTask(GH_TASK_GROUP.DaySeq, nDate);
	end	
end

function OnTimer()
	local nStep = GH_TASK_GROUP:GetTask(GH_TASK_GROUP.Trigger);
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.Trigger, nStep + 1);
	local npcIndex = GH_TASK_GROUP:GetTask(GH_TASK_GROUP.AcIndex);
	if nStep + 1 >= 60 then
		Gh_RemoveTrigger(npcIndex)
		return 0;
	end
	if gf_GetTeamSize() < GH_TEAM_LIMIT then
		Gh_RemoveTrigger(npcIndex)
		return 0;
	end
	if GetTime() - GH_TASK_GROUP:GetTask(GH_TASK_GROUP.AcTime) >= 30*10 then
		Gh_RemoveTrigger(npcIndex)
		return 0;
	end
	local nPlayerDeathNum = 0;
	local oldPlayerIndex = PlayerIndex
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if IsPlayerDeath() == 1 then
			nPlayerDeathNum = nPlayerDeathNum + 1;
		end
	end
	PlayerIndex = oldPlayerIndex
	if nPlayerDeathNum == GetTeamSize() then
		Gh_RemoveTrigger(npcIndex)
		return 0;
	end		
	local npcMap, npcX, npcY = GetNpcWorldPos(npcIndex);
	local nMapID, nX, nY = GetWorldPos();
	if npcMap == nMapID and gf_GetDistance(npcX, npcY, nX, nY) <= 18 then
		gf_ModifyExp(750000);
	end
end

function Gh_CreateTrigger(nNpcIndex)
	local nTrigger = CreateTrigger(1, GH_TRIGGER_ID, GH_TRIGGER_ID*2);
	ContinueTimer(nTrigger);
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.DayTimes, GH_TASK_GROUP:GetTask(GH_TASK_GROUP.DayTimes)+1);
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.AcIndex, nNpcIndex);
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.Trigger, 0);
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.AcTime, GetTime());
	ForbidChangePK(1);
	SetCreateTeam(1);
end

function Gh_RemoveTrigger(npcIndex)
	RemoveTrigger(GetTrigger(GH_TRIGGER_ID*2));
	if GetNpcName(npcIndex) == "L�a tr�i" then
		SetNpcLifeTime(npcIndex, 0);
	end
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.AcIndex, 0);
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.Trigger, 0);
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.AcTime, 0)
	ForbidChangePK(0);
	SetCreateTeam(0);
end

function Gh_RandBoss()
	local tBoss = {
		{"Th� Huy�t Ma Nh�n", "shixuemoren"},
		{"C� Th�ch H�a Nh�n", "jushihuoren"},
		{"To�n Chuy�n C�n Nh�n", "xuanzhuangunren"},
		{"Thi�n Ni�n H�a K� L�n", "qiannianhuoqilin"},
		{"��i Ng� Qu�i", "dayuguai"},
		{"S�t Ph� Lang", "S�t Ph� Lang"}
	};
	local nRand = random(getn(tBoss));
	local npcBoss = CreateNpc(tBoss[nRand][2], tBoss[nRand][1], GetWorldPos());
	SetNpcLifeTime(npcBoss, 20*60);
	SetNpcDeathScript(npcBoss, "\\script\\online_activites\\201501\\gouhuo.lua");
	gf_Msg2Team(format("T� ��i %s �� chi�u g�i ra [%s] ", GetName(), tBoss[nRand][1]));
end

function OnDeath(id, f, x)
	local npcIndex = CreateNpc("jinbaoxiang", "R��ng Ho�ng Kim B�o B�i", GetNpcWorldPos(id));
	SetNpcLifeTime(npcIndex, 90);
	SetNpcTempData(npcIndex, 1, GetTeamID());
	SetNpcScript(npcIndex, "\\script\\online_activites\\201501\\gouhuo.lua");
	SetNpcLifeTime(id, 0);
end

function main()
	local npcIndex = GetTargetNpc()
	if GetNpcName(npcIndex) ~= "R��ng Ho�ng Kim B�o B�i" then
		return 0;
	end
	local nTeamID = GetTeamID();
	if GetNpcTempData(npcIndex, 1) ~= nTeamID or nTeamID == 0 then
		Talk(1,"","B�o r��ng kh�ng thu�c t� ��i c�a ng��i, kh�ng ���c nh�n th��ng!");
		return 0;
	end
	if GH_TASK_GROUP:GetTask(GH_TASK_GROUP.BoxAward) ~= 0 then
		Talk(1,"","Ng��i �� nh�n ph�n th��ng b�o r��ng, ng�y mai ��n l�i!");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	GH_TASK_GROUP:SetTask(GH_TASK_GROUP.BoxAward, 1);
	local tAward = {
		{2, 2000, 5000000, 1},
		{2, 1500, 10000000, 1},	
		{1, 1000, "B�ch C�u Ho�n", {2, 1, 270, 1, 4}, 7 * 24 * 3600},
		{1, 700, "��i B�ch C�u ho�n", {2, 1, 1007, 1, 4}, 7 * 24 * 3600},
		{1, 700, "��i Nh�n s�m", {2, 0, 553, 1, 4}, 7 * 24 * 3600},
		{1, 1000, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1, 4}, 7 * 24 * 3600},
		{1, 400, "Qu�n C�ng ��i", {2, 1, 9998, 1, 4}, 7 * 24 * 3600},
		{1, 100, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1, 4}, 7 * 24 * 3600},
		{1, 300, "Thi�n Ki�u L�nh", {2, 97, 236, 1, 4}, 0},
		{1, 1000, "B�ng th�ch", {2, 1, 149, 1}, 0},
		{1, 100, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1, 4}, 7 * 24 * 3600},
		{1, 100, "B�n Long b�ch", {2, 1, 1000, 1, 4}, 0},
		{1, 100, "Chuy�n Sinh ��n ", {2, 1, 30345, 1}, 30 * 24 * 3600},
		{1, 10, "Bao Thi�n Ki�u L�nh Nh�", {2, 95, 2086, 1}, 0},
		{31, 990, "ahf_GetLevel3JSEquip()", 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Ho�t ��ng ph� th�ng 1 n�m 2015", "L�a tr�i");
end