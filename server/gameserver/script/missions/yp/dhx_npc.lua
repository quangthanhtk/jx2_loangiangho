--�κ���
Include("\\script\\missions\\yp\\tls\\head.lua")
Include("\\script\\missions\\yp\\hss\\head.lua")
Include("\\script\\missions\\yp\\mm\\head.lua")
Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\tmp_task_id_def.lua")
Include("\\script\\missions\\yp\\vn\\shengwang_award.lua")

tNpcName = {
	{"<color=green>�o�n H�a Huy�n<color>: ","Ha ha, hi�p s� c� th� �i xung quanh tham quan c�nh ��p c�a ho�ng t�c."},
	{"<color=green>C�t Kh�m X�ch Ba<color>: ","�a t� thi�u hi�p gi�p ��, kh�ng bi�t c� th�ch h�p kh�ng?"},
	{"<color=green>L� K� Tinh<color>: ","V�ng T�y H� r�ng l�n, s�n v�t phong ph�. Gi�p �� ch�ng t�i s� kh�ng b� l� v�n ��u!"},	
};
g_szThisFile = "\\script\\missions\\yp\\dhx_npc.lua";
g_nMaxCount = 15;

function main()
	local nMapID = GetWorldPos()
	local nType = 0;
	local strNpcName = GetNpcName(GetTargetNpc());
	if strNpcName == "�o�n H�a Huy�n" then
		SetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP,1);
		nType = 1;
	elseif strNpcName == "L� K� Tinh" then
		SetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP,3);
		nType = 3;		
	elseif strNpcName == "C�t Kh�m X�ch Ba" then
		SetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP,2);
		nType = 2;			
	end
	if GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP) == 0 then
		return 0;
	end
	local g_NpcName = tNpcName[nType][1];
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= 0 and nCamp ~= nType then
		Talk(1,"",g_NpcName.."Ng��i �� gia nh�p th� l�c kh�c, v�y c�n ��n ��y l�m g�? Ch�ng l� c� � �� g�?");
		return 0;
	end	
	local strtab = {}
	if nType == nCamp then
		tinsert(strtab, "Th� L�c Ba Phe-Di�n V� Chi�n/dhx_YwzTalk");
		tinsert(strtab,format("%s/shengwang_award_main", "Nh�n ph�n th��ng danh v�ng"))
		tinsert(strtab,"��n "..tMainMapID[nType][2].."/dhx_talk_3")
		tinsert(strtab,"Ta mu�n r�i kh�i"..tMainMapID[nType][2].."/dhx_talk_2")
	else
		tinsert(strtab,"Ta mu�n gia nh�p"..tMainMapID[nType][2].."/dhx_talk_1")
	end
	tinsert(strtab,"���c, kh�ng c� vi�c g�!/nothing")
	Say(g_NpcName..tNpcName[nType][2],
		getn(strtab),
		strtab)
end

