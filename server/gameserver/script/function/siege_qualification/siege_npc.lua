Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\honor_tong\\ht_head.lua")
Include("\\script\\lib\\talktmp.lua")
Import("\\script\\lib\\missionfunctions.lua")
Include("\\script\\function\\siege_qualification\\tm_head.lua")

SIEGE_NPC_NAME = "<color=green>Ch� L�i ��i<color>:";

function siege_qualification()
	local tSay = {
		"Gi�i thi�u T� C�ch C�ng Th�nh Chi�n/siege_info",
		"\n r�t lui/nothing",
	}
	local wDay = tonumber(date("%w"));
	if wDay == 5 then		
		--tinsert(tSay, 1, "Ta mu�n tham gia/siege_register");
	end
	Say(SIEGE_NPC_NAME.."21:00 - 21:19 th� 6 h�ng tu�n, bang h�i kh�ng thu�c bang th� th�nh n�m trong TOP 10 Bang H�i Vinh Danh c�a tu�n tr��c c� th� b�o danh tham gia khi�u chi�n t� c�ch c�ng th�nh.", getn(tSay), tSay);
end

function siege_register()
	local tbBody = "��ng k� tham gia khi�u chi�n t� c�ch c�ng th�nh c�n ph�i th�a m�n nh�ng �i�u ki�n d��i ��y:\n    1. Th�i gian tham chi�n: 21:00 - 21:19 th� 6 h�ng tu�n\n    2. C�n bang ch� (t�i v� 07 ng�y tr� l�n) mang theo Th� Ti�n C� ��n ch� c�a ta �� ��ng k�\n    3. Bang h�i ph�i n�m trong TOP 10 c�a Bang H�i Vinh Danh tu�n tr��c.\n    4. Bang h�i kh�ng ph�i l� bang th� th�nh.\n    5. Th�nh vi�n t� ��i ph�i l� th�nh vi�n trong bang.";
	local tbSay = {};
	tbSay.msg = SIEGE_NPC_NAME..tbBody;
	tbSay.sel = {
		{"��ng � tham gia", "siege_join_match"},
		{"\n Ph�n h�i", "siege_qualification"},
		{"Ra kh�i","nothing"},
	};
	temp_Talk(tbSay);
end

function siege_info()
	local tbBody = "T� C�ch C�ng Th�nh Chi�n t� ch�c v�o th� 6 h�ng tu�n, thi ��u �� ch�n ra bang h�i s� h�u t� c�ch c�ng th�nh trong tu�n. ��ng k� v� thi ��u l� 2 giai �o�n. Giai �o�n ��ng k�: Ti�n h�nh v�o 21:00 - 21:19 th� 6 h�ng tu�n, bang h�i c�n ph�i n�m trong TOP 10 c�a Bang H�i Vinh Danh tu�n tr��c m�i ���c ��ng k�. Do bang ch� ��m nhi�m ch�c ��i tr��ng (��ng ��i ph�i l� th�nh vi�n bang h�i), mang theo 1 Th� Ti�n C� m�i ���c b�o danh. Khi thi ��u k�t th�c th� bang h�i h�ng 1 s� nh�n ���c t� c�ch khi�u chi�n c�ng th�nh.";
	local tbSay = {};
	tbSay.msg = SIEGE_NPC_NAME..tbBody;
	tbSay.sel = {
		{"\n Ph�n h�i", "siege_qualification"},
		{"Ra kh�i","nothing"},
	};
	temp_Talk(tbSay);
end

g_JoinMatchTong = {}

function siege_set_mark()
	-- �Բ���֮��Ķ�����б��
	-- ��mission�е���
	local szTongName = GetTongName();
	if DelItem(2, 1, 1200, 1) ~= 1 then
		return 0;
	end
	g_JoinMatchTong[szTongName] = GetName();
	ht_SetSiegeTask(0);	
end

