Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\function\\honor_tong\\ht_define.lua")
Include("\\script\\lib\\date.lua")
Import("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\sdb.lua")
Include("\\script\\system_switch_config.lua")


SIEGE_MAP_ID = 300		-- �ɶ�
SIEGE_MAP_NAME = "Th�nh ��"

function ht_IsOpen()
	return IsHonorTongOpen();
end

function ht_CheckCondition()
	if ht_IsOpen() ~= 1 then
		return 0;
	end
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	
	if gf_Check55HaveSkill() ~= 1 then
		Talk(1,"",HT_NPC.."C�c h� ch�a h�c skill 55!")
		return 0;
	end
	local nJoinTime = GetJoinTongTime();
	if nJoinTime <= 0 or GetTime() - nJoinTime < 7 * 24 * 3600 then
		Talk(1,"",HT_NPC..format("%s ch�a gia nh�p bang h�i ho�c th�i gian gia nh�p kh�ng �� %d ng�y", gf_GetPlayerSexName(), 7));
		return 0;
	end
	return 1;
end

function ht_GetTimeFunc()
	local wDay = tonumber(date("%w"));
	if wDay == 0 then
		local time = tonumber(date("%H%M"));
		if time >= 2000 and time < 2330 then
			return 3;
		end
		return 2;
	end
	return 1;
end

function ht_WeeklyReset()
	gf_SafeSetTaskByte(HT_TASK_1, 1, 0, TASK_ACCESS_CODE_HONOR_TONG);
	gf_SafeSetTaskByte(HT_TASK_1, 3, 0, TASK_ACCESS_CODE_HONOR_TONG);
end

function ht_SignTong()
	local s = SDB(HT_TONG_VALUE_RANK, 0, 0);
	s:apply2(_ht_SignTong);
end

function _ht_SignTong(nCount, sdb)
	local bNeedSign = 1;
	local szTongName = GetTongName();
	local nWeekly = gf_GetWeekly();
	for i = 1, nCount do
		local sData = sdb[i-1];
		if sData and getn(sData) == HT_DATA_COL_NUM and tostring(sData[1]) == szTongName and
			tonumber(sData[2]) == nWeekly and tonumber(sData[3]) ~= 0 then
			bNeedSign = nil;
		end
	end
	if bNeedSign then
		if Pay(HT_COST_GOLD*10000) ~= 1 then
			return 0;
		end
		local s = SDB(HT_TONG_VALUE_RANK, 0, 0);
		s[szTongName] = {"dddddd", nWeekly, 1, 0, 0, 0, GetTime()};
		Talk(1,"",HT_NPC.."��ng k� tham gia Bang H�i Vinh Danh th�nh c�ng!");
		Msg2Player("��ng k� tham gia Bang H�i Vinh Danh th�nh c�ng!");
		Msg2Tong("Bang ch� ��ng k� tham gia Bang H�i Vinh Danh th�nh c�ng, c�c th�nh vi�n h�y nhanh ch�ng �i t�m ��i S� Ho�t ��ng �� tham gia n�o!");
		return 1;
	end
	Talk(1,"",HT_NPC.."B�n �� ��ng k� r�i! <color=red>Kh�ng c�n ph�i ��ng k� l�i<color>");
	return 0;
end

function ht_buildTong_AskforClient()
	local nItemCount = floor(GetItemCount(2,1,30588)/HT_HAND_ITEM_1);
	local nXuCount = floor(GetItemCount(2,1,30230)/HT_HAND_ITEM_1);
	local nMaxCount = floor(2000000000/HT_AWARD_EXP);
	AskClientForNumber("ht_buildTong", 0, min(min(nItemCount, nXuCount),nMaxCount), "H�y nh�p v�o s� l�n", "")
end

function ht_buildTong(nNum)
	if nNum <= 0 then
		return 0;
	end
	--���ж�һ�Σ���������ʱȷ�ϵ�����
	if ht_GetTimeFunc() ~= 1 then
		Say(HT_NPC.."Hi�n t�i kh�ng ph�i l� th�i gian giao n�p, tu�n sau h�y quay l�i!", 0);
		return 0;
	end
	local s = SDB(HT_TONG_VALUE_RANK, 0, 0);
	s:apply2(callout(_ht_buildTong, nNum));
end