function dhx_talk_1()
	local nType = GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP);
	local g_NpcName = tNpcName[nType][1];
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nLv = GetLevel();
	local nCheckRoute = gf_CheckPlayerRoute();
	if gf_CheckLevel(5, 90) ~= 1 or nCheckRoute ~= 1 then
		Talk(1,"",g_NpcName.."��t chuy�n sinh 5 c�p 90 v� gia nh�p l�u ph�i s� c� th� gia nh�p th� l�c!");
		return 0;
	end
	if nCamp ~= 0 and nCamp ~= nType then
		Talk(1,"",g_NpcName.."Ng��i �� gia nh�p th� l�c kh�c, v�y c�n ��n n��c ta �� l�m g�? Ch�ng l� c� � �� g�?");
		return 0;
	elseif nCamp == nType then
		Talk(1,"",g_NpcName.."Ng��i �� gia nh�p th� l�c c�a ta, h�y ti�p t�c c� g�ng n�o!");
		return 0;		
	end
	--if tGtTask:check_task_isfinish(294) == 0 and tGtTask:check_cur_task(294) ~= 1 then --LongDaiKa: ��ng �i�u ki�n gia nh�p phe
	--	Talk(1,"",g_NpcName.."B�n c�n ph�i ho�n th�nh nhi�m v� th� l�c ba phe m�i ���c gia nh�p, b�m <color=green>F11<color> xem ti�n c� nhi�m v�.");
	--	return 0;
	--end
	if GetGlbValue(GLV_YP_FLASHTIME) == 0 or (GetGlbValue(GLV_YP_FLASHTIME)-GetTime()) > 60 then
		local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
		tbPVPCharm:reflash();
		tbPVPCharm:apply(g_szThisFile,"dhx_talk_1_1");
	else
		local g_nCharmA = GetGlbValue(GLV_YP_CHARM_ONE);
		local g_nCharmB = GetGlbValue(GLV_YP_CHARM_TWO);
		local g_nCharmC = GetGlbValue(GLV_YP_CHARM_THREE);
		local g_nPlayersA = GetGlbValue(GLV_YP_PLAYER_ONE);
		local g_nPlayersB = GetGlbValue(GLV_YP_PLAYER_TWO);
		local g_nPlayersC = GetGlbValue(GLV_YP_PLAYER_THREE);
		Say(g_NpcName..format("Nh� ng��i �� bi�t, xung quanh bao g�m 3 th� l�c ch�ng l�i Thi�n �m Gi�o. Trong �� nh�n kh� c�a ��i L� Qu�c: <color=yellow>%d<color>, s� ng��i: <color=yellow>%d<color>, nh�n kh� c�a Th� Ph�n Qu�c: <color=yellow>%d<color>, s� ng��i: <color=yellow>%d<color>, nh�n kh� c�a T�y H� Qu�c: <color=yellow>%d<color>, s� ng��i: <color=yellow>%d<color>. Ng��i mu�n gia nh�p v�i ch�ng t�i th�t ch�?<color=red>Sau khi gia nh�p ph�i 7 ng�y sau m�i ���c r�i kh�i!<color>",g_nCharmA,g_nPlayersA,g_nCharmB,g_nPlayersB,g_nCharmC,g_nPlayersC),
			2,
			"\nTa s� c�u th� gi�i/dhx_talk_1_2",
			"\n�� ta suy ngh� l�i/nothing")
	end
end

function dhx_talk_1_1(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end	
	local nType = GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP);
	local g_NpcName = tNpcName[nType][1];
	
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	local nTotal,g_nCharmA,g_nCharmB,g_nCharmC = tbPVPCharm[0][2],tbPVPCharm[0][3],tbPVPCharm[0][4],tbPVPCharm[0][5];
	local g_nPlayersA,g_nPlayersB,g_nPlayersC = tbPVPCharm[0][6],tbPVPCharm[0][7],tbPVPCharm[0][8];
		local g_nCharmA = tbPVPCharm[0][3] or 1000;
		local g_nCharmB = tbPVPCharm[0][4] or 1000;
		local g_nCharmC = tbPVPCharm[0][5] or 1000;
		local g_nPlayersA = tbPVPCharm[0][6] or 0;
		local g_nPlayersB = tbPVPCharm[0][7] or 0;
		local g_nPlayersC = tbPVPCharm[0][8] or 0;
		SetGlbValue(GLV_YP_CHARM_ONE,g_nCharmA);
		SetGlbValue(GLV_YP_CHARM_TWO,g_nCharmB);
		SetGlbValue(GLV_YP_CHARM_THREE,g_nCharmC);
		SetGlbValue(GLV_YP_PLAYER_ONE,g_nPlayersA);
		SetGlbValue(GLV_YP_PLAYER_TWO,g_nPlayersB);
		SetGlbValue(GLV_YP_PLAYER_THREE,g_nPlayersC);
	Say(g_NpcName..format("Nh� ng��i �� bi�t, xung quanh bao g�m 3 th� l�c ch�ng l�i Thi�n �m Gi�o. Trong �� nh�n kh� c�a ��i L� Qu�c: <color=yellow>%d<color>, s� ng��i: <color=yellow>%d<color>, nh�n kh� c�a Th� Ph�n Qu�c: <color=yellow>%d<color>, s� ng��i: <color=yellow>%d<color>, nh�n kh� c�a T�y H� Qu�c: <color=yellow>%d<color>, s� ng��i: <color=yellow>%d<color>. Ng��i mu�n gia nh�p v�i ch�ng t�i th�t ch�?<color=red>Sau khi gia nh�p ph�i 7 ng�y sau m�i ���c r�i kh�i!<color>",g_nCharmA,g_nPlayersA,g_nCharmB,g_nPlayersB,g_nCharmC,g_nPlayersC),
		2,
		"\nTa s� c�u th� gi�i/dhx_talk_1_2",
		"\n�� ta suy ngh� l�i/nothing")	
