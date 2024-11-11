Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
Import("\\script\\equip_shop\\equip_shop_head.lua")
Import("\\script\\lib\\talktmp.lua")

thisFile = "\\script\\function\\zk_update\\zk_main.lua"

zkwq_Start = {2016,06,01,0,0,0}
zkwq_End = {2016,06,30,0,0,0}

function Init()
--	AddMisEvent("event_talk_npc", "Th� r�n L�u", 350, thisFile, "handle_zk_main", "T�ng c�p Chi�n Cu�ng");
	AddMisEvent("event_daily_clean", "X� l� h�ng ng�y", 0, thisFile, "handle_zk_dailyclean");
	local tMissionName = {
		{"event_mission_passstage", "V�n Ki�m Tr�ng",  "handle_zk_mc"},
		{"event_mission_passstage", "��a Huy�n Cung", "handle_zk_mc"},
		{"event_mission_passstage", "L��ng S�n", "handle_zk_mc"},
		{"event_mission_passstage", "Th�i Nh�t Th�p", "handle_zk_mc"},
		{"event_mission_passstage", "Th�i Nh�t Th�p_Anh H�ng", "handle_zk_mc"},
		{"event_mission_joinonce", "Thi�n M�n tr�n", "handle_zk_jo"},
		{"event_mission_joinonce", "Th�n L�c Tranh �o�t Chi�n", "handle_zk_jo"},
		{"event_mission_joinonce", "Th�o C�c Tranh �o�t Chi�n", "handle_zk_jo"},
		{"event_mission_joinonce", "Ph�o ��i Tranh �o�t Chi�n", "handle_zk_jo"},
		{"event_mission_joinonce", "Chi�n tr��ng ch�nh-Nh�n M�n Quan", "handle_zk_jo"},
		{"event_mission_joinonce", "�n O�n ��i", "handle_zk_jo"},
		{"event_yp_taskfinish", "��o Kho B�u", "handle_zk_yptask"},
		{"event_yp_taskfinish", "Tr�m Kinh S�ch", "handle_zk_yptask"},
		{"event_yp_taskfinish", "V�n ti�u", "handle_zk_yptask"},
		{"event_yp_taskfinish", "C��p Ti�u", "handle_zk_yptask"},
		{"event_yp_taskfinish", "Tr�m Ng�c Ph�ch", "handle_zk_yptask"},
		{"event_ywz_taskfinish", "Nhi�m v� tu�n", "handle_zk_ywztask"},
		{"event_slyb_award", "yp_slyzz_award", "handle_zk_slyb", "Ph�n th��ng Chi�n Th� L�c Th�t L�c Nhai"},
		{"event_ywz_taskfinish", "�i�m x�y d�ng c� nh�n ��t 300", "handle_zk_award"},
		{"event_kill_npc", "��o Hoa ��o Ch� Ho�ng Long", "handle_zk_killboss"},
		{"event_kill_npc", "T�y V�c Th��ng Lang B� V��ng", "handle_zk_killboss"},
		{"event_kill_npc", "Ng�c S�n Chi Linh Thi�n C�u", "handle_zk_killboss"},
		{"event_kill_npc", "U Tr�ch Chi �nh Minh V�", "handle_zk_killboss"},
	};
	for _, v in tMissionName do
		AddMisEvent(v[1], v[2], 0, thisFile, v[3]);
	end
	if zkwq_IsOpen() ~= 0 then
		AddMisEvent("event_server_start", "Th��ng Nh�n Ch� �en", 0, thisFile, "handle_zkwq_createnpc");
		AddMisEvent("event_talk_npc", "Th��ng Nh�n Ch� �en", 350, thisFile, "handle_zkwq_main", "Shop ch� �en");
		AddMisEvent("event_kill_npc", "H�a K� L�n Con", 406, thisFile, "handle_zkwq_bossdeath1");
		AddMisEvent("event_kill_npc", "Th�n Th� H�a K� L�n", 218, thisFile, "handle_zkwq_bossdeath2");
	end
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31065), 0, thisFile, "handle_zkwq_useitem", "M�t t� V�y K� L�n");
end

