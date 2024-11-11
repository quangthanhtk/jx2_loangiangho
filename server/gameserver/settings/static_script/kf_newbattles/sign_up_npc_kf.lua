Include("\\settings\\static_script\\kf_newbattles\\battlestatistic.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\settings\\static_script\\kf_newbattles\\battleaward.lua");
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")
Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\kf_newbattles\\emplacementbattle\\mission\\mission_head.lua")
_,AT_GGS = GetRealmType();
if 1==AT_GGS then
	Include("\\script\\paycoin_head.lua")
end
g_sNpcName = "Chi�n tr��ng li�n ��u";

function kf_battle_gettoday()
	return tonumber(date("%Y%m%d"))
end

function kf_battle_check_open(nBattleType)
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nCurState = mod(nGlobalState, 10) --��ȡս����ǰ�����ĸ��׶�
	local nStateSign = T_KF_BATTLE_STATE[nBattleType].state_sign
	local nStateFighting = T_KF_BATTLE_STATE[nBattleType].state_fighting
	if nCurState == nStateSign or nCurState == nStateFighting then
		return 1
	else
		return 0
	end 
end

function kf_get_last_join_info(nBattleType)
	-- GetTask(TSK_LAST_JOIN_CAMP) = date*10 + camp
	-- example:201912121 => date:20191212,camp:1
	local nInfo = GetTask(T_TSK_KF_LASTCAMP[nBattleType])
	local nCamp = floor(mod(nInfo, 10))
	local nDate = floor(nInfo/10)
	return nDate, nCamp
end

function kf_newbattle_teamcheck(nBattleType)
	if GetCaptainName() ~= GetName() then
		Talk(1,"",format("<color=green>%s<color>: B�o th� l�nh ��i c�c ng��i n�i chuy�n v�i ta.",GetTargetNpcName()))
		return 0
	end
	local terrorName = {}
	local oldPlayerIndex = PlayerIndex
	local nToday = kf_battle_gettoday()
	local nTeamCamp = BT_GetCurCamp()
	local nNeedTransLv 	= T_KF_JOIN_NEED_TRANSLEVEL[nBattleType]
	local nNeedJunGong 	= T_KF_JOIN_NEED_JUNGONG[nBattleType]
	local nNeedCash 	= T_KF_JOIN_CASH_COST[nBattleType]
	local nActiveTask 	= T_TSK_KF_ACTIVITY_TO_SOURCE[nBattleType]

	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		BT_NewBattleClear(nBattleType);
		local szErr = ""
		local nTransLevel = gf_GetTransLevel()
		local err = 0
		local nLastJoinDate, nLastJoinCamp = kf_get_last_join_info(nBattleType)
		if nTransLevel < nNeedTransLv then 				szErr = format("<color=green>%s<color>: Chi�n tr��ng qu� t�n kh�c, h�y v� r�n luy�n th�m, ��t <color=yellow>%s<color> h�y ��n t�m ta.", g_sNpcName, format("%d chuy�n %d c�p",floor(nNeedTransLv/100), mod(nNeedTransLv,100) ) ) end
		if GetPlayerRoute() == 0 then 							szErr = "<color=green>"..g_sNpcName.."<color>: V� danh ti�u t�t nh� ng��i m� c�ng mu�n tham gia cu�c chi�n T�ng-Li�u �? Gia nh�p m�n ph�i r�i h�y t�nh." end
		if abs(GetTask(701)) < nNeedJunGong then 	szErr = format("<color=green>%s<color>: Ng��i c�n ��t �� %d �i�m c�ng tr�ng m�i ���c tham d�.", g_sNpcName, nNeedJunGong) end
		if GetCash() < nNeedCash then 				szErr = format("<color=green>%s<color>:".."C�c h� mang theo kh�ng �� %d v�ng", g_sNpcName, ceil(nNeedCash/10000) ) end
		if GetPKValue() >= 4 then 								szErr = "<color=green>"..g_sNpcName.."<color>: T�i �c t�y tr�i kh�ng th� tham gia chi�n tr��ng!" end
		if GetTask(nActiveTask) > 0 then szErr = "<color=green>"..g_sNpcName.."<color>: Ng��i ch�a nh�n ph�n th��ng l�n tr��c." end
		if nLastJoinDate == nToday then 						szErr = "<color=green>"..g_sNpcName.."<color>".."��i hi�p h�y r�i kh�i t� ��i r�i quay l�i!" end
		if nTeamCamp ~= BT_GetCurCamp() then 					szErr = "<color=green>"..g_sNpcName.."<color>".."Kh�ng c�ng phe v�i ��i tr��ng, kh�ng th� t� ��i �� v�o!" end
		if szErr ~= "" then
			Talk(1,"",szErr)
			tinsert(terrorName, GetName())
		end
	end
	PlayerIndex = oldPlayerIndex
	if getn(terrorName) > 0 then
		local errStr = format("<color=green>%s<color>: V�o chi�n tr��ng c�n <color=yellow>gia nh�p l�u ph�i<color>, ��t <color=yellow>CS %d Lv%d<color> tr� l�n, C�ng Tr�ng ��t <color=yellow>%d<color> tr� l�n, kh�ng ph�i k� <color=red2>T�i �c T�y Tr�i<color>, �� nh�n <color=yellow>th��ng<color> Chi�n Tr��ng tr��c �� v� �� d�ng <color=yellow>%d<color> v�ng, c�ng <color=yellow>phe v�i ��i tr��ng<color>. Nh�ng ng��i sau kh�ng ph� h�p �i�u ki�n:\n",
			GetTargetNpcName(), floor(nNeedTransLv/100), mod(nNeedTransLv,100), nNeedJunGong,  ceil(nNeedCash/10000))
		for i = 1, getn(terrorName) do
			errStr = format("%s    <color=red2>%s<color>\n",errStr, terrorName[i])
		end
		Talk(1,"",errStr)
		return 0
	end
	return 1
