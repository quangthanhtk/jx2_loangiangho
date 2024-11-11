Import("\\script\\lib\\talktmp.lua")
Import("\\script\\missions\\yp\\ywz\\head.lua")
Import("\\script\\isolate\\functions\\tong_title\\head.lua")

NPC_FORMAT = "<color=green>%s<color>:";

function main()
	if not YWZ_SYSTEM_SWITCH then
		Talk(1,"","Event v�n ch�a kh�i ��ng");
		return 0;
	end
	local npcName = GetNpcName(GetTargetNpc());
	local s  = SDB(YWZ_SHARE_DATA, 1, 0);
	s:apply2(callout(main_CB, npcName));
end

function main_CB(npcName, nCount, sdb)
	local weekly = gf_GetWeekly();
	local nFlag = nil;
	if nCount == 1 then
		local tData = sdb[0];
		if tData[1] == "WeekFlag" and tonumber(tData[2]) == weekly then
			nFlag = 1;
		end
	end
	if not nFlag then
		local s = SDB(YWZ_SHARE_DATA, 1, 0);
		s["WeekFlag"] = {"d", weekly};
		for i = 0, 3 do
			s = SDB(YWZ_SHARE_DATA, 0, i);
			s:delete();
		end
		SetGlbValue(GLV_YWZ_PROTECT_CAMP, 0);
	end
	local tNpc2Shili = {
		["T� ��n ��i L�"] = 1,
		["T� ��n Th� Ph�n"] = 2,
		["T� ��n T�y H�"] = 3,
	}
	local msg = format(NPC_FORMAT, npcName);
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then
		Talk(1,"",msg.."B�n ch�a gia nh�p th� l�c, kh�ng th� tham gia Di�n V� Chi�n.")
		return 0;
	end
	if tNpc2Shili[npcName] ~= nCamp then
		Talk(1,"",msg.."B�n �� gia nh�p th� l�c kh�c, sao c�n ��n t�m ta �� l�m g�? Hay l� c� �m m�u kh�c?");
		return 0;
	end
	if ywz_GetStep() ~= 1 then
		Talk(1,"",msg.."Giai �o�n 1 Th� L�c Ba Phe-Di�n V� Chi�n �� k�t th�c.");
		return 0;
	end
	local tSay = {
		"\n Gi�i thi�u ho�t ��ng/sljt_info",
		"\nLi�n quan x�y d�ng t� ��n th� l�c/sljt_func",
		"\nQuy t�c ho�t ��ng/sljt_rule",
		"\n Tho�t /nothing",
	}
	Say(msg..format("%s, ta c� th� gi�p ���c g� ��y?", gf_GetPlayerSexName()), getn(tSay), tSay);
end

function sljt_info()
	local tSay = {};
	local npcName = GetNpcName(GetTargetNpc());
	tSay.msg = format(NPC_FORMAT, npcName)..format("Th� l�c Thi�n �m Gi�o d�n lui kh�i trung nguy�n, kh�i ph�c nguy�n kh�. Tri�u ��nh nh�m mu�n ng�n ch�n s� ph�n c�ng c�a Thi�n �m Gi�o, quy�t ��nh t�ng c��ng s�c m�nh c�a v� l�m, ban th��ng l�n cho Th� L�c Ba Phe ti�n h�nh di�n v�, �� x�p h�ng cho 3 th� l�c; Th� L�c Ba Phe-Di�n V� Chi�n chia th�nh 2 giai �o�n: X�y d�ng t� ��n th� l�c v� Th� L�c Ba Phe Di�n V�; trong Th� L�c Ba Phe-Di�n V� Chi�n, ��i hi�p c� bi�u hi�n ki�t xu�t s� nh�n ���c th�m ph�n th��ng. Hy v�ng c� th� gi�p �� m�i ng��i.");
	tSay.sel = {
		{"\n Ph�n h�i", "main"},
		{"\n Tho�t ", "nothing"},
	};
	temp_Talk(tSay);
end

function sljt_func()
	local npcName = GetNpcName(GetTargetNpc());
	local lastWeekTaskCount = ywz_GetWeekTaskCount();
	local lastExAwardCount = ywz_GetExAwardCount();
	local tSay = {
		format("Nhi�m v� tu�n (Tu�n n�y c�n ���c ho�n th�nh %d l�n)/#sljt_WeekTask(%d)", lastWeekTaskCount, lastWeekTaskCount),
		format("C�ng hi�n Thi�n Ki�u L�nh (Tu�n n�y c�n %d l�n nh�n th��ng th�m)/#sljt_IBTask(%d)", lastExAwardCount, lastExAwardCount),
		"Xem �� x�y d�ng t� ��n th� l�c/sljt_ShowShiLiRank",
		format("Xem x�p h�ng �i�m x�y d�ng c�a th� l�c/sljt_ShowPlayerRank"),
		"\n Ph�n h�i/main",
		"R�i kh�i/nothing",
	}
	Say(format(NPC_FORMAT, npcName)..format("�i�m x�y d�ng hi�n t�i l� %d �i�m.", ywz_GetScore()), getn(tSay), tSay);
