Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")

TCT_TASK_GROUP = TaskManager:Create(10, 11) --1~5�Ƿ���ȡ��������,6����

TCT_ACTIVITY_ID = 141

function tct_IsOpen()
	if gf_CheckEventDateEx(TCT_ACTIVITY_ID) ~= 1 then
		return 0;
	end
	return 1;
end

function tct_CheckCondition()
	if gf_CheckBaseCondition(80) ~= 1 then
		return 0;
	end
	if GetJoinTongTime() <= 0 or GetTime() - GetJoinTongTime() < 7 * 24 * 3600 then
		Talk(1,"",format("%s gia nh�p bang ph�i kh�ng �� %d ng�y, kh�ng th� tham gia ho�t ��ng!", gf_GetPlayerSexName(), 7));
		return 0;
	end
	return 1;
end

function tct_create_snowman()
	if tct_IsOpen() ~= 1 then
		return 0;
	end
	local tPos = {
		{200,1379,2891},
		{350,1436,3003},
		{300,1756,3554},
		{500,1738,3150},
		{150,1710,3151},
		{100,1425,3001},
	}
	for i =1, getn(tPos) do
		if SubWorldID2Idx(tPos[i][1]) >= 0 then
			CreateNpc("shengdanxueren", "Ng��i Tuy�t Gi�ng Sinh", tPos[i][1], tPos[i][2], tPos[i][3]);
		end
	end
end

TCT_CHRISMAS_TREE = "C�y th�ng gi�o h�i"

TCT_TREE_TEMPLATE = {
	"Xmas_Tree1",	"Xmas_Tree2",	"Xmas_Tree3",	"Xmas_Tree4",	"Xmas_Tree5",
}

TCT_NPC_NAME = "%d c�p %s-%s";

function OnUse(nItem)
	if tct_IsOpen() ~= 1 then
		Talk(1,"","Ho�t ��ng �� h�t h�n!");
		return 0;
	end
	if tct_CheckCondition() ~= 1 then
		return 0;
	end
	local nDuty = GetTongDuty();
	if nDuty ~= 1 and nDuty ~= 2 and nDuty ~= 3 then
		Talk(1,"","Ch� c� bang ch�, ph� bang ch�, tr��ng l�o m�i c� th� d�ng!");
		return 0;
	end
	local nMapID = GetWorldPos();
	if gf_MapIsAllow({100,150,200,300,350,400,500},nMapID) ~= 1 then
		Talk(1,"","Ch� c� th� d�ng trong th�nh ch�nh!");
		return 0;
	end
	if IsHaveTargetNpc(TCT_CHRISMAS_TREE, 100, 1) ~= 0 then
		Talk(1,"",format("Xung quanh �� c� %s r�i, h�y ��n n�i kh�c �� trang tr�!", TCT_CHRISMAS_TREE))
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	local npcIndex = CreateNpc(TCT_TREE_TEMPLATE[1], format(TCT_NPC_NAME, 1, GetTongName(), TCT_CHRISMAS_TREE), GetWorldPos());
	SetNpcScript(npcIndex, "\\script\\online_activites\\201412\\tong_christmas_tree.lua");
	SetNpcLifeTime(npcIndex, 4 * 3600);
	SetNpcTempData(npcIndex, 1, 1);
	SetNpcTempData(npcIndex, 2, 0);
end

