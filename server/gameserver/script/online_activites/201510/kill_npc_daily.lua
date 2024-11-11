Include("\\script\\online_activites\\201510\\head.lua")
Include("\\script\\online_activites\\201510\\kill_npc_weekly.lua")
NORMAL_TYPE = 1 --��ͨ
ADVANCED_TYPE = 2 --�߼�

MAP_1 = 1
MAP_2 = 2
MAP_3 = 3

TB_MAP_ID = 
{
	[MAP_1] = 6000,
	[MAP_2] = 6100,
	[MAP_3] = 6200,
}

MAP_NUM = MAP_3

--�����������Ժ�ȫ��α�����Ӧ�ĵ�ͼ
TB_MAP_PASEUDORANDOM = {1,1,2,3,2,3,1,2,3,2,1,2,3,2,2,1,3,2,1,1,2,2,2,1,3}
TB_MAP_TOTAL_DAY = getn(TB_MAP_PASEUDORANDOM)
TB_KILL_NPC = 
{
	[MAP_1] = 
	{
        {"B�ch Linh T� T�ng Nh�n"},
        {"Ho�ng T�c Ph�n Qu�n"},
        {"Ho�ng T�c T��ng L�nh"},
        {"Tr��ng Mao T��ng"},
        {"Th�n ��n Gi�o Ch�ng"},
        {"Th�n ��n Thu�t S�"},
        {"Th�n ��n Th�ng L�nh"},
	},
	[MAP_2] = 
	{
        {"B� t�c ph�n lo�n"},
        {"Th��ng �ng"},
        {"Nguy�t ��n Gi�o Ch�ng"},
        {"Mao ng�u cao nguy�n"},
        {"D� nh�n"},
        {"Nguy�t ��n Thu�t S�"},
	},
	[MAP_3] = 
	{
        {"V� Th� Ph�n Qu�n"},
        {"Ch�t T� Ph�n Qu�n"},
        {"Tinh ��n Thu�t S�"},
        {"Tinh ��n Gi�o Ch�ng"},
	}
}
MAP_DESC = 
{
	[MAP_1] = "Thi�n Long T�",
	[MAP_2] = "Qu�nh K�t",
	[MAP_3] = "H�ng Kh�nh",
}

tbKillNpcDaily = {}

tbKillNpcDaily.nActivityID = 167
--tbKillNpcDaily.tbOpenDate = {2015032300, 2015050100}����\script\online_activites\online_activites.txt������
tbKillNpcDaily.tbTaskGroupId = {3, 19}
tbKillNpcDaily.nAcceptTaskTaskIndex = 1 --�Ƿ���ȡ����
tbKillNpcDaily.nGetPrizeTaskIndex = 2 --�Ƿ���ȡ����
tbKillNpcDaily.nRetsetTaskTaskIndex = 3 --�����������
tbKillNpcDaily.nTaskInfoTaskIndex = 4 --������Ϣ��ɱ�����
tbKillNpcDaily.nRandomMapTaskIndex = 5 --����ĵ�ͼ�Զ���ID

tbKillNpcDaily.tbLogInfo = {"Ho�t ��ng th�ng 10", "Ho�t ��ng th�ng 10"}
tbKillNpcDaily.tbAward = 
{
	[NORMAL_TYPE] = 
	{
		tbFreeRoom = {1,1},
		tbCost = 
		{
			{2, 1, 30926, 3000, "X� h��ng"},
			{2, 1, 30927, 3000, "t�i th�m"},
			{2, 1, 30603, 75, "Ti�u Dao Ng�c"},
		},
		tbPrize = 
		{
			{"Exp", 100000000},
			{2, 1, 30928, 1000, "��c bi�t t�i th�m"},
			{2, 1, 30785, 50, "V� T� Kinh Th�"},
		}
	},
	[ADVANCED_TYPE] = 
	{
		tbFreeRoom = {1,1},
		tbCost = 
		{
			{2, 1, 30926, 3000, "X� h��ng"},
			{2, 1, 30927, 3000, "t�i th�m"},
			{2, 1, 30603, 223, "Ti�u Dao Ng�c"},
		},
		tbPrize = 
		{
			{"Exp", 125000000},
			{2, 1, 30931, 50, "n��c hoa n�ng n�n"},
			{2, 1, 30785, 111, "V� T� Kinh Th�"},
		}
	}
}