ZK_TZQ_NUM_MAX = 3; --��սȯÿ���������
ZK_ZMMX_COUNT_MAX = 5; --��������ÿ����ɴ���
ZK_TASK_TAG1 = 3422; --ÿ������1���
ZK_TASK_TAG2 = 3466; --ÿ���Ͻ�������

ZK_TZQ_TASK = {
	{"V��t ph� b�n", 381, 1, 1},
	{"Huy�t Chi�n Sa Tr��ng", 382, 2, 3},
	{"Th� L�c Ba Phe", 383, 3, 2},
	{"V�n L� Ti�u Xa L�", 384, 4, 1},
	{"Lo�n chi�n Th�t L�c Nhai", 385, 5, 3},
	{"X�m nh�p Long H� ���ng", 386, 6, 3},
	{"Di�n V� Luy�n Chi�n", 387, 7, 3},
}

ZK_ZMMX_TASK = {
	{"Thi�t Tinh c�p 1", 3, {2,1,30533}, 8},
	{"Thi�t Tinh c�p 2", 1, {2,1,30534}, 9},
	{"Vi�m Linh Ti", 20, {2,1,30671}, 10},
	{"Huy�n Vi�m Thi�t", 20, {2,1,30670}, 11},
	{"Da ��a Long", 20, {2,1,30673}, 12},
	{"Da Ma Lang", 20, {2,1,30672}, 13},
	{"Thi�n Ki�u L�nh", 1, {2,97,236}, 14},
	{"Ma �ao Th�ch c�p 1", 1, {2,1,30428}, 15},
	{"T�y T�m Th�ch Kho�ng", 5, {2,1,30536}, 16},
	{"Luy�n L� Thi�t Kho�ng", 5, {2,1,30537}, 17},
	{"Kinh M�ch ��ng Nh�n", 1, {2,1,30730}, 18},
	{"V�ng", 80, 1, 19},
	{"Qu�n C�ng Ch��ng", 2, {2,1,9999}, 20},
	{"Ng�ng Tinh L�", 15, {2,1,30804}, 21},
	{"T� Linh Ho�n", 1, {2,1,30458}, 22},
	{"Tu Ch�n Y�u Quy�t", 3, {2,0,554}, 23},
	{"Hi�p Ngh�a Chi Ch�ng", 10, {2,1,30912}, 24},
	{"��ng T� Chi Nguy�n", 2, {2,1,30913}, 25},
	{"C�y B�t Nh�", 1, {2,0,398}, 26},
	{"C�y b�t nh� nh�", 3, {2,0,504}, 27},
	{"Huy�tTr�chTh�ch Lv1", 2, {2,22,101}, 28},
	{"Nguy�tB�chTh�ch Lv1", 2, {2,22,201}, 29},
	{"H� Ph�ch Th�ch C�p 1", 2, {2,22,301}, 30},
	{"H�c Di�u Th�ch C�p 1", 2, {2,22,401}, 31},
}

