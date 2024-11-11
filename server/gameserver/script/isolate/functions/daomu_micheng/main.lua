Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Import("\\script\\lib\\globalfunctions.lua")

t_isolate_base_cfg = {
  nPriority 			= 1,
  szEngName 			= "the_Mummy",
  szViewName 			= "��o M� M� Th�nh",
  nTalkBeginDate 	= 20151115,
  nBeginDate 			= 20151115,
  nEndDate 				= 20151130,
  nTaskGroup 			= 5,
  nTaskGroupVersion	= 15,
}

DBMC_NPC_NAME = "<color=green>Binh B� Th� Lang<color>:"
DBMC_DAILY_TASK_LIMIT = 20
DBMC_USE_ITEM_LIMIT = 600

g_Dbmc_tTask = {
	{"Th�t L�c Nhai", "Nh�t ��n h� ph�p", 20, 6300},
	{"Th�t L�c Nhai", "Nguy�t ��n H� Ph�p", 20, 6300},
	{"Th�t L�c Nhai", "Tinh ��n H� Ph�p", 20, 6300},
	{"Th�t L�c Nhai", "Nhai Th��ng S�n T�c", 20, 6300},
	{"C� D��ng ��ng_1", "�m Nh�t S� ", 30, 511},
	{"C� D��ng ��ng_2", "X�ch Luy�n H�a H�", 20, 512},
	--{"���ԭ��", "�������", 20, 602},
	{"H�c Phong ��ng", "M�ng Kh�u", 20, 215},
	--{"��ˮ������", "���ͽ", 20, 113},
	--{"���Ż���", "С������", 20, 328},
}

g_Dbmc_tAward = {
	{"item", 10, "Da ��a Long", {2, 1, 30673, 100}},
	{"item", 25, "Vi�m Linh Ti", {2, 1, 30671, 100}},
	{"item", 50, "Da Ma Lang", {2, 1, 30672, 100}},
	{"item", 75, "Huy�n Vi�m Thi�t", {2, 1, 30670, 100}},
	{"item", 100, "Ti�n �m Th�ch", {2, 1, 30674, 100}},
	{"exp", 200, "100000000EXP", 100000000},
	{"item", 300, "Th�i Nh�t L�nh", {2, 1, 30687, 4}},
	{"item", 400, "Th�i Nh�t L�nh", {2, 1, 30687, 6}},
	{"item", 500, "Th�i Nh�t L�nh", {2, 1, 30687, 10}},
}

function on_init_ok()
	AcivityBase.TaskGroup.Task1 = 1; --��¼��ǰ������
	AcivityBase.TaskGroup.Task2 = 2; --��ǰ��������1��ɱ�ִ���2��ÿ�ս�ȡ�������3, ����������4
	AcivityBase.TaskGroup.Task3 = 3; --��ͨ�ر�ͼʹ�ô���
	AcivityBase.TaskGroup.Task4 = 4; --��������
	AcivityBase.TaskGroup.Task5 = 5; --��Ĺ���ĲƱ�ʹ�ô���
	AcivityBase.TaskGroup.Task6 = 6; --��Ĺ���ĲƱ��ۼƽ������
	AcivityBase.TaskGroup.Task7 = 7; --ˢ��ɱ�ֿ��ر��1,2,3bit
	AcivityBase.TaskGroup.Task8 = 8; --��¼ˢ����Ĺ���ĲƱ�
	isolate_enable_event_dispatch(-1)
end

function on_add_watches()
	isolate_watch_npc_talk("Binh B� Th� Lang", 200, "handle_npc_talk_main")
	isolate_watch_item_talk(2, 1, 30947, "handle_on_item_talk") --��ͨ�ر�ͼ
	isolate_watch_item_talk(2, 1, 30940, "handle_on_item_treasure") --��Ĺ���ĲƱ�
	for _, v in g_Dbmc_tTask do
		isolate_watch_event("event_kill_npc", "kill_npc_task_on_trigger", v[2], v[4]);
	end
	isolate_watch_event("event_kill_npc", "kill_npc_daobaozei", "��o B�o T�c", -1);
	isolate_watch_event("event_kill_npc", "kill_npc_baozangshouhuzhe", "Ng��i B�o V� Kho B�u", -1);
end