end

function dhx_talk_1_2()
	local nCampType = GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP);
	local g_NpcName = tNpcName[nCampType][1];
	local g_nPlayersA = GetGlbValue(GLV_YP_PLAYER_ONE);
	local g_nPlayersB = GetGlbValue(GLV_YP_PLAYER_TWO);
	local g_nPlayersC = GetGlbValue(GLV_YP_PLAYER_THREE);	
	local tPlayers = {g_nPlayersA,g_nPlayersB,g_nPlayersC};
	local nMax,nMin,nCount = yp_checkCampNum(g_nPlayersA,g_nPlayersB,g_nPlayersC);
	if nCount >= g_nMaxCount and tPlayers[nCampType] == nMax then 
		Talk(1,"",g_NpcName.."Ng��i kh�ng th� gia nh�p phe ta, hi�n t�i s� ng��i c�a phe ta �� h�n ��ng minh "..g_nMaxCount.." ng��i r�i!");
		return 0;
	end
	if nCampType == 1 then
		SetGlbValue(GLV_YP_PLAYER_ONE,GetGlbValue(GLV_YP_PLAYER_ONE)+1);
	elseif nCampType == 2 then
		SetGlbValue(GLV_YP_PLAYER_TWO,GetGlbValue(GLV_YP_PLAYER_TWO)+1);
	elseif nCampType == 3 then
		SetGlbValue(GLV_YP_PLAYER_THREE,GetGlbValue(GLV_YP_PLAYER_THREE)+1);
	else
		return 0;
	end	
	SetTask(TASK_FIELD_PVP_CAMP,nCampType);
	SetTask(TASK_FIELD_PVP_JOIN_TIME,GetTime());
	OpenPop(nCampType-1)
	SetTask(TASK_FIELD_PVP_EQUIP_SHOP1,0);--�����̵�һ���������
	if GetGlbValue(GLV_YP_FLASHTIME) == 0 or (GetGlbValue(GLV_YP_FLASHTIME)-GetTime()) > 60 then
		local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
		tbPVPCharm:reflash();
		tbPVPCharm:apply(g_szThisFile,"dhx_talk_1_3");
	else
		Talk(1,"",format("%s �� th�nh c�ng ��i di�n cho V� L�m Minh gia nh�p th� l�c %s ch�ng l�i Thi�n �m Gi�o.",g_NpcName,tMainMapID[nCampType][2]));
	end
	--������Ӫ������ּ���
	SetPlayerScript("\\script\\missions\\yp\\ywz\\head.lua");
	SendScript2VM("\\script\\missions\\yp\\ywz\\head.lua", "ywz_TransCampFinish()")
end

function dhx_talk_2()
	local nCampType = GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP);
	local g_NpcName = tNpcName[nCampType][1];	
	Say(g_NpcName.."R�i kh�i th� l�c s� x�a b� �� c�ng hi�n th� l�c, quy�t ��nh r�i kh�i?",
		2,
		"\nX�c nh�n/dhx_talk_2_confirm",
		"\nK�t th�c ��i tho�i/nothing")
end

function dhx_talk_2_confirm()
	local nCampType = GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP);
	local g_NpcName = tNpcName[nCampType][1];
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCampType ~= nCamp then
		Talk(1,"",g_NpcName.."��i hi�p kh�ng thu�c th� l�c c�a phe ta!");
		return 0;
	end
	local nCurTime = GetTime() - GetTask(TASK_FIELD_PVP_JOIN_TIME);
	if nCurTime < 1*24*3600 then --LongDaiKa: m�c ��nh 7 ng�y m�i cho r�i phe
		Talk(1,"",g_NpcName..format("H�nh vi l�m vi�c c�a ��i hi�p khi�n cho nhi�u ng��i c�m th�y kh� ch�u, h�y ��i <color=yellow>%s<color> sau r�i quay l�i! �� tr�nh vi�c m�i ng��i n�i gi�n.",Get_Time_String(1*24*3600-nCurTime,"dhms")))
	else
		SetTask(TASK_FIELD_PVP_CAMP,0);
		-------------------------------
		SetTask(TASK_FIELD_PVP_GXD,0);  --���׶�
--		SetTask(TASK_FIELD_PVP_COUNT,0); --pvp����
		SetTask(TASK_FIELD_PVP_STEAL_BOOK,0);
		SetTask(TASK_FIELD_PVP_STEAL_STEP,0);
		SetTask(TASK_FIELD_PVP_STEALED,0);
		SetTask(TASK_FIELD_PVP_STEAL_MAP,0);
		SetTask(TASK_FIELD_PVP_CAR_START,0);
		SetTask(TASK_FIELD_PVP_CAR_TASK,0);
		SetTask(TASK_FIELD_PVP_SEED_NUM,0);
		SetTask(TASK_FIELD_PVP_SEED_TIME,0);
		SetTask(TASK_FIELD_PVP_SEED_STEAL,0);
		SetTask(TASK_FIELD_PVP_SEED_SUR,0);
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME1,0);
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME2,0);
		SetTask(TASK_FIELD_PVP_CAR_TB,0);
		SetTask(TASK_FIELD_PVP_TREASURE,0);
		ClosePop(nCamp);
		
		--������Ӫ ������
		local gbl = GLV_YP_PLAYER_ONE + nCamp - 1
		local nVal = GetGlbValue(gbl)
		if nVal > 0 then nVal = nVal -1 end
		SetGlbValue(gbl, nVal)
		
		-------------------------------
		Talk(1,"",g_NpcName.."�a t� ��i hi�p �� gi�p �� trong nh�ng ng�y qua, ch�ng t�i s� ghi nh� �n t�nh n�y. Sau n�y s� b�o ��p.")
		local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
		tbPVPCharm:reflash();
		tbPVPCharm:apply(g_szThisFile,"dhx_talk_2_1");
		--������Ӫ������ּ���
		SetPlayerScript("\\script\\missions\\yp\\ywz\\head.lua");
		SendScript2VM("\\script\\missions\\yp\\ywz\\head.lua", "ywz_TransCamp()")
	end	
end

function dhx_talk_2_1(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	local a1,a2,a3,a4 = tbPVPCharm[0][2],tbPVPCharm[0][3],tbPVPCharm[0][4],tbPVPCharm[0][5];
	local a,b,c = tbPVPCharm[0][6],tbPVPCharm[0][7],tbPVPCharm[0][8];
	local nCampType = GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP);
	if nCampType == 1 and a ~= nil and a ~= 0 then
		a = a-1;
	end
	if nCampType == 2 and b ~= nil and b ~= 0 then
		b = b-1;
	end
	if nCampType == 3 and c ~= nil and c ~= 0 then
		c = c-1;
	else
		return 0;
	end
	tbPVPCharm["Charm"] = {"ddddddd",a1,a2,a3,a4,a,b,c};
end

function dhx_talk_3()
	local nCampType = GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP);
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local g_NpcName = tNpcName[nCampType][1];
	if nCampType == 0 then
		return 0;
	end
	if nCamp ~= 0 and nCampType ~= nCamp then
		Talk(1,"",g_NpcName.."��i hi�p �� gia nh�p th� l�c kh�c, v�y c�n ��n t�m ta l�m g�?");
		return 0;
	end
	if GetPKValue() >= 10 then
		Talk(1,"",g_NpcName.."C�c h� s�t kh� qu� n�ng (PK#10), n�u v�o T�y V�c e r�ng s� c� h�a s�t th�n, �� ngh� c�c h� h�y t�y tr� s�t kh� (S� d�ng Ti�u Ki�p T�n �� gi�m tr� PK), �� tr�nh tai h�a khi v�o T�y V�c.");
		return 0;
	end
	if GetTeamSize() ~= 0 then
		Talk(1,"",g_NpcName.."��i hi�p h�y r�i ��i r�i quay l�i!");
		return 0;
	end
	if nCampType == 1 then
		dhx_enter_1(nCampType);
	elseif nCampType == 2 then
		dhx_enter_2(nCampType);
	elseif nCampType == 3 then
		dhx_enter_3(nCampType);
	end	