end

function kf_newbattle_singlecheck(nBattleType)
	BT_NewBattleClear(nBattleType);
	local nNeedTransLv 	= T_KF_JOIN_NEED_TRANSLEVEL[nBattleType]
	local nNeedJunGong 	= T_KF_JOIN_NEED_JUNGONG[nBattleType]
	local nNeedCash 	= T_KF_JOIN_CASH_COST[nBattleType]
	local nActiveTask 	= T_TSK_KF_ACTIVITY_TO_SOURCE[nBattleType]

	local nTransLevel 	= gf_GetTransLevel()
	
	if nTransLevel < nNeedTransLv then
		Talk(1,"",format("<color=green>%s<color>: Chi�n tr��ng qu� t�n kh�c, h�y v� r�n luy�n th�m, ��t <color=yellow>%s<color> h�y ��n t�m ta.", g_sNpcName, format("%d chuy�n %d c�p",floor(nNeedTransLv/100), mod(nNeedTransLv,100) ) ))
		return 0;
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: V� danh ti�u t�t nh� ng��i m� c�ng mu�n tham gia cu�c chi�n T�ng-Li�u �? Gia nh�p m�n ph�i r�i h�y t�nh.");
		return 0;
	end

	local nJungong = abs(GetTask(701))
	if nJungong < nNeedJunGong then
		Talk(1,"",format("<color=green>%s<color>: Ng��i c�n ��t �� %d �i�m c�ng tr�ng m�i ���c tham d�.", g_sNpcName, nNeedJunGong))
		return 0
	end
	if GetPKValue() >= 4 then	--�������ܽ�ս��
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: T�i �c t�y tr�i kh�ng th� tham gia chi�n tr��ng!");
		return 0;
	end
	if GetTask(nActiveTask) > 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng��i ch�a nh�n ph�n th��ng l�n tr��c.");
		return 0;
	end
	if GetCash() < nNeedCash then
		Talk(1,"",format("<color=green>%s<color>:".."C�c h� mang theo kh�ng �� %d v�ng", g_sNpcName, ceil(nNeedCash/10000)))
		return 0;
	end
	return 1
end

function kf_battle_return_talk(nBattleType)
	local selTab = {
		format("Tr� l�i chi�n tr��ng/#kf_newbattle_return_to_battle(%d)", nBattleType),
		"K�t th�c ��i tho�i/nothing",
	}
	Say("<color=green>"..g_sNpcName..format("<color>: Chi�n tr��ng ph�a tr��c �� khai h�a, %s mu�n tham gia kh�ng?", gf_GetPlayerSexName()),getn(selTab),selTab);
end

