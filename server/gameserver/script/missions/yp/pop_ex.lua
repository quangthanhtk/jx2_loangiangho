Import("\\script\\equip_shop\\equip_shop_head.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\task\\global_task\\gtask_data.lua");
Import("\\script\\lib\\val2str.lua")

thisFile = "\\script\\missions\\yp\\pop_ex.lua";

POPID_TXBJ = 3;
POPID_LSM = 4;
POPID_JBZ = 5;

POP_TASK_FLAG = 3412; --������ɱ��

tPopDailyTask = {
	[1] = {{"�o�t v� ti�u k� b� m�t", 358, 1}, {"B�o b�nh an", 359, 2}, {"Thi�n H�nh Ti�u C�c-Uy t�n", 360, 3},},
	[2] = {{"Ti�u di�t t�n g�c (H�ng Kh�nh)", 362, 4}, {"Ti�u di�t t�n g�c (Qu�nh K�t)", 363, 5}, {"Ti�u di�t t�n g�c (Thi�n Long T�)", 364, 6},},
	[3] = {{"M�i ng�y m�t ��a hoa", 366, 7}, {"Th�c �n c�a Tr� Ti�u B�ch", 367, 8}, {"D� y�n phong ph�", 368, 9},},	
}

tPopWeeklyTask = {
	[1] = {{"Thi�n H�nh Ti�u C�c-��ng h�n", 361, {10, 13}},},
	[2] = {{"Thi�n l� truy hung", 365, {14, 17}},},
	[3] = {{"C�ng t� n�i gi�n", 369, {18, 21}},},	
}

function Init()
	--Talk
	AddMisEvent("event_talk_npc", "Thi�n Kh�i-Ti�u ��u", 6300, thisFile, "pop_npc_talk1", "Danh v�ng Thi�n H�nh Ti�u C�c");
	AddMisEvent("event_talk_npc", "��p v�n-L�c Phi�n M�n", 6300, thisFile, "pop_npc_talk2", "Danh v�ng L�c Phi�n M�n");
	AddMisEvent("event_talk_npc", "L�m Gia Th�nh-ng��i gi�u", 6300, thisFile, "pop_npc_talk3", "Danh v�ng T� B�o Trai");
	--Clean
	AddMisEvent("event_daily_clean", "X� l� h�ng ng�y", 0, thisFile, "pop_daily_clean");
	AddMisEvent("event_weekly_clean", "X� l� h�ng tu�n", 0, thisFile, "pop_weekly_clean");
	--Task
	AddMisEvent("event_talk_npc", "H�ng x�m H�n Tr� Nh��ng",  200, thisFile, "_task_npctalk", "Ta ��n l�y D�y B�u");
	AddMisEvent("event_talk_npc", "��i Ch� C��ng", 100, thisFile, "_task_npctalk", "Ta ��n l�y Qu� V�i");
	AddMisEvent("event_talk_npc", "Chu U�t Ly", 300, thisFile, "_task_npctalk", "Ta ��n l�y Th�t L�p");
	AddMisEvent("event_talk_npc", "��ng M� Qu�n", 6400, thisFile, "_task_package", "H� t�ng g�i h�ng");
	AddMisEvent("event_talk_npc", "Qu�ch T�nh An", 6400, thisFile, "_task_package", "H� t�ng g�i h�ng");
	AddMisEvent("event_talk_npc", "Vi�n Th�ng ��i S�", 6400, thisFile, "_task_package", "H� t�ng g�i h�ng");
	AddMisEvent("event_talk_npc", "Ti�u Thi�n H�u", 600, thisFile, "_task_package1", "H� t�ng g�i h�ng");
	AddMisEvent("event_talk_npc", "Ti�u s�", 200, thisFile, "_task_talk2bs", "Th�ng b�o t�nh h�nh ti�u c�c");
	--UseItem
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31052), 0, thisFile, "pop_use_item", "L�nh K� Ti�u C�c");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31053), 0, thisFile, "pop_use_item", "L�nh B�i L�c Phi�n M�n");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31054), 0, thisFile, "pop_use_item", "T�n V�t T� B�o Trai");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31055), 0, thisFile, "pop_use_item", "��n Ki�m Ti�u S�");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31056), 0, thisFile, "pop_use_item", "M�t Th� L�c Phi�n M�n");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31057), 0, thisFile, "pop_use_item", "H�ng h�a b� m�t");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31175), 0, thisFile, "pop_use_item", "M�nh ��n Ki�m Ti�u S�");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31176), 0, thisFile, "pop_use_item", "M�nh M�t Th� L�c Phi�n M�n");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31177), 0, thisFile, "pop_use_item", "��ng Ti�n T� B�o Trai");	
end

