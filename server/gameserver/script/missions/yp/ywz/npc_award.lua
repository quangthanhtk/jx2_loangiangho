Import("\\script\\missions\\yp\\ywz\\head.lua")
Import("\\script\\missions\\yp\\ywz\\mission_head.lua")

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
	local tSay = {
		"Ph�n th��ng giai �o�n 1/ywz_GetAward1",
		"Ph�n th��ng giai �o�n 2/ywz_GetAward2",
		"Quy t�c nh�n th��ng/ywz_GetAwardInfo",
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say("� ch� c�a ta c� th� nh�n th��ng li�n quan ��n Th� L�c Ba Phe-Di�n V� Chi�n, th�i gian nh�n th��ng giai �o�n 1 l�: <color=green>00:00-18:00 th� 7<color>, th�i gian nh�n th��ng giai �o�n 2 l�: <color=green>21:00-23:00 th� 7<color>", getn(tSay), tSay);
end

function ywz_GetAward1()
	if ywz_GetStep() ~= 2 then
		Talk(1,"","Hi�n kh�ng ph�i th�i gian nh�n th��ng.");
		return 0;
	end
	local tSay = {
		"Nh�n th��ng x�p h�ng th� l�c/ywz_GetAward1_RankAward",
		"Nh�n th��ng �� n�ng ��ng x�y d�ng/ywz_GetAward1_AcitivtyAward",
		"Nh�n th��ng x�p h�ng c� nh�n/ywz_GetAward1_PlayerRankAward",
		"Ra kh�i/nothing",
	}
	Say("Ph�n th��ng giai �o�n 1 Th� L�c Ba Phe-Di�n V� Chi�n:", getn(tSay), tSay);
end

function ywz_GetAward2()
	if ywz_GetStep() ~= 4 then
		Talk(1,"","Hi�n kh�ng ph�i th�i gian nh�n th��ng.");
		return 0;
	end
	if gf_GetTaskByte(YWZM_TASK_MISSION_VALUE, 4) ~= 1 then
		Talk(1,"","Di�n V� Chi�n b� tho�t ra b�t th��ng, th�nh t�ch v� hi�u.");
		return 0;
	end
	local tSay = {
		"Nh�n th��ng x�p h�ng th� l�c/ywz_GetAward2_RankAward",
		"Nh�n th��ng x�p h�ng c� nh�n/ywz_GetAward2_PlayerRankAward",
		"Nh�n ph�n th��ng n�ng ��ng di�n v�/ywz_GetAward2_ActivityAward",
		"Ra kh�i/nothing",
	}
	Say("Ph�n th��ng giai �o�n 2 Th� L�c Ba Phe-Di�n V� Chi�n:", getn(tSay), tSay);
end

function ywz_GetAward1_RankAward()
	if ywz_GetAward1Flag1() ~= 0 then
		Talk(1,"","�� nh�n ph�n th��ng n�y r�i.");
		return 0;
	end
	local nScore = ywz_GetScore();
	if nScore < 120 then
		Talk(1,"",format("�i�m x�y d�ng c�a b�n l� %d, kh�ng �� %d �i�m, kh�ng th� nh�n th��ng x�p h�ng th� l�c.", nScore, 120));
		return 0;
	end
	local s = SDB(YWZ_SHARE_DATA, 0, 0);
	s:apply2(ywz_GetAward1_RankAward_CB);
end

function ywz_GetAward1_RankAward_CB(nCount, sdb)
	--gf_PrintTable(sdb)
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP)
	local nRank = 1;
	local bFlag = nil;
	for i = 1, nCount do
		local tData = sdb[i-1];
		local lastData = sdb[i-2];
		if lastData and getn(lastData) == 2 and tonumber(tData[2]) < tonumber(lastData[2]) then
			nRank = nRank + 1;
		end
		if tonumber(tData[1]) == nCamp then
			bFlag = 1;
			break
		end
	end
	if not bFlag then
		Talk(1,"","Th� l�c kh�ng c� b�ng x�p h�ng �i�m x�y d�ng t� ��n, kh�ng th� nh�n th��ng.")
		return 0;
	end
	local tAwardString = {
		"SLYWZ_YJSLPMJ_a",
		"SLYWZ_YJSLPMJ_b",
		"SLYWZ_YJSLPMJ_c",
	}
	if CustomAwardCheckCondition(tAwardString[nRank]) ~= 1 then
		return 0;
	end
	ywz_SetAward1Flag1(1);
	CustomAwardGiveGroup(tAwardString[nRank], 1);
	AddRuntimeStat(36, 11, 0, 1);
end