end

function sljt_WeekTask(nTime, bCost)
	if ywz_GetStep() ~= 1 then
		Talk(1,"",msg.."Giai �o�n 1 Th� L�c Ba Phe-Di�n V� Chi�n �� k�t th�c.");
		return 0;
	end
	local npcName = format(NPC_FORMAT, GetNpcName(GetTargetNpc()));
	local nIndex = ywz_GetWeekTaskIndex();
	local nMaxCount = ywz_GetKillMax();
	local nCurrCount = ywz_GetCurrKill();
	if 0 == nIndex then
		if nTime <= 0 then
			Talk(1,"",npcName.."�� d�ng h�t s� l�n nhi�m v� tu�n c�a tu�n n�y.");
			return 0;
		end
		if not bCost then
			local npcName = GetNpcName(GetTargetNpc());
			local tSay = {
				format("Nh�n nhi�m v� (Ti�u hao %d �i�m c�ng hi�n bang)/#sljt_WeekTask(%d, 1)", 4, nTime),
				"\n Ph�n h�i/sljt_func",
				"R�i kh�i/nothing",
			}
			Say(format(NPC_FORMAT, npcName)..format("�i�m x�y d�ng hi�n t�i l� %d �i�m.", ywz_GetScore()), getn(tSay), tSay);
			return 0;
		else
			if get_tong_gxd() < 4 then
				Talk(1,"","�i�m c�ng hi�n bang kh�ng ��, kh�ng th� nh�n nhi�m v�.");
				return 0;
			end
			if dec_tong_gxd(4) == -1 then
				return 0;
			end
			Msg2Player(format("�� ti�u hao %d �i�m c�ng hi�n bang", 4));
		end
		local nRandomIndex = random(getn(YWZ_WEEK_TASK_TABLE));
		local tItem = YWZ_WEEK_TASK_TABLE[nRandomIndex];
		ywz_SetWeekTaskIndex(nRandomIndex);
		ywz_SetKillMax(tItem[1]);
		ywz_AddCurrKill(-nCurrCount);
		ywz_AddWeekTaskCount(1);
		if ywz_GetWeekTaskCount() == 0 then
			AddRuntimeStat(36, 2, 0, 1);
		end
		local msg = format("��n %s, ti�u di�t %d %s", tItem[3], tItem[1], tItem[2]);
		Talk(1,"",npcName..msg);
		TaskTip(msg);
	else
		local tItem = YWZ_WEEK_TASK_TABLE[nIndex];
		if not tItem then
			ywz_SetWeekTaskIndex(0);
			return 0;
		end
		local msg = format("��n %s, ti�u di�t %d %s", tItem[3], tItem[1], tItem[2]);
		local szStatus = "(ch�a ho�n th�nh)"
		local tSay = {}
		if nCurrCount >= nMaxCount then
			szStatus = "(�� ho�n th�nh)";
			tinsert(tSay, "Ho�n th�nh nhi�m v�/sljt_WeekTask_Finish");
		end
		tinsert(tSay, "T�i h� ch� xem qua th�i/nothing");
		Say(npcName..msg..szStatus, getn(tSay), tSay);
	end
end

function sljt_WeekTask_Finish()
	local npcName = format(NPC_FORMAT, GetNpcName(GetTargetNpc()));
	if gf_Judge_Room_Weight(1, 10, npcName) ~= 1 then
		return 0;
	end
	local s = SDB(YWZ_SHARE_DATA, 0, 0);
	s:apply2(sljt_WeekTask_Finish_CB);
end

