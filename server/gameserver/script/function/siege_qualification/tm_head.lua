Import("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Include("\\script\\lib\\date.lua")
Import("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\sdb.lua")
Include("\\script\\system_switch_config.lua")
Import("\\script\\tmp_task_id_def.lua")
Include("\\script\\function\\siege_qualification\\tm_define.lua")

thisFile = "\\script\\function\\siege_qualification\\mission.lua"

tbTONGMELEE = {
	name = "T� C�ch C�ng Th�nh Chi�n",
	missionID = 83, --\gamesvr\settings\task\missions.txt
	realMapID = 6074,
	dynamicMap = 0, --�Ƿ�̬����
	
	MaxTongCount = 20, --���������
	
	--mv1-MaxTongCount��ʾ���ɻ���
	--ms1-MaxTongCount��¼��������
	mv_TongCount = 21, --��¼��������
	mv_RandomEvent = 22, --mv_RandomEvent+20 21�����npcIndex
}

tbTONGMELEE = inherit(missionHead, tbTONGMELEE);
--------------------------------------------------------------------
function tm_IsTongMeleeOpen()
--	if IsTongMeleeSystemOpen() ~= 1 then
--		Talk(1,"",TM_TONG_AD_NPC.."������δ���ţ������ڴ���");
--		return 0;
--	end
	return 1;	
end

--function tm_WeeklyClear()
--	gf_SetTaskByte(TM_TASKID_YINJUAN, 3, 0, TASK_ACCESS_CODE_TONG_MELEE);
--	gf_SetTaskByte(TM_TASKID_YINJUAN, 4, 0, TASK_ACCESS_CODE_TONG_MELEE);
--end

--function tm_checkJoinCondition()
--	local today = Date();
--	local wDay = today:week();
--	if wDay ~= 0 then
--		Talk(1,"",TM_TONG_AD_NPC.."���ڲ��Ǳ���ʱ�䣬�����Ҷ���ʼʱ����ÿ������12:45,22:15��ʼ����");
--		return 0;
--	end
--	if GetName() ~= GetCaptainName() then
--		Talk(1,"",TM_TONG_AD_NPC.."ֻ�жӳ����ܱ����μӰ����Ҷ�");
--		return 0;
--	end
--	if GetTongLevel() <= 0 then
--		Talk(1,"",TM_TONG_AD_NPC.."�㻹û�а�����Ϊ��ʱ��ᣬ���ܱ�������");
--		return 0;
--	end
--	if GetTongDuty() <= 0 or GetTongDuty() > 3 then
--		Talk(1,"",TM_TONG_AD_NPC.."ֻ�а�������Ա���ܴ�����鱨��");
--		return 0;
--	end
--	local nTeamSize = gf_GetTeamSize();
--	if nTeamSize ~= 8 then
--		Talk(1,"",TM_TONG_AD_NPC.."������������8�ˣ��޷�������");
--		return 0;
--	end
--	local oldPlayerIndex = PlayerIndex;
--	local bIsLevelUp90 = nil;
--	local levelMsg = "���ж�Ա����90����\n"
--	for i = 1, nTeamSize do
--		PlayerIndex = GetTeamMember(i);
--		if GetLevel() < 90 then
--			levelMsg = levelMsg..format("<color=red>%s<color>(%d��)\n", GetName(), GetLevel());
--			bIsLevelUp90 = 1;
--		end
--	end
--	PlayerIndex = oldPlayerIndex;
--	if bIsLevelUp90 then
--		Talk(1,"",TM_TONG_AD_NPC..levelMsg);
--		return 0;
--	end
--	local bIsSameTong = nil;
--	local msg = "���ж�Ա���Ǳ����Ա��\n"
--	local szTongName = tm_GetTongName();
--	for i = 1, nTeamSize do
--		PlayerIndex = GetTeamMember(i);
--		if tm_GetTongName() ~= szTongName then
--			msg = msg..format("<color=red>%s<color>(%s)\n", GetName(), tm_GetTongName());
--			bIsSameTong = 1;
--		end
--	end
--	PlayerIndex = oldPlayerIndex;
--	if bIsSameTong then
--		Talk(1,"",TM_TONG_AD_NPC..msg);
--		return 0;
--	end
--	
--	local bIsFree = nil;
--	local msg1 = "���ж�Ա�����ռ䲻�㣺\n"
--	for i = 1, nTeamSize do
--		PlayerIndex = GetTeamMember(i);
--		if gf_Judge_Room_Weight(1, 0) ~= 1 then
--			msg1 = msg1..format("<color=red>%s<color>\n", GetName());
--			bIsFree = 1;
--		end
--	end
--	PlayerIndex = oldPlayerIndex;
--	if bIsFree then
--		Talk(1,"",TM_TONG_AD_NPC..msg1);
--		return 0;
--	end
--	
--	local bIsPK = nil;
--	local msg2 = "���ж�ԱPKֵ���ߣ�\n"
--	for i = 1, nTeamSize do
--		PlayerIndex = GetTeamMember(i);
--		if GetPKValue() >= 10 then
--			msg2 = msg2..format("<color=red>%s<color>(%d)\n", GetName(), GetPKValue());
--			bIsPK = 1;
--		end
--	end
--	PlayerIndex = oldPlayerIndex;
--	if bIsPK then
--		Talk(1,"",TM_TONG_AD_NPC..msg2);
--		return 0;
--	end
--	
--	return 1;
--end

--��������
function tm_assign_beast(bTag, nPlayerIndex)
	if GetName() ~= GetCaptainName() then
		Talk(1,"",TM_TONG_AD_NPC.."Ng��i kh�ng ph�i l� ��i tr��ng kh�ng th� ph�n ph�i Th�n Th�!");
		return 0;
	end
	if bTag and bTag == 2 then
		local oldPlayerIdx2 = PlayerIndex;
		PlayerIndex = nPlayerIndex;
		local nRet = tm_AssignBeast();
		PlayerIndex = oldPlayerIdx2;
		if nRet == -1 then
			Talk(1,"",TM_TONG_AD_NPC.."Kh�ng gian h�nh trang kh�ng ��".."Ph�n ph�i Th�n Th� th�t b�i");
		end
		if nRet == -2 or nRet == -4 then
			Talk(1,"",TM_TONG_AD_NPC.."Ph�n ph�i Th�n Th� th�t b�i");
		end
		if nRet == -3 then
			Talk(1,"",TM_TONG_AD_NPC.."Q�y bang �� ph�n ph�i Th�n Th� r�i, kh�ng th� l�m th�m");
		end
		return (nRet == 1) and 3 or 0;
	end
	if bTag and bTag == 1 then
		local oldPlayerIdx1 = PlayerIndex;
		local PlayerIndex = nPlayerIndex;
		local sSay = format("Ng��i quy�t ��nh mu�n giao Th�n Th� cho %s ch�?", GetName());
		PlayerIndex = oldPlayerIdx1;
		Say(TM_TONG_AD_NPC..sSay, 2, format("��ng �/#tm_assign_beast(2, %d)", nPlayerIndex), "H�y b�/nothing");
		return 2;
	end
	local oldPlayerIndex = PlayerIndex;
	local tSay = {};
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		tinsert(tSay, GetName()..format("/#tm_assign_beast(1, %d)", PlayerIndex));
		if GetItemCount(2, 1, 30616) >= 1 or GetTrigger(1543*2) > 0 then
			Talk(1,"",TM_TONG_AD_NPC.."Q�y bang �� ph�n ph�i Th�n Th� r�i, kh�ng th� l�m th�m");
			return 0;
		end
	end
	tinsert(tSay, "Ta suy ngh� l�i/nothing");
	PlayerIndex = oldPlayerIndex;
	Say(TM_TONG_AD_NPC.."��i hi�p mu�n l�y Th�n Th� giao cho v� n�o trong bang h�i kh�ng? 1 bang ch� c� th� nh�n 1 Th�n Th�, sau khi �� giao cho th�nh vi�n trong bang n�o �� th� kh�ng th� ��i l�i.", getn(tSay), tSay);
	return 1;
end

function tm_aoto_assign_beast()
	local oldPlayerIndex = PlayerIndex;
	local nTeamSize = gf_GetTeamSize();
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if GetItemCount(2, 1, 30616) >= 1 or GetTrigger(1543*2) > 0 then
			PlayerIndex = oldPlayerIndex;
			return 1;
		end
	end
	local nRet = 0;
	local nMaxTimes = 0;
	repeat
		local nRand = random(nTeamSize or 1);
		PlayerIndex = GetTeamMember(nRand);
		nRet = tm_AssignBeast();
		nMaxTimes = nMaxTimes + 1;
	until nRet == 1 or nMaxTimes > 99;
	PlayerIndex = oldPlayerIndex;
	if nMaxTimes > 99 and nRet ~= 1 then
		DebugOutput("tm_aoto_assign_beast() failed!!!");
	end
end

function tm_AssignBeast()
	if gf_Judge_Room_Weight(1, 10) ~= 1 then
		return -1;
	end
	if DelItem(2, 1, 30615, 1) ~= 1 then
		return -2;
	end
	local oldPlayerIndex = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetItemCount(2, 1, 30616) >= 1 or GetTrigger(1543*2) > 0 then
			return -3;
		end
	end
	PlayerIndex = oldPlayerIndex;
	--������
	AddItem(2, 1, 30616, 1);
	--��������
	local nTrigger = CreateTrigger(1, 1543, 1543*2);
	if not nTrigger or nTrigger == 0 then
		DelItem(2, 1, 30616, 1);
		AddItem(2, 1, 30615, 1);
		return -4;
	end
	ContinueTimer(nTrigger);
	SetCurrentNpcSFX(PIdx2NpcIdx(), 921,0,1,18*3);
	--������Ϣ
	gf_Msg2Team(format("%s tr� th�nh Th�n Th� H� Gi�!", GetName()));
	return 1;
end

--�뿪ս��
function tm_leave_battle(bTag)
	if 	not bTag or bTag == 0 then
		Say(TM_TONG_AD_NPC.."Ng��i quy�t ��nh r�i kh�i lo�n chi�n bang h�i ch�?", 2, "Quy�t ��nh r�i kh�i/#tm_leave_battle(1)", "Ta suy ngh� l�i/nothing");
		return 0;
	end
	DelMSPlayer(tbTONGMELEE.missionID, 0);
end

--5��һ�Σ����޿����ߴ�����
function tm_OnTimer()
	local nMapId, nMapTemplteId = SubWorldIdx2ID(SubWorld);
	if nMapTemplteId ~= 6074 then
		DelItem(2, 1, 30616, GetItemCount(2, 1, 30616));
		RemoveTrigger(GetTrigger(1543*2));
		return 0;
	end
	--�����͸�������
	local bRet = tm_SummonNpc();
	--������BUFF
	if bRet == 1 then
		local nIndex, nLevel = tm_GetNpcLocate();
		if not nLevel or nLevel == 0 then
			DebugOutput("tm_OnTimer() nLevel == 0");
			return 0;
		end
		gf_TeamOperateEX(function (nLevel)
			CastState("state_p_attack_percent_add", nLevel * 10, 30 * 60 * 18, 1, 9991, 1);
			CastState("state_m_attack_percent_add", nLevel * 10, 30 * 60 * 18, 1, 9992, 1);
			CastState("state_burst_enhance_rate"  , nLevel * 10, 30 * 60 * 18, 1, 9993, 1);
			CastState("state_move_speed_percent_add", nLevel * 10, 30 * 60 * 18, 1, 9994, 1);
			SyncCustomState(1, 9991, 1, format("Th�n Th� LV%d", nLevel));
			Msg2Player("B�n nh�n ���c "..format("Th�n Th� LV%d: l�c c�ng k�ch t�ng %d%%, t�c �� xu�t chi�u t�ng %d%%, t�c �� di chuy�n t�ng %d%%", nLevel, nLevel*10, nLevel*10, nLevel*10));
		end, nLevel);	
	end
end

--����mission��ʱ���ʼ��
function tm_set_tong_info()
	if GetName() ~= GetCaptainName() then
		return 0;
	end
	local nTongCout = GetMissionV(tbTONGMELEE.mv_TongCount);
	DebugOutput("tm_set_tong_info(), ", nTongCout + 1, tm_GetTongName())
	if nTongCout >= tbTONGMELEE.MaxTongCount then
		return 0;
	end
	SetMissionV(tbTONGMELEE.mv_TongCount, nTongCout + 1);
	SetMissionS(nTongCout + 1, tm_GetTongName());
	SetMissionV(nTongCout + 1, 500);
end

--���ĳ���ɵĻ���
function tm_get_tongsorce()
	for i = 1, tbTONGMELEE.MaxTongCount do
		if tostring(GetMissionS(i)) == tostring(tm_GetTongName()) then
			return GetMissionV(i);
		end
	end
	return 0;
end

--����ĳ���ɻ���
function tm_set_tongsorce(nSorce)
	DebugOutput("tm_set_tongsorce(nSorce)", GetName(), tm_GetTongName(), nSorce);
	local nCurTime = GetTime();
	if nSorce > 0 then
		if nCurTime - GetTaskTemp(TMP_TASK_TONG_MELEE_DOUBLESORCE) <= 30 then
			nSorce = nSorce * 2;
		end
	elseif nSorce < 0 then
		if nCurTime - GetTaskTemp(TMP_TASK_TONG_MELEE_NOTREDUCESORCE) <= 30 then
			return 1;
		end
	end
	for i = 1, tbTONGMELEE.MaxTongCount do
		if tostring(GetMissionS(i)) == tostring(tm_GetTongName()) then
			if nSorce > 0 then
				SetMissionV(i, GetMissionV(i) + nSorce);
				gf_Msg2Team(format("�i�m t�ch l�y c�a bang %s l� %d, t�ng l��ng l� %d", "T�ng", nSorce, GetMissionV(i)));
			else
				SetMissionV(i, max(GetMissionV(i) + nSorce, 0));
				gf_Msg2Team(format("�i�m t�ch l�y c�a bang %s l� %d, t�ng l��ng l� %d", "Gi�m", -nSorce, GetMissionV(i)));
			end
			return 1;
		end
	end
	return 0;
end

function tm_GetNpcLocate()
	local nIndex = 0;
	local nSubIndex = 0;
	local oldPlayerIdx = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		local nFollower = GetFollower();
		if nFollower and nFollower > 0 then
			local sNpcName = GetNpcName(nFollower);
			for i = 1, getn(TM_TONG_SHENSHOU) do
				for j = 1, getn(TM_TONG_SHENSHOU[i]) do
					if TM_TONG_SHENSHOU[i][j] == sNpcName then
						nIndex = i;
						nSubIndex = j;					
					end
				end
			end
			break;
		end
	end
	PlayerIndex = oldPlayerIdx;
	return nIndex, nSubIndex;
end

--��������
function tm_SummonNpc()
	local nIndex = 0;
	local nSubIndex = 0;
	local nOldSubIndex = 0;
	local nFollower = GetFollower();
	if not nFollower or nFollower <= 0 then
		nIndex = random(4);
	else
		nIndex, nOldSubIndex = tm_GetNpcLocate();
		if nIndex == 0 then
			DebugOutput("can't find npc name~");
			return 0
		end
	end
	local nTongSorce = tm_get_tongsorce();
	if nTongSorce < 600 then
		nSubIndex = 1;
	elseif nTongSorce >= 600 and nTongSorce < 800 then
		nSubIndex = 2;
	elseif nTongSorce >= 800 and nTongSorce < 1200 then
		nSubIndex = 3;
	elseif nTongSorce >= 1200 then
		nSubIndex = 4;
	end
	if nSubIndex == 0 then
		DebugOutput("nSubIndex == 0");
		return 0;
	end
	if nSubIndex ~= nOldSubIndex then
		DebugOutput("TM_TONG_SHENSHOU[nIndex][nSubIndex] =",TM_TONG_SHENSHOU[nIndex][nSubIndex]);
		local bRetIndex = SummonNpc(TM_TONG_SHENSHOU_MODEL[nIndex][nSubIndex], TM_TONG_SHENSHOU[nIndex][nSubIndex]);
		if bRetIndex > 0 then
			if nSubIndex > nOldSubIndex then
				gf_Msg2Team(format("Ch�c m�ng th�n th� bang h�i �� th�ng c�p %s", TM_TONG_SHENSHOU[nIndex][nSubIndex]));
				Msg2MSAll(format("Ch�c m�ng %s th�n th� bang h�i th�ng c�p %s", tm_GetTongName(), TM_TONG_SHENSHOU[nIndex][nSubIndex]));
			elseif nSubIndex < nOldSubIndex then
				gf_Msg2Team(format("Th�n th� c�a bang h�i b� h� c�p l� %s", TM_TONG_SHENSHOU[nIndex][nSubIndex]));
				Msg2MSAll(format("%s th�n th� bang h�i b� h� c�p l� %s", tm_GetTongName(), TM_TONG_SHENSHOU[nIndex][nSubIndex]));
			end
			return 1;
		end
	end
	return 0;
end

function _tm_GetRankTable()
	local tRezult = {};
	local nTongCout = GetMissionV(tbTONGMELEE.mv_TongCount);
	for i = 1, nTongCout do
		--DebugOutput(GetMissionS(i), GetMissionV(i), type(GetMissionS(i)), type(GetMissionV(i)))
		tinsert(tRezult, {tostring(GetMissionS(i)), tonumber(GetMissionV(i))});
	end
--	DebugOutput("sort before----")
--	for k, v in tRezult do
--		if type(v) == "table" then
--			DebugOutput(k, v[1], v[2]);
--		else
--			DebugOutput(k, v);
--		end
--	end
--	DebugOutput("---------------");
	sort(tRezult, function (t1, t2)
			--DebugOutput(t1[1], t1[2], t2[1], t2[2])
			return t1[2] > t2[2];
		end);
--	DebugOutput("sort after-----");
--	for k, v in tRezult do
--		if type(v) == "table" then
--			DebugOutput(k, v[1], v[2]);
--		else
--			DebugOutput(k, v);
--		end
--	end
--	DebugOutput("---------------");
	return tRezult;
end

function tm_UpdateTongToClient()
	DebugOutput("tm_UpdateTongToClient() --------");
	local tRezult = _tm_GetRankTable();
	UpdateTongMeleeData(tRezult);
end

function tm_SetTempRevPos()
	local nMapID = GetMissionV(MV_MAP_ID);
	local nIndex = random(getn(TM_REVPOS));
	DebugOutput("SetTempRevPos",nMapID, TM_REVPOS[nIndex][1], TM_REVPOS[nIndex][2])
	SetTempRevPos(nMapID, TM_REVPOS[nIndex][1] * 32, TM_REVPOS[nIndex][2] * 32);
end

function tm_ResetEventPoint(npcIndex)
	local npcIdx = tonumber(npcIndex);
	if not npcIdx or type(npcIdx) ~= "number" then
		print("UDERROR:[TongMelee] tm_ResetEventPoint(npcIdx) not npcIdx or type(npcIdx) ~= number");
		return 0;
	end
	for i = tbTONGMELEE.mv_RandomEvent, tbTONGMELEE.mv_RandomEvent + 20 do
		if GetMissionV(i) == npcIdx then
			SetMissionV(i, 0);
		end
	end
end

function tm_RandomEvent()
	local nMapID = GetMissionV(MV_MAP_ID);
	DebugOutput("tm_RandomEvent() nMapID =", nMapID);
	if getn(TM_RANDOM_EVENT_POS) ~= 21 then
		print("UDERROR: tm_RandomEvent() getn(TM_RANDOM_EVENT_POS) ~= 21", getn(TM_RANDOM_EVENT_POS));
		return 0;
	end
	local nSize = getn(TM_RANMDOM_EVEN_NPC);
	for i = 1, 21 do
		if GetMissionV(tbTONGMELEE.mv_RandomEvent + i - 1) == 0 then
			local nKind = random(nSize);
			local npcIndex = CreateNpc(TM_RANMDOM_EVEN_NPC[nKind][1], TM_RANMDOM_EVEN_NPC[nKind][2], nMapID, TM_RANDOM_EVENT_POS[i][1], TM_RANDOM_EVENT_POS[i][2]);
			if TM_RANMDOM_EVEN_NPC[nKind][3] == 0 then
				SetNpcDeathScript(npcIndex, thisFile);
			elseif TM_RANMDOM_EVEN_NPC[nKind][3] == 1 then
				SetNpcScript(npcIndex, thisFile);
			end
			SetMissionV(tbTONGMELEE.mv_RandomEvent + i - 1, npcIndex);
		end
	end
end

function tm_Event1()
	local nMapID = GetMissionV(MV_MAP_ID);
	DebugOutput("tm_Event1() nMapID =", nMapID);
	if getn(TM_RANDOM_EVENT_POS) ~= 21 then
		print("UDERROR: tm_RandomEvent() getn(TM_RANDOM_EVENT_POS) ~= 21", getn(TM_RANDOM_EVENT_POS));
		return 0;
	end
	local nSize = getn(TM_RANMDOM_EVEN_NPC);
	for i = 11, 21 do
		if GetMissionV(tbTONGMELEE.mv_RandomEvent + i - 1) == 0 then
			local npcIndex = 0;
			if random(100) > 75 then --B
				npcIndex = CreateNpc(TM_RANMDOM_EVEN_NPC[2][1], TM_RANMDOM_EVEN_NPC[2][2], nMapID, TM_RANDOM_EVENT_POS[i][1], TM_RANDOM_EVENT_POS[i][2]);
				SetNpcDeathScript(npcIndex, thisFile);
			else --A
				npcIndex = CreateNpc(TM_RANMDOM_EVEN_NPC[1][1], TM_RANMDOM_EVEN_NPC[1][2], nMapID, TM_RANDOM_EVENT_POS[i][1], TM_RANDOM_EVENT_POS[i][2]);
				SetNpcDeathScript(npcIndex, thisFile);
			end
			SetMissionV(tbTONGMELEE.mv_RandomEvent + i - 1, npcIndex);
		end
	end
end

function tm_SetPlayer2Fight()
	DebugOutput("tm_SetPlayer2Fight()")
	CastState("state_dispear",100,5*18);
	tm_SetTempRevPos();
	SetTempRevScript(thisFile);
	RestoreAll();
	SetFightState(1);
	if GetTrigger(1543*2) > 0 then
		SetCurrentNpcSFX(PIdx2NpcIdx(), 921,0,1,18*3);
	end
end

function tm_GetTongName()
	if IsTongMember() <= 0 then
		return "null";
	end
--	local gsName, sName = gf_GetRealmName(GetName());
--	local sTongName = GetTongName();
--	return gsName.."*"..sTongName;
	return GetTongName();
end

function tm_EveryMatchAward()
	DebugOutput("tm_EveryMatchAward()------");
	local tRezult = _tm_GetRankTable();
	if not tRezult or getn(tRezult) < 1 then
		return 0;
	end
	local szFinalWinner = tRezult[1][1];
	local nFinalScore = tRezult[1][2];
	if nFinalScore < TM_LIMIT_SCORE then
		Msg2MSAll(tbTONGMELEE.missionID, format("Do kh�ng c� bang h�i ��t %d �i�m t�ch l�y, l�n n�y kh�ng c� bang h�i nh�n ���c t� c�ch c�ng th�nh!", TM_LIMIT_SCORE));
		return 0;
	end
	Msg2MSAll(tbTONGMELEE.missionID, format("Ch�c m�ng bang [%s] v�i th�nh t�ch %d �i�m t�ch l�y gi�nh th�ng l�i trong T� C�ch C�ng Th�nh Chi�n!", szFinalWinner, nFinalScore));	
	local szA, szD = GetCityWarAD(SIEGE_MAP_ID)
	if szD ~= "" then						-- ������سǷ�
		SetCityWarAttack(SIEGE_MAP_ID, szFinalWinner)
		Msg2SubWorld("Ch�c m�ng bang h�i:"..szFinalWinner.."Bang h�i nh�n ���c "..SIEGE_MAP_NAME.."_tu c�ch c�ng th�nh")
		AddGlobalNews("Ch�c m�ng bang h�i:"..szFinalWinner.."Bang h�i nh�n ���c "..SIEGE_MAP_NAME.."_tu c�ch c�ng th�nh")
		WriteLog(szFinalWinner.."Nh�n ���c"..SIEGE_MAP_NAME.."_tu c�ch c�ng th�nh")
	elseif szD == "" then					-- ���û���سǷ�����ֱ��ռ�г���
		SetCityWarWinner(SIEGE_MAP_ID, szFinalWinner)
		Msg2SubWorld("Ch�c m�ng bang h�i:"..szFinalWinner.." �� chi�m ���c "..SIEGE_MAP_NAME)
		AddGlobalNews("Ch�c m�ng bang h�i:"..szFinalWinner.." �� chi�m ���c "..SIEGE_MAP_NAME)
		WriteLog(szFinalWinner.." �� chi�m ���c "..SIEGE_MAP_NAME)
	end
end

function tm_RankShow()
	DebugOutput("tm_RankShow()------");
	local tRezult = _tm_GetRankTable();
	Msg2MSAll(tbTONGMELEE.missionID, "X�p h�ng bang h�i lo�n chi�n:");
	for i = 1, min(3, getn(tRezult)) do
		Msg2MSAll(tbTONGMELEE.missionID, format("X�p h�ng %d :%s[%d]", i, tRezult[i][1], tRezult[i][2]));	
	end
--	--���ݿ�����
--	local s = SDB(TM_RANK_INMATCHREALM, 0, 0);
--	s:apply2(callout(_tm_RelayShareDataRank, tRezult))
end

--function _tm_RelayShareDataRank(tRezult, nCount, sdb)
--	DebugOutput("_tm_RelayShareDataRank", tRezult, nCount, sdb)
--	DebugOutput("-----------------")
--	local tRank = {};
--	for i = 1, getn(tRezult) do
--		DebugOutput(tRezult[i][1],tRezult[i][2],TM_RANK_SORCE[i]);
--		tinsert(tRank, {tRezult[i][1], TM_RANK_SORCE[i]});
--	end
--	DebugOutput("-----------------")
--	for i = 1, nCount do
--		local tData = sdb[i-1];
--		DebugOutput(tData[1], tData[2]);
--		if tData[1] and tData[2] ~= 0 then
--			for j = 1, getn(tRank) do
--				if tRank[j][1] == tData[1] then
--					tRank[j][2] = tRank[j][2] + tData[2];
--					break;
--				end
--			end
--		end
--	end
--	DebugOutput("-----------------")
--	for i = 1, getn(tRank) do
--		DebugOutput(tRank[i][1],tRank[i][2]);
--	end
--	DebugOutput("-----------------")
--	local s = SDB(TM_RANK_INMATCHREALM, 0, 0);
--	s.sortType = 2;
--	for i = 1, getn(tRank) do
--		s[tRank[i][1]] = {"d", tRank[i][2]};
--	end
--end

function tm_CheckPlayer()
	if GetTrigger(1543*2) <= 0 then
		return 0;
	end
	if IsPlayerDeath() == 1 then
		RevivePlayer(1);
		tm_SetPlayer2Fight();
	end
end