function handle_zk_main(npcIndex)
	if gf_GetTransLevel() < 590 then
		Talk(1,"",format("C�p nh�n v�t ch�a ��t ��n %d chuy�n c�p %d.", 5, 90));
		return 0;
	end
	if tGtTask:check_task_isfinish(380) ~= 1 then
		Talk(1,"","H�y ho�n th�nh nhi�m v� ch� d�n t�ng c�p Chi�n Cu�ng r�i quay l�i nh�!");
		return 0;
	end
	local szNpcName = GetNpcName(npcIndex);
	local tSay = {
		format("Phi�u Khi�u Chi�n V� L�m (%d/%d)/#zk_TzqTask(%d)", zk_GetTzqNum(), ZK_TZQ_NUM_MAX, npcIndex),
		format("Tr��ng M�n M�t T�n-c� th� l�p l�i(%d/%d)/#zk_ZmmxTask(%d)", zk_GetZmmxCount(), ZK_ZMMX_COUNT_MAX, npcIndex),
		format("Ki�u chi�n c�a m��i ��i m�n ph�i/#zk_BigTask(%d)", npcIndex),
		format("Shop Huy�n TInh/#show_equip_shop(%d)", 3077),
		"Ta mu�n nh�n T�i �� Ph�/zk_get_package"
	}
	if zkwq_IsOpen() ~= 0 then
		tinsert(tSay, format("Ho�t ��ng n�ng c�p v� kh� Chi�n Cu�ng/#zkwq_Main(%d)", npcIndex));
	end
	tinsert(tSay, "\nT�i ch� xem xem th�i/nothing");
	local msg = "Huy�n Tinh � tay, Thi�n H� l� c�a ta";
	Say(format("<color=gold>%s<color>:%s", GetNpcName(npcIndex), msg), getn(tSay), tSay);
end

function zk_get_package()
	local nCnt = GetItemCount(2,1,31142)
	if nCnt ~= 0 then
		Talk(1,"handle_zk_main","Ng�i �� c� 1 T�i �� Ph� r�i.") 
		return 0;
	end
	if gf_Judge_Room_Weight(1, 0) == 1 then
		AddItem(2,1,31142,1);
	else
		Talk(1,"handle_zk_main","Kh�ng gian h�nh trang kh�ng d�")
	end

end

function handle_zk_dailyclean()
	SetTask(ZK_TASK_TAG1, 0);
end

function handle_zk_mc(szType, szName, nStage)
	if tGtTask:check_cur_task(381) ~= 1 then
		return 0;
	end
	local t = {
		["V�n Ki�m Tr�ng"] = 4,
		["��a Huy�n Cung"] = 7,
		["L��ng S�n"] = 7,
		["Th�i Nh�t Th�p"] = 6,
		["Th�i Nh�t Th�p_Anh H�ng"] = 6,
	}
	if t[szName] and t[szName] == nStage then
		SetTask(3423, 1);
	end
end

function handle_zk_jo(szType, szName)
	if tGtTask:check_cur_task(382) ~= 1 then
		return 0;
	end
	SetTask(3424, 1);
end

function handle_zk_yptask(szType, szName, nParam)
	if tGtTask:check_cur_task(383) ~= 1 and tGtTask:check_cur_task(384) ~= 1 and 
		tGtTask:check_cur_task(395) ~= 1 and tGtTask:check_cur_task(397) ~= 1 then
		return 0;
	end
	local tName2Task = {
		["��o Kho B�u"] = {3425, 2},
		["Tr�m Kinh S�ch"] = {3426, 1},
		["V�n ti�u"] = {3427, 1},
		["C��p Ti�u"] = {3429, 1},
		["Tr�m Ng�c Ph�ch"] = {3430, 1},
	};
	local v = tName2Task[szName];
	local nTask = GetTask(v[1]);
	if nTask >= v[2] then return 0;	end
	if szName == "C��p Ti�u" and nParam ~= 5 then
		return 0;
	end
	SetTask(v[1], nTask + 1);
end

function handle_zk_ywztask(szType, szName)
	if tGtTask:check_cur_task(387) ~= 1 then
		return 0;
	end
	local nTask = GetTask(3428);
	if nTask >= 7 then return 0; end
	SetTask(3428, nTask + 1);
end

function handle_zk_slyb(szType, szName, nRank)
	if tGtTask:check_cur_task(400) ~= 1 then
		return 0;
	end
	if nRank == 1 then
		SetTask(3431, 1);
	end
end

function handle_zk_award(szType, szName)
	if tGtTask:check_cur_task(391) ~= 1 then
		return 0;
	end
	SetTask(3432, 1);