function _ht_buildTong(nNum, nCount, sdb)
	local szTongName = GetTongName();
	local nWeekly = gf_GetWeekly();
	for i = 1, nCount do
		local sData = sdb[i-1];
		if sData and getn(sData) == HT_DATA_COL_NUM and tostring(sData[1]) == szTongName then
			if tonumber(sData[2]) ~= nWeekly then
				Talk(1,"",HT_NPC..format("Bang h�i c�a %s <color=red>tu�n n�y<color> ch�a ��ng k� tham gia Bang H�i Vinh Danh!", gf_GetPlayerSexName()));
				return 0;
			end
			if tonumber(sData[3]) == 0 then
				Talk(1,"",HT_NPC..format("Bang h�i c�a %s v�n ch�a ��ng k� tham gia Bang H�i Vinh Danh!", gf_GetPlayerSexName()));
				return 0;
			end
			if DelItem(2, 1, 30588, nNum) ~= 1 or DelItem(2, 1, 30230, nNum) ~= 1 then
				Talk(1,"",HT_NPC.."Nguy�n li�u kh�ng ��, c�ng hi�n x�y d�ng bang h�i th�t b�i!");
				return 0;
			end
			local nPlayerCount = 0;
			if gf_GetTaskByte(HT_TASK_1, 1) == 0 then
				nPlayerCount = 1;
				gf_SafeSetTaskByte(HT_TASK_1, 1, 1, TASK_ACCESS_CODE_HONOR_TONG);
			end
			local nTime = GetTime();
			if tonumber(sData[4]) >= HT_TONG_VALUE_LIMIT then
				nTime = tonumber(sData[7]);
			end
			local s = SDB(HT_TONG_VALUE_RANK, 0, 0);
			s[szTongName] = {"dddddd", nWeekly, 1, tonumber(sData[4]) + nNum, tonumber(sData[5]) + nPlayerCount, tonumber(sData[6]), nTime}; 
			gf_ModifyExp(HT_AWARD_EXP * nNum);
			if nNum >= 10 then
				--cdkey�
            	gf_TeamOperateEX(function () 
            		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(2103)");	
            	end);
			end
			FireEvent("event_mission_affairs", "honortong", "buildtong", nNum)
			Msg2Tong(format("[%s] c�ng hi�n x�y d�ng bang h�i th�nh c�ng %d l�n!", GetName(), nNum));
			Talk(1,"",HT_NPC..format("Ch�c m�ng %s c�ng hi�n x�y d�ng bang h�i th�nh c�ng %d l�n", gf_GetPlayerSexName(), nNum));
			return 1;
		end
	end
	Talk(1,"",HT_NPC..format("Bang h�i c�a %s v�n ch�a ��ng k� tham gia Bang H�i Vinh Danh!", gf_GetPlayerSexName()));
	return 0;
end

function ht_TongRank_Show()
	local s = SDB(HT_TONG_VALUE_RANK, 0, 0);
	s:apply2(_ht_TongRank_Show);
end

function _ht_TongRank_Show(nCount, sdb)
	if nCount <= 0 then
		Talk(1,"",HT_NPC.."Hi�n t�i v�n ch�a c� th�ng tin x�p h�ng c�a Bang H�i Vinh Danh!");
		return 0;
	end
	local tSortRank = ht_GetRankTable(nCount, sdb);
	local nRank = 0;
	local nValue = 0;
	local nPlayerCount = 0;
	local szTongName = GetTongName();
	local tTongInfo = ht_FindTongRankInfo(szTongName, tSortRank);
	if tTongInfo then
		nRank = tTongInfo[1];
		nValue = tTongInfo[2];
		nPlayerCount = tTongInfo[3];
	end
	local title = "Qu� bang ch�a c� th�ng tin x�p h�ng!";
	if nRank > 0 and nValue > 0 and nPlayerCount > 0 then
		title = format("Hi�n t�i qu� bang x�p h�ng %d, t�ng �i�m c�ng hi�n l� %d, t�ng s� ng��i c�ng hi�n l� %d!", nRank, nValue, nPlayerCount);
	end
	local tSay = {};
	for i = 1, getn(tSortRank) do
		tinsert(tSay, format("H�ng %d [%s], c�ng hi�n %d �i�m, s� l��ng c�ng hi�n %d ng��i/nothing", tSortRank[i][1], tSortRank[i][4], tSortRank[i][2], tSortRank[i][3]));
	end
	tinsert(tSay, "\nT�i h� ch� xem qua th�i/nothing");
	Say(HT_NPC..title, getn(tSay), tSay);