tbKillNpcDaily.tbOpenWeek = {1,2,3,4,5,6,0}
tbKillNpcDaily.tbTaskGroup = nil
tbKillNpcDaily.nTargetKillNpcNum = 379

tbKillNpcDaily.tbLang = 
{
	szTaskName = "Nhi�m v� thu th�p h�ng ng�y",
	szOpenDateTimeError = "Hi�n t�i kh�ng ph�i th�i gian m� t�nh n�ng, xin vui l�ng ��i.",
	szOpenWeekTimeError = "T�nh n�ng n�y ch� m� v�o %s, xin vui l�ng ��i.",
	szAcceptTask = "\nNh�n nhi�m v� %s/KillNpcDailyGetTask",
	szGetTaskPrize = "Nh�n ph�n th��ng nhi�m v�/KillNpcDailyGetAward",
	szHaveAcceptTask = "B�n �� nh�n nhi�m v� n�y r�i, h�y ��n b�n ��<color=gold> %s <color> ti�u di�t �� s� l��ng qu�i s� ho�n th�nh nhi�m v�!<enter>N�u nh� �� ho�n th�nh th� h�y nh� nh�n th��ng nh�!",
	szAcceptTaskSuccess = "Ch�c m�ng, b�n �� nh�n nhi�m v� n�y r�i, h�y ��n b�n �� %s ti�u di�t �� s� l��ng qu�i s� ho�n th�nh nhi�m v�!",
	szNotFinishTask = "R�t ti�c, b�n v�n ch�a ho�n th�nh nhi�m v�, h�y ��n b�n �� <color=gold> %s <color> ti�u di�t �� s� l��ng qu�i s� ho�n th�nh nhi�m v�!",
	szHaveGetPrize = "B�n �� nh�n ph�n th��ng nhi�m v� n�y r�i, l�n sau h�y quay l�i.",
	szHaveGetOtherPrize = "B�n �� nh�n ph�n th��ng c�a %s, kh�ng th� nh�n ph�n th��ng nhi�m v� n�y, l�n sau h�y quay l�i!",
	szCashNotEngouh = "Ng�n l��ng kh�ng �� %d v�ng",
	szItemNotEngouh = "v�t ph�m trong t�i  %s s� l��ng kh�ng �� %d c�i",
	szNpcNormalSelection = format("Ho�n th�nh nhi�m v� th��ng(ti�u hao %d%s + %d%s + %d%s)", 
		tbKillNpcDaily.tbAward[NORMAL_TYPE].tbCost[1][4], tbKillNpcDaily.tbAward[NORMAL_TYPE].tbCost[1][5],
		tbKillNpcDaily.tbAward[NORMAL_TYPE].tbCost[2][4], tbKillNpcDaily.tbAward[NORMAL_TYPE].tbCost[2][5],
		tbKillNpcDaily.tbAward[NORMAL_TYPE].tbCost[3][4], tbKillNpcDaily.tbAward[NORMAL_TYPE].tbCost[3][5]),
	szNpcAdvanceSelection = format("Ho�n th�nh nhi�m v� cao c�p(ti�u hao %d%s + %d%s + %d%s)", 
		tbKillNpcDaily.tbAward[ADVANCED_TYPE].tbCost[1][4], tbKillNpcDaily.tbAward[ADVANCED_TYPE].tbCost[1][5],
		tbKillNpcDaily.tbAward[ADVANCED_TYPE].tbCost[2][4], tbKillNpcDaily.tbAward[ADVANCED_TYPE].tbCost[2][5],
		tbKillNpcDaily.tbAward[ADVANCED_TYPE].tbCost[3][4], tbKillNpcDaily.tbAward[ADVANCED_TYPE].tbCost[3][5]),
	szNpcNothing = "\nT�i ch� xem xem th�i/nothing",
	szNpcGetAwardTittle = "<color=green>%s:<color> %s mu�n nh�n ph�n th��ng g�?<enter><color=red>Ch� �: Sau khi nh�n ph�n th��ng n�y s� kh�ng th� nh�n ph�n th��ng c�a <color=gold>%s<color><color>",
	szKillNpcTip = "ti�u di�t%s %d/%d",
	szKillNpcFinishTip = "Ti�u di�t %s %d/%d (Ho�n th�nh)",
	szConfirmSelection = "��ng, ta �� suy ngh� k� r�i.",
	szConfirmTittle = "<enter><color=red>Ch� �: Sau khi nh�n ph�n th��ng n�y th� sau n�y kh�ng th� nh�n ph�n th��ng c�a <color=gold>%s<color>,<color> ��ng � nh�n kh�ng?",
}