end

function handle_zk_killboss(npcIndex)
	if tGtTask:check_cur_task(405) ~= 1 then
		return 0;
	end
	SetTask(3433, 1);
end

function zk_GetTzqNum()
	local nCount = 0;
	for _, v in ZK_TZQ_TASK do
		if gf_GetTaskBit(ZK_TASK_TAG1, v[3]) == 1 then
			nCount = nCount + v[4];
		end
	end
	return min(nCount, ZK_TZQ_NUM_MAX);
end

function zk_GetTaskState1(nTaskID, nBit)
	local nValue = gf_GetTaskBit(ZK_TASK_TAG1, nBit);
	if nValue == 0 then
		if tGtTask:check_cur_task(nTaskID) ~= 1 then
			return "(���c nh�n)";
		else
			if DirectIsTaskFinish(nTaskID) ~= 1 then
				return "(ch�a ho�n th�nh)";
			else
				return "(���c giao)";
			end
		end
	else
		if tGtTask:check_cur_task(nTaskID) == 1 then
			DirectDeleteTask(nTaskID);
		end
		return "(Ng�y mai quay l�i)";
	end	
end

function zk_TzqTask(npcIndex)
	local szNpcName = GetNpcName(npcIndex);
	local tSay = {};
	for _, v in ZK_TZQ_TASK do
		tinsert(tSay, format("%s%s/#zk_TzqTask_do(%d, %d)", v[1], zk_GetTaskState1(v[2], v[3]), v[2], v[3]));
	end
	tinsert(tSay, "\nT�i h� ch� xem qua th�i/nothing");
	local msg = format("Ho�n th�nh nhi�m v� d��i ��y nh�n Phi�u Khi�u Chi�n t��ng �ng, m�i ng��i m�i ng�y <color=red>nh�n ���c nhi�u nh�t %d Phi�u Khi�u Chi�n<color>.", ZK_TZQ_NUM_MAX);
	Say(format("<color=gold>%s<color>:%s", szNpcName, msg), getn(tSay), tSay);
end

function zk_TzqTask_do(nTaskID, nBit)
	if gf_GetTaskBit(ZK_TASK_TAG1, nBit) ~= 0 then
		Talk(1,"","�� ho�n th�nh nhi�m v� n�y! Ng�y mai h�y quay l�i");
		return 0;
	end	
	if tGtTask:check_cur_task(nTaskID) == 1 then
		if DirectIsTaskFinish(nTaskID) ~= 1 then
			Talk(1,"","V�n ch�a ho�n th�nh nhi�m v�!");
			return 0;
		end
		if DirectFinishGTask(nTaskID, 2) ==  1 then
			gf_SetTaskBit(ZK_TASK_TAG1, nBit, 1);
			Msg2Player("Nhi�m v� ho�n th�nh!");
			SetCurrentNpcSFX(GetTargetNpc(), 907, 2, 0, 18*5);
			if nTaskID == 381 then SetTask(3423, 0) end
			if nTaskID == 382 then SetTask(3424, 0) end
			if nTaskID == 383 then SetTask(3425, 0); SetTask(3426, 0); end
			if nTaskID == 384 then SetTask(3427, 0) end
			if nTaskID == 387 then SetTask(3428, 0) end
			AddRuntimeStat(43, 1, nTaskID - 380, 1);
		else
			DirectDeleteTask(nTaskID);
		end
	else
		DirectGetGTask(nTaskID, 1);
		SetCurrentNpcSFX(GetTargetNpc(), 906, 2, 0, 18*5);
	end
end

function zk_GetTaskState2(nBit)
	if gf_GetTaskBit(ZK_TASK_TAG2, nBit) ~= 0 then
		return "(�� ho�n th�nh)";
	else
		return "(Ch�a ho�n th�nh)";
	end
end