end

function ht_GetRankAward()
	local s = SDB(HT_TONG_VALUE_RANK, 0, 0);
	s:apply2(_ht_GetRankAward);
end


function ht_SetCityWarCamp()
	local wDay = tonumber(date("%w"));
	if wDay == 0 then
		local time = tonumber(date("%H%M"));
		if time >= 2000 and time < 2330 then
			local s = SDB(HT_TONG_VALUE_RANK, 0, 0);
			s:apply2(_ht_SetCityWarCamp);
		end
	end
end

function _ht_SetCityWarCamp(nCount, sdb)
	if nCount <= 0 then
		Msg2Global("C�ng Th�nh Chi�n kh�ng c� b�n c�ng th�nh, n�n t�m d�ng m�t tu�n.")
		return 
	end
	local tSortRank = ht_GetRankTable(nCount, sdb);
	local szA, szD = GetCityWarAD(SIEGE_MAP_ID)
	if szD == "" then
		SetCityWarWinner(SIEGE_MAP_ID, tSortRank[1][4])
		if nCount > 1 then
			SetCityWarAttack(SIEGE_MAP_ID, tSortRank[2][4])
			szA, szD = GetCityWarAD(SIEGE_MAP_ID)
			Msg2Global(format("C�ng Th�nh Chi�n �� x�c ��nh b�n c�ng v� b�n th�, b�n th� l� bang h�i %s, b�n t�n c�ng l� bang h�i %s.",szD,szA))
		else
			Msg2Global(format("C�ng Th�nh Chi�n kh�ng c� b�n c�ng th�nh, n�n Bang %s tr�c ti�p nh�n ���c th�nh th� .",tSortRank[1][4]))
		end
		return
	end
	if szD == tSortRank[1][4] then
		if nCount > 1  then
			SetCityWarAttack(SIEGE_MAP_ID, tSortRank[2][4])
			szA, szD = GetCityWarAD(SIEGE_MAP_ID)
			Msg2Global(format("C�ng Th�nh Chi�n �� x�c ��nh b�n c�ng v� b�n th�, b�n th� l� bang h�i %s, b�n t�n c�ng l� bang h�i %s.",szD,szA))
		else
			Msg2Global(format("C�ng Th�nh Chi�n kh�ng c� b�n c�ng th�nh, n�n Bang %s tr�c ti�p nh�n ���c th�nh th� .",tSortRank[1][4]))
		end
		return
	end
	SetCityWarAttack(SIEGE_MAP_ID, tSortRank[1][4])
	szA, szD = GetCityWarAD(SIEGE_MAP_ID)
	Msg2Global(format("C�ng Th�nh Chi�n �� x�c ��nh b�n c�ng v� b�n th�, b�n th� l� bang h�i %s, b�n t�n c�ng l� bang h�i %s.",szD,szA))
end