function tbKillNpcDaily:InitTaskGroup()
	local objTaskGroup = TaskManager:Create(self.tbTaskGroupId[1], self.tbTaskGroupId[2]);
	tbKillNpcDaily.tbTaskGroup = objTaskGroup
end

function tbKillNpcDaily:TryResetTaskVariant()
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return
	end

	local nDaySeq = taskGroup:GetTask(self.nRetsetTaskTaskIndex)
	local nCurDaySeq = zgc_pub_day_turn()		
	if nCurDaySeq ~= nDaySeq then
		taskGroup:SetTask(self.nRetsetTaskTaskIndex, nCurDaySeq)
		taskGroup:SetTask(self.nAcceptTaskTaskIndex, 0)
		taskGroup:SetTask(self.nGetPrizeTaskIndex, 0)
		taskGroup:SetTask(self.nTaskInfoTaskIndex, 0)
		
		local nRandomMapIndex = self:GetTodayKillMapIndex()
		taskGroup:SetTask(self.nRandomMapTaskIndex, nRandomMapIndex)
	end
end

function tbKillNpcDaily:CheckCondition()
	local nRetCode,szError = self:CheckDateTime()
	if nRetCode == 0 then
		return nRetCode,szError
	end
	
	nRetCode, szError = self:CheckWeek()
	if nRetCode == 0 then
		return nRetCode,szError
	end
	
	nRetCode = 1
	szError = ""
	return nRetCode,szError
end

function tbKillNpcDaily:CheckDateTime()
	local nRetCode = gf_CheckEventDateEx(self.nActivityID)
	local szError = ""
	if nRetCode ~= 1 then
		szError = self.tbLang.szOpenDateTimeError
	end
	return nRetCode, szError
end
 
function tbKillNpcDaily:CheckWeek()
	local szString = ""
	local nRetCode = 0
	local tbOpenWeekDesc = {}
	local nCurWeek = tonumber(date("%w"))
	for nIndex, nOpenWeek in self.tbOpenWeek do
		if nCurWeek == nOpenWeek then
			nRetCode = 1
		end
		tinsert(tbOpenWeekDesc, WEEK_DESC[nOpenWeek])
	end	
	
	if nRetCode == 0 then
		local szNotOpenWeek = join(tbOpenWeekDesc, ",")
		szString = format(self.tbLang.szOpenWeekTimeError, szNotOpenWeek)
	end
	return nRetCode, szString
end

function tbKillNpcDaily:GetTaskGroup()
	self:InitTaskGroup()
	return self.tbTaskGroup
end

function tbKillNpcDaily:GetTodayKillMapIndex()
	local nCurDaySeq = zgc_pub_day_turn()		
	local nTodayMapID = mod(nCurDaySeq, TB_MAP_TOTAL_DAY) + 1
	local nResult = TB_MAP_PASEUDORANDOM[nTodayMapID]
	return nResult
