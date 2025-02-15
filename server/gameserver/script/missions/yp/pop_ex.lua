Import("\\script\\equip_shop\\equip_shop_head.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\task\\global_task\\gtask_data.lua");
Import("\\script\\lib\\val2str.lua")

thisFile = "\\script\\missions\\yp\\pop_ex.lua";

POPID_TXBJ = 3;
POPID_LSM = 4;
POPID_JBZ = 5;

POP_TASK_FLAG = 3412; --任务完成标记

tPopDailyTask = {
	[1] = {{"箃 v� ti猽 k� b� m蕋", 358, 1}, {"B竜 b譶h an", 359, 2}, {"Thi猲 H祅h Ti猽 C鬰-Uy t輓", 360, 3},},
	[2] = {{"Ti猽 di謙 t薾 g鑓 (H璶g Kh竛h)", 362, 4}, {"Ti猽 di謙 t薾 g鑓 (Qu鷑h K誸)", 363, 5}, {"Ti猽 di謙 t薾 g鑓 (Thi猲 Long T�)", 364, 6},},
	[3] = {{"M鏸 ng祔 m閠 a hoa", 366, 7}, {"Th鴆 ╪ c馻 Tr� Ti觰 B筩h", 367, 8}, {"D� y課 phong ph�", 368, 9},},	
}

tPopWeeklyTask = {
	[1] = {{"Thi猲 H祅h Ti猽 C鬰-ng h裯", 361, {10, 13}},},
	[2] = {{"Thi猲 l� truy hung", 365, {14, 17}},},
	[3] = {{"C玭g t� n鎖 gi薾", 369, {18, 21}},},	
}