function _ht_GetRankAward(nCount, sdb)
	if nCount <= 0 then
		Talk(1,"",HT_NPC.."T�m th�i kh�ng th� nh�n ph�n th��ng x�p h�ng!");
		return 0;
	end
	local tSortRank = ht_GetRankTable(nCount, sdb);
	local szTongName = GetTongName();
	local tTongInfo = ht_FindTongRankInfo(szTongName, tSortRank);
	if not tTongInfo then
		Talk(1,"",HT_NPC.."Kh�ng t�m ���c th�ng tin x�p h�ng c�a qu� bang!");
		return 0;
	end
	if tTongInfo[2] < HT_TONG_VALUE_LIMIT then
		Talk(1,"",HT_NPC..format("�i�m c�ng hi�n c�a qu� bang l� %d, ch�a ��t y�u c�u %d �i�m, kh�ng th� nh�n ph�n th��ng x�p h�ng!", tTongInfo[2], HT_TONG_VALUE_LIMIT));
		return 0;
	end
	if gf_GetTaskByte(HT_TASK_1, 4) ~= mod(gf_GetWeekly(), 255) + 1 then
		gf_SafeSetTaskByte(HT_TASK_1, 2, 0, TASK_ACCESS_CODE_HONOR_TONG);
	end
	if gf_GetTaskByte(HT_TASK_1, 2) ~= 0 then
		Talk(1,"",HT_NPC..format("%s �� nh�n ph�n th��ng x�p h�ng, kh�ng th� nh�n l�i!", gf_GetPlayerSexName()));
		return 0;
	end
	local nTongDuty = GetTongDuty();
	if nTongDuty ~= 1 then
		--����
		gf_SafeSetTaskByte(HT_TASK_1, 2, min(tTongInfo[1],255), TASK_ACCESS_CODE_HONOR_TONG);
		gf_SafeSetTaskByte(HT_TASK_1, 4, mod(gf_GetWeekly(), 255) + 1, TASK_ACCESS_CODE_HONOR_TONG);
		gf_ModifyExp(tTongInfo[3]*1000000);
		--cdkey�
    	gf_TeamOperateEX(function () 
    		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(2104)");	
    	end);
    	FireEvent("event_mission_award", "honortong", 0)
		if tTongInfo[1] == 1 then
			--���������ɳƺ�
			RemoveTitle(69, 2);
			AddTitle(69, 2);
			SetTitleTime(69, 2, GetTime() + 7*24*3600 - 40*60);
			Msg2Player(format("Ch�c m�ng %s nh�n ���c danh hi�u %q", gf_GetPlayerSexName(), "Bang H�i Vinh Danh"));
		end
	else
		--����
		if gf_Judge_Room_Weight(1, 10) ~= 1 then
			return 0;
		end
		if tTongInfo[5] ~= 0 then
			Talk(1,"",HT_NPC..format("Bang n�y �� nh�n ph�n th��ng x�p h�ng bang ch�, kh�ng th� nh�n l�i!"));
			return 0;
		end
		--����ȡ���
		local s = SDB(HT_TONG_VALUE_RANK, 0, 0);
		s[szTongName] = {"dddddd", gf_GetWeekly(), 1, tTongInfo[2], tTongInfo[3], 1, tTongInfo[6]};
		gf_SafeSetTaskByte(HT_TASK_1, 2, min(tTongInfo[1],255), TASK_ACCESS_CODE_HONOR_TONG);
		gf_SafeSetTaskByte(HT_TASK_1, 4, mod(gf_GetWeekly(), 255) + 1, TASK_ACCESS_CODE_HONOR_TONG);
		--������
		gf_ModifyExp(tTongInfo[3]*1000000);
		gf_AddItemEx2({2,1,30760,1,4}, "V� L�m Tri�u T�p L�nh", "Bang H�i Vinh Danh", "Gi�i th��ng x�p h�ng", 6*24*3600, 1);
		--cdkey�
    	gf_TeamOperateEX(function () 
    		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(2104)");	
    	end);
    	FireEvent("event_mission_award", "honortong", 1)
		if tTongInfo[1] == 1 then
			--�����������ƺ�
			RemoveTitle(69, 1);
			AddTitle(69, 1);
			SetTitleTime(69, 1, GetTime() + 7*24*3600 - 40*60);
			local msg = format("Ch�c m�ng bang [%s] x�p h�ng 1 trong Bang H�i Vinh Danh, bang ch� [%s] vinh d� nh�n ���c danh hi�u %q!", szTongName, GetName(), "Bang Ch� Vinh D�");
			Msg2Global(msg);
			AddLocalNews(msg);
			Msg2Tong(msg)
		end		
	end
	local nDuty = GetTongDuty()
	if nDuty >= 1 and nDuty <= 3 then
		ht_SetSiegeTask(tTongInfo[1]);
		-- Say("���Ѿ��ɹ�����˹����ʸ����Ǽǣ������������ҳɶ���̨�ϰ�μӹ����ʸ�����", 0);
	end
end