function zk_GetZmmxCount()
	local nCount = 0;
	for _, elem in ZK_ZMMX_TASK do
		if gf_GetTaskBit(ZK_TASK_TAG2, elem[4]) == 1 then
			nCount = nCount + 1;
		end
	end
	return nCount;
end

function zk_ZmmxTask(npcIndex)
	if zk_GetZmmxCount() >= ZK_ZMMX_COUNT_MAX then
		Talk(1,"","�� ho�n th�nh nhi�m v� n�y! Ng�y mai h�y quay l�i");
		return 0;
	end
	local szNpcName = GetNpcName(npcIndex);
	local tSay = {};
	for i = 1, getn(ZK_ZMMX_TASK) do
		local v = ZK_ZMMX_TASK[i];
		tinsert(tSay, format("%s%s/#zk_ZmmxTask_do(%d)", v[1], zk_GetTaskState2(v[4]), i));
	end
	tinsert(tSay, "\nT�i h� ch� xem qua th�i/nothing");
	local msg = format("Ho�n th�nh %d nhi�m v� b�t k� sau s� nh�n ���c 1 %s.",--��<color=red>ÿ��ÿ�������%d��<color>��", 
		ZK_ZMMX_COUNT_MAX, "B�t Nghi�n Gi�y M�c", 1);
	Say(format("<color=gold>%s<color>:%s", szNpcName, msg), getn(tSay), tSay);
end

function zk_ZmmxTask_do(nIndex)
	local v = ZK_ZMMX_TASK[nIndex];
	local msg = format("X�c nh�n n�p %s*%d ph�i kh�ng?", v[1], v[2])
	Say(format("<color=gold>%s<color>:%s", GetNpcName(GetTargetNpc()), msg), 2,
		format("��ng �/#zk_ZmmxTask_do_cb(%d)", nIndex), "\nT�i h� ch� xem qua th�i/nothing");
end

function zk_ZmmxTask_do_cb(nIndex)
	local v = ZK_ZMMX_TASK[nIndex];
	if gf_GetTaskBit(ZK_TASK_TAG2, v[4]) ~= 0 then
		Talk(1,"","B�n �� ho�n th�nh nhi�m v� n�y! H�y ch�n nhi�m v� kh�c");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		return 0;
	end
	if type(v[3]) == "table" then
		if GetItemCount(unpack(v[3])) < v[2] then
			Talk(1,"",format("trong h�nh trang, s� l��ng c�a %s kh�ng �� %d", v[1], v[2]));
			return 0;
		end
		if DelItem(v[3][1], v[3][2], v[3][3], v[2]) ~= 1 then
			return 0;
		end
	else
		if GetCash() < v[2]*10000 then
			Talk(1,"",format("trong h�nh trang, s� l��ng c�a %s kh�ng �� %d", v[1], v[2]));
			return 0;
		end
		if Pay(v[2]*10000) ~= 1 then
			return 0;
		end
	end
	gf_SetTaskBit(ZK_TASK_TAG2, v[4], 1);
	Msg2Player(format("N�p th�nh c�ng %s*%d", v[1], v[2]));	
	if zk_GetZmmxCount() == ZK_ZMMX_COUNT_MAX then
		AddItem(2, 1, 31059, 1);
		Talk(1,"",format("Nh�n ���c <color=green>%s<color>*%d!", "B�t Nghi�n Gi�y M�c", 1));
		SetCurrentNpcSFX(GetTargetNpc(), 907, 2, 0, 18*5);
		SetTask(ZK_TASK_TAG2,0);
	end
	AddRuntimeStat(43, 2, nIndex, 1)
end

function zk_BigTask(npcIndex)
	local szNpcName = GetNpcName(npcIndex);
	local msg = "��n Tr��ng M�n c�c m�n ph�i nh�n nhi�m v� khi�u chi�n1"
	Say(format("<color=gold>%s<color>:%s", szNpcName, msg), 0);
