Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\lib\\define.lua");
Include("\\script\\lib\\sdb.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\lib\\date.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Import("\\script\\task\\global_task\\gtask_data.lua");
Include("\\script\\online_activites\\award.lua")

--�������----------------------------------------
function scCheckLevel()
	-- if GetLevel() < 80 then
	-- 	return 0
	-- end
	-- return 1
	Talk(1,"","<color=red>T�nh n�ng �� ��ng, h�y qu� tr�ng t�i kho�n c�a m�nh ,��ng l�m nh�ng vi�c vi ph�m!<color>")
	return 0
end

function scCheckTask()
	-- if tGtTask:check_task() ~= 1 then
	-- 	return 0
	-- end
	-- if tGtTask:_CheckRoomWeight("3;50") ~= 1 then
	-- 	return 0
	-- end
	-- return 1
	Talk(1,"","<color=red>T�nh n�ng �� ��ng, h�y qu� tr�ng t�i kho�n c�a m�nh ,��ng l�m nh�ng vi�c vi ph�m!<color>")
	return 0
end

--ÿ��Ͷ������Ҫ����-----------------------------
--�ɹ�����1
--ʧ�ܷ���0
function scCostResources()
	local nRet, nMax = ModifyEnergy(-4, 1);
	if nRet == -1 then
		return 0;
	end
	return 1;
end

--����------------------------------------------
function scAcceptTask(nTaskID)
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 1 then
		return 1
	end
	return OpenGTask(nTaskID)
end

function scFinishTask(nTaskID)
	-- if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
	-- 	return 1
	-- end
	
	-- if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
	-- 	return 6
	-- end
	
	-- --�������
	-- local nCanOver = tGtTask:IsTaskCanOver(nTaskID)
	-- if nCanOver ~= 1 then
	-- 	return 2
	-- end
	
	-- --����ǰ�������߻��趨��ɾ��
	-- if tGtCondition:del_item_confirm(tGtNpcInfo[nTaskID]["data"][10]) == nil then
	-- 	return 4;
	-- end
	
	-- --��manage���Ƴ�
	-- tGtTaskManage:DeleteTask(nTaskID, 1)
	
	-- --��������
	-- --��Ч
	-- SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 907, 2, 0);
	
	-- Msg2Player(format("�����������:%s", tGtNpcInfo[nTaskID].name))
	
	-- --���뽱��
	-- tGtTask:DoPrize(nTaskID)
	-- tGtNpcMain:ShowAward(nTaskID)
	
	-- --�
	-- vaf_get_prize_item_30709(2, 1);
	Talk(1,"","<color=red>T�nh n�ng �� ��ng, h�y qu� tr�ng t�i kho�n c�a m�nh ,��ng l�m nh�ng vi�c vi ph�m!<color>")
	return 1
end

function scConfirmPassTask(nTaskID)
--manage���Ƿ����,û�ӵĻ�ֱ�ӷ���Pass�ɹ�
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 1
	end
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 6
	end
	local strTab = {
		format("\n��ng � ti�u hao %s nh�y qua nhi�m v� n�y/StateChessPassTask", "Hu�n ch��ng anh h�ng"),
		"\nKh�ng, mu�n t� tay ho�n th�nh nhi�m v�/nothing",
	};
	Say(format("Nh�y qua nhi�m v� (Nh�n ���c ph�n th��ng nhi�m v�), c�n ti�u hao <color=red>%d<color> %s", 2, "Hu�n ch��ng anh h�ng"), getn(strTab), strTab);
	return 1;
end