end

function tbKillNpcDaily:AcceptKillNpcTask()
	local nRetCode, szError = self:CheckCondition()
	if nRetCode == 0 then
		Talk(1, "", szError)
		return
	end
	
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return
	end
	
	local nIsGetTask = taskGroup:GetTask(self.nAcceptTaskTaskIndex)
	local nRandomMapID = taskGroup:GetTask(self.nRandomMapTaskIndex)
	if nIsGetTask ~= 0 and nRandomMapID ~= 0 then
		local szMapName = MAP_DESC[nRandomMapID]
		local szString = format(self.tbLang.szHaveAcceptTask, szMapName)
		Talk(1, "", szString)
		return 
	end
	
	taskGroup:SetTask(self.nAcceptTaskTaskIndex, 1)
	local nRandomMapIndex = self:GetTodayKillMapIndex()
	taskGroup:SetTask(self.nAcceptTaskTaskIndex, nRandomMapIndex)
	local szMapName = MAP_DESC[nRandomMapIndex]
	local szString = format(self.tbLang.szAcceptTaskSuccess, szMapName)
	TaskTip(szString)
end

function tbKillNpcDaily:OnFinishKillNpcTaskCallBack()
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return
	end
	
	local nIsGetTask = taskGroup:GetTask(self.nAcceptTaskTaskIndex)
	if nIsGetTask == 0 then
		return
	end
	
	taskGroup:SetTask(self.nAcceptTaskTaskIndex, 1)
	
	local nPlayerIndexBak = PlayerIndex
	--��ԱҲҪ���
	local nTeamSize = GetTeamSize()
	for nIndex=1, nTeamSize do
		PlayerIndex = GetTeamMember(nIndex)
		local nMemberIsGetTask = taskGroup:GetTask(self.nAcceptTaskTaskIndex)
		if nMemberIsGetTask ~= 0 then
			taskGroup:SetTask(self.nAcceptTaskTaskIndex, 1)
		end
	end
	PlayerIndex = nPlayerIndexBak
end

function tbKillNpcDaily:CheckGetKillNpcPrize(nSelectType)
	local nRetCode = 0
	nSelectType = nSelectType or NORMAL_TYPE
	local tbAward = self.tbAward[nSelectType]
	if not tbAward then
		return nRetCode
	end
	
	local tbFreeRoom = tbAward.tbFreeRoom
	local tbCost = tbAward.tbCost
	
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return nRetCode
	end
	
	local nGetPrize = taskGroup:GetTask(self.nGetPrizeTaskIndex)
	if nGetPrize ~= 0 then
		local szString = self.tbLang.szHaveGetPrize
		Talk(1,"",szString)
		return nRetCode
	end
	
	local weekTaskGroup = tbKillNpcWeekly:GetTaskGroup()
	if not weekTaskGroup then
		return nRetCode
	end
	
	local nHaveGetWeeklyPrize = weekTaskGroup:GetTask(tbKillNpcWeekly.nGetPrizeTaskIndex)
	if nHaveGetWeeklyPrize ~= 0 then
		local szString = format(self.tbLang.szHaveGetOtherPrize, tbKillNpcWeekly.tbLang.szTaskName)
		Talk(1,"",szString)
		return nRetCode
	end
	
	local nCurCount = taskGroup:GetTask(self.nTaskInfoTaskIndex)
	local nTargetCount = self.nTargetKillNpcNum
	local nRandomMapIndex = taskGroup:GetTask(self.nRandomMapTaskIndex)
	if nCurCount < nTargetCount and nRandomMapIndex ~= 0 then
		local szMapName = MAP_DESC[nRandomMapIndex]
		local szString = format(self.tbLang.szNotFinishTask, szMapName)
		Talk(1,"",szString)
		return nRetCode
	end
	
	if gf_Judge_Room_Weight(tbFreeRoom[1], tbFreeRoom[2], " ") ~= 1 then
		return nRetCode
	end	
	
	for k, v in tbCost do
		if getn(v) == 1 then
			if GetCash() < v[1] then
				Talk(1,"",format(self.tbLang.szCashNotEngouh, ceil(v[1] / 10000)))
				return nRetCode
			end
		end
		if getn(v) == 5 then
			if GetItemCount(v[1], v[2], v[3]) < v[4] then
				Talk(1,"",format(self.tbLang.szItemNotEngouh, v[5], v[4]))
				return nRetCode
			end
		end
	end

	nRetCode = 1
	return nRetCode
