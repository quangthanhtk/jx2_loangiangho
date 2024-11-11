Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Import("\\script\\lib\\globalfunctions.lua")

Import("\\script\\ksgvn\\lib.lua")

gJbz_Period	= EVENT_TUBAOTRAI_VERSION; --�ڼ���

t_isolate_base_cfg = {
  nPriority 			= 1,
  szEngName 			= "jbz",
  szViewName 			= "T� B�o Trai",
  nTalkBeginDate 	= EVENT_TUBAOTRAI_START_DATE,
  nBeginDate 			= EVENT_TUBAOTRAI_START_DATE,
  nEndDate 				= EVENT_TUBAOTRAI_END_DATE,
}

NPC_NAME = "<color=green>Ch� Th��ng H�i<color>:"

TASK_JBZ_PERIOD = 3404;
TASK_JBZ_FLAG = 3405; --1,2byte�ۼƴ�����3byte�ۼƽ�����ȡ��ǣ�4byte�¿���ȡ��ʯ���

JBZ_ACC_TABLE = {
	{100, "Qu�n C�ng Huy Ho�ng", {2,1,9977,2}, 30},
	-- {100, "��������", {2,1,31060,1,4}, 0},
	{500, format("T�i �� Qu� C�p 5*%d", 1), {2,1,31024,1}, 0},
	{1000, "Qu�n C�ng Huy Ho�ng", {2,1,9977,4}, 30},
	{2000, format("T�i �� Qu� C�p 6*%d", 2), {2,1,31123,2}, 0},
	{3000, format("Bao �� qu� c�p 7*%d", 1), {2,1,31505,1}, 0},
	{5000, "Th��ng H�i Ch�u c�p 5 (ch�a gi�m ��nh)", {2,102,223,1}, 0},
	{8000, format("T�i Trang B� Kim X� C�p 7 x%d",1), {2,1,31400,1}, 	0 	},
	{10000, "Th��ng H�i Ch�u c�p 6 (ch�a gi�m ��nh)", {2,102,224,1}, 0},
	{20000, "T�i H�a Ph�ng *2", {2,1,50020,2}, 0},
	{30000, "C� Ph�-T�i T�n Quy�n *5", {2,1,50028,5}, 0},
}

function handle_xuanshi_event(tEvent, data, para)
	--gf_PrintTable(tEvent)
	--gf_PrintTable(data)
	--gf_PrintTable(para)
	if GetFreeItemRoom() < 1 then
		return 0;
	end
	gf_AddItemEx2({2, 1, 30997, 1}, "Huy�n Th�ch", "T� B�o Trai", "Ho�n th�nh nhi�m v� nh�n Huy�n Th�ch", 0, 1);
end

t_isolate_user_batch_watch_list = {
	{"event_mission_task_award", {"liangshan","1chuyan", -1}, handle_xuanshi_event,	{"Ho�n th�nh nhi�m v� khi�u chi�n L��ng S�n-S�"},  },
	{"event_mission_task_award", {"liangshan","2zhongyong", -1}, handle_xuanshi_event,	{"Ho�n th�nh nhi�m v� khi�u chi�n L��ng S�n-Trung D�ng"},  },
	{"event_mission_task_award", {"wanjianzhong","1daily_pass", -1}, handle_xuanshi_event,	{"Ho�n th�nh nhi�m v� V�n Ki�m Tr�ng h�ng ng�y"},  },
	{"event_mission_task_award", {"wanjianzhong","2daily_fanpai", -1}, handle_xuanshi_event,	{"Ho�n th�nh nhi�m v� V�n Ki�m Tr�ng h�ng ng�y"},  },
	{"event_mission_task_award", {"dixuangong","2dapo", -1}, handle_xuanshi_event,	{"Ho�n th�nh nhi�m v� ��i ph� ��a Huy�n Cung"},  },
}

function on_init_ok()
	isolate_enable_event_dispatch(-1)
end

function on_add_watches()
	isolate_watch_npc_talk("Ch� th��ng h�i", 350, "handle_npc_talk_main")
	isolate_watch_npc_talk("Ch� th��ng h�i", 300, "handle_npc_talk_main")
	isolate_watch_npc_talk("Ch� th��ng h�i", 100, "handle_npc_talk_main")
end