function main_kf_newbattle(nBattleType)
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nLastJoinDate, nLastJoinCamp = kf_get_last_join_info(nBattleType) 
	local nSignFlagTask = T_TSK_KF_SIGN_FLAG[nBattleType]

	if GetTime() - GetTask(nSignFlagTask) < 1800 then -- ս���������Ѿ������ս������ң�30�����ڿ��Ե��˻ص�ս��
		kf_battle_return_talk(nBattleType)
		return 0;
	end

	local nCurState = mod(nGlobalState, 10)
	local nStateSign = T_KF_BATTLE_STATE[nBattleType].state_sign
	local nStateFighting = T_KF_BATTLE_STATE[nBattleType].state_fighting

	--ս����ʽ����ǰ�������ս������ң����Ե��˷���ս��
	if nCurState == nStateSign and nLastJoinDate == kf_battle_gettoday() then
		kf_battle_return_talk(nBattleType)
		return 0;
	end
	
	if nGlobalState == 0 or kf_battle_check_open(nBattleType) ~= 1 then
		Say("<color=green>"..g_sNpcName.."<color>: "..format("Chi�n tr��ng ch�a m�, h�y ch� � th�i gian b�o danh."), 0);
		return 0;
	end
	
	local nDate = tonumber(date("%y%m%d"));
	local nSongPlayerCount = BT_GetPlayerCount(nBattleType, SONG_ID);
	local nLiaoPlayerCount = BT_GetPlayerCount(nBattleType, LIAO_ID);
		
	local selTab = {
			"Ta mu�n tham gia"..tBattleName[nBattleType].."chi�n tr��ng [T�ng "..nSongPlayerCount.." ng��i]: [Li�u "..nLiaoPlayerCount.." ng��i]/#join_battle("..nBattleType..")",
			"K�t th�c ��i tho�i/nothing",
	}
	local szCost = format("<color=yellow>ti�u hao %d v�ng<color>", ceil(T_KF_JOIN_CASH_COST[nBattleType]/10000))
	--ս���׶Σ����Ѳ�����
	if nCurState == nStateFighting then
		szCost = format("Chi�n tr��ng �� m�, b�o danh b� c�n <color=yellow>t�n %d v�ng<color>", ceil(T_KF_JOIN_SUPPLEMENTARY_CASH_COST[nBattleType]/10000))
	end
	Say("<color=green>"..g_sNpcName..format("<color>: Chi�n tr��ng ph�a tr��c �� khai h�a, %s mu�n tham gia kh�ng?"..szCost, gf_GetPlayerSexName()),getn(selTab),selTab);
end

function kf_newbattle_return_to_battle(nBattleType)
	if kf_battle_check_open(nBattleType) ~= 1 then
		Say("<color=green>"..g_sNpcName.."<color>: "..format("Chi�n tr��ng ch�a m�, h�y ch� � th�i gian b�o danh."), 0)
		return 0
	end

	if GetTeamSize() > 0 then -- ����ս���Ͳ�Ҫ�����
		Talk(1,"","<color=green>"..g_sNpcName.."<color>".."��i hi�p h�y r�i kh�i t� ��i r�i quay l�i!");
		return
	end
	local _, nCamp = kf_get_last_join_info(nBattleType)
	local nCampPlayerCount = BT_GetPlayerCount(nBattleType,nCamp);

	if nCampPlayerCount >= T_KF_MAX_SIGNUP_PLAYER_DIFF[nBattleType] then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: S� ng��i b�o danh chi�n tr��ng �� ��t ��n gi�i h�n, l�n sau h�y quay l�i.");
		return 0;
	end

	local nEnemyPlayerCount = BT_GetPlayerCount(nBattleType, (nCamp==SONG_ID and LIAO_ID or SONG_ID) )
	local nSongPlayerCount, nLiaoPlayerCount = 0, 0
	if nCamp == SONG_ID then
		nSongPlayerCount = nCampPlayerCount
		nLiaoPlayerCount = nEnemyPlayerCount
	else
		nSongPlayerCount = nEnemyPlayerCount
		nLiaoPlayerCount = nCampPlayerCount
	end

	local nDiffPlayerCount = nCampPlayerCount - nEnemyPlayerCount
	local nMaxPlayerCountDiff = T_KF_MAX_SIGNUP_PLAYER_DIFF[nBattleType]
	if nDiffPlayerCount >= nMaxPlayerCountDiff then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Binh l�c phe n�y �� ��, B�ng h�u h�y quay l�i sau nh�! S� ng��i ��i b�n hi�n l�: <color=yellow>T�ng ["..nSongPlayerCount.."]:["..nLiaoPlayerCount.."] Li�u<color>.");
		Msg2Player("S� ng��i ch�nh l�ch tr�n"..nMaxPlayerCountDiff);
		return 0
	end

	BT_SetData(PT_BATTLE_TYPE,nBattleType);
	BT_SetData(PT_SIGN_UP,nBattleType*10+nCamp);
	BT_AddSignUpPlayerCount(nBattleType,nCamp);

	local nBattleMapID = tBTMSInfo[nBattleType][2];
	mf_JoinMission(tBTMSInfo[nBattleType][1],nCamp,nBattleMapID)