function Init()
	--Talk
	AddMisEvent("event_talk_npc", "Thi猲 Kh秈-Ti猽 u", 6300, thisFile, "pop_npc_talk1", "Danh v鋘g Thi猲 H祅h Ti猽 C鬰");
	AddMisEvent("event_talk_npc", "Чp v﹏-L鬰 Phi課 M玭", 6300, thisFile, "pop_npc_talk2", "Danh v鋘g L鬰 Phi課 M玭");
	AddMisEvent("event_talk_npc", "L﹎ Gia Th祅h-ngi gi祏", 6300, thisFile, "pop_npc_talk3", "Danh v鋘g T� B秓 Trai");
	--Clean
	AddMisEvent("event_daily_clean", "X� l� h籲g ng祔", 0, thisFile, "pop_daily_clean");
	AddMisEvent("event_weekly_clean", "X� l� h籲g tu莕", 0, thisFile, "pop_weekly_clean");
	--Task
	AddMisEvent("event_talk_npc", "H祅g x鉳 H祅 Tr� Nhng",  200, thisFile, "_task_npctalk", "Ta n l蕐 D﹜ B莡");
	AddMisEvent("event_talk_npc", "Чi Ch� Cng", 100, thisFile, "_task_npctalk", "Ta n l蕐 Qu� V秈");
	AddMisEvent("event_talk_npc", "Chu U蕋 Ly", 300, thisFile, "_task_npctalk", "Ta n l蕐 Th辴 L筽");
	AddMisEvent("event_talk_npc", "уng M� Qu竛", 6400, thisFile, "_task_package", "H� t鑞g g鉯 h祅g");
	AddMisEvent("event_talk_npc", "Qu竎h T躰h An", 6400, thisFile, "_task_package", "H� t鑞g g鉯 h祅g");
	AddMisEvent("event_talk_npc", "Vi猲 Th玭g Чi S�", 6400, thisFile, "_task_package", "H� t鑞g g鉯 h祅g");
	AddMisEvent("event_talk_npc", "Ti猽 Thi猲 H鵸", 600, thisFile, "_task_package1", "H� t鑞g g鉯 h祅g");
	AddMisEvent("event_talk_npc", "Ti猽 s�", 200, thisFile, "_task_talk2bs", "Th玭g b竜 t譶h h譶h ti猽 c鬰");
	--UseItem
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31052), 0, thisFile, "pop_use_item", "L謓h K� Ti猽 C鬰");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31053), 0, thisFile, "pop_use_item", "L謓h B礽 L鬰 Phi課 M玭");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31054), 0, thisFile, "pop_use_item", "T輓 V藅 T� B秓 Trai");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31055), 0, thisFile, "pop_use_item", "чn Ki誱 Ti猽 S�");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31056), 0, thisFile, "pop_use_item", "M藅 Th� L鬰 Phi課 M玭");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31057), 0, thisFile, "pop_use_item", "H祅g h鉧 b� m蕋");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31175), 0, thisFile, "pop_use_item", "M秐h чn Ki誱 Ti猽 S�");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31176), 0, thisFile, "pop_use_item", "M秐h M藅 Th� L鬰 Phi課 M玭");
	AddMisEvent("event_use_item", format("%d%d%d", 2, 1, 31177), 0, thisFile, "pop_use_item", "уng Ti襫 T� B秓 Trai");	
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
		"G竛h Nh藅 Nguy謙, 甧o Tinh Th莕, t玦  v薾 ti猽 kh玭g co n琲  kh玭g th� v薾 n.",
		"Y誹 quy誸 tu luy謓 khinh c玭g ch� c� ch╩ ch�,kh玭g ng鮪g c� g緉g s� c� thu ho筩h.",
		"Quan quan c� c﹗, t筰 h� chi ch﹗; Y誹 甶襲 th鬰 n�, qu﹏ t� hi猽 c莡 .",
	}
	local tIndex2Pop = {"Danh v鋘g Thi猲 H祅h Ti猽 C鬰", "Danh v鋘g L鬰 Phi課 M玭", "Danh v鋘g T� B秓 Trai"};
	local tIndex2ShopID = {3074, 3075, 3076};
	local nPopValue = GetPop(nPop);
	if nPopValue < 0 then
		Talk(1,"","H穣 ho祅 th祅h nhi謒 v� hng d蒼 danh v鋘g trc r錳 quay l筰!");
		return 0;
	end
	local tLevelName = {
		[0] = "S� xu蕋 mao l�",
		[1] = "B閏 l� t礽 n╪g",
		[2] = "Danh ti課g thc kh雐",
		[3] = "C玭g danh l韓 lao",
		[4] = "C鵸 ph� th辬h danh",
		[5] = "V筺 ngi ngng m�",
	}
	local szMsg = format("(Hi謓 t筰 %s l� <color=green>%s<color> c蕄)", tIndex2Pop[nIndex], tLevelName[GetPopLevel(nPop)]);
	local tSay = {
		format("%s gi韎 thi謚/#pop_info_msg(%d, %d)", tIndex2Pop[nIndex], nNpcIndex, nIndex),
		format("Nhi謒 v� h籲g ng祔/#pop_daily_task(%d)", nPop),
		format("Nhi謒 v� tu莕 ho祅 h籲g tu莕/#pop_weekly_task(%d)", nPop),
		format("C鯽 H祅g %s/#show_equip_shop(%d)", tIndex2Pop[nIndex], tIndex2ShopID[nIndex]),
		"T筰 h� ch� xem qua th玦/nothing",
	}
	Say(format("<color=gold>%s<color>:%s%s", szNpcName, tInfo[nIndex], szMsg), getn(tSay), tSay);
end

