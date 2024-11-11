Include("\\script\\online_activites\\201505\\head.lua")
Include("\\script\\online_activites\\201505\\kill_npc_daily.lua")

--����ԭ����activity_kill_npc���Ʋ�֧�����ö��������ȡ��ָ��������ȡ����ȡ���������⣬��Ϊ�˶�ʱ���ڽ�����⡣��ǿ��֮
tbKillNpcWeekly = {}

tbKillNpcWeekly.nActivityID = 157
--tbKillNpcWeekly.tbOpenDate = {2015032300, 2015050100}����\script\online_activites\online_activites.txt������
tbKillNpcWeekly.tbTaskGroupId = {1, 21}
tbKillNpcWeekly.nAcceptTaskTaskIndex = 6 --�Ƿ���ȡ����
tbKillNpcWeekly.nGetPrizeTaskIndex = 7 --�Ƿ���ȡ����
tbKillNpcWeekly.nRetsetTaskTaskIndex = 8 --�����������
tbKillNpcWeekly.nTaskInfoTaskIndex = 9 --������Ϣ��ɱ�����

tbKillNpcWeekly.tbLogInfo = {"Ho�t ��ng 05/2015", "Ho�t ��ng 05/2015"}
tbKillNpcWeekly.tbAward = 
{
	tbFreeRoom = {1,1},
	tbCost = 
	{
		{2, 1, 30603, 299, "Ti�u Dao Ng�c"},
		{2, 1, 30825, 2000, "D�u"},
		{2, 1, 30826, 2000, "L� Tr� Xanh"},
	},
	tbPrize = 
	{
		{"Exp", 150000000},
		{2, 1, 30785, 19, "V� T� Kinh Th�"},
		{2, 1, 30830, 99, "Siro Tr�i C�y "},
	}
}

tbKillNpcWeekly.tbOpenWeek = {1,2,3,4,5,6,0}--�������������쿪��
tbKillNpcWeekly.tbTaskGroup = nil--server������ʱ�򣬸���tbTaskGroupId����
tbKillNpcWeekly.nTargetKillNpcNum = 1

tbKillNpcWeekly.tbLang = 
{
	szTaskName = "Thu th�p Siro Tr�i C�y (Cu�i tu�n)",
	szOpenDateTimeError = "Hi�n t�i kh�ng ph�i th�i gian m� t�nh n�ng, xin vui l�ng ��i.",
	szOpenWeekTimeError = "T�nh n�ng n�y ch� m� v�o %s, xin vui l�ng ��i.",
	szAcceptTask = "\nNh�n nhi�m v� %s/KillNpcWeekGetTask",
	szGetTaskPrize = "Nh�n ph�n th��ng nhi�m v�/KillNpcWeekGetAward",
	szHaveAcceptTask = "B�n �� nh�n nhi�m v� n�y r�i, h�y ti�u di�t m�t trong nh�ng BOSS sau <color=gold><enter>��o Hoa ��o Ch� Ho�ng Long: Phong Linh Ch�u,<enter>T�y V�c Th��ng Lang B� V��ng: H�a Linh Ch�u,<enter>Ng�c S�n Chi Linh Thi�n C�u: L�i Linh Ch�u,<enter>U Tr�ch Chi �nh Minh V�: �i�n Linh Ch�u<color><enter> l� c� th� ho�n th�nh nhi�m v�!<enter>N�u b�n �� ho�n th�nh r�i th� nh� nh�n ph�n th��ng nh�!",
	szAcceptTaskSuccess = "Ch�c m�ng, b�n �� nh�n nhi�m v�, h�y ti�u di�t m�t trong nh�ng con BOSS ��o Hoa ��o Ch� Ho�ng Long, T�y V�c Th��ng Lang B� V��ng, Ng�c S�n Chi Linh Thi�n C�u, U Tr�ch Chi �nh Minh V� s� c� th� ho�n th�nh nhi�m v�!",
	szNotFinishTask = "R�t ti�c, b�n v�n ch�a ho�n th�nh nhi�m v�, h�y ti�u di�t m�t trong nh�ng con BOSS <color=gold><enter>��o Hoa ��o Ch� Ho�ng Long: Phong Linh Ch�u,<enter>T�y V�c Th��ng Lang B� V��ng: H�a Linh Ch�u,<enter>Ng�c S�n Chi Linh Thi�n C�u: L�i Linh Ch�u,<enter>U Tr�ch Chi �nh Minh V�: �i�n Linh Ch�u<color><enter> s� c� th� ho�n th�nh nhi�m v�!",
	szHaveGetPrize = "B�n �� nh�n ph�n th��ng nhi�m v� n�y r�i, l�n sau h�y quay l�i.",
	szHaveGetOtherPrize = "B�n �� nh�n ph�n th��ng c�a %s, kh�ng th� nh�n ph�n th��ng nhi�m v� n�y, l�n sau h�y quay l�i!",
	szCashNotEngouh = "Ng�n l��ng kh�ng �� %d v�ng",
	szItemNotEngouh = "v�t ph�m trong t�i  %s s� l��ng kh�ng �� %d c�i",
	szNpcSelection = "Ho�n th�nh nhi�m v� ��nh BOSS (Ti�u hao 2000 D�u T�y + 2000 L� Tr� Xanh + 299 Ti�u Dao Ng�c)",
	szNpcNothing = "\nT�i ch� xem xem th�i/nothing",
	szNpcGetAwardTittle = "<color=green>%s:<color> %s mu�n nh�n ph�n th��ng g�?<enter><color=red>Ch� �: Sau khi nh�n ph�n th��ng n�y s� kh�ng th� nh�n ph�n th��ng c�a <color=gold>%s<color><color>",
	szKillNpcTip = "ti�u di�t%s %d/%d",
	szKillNpcFinishTip = "Ti�u di�t %s %d/%d (Ho�n th�nh)",
	szConfirmSelection = "��ng, ta �� suy ngh� k� r�i.",
	szConfirmTittle = "<enter><color=red>Ch� �: Sau khi nh�n ph�n th��ng n�y th� sau n�y kh�ng th� nh�n ph�n th��ng c�a <color=gold>%s<color>,<color> ��ng � nh�n kh�ng?",
}