function ywz_GetAward1_AcitivtyAward()
	if ywz_GetAward1Flag2() ~= 0 then
		Talk(1,"","�� nh�n ph�n th��ng n�y r�i.");
		return 0;
	end
	local nScore = ywz_GetScore();
	if nScore < 300 then
		Talk(1,"",format("�i�m x�y d�ng c�a b�n l� %d, kh�ng �� %d �i�m, kh�ng th� nh�n th��ng x�p h�ng th� l�c.", nScore, 300));
		return 0;
	end
	ywz_SetAward1Flag2(1);
	if CustomAwardCheckCondition("SLYWZ_YJJSHYJ") ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("SLYWZ_YJJSHYJ", 1);
	AddRuntimeStat(36, 7, 0, 1);
	TriggerMisEvent("event_ywz_taskfinish", "�i�m x�y d�ng c� nh�n ��t 300", nScore);
end

function ywz_GetAward1_PlayerRankAward()
	if ywz_GetAward1Flag3() ~= 0 then
		Talk(1,"","�� nh�n ph�n th��ng n�y r�i.");
		return 0;
	end
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP)
	local s = SDB(YWZ_SHARE_DATA, 0, nCamp);
	s:apply2(ywz_GetAward1_PlayerRankAward_CB);
end

function ywz_GetAward1_PlayerRankAward_CB(nCount, sdb)
	--gf_PrintTable(sdb);
	local szName = GetName();
	local nRank = 0;--1;
	local nScore = 0;
	for i = 1, nCount do
		local tData = sdb[i-1];
		--local lastData = sdb[i-2];
		--if lastData and getn(lastData) == 2 and tonumber(tData[2]) < tonumber(lastData[2]) then
			nRank = nRank + 1;
		--end
		if tData[1] == szName then
			nScore = tonumber(tData[2])
			break;
		end
	end
	if nScore == 0 then
		Talk(1, "", "H�ng qu� th�p kh�ng th� nh�n th��ng.");
		return 0;
	end
	if nCount <=0 or nRank > 3 then
		Talk(1,"",format("H�ng c�a b�n l� <color=red>%d<color>, th�p h�n h�ng %d, kh�ng th� nh�n th��ng.", nRank, 3));
		return 0;
	end
	if nScore < 950 then
		Talk(1,"",format("�i�m x�y d�ng c� nh�n ch�a ��t %d, kh�ng th� nh�n th��ng.", 950));
		return 0;
	end
	Say(format("Ch�c m�ng b�n, �i�m x�y d�ng c� nh�n ��t <color=gold>h�ng %d<color>, h�y nh�n th��ng ngay n�o!", nRank), 2,
		format("Nh�n th��ng h�ng %d/#ywz_GetAward1_PlayerRankAward_CB_done(%d)", nRank, nRank), "\n�� n�i sau/nothing")
end

function ywz_GetAward1_PlayerRankAward_CB_done(nRank)
	local tAwardString = {
		"SLYWZ_YJGRPMJ_a",
		"SLYWZ_YJGRPMJ_b",
		"SLYWZ_YJGRPMJ_b",
		--"SLYWZ_YJGRPMJ_b",
		--"SLYWZ_YJGRPMJ_b",
	}
	if CustomAwardCheckCondition(tAwardString[nRank]) ~= 1 then
		return 0;
	end
	ywz_SetAward1Flag3(1);
	CustomAwardGiveGroup(tAwardString[nRank], 1);
end

function ywz_GetAward2_RankAward()
	local nShiliRank = gf_GetTaskByte(YWZM_TASK_MISSION_VALUE, 1);
	if nShiliRank <= 0 then
		Talk(1,"","Th� l�c c�a b�n kh�ng nh�n ���c �i�m di�n v� trong Di�n V� Chi�n.")
		return 0;
	end
	local nNeed = gf_GetTaskByte(YWZM_TASK_MISSION_VALUE, 3);
	Say(format("Th� l�c c�a b�n x�p h�ng %d trong Di�n V� Chi�n, mu�n nh�n th��ng x�p h�ng th� l�c kh�ng? <color=red>(�i�m di�n v� c� nh�n ��t %d m�i ���c nh�n)<color>", nShiliRank, 300),
		2, format("Nh�n l�y./#ywz_GetAward2_RankAward_do(%d, %d)", nShiliRank, nNeed), "T�i h� ch� xem qua th�i/nothing");
end

function ywz_GetAward2_RankAward_do(nRank, nNeed)
	if ywz_GetAward2Flag1() ~= 0 then
		Talk(1,"","Ng��i �� nh�n th��ng r�i");
		return 0;
	end
	if nNeed == 0 or nNeed > 6 then
		Talk(1,"",format("�i�m di�n v� c� nh�n ch�a ��t %d, kh�ng th� nh�n th��ng.", 300));
		return 0;
	end
	local tAwardString = {
		"SLYWZ_EJSLPMJ_a",
		"SLYWZ_EJSLPMJ_b",
		"SLYWZ_EJSLPMJ_c",
	}
	if CustomAwardCheckCondition(tAwardString[nRank]) ~= 1 then
		return 0;
	end
	ywz_SetAward2Flag1(1);
	CustomAwardGiveGroup(tAwardString[nRank], 1);
	AddRuntimeStat(36, 12, 0, 1);