function pop_info_msg(nNpcIndex, nIndex)
	local tMsg = {
		"M閠 trong nh鱪g ti猽 c鬰 l韓 nh蕋 trung nguy猲, kh萿 hi謚 uy t輓 thi猲 h�, h祅g n ng ng祔, g莕 y ph竔 t鎛g ti猽 u Thi猲 Kh雐 n Th蕋 L筩 Nhai x﹜ d鵱g ph﹏ c鬰,  m� r閚g ph筸 vi kinh doanh.",
		"B� kho竔 c馻 quan ph� trung nguy猲 l藀 th祅h m閠 t� ch鴆, b� ngo礽 mang tr鋘g tr竎h tr� gian di謙 竎, nh璶g th鵦 t� l� l祄 c玭g vi謈 th竚 th輓h t譶h h譶h ch, gi竚 s竧 quan l筰.",
		"G莕 y m韎 xu蕋 hi謓 t� ch鴆, tng truy襫 l� do thng h閕 � kh緋 n琲 t藀 h頿 th祅h, nh璶g kh玭g r� ngi l穘h o l� ai.",
	}
	Say(format("<color=gold>%s<color>:%s", GetNpcName(nNpcIndex), tMsg[nIndex]), 0);
end

function pop_get_state(nTaskID, nBit)
	if type(nBit) == "number" then
		local nValue = gf_GetTaskBit(POP_TASK_FLAG, nBit);
		if nValue == 0 then
			if tGtTask:check_cur_task(nTaskID) ~= 1 then
				return "(Л頲 nh薾)";
			else
				if DirectIsTaskFinish(nTaskID) ~= 1 then
					return "(ch璦 ho祅 th祅h)";
				else
					return "(Л頲 giao)";
				end
			end
		else
			if tGtTask:check_cur_task(nTaskID) == 1 then
				DirectDeleteTask(nTaskID);
			end
			return "(Ng祔 mai quay l筰)";
		end	
	else 
		local nValue = gf_GetMyTaskBit(POP_TASK_FLAG, nBit[1], nBit[2]);
		local szRet = format("(%d/%d)", min(nValue, 10), 10);
		if nValue < 10 then
			if tGtTask:check_cur_task(nTaskID) ~= 1 then
				return szRet.."(Л頲 nh薾)";
			else
				if DirectIsTaskFinish(nTaskID) ~= 1 then
					return szRet.."(ch璦 ho祅 th祅h)";
				else
					return szRet.."(Л頲 giao)";
				end
			end
		else
			if tGtTask:check_cur_task(nTaskID) == 1 then
				DirectDeleteTask(nTaskID);
			end
			return szRet.."(Tu莕 sau quay l筰)";
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
	tinsert(tSay, "T筰 h� ch� xem qua th玦/nothing");
	local tInfo = {
		"G竛h Nh藅 Nguy謙, 甧o Tinh Th莕, t玦  v薾 ti猽 kh玭g co n琲  kh玭g th� v薾 n.",
		"Y誹 quy誸 tu luy謓 khinh c玭g ch� c� ch╩ ch�,kh玭g ng鮪g c� g緉g s� c� thu ho筩h.",
		"Quan quan c� c﹗, t筰 h� chi ch﹗; Y誹 甶襲 th鬰 n�, qu﹏ t� hi猽 c莡 .",
	}
	Say(format("<color=gold>%s<color>:%s", GetNpcName(GetTargetNpc()), tInfo[nType-2]), getn(tSay), tSay);	
end

function pop_task_talk_do(nTaskID, nBit)
	local nType = type(nBit);
	if nType == "number" then
		if gf_GetTaskBit(POP_TASK_FLAG, nBit) ~= 0 then
			Talk(1,"","Х ho祅 th祅h nhi謒 v� n祔! Ng祔 mai h穣 quay l筰");
			return 0;
		end
	else
		if gf_GetMyTaskBit(POP_TASK_FLAG, nBit[1], nBit[2]) >= 10 then
			Talk(1,"","Х ho祅 th祅h nhi謒 v� n祔! Tu莕 sau h穣 quay l筰");
			return 0;
		end
	end
	if tGtTask:check_cur_task(nTaskID) == 1 then
		if DirectIsTaskFinish(nTaskID) ~= 1 then
			Talk(1,"","V蒼 ch璦 ho祅 th祅h nhi謒 v�!");
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
			Msg2Player("Nhi謒 v� ho祅 th祅h!");
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
	local tName = {"Danh v鋘g Thi猲 H祅h Ti猽 C鬰", "Danh v鋘g L鬰 Phi課 M玭", "Danh v鋘g T� B秓 Trai"};
	Msg2Player(format("B筺 nh薾 頲 %d%s", 2000, tName[nPopID-2]));