function tbKillNpcWeekly:InitTaskGroup()
	local objTaskGroup = TaskManager:Create(self.tbTaskGroupId[1], self.tbTaskGroupId[2]);
	tbKillNpcWeekly.tbTaskGroup = objTaskGroup
end

function tbKillNpcWeekly:TryResetTaskVariant()
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
	end
end

function tbKillNpcWeekly:CheckCondition()
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

function tbKillNpcWeekly:CheckDateTime()
	local nRetCode = gf_CheckEventDateEx(self.nActivityID)
	local szError = ""
	if nRetCode ~= 1 then
		szError = self.tbLang.szOpenDateTimeError
	end
	return nRetCode, szError
end
 
function tbKillNpcWeekly:CheckWeek()
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

function tbKillNpcWeekly:GetTaskGroup()
	self:InitTaskGroup()
	return self.tbTaskGroup
end

function tbKillNpcWeekly:AcceptKillNpcTask()
	local nRetCode, szError = self:CheckCondition()
	if nRetCode == 0 then
		Talk(1, "", szError)
		print(szError)
		return
	end
	
	local taskGroup = self:GetTaskGroup()
	if not taskGroup then
		return
	end
	
	local nIsGetTask = taskGroup:GetTask(self.nAcceptTaskTaskIndex)
	if nIsGetTask ~= 0 then
		local szString = self.tbLang.szHaveAcceptTask
		Talk(1, "", szString)
		return 
	end
	taskGroup:SetTask(self.nAcceptTaskTaskIndex, 1)
	TaskTip(self.tbLang.szAcceptTaskSuccess)
end

function tbKillNpcWeekly:OnFinishKillNpcTaskCallBack()
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

function tbKillNpcWeekly:CheckGetKillNpcPrize()
	local tbAward = self.tbAward
	local tbFreeRoom = tbAward.tbFreeRoom
	local tbCost = tbAward.tbCost
	local nRetCode = 0
	
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
	
	local dailyTaskGroup = tbKillNpcDaily:GetTaskGroup()
	if not dailyTaskGroup then
		return nRetCode
	end
	
	local nHaveGetDailyPrize = dailyTaskGroup:GetTask(tbKillNpcDaily.nGetPrizeTaskIndex)
	if nHaveGetDailyPrize ~= 0 then
		local szString = format(self.tbLang.szHaveGetOtherPrize, tbKillNpcDaily.tbLang.szTaskName)
		Talk(1,"",szString)
		return nRetCode
	end
	
	local nCurCount = taskGroup:GetTask(self.nTaskInfoTaskIndex)
	local nTargetCount = self.nTargetKillNpcNum
	if nCurCount < nTargetCount then
		local szString = self.tbLang.szNotFinishTask
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