function pop_npc_talk1(nNpcIndex)
	pop_npc_talk(nNpcIndex, 1);
end

function pop_npc_talk2(nNpcIndex)
	pop_npc_talk(nNpcIndex, 2);
end

function pop_npc_talk3(nNpcIndex)
	pop_npc_talk(nNpcIndex, 3);
end

function pop_npc_talk(nNpcIndex, nIndex)
	local szNpcName = GetNpcName(nNpcIndex);
	local nPop = nIndex + 2;
	local tInfo = {
		"G�nh Nh�t Nguy�t, �eo Tinh Th�n, t�i  v�n ti�u kh�ng co n�i  kh�ng th� v�n ��n.",
		"Y�u quy�t tu luy�n khinh c�ng ch� c� ch�m ch�,kh�ng ng�ng c� g�ng s� c� thu ho�ch.",
		"Quan quan c� c�u, t�i h� chi ch�u; Y�u �i�u th�c n�, qu�n t� hi�u c�u .",
	}
	local tIndex2Pop = {"Danh v�ng Thi�n H�nh Ti�u C�c", "Danh v�ng L�c Phi�n M�n", "Danh v�ng T� B�o Trai"};
	local tIndex2ShopID = {3074, 3075, 3076};
	local nPopValue = GetPop(nPop);
	if nPopValue < 0 then
		Talk(1,"","H�y ho�n th�nh nhi�m v� h��ng d�n danh v�ng tr��c r�i quay l�i!");
		return 0;
	end
	local tLevelName = {
		[0] = "S� xu�t mao l�",
		[1] = "B�c l� t�i n�ng",
		[2] = "Danh ti�ng th��c kh�i",
		[3] = "C�ng danh l�n lao",
		[4] = "C�u ph� th�nh danh",
		[5] = "V�n ng��i ng��ng m�",
	}
	local szMsg = format("(Hi�n t�i %s l� <color=green>%s<color> c�p)", tIndex2Pop[nIndex], tLevelName[GetPopLevel(nPop)]);
	local tSay = {
		format("%s gi�i thi�u/#pop_info_msg(%d, %d)", tIndex2Pop[nIndex], nNpcIndex, nIndex),
		format("Nhi�m v� h�ng ng�y/#pop_daily_task(%d)", nPop),
		format("Nhi�m v� tu�n ho�n h�ng tu�n/#pop_weekly_task(%d)", nPop),
		format("C�a H�ng %s/#show_equip_shop(%d)", tIndex2Pop[nIndex], tIndex2ShopID[nIndex]),
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say(format("<color=gold>%s<color>:%s%s", szNpcName, tInfo[nIndex], szMsg), getn(tSay), tSay);
end

function pop_info_msg(nNpcIndex, nIndex)
	local tMsg = {
		"M�t trong nh�ng ti�u c�c l�n nh�t trung nguy�n, kh�u hi�u uy t�n thi�n h�, h�ng ��n ��ng ng�y, g�n ��y ph�i t�ng ti�u ��u Thi�n Kh�i ��n Th�t L�c Nhai x�y d�ng ph�n c�c, �� m� r�ng ph�m vi kinh doanh.",
		"B� kho�i c�a quan ph� trung nguy�n l�p th�nh m�t t� ch�c, b� ngo�i mang tr�ng tr�ch tr� gian di�t �c, nh�ng th�c t� l� l�m c�ng vi�c th�m th�nh t�nh h�nh ��ch, gi�m s�t quan l�i.",
		"G�n ��y m�i xu�t hi�n t� ch�c, t��ng truy�n l� do th��ng h�i � kh�p n�i t�p h�p th�nh, nh�ng kh�ng r� ng��i l�nh ��o l� ai.",
	}
	Say(format("<color=gold>%s<color>:%s", GetNpcName(nNpcIndex), tMsg[nIndex]), 0);
end

function pop_get_state(nTaskID, nBit)
	if type(nBit) == "number" then
		local nValue = gf_GetTaskBit(POP_TASK_FLAG, nBit);
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
	else 
		local nValue = gf_GetMyTaskBit(POP_TASK_FLAG, nBit[1], nBit[2]);
		local szRet = format("(%d/%d)", min(nValue, 10), 10);
		if nValue < 10 then
			if tGtTask:check_cur_task(nTaskID) ~= 1 then
				return szRet.."(���c nh�n)";
			else
				if DirectIsTaskFinish(nTaskID) ~= 1 then
					return szRet.."(ch�a ho�n th�nh)";
				else
					return szRet.."(���c giao)";
				end
			end
		else
			if tGtTask:check_cur_task(nTaskID) == 1 then
				DirectDeleteTask(nTaskID);
			end
			return szRet.."(Tu�n sau quay l�i)";
		end
	end
end

function pop_task_talk(nType, tTaskGroup)
	local tTask = tTaskGroup[nType-2];
	local tSay = {};	
	for i = 1, getn(tTask) do
		tinsert(tSay, format("%s%s/#pop_task_talk_do(%d, %s)", 
			tTask[i][1], pop_get_state(tTask[i][2], tTask[i][3]), tTask[i][2], Val2Str(tTask[i][3])));
	end
	tinsert(tSay, "T�i h� ch� xem qua th�i/nothing");
	local tInfo = {
		"G�nh Nh�t Nguy�t, �eo Tinh Th�n, t�i  v�n ti�u kh�ng co n�i  kh�ng th� v�n ��n.",
		"Y�u quy�t tu luy�n khinh c�ng ch� c� ch�m ch�,kh�ng ng�ng c� g�ng s� c� thu ho�ch.",
		"Quan quan c� c�u, t�i h� chi ch�u; Y�u �i�u th�c n�, qu�n t� hi�u c�u .",
	}
	Say(format("<color=gold>%s<color>:%s", GetNpcName(GetTargetNpc()), tInfo[nType-2]), getn(tSay), tSay);	
end

function pop_task_talk_do(nTaskID, nBit)
	local nType = type(nBit);
	if nType == "number" then
		if gf_GetTaskBit(POP_TASK_FLAG, nBit) ~= 0 then
			Talk(1,"","�� ho�n th�nh nhi�m v� n�y! Ng�y mai h�y quay l�i");
			return 0;
		end
	else
		if gf_GetMyTaskBit(POP_TASK_FLAG, nBit[1], nBit[2]) >= 10 then
			Talk(1,"","�� ho�n th�nh nhi�m v� n�y! Tu�n sau h�y quay l�i");
			return 0;
		end
	end
	if tGtTask:check_cur_task(nTaskID) == 1 then
		if DirectIsTaskFinish(nTaskID) ~= 1 then
			Talk(1,"","V�n ch�a ho�n th�nh nhi�m v�!");
			return 0;
		end
		if DirectFinishGTask(nTaskID, 2) ==  1 then
			if nType == "number" then
				gf_SetTaskBit(POP_TASK_FLAG, nBit, 1);
			else
				gf_SetMyTaskBit(POP_TASK_FLAG, nBit[1], nBit[2], gf_GetMyTaskBit(POP_TASK_FLAG, nBit[1], nBit[2]) + 1)
			end
			if nTaskID == 359 then SetTask(3413, 0) end
			if nTaskID == 360 then for i = 3414, 3416 do SetTask(i, 0) end end
			if nTaskID == 361 then SetTask(3417, 0) end
			SetCurrentNpcSFX(GetTargetNpc(), 907, 2, 0, 18*5);
			Msg2Player("Nhi�m v� ho�n th�nh!");
			local tTaskID2Static = {
				[358] = 1, [359] = 1, [360] = 1, [361] = 4,
				[362] = 2, [363] = 2, [364] = 2, [365] = 5,
				[366] = 3, [367] = 3, [368] = 3, [369] = 6,
			}
			AddRuntimeStat(42, tTaskID2Static[nTaskID], 0, 1);
		else
			DirectDeleteTask(nTaskID);
		end
	else
		DirectGetGTask(nTaskID, 1);
		SetCurrentNpcSFX(GetTargetNpc(), 906, 2, 0, 18*5);
	end
end

function pop_daily_task(nType)
	pop_task_talk(nType, tPopDailyTask);
end
	
function pop_weekly_task(nType)
	pop_task_talk(nType, tPopWeeklyTask);
end

function pop_task_clean(t)
	for _, v in t do
		for _, m in v do
			if tGtTask:check_cur_task(m[2]) ~= 1 then
				if type(m[3]) == "table" then
					gf_SetMyTaskBit(POP_TASK_FLAG, m[3][1], m[3][2], 0);
				else
					gf_SetTaskBit(POP_TASK_FLAG, m[3], 0);
				end
			end
		end
	end
end

function pop_daily_clean()
	local t = {[3] = 348, [4] = 352, [5] = 357,}
	for k, v in t do		
		if IsUsePop(k) == 0 and tGtTask:check_task_isfinish(v) == 1 then
			OpenPop(k);
			AddPop(k, 2000);
		end
	end
	pop_task_clean(tPopDailyTask);
end

function pop_weekly_clean()
	pop_task_clean(tPopWeeklyTask);
end

function _gtask_award(nPopID)
	OpenPop(nPopID);
	AddPop(nPopID, 2000);
	local tName = {"Danh v�ng Thi�n H�nh Ti�u C�c", "Danh v�ng L�c Phi�n M�n", "Danh v�ng T� B�o Trai"};
	Msg2Player(format("B�n nh�n ���c %d%s", 2000, tName[nPopID-2]));
end

function _gtask_award1(nPopID)
	AddPop(nPopID, 100);
	local tName = {"Danh v�ng Thi�n H�nh Ti�u C�c", "Danh v�ng L�c Phi�n M�n", "Danh v�ng T� B�o Trai"};
	Msg2Player(format("B�n nh�n ���c %d%s", 100, tName[nPopID-2]));
end

function _task_npctalk(nNpcIndex)
	local szNpcName = GetNpcName(nNpcIndex);
	local tP = {
		["H�ng x�m H�n Tr� Nh��ng"] = 31049,
		["��i Ch� C��ng"] = 31050,
		["Chu U�t Ly"] = 31051,
	}
	if tGtTask:check_cur_task(356) ~= 1 and tGtTask:check_cur_task(368) ~= 1 then
		return 0;
	end
	if BigGetItemCount(2, 1, tP[szNpcName]) > 0 then
		return 0;
	end
	AddItem(2, 1, tP[szNpcName], 1);
end

function _task_package(nNpcIndex)
	local szNpcName = GetNpcName(nNpcIndex);
	local tTask = {
		["��ng M� Qu�n"] = 3414,
		["Qu�ch T�nh An"] = 3415,
		["Vi�n Th�ng ��i S�"] = 3416,
	}
	if tGtTask:check_cur_task(360) ~= 1 then
		return 0;
	end
	if GetTask(tTask[szNpcName]) == 1 then
		Talk(1,"",format("%s t�i �� �p gi�i ho�n th�nh", szNpcName));
		return 0;
	end
	if DelItem(2, 1, 31043, 1) ~= 1 then
		return 0;
	end
	SetTask(tTask[szNpcName], 1);
end

function _task_package1(nNpcIndex)
	if tGtTask:check_cur_task(361) ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 31044, 1) ~= 1 then
		return 0;
	end
	SetTask(3417, 1);