end

function ywz_GetAward2_PlayerRankAward()
	local nRank = gf_GetTaskByte(YWZM_TASK_MISSION_VALUE, 2);
	if nRank > 20 or nRank <= 0 then
		Talk(1,"","Ch� c� ng��i ch�i n�m trong TOP 20 �i�m di�n v� m�i ���c nh�n th��ng");
		return 0;
	end
	Say(format("H�ng hi�n t�i: %d, mu�n nh�n th��ng x�p h�ng kh�ng?", nRank), 2, format("Nh�n l�y./#ywz_GetAward2_PlayerRankAward_cb(%d)", nRank), "T�i h� ch� xem qua th�i/nothing");
end

function ywz_GetAward2_PlayerRankAward_cb(nRank)
	if ywz_GetAward2Flag2() ~= 0 then
		Talk(1,"","Ng��i �� nh�n th��ng r�i");
		return 0;
	end
	local szAward = "";
	local tAwardString = {
		"SLYWZ_EJGRPMJ_a",
		"SLYWZ_EJGRPMJ_b",
		"SLYWZ_EJGRPMJ_c",
	}
	local nType = 1;
	if nRank <= 3 then
		szAward = tAwardString[nRank];
	else
		szAward = "SLYWZ_EJGRPMJ_d";
		nType = 0;
	end
	if CustomAwardCheckCondition(szAward) ~= 1 then
		return 0;
	end
	ywz_SetAward2Flag2(1);
	CustomAwardGiveGroup(szAward, nType);
	--��������
	local nTask = GetTask(3411);
	if nTask <= 0 or nTask > 5 then
		SetTask(3411, nRank);
	end
end

function ywz_GetAward2_ActivityAward()
	local tRankString = {
		"Gi�i 1", "Gi�i 2", "Gi�i 3", "Gi�i 4", "Gi�i khuy�n kh�ch",
	}
	local nRank = gf_GetTaskByte(YWZM_TASK_MISSION_VALUE, 3);
	if not tRankString[nRank] then
		Talk(1, "", "B�n ch�a nh�n ph�n th��ng t� c�ch n�ng ��ng di�n v�");
		return 0;
	end
	Say(format("Ch�c m�ng b�n trong Th� L�c Ba Phe-Di�n V� Chi�n nh�n ���c ph�n th��ng n�ng ��ng di�n v� %s", tRankString[nRank]), 2, format("\n Nh�n ph�n th��ng/#ywz_GetAward2_ActivityAward_do(%d)", nRank), "T�i h� ch� xem qua th�i/nothing");
end

function ywz_GetAward2_ActivityAward_do(nRank)
	if ywz_GetAward2Flag3() ~= 0 then
		Talk(1,"","Ng��i �� nh�n th��ng r�i");
		return 0;
	end
	local tAwardString = {
		"SLYWZ_YWHYJ_a", "SLYWZ_YWHYJ_b", "SLYWZ_YWHYJ_c", "SLYWZ_YWHYJ_d", "SLYWZ_YWHYJ_e",
	}
	if not tAwardString[nRank] then return 0; end
	if CustomAwardCheckCondition(tAwardString[nRank]) ~= 1 then return 0; end
	ywz_SetAward2Flag3(1);
	CustomAwardGiveGroup(tAwardString[nRank], 1);
	AddRuntimeStat(36, 12+nRank, 0, 1);
end

function ywz_GetAwardInfo()
	local msg1 = "Trong giai �o�n 1 c�a ho�t ��ng, �i�m x�y d�ng c� nh�n c�a ng��i ch�i ph�i ��t 120 �i�m m�i ���c nh�n th��ng x�p h�ng th� l�c, nh�n ph�n th��ng n�ng ��ng x�y d�ng t� ��n th� l�c c�n �i�m x�y d�ng c� nh�n ��t 300 �i�m."
	local msg2 = "khi nh�n th��ng x�p h�ng c� nh�n, �i�m x�y d�ng c�a nh�n v�t ph�i ��t 950 �i�m m�i c� th� nh�n."
	Say(msg1..msg2, 2, "Trang k�/ywz_GetAwardInfo2", "tr� l�i/main");
end

function ywz_GetAwardInfo2()
	Say("Trong giai �o�n 2 c�a ho�t ��ng, �i�m di�n v� c� nh�n c�a ng��i ch�i ph�i ��t 300 �i�m m�i ���c nh�n th��ng x�p h�ng th� l�c v� x�p h�ng c� nh�n.", 0);
end