end

function tbKillNpcDaily:CostKillNpcNeed(nSelectType)
	nSelectType = nSelectType or NORMAL_TYPE
	local tbAward = self.tbAward[nSelectType]
	if not tbAward then
		return
	end
	
	local tbFreeRoom = tbAward.tbFreeRoom
	local tbCost = tbAward.tbCost
	local nRetCode = 1

	for k, v in tbCost do
		if getn(v) == 1 then
			if Pay(v[1]) ~= 1 then
				nRetCode = 0
				break
			end
		end
		if getn(v) == 5 then
			if DelItem(v[1], v[2], v[3], v[4]) ~= 1 then
				nRetCode = 0
				break
			end
		end
	end
	
	return nRetCode
end

function tbKillNpcDaily:GivePrize(nSelectType)
	nSelectType = nSelectType or NORMAL_TYPE
	local tbAward = self.tbAward[nSelectType]
	if not tbAward then
		return
	end
	local tbPrize = tbAward.tbPrize
	for nIndex, tbAwardDetail in tbPrize do
		local nParamCount = getn(tbAwardDetail)
		if nParamCount == 2 then
			local szAwardKey = tbAwardDetail[1]
			local nAwardValue = tbAwardDetail[2]
			if szAwardKey == "Exp" then
				gf_Modify("Exp", nAwardValue);
			end
		elseif nParamCount == 5 then
			gf_AddItemEx2({tbAwardDetail[1], tbAwardDetail[2], tbAwardDetail[3], tbAwardDetail[4]},tbAwardDetail[5], self.tbLogInfo[1], self.tbLogInfo[2], 0, 1)
		end
	end
end

function tbKillNpcDaily:GetKillNpcPrize(nSelectType)
	nSelectType = nSelectType or NORMAL_TYPE
	local nRetCode, szError = self:CheckCondition()
	if nRetCode == 0 then
		Msg2Player(szError)
		return
	end
	
	nRetCode = self:CheckGetKillNpcPrize(nSelectType)--��ʾ���ڲ�
	if nRetCode == 0 then
		return
	end
	
	nRetCode = self:CostKillNpcNeed(nSelectType)--����Ͳ���ʾ��
	if nRetCode == 0 then
		return
	end
	
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return
	end
	
	local nIsGetPrize = taskGroup:GetTask(self.nGetPrizeTaskIndex)
	if nIsGetPrize ~= 0 then
		local szString = self.tbLang.szHaveGetPrize
		Msg2Player(szString)
		return 
	end
	
	taskGroup:SetTask(self.nGetPrizeTaskIndex, 1)
	self:GivePrize(nSelectType)
end

function tbKillNpcDaily:NpcShowMainDialog(tbSay)
	if gf_CheckEventDateEx(self.nActivityID) ~= 1 then
		return
	end
	
	tinsert(tbSay, format(self.tbLang.szAcceptTask, self.tbLang.szTaskName))
	tinsert(tbSay, self.tbLang.szGetTaskPrize)
	self:TryResetTaskVariant()
end