function handle_npc_talk_main()
	if GetTask(TASK_JBZ_PERIOD) ~= gJbz_Period then
		SetTask(TASK_JBZ_PERIOD, gJbz_Period, TASK_ACCESS_CODE_JBZ);
		SetTask(TASK_JBZ_FLAG, 0, TASK_ACCESS_CODE_JBZ);
	end
	local msg = "G�n ��y c�c Ch� Th��ng H�i nh�n ���c l�i m�i c�a m�t ng��i th�n b� ��n Tuy�n Ch�u, kh�ng l�u sau trong giang h� c� tin ��n: Ch� Th��ng H�i � kh�p n�i �� l�p m�t t� ch�c c� t�n 'T� B�o Trai', ��ng th�i thu th�p m�t l��ng l�n v�t ph�m trong V�n Ki�m Tr�ng, ��a Huy�n Cung v� L��ng S�n c� t�n l� 'Huy�n Th�ch', ti�c l� b�n t�nh c�a th��ng nh�n c�ng keo ki�t, c�c ��i hi�p nh�n ���c v�t ph�m g� trong T� B�o Trai th� ph�i xem c� duy�n c�a m�nh.";
	local tSay = {
		format("M� T� B�o Trai (K� %d)/open_jbz", gJbz_Period),
		"Nh�n th��ng t�ch l�y T� B�o Trai/get_acc_award",
		"Th� th�ng nh�n Huy�n Th�ch/get_vipvard_award",
		"\nT�i ch� xem xem th�i/nothing"
	}
	Say(NPC_NAME..msg, getn(tSay), tSay);
end

function open_jbz()
	SendScript2Client("Open[[JbzBox]]");	
end

function get_acc_award()
	local msg = "D�ng r�t may m�n ��t s� l�n nh�t ��nh th� ��i hi�p s� nh�n ���c ph�n th��ng th�m";
	local nTimes = gf_GetMyTaskByte(TASK_JBZ_FLAG, 1, 2);
	msg = msg..format("(%s s� l�n r�t may m�n hi�n t�i l� <color=green>%d<color>)", gf_GetPlayerSexName(), nTimes);
	local tStatus = {"Ch�a nh�n", "�� nh�n"};
	local tSay = {};
	for i = 1, getn(JBZ_ACC_TABLE) do
		local v = JBZ_ACC_TABLE[i];
		local n = gf_GetTaskBit(TASK_JBZ_FLAG, 16 + i) + 1;
		tinsert(tSay, format("T�ch l�y r�t may m�n %d l�n ���c nh�n %s(%s)/#get_acc_award_deal(%d)", v[1], v[2], tStatus[n], i));
	end
	tinsert(tSay, "\nT�i ch� xem xem th�i/nothing");
	Say(NPC_NAME..msg, getn(tSay), tSay);
end

function get_acc_award_deal(index)
	local t = JBZ_ACC_TABLE[index];
	local nTimes = gf_GetMyTaskByte(TASK_JBZ_FLAG, 1, 2);
	local n = gf_GetTaskBit(TASK_JBZ_FLAG, 16 + index);
	if nTimes < t[1] then
		Talk(1,"",NPC_NAME..format("S� l�n t�ch l�y r�t may m�n ch�a ��t %d/%d", nTimes, t[1]));
		return 0;
	end
	if n ~= 0 then
		Talk(1,"",NPC_NAME.."B�n �� nh�n ph�n th��ng n�y r�i");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, NPC_NAME) ~= 1 then
		return 0;
	end
	gf_SetTaskBit(TASK_JBZ_FLAG, 16 + index, 1, TASK_ACCESS_CODE_JBZ);
	gf_AddItemEx2(t[3], GetItemName(t[3][1], t[3][2], t[3][3]), "T� B�o Trai", "Th��ng t�ch l�y", t[4] * 24 * 3600, 1);
	local bFlag = nil
	local nCount = getn(JBZ_ACC_TABLE);
	for i = 1, nCount do
		if gf_GetTaskBit(TASK_JBZ_FLAG, 16 + i) ~= 1 then
			bFlag = 1;
		end
	end
	if not bFlag then
		gf_SetMyTaskByte(TASK_JBZ_FLAG, 1, 2, nTimes - JBZ_ACC_TABLE[nCount][1], TASK_ACCESS_CODE_JBZ);
		gf_SetTaskByte(TASK_JBZ_FLAG, 3, 0, TASK_ACCESS_CODE_JBZ);
		Msg2Player("�� reset s� l�n th��ng t�ch l�y may m�n");
	end
end

function get_vipvard_award()
	if gf_GetTaskByte(TASK_JBZ_FLAG, 4) ~= 0 then
		Talk(1,"",NPC_NAME.."M�i ��t ho�t ��ng ch� ���c nh�n 1 l�n");
		return 0;
	end
	if IsActivatedVipCard() ~= 1 then
		Talk(1,"",NPC_NAME.."Sau khi k�ch ho�t th� th�ng m�i ���c nh�n Huy�n Th�ch");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, NPC_NAME) ~= 1 then
		return 0;
	end
	gf_SetTaskByte(TASK_JBZ_FLAG, 4, 1, TASK_ACCESS_CODE_JBZ)
	gf_AddItemEx2({2, 1, 30997, 10}, "Huy�n Th�ch", "T� B�o Trai", "K�ch ho�t th� th�ng nh�n Huy�n Th�ch", 0, 1);
end