function ht_GetRankTable(nCount, sdb)
	local tSortRank = {}; --{Value, PlayerCount, TongName, IsGetTongMasterAward, time};
	local nWeekly = gf_GetWeekly();
	for i = 1, nCount do
		local sData = sdb[i-1];
		if sData and getn(sData) == HT_DATA_COL_NUM and 
		tonumber(sData[2]) == nWeekly and 
		tonumber(sData[3]) ~= 0 and
		tonumber(sData[4]) > 0 and 
		tonumber(sData[5]) > 0 then
			tinsert(tSortRank, {tonumber(sData[4]), tonumber(sData[5]), tostring(sData[1]), tonumber(sData[6]), tonumber(sData[7])});
		end
	end
	--for i = 1, getn(tSortRank) do
	--	print(tSortRank[i][1],tSortRank[i][2],tSortRank[i][3],tSortRank[i][4])
	--end
	local sortComp = function (a, b)
		if a[1] ~= b[1] then
			return a[1] > b[1];
		elseif a[2] ~= b[2] then
			return a[2] > b[2];
		else
			return a[5] < b[5];
		end
	end
	sort(tSortRank, sortComp);
	--print("--------------")
	--for i = 1, getn(tSortRank) do
	--	print(tSortRank[i][1],tSortRank[i][2],tSortRank[i][3],tSortRank[i][4])
	--end
	local tRezultRank = {}; --{nRank, Value, PlayerCount, TongName, IsGetTongMasterAward, time}
	local nRank = 0;
	--local nLastValue = 0;
	--local nLastPlayerCount = 0;
	for i = 1, getn(tSortRank) do
		--if nLastValue ~= tSortRank[i][1] or nLastPlayerCount ~= tSortRank[i][2] then
			nRank = nRank + 1;
			--nLastValue = tSortRank[i][1];
			--nLastPlayerCount = tSortRank[i][2];
		--end
		tinsert(tRezultRank, {nRank, tSortRank[i][1], tSortRank[i][2], tSortRank[i][3], tSortRank[i][4], tSortRank[i][5]});
		if nRank >= HT_SHOW_RANK_LIMIT then
			break;
		end
	end
	return tRezultRank;
end

function ht_FindTongRankInfo(szTongName, tRank)
	for i = 1, getn(tRank) do
		if szTongName == tRank[i][4] then
			return tRank[i];
		end
	end
	return nil;
end

function ht_GetTongChip(nProp, nNum)
	if ht_IsOpen() ~= 1 then
		return 0;
	end
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	local nJoinTime = GetJoinTongTime();
	if nJoinTime <= 0 or GetTime() - nJoinTime < 7 * 24 * 3600 then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10) ~= 1 then
		return 0;
	end
	if random(100) > nProp then
		return 0;
	end
	gf_AddItemEx2({2,1,30588,nNum}, "M�nh L�nh B�i Bang H�i", "Bang H�i Vinh Danh", "T�nh n�ng sinh ra", 0, 1);	
end

--function ht_SignGongcheng()
--	if ht_CheckCondition() ~= 1 then
--		return 0;
--	end
--	local nDuty = GetTongDuty();
--	if nDuty ~= 1 then
--		Say(HT_NPC.."ֻ�а����������������ϲ��ܵǼǲμӹ����ʸ�����", 0);
--		return 0;
--	end
--	if ht_GetTimeFunc() == 1 then
--		Say(HT_NPC.."�����ǰ�Ὠ��׶Σ�������������", 0);
--		return 0;
--	end
--	if ht_GetSiegeTask() ~= 0 then
--		Say(HT_NPC.."���Ѿ��Ǽǹ������ʸ����ˣ�", 0);
--		return 0;
--	end
--	local s = SDB(HT_TONG_VALUE_RANK, 0, 0);
--	s:apply2(_ht_SignGongcheng);
--end
--
--function _ht_SignGongcheng(nCount, sdb)
--	if nCount <= 0 then
--		Talk(1,"",HT_NPC.."��ʱ�޷��Ǽǹ����ʸ�����");
--		return 0;
--	end
--	local tSortRank = ht_GetRankTable(nCount, sdb);
--	local szTongName = GetTongName();
--	local tTongInfo = ht_FindTongRankInfo(szTongName, tSortRank);
--	if not tTongInfo then
--		Talk(1,"",HT_NPC.."�������������ﵽǰ10�����ɵǼǣ�");
--		return 0;
--	end
--	ht_SetSiegeTask(1);
--	Say("���Ѿ��ɹ�����˹����ʸ����Ǽǣ������������ҳɶ���̨�ϰ�μӹ����ʸ�����", 0);
--end

function ht_GetSiegeTask()
	return GetTask(HT_TASK_2)
end

function ht_SetSiegeTask(nValue)
	nValue = nValue or 0
	SetTask(HT_TASK_2, nValue, TASK_ACCESS_CODE_HONOR_TONG);
end