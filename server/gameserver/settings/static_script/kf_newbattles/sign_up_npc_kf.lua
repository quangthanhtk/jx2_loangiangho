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
g_sNpcName = "Chi課 trng li猲 u";

function kf_battle_gettoday()
	return tonumber(date("%Y%m%d"))
end

function kf_battle_check_open(nBattleType)
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nCurState = mod(nGlobalState, 10) --获取战场当前处于哪个阶段
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
		Talk(1,"",format("<color=green>%s<color>: B秓 th� l躰h i c竎 ngi n鉯 chuy謓 v韎 ta.",GetTargetNpcName()))
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
		if nTransLevel < nNeedTransLv then 				szErr = format("<color=green>%s<color>: Chi課 trng qu� t祅 kh鑓, h穣 v� r蘮 luy謓 th猰, t <color=yellow>%s<color> h穣 n t譵 ta.", g_sNpcName, format("%d chuy觧 %d c蕄",floor(nNeedTransLv/100), mod(nNeedTransLv,100) ) ) end
		if GetPlayerRoute() == 0 then 							szErr = "<color=green>"..g_sNpcName.."<color>: V� danh ti觰 t鑤 nh� ngi m� c騨g mu鑞 tham gia cu閏 chi課 T鑞g-Li猽 �? Gia nh藀 m玭 ph竔 r錳 h穣 t輓h." end
		if abs(GetTask(701)) < nNeedJunGong then 	szErr = format("<color=green>%s<color>: Ngi c莕 t  %d 甶觤 c玭g tr筺g m韎 頲 tham d�.", g_sNpcName, nNeedJunGong) end
		if GetCash() < nNeedCash then 				szErr = format("<color=green>%s<color>:".."C竎 h� mang theo kh玭g  %d v祅g", g_sNpcName, ceil(nNeedCash/10000) ) end
		if GetPKValue() >= 4 then 								szErr = "<color=green>"..g_sNpcName.."<color>: T閕 竎 t祔 tr阨 kh玭g th� tham gia chi課 trng!" end
		if GetTask(nActiveTask) > 0 then szErr = "<color=green>"..g_sNpcName.."<color>: Ngi ch璦 nh薾 ph莕 thng l莕 trc." end
		if nLastJoinDate == nToday then 						szErr = "<color=green>"..g_sNpcName.."<color>".."Чi hi謕 h穣 r阨 kh醝 t� i r錳 quay l筰!" end
		if nTeamCamp ~= BT_GetCurCamp() then 					szErr = "<color=green>"..g_sNpcName.."<color>".."Kh玭g c飊g phe v韎 i trng, kh玭g th� t� i  v祇!" end
		if szErr ~= "" then
			Talk(1,"",szErr)
			tinsert(terrorName, GetName())
		end
	end
	PlayerIndex = oldPlayerIndex
	if getn(terrorName) > 0 then
		local errStr = format("<color=green>%s<color>: V祇 chi課 trng c莕 <color=yellow>gia nh藀 l璾 ph竔<color>, t <color=yellow>CS %d Lv%d<color> tr� l猲, C玭g Tr筺g t <color=yellow>%d<color> tr� l猲, kh玭g ph秈 k� <color=red2>T閕 僣 T祔 Tr阨<color>,  nh薾 <color=yellow>thng<color> Chi課 Trng trc  v�  d飊g <color=yellow>%d<color> v祅g, c飊g <color=yellow>phe v韎 i trng<color>. Nh鱪g ngi sau kh玭g ph� h頿 甶襲 ki謓:\n",
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
		Talk(1,"",format("<color=green>%s<color>: Chi課 trng qu� t祅 kh鑓, h穣 v� r蘮 luy謓 th猰, t <color=yellow>%s<color> h穣 n t譵 ta.", g_sNpcName, format("%d chuy觧 %d c蕄",floor(nNeedTransLv/100), mod(nNeedTransLv,100) ) ))
		return 0;
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: V� danh ti觰 t鑤 nh� ngi m� c騨g mu鑞 tham gia cu閏 chi課 T鑞g-Li猽 �? Gia nh藀 m玭 ph竔 r錳 h穣 t輓h.");
		return 0;
	end

	local nJungong = abs(GetTask(701))
	if nJungong < nNeedJunGong then
		Talk(1,"",format("<color=green>%s<color>: Ngi c莕 t  %d 甶觤 c玭g tr筺g m韎 頲 tham d�.", g_sNpcName, nNeedJunGong))
		return 0
	end
	if GetPKValue() >= 4 then	--红名不能进战场
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: T閕 竎 t祔 tr阨 kh玭g th� tham gia chi課 trng!");
		return 0;
	end
	if GetTask(nActiveTask) > 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ngi ch璦 nh薾 ph莕 thng l莕 trc.");
		return 0;
	end
	if GetCash() < nNeedCash then
		Talk(1,"",format("<color=green>%s<color>:".."C竎 h� mang theo kh玭g  %d v祅g", g_sNpcName, ceil(nNeedCash/10000)))
		return 0;
	end
	return 1
end

function kf_battle_return_talk(nBattleType)
	local selTab = {
		format("Tr� l筰 chi課 trng/#kf_newbattle_return_to_battle(%d)", nBattleType),
		"K誸 th骳 i tho筰/nothing",
	}
	Say("<color=green>"..g_sNpcName..format("<color>: Chi課 trng ph輆 trc  khai h醓, %s mu鑞 tham gia kh玭g?", gf_GetPlayerSexName()),getn(selTab),selTab);
end

function main_kf_newbattle(nBattleType)
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nLastJoinDate, nLastJoinCamp = kf_get_last_join_info(nBattleType) 
	local nSignFlagTask = T_TSK_KF_SIGN_FLAG[nBattleType]

	if GetTime() - GetTask(nSignFlagTask) < 1800 then -- 战场开启后，已经进入过战场的玩家，30分钟内可以单人回到战场
		kf_battle_return_talk(nBattleType)
		return 0;
	end

	local nCurState = mod(nGlobalState, 10)
	local nStateSign = T_KF_BATTLE_STATE[nBattleType].state_sign
	local nStateFighting = T_KF_BATTLE_STATE[nBattleType].state_fighting

	--战场正式开启前，进入过战场的玩家，可以单人返回战场
	if nCurState == nStateSign and nLastJoinDate == kf_battle_gettoday() then
		kf_battle_return_talk(nBattleType)
		return 0;
	end
	
	if nGlobalState == 0 or kf_battle_check_open(nBattleType) ~= 1 then
		Say("<color=green>"..g_sNpcName.."<color>: "..format("Chi課 trng ch璦 m�, h穣 ch� � th阨 gian b竜 danh."), 0);
		return 0;
	end
	
	local nDate = tonumber(date("%y%m%d"));
	local nSongPlayerCount = BT_GetPlayerCount(nBattleType, SONG_ID);
	local nLiaoPlayerCount = BT_GetPlayerCount(nBattleType, LIAO_ID);
		
	local selTab = {
			"Ta mu鑞 tham gia"..tBattleName[nBattleType].."chi課 trng [T鑞g "..nSongPlayerCount.." ngi]: [Li猽 "..nLiaoPlayerCount.." ngi]/#join_battle("..nBattleType..")",
			"K誸 th骳 i tho筰/nothing",
	}
	local szCost = format("<color=yellow>ti猽 hao %d v祅g<color>", ceil(T_KF_JOIN_CASH_COST[nBattleType]/10000))
	--战斗阶段，付费补报名
	if nCurState == nStateFighting then
		szCost = format("Chi課 trng  m�, b竜 danh b� c莕 <color=yellow>t鑞 %d v祅g<color>", ceil(T_KF_JOIN_SUPPLEMENTARY_CASH_COST[nBattleType]/10000))
	end
	Say("<color=green>"..g_sNpcName..format("<color>: Chi課 trng ph輆 trc  khai h醓, %s mu鑞 tham gia kh玭g?"..szCost, gf_GetPlayerSexName()),getn(selTab),selTab);
end

function kf_newbattle_return_to_battle(nBattleType)
	if kf_battle_check_open(nBattleType) ~= 1 then
		Say("<color=green>"..g_sNpcName.."<color>: "..format("Chi課 trng ch璦 m�, h穣 ch� � th阨 gian b竜 danh."), 0)
		return 0
	end

	if GetTeamSize() > 0 then -- 返回战场就不要组队了
		Talk(1,"","<color=green>"..g_sNpcName.."<color>".."Чi hi謕 h穣 r阨 kh醝 t� i r錳 quay l筰!");
		return
	end
	local _, nCamp = kf_get_last_join_info(nBattleType)
	local nCampPlayerCount = BT_GetPlayerCount(nBattleType,nCamp);

	if nCampPlayerCount >= T_KF_MAX_SIGNUP_PLAYER_DIFF[nBattleType] then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: S� ngi b竜 danh chi課 trng  t n gi韎 h筺, l莕 sau h穣 quay l筰.");
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
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Binh l鵦 phe n祔  , B籲g h鱱 h穣 quay l筰 sau nh�! S� ngi i b猲 hi謓 l�: <color=yellow>T鑞g ["..nSongPlayerCount.."]:["..nLiaoPlayerCount.."] Li猽<color>.");
		Msg2Player("S� ngi ch猲h l謈h tr猲"..nMaxPlayerCountDiff);
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
	--战斗阶段，付费补报名
	if nCurState == nStateFighting then
		nPayCash = T_KF_JOIN_SUPPLEMENTARY_CASH_COST[nBattleType]
	end
	if pc_pay_addtask(nPayCash) ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>:"..format("Trong t骾 kh玭g  %d v祅g", ceil(nPayCash/10000)))
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
	local nCurState = mod(nGlobalState, 10) --获取战场当前处于哪个阶段
	local nStateSign = T_KF_BATTLE_STATE[nBattleType].state_sign
	local nStateFighting = T_KF_BATTLE_STATE[nBattleType].state_fighting

	-- if nCurState ~= 1 and nCurState ~= 3 then	--副战场报名中；未报过名的
	-- 	Talk(1,"","<color=green>"..g_sNpcName.."<color>：战场已开启，请下次再来。");
	-- 	return 0;
	-- end
	if kf_battle_check_open(nBattleType) ~= 1 then
		Say("<color=green>"..g_sNpcName.."<color>: "..format("Chi課 trng ch璦 m�"), 0);
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
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: ".."Chi課 trng kh玭g th� dung n筽 s� ngi trong i ng�, xin h穣 i tr薾 ti誴 theo.");
		else
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: S� ngi b竜 danh chi課 trng  t n gi韎 h筺, l莕 sau h穣 quay l筰.");
		end
		return 0;
	end

	if nTeamSize > 0 and kf_newbattle_teamcheck(nBattleType) ~= 1 then
		return 0
	elseif nTeamSize <= 0 and kf_newbattle_singlecheck(nBattleType) ~= 1 then
		return 0
	end

	-- local nCamp = SONG_ID
	-- if GetTask(704) < 0 then --军衔 辽
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
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Binh l鵦 phe n祔  , B籲g h鱱 h穣 quay l筰 sau nh�! S� ngi i b猲 hi謓 l�: <color=yellow>T鑞g ["..nSongPlayerCount.."]:["..nLiaoPlayerCount.."] Li猽<color>.");
		Msg2Player("S� ngi ch猲h l謈h tr猲"..nMaxPlayerCountDiff);
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
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ch糿g ph秈 ngi c� quy觧 s竎h sao?");
	end
end

function get_kf_battle_award(nBattleType)
	local nRezult = GetTask(T_TSK_KF_BATTLE_RESULT[nBattleType]);
	local nActivity = GetTask(T_TSK_KF_ACTIVITY_TO_SOURCE[nBattleType])
	local nRank = GetTask(T_TSK_KF_PERSONAL_RANK[nBattleType])

	if nActivity <= 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Чi hi謕 ch璦 t鮪g tham chi課, ho芻 c� ч T輈h C鵦 qu� th蕄. Sau khi tham chi課 xong h穣 n g苝 ta nh薾 thng!");
		return 0;
	end
	local tSay = {};
	local tTempString = {
		[0] = "B蕋 ph﹏ th緉g b筰",	
		[1] = "Х gi祅h chi課 th緉g",
		[2] = "Х th蕋 b筰",
	}
	if not tTempString[nRezult] then
		return 0;
	end
	local strTemp = format("Tr薾 chi課 l莕 trc i hi謕 <color=green>%s<color>, nh薾 頲 <color=green>%d<color> ч T輈h C鵦.", tTempString[nRezult], nActivity);
	local nNeedActivity = T_TSK_KF_AWARD_NEED_PERSONAL_POINT[nBattleType]
	if nActivity < nNeedActivity then
		-- 活跃度过低
		strTemp = format("%s <color=red>觤 n╪g ng kh玭g  %d, kh玭g th� nh薾 thng.<color>", strTemp, nNeedActivity)
		SetTask(T_TSK_KF_BATTLE_RESULT[nBattleType], 0)
		SetTask(T_TSK_KF_ACTIVITY_TO_SOURCE[nBattleType], 0)
		SetTask(T_TSK_KF_PERSONAL_RANK[nBattleType], 0);
		BT_SetData(PT_POINT_AWARD_KF,0);
		BT_SetData(PTNC_BATTLEPOINT_KF,0);
		Talk(1,"",strTemp)
		return 0
	end
	if nRank > 0 and nRank <= T_TSK_KF_RANK_AWARD_NEED_RANK[nBattleType] then 
		strTemp = strTemp .. format("Чi hi謕 t h筺g <color=yellow>%d<color> ч T輈h C鵦, 頲 nh薾 thng C玭g Tr筺g v� Kinh Nghi謒 x<color=yellow>%.1f<color>!", nRank, T_KF_BATTLE_EXP_JUNGONG_AWARD_MUL[nBattleType])
	end
	tSay.sel = {};
	strTemp = strTemp.."S� d鬾g Qu﹏ C玭g Chng, Чi C玭g Chng, Huy Ho祅g Chng  nh薾 thng s� nh薾 頲 nhi襲 C玭g Tr筺g h琻."
	tinsert(tSay.sel, {"Nh薾 thng tr鵦 ti誴", 		format("#get_kf_battle_award_deal(%d,%d)",nBattleType,1)})
	tinsert(tSay.sel, {"Qu﹏ c玭g chng nh薾 thng", 	format("#get_kf_battle_award_deal(%d,%d)",nBattleType,2)})
	tinsert(tSay.sel, {"Qu﹏ c玭g i nh薾 thng", 	format("#get_kf_battle_award_deal(%d,%d)",nBattleType,3)})
	tinsert(tSay.sel, {"Qu﹏ c玭g huy ho祅g nh薾 thng", format("#get_kf_battle_award_deal(%d,%d)",nBattleType,4)})
	tinsert(tSay.sel, {"Qu﹏ c玭g chng Vinh D� nh薾 thng", format("#get_kf_battle_award_deal(%d,%d)",nBattleType,5)})
	tinsert(tSay.sel, {"Ra kh醝", "nothing"})
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
		[2] = {2, 1, 9999, "Qu﹏ C玭g Chng"},
		[3] = {2, 1, 9998, "Qu﹏ C玭g Чi"},
		[4] = {2, 1, 9977, "Qu﹏ C玭g Huy Ho祅g"},
		[5] = {2, 1, 30642, "qu﹏ c玭g chng vinh d� "},
	}
	if tJGZ[nKind] then
		if DelItem(tJGZ[nKind][1], tJGZ[nKind][2], tJGZ[nKind][3], 1) ~= 1 then
			Talk(1,"",format("H祅h trang kh玭g  <color=green>%s<color>", tJGZ[nKind][4]));
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

	--先清理变量 防止多次领奖
	SetTask(T_TSK_KF_BATTLE_RESULT[nBattleType], 0)
	SetTask(T_TSK_KF_ACTIVITY_TO_SOURCE[nBattleType], 0)
	SetTask(T_TSK_KF_PERSONAL_RANK[nBattleType], 0)
	-- BT_SetData(PT_POINT_AWARD_KF,0);
	-- BT_SetData(PTNC_BATTLEPOINT_KF,0);
	
	--给奖励
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