end

function _gtask_zk_award(nNum)
	local nCount = ZK_TZQ_NUM_MAX - zk_GetTzqNum();
	if nCount <= 0 then
		Msg2Player(format("H�m nay �� nh�n ���c %s l�n nh�t", "Phi�u Khi�u Chi�n"))
		return 0;
	end
	nCount = min(nCount, nNum);
	AddItem(2,1,31058, nCount);   -- ������սȯ
	Msg2Player(format("Nh�n ���c %s*%d", "Phi�u Khi�u Chi�n", nCount));
end

--ս����������
function handle_zkwq_createnpc()
	CreateNpc("Ch��ng d��c T�y Nam", "Th��ng Nh�n Ch� �en", 350, 1402, 2952);
end

function handle_zkwq_main(npcIndex)
	show_equip_shop(3078);
end

function handle_zkwq_bossdeath1(npcIndex)
	local npcName = GetNpcName(npcIndex);
	SetNpcLifeTime(npcIndex, 0);
	local msg = format("Ch�c m�ng [%s] �� ti�u di�t [%s]", GetName(), npcName);
	AddGlobalNews(msg);
	Msg2Global(msg);
	AddRuntimeStat(43, 5, 0, 1);
	local tPlayer = GetNearPlayerList();
	if tPlayer then
		AddRuntimeStat(43, 7, 0, getn(tPlayer));
		local oldPlayerIndex = PlayerIndex
		for _, v in tPlayer do
			PlayerIndex = v;
			AddRuntimeStat(43, 8, GetPlayerRoute(), 1);
			if GetTeamSize() > 1 then
				AddRuntimeStat(43, 11, 0, 1)
			end
			local nState, nCamp = GetPKFlag()
			if nState == 2 and nCamp == 0 then
				AddRuntimeStat(43, 12, 0, 1)
			end
		end
		PlayerIndex = oldPlayerIndex;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("zkwqup_ptboss", 1);
end

function handle_zkwq_bossdeath2(npcIndex)
	local npcName = GetNpcName(npcIndex);
	SetNpcLifeTime(npcIndex, 0);
	local msg = format("Ch�c m�ng [%s] �� ti�u di�t [%s]", GetName(), npcName);
	AddGlobalNews(msg);
	Msg2Global(msg);
	AddRuntimeStat(43, 6, 0, 1);
	local tPlayer = GetNearPlayerList();
	if tPlayer then
		AddRuntimeStat(43, 9, 0, getn(tPlayer));
		local oldPlayerIndex = PlayerIndex
		for _, v in tPlayer do
			PlayerIndex = v;
			AddRuntimeStat(43, 10, GetPlayerRoute(), 1);
			if GetTeamSize() > 1 then
				AddRuntimeStat(43, 13, 0, 1)
			end
			local nState, nCamp = GetPKFlag()
			if nState == 2 and nCamp == 0 then
				AddRuntimeStat(43, 14, 0, 1)
			end
		end
		PlayerIndex = oldPlayerIndex;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("zkwqup_hjboss", 0);
end

function handle_zkwq_useitem(nItemIndex)
	Say(format("X�c ��nh mu�n d�ng %s ��i %s*%d?", GetItemName(nItemIndex), "V�y K� L�n", 10), 2,
		format("X�c ��nh ��i/#zkwq_ItemExchange(%d)", nItemIndex), "�� ta suy ngh�/nothing");
end

function zkwq_ItemExchange(nItemIndex)
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItemIndex, 1) ~= 1 then
		return 0;
	end
	gf_AddItemEx2({2, 1, 31064, 10}, "V�y K� L�n", "T�ng c�p v� kh� Chi�n Cu�ng", "M�t t� V�y K� L�n", 0, 1);
end

function zkwq_IsOpen()
	return gf_CheckDuration(zkwq_Start, zkwq_End);
end