function sljt_WeekTask_Finish_CB(nCount, sdb)
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nValue = 10;
	for i = 1, nCount do
		local tData = sdb[i-1];
		if tonumber(tData[1]) == nCamp then
			nValue = nValue + tonumber(tData[2]);
		end
	end
	ywz_SetWeekTaskIndex(0);
	local s = SDB(YWZ_SHARE_DATA, 0, 0);
	s.sortType = 2;
	s[nCamp] = {"d", nValue};
	Msg2Player(format("T� ��n th� l�c t�ng %d �i�m c�ng hi�n", 10));
	ywz_AddScore(5);
	Msg2Player(format("Nh�n ���c %d �i�m x�y d�ng", 5));
	local ss= SDB(YWZ_SHARE_DATA, 0, nCamp);
	ss.sortType = 2;
	ss[GetName()] = {"d", ywz_GetScore()};
	ModifyPopur(50);
	Msg2Player(format("C�c h� nh�n ���c %d �i�m tu luy�n", 50));
	local tLimit = {40, 30, 20, 10, 0}; -- ÿ10����ɸ�һ��
	local lastCount = ywz_GetWeekTaskCount();
	for i = 1, getn(tLimit) do
		if tLimit[i] == lastCount then
			gf_AddItemEx2({2, 1, 30969, 1}, "Anh D�ng Ch�ng", "Th� L�c Ba Phe-Di�n V� Chi�n", "Nhi�m v� tu�n", 0, 1);
			AddRuntimeStat(36, 5, 0, 1);
		end
	end
	AddRuntimeStat(36, 1, 0, 1);
	TriggerMisEvent("event_ywz_taskfinish", "Nhi�m v� tu�n", YWZ_WEEK_TASK_LIMIT-lastCount);
end

function sljt_IBTask(nTimes, bEnsure)
	if ywz_GetStep() ~= 1 then
		Talk(1,"",msg.."Giai �o�n 1 Th� L�c Ba Phe-Di�n V� Chi�n �� k�t th�c.");
		return 0;
	end
	local npcName = format(NPC_FORMAT, GetNpcName(GetTargetNpc()));
	if gf_Judge_Room_Weight(1, 10, npcName) ~= 1 then
		return 0;
	end
	if GetItemCount(2, 97, 236) < 1 then
		Talk(1,"",npcName..format("Trong t�i kh�ng c� %s", "Thi�n Ki�u L�nh"));
		return 0;
	end
	if not bEnsure then
		Say(format("Mu�n giao n�p %d Thi�n Ki�u L�nh?", 1), 2, format("\nX�c nh�n/#sljt_IBTask(%d, %d)", nTimes, 1), "\n v� sau xem l�i/nothing");
		return 0;
	end
	local s = SDB(YWZ_SHARE_DATA, 0, 0);
	s:apply2(callout(sljt_IBTask_CB, nTimes));
end

function sljt_IBTask_CB(nTimes, nCount, sdb)
	if DelItem(2, 97, 236, 1) ~= 1 then
		return 0;
	end
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nValue = 30;
	for i = 1, nCount do
		local tData = sdb[i-1];
		if tonumber(tData[1]) == nCamp then
			nValue = nValue + tonumber(tData[2]);
		end
	end
	local s = SDB(YWZ_SHARE_DATA, 0, 0);
	s.sortType = 2;
	s[nCamp] = {"d", nValue};
	Msg2Player(format("T� ��n th� l�c t�ng %d �i�m c�ng hi�n", 30));
	ywz_AddScore(20);
	Msg2Player(format("Nh�n ���c %d �i�m x�y d�ng", 20));
	local ss= SDB(YWZ_SHARE_DATA, 0, nCamp);
	ss.sortType = 2;
	ss[GetName()] = {"d", ywz_GetScore()};
	if nTimes > 0 then
		ywz_AddExAwardCount(1);
		if ywz_GetExAwardCount() == 0 then
			AddRuntimeStat(36, 4, 0, 1);
		end
		gf_AddItemEx2({2, 1, 30968, 1}, "R��ng X�y D�ng Th� L�c", "Th� L�c Ba Phe-Di�n V� Chi�n", "C�ng hi�n Thi�n Ki�u L�nh", 0, 1);
		ModifyPopur(50);
		Msg2Player(format("C�c h� nh�n ���c %d �i�m tu luy�n", 50));
		AddRuntimeStat(41, 6, 0, 1);
	end
	FireEvent("event_ib_cost", 2, 97, 236, 1);
	AddRuntimeStat(36, 3, 0, 1);
end

function sljt_ShowShiLiRank()
	local s = SDB(YWZ_SHARE_DATA, 0, 0);
	s:apply2(sljt_ShowShiLiRank_SB);
end

function sljt_ShowShiLiRank_SB(nCount, sdb)
	local npcName = format(NPC_FORMAT, GetNpcName(GetTargetNpc()));
	local tSay = {};
	local tCamp2Name = {
		[1] = "T� ��n ��i L�",
		[2] = "T� ��n Th� Ph�n",
		[3] = "T� ��n T�y H�",
	}
	local nRank = 1;
	for i = 1, nCount do
		local tData = sdb[i-1];
		local lastData = sdb[i-2];
		local nCamp = tonumber(tData[1])
		local nScore = tonumber(tData[2]);
		if not tCamp2Name[nCamp] then error(format("camp = %d", nCamp)); end
		if lastData and getn(lastData) == 2 and nScore < tonumber(lastData[2]) then
			nRank = nRank + 1;
		end
		tinsert(tSay, format("H�ng %d [%s] (�� x�y d�ng %d)", nRank, tCamp2Name[nCamp], nScore));
	end
	tinsert(tSay, "\n Ph�n h�i/main");
	Say(npcName.."Th� L�c Ba Phe-H�ng �� x�y d�ng hi�n t�i:", getn(tSay), tSay);