function tbKillNpcWeekly:CostKillNpcNeed()
	local tbAward = self.tbAward
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

function tbKillNpcWeekly:GivePrize()
	local tbPrize = self.tbAward.tbPrize
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

function tbKillNpcWeekly:GetKillNpcPrize()
	local nRetCode, szError = self:CheckCondition()
	if nRetCode == 0 then
		Msg2Player(szError)
		return
	end
	
	nRetCode = self:CheckGetKillNpcPrize()--��ʾ���ڲ�
	if nRetCode == 0 then
		return
	end
	
	nRetCode = self:CostKillNpcNeed()--����Ͳ���ʾ��
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
	self:GivePrize()
end

function tbKillNpcWeekly:NpcShowMainDialog(tbSay)
	if gf_CheckEventDateEx(self.nActivityID) ~= 1 then
		return
	end
	
	tinsert(tbSay, format(self.tbLang.szAcceptTask, self.tbLang.szTaskName))
	tinsert(tbSay, self.tbLang.szGetTaskPrize)
	self:TryResetTaskVariant()
end

function tbKillNpcWeekly:TriggerKillNpc(szNpcName)
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
	if nCurMapID ~= nSelfMapID then
		return
	end	
	--���ж�NPC�������ˡ������Ŀ�������
	local nTargetNpcNum = tbKillNpcWeekly.nTargetKillNpcNum
	local nCurCount = taskGroup:GetTask(tbKillNpcWeekly.nTaskInfoTaskIndex)
	local nNewCount = nCurCount + 1
	taskGroup:SetTask(tbKillNpcWeekly.nTaskInfoTaskIndex, nNewCount)
	local szString = ""
	if nNewCount >= nTargetNpcNum then
		szString = format(tbKillNpcWeekly.tbLang.szKillNpcFinishTip, szNpcName, nNewCount, nTargetNpcNum)
	else
		szString = format(tbKillNpcWeekly.tbLang.szKillNpcTip, szNpcName, nNewCount, nTargetNpcNum)
	end
	Msg2Player(szString)
--	gf_TeamOperateEX(function()
--	end)
end
-----------------------------------------------------
function KillNpcWeeklyServerStartUp()
	tbKillNpcWeekly:InitTaskGroup()
end

function KillNpcWeeklyPlayerLogin()
	tbKillNpcWeekly:TryResetTaskVariant()
end

function KillNpcWeekGetTask()
	tbKillNpcWeekly:AcceptKillNpcTask()	
end

function KillNpcWeekGetAward()
	local nRetCode = tbKillNpcWeekly:CheckGetKillNpcPrize()
	if nRetCode == 0 then
		return
	end
	local tbSay = {}
	tinsert(tbSay, format("%s/SureGetWeeklyAward", tbKillNpcWeekly.tbLang.szNpcSelection))
	tinsert(tbSay, tbKillNpcWeekly.tbLang.szNpcNothing)
	Say(format(tbKillNpcWeekly.tbLang.szNpcGetAwardTittle ,GetNpcName(GetTargetNpc()), gf_GetPlayerSexName(), tbKillNpcDaily.tbLang.szTaskName), getn(tbSay), tbSay)
end
	
function SureGetWeeklyAward(nSelectType)
	local tbSay = {}
	tinsert(tbSay,format("%s/ConfirmSureGetWeeklyAward", tbKillNpcWeekly.tbLang.szConfirmSelection))
	tinsert(tbSay, tbKillNpcDaily.tbLang.szNpcNothing)
	Say(format(tbKillNpcDaily.tbLang.szConfirmTittle ,tbKillNpcDaily.tbLang.szTaskName), getn(tbSay), tbSay)
end

function ConfirmSureGetWeeklyAward()
	tbKillNpcWeekly:GetKillNpcPrize()
end