function scPassTask(nTaskID)
	-- --manage���Ƿ����,û�ӵĻ�ֱ�ӷ���Pass�ɹ�
	-- if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
	-- 	return 1
	-- end
	
	-- if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
	-- 	return 6
	-- end
	
	-- --�������
	-- local nCanOver = tGtTask:IsTaskCanOver(nTaskID)
	-- if nCanOver == 1 then
	-- 	Talk(1,"","��������ɣ�����������")
	-- 	return 2
	-- end
	
	-- if GetItemCount(2, 1, 30499) < 2 then
	-- 	Talk(1,"",format("[%s]��������<color=red>%d<color>��", "Ӣ��ѫ��", 2))
	-- 	return 3;
	-- end
	-- if DelItem(2, 1, 30499, 2) ~= 1 then
	-- 	return 4;
	-- end
	-- Msg2Player(format("��������%s*%d", "Ӣ��ѫ��", 2));
	
	-- --����ǰ�������߻��趨��ɾ��
	-- tGtCondition:del_item_confirm(tGtNpcInfo[nTaskID]["data"][10])

	-- --ɾ��������
	-- tGtTask:remove_trigger(nTaskID);
	
	-- --��������
	-- --��Ч
	-- SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 907, 2, 0);
	
	-- --��manage���Ƴ�
	-- tGtTaskManage:DeleteTask(nTaskID, 1)
	
	-- --���뽱��
	-- tGtTask:DoPrize(nTaskID)
	-- tGtNpcMain:ShowAward(nTaskID)
	
	-- --�
	-- vaf_get_prize_item_30709(2, 1);
	Talk(1,"","<color=red>T�nh n�ng �� ��ng, h�y qu� tr�ng t�i kho�n c�a m�nh ,��ng l�m nh�ng vi�c vi ph�m!<color>")
	return 1
end

function scDeleteTask(nTaskID)
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 1
	end
	return tGtTaskManage:DeleteTask(nTaskID)
end

--��־--------------------------------------------------
function scDailyLogDataModify(nRound, nCell, nValue)
	WriteLog(format("[Tr��ng Ki�m Thi�n Nhai] [Nhi�m v� bi�n h�a] [Nh�n v�t: %s, t�i kho�n: %s] [S� v�ng: %d, v� tr�: %d, bi�n l��ng: %d]", GetName(), GetAccount(), nRound, nCell, nValue))
end

--������һȦ����-----------------------------------------
function scConfirmRoundOver(nRound)
	local strTab = {
		format("\n��ng � ti�u hao %s �� b��c v�o v�ng ti�p theo/StateChessRoundOver", "Hu�n ch��ng anh h�ng"),
		"\nT�m th�i kh�ng c�n/nothing",
	};
	Say(format("Ch�c m�ng, �� ho�n th�nh v�ng <color=green>%d<color>, b��c v�o v�ng ti�p theo c�n ti�u hao <color=red>%d<color> %s", nRound, 4 + (nRound - 1) * 4, "Hu�n ch��ng anh h�ng"), getn(strTab), strTab);
	return 1;
end

--������һȦ����
--�ɹ�����1
--ʧ�ܷ���0
function scRoundOver(nRound)
	local nValue = 4 + (nRound - 1) * 4;
	if GetItemCount(2, 1, 30499) < nValue then
		Talk(1,"",format("S� l��ng [%s] kh�ng �� <color=red>%d<color> c�i", "Hu�n ch��ng anh h�ng", nValue))
		return 0;
	end
	if DelItem(2, 1, 30499, nValue) ~= 1 then
		return 0;
	end
	Msg2Player(format("�� ti�u hao %s*%d", "Hu�n ch��ng anh h�ng", nValue));
	return 1;
end

--�Ƿ�����������ȡ���˵�ͼ����--------------------------
function scConfirmFinishGl(nType)
	local strTab = {
		format("\n��ng � ti�u hao %s nh�n ph�n th��ng/StateChessFinishGl", "Hu�n ch��ng anh h�ng"),
		"\nT�m th�i kh�ng c�n/nothing",
	};
	Say(format("Ch�o m�ng ��n v�i <color=green>b�n �� may m�n<color>, tham gia c�n ti�u hao <color=red>%d<color> %s", 2, "Hu�n ch��ng anh h�ng"), getn(strTab), strTab);
	return 1;
end