function tbKillNpcDaily:TriggerKillNpc(szNpcName)
	if gf_CheckEventDateEx(self.nActivityID) ~= 1 then
		return
	end
	self:TryResetTaskVariant()
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return 
	end
	
	local nAcceptTask = taskGroup:GetTask(self.nAcceptTaskTaskIndex)
	if nAcceptTask == 0 then
		return
	end
	
	local nCurMapID, nCurMapX, nCurMapY = GetWorldPos()
	--��Ҫ�Զ������ �������������Ƕ�ÿ���˴�����
	local nSelfMapID, nSelfMapX, nSelfMapY = GetWorldPos()
	if nCurMapID ~= nSelfMapID then --��Ա����ͬһ����ͼ
		return
	end	
	--��ָ����ͼ
	local nTargetMapIndex = taskGroup:GetTask(tbKillNpcDaily.nRandomMapTaskIndex)
	local nTargetMapID = TB_MAP_ID[nTargetMapIndex]
	if nSelfMapID ~= nTargetMapID then
		return
	end
	local nCurCountTaskInfo = taskGroup:GetTask(tbKillNpcDaily.nTaskInfoTaskIndex)
	local tbTargetMapNpcInfo = TB_KILL_NPC[nTargetMapIndex]
	
	for nIndex, tbConfig in tbTargetMapNpcInfo do
		local szTargetNpcName = unpack(tbConfig)
		if strfind(szNpcName, szTargetNpcName) ~= nil then
			local nNewCount = nCurCountTaskInfo + 1
			taskGroup:SetTask(tbKillNpcDaily.nTaskInfoTaskIndex, nNewCount)
			local nTargetNum = tbKillNpcDaily.nTargetKillNpcNum
			local szString = ""
			if nNewCount >= tbKillNpcDaily.nTargetKillNpcNum then
				szString = format(tbKillNpcDaily.tbLang.szKillNpcFinishTip, szTargetNpcName, nNewCount, nTargetNum)
			else
				szString = format(tbKillNpcDaily.tbLang.szKillNpcTip, szTargetNpcName, nNewCount, nTargetNum)
			end
			Msg2Player(szString)
		end
	end
--	gf_TeamOperateEX(function () --�հ������������������ⲿ������Ҫ��%
--	end)
end
-----------------------------------------------------
function KillNpcDailyServerStartUp()
	tbKillNpcDaily:InitTaskGroup()
end

function KillNpcDailyPlayerLogin()
	tbKillNpcDaily:TryResetTaskVariant()
end

function KillNpcDailyGetTask()
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	tbKillNpcDaily:AcceptKillNpcTask()	
end

function KillNpcDailyGetAward()
--	local nRetCode = tbKillNpcDaily:CheckGetKillNpcPrize()
--	if nRetCode == 0 then
--		return
--	end
	local tbSay = {}
	tinsert(tbSay, format("%s/#SureGetDailyAward(%d)", tbKillNpcDaily.tbLang.szNpcNormalSelection, NORMAL_TYPE))
	tinsert(tbSay, format("%s/#SureGetDailyAward(%d)", tbKillNpcDaily.tbLang.szNpcAdvanceSelection, ADVANCED_TYPE))
	tinsert(tbSay, tbKillNpcDaily.tbLang.szNpcNothing)
	Say(format(tbKillNpcDaily.tbLang.szNpcGetAwardTittle ,GetNpcName(GetTargetNpc()), gf_GetPlayerSexName(), tbKillNpcWeekly.tbLang.szTaskName), getn(tbSay), tbSay)
end
	
function SureGetDailyAward(nSelectType)
	local tbSay = {}
	tinsert(tbSay,format("%s/#ConfirmSureGetDailyAward(%d)", tbKillNpcDaily.tbLang.szConfirmSelection, nSelectType))
	tinsert(tbSay, tbKillNpcDaily.tbLang.szNpcNothing)
	Say(format(tbKillNpcDaily.tbLang.szConfirmTittle ,tbKillNpcWeekly.tbLang.szTaskName), getn(tbSay), tbSay)
end

function ConfirmSureGetDailyAward(nSelectType)
	tbKillNpcDaily:GetKillNpcPrize(nSelectType)
end