end

function kf_newbattle_player_enter(nBattleType, nCamp, nBattleMapID)
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nPayCash = T_KF_JOIN_CASH_COST[nBattleType]

	local nCurState = mod(nGlobalState, 10)
	local nStateFighting = T_KF_BATTLE_STATE[nBattleType].state_fighting
	--ս���׶Σ����Ѳ�����
	if nCurState == nStateFighting then
		nPayCash = T_KF_JOIN_SUPPLEMENTARY_CASH_COST[nBattleType]
	end
	if pc_pay_addtask(nPayCash) ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>:"..format("Trong t�i kh�ng �� %d v�ng", ceil(nPayCash/10000)))
		return
	end
	BT_SetData(PTNC_ACTIVITY_KF, ACTIVITY_ADJUSTOR);
	BT_SetData(PT_BATTLE_TYPE,nBattleType);
	BT_SetData(PT_SIGN_UP,nBattleType*10+nCamp);
	BT_SetData(PT_BATTLE_DATE,tonumber(date("%y%m%d"))*1000+nGlobalState);
	BT_AddSignUpPlayerCount(nBattleType,nCamp);
	local tRsID = T_KF_BATTLE_RUNTIMESTATE_JOIN[nBattleType]
	if tRsID and getn(tRsID) >= 2 then
		AddRuntimeStat(tRsID[1], tRsID[2], 0, 1);
	end
	mf_JoinMission(tBTMSInfo[nBattleType][1], nCamp, nBattleMapID);
end

function join_battle(nBattleType)
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nCurState = mod(nGlobalState, 10) --��ȡս����ǰ�����ĸ��׶�
	local nStateSign = T_KF_BATTLE_STATE[nBattleType].state_sign
	local nStateFighting = T_KF_BATTLE_STATE[nBattleType].state_fighting

	-- if nCurState ~= 1 and nCurState ~= 3 then	--��ս�������У�δ��������
	-- 	Talk(1,"","<color=green>"..g_sNpcName.."<color>��ս���ѿ��������´�������");
	-- 	return 0;
	-- end
	if kf_battle_check_open(nBattleType) ~= 1 then
		Say("<color=green>"..g_sNpcName.."<color>: "..format("Chi�n tr��ng ch�a m�"), 0);
		return 0;
	end

	local nCamp = BT_GetCurCamp()
	local nTeamSize = GetTeamSize()
	local nNeedSize = max(1, nTeamSize)
	local nCampPlayerCount = BT_GetPlayerCount(nBattleType, nCamp);
	local nSongPlayerCount = BT_GetPlayerCount(nBattleType, SONG_ID);
	local nLiaoPlayerCount = BT_GetPlayerCount(nBattleType, LIAO_ID);
	local nMaxPlayerCount = T_KF_BATTLE_MAX_PLAYER[nBattleType]

	if nCampPlayerCount + nNeedSize >= nMaxPlayerCount then
		if nNeedSize > 1 then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: ".."Chi�n tr��ng kh�ng th� dung n�p s� ng��i trong ��i ng�, xin h�y ��i tr�n ti�p theo.");
		else
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: S� ng��i b�o danh chi�n tr��ng �� ��t ��n gi�i h�n, l�n sau h�y quay l�i.");
		end
		return 0;
	end

	if nTeamSize > 0 and kf_newbattle_teamcheck(nBattleType) ~= 1 then
		return 0
	elseif nTeamSize <= 0 and kf_newbattle_singlecheck(nBattleType) ~= 1 then
		return 0
	end

	-- local nCamp = SONG_ID
	-- if GetTask(704) < 0 then --���� ��
	-- 	nCamp = LIAO_ID
	-- end
	-- if nSongPlayerCount > nLiaoPlayerCount then
	-- 	nCamp = LIAO_ID;
	-- elseif nSongPlayerCount < nLiaoPlayerCount then
	-- 	nCamp = SONG_ID;
	-- else
	-- 	nCamp = random(SONG_ID, LIAO_ID)
	-- end
	local nDiffPlayerCount = nCamp==SONG_ID and (nSongPlayerCount - nLiaoPlayerCount) or (nLiaoPlayerCount - nSongPlayerCount)
	local nMaxPlayerCountDiff = T_KF_MAX_SIGNUP_PLAYER_DIFF[nBattleType]
	if nDiffPlayerCount >= nMaxPlayerCountDiff then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Binh l�c phe n�y �� ��, B�ng h�u h�y quay l�i sau nh�! S� ng��i ��i b�n hi�n l�: <color=yellow>T�ng ["..nSongPlayerCount.."]:["..nLiaoPlayerCount.."] Li�u<color>.");
		Msg2Player("S� ng��i ch�nh l�ch tr�n"..nMaxPlayerCountDiff);
		return 0
	end

	local nBattleMapID = tBTMSInfo[nBattleType][2];
	if nTeamSize > 0 then
		local tTeamPlayer = {}
		for i = 1, nTeamSize do
			tinsert(tTeamPlayer, GetTeamMember(i))
		end
		local oldPlayerIndex = PlayerIndex 
		for i = 1, getn(tTeamPlayer) do
			PlayerIndex = tTeamPlayer[i]
			kf_newbattle_player_enter(nBattleType, nCamp, nBattleMapID)
		end
		PlayerIndex = oldPlayerIndex
	else
		kf_newbattle_player_enter(nBattleType, nCamp, nBattleMapID)
	end