function main()
	if tct_IsOpen() ~= 1 then
		Talk(1,"","Ho�t ��ng �� h�t h�n!");
		return 0;
	end
	if tct_CheckCondition() ~= 1 then
		return 0;
	end
	local tSay = {
		"Trang tr� c�y th�ng/tct_decorate_tree",
		"Nh�n l�y ph�n th��ng./tct_level_award",
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say(format("<color=green>%s<color>: Ch�c %s Gi�ng Sinh vui v�!", GetNpcName(GetTargetNpc()), gf_GetPlayerSexName()), getn(tSay), tSay);
end

function tct_decorate_tree()
	local nTreePoint = 100 - GetNpcTempData(GetTargetNpc(), 2);
	local nMax = min(GetItemCount(2,1,30747), nTreePoint);
	AskClientForNumber("tct_decorate_tree_cb", 0, nMax, "H�y nh�p s� l��ng:");
end

function tct_decorate_tree_cb(nNum)
	local nMapID = GetWorldPos();
	if gf_MapIsAllow({100,150,200,300,350,400,500},nMapID) ~= 1 then
		Talk(1,"","Ch� c� th� � trong th�nh ch�nh �� trang tr�!");
		return 0;
	end
	if not nNum or nNum <= 0 then
		return 0;
	end
	if gf_Judge_Room_Weight(3, 10," ") ~= 1 then
		return 0;
	end
	if CanModifyExp(nNum*10000) ~= 1 then
			Talk(1,"", "�i�m kinh nghi�m �� ��t gi�i h�n")
			return 0
	end
	if DelItem(2,1,30747,nNum) ~= 1 then
		return 0;
	end
	local npcIndex = GetTargetNpc();
	local nTreePoint = GetNpcTempData(npcIndex, 2);
	local nPoint = nTreePoint + nNum - 100;
	local nLevel = GetNpcTempData(npcIndex, 1) + 1
	if nPoint >= 0 and nLevel <= getn(TCT_TREE_TEMPLATE) then
		local nMap, nX, nY = GetNpcWorldPos(npcIndex);
		SetNpcLifeTime(npcIndex, 0);
		local npcIdx = CreateNpc(TCT_TREE_TEMPLATE[nLevel], format(TCT_NPC_NAME, nLevel, GetTongName(), TCT_CHRISMAS_TREE), nMap, nX, nY);
		SetNpcScript(npcIdx, "\\script\\online_activites\\201412\\tong_christmas_tree.lua");
		SetNpcLifeTime(npcIdx, 4 * 3600);
		SetNpcTempData(npcIdx, 1, nLevel);
		SetNpcTempData(npcIdx, 2, nPoint);
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
		Msg2Tong(format("C�y Gi�ng Sinh Bang Ph�i �� n�ng l�n c�p %d, h�y nhanh ch�ng nh�n th��ng n�o!", nLevel));
	else
		SetNpcTempData(npcIndex, nTreePoint + nNum);
	end
	Msg2Player(format("%s �� trang tr� th�nh c�ng C�y Gi�ng Sinh Bang Ph�i %d l�n!", gf_GetPlayerSexName(), nNum));
	for i = 1, nNum do
		CustomAwardGiveGroup("Xmas_orna", 1);
	end
end

function tct_level_award()
	local tSay = {}
	local npcIndex = GetTargetNpc();
	local nLevel = GetNpcTempData(npcIndex, 1);
	local tStatus = {"�� l�nh ", "Ch�a l�nh "}
	tct_daily_reset();
	for i = 1, nLevel do
		local nAwardStatus = TCT_TASK_GROUP:GetTask(i);
		local bFinish = ((nAwardStatus ~= 0) and 1) or 2; 
		tinsert(tSay, format("Nh�n ph�n th��ng c�p %d (%s)/#tct_level_award_deal(%d)", i, tStatus[bFinish], i));
	end
	tinsert(tSay, "T�i h� ch� xem qua th�i/nothing");
	Say(format("<color=green>%s<color>: Ch�c %s Gi�ng Sinh vui v�!", GetNpcName(GetTargetNpc()), gf_GetPlayerSexName()), getn(tSay), tSay);
end

function tct_level_award_deal(nLevel)
	if TCT_TASK_GROUP:GetTask(nLevel) ~= 0 then
		Talk(1,"",format("%s �� nh�n ph�n th��ng c�p %d r�i", gf_GetPlayerSexName(), nLevel));
		return 0;
	end
	if gf_Judge_Room_Weight(3, 10," ") ~= 1 then
		return 0;
	end
	local tExp = {
		1000000,
		2000000,
		4000000,
		8000000,
		16000000,
	}
	if not tExp[nLevel] then
		return 0;
	end
	if CanModifyExp(tExp[nLevel]) ~= 1 then
			Talk(1,"", "�i�m kinh nghi�m �� ��t gi�i h�n")
			return 0
	end
	local AwardString = {
		"Xmas_tree1",
		"Xmas_tree2",
		"Xmas_tree3",
		"Xmas_tree4",
		"Xmas_tree5",
	}
	if not AwardString[nLevel] then
		return 0;
	end
	TCT_TASK_GROUP:SetTask(nLevel, 1);
	CustomAwardGiveGroup(AwardString[nLevel], 1);
end

function tct_daily_reset()
	local nDate = gf_TodayDate();
	if TCT_TASK_GROUP:GetTask(6) ~= nDate then
		for i =1, 5 do
			TCT_TASK_GROUP:SetTask(i, 0);
		end
		TCT_TASK_GROUP:SetTask(6, nDate);
	end
end