--�ɹ�����1
--ʧ�ܷ���0
function scFinishGl(nType)
	if GetItemCount(2, 1, 30499) < 2 then
		Talk(1,"",format("S� l��ng [%s] kh�ng �� <color=red>%d<color> c�i", "Hu�n ch��ng anh h�ng", 2))
		return 0;
	end
	if DelItem(2, 1, 30499, 2) ~= 1 then
		return 0;
	end
	Msg2Player(format("�� ti�u hao %s*%d", "Hu�n ch��ng anh h�ng", 2));
	return 1;
end

--�Ƿ�����������ȡ�����ͼ����--------------------------
function scConfirmFinishEv(nType)
	local strTab = {
		format("\n��ng � ti�u hao %s nh�n ph�n th��ng/StateChessFinishEv", "Hu�n ch��ng anh h�ng"),
		"\nT�m th�i kh�ng c�n/nothing",
	};
	Say(format("Ch�o m�ng ��n v�i <color=green>b�n �� s� ki�n ng�u nhi�n<color>, tham gia c�n ti�u hao <color=red>%d<color> %s", 2, "Hu�n ch��ng anh h�ng"), getn(strTab), strTab);
	return 1;
end

--�ɹ�����1
--ʧ�ܷ���0
function scFinishEv(nType)
	if GetItemCount(2, 1, 30499) < 2 then
		Talk(1,"",format("S� l��ng [%s] kh�ng �� <color=red>%d<color> c�i", "Hu�n ch��ng anh h�ng", 2))
		return 0;
	end
	if DelItem(2, 1, 30499, 2) ~= 1 then
		return 0;
	end
	Msg2Player(format("�� ti�u hao %s*%d", "Hu�n ch��ng anh h�ng", 2));
	return 1;
end


--���˵�ͼ����------------------------------------------
function scGoodLuck(nValue)
	--print("nValue =", nValue)
	-- if 1 == nValue then
	-- 	local tAward = {
	-- 		{3, 5, 50000, 1},
	-- 		{3, 30, 100000, 1},
	-- 		{3, 30, 150000, 1},
	-- 		{3, 20, 200000, 1},
	-- 		{3, 5, 250000, 1},
	-- 		{3, 5, 300000, 1},
	-- 		{3, 2, 500000, 1},
	-- 		{3, 1, 600000, 1},
	-- 		{3, 1, 800000, 1},
	-- 		{3, 1, 2000000, 1},
	-- 	}
	-- 	local nRand = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1)
	-- 	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "�̽�����", "������", nRand)
	-- 	Talk(1,"",format("����<color=green>%d%s<color>", tAward[nRand][3]/10000, "����"))
	-- 	return 1;
	-- elseif 2 == nValue then
	-- 	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
	-- 		return 0;
	-- 	end
	-- 	local tAward = {
	-- 		{1, 20},
	-- 		{2, 20},
	-- 		{3, 20},
	-- 		{4, 15},
	-- 		{5, 15},
	-- 		{6, 5},
	-- 		{8, 2},
	-- 		{10, 1},
	-- 		{12, 1},
	-- 		{16, 1},
	-- 	}
	-- 	local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
	-- 	local tGem = {
	-- 		{2,	22, 101, "1��Ѫ��ʯ"},
	-- 		{2,	22, 201, "1���°�ʯ"},
	-- 		{2,	22, 301, "1������ʯ"},
	-- 		{2,	22, 401, "1������ʯ"},
	-- 	}
	-- 	local nRand = random(getn(tGem));
	-- 	gf_AddItemEx2({tGem[nRand][1], tGem[nRand][2], tGem[nRand][3], tAward[nIndex][1]}, tGem[nRand][4], "�̽�����", "Ǯׯ", 0, 1);
	-- 	Talk(1,"",format("����<color=green>%d��%s<color>", tAward[nIndex][1], tGem[nRand][4]))
	-- 	return 1;
	-- elseif 3 == nValue then
	-- 	local tAward = {
	-- 		{38, 5, 10, 1},
	-- 		{38, 10, 15, 1},
	-- 		{38, 20, 20, 1},
	-- 		{38, 40, 25, 1},
	-- 		{38, 15, 30, 1},
	-- 		{38, 5, 35, 1},
	-- 		{38, 2, 40, 1},
	-- 		{38, 1, 45, 1},
	-- 		{38, 1, 50, 1},
	-- 		{38, 1, 60, 1},
	-- 	}
	-- 	local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
	-- 	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "�̽�����", "ҽ��", nIndex)
	-- 	Talk(1,"",format("����<color=green>%d��%s<color>", tAward[nIndex][3], "����"))
	-- 	return 1;
	-- end
	Talk(1,"","<color=red>T�nh n�ng �� ��ng, h�y qu� tr�ng t�i kho�n c�a m�nh ,��ng l�m nh�ng vi�c vi ph�m!<color>")
	return 0;