function siege_join_match()
	local time = tonumber(date("%H%M"));
	if time < 2100 or time >= 2120 then
		Say(SIEGE_NPC_NAME.."Hi�n t�i kh�ng ph�i th�i gian tham chi�n!", 0);
		return 0;
	end
	if GetCaptainName() ~= GetName() then
		Say(SIEGE_NPC_NAME.."Ch� c� ��i tr��ng m�i c� t� c�ch n�i chuy�n v�i ta!", 0);
		return 0;
	end
	local nDuty = GetTongDuty();
	if nDuty < 1 or nDuty > 3 then
		Say(SIEGE_NPC_NAME.."Ch� c� bang ch�, ph� bang ch�, tr��ng l�o m�i c� th� b�o danh tham gia T� C�ch C�ng Th�nh Chi�n!", 0);
		return 0;
	end
	
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	if nDayCount <  7 then
		Talk(1,"",szNPCName.."Th�i gian gia nh�p bang h�i c�a c�c h� �t h�n 7 ng�y, kh�ng th� b�o danh tham gia T� C�ch C�ng Th�nh Chi�n!")
		return 0;
	end
	
	if GetTeamSize() < 5 then
		Say(SIEGE_NPC_NAME.."Ph�i t� ��i �� 5 ng��i m�i ���c tham gia T� C�ch C�ng Th�nh Chi�n!", 0);
		return 0;
	end
	local szTongName = GetTongName();

	if g_JoinMatchTong[szTongName] then
		Say(SIEGE_NPC_NAME..format("[%s] �� d�n d�t th�nh vi�n bang h�i tham gia tranh �o�t t� c�ch c�ng th�nh!", g_JoinMatchTong[szTongName]), 0);
		return 0;
	end

	local nRank = ht_GetSiegeTask()
	if nRank < 1 or nRank > 10 then
		Say(SIEGE_NPC_NAME.."Ch� c� bang h�i nh�n ph�n th��ng x�p h�ng tu�n tr��c c�a Bang H�i Vinh Danh m�i c� th� tham gia!", 0);
		return 0;
	end
	if GetItemCount(2, 1, 1200) < 1 then
		Say(SIEGE_NPC_NAME.."Trong t�i kh�ng c� Th� Ti�n C�, kh�ng th� tham gia tranh �o�t t� c�ch c�ng th�nh!", 0);
		return 0;
	end
	
	local szGong,szShou = GetCityWarAD(SIEGE_MAP_ID);
	if szShou == szTongName then
		Say(SIEGE_NPC_NAME.."B�n l� th�nh vi�n c�a bang th� th�nh, kh�ng th� tham gia tranh �o�t t� c�ch c�ng th�nh!", 0);
		return 0;
	end
	if gf_CheckTeam(function ()
			if %szTongName ~= GetTongName() then
				return 0;
			end
			return 1;
		end, SIEGE_NPC_NAME.."Th�nh vi�n d��i ��y kh�ng ph�i l� th�nh vi�n bang h�i:") ~= 1 then
			return 0;
	end
--	local tbMapID = gf_GetDataTable(GetSameMaps(TM_REAL_MAPID));
--	local nMapIndex = nil
--	for i =1, getn(tbMapID) do
--		if tbMapID[i] ~= TM_REAL_MAPID then
--			nMapIndex = tbMapID[i]
--			break
--		end
--	end
--	if not nMapIndex then
--		Say(SIEGE_NPC_NAME.."������δ���������´�������", 0);
--		return 0;
--	end
	
	--------------------------
	local nMapID = mf_GetMissionV(tbTONGMELEE.missionID, MV_MAP_ID, tbTONGMELEE.realMapID);
	if nMapID ~= 0 then
		tbTONGMELEE:TeamEnter(nMapID, 0);
	else
		nMapID = tbTONGMELEE:Create();
		tbTONGMELEE:TeamEnter(nMapID, 0);
	end
end