function on_event_player_login(nExchangeComing) 
	local tTaskGroup = AcivityBase.TaskGroup
	if tTaskGroup:GetTaskBit(tTaskGroup.Task7, 1) ~= 0 then
		isolate_enable_player_event_watch("event_kill_npc", "kill_npc_task_on_trigger")
	else
		isolate_disable_player_event_watch("event_kill_npc", "kill_npc_task_on_trigger")
	end
	if tTaskGroup:GetTaskBit(tTaskGroup.Task7, 2) ~= 0 then
		isolate_enable_player_event_watch("event_kill_npc", "kill_npc_daobaozei")
	else
		isolate_disable_player_event_watch("event_kill_npc", "kill_npc_daobaozei")
	end
	if tTaskGroup:GetTaskBit(tTaskGroup.Task7, 3) ~= 0 then
		isolate_enable_player_event_watch("event_kill_npc", "kill_npc_baozangshouhuzhe")
	else
		isolate_disable_player_event_watch("event_kill_npc", "kill_npc_baozangshouhuzhe")
	end
end

function handle_npc_talk_main(nNpcIndex)
	if gf_CheckLevel(5, 80) ~= 1 then
		Talk(1, "", DBMC_NPC_NAME..format("Ch�a ��t ��n y�u c�u chuy�n sinh %d c�p %d ", 5, 80))
		return 0;
	end
	local msg = "G�n ��y Binh B� Th� Lang ti�u di�t m�t nh�m ��o M� T�c trong L�ng T�n Th�y Ho�ng, nh�n ���c r�t nhi�u T�ng B�o ��. B�ng nhi�n khi�n cho nh�ng ng��i c� t�m ��a x�u ��t nh�p v�o Th� Lang Ph� khi�n cho Binh B� Th� Lang phi�n l�ng; �� gi�i quy�t chuy�n n�y th� Binh B� Th� Lang �� ban th��ng T�ng B�o �� �� tri�u t�p hi�p s� giang h� �� tr�ng tr� ch�ng."
	local tSay = {
		"Nhi�m v� Tr�ng Gi�i/reprimand_task",
		"Ph�n th��ng t�ch l�y T�i S�n ��o B�o T�c/treasure_accumulative_award",
		"\nT�i ch� xem xem th�i/nothing",
	}
	Say(DBMC_NPC_NAME..msg, getn(tSay), tSay)
end

function reprimand_task()
	local tTaskGroup = AcivityBase.TaskGroup
	local nTaskIndex = tTaskGroup:GetTaskByte(tTaskGroup.Task2, 1)
	local szTalkStr = "H�y ��n [<color=green>%s<color>] ti�u di�t <color=red>%s*%d<color>";
	if nTaskIndex ~= 0 then
		local tTask = g_Dbmc_tTask[nTaskIndex];
		local msg = DBMC_NPC_NAME..format(szTalkStr, tTask[1], tTask[2], tTask[3])
		if tTaskGroup:GetTaskByte(tTaskGroup.Task2, 2) >= tTask[3] then
			local tSay = {
				"Ho�n th�nh/reprimand_task_finish",
				"H�y quay l�i sau/nothing",
			}
			Say(msg, getn(tSay), tSay)
			return 0;
		end
		Talk(1,"", msg);
		return 0;
	end
	local nCurDate = tonumber(date("%Y%m%d"));
	if tTaskGroup:GetTask(tTaskGroup.Task1) ~= nCurDate then
		tTaskGroup:SetTaskByte(tTaskGroup.Task2, 3, 0);
		tTaskGroup:SetTask(tTaskGroup.Task1, nCurDate);
		tTaskGroup:SetTask(tTaskGroup.Task8, 0);
	end
	local nTotal = tTaskGroup:GetTaskByte(tTaskGroup.Task2, 3);
	if nTotal >= DBMC_DAILY_TASK_LIMIT then
		Talk(1,"",format("H�ng ng�y ���c tham gia t�i �a %d l�n nhi�m v� Tr�ng Gi�i", DBMC_DAILY_TASK_LIMIT));
		return 0;
	end
	local nRandIndex = random(getn(g_Dbmc_tTask));
	tTaskGroup:SetTaskByte(tTaskGroup.Task2, 1, nRandIndex);
	tTaskGroup:SetTaskByte(tTaskGroup.Task2, 2, 0);
	tTaskGroup:SetTaskByte(tTaskGroup.Task2, 3, nTotal + 1)
	local tTask = g_Dbmc_tTask[nRandIndex];
	tTaskGroup:SetTaskBit(tTaskGroup.Task7, 1, 1);
	isolate_enable_player_event_watch("event_kill_npc", "kill_npc_task_on_trigger"); --��Ч
	Talk(1,"",DBMC_NPC_NAME..format(szTalkStr, tTask[1], tTask[2], tTask[3]));
	TaskTip(format("H�y ��n [%s] ti�u di�t %s*%d", tTask[1], tTask[2], tTask[3]));