end

function get_battle_book()
	if GetItemCount(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4]) == 0 then
		AddItem(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4],1);
	else
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ch�ng ph�i ng��i c� quy�n s�ch sao?");
	end
end

function get_kf_battle_award(nBattleType)
	local nRezult = GetTask(T_TSK_KF_BATTLE_RESULT[nBattleType]);
	local nActivity = GetTask(T_TSK_KF_ACTIVITY_TO_SOURCE[nBattleType])
	local nRank = GetTask(T_TSK_KF_PERSONAL_RANK[nBattleType])

	if nActivity <= 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: ��i hi�p ch�a t�ng tham chi�n, ho�c c� �� T�ch C�c qu� th�p. Sau khi tham chi�n xong h�y ��n g�p ta nh�n th��ng!");
		return 0;
	end
	local tSay = {};
	local tTempString = {
		[0] = "B�t ph�n th�ng b�i",	
		[1] = "�� gi�nh chi�n th�ng",
		[2] = "�� th�t b�i",
	}
	if not tTempString[nRezult] then
		return 0;
	end
	local strTemp = format("Tr�n chi�n l�n tr��c ��i hi�p <color=green>%s<color>, nh�n ���c <color=green>%d<color> �� T�ch C�c.", tTempString[nRezult], nActivity);
	local nNeedActivity = T_TSK_KF_AWARD_NEED_PERSONAL_POINT[nBattleType]
	if nActivity < nNeedActivity then
		-- ��Ծ�ȹ���
		strTemp = format("%s <color=red>�i�m n�ng ��ng kh�ng �� %d, kh�ng th� nh�n th��ng.<color>", strTemp, nNeedActivity)
		SetTask(T_TSK_KF_BATTLE_RESULT[nBattleType], 0)
		SetTask(T_TSK_KF_ACTIVITY_TO_SOURCE[nBattleType], 0)
		SetTask(T_TSK_KF_PERSONAL_RANK[nBattleType], 0);
		BT_SetData(PT_POINT_AWARD_KF,0);
		BT_SetData(PTNC_BATTLEPOINT_KF,0);
		Talk(1,"",strTemp)
		return 0
	end
	if nRank > 0 and nRank <= T_TSK_KF_RANK_AWARD_NEED_RANK[nBattleType] then 
		strTemp = strTemp .. format("��i hi�p ��t h�ng <color=yellow>%d<color> �� T�ch C�c, ���c nh�n th��ng C�ng Tr�ng v� Kinh Nghi�m x<color=yellow>%.1f<color>!", nRank, T_KF_BATTLE_EXP_JUNGONG_AWARD_MUL[nBattleType])
	end
	tSay.sel = {};
	strTemp = strTemp.."S� d�ng Qu�n C�ng Ch��ng, ��i C�ng Ch��ng, Huy Ho�ng Ch��ng �� nh�n th��ng s� nh�n ���c nhi�u C�ng Tr�ng h�n."
	tinsert(tSay.sel, {"Nh�n th��ng tr�c ti�p", 		format("#get_kf_battle_award_deal(%d,%d)",nBattleType,1)})
	tinsert(tSay.sel, {"Qu�n c�ng ch��ng nh�n th��ng", 	format("#get_kf_battle_award_deal(%d,%d)",nBattleType,2)})
	tinsert(tSay.sel, {"Qu�n c�ng ��i nh�n th��ng", 	format("#get_kf_battle_award_deal(%d,%d)",nBattleType,3)})
	tinsert(tSay.sel, {"Qu�n c�ng huy ho�ng nh�n th��ng", format("#get_kf_battle_award_deal(%d,%d)",nBattleType,4)})
	tinsert(tSay.sel, {"Qu�n c�ng ch��ng Vinh D� nh�n th��ng", format("#get_kf_battle_award_deal(%d,%d)",nBattleType,5)})
	tinsert(tSay.sel, {"Ra kh�i", "nothing"})
	tSay.msg = "<color=green>"..g_sNpcName.."<color>: "..strTemp;
	temp_Talk(tSay);