end

function _gtask_award1(nPopID)
	AddPop(nPopID, 100);
	local tName = {"Danh v鋘g Thi猲 H祅h Ti猽 C鬰", "Danh v鋘g L鬰 Phi課 M玭", "Danh v鋘g T� B秓 Trai"};
	Msg2Player(format("B筺 nh薾 頲 %d%s", 100, tName[nPopID-2]));
end

function _task_npctalk(nNpcIndex)
	local szNpcName = GetNpcName(nNpcIndex);
	local tP = {
		["H祅g x鉳 H祅 Tr� Nhng"] = 31049,
		["Чi Ch� Cng"] = 31050,
		["Chu U蕋 Ly"] = 31051,
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
		["уng M� Qu竛"] = 3414,
		["Qu竎h T躰h An"] = 3415,
		["Vi猲 Th玭g Чi S�"] = 3416,
	}
	if tGtTask:check_cur_task(360) ~= 1 then
		return 0;
	end
	if GetTask(tTask[szNpcName]) == 1 then
		Talk(1,"",format("%s t骾  竝 gi秈 ho祅 th祅h", szNpcName));
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
	NpcChat(PIdx2NpcIdx(), "G莕 y t譶h h譶h kinh doanh c馻 ti猽 c鬰 Th蕋 L筩 Nhai r蕋 t鑤, t鎛g ti猽 u nh� ta chuy觧 l阨 cho ngi");
	NpcChat(nNpcIndex, "T鑤, v蕋 v� r錳!");
	SetTask(3413, 1);
end

function pop_use_item(nItemIndex)
	Say(format("Quy誸 nh d飊g <color=gold>%s<color> kh玭g?", GetItemName(nItemIndex)), 
		2, format("\nX竎 nh薾/#pop_use_item_do(%d)", nItemIndex), "\nT玦 ch� xem xem th玦/nothing");
end

function pop_use_item_do(nItemIndex)
	local t = {
		[31052] = {POPID_TXBJ, 100, "Danh v鋘g Thi猲 H祅h Ti猽 C鬰"},
		[31053] = {POPID_LSM, 100, "Danh v鋘g L鬰 Phi課 M玭"},
		[31054] = {POPID_JBZ, 100, "Danh v鋘g T� B秓 Trai"},
		[31055] = {POPID_TXBJ, 10, "Danh v鋘g Thi猲 H祅h Ti猽 C鬰"},
		[31056] = {POPID_LSM, 10, "Danh v鋘g L鬰 Phi課 M玭"},   
		[31057] = {POPID_JBZ, 10, "Danh v鋘g T� B秓 Trai"},   
		[31175] = {POPID_TXBJ, 2, "Danh v鋘g Thi猲 H祅h Ti猽 C鬰"},
		[31176] = {POPID_LSM, 2, "Danh v鋘g L鬰 Phi課 M玭"},   
		[31177] = {POPID_JBZ, 2, "Danh v鋘g T� B秓 Trai"}, 
	}
	local nP = GetItemParticular(nItemIndex);
	local tAward = t[nP];
	if IsUsePop(tAward[1]) ~=1 then
		Talk(1,"",format("H穣 m� %s r錳 d飊g v藅 ph萴 n祔", tAward[3]));
		return 0;
	end
	if DelItemByIndex(nItemIndex, 1) ~= 1 then
		return 0;
	end
	AddPop(tAward[1], tAward[2]);
	Msg2Player(format("Nh薾 頲 %d 甶觤 %s", tAward[2], tAward[3]));
end