end

function dhx_talk_1_3(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local nCampType = GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_CAMP);
	local g_NpcName = tNpcName[nCampType][1];	
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	local g_nCharmA = GetGlbValue(GLV_YP_CHARM_ONE);
	local g_nCharmB = GetGlbValue(GLV_YP_CHARM_TWO);
	local g_nCharmC = GetGlbValue(GLV_YP_CHARM_THREE);
	local g_nPlayersA = GetGlbValue(GLV_YP_PLAYER_ONE);
	local g_nPlayersB = GetGlbValue(GLV_YP_PLAYER_TWO);
	local g_nPlayersC = GetGlbValue(GLV_YP_PLAYER_THREE);
	tbPVPCharm["Charm"] = {"ddddddd",g_nCharmA+g_nCharmB+g_nCharmC,g_nCharmA,g_nCharmB,g_nCharmC,g_nPlayersA,g_nPlayersB,g_nPlayersC};
	SetGlbValue(GLV_YP_FLASHTIME,GetTime());
	Talk(1,"",format("%s �� th�nh c�ng ��i di�n cho V� L�m Minh gia nh�p th� l�c %s ch�ng l�i Thi�n �m Gi�o.",g_NpcName,tMainMapID[nCampType][2]));
end

function dhx_addCharm(nType,nAddNum)
--	if GetGlbValue(GLV_YP_FLASHTIME) == 0 or (GetGlbValue(GLV_YP_FLASHTIME)-GetTime()) > 60 then
		g_nType = nType;
		g_nAddNum = nAddNum;
		local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
		tbPVPCharm:reflash();
		tbPVPCharm:apply(g_szThisFile,"dhx_addCharm_1");
--	else
--		if nType == 1 then
--			SetGlbValue(GLV_YP_CHARM_ONE,GetGlbValue(GLV_YP_CHARM_ONE)+nAddNum);
--		elseif nType == 2 then
--			SetGlbValue(GLV_YP_CHARM_TWO,GetGlbValue(GLV_YP_CHARM_TWO)+nAddNum);
--		elseif nType == 3 then
--			SetGlbValue(GLV_YP_CHARM_THREE,GetGlbValue(GLV_YP_CHARM_THREE)+nAddNum);
--		end
--	end
--	if nAddNum > 0 then
--		Msg2SubWorld(tMainMapID[nType][2].."��������ֵ����"..nAddNum.."�㣡");
--	elseif nAddNum < 0 then
--		Msg2SubWorld(tMainMapID[nType][2].."��������ֵ����"..nAddNum.."�㣡");
--	end	
end