end

function sljt_ShowPlayerRank()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local s = SDB(YWZ_SHARE_DATA, 0, nCamp);
	s:apply2(sljt_ShowPlayerRank_SB);
end

function sljt_ShowPlayerRank_SB(nCount, sdb)
	local tSay = {};
	local npcName = GetNpcName(GetTargetNpc());
	tSay.sel = {};
	local nRank = 0;--1;
	local szName = GetName();
	local nMyRank = 0;
	local nMyScore = 0;
	for i = 1, nCount do
		local tData = sdb[i-1];
		local nScore = tonumber(tData[2]);
		--local lastData = sdb[i-2];
		--if lastData and getn(lastData) == 2 and nScore < tonumber(lastData[2]) then
			nRank = nRank + 1;
		--end
		if szName == tData[1] then
			nMyRank = nRank;
			nMyScore = nScore;
			if nRank > 5 then
				break;
			end
		end
		if nRank <= 5 then
			tinsert(tSay.sel, {format("H�ng %d [%s](�i�m x�y d�ng %d)", nRank, tData[1], nScore), "nothing"});
		end
	end
	tinsert(tSay.sel, {"\n Ph�n h�i", "main"});
	tSay.msg = format(NPC_FORMAT, npcName)..format("�i�m x�y d�ng hi�n t�i l� <color=green>%d<color>, h�ng <color=green>%d<color>.", nMyScore, nMyRank);
	temp_Talk(tSay);
end

function sljt_rule()
	local tSay = {};
	local npcName = GetNpcName(GetTargetNpc());
	tSay.msg = format(NPC_FORMAT, npcName).."1. Th�i gian giai �o�n 1 c�a ho�t ��ng l� 00:00 th� 2 ��n 23:00 th� 6 h�ng tu�n\n2. �i�u ki�n tham gia: Ng��i ch�i �� gia nh�p th� l�c.\n3. H�ng tu�n ng��i ch�i t�i �a ch� ���c ho�n th�nh 50 nhi�m v� tu�n, m�i l�n nh�n 1 nhi�m v� tu�n c�n ti�u hao H�o Hi�p L�nh.\n4. N�u trong giai �o�n 1 c�a ho�t ��ng ng��i ch�i ti�n h�nh ��i th� l�c, th� �i�m x�y d�ng c�a ng��i ch�i �� ch� gi� l�i 50%, v� s� l�n nhi�m v� tu�n �� ho�n th�nh v� s� l�n c�ng hi�n Thi�n Ki�u L�nh (tr��c 15 l�n) kh�ng b� �nh h��ng.\n5. Trong giai �o�n 1 c�a ho�t ��ng, ng��i ch�i c�n ��t 120 �i�m x�y d�ng m�i ���c nh�n th��ng x�p h�ng th� l�c; ��t 300 �i�m x�y d�ng m�i ���c nh�n th��ng n�ng ��ng x�y d�ng th� l�c; ��t 950 �i�m x�y d�ng v� th�a �i�u ki�n x�p h�ng m�i nh�n ���c ph�n th��ng h�ng 1-h�ng 3.\n6. Trong giai �o�n 1, �i�m x�y d�ng th� l�c c�a ng��i ch�i n�m trong TOP 100 m�i ���c v�o giai �o�n 2 c�a ho�t ��ng.\n7. N�u ng��i ch�i trong kho�ng th�i gian k�t th�c giai �o�n 1 v� ch�a b�t ��u giai �o�n 2 ti�n h�nh chuy�n th� l�c, th� ng��i ch�i s� m�t t� c�ch tham gia giai �o�n 2 c�a ho�t ��ng.\n8. Trong giai �o�n 1, ng��i ch�i nh�n ���c Anh D�ng Ch�ng c� th� ��i d��c ph�m trong ti�m d��c ph�m Ba Phe Di�n V� t�i b�n �� th� l�c m�nh, npc ti�m d��c ph�m �� c�u ba phe l�: l� Nguy�n H�c, �o�n B�ch, T�n Ph� Kham B�.T�n Ph� Kham B�.";
	tSay.sel = {
		{"\n Ph�n h�i", "main"},
		{"\n Tho�t ", "nothing"},
	};
	temp_Talk(tSay);
end