end

function reprimand_task_finish()
	if gf_Judge_Room_Weight(1, 10, DBMC_NPC_NAME) ~= 1 then
		return 0;
	end
	local tTaskGroup = AcivityBase.TaskGroup
	tTaskGroup:SetTaskByte(tTaskGroup.Task2, 1, 0);
	tTaskGroup:SetTaskByte(tTaskGroup.Task2, 2, 0);
	local nNum = 1;
	if IsActivatedVipCard() ~= 0 then
		nNum = nNum + 1
	end
	gf_AddItemEx2({2, 1, 30947, nNum}, "T�ng B�o ��-Th��ng", "��o M� M� Th�nh", "Nhi�m v� Tr�ng Gi�i", 0, 1)
end

function kill_npc_task_on_trigger(data)
	local tTaskGroup = AcivityBase.TaskGroup
	local nTaskIndex = tTaskGroup:GetTaskByte(tTaskGroup.Task2, 1);
	local nTaskCount = tTaskGroup:GetTaskByte(tTaskGroup.Task2, 2);
	local tTask = g_Dbmc_tTask[nTaskIndex];
	local msg = format("Ti�u di�t %s (%d/%d)", tTask[2], nTaskCount + 1, tTask[3])
	if tTask[2] ~= data[1] then
		return 0;
	end
	tTaskGroup:SetTaskByte(tTaskGroup.Task2, 2, nTaskCount + 1);
	if nTaskCount + 1 >= tTask[3] then
		tTaskGroup:SetTaskBit(tTaskGroup.Task7, 1, 0);
		isolate_disable_player_event_watch("event_kill_npc", "kill_npc_task_on_trigger")
		Msg2Player(msg.."(Ho�n th�nh)");
		return 0;
	end
	Msg2Player(msg)
end

function handle_on_item_talk(nItemIndex)
	local tPos = {
		{"Th�t L�c Nhai (167,217)", {6300,1342,3481}},
		{"Th�t L�c Nhai (165,190)", {6300,1320,3043}},
		{"Th�t L�c Nhai(184,205)", {6300,1473,3294}},
		{"Qu�nh K�t(221,203)", {6100,1768,3252}},
		{"H�ng Kh�nh(176,195)", {6200,1412,3124}},
		{"Thi�n Long T�(177,165)", {6000,1417,2649}},
		{"T�y Th�nh �� (182,178)", {301,1458,2854}},
		{"Nam Th�nh ��(188,184)", {304,1508,2956}},
		{"��ng Bi�n Kinh (211,189)", {205,1692,3029}},
		{"T�y Bi�n Kinh (182,183)", {203,1462,2942}},
		{"T�y Tuy�n Ch�u (184,190)", {105,1472,3056}},
		{"B�c Tuy�n Ch�u(185,186)", {108,1486,2981}},
	}
	local tTaskGroup = AcivityBase.TaskGroup;
	local UseTimes = tTaskGroup:GetTask(tTaskGroup.Task3);
	if UseTimes >= DBMC_USE_ITEM_LIMIT then
		Talk(1,"", DBMC_NPC_NAME..format("Trong th�i gian ho�t ��ng <color=green>%s<color> t�i �a d�ng ���c <color=green>%d<color> l�n", GetItemName(nItemIndex), DBMC_USE_ITEM_LIMIT));
		return 0;
	end
	local nPosIndex = tTaskGroup:GetTask(tTaskGroup.Task4);
	if nPosIndex == 0 then
		nPosIndex = random(getn(tPos));
		tTaskGroup:SetTask(tTaskGroup.Task4, nPosIndex);
	end
	local nDesPos = tPos[nPosIndex][2];
	local nMapId, nX, nY = GetWorldPos()
	if nMapId == nDesPos[1] then
		local nDisX = nX - nDesPos[2]
		local nDisY = nY - nDesPos[3]
		if nDisX*nDisX + nDisY*nDisY < 64 then
			found_treasure_event(nItemIndex)
			return 0
		end
	end
	local msg = format("M�i %s ��n %s t�m b�o v�t ���c ��o M� T�c �� l�i!", gf_GetPlayerSexName(), tPos[nPosIndex][1]);
	Talk(1,"", DBMC_NPC_NAME..msg);
	TaskTip(msg);