end



function get_kf_battle_award_deal(nBattleType, nKind)
	nKind = tonumber(nKind) or 0;
	
	local nRet = GetTask(T_TSK_KF_BATTLE_RESULT[nBattleType])
	local tAward = T_KF_BATTLE_AWARD_INFO[nBattleType][nRet]
	if not tAward then
		return 0
	end
	if gf_Judge_Room_Weight(tAward.nNeedRoom, 10, " ") ~= 1 then
		return 0;
	end
	local nRank = GetTask(T_TSK_KF_PERSONAL_RANK[nBattleType])
	local power = 1
	if nRank > 0 and nRank <= T_TSK_KF_RANK_AWARD_NEED_RANK[nBattleType] then 
		power = T_KF_BATTLE_EXP_JUNGONG_AWARD_MUL[nBattleType]
	end
		
	local nExp = tAward.exp * power
	local nJunGong = tAward.tJunGong[nKind] * power
	
	local tJGZ = {
		[2] = {2, 1, 9999, "Qu�n C�ng Ch��ng"},
		[3] = {2, 1, 9998, "Qu�n C�ng ��i"},
		[4] = {2, 1, 9977, "Qu�n C�ng Huy Ho�ng"},
		[5] = {2, 1, 30642, "qu�n c�ng ch��ng vinh d� "},
	}
	if tJGZ[nKind] then
		if DelItem(tJGZ[nKind][1], tJGZ[nKind][2], tJGZ[nKind][3], 1) ~= 1 then
			Talk(1,"",format("H�nh trang kh�ng �� <color=green>%s<color>", tJGZ[nKind][4]));
			return 0;
		end
		FireEvent("event_ib_cost",tJGZ[nKind][1], tJGZ[nKind][2], tJGZ[nKind][3], 1);
	end
	
	if tAward.tRuntimeStat then
		local tRsID = tAward.tRuntimeStat[nKind]
		if tRsID then
			AddRuntimeStat(tRsID[1], tRsID[2], 0, 1);
		end
	end

	--��������� ��ֹ����콱
	SetTask(T_TSK_KF_BATTLE_RESULT[nBattleType], 0)
	SetTask(T_TSK_KF_ACTIVITY_TO_SOURCE[nBattleType], 0)
	SetTask(T_TSK_KF_PERSONAL_RANK[nBattleType], 0)
	-- BT_SetData(PT_POINT_AWARD_KF,0);
	-- BT_SetData(PTNC_BATTLEPOINT_KF,0);
	
	--������
	local szLogCaption = tAward.szLogCaption or "KFBattleAward"
	gf_SetLogCaption(szLogCaption)
	if tAward.coin > 0 then Earn(tAward.coin) end
	gf_Modify("Exp", nExp);
	gf_EventGiveCustomAward(31, nJunGong, 1, szLogCaption, "JunGong");
	if tAward.item then
		for i = 1,getn(tAward.item) do
			local _item = tAward.item[i]
			gf_AddItemEx({_item[1],_item[2],_item[3],_item[4],_item[5]}, _item[6])
		end
	end
	if tAward.tAwardGroup then
		if CustomAwardCheckCondition(tAward.tAwardGroup[1]) == 1 then
			CustomAwardGiveGroup(tAward.tAwardGroup[1], tAward.tAwardGroup[2])
		end
	end
	gf_SetLogCaption("")
end