function dhx_addCharm_1(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	local nTotal,a,b,c = tbPVPCharm[0][2],tbPVPCharm[0][3],tbPVPCharm[0][4],tbPVPCharm[0][5];
	local d,e,f = tbPVPCharm[0][6],tbPVPCharm[0][7],tbPVPCharm[0][8];
--	local a1,b1,c1 = GetGlbValue(GLV_YP_CHARM_ONE),GetGlbValue(GLV_YP_CHARM_TWO),GetGlbValue(GLV_YP_CHARM_THREE);
--	local d1,e1,f1 = GetGlbValue(GLV_YP_PLAYER_ONE),GetGlbValue(GLV_YP_PLAYER_TWO),GetGlbValue(GLV_YP_PLAYER_THREE)
--	SetGlbValue(GLV_YP_FLASHTIME,GetTime());
	nTotal = a + b + c + g_nAddNum;
	if g_nType == 1 then
		a = a + g_nAddNum;
		if a < nTotal*0.1 then
			mf_SetMissionV(tbSLY.missionID,tbSLY.mv11,1,tbSLY.realMapID);
		end
	elseif g_nType == 2 then
		b = b + g_nAddNum;
		if b < nTotal*0.1 then
			mf_SetMissionV(tbTBHSS.missionID,tbTBHSS.mv11,1,tbTBHSS.realMapID);
		end		
	elseif g_nType == 3 then
		c = c + g_nAddNum;
		if c < nTotal*0.1 then
			mf_SetMissionV(tbXXMM.missionID,tbXXMM.mv11,1,tbXXMM.realMapID);
		end
	else
		return 0;
	end
	tbPVPCharm["Charm"] = {"ddddddd",nTotal,a,b,c,d,e,f};
end

function dhx_addCharm2(nType,nAddNum)
--	if GetGlbValue(GLV_YP_FLASHTIME) == 0 or (GetGlbValue(GLV_YP_FLASHTIME)-GetTime()) > 60 then
		g_nType2 = nType;
		g_nAddNum2 = nAddNum;
		local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
		tbPVPCharm:reflash();
		tbPVPCharm:apply(g_szThisFile,"dhx_addCharm_2");
end

function dhx_addCharm_2(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	local nTotal,a,b,c = tbPVPCharm[0][2],tbPVPCharm[0][3],tbPVPCharm[0][4],tbPVPCharm[0][5];
	local d,e,f = tbPVPCharm[0][6],tbPVPCharm[0][7],tbPVPCharm[0][8];
	nTotal = a + b + c + g_nAddNum2;
	if g_nType2 == 1 then
		a = a + g_nAddNum2;
		if a < nTotal*0.1 then
			mf_SetMissionV(tbSLY.missionID,tbSLY.mv11,1,tbSLY.realMapID);
		end
	elseif g_nType2 == 2 then
		b = b + g_nAddNum2;
		if b < nTotal*0.1 then
			mf_SetMissionV(tbTBHSS.missionID,tbTBHSS.mv11,1,tbTBHSS.realMapID);
		end		
	elseif g_nType2 == 3 then
		c = c + g_nAddNum2;
		if c < nTotal*0.1 then
			mf_SetMissionV(tbXXMM.missionID,tbXXMM.mv11,1,tbXXMM.realMapID);
		end
	else
		return 0;
	end
	tbPVPCharm["Charm"] = {"ddddddd",nTotal,a,b,c,d,e,f};
end

function dhx_writeData()
	if GetGlbValue(GLV_YP_PLAYER_ONE) == 0 then
		return 0;
	end
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	tbPVPCharm:reflash();
	tbPVPCharm:apply(g_szThisFile,"dhx_writeData_CallBack");	
end

function dhx_writeData_CallBack(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end	
	local tbPVPCharm = SDB(FIELD_PVP_RELAY_KEY,0,0);
	local nDate = tonumber(date("%d"));
	local a1,a2,a3,a4 = tbPVPCharm[0][2],tbPVPCharm[0][3],tbPVPCharm[0][4],tbPVPCharm[0][5];
	local a,b,c = tbPVPCharm[0][6],tbPVPCharm[0][7],tbPVPCharm[0][8];
	if nDate == 1 then --ÿ����1��ˢ��
		a1,a2,a3,a4 = 3000,1000,1000,1000;
		Msg2MSGroup("�� t�o m�i tr� nh�n kh� th� l�c!");
	end 
	tbPVPCharm["Charm"] = {"ddddddd",a1,a2,a3,a4,max(GetGlbValue(GLV_YP_PLAYER_ONE),a),max(GetGlbValue(GLV_YP_PLAYER_TWO),b),max(GetGlbValue(GLV_YP_PLAYER_THREE),c)};
end

function dhx_enter_1(nType)
	SetPlayerScript("\\script\\missions\\yp\\tls\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\tls\\entrynpc.lua","enter()");
end

function dhx_enter_2(nType)
	SetPlayerScript("\\script\\missions\\yp\\hss\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\hss\\entrynpc.lua","enter()");
end

function dhx_enter_3(nType)
	SetPlayerScript("\\script\\missions\\yp\\mm\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\mm\\entrynpc.lua","enter()");
end


function yp_checkCampNum(a,b,c)
	local nMax = 0;
	local nMin = 0;
	local nCount = 0;
	if a > b then
		nMax = a;
		nMin = b;
	else
		nMax = b;
		nMin = a;
	end
	nCount = abs(a-b);
	if nMax > c then
		nCount = max(nCount,nMax-c);
		nMin = min(nMin,c);
	else
		nMax = c;
		nCount = max(nCount,c-nMin);
	end
	return nMax,nMin,nCount
end

function dhx_YwzTalk()
	SetPlayerScript("\\script\\missions\\yp\\ywz\\npc_award.lua");
	SendScript2VM("\\script\\missions\\yp\\ywz\\npc_award.lua", "main()")
end