end

function found_treasure_event(nItemIndex)
	if gf_Judge_Room_Weight(2, 10, DBMC_NPC_NAME) ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItemIndex, 1) ~= 1 then
		return 0;
	end
	local tTaskGroup = AcivityBase.TaskGroup;
	tTaskGroup:SetTask(tTaskGroup.Task3, tTaskGroup:GetTask(tTaskGroup.Task3) + 1);
	tTaskGroup:SetTask(tTaskGroup.Task4, 0);
	local tEvent = {
		{1, 300},
		{1, 1099},
		{1, 1},
		{1, 8600},
	}
	local nIndex = gf_GetRandItemByTable(tEvent, 10000, 1);
	if nIndex == 3 and tTaskGroup:GetTask(tTaskGroup.Task8) ~= 0 then
		nIndex = 4;
	end
	event_treasure_deal(nIndex);
end

function event_treasure_deal(nType)
	if nType == 1 then
		local tTaskGroup = AcivityBase.TaskGroup;
		tTaskGroup:SetTaskByte(tTaskGroup.Task2, 4, 0);
		local nMapId, nX, nY = GetWorldPos()
		for i = 1, 4 do 
			CreateNpc("hd_daomuzei", "��o B�o T�c", nMapId, nX + random(-4, 4), nY + random(-4, 4)); 
		end
		tTaskGroup:SetTaskBit(tTaskGroup.Task7, 2, 1);
		isolate_enable_player_event_watch("event_kill_npc", "kill_npc_daobaozei")
		Talk(1,"","Nguy hi�m!")
	elseif nType == 2 then
		Talk(1,"",DBMC_NPC_NAME.."C� ng��i �� ��n tr��c ��o kho b�u �i m�t r�i!");
	elseif nType == 3 then
		CreateNpc("hd_shouhuzhe", "Ng��i B�o V� Kho B�u", GetWorldPos());
		local tTaskGroup = AcivityBase.TaskGroup;
		tTaskGroup:SetTaskBit(tTaskGroup.Task7, 3, 1);
		tTaskGroup:SetTask(tTaskGroup.Task8, 1);
		isolate_enable_player_event_watch("event_kill_npc", "kill_npc_baozangshouhuzhe")
		Talk(1,"","L� tay k�ch ho�t c� quan, b� ng��i b�o v� ph�t hi�n!")
	elseif nType == 4 then
		CustomAwardGiveGroup("act_11_normal", 0)
	end		
end

function kill_npc_daobaozei(data)
	if data[1] ~= "��o B�o T�c" then
		return 0;
	end
	local tTaskGroup = AcivityBase.TaskGroup
	local nCount = tTaskGroup:GetTaskByte(tTaskGroup.Task2, 4);
	tTaskGroup:SetTaskByte(tTaskGroup.Task2, 4, nCount + 1);
	if nCount + 1 >= 4 then
		tTaskGroup:SetTaskBit(tTaskGroup.Task7, 2, 0);
		isolate_disable_player_event_watch("event_kill_npc", "kill_npc_daobaozei")
	end
	CustomAwardGiveGroup("act_11_normal", 0);
end

function kill_npc_baozangshouhuzhe(data)
	if data[1] ~= "Ng��i B�o V� Kho B�u" then
		return 0;
	end
	local tTaskGroup = AcivityBase.TaskGroup;
	tTaskGroup:SetTaskBit(tTaskGroup.Task7, 3, 0);
	isolate_disable_player_event_watch("event_kill_npc", "kill_npc_baozangshouhuzhe");
	gf_AddItemEx2({2, 1, 30940, 1}, "T�i S�n ��o B�o T�c", "��o M� M� Th�nh", "S� ki�n T�ng B�o ��", 0, 1);
	Msg2Player(format("Ti�u di�t %s (%d/%d)", "Ng��i B�o V� Kho B�u", 1, 1).."(Ho�n th�nh)");
	local msg = format("Ch�c m�ng %s nh�n ���c %s", GetName(), "T�i S�n ��o B�o T�c");
	Msg2Global(msg)
	AddGlobalNews(msg, 1)