end

function _task_talk2bs(nNpcIndex)
	if tGtTask:check_cur_task(359) ~= 1 then
		return 0;
	end	
	NpcChat(PIdx2NpcIdx(), "G�n ��y t�nh h�nh kinh doanh c�a ti�u c�c Th�t L�c Nhai r�t t�t, t�ng ti�u ��u nh� ta chuy�n l�i cho ng��i");
	NpcChat(nNpcIndex, "T�t, v�t v� r�i!");
	SetTask(3413, 1);
end

function pop_use_item(nItemIndex)
	Say(format("Quy�t ��nh d�ng <color=gold>%s<color> kh�ng?", GetItemName(nItemIndex)), 
		2, format("\nX�c nh�n/#pop_use_item_do(%d)", nItemIndex), "\nT�i ch� xem xem th�i/nothing");
end

function pop_use_item_do(nItemIndex)
	local t = {
		[31052] = {POPID_TXBJ, 100, "Danh v�ng Thi�n H�nh Ti�u C�c"},
		[31053] = {POPID_LSM, 100, "Danh v�ng L�c Phi�n M�n"},
		[31054] = {POPID_JBZ, 100, "Danh v�ng T� B�o Trai"},
		[31055] = {POPID_TXBJ, 10, "Danh v�ng Thi�n H�nh Ti�u C�c"},
		[31056] = {POPID_LSM, 10, "Danh v�ng L�c Phi�n M�n"},   
		[31057] = {POPID_JBZ, 10, "Danh v�ng T� B�o Trai"},   
		[31175] = {POPID_TXBJ, 2, "Danh v�ng Thi�n H�nh Ti�u C�c"},
		[31176] = {POPID_LSM, 2, "Danh v�ng L�c Phi�n M�n"},   
		[31177] = {POPID_JBZ, 2, "Danh v�ng T� B�o Trai"}, 
	}
	local nP = GetItemParticular(nItemIndex);
	local tAward = t[nP];
	if IsUsePop(tAward[1]) ~=1 then
		Talk(1,"",format("H�y m� %s r�i d�ng v�t ph�m n�y", tAward[3]));
		return 0;
	end
	if DelItemByIndex(nItemIndex, 1) ~= 1 then
		return 0;
	end
	AddPop(tAward[1], tAward[2]);
	Msg2Player(format("Nh�n ���c %d �i�m %s", tAward[2], tAward[3]));
end