function zkwq_Main(npcIndex)
	local tSay = {
		format("Gi�i thi�u ho�t ��ng/#zkwq_Info(%d)", npcIndex),
		format("Shop Huy�n TInh/#show_equip_shop(%d)", 3077),
		"\nT�i ch� xem xem th�i/nothing",
	}
	local msg = "Th�i gian ho�t ��ng l� 01-30/6/2016.";
	Say(format("<color=gold>%s<color>:%s", GetNpcName(npcIndex), msg), getn(tSay), tSay);
end

function zkwq_Info(npcIndex)
	local tbBody = "\n1. Nguy�n li�u c�n:\n\tDung Luy�n Th�ch*25, L�n Phi�n*1, Thi�n M�n Kim L�nh*3, Thi�n Cang L�nh*2.\n2. C�ch nh�n L�n Phi�n:\n\tNghe n�i g�n ��y l�c 9h t�i m�i ng�y, H�a K� L�n Con v� Th�n Th� H�a K� L�n s� chia nhau xu�t hi�n � [V� L�ng S�n 176/180] v� [Linh B�o S�n 224/218]. ��nh b�i H�a K� L�n �� nh�n L�n Phi�n. H�a K� L�n Con do ch�a tr��ng th�nh n�n s� r�i ra �t L�n Phi�n h�n. L�u �, H�a K� L�n lu�n ph�t ra s�t kh� X�ch Vi�m �� bao v�y ng��i ��n ti�u di�t n�, �� ngh� c�c v� thi�u hi�p h�y t� ��i �� h� tr� nhau. N�u ��n 11h ch�a c� thi�u hi�p n�o ti�u di�t ���c n� th� n� s� bi�n m�t.\n3.C�ch nh�n Dung Luy�n Th�ch:\n\tL� lo�i v�t li�u ch� t�o ��c bi�t, c� th� dung luy�n m�i v�t ch�t. Do L�n Phi�n ph�i ���c �un � nhi�t �� cao n�n c�n d�ng ��n Dung Luy�n Th�ch n�y. Dung Luy�n Th�ch r�t hi�m, c� th� mua � Ng� C�c. Nghe n�i � T��ng D��ng xu�t hi�n m�t Th��ng Nh�n Ch� �en chuy�n mua b�n c�c lo�i nguy�n li�u qu� hi�m, thi�u hi�p c� th� ��n �� xem sao.";
	local tbSay = {};
	tbSay.msg = format("<color=gold>%s<color>:", GetNpcName(npcIndex))..tbBody;
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function zkwq_CallBoss1()
	if zkwq_IsOpen() ~= 1 then
		return 0;
	end
	local npcIndex = CreateNpc("huoqilin_zkweapon", "H�a K� L�n Con", 406, 1415, 2891);
	if npcIndex > 0 then
		SetNpcLifeTime(npcIndex, 7200);
		local msg = format("%s xu�t hi�n � %s, n�u kh�ng th� ��nh b�i n� trong %s gi�, n� s� bi�n m�t. Mau h�nh ��ng n�o!", "H�a K� L�n Con", "V� L�ng S�n (176/180)", 2);
		AddGlobalNews(msg);
		Msg2Global(msg);
	end
end

function zkwq_CallBoss2()
	if zkwq_IsOpen() ~= 1 then
		return 0;
	end
	local npcIndex = CreateNpc("shenshouhuoqilin_zkweapon", "Th�n Th� H�a K� L�n", 218, 1799,3499);
	if npcIndex > 0 then
		SetNpcLifeTime(npcIndex, 7200);
		local msg = format("%s xu�t hi�n � %s, n�u kh�ng th� ��nh b�i n� trong %s gi�, n� s� bi�n m�t. Mau h�nh ��ng n�o!", "Th�n Th� H�a K� L�n", "Linh B�o S�n (224/218)", 2);
		AddGlobalNews(msg);
		Msg2Global(msg);
	end
end