end

function handle_on_item_treasure(nItemIndex)
	if CustomAwardCheckCondition("act_11_ib") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItemIndex, 1) ~= 1 then
		return 0;
	end
	local tTaskGroup = AcivityBase.TaskGroup;
	tTaskGroup:SetTask(tTaskGroup.Task5, tTaskGroup:GetTask(tTaskGroup.Task5) + 1);
	CustomAwardGiveGroup("act_11_ib", 0)
end

function treasure_accumulative_award()
	local tTaskGroup = AcivityBase.TaskGroup;
	local times = tTaskGroup:GetTask(tTaskGroup.Task5);
	local tStatus = {"Ch�a l�nh nh�n", "�� l�nh nh�n"}
	local msg = DBMC_NPC_NAME..format("Hi�n t�i s� l�n d�ng T�i S�n ��o B�o T�c l� <color=green>%d<color>, %s mu�n nh�n ph�n th��ng g�??", times, gf_GetPlayerSexName());
	msg = msg.."(sau khi nh�n xong ph�n th��ng t�ch l�y m�t l��t s� t� ��ng reset)"
	local tSay = {}
	for i = 1, getn(g_Dbmc_tAward) do
		local nStatus = tTaskGroup:GetTaskBit(tTaskGroup.Task6, i) + 1;
		if g_Dbmc_tAward[i][1] == "item" then
			tinsert(tSay, format("D�ng %d l�n nh�n ���c %s*%d (%s)/#treasure_accumulative_award_cb(%d)", g_Dbmc_tAward[i][2], g_Dbmc_tAward[i][3], g_Dbmc_tAward[i][4][4], tStatus[nStatus], i));
		else
			tinsert(tSay, format("D�ng %d l�n nh�n ���c %s (%s)/#treasure_accumulative_award_cb(%d)", g_Dbmc_tAward[i][2], g_Dbmc_tAward[i][3], tStatus[nStatus], i));
		end
	end
	tinsert(tSay, "T�i h� ch� xem qua th�i/nothing")
	Say(msg, getn(tSay), tSay);
end

function treasure_accumulative_award_cb(nIndex)
	local tTaskGroup = AcivityBase.TaskGroup;
	local times = tTaskGroup:GetTask(tTaskGroup.Task5);
	local nStatus = tTaskGroup:GetTaskBit(tTaskGroup.Task6, nIndex);
	if nStatus ~= 0 then
		Talk(1,"",DBMC_NPC_NAME.."Kh�ng th� nh�n l�i ph�n th��ng!");
		return 0;
	end
	local tAward = g_Dbmc_tAward[nIndex];
	if times < tAward[2] then
		Talk(1,"",DBMC_NPC_NAME..format("S� l�n d�ng ��t <color=red>%d<color> l�n m�i ���c nh�n th��ng", tAward[2]));
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, DBMC_NPC_NAME) ~= 1 then
		return 0;
	end
	tTaskGroup:SetTaskBit(tTaskGroup.Task6, nIndex, 1);
	if tAward[1] == "item" then
		gf_AddItemEx2(tAward[4], tAward[3], "��o B�o M� Th�nh", "Th��ng t�ch l�y T�i S�n ��o B�o T�c", 0, 1);
	else
		gf_Modify("Exp", 100000000);
	end
	--ȫ����ȡ���˾�����
	local nSize = getn(g_Dbmc_tAward);
	local nMaxTimes = g_Dbmc_tAward[nSize][2];
	if times < nMaxTimes then
		return 0;
	end
	local bflag = 1;
	for i = 1, nSize do
		if tTaskGroup:GetTaskBit(tTaskGroup.Task6, i) ~= 1 then
			bflag = 0
			break
		end
	end
	if bflag ~= 0 then
		tTaskGroup:SetTask(tTaskGroup.Task5, times - nMaxTimes);
		tTaskGroup:SetTask(tTaskGroup.Task6, 0);
		Msg2Player("�� reset ph�n th��ng t�ch l�y");
	end
end