end

--����¼�����------------------------------------------
function scEvent(nValue)
	-- if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
	-- 	return 0;
	-- end
	-- local tAward = {
	-- 	{2, 1500, 10000000,1},
	-- 	{2, 1000, 20000000, 1},
	-- 	{2, 500,  40000000, 1},
	-- 	{3, 500,  100000, 1},
	-- 	{3, 1300, 150000, 1},
	-- 	{3, 1000, 200000, 1},
	-- 	{3, 100,  300000, 1},
	-- 	{31, 1583, "sc_GetEventGemAward(1)", 0},
	-- 	{31, 800, "sc_GetEventGemAward(2)", 0},
	-- 	{31, 200, "sc_GetEventGemAward(4)", 0},
	-- 	{1, 1000, "������", {2, 1, 30670, 1}, 0},
	-- 	{1, 300, "������", {2, 1, 30670, 2}, 0},
	-- 	{1, 100, "������", {2, 1, 30670, 4}, 0},
	-- 	{1, 100, "������", {2, 1, 30670, 8}, 0},
	-- 	{1, 1, "��ͽ��", {0, 3 , 30207, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 8 , 30208, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 0 , 30209, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 1 , 30210, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 2 , 30211, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 10, 30212, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 0 , 30213, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 5 , 30214, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 2 , 30215, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 9 , 30216, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽǹ", {0, 6 , 30217, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 4 , 30218, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 7 , 30219, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽצ", {0, 11, 30220, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 2 , 30221, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 13, 30222, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 12, 30223, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- }
	-- local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1)
	-- gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "�̽�����", "�����ͼ", nIndex);
	-- if tAward[nIndex][1] == 1 then
	-- 	Talk(1,"",format("����<color=green>%d��%s<color>", tAward[nIndex][4][4], tAward[nIndex][3]))
	-- elseif tAward[nIndex][1] == 2 then
	-- 	Talk(1,"",format("����<color=green>%d%s<color>", tAward[nIndex][3], "����"))
	-- elseif tAward[nIndex][1] == 3 then
	-- 	Talk(1,"",format("����<color=green>%d%s<color>", tAward[nIndex][3]/10000, "����"))
	-- end
	-- return 1;
	Talk(1,"","<color=red>T�nh n�ng �� ��ng, h�y qu� tr�ng t�i kho�n c�a m�nh ,��ng l�m nh�ng vi�c vi ph�m!<color>")
	return 0
end

function sc_GetEventGemAward(nNum)
	-- local tGem = {
	-- 	{2,	22, 101, "1��Ѫ��ʯ"},
	-- 	{2,	22, 201, "1���°�ʯ"},
	-- 	{2,	22, 301, "1������ʯ"},
	-- 	{2,	22, 401, "1������ʯ"},
	-- }
	-- local nRand = random(getn(tGem));
	-- gf_AddItemEx2({tGem[nRand][1], tGem[nRand][2], tGem[nRand][3], tonumber(nNum) or 1}, tGem[nRand][4], "�̽�����", "�����ͼ", 0, 1);
	-- Talk(1,"",format("����<color=green>%d��%s<color>", nNum, tGem[nRand][4]))
	Talk(1,"","<color=red>T�nh n�ng �� ��ng, h�y qu� tr�ng t�i kho�n c�a m�nh ,��ng l�m nh�ng vi�c vi ph�m!<color>")
end

function scCheckFreeRoom()
	-- if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
	-- 	return 0;
	-- end
	-- return 1;
	return 0
end

--ÿȦ����----------------------------------------------
function scDoPrize(nExp, nBagCount, nBagCountEx)
	--print("scDoPrize =", nExp, nBagCount, nBagCountEx)
	-- gf_ModifyExp(nExp);
	-- local nTotal = nBagCount;
	-- gf_AddItemEx2({2, 1, 30703, nBagCount}, "�̽����İ�", "�̽�����", "ÿȦ����", 0, 1);
	-- if nBagCountEx > 0 then
	-- 	gf_AddItemEx2({2, 1, 30703, nBagCountEx}, "�̽����İ�", "�̽�����", "ÿȦ����", 0, 1);
	-- 	nTotal = nTotal + nBagCountEx;
	-- end
	-- Say(format("�����̽�����ÿȦ������<color=green>EXP��%d, �̽����İ�*%d<color>", nExp, nTotal), 0);
	-- WriteLog(format("[�̽�����][ÿȦ����][��ɫ:%s,�ʺ�:%s][����:%d,�̽����İ�:%d]", GetName(), GetAccount(), nExp, nTotal))
	Talk(1,"","<color=red>T�nh n�ng �� ��ng, h�y qu� tr�ng t�i kho�n c�a m�nh ,��ng l�m nh�ng vi�c vi ph�m!<color>")
end

--�̽����İ�
function OnUse(nItem)
	-- if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
	-- 	return 0;
	-- end
	-- if DelItemByIndex(nItem, 1) ~= 1 then
	-- 	return 0;
	-- end
	-- gf_AddItemEx2({2,1,30670,1}, "������", "�̽�����", "�̽����İ�");
	-- Earn(40000);
	-- local tAward = {
	-- 	{2, 1000, 2000000, 1},
	-- 	{2, 1000, 5000000, 1},
	-- 	{2, 500, 10000000, 1},
	-- 	{3, 1000, 10000, 1},
	-- 	{3, 500, 50000, 1},
	-- 	{3, 400, 100000, 1},
	-- 	{3, 100, 300000, 1},
	-- 	{1, 1500, "������", {2, 1, 30670, 1}, 0},
	-- 	{1, 1000, "������", {2, 1, 30670, 2}, 0},
	-- 	{1, 500, "������", {2, 1, 30670, 4}, 0},
	-- 	{1, 500, "������", {2, 1, 30670, 8}, 0},
	-- 	{1, 500, "��������", {2, 0, 398, 1, 4}, 0},
	-- 	{1, 600, "С��������", {2, 0, 504, 1, 4}, 0},
	-- 	{1, 500, "������", {2, 1, 30269, 1, 4}, 0},
	-- 	{1, 383, "���Ӱ�", {2, 1, 30087, 1, 4}, 0},
	-- 	{1, 1, "��ͽ��", {0, 3 , 30207, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 8 , 30208, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 0 , 30209, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 1 , 30210, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 2 , 30211, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 10, 30212, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 0 , 30213, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 5 , 30214, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 2 , 30215, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 9 , 30216, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽǹ", {0, 6 , 30217, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 4 , 30218, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 7 , 30219, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽצ", {0, 11, 30220, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 2 , 30221, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 13, 30222, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "��ͽ��", {0, 12, 30223, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- }
	-- gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "�̽�����", "�̽����İ�")
	Talk(1,"","<color=red>T�nh n�ng �� ��ng, h�y qu� tr�ng t�i kho�n c�a m�nh ,��ng l�m nh�ng vi�c vi ph�m!<color>")
	return 0
end
