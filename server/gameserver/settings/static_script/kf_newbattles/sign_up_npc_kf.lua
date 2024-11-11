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
g_sNpcName = "ChiÕn tr­êng liªn ®Êu";

function kf_battle_gettoday()
	return tonumber(date("%Y%m%d"))
end

function kf_battle_check_open(nBattleType)
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nCurState = mod(nGlobalState, 10) --»ñÈ¡Õ½³¡µ±Ç°´¦ÓÚÄÄ¸ö½×¶Î
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
		Talk(1,"",format("<color=green>%s<color>: B¶o thñ lÜnh ®éi c¸c ng­¬i nãi chuyÖn víi ta.",GetTargetNpcName()))
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
		if nTransLevel < nNeedTransLv then 				szErr = format("<color=green>%s<color>: ChiÕn tr­êng qu¸ tµn khèc, h·y vÒ rÌn luyÖn thªm, ®¹t <color=yellow>%s<color> h·y ®Õn t×m ta.", g_sNpcName, format("%d chuyÓn %d cÊp",floor(nNeedTransLv/100), mod(nNeedTransLv,100) ) ) end
		if GetPlayerRoute() == 0 then 							szErr = "<color=green>"..g_sNpcName.."<color>: V« danh tiÓu tèt nh­ ng­¬i mµ còng muèn tham gia cuéc chiÕn Tèng-Liªu µ? Gia nhËp m«n ph¸i råi h·y tÝnh." end
		if abs(GetTask(701)) < nNeedJunGong then 	szErr = format("<color=green>%s<color>: Ng­¬i cÇn ®¹t ®ñ %d ®iÓm c«ng tr¹ng míi ®­îc tham dù.", g_sNpcName, nNeedJunGong) end
		if GetCash() < nNeedCash then 				szErr = format("<color=green>%s<color>:".."C¸c h¹ mang theo kh«ng ®ñ %d vµng", g_sNpcName, ceil(nNeedCash/10000) ) end
		if GetPKValue() >= 4 then 								szErr = "<color=green>"..g_sNpcName.."<color>: Téi ¸c tµy trêi kh«ng thÓ tham gia chiÕn tr­êng!" end
		if GetTask(nActiveTask) > 0 then szErr = "<color=green>"..g_sNpcName.."<color>: Ng­¬i ch­a nhËn phÇn th­ëng lÇn tr­íc." end
		if nLastJoinDate == nToday then 						szErr = "<color=green>"..g_sNpcName.."<color>".."§¹i hiÖp h·y rêi khái tæ ®éi råi quay l¹i!" end
		if nTeamCamp ~= BT_GetCurCamp() then 					szErr = "<color=green>"..g_sNpcName.."<color>".."Kh«ng cïng phe víi ®éi tr­ëng, kh«ng thÓ tæ ®éi ®Ó vµo!" end
		if szErr ~= "" then
			Talk(1,"",szErr)
			tinsert(terrorName, GetName())
		end
	end
	PlayerIndex = oldPlayerIndex
	if getn(terrorName) > 0 then
		local errStr = format("<color=green>%s<color>: Vµo chiÕn tr­êng cÇn <color=yellow>gia nhËp l­u ph¸i<color>, ®¹t <color=yellow>CS %d Lv%d<color> trë lªn, C«ng Tr¹ng ®¹t <color=yellow>%d<color> trë lªn, kh«ng ph¶i kÎ <color=red2>Téi ƒc Tµy Trêi<color>, ®· nhËn <color=yellow>th­ëng<color> ChiÕn Tr­êng tr­íc ®ã vµ ®· dïng <color=yellow>%d<color> vµng, cïng <color=yellow>phe víi ®éi tr­ëng<color>. Nh÷ng ng­êi sau kh«ng phï hîp ®iÒu kiÖn:\n",
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
		Talk(1,"",format("<color=green>%s<color>: ChiÕn tr­êng qu¸ tµn khèc, h·y vÒ rÌn luyÖn thªm, ®¹t <color=yellow>%s<color> h·y ®Õn t×m ta.", g_sNpcName, format("%d chuyÓn %d cÊp",floor(nNeedTransLv/100), mod(nNeedTransLv,100) ) ))
		return 0;
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: V« danh tiÓu tèt nh­ ng­¬i mµ còng muèn tham gia cuéc chiÕn Tèng-Liªu µ? Gia nhËp m«n ph¸i råi h·y tÝnh.");
		return 0;
	end

	local nJungong = abs(GetTask(701))
	if nJungong < nNeedJunGong then
		Talk(1,"",format("<color=green>%s<color>: Ng­¬i cÇn ®¹t ®ñ %d ®iÓm c«ng tr¹ng míi ®­îc tham dù.", g_sNpcName, nNeedJunGong))
		return 0
	end
	if GetPKValue() >= 4 then	--ºìÃû²»ÄÜ½øÕ½³¡
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Téi ¸c tµy trêi kh«ng thÓ tham gia chiÕn tr­êng!");
		return 0;
	end
	if GetTask(nActiveTask) > 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng­¬i ch­a nhËn phÇn th­ëng lÇn tr­íc.");
		return 0;
	end
	if GetCash() < nNeedCash then
		Talk(1,"",format("<color=green>%s<color>:".."C¸c h¹ mang theo kh«ng ®ñ %d vµng", g_sNpcName, ceil(nNeedCash/10000)))
		return 0;
	end
	return 1
end

function kf_battle_return_talk(nBattleType)
	local selTab = {
		format("Trë l¹i chiÕn tr­êng/#kf_newbattle_return_to_battle(%d)", nBattleType),
		"KÕt thóc ®èi tho¹i/nothing",
	}
	Say("<color=green>"..g_sNpcName..format("<color>: ChiÕn tr­êng phÝa tr­íc ®· khai háa, %s muèn tham gia kh«ng?", gf_GetPlayerSexName()),getn(selTab),selTab);
end

function main_kf_newbattle(nBattleType)
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nLastJoinDate, nLastJoinCamp = kf_get_last_join_info(nBattleType) 
	local nSignFlagTask = T_TSK_KF_SIGN_FLAG[nBattleType]

	if GetTime() - GetTask(nSignFlagTask) < 1800 then -- Õ½³¡¿ªÆôºó£¬ÒÑ¾­½øÈë¹ýÕ½³¡µÄÍæ¼Ò£¬30·ÖÖÓÄÚ¿ÉÒÔµ¥ÈË»Øµ½Õ½³¡
		kf_battle_return_talk(nBattleType)
		return 0;
	end

	local nCurState = mod(nGlobalState, 10)
	local nStateSign = T_KF_BATTLE_STATE[nBattleType].state_sign
	local nStateFighting = T_KF_BATTLE_STATE[nBattleType].state_fighting

	--Õ½³¡ÕýÊ½¿ªÆôÇ°£¬½øÈë¹ýÕ½³¡µÄÍæ¼Ò£¬¿ÉÒÔµ¥ÈË·µ»ØÕ½³¡
	if nCurState == nStateSign and nLastJoinDate == kf_battle_gettoday() then
		kf_battle_return_talk(nBattleType)
		return 0;
	end
	
	if nGlobalState == 0 or kf_battle_check_open(nBattleType) ~= 1 then
		Say("<color=green>"..g_sNpcName.."<color>: "..format("ChiÕn tr­êng ch­a më, h·y chó ý thêi gian b¸o danh."), 0);
		return 0;
	end
	
	local nDate = tonumber(date("%y%m%d"));
	local nSongPlayerCount = BT_GetPlayerCount(nBattleType, SONG_ID);
	local nLiaoPlayerCount = BT_GetPlayerCount(nBattleType, LIAO_ID);
		
	local selTab = {
			"Ta muèn tham gia"..tBattleName[nBattleType].."chiÕn tr­êng [Tèng "..nSongPlayerCount.." ng­êi]: [Liªu "..nLiaoPlayerCount.." ng­êi]/#join_battle("..nBattleType..")",
			"KÕt thóc ®èi tho¹i/nothing",
	}
	local szCost = format("<color=yellow>tiªu hao %d vµng<color>", ceil(T_KF_JOIN_CASH_COST[nBattleType]/10000))
	--Õ½¶·½×¶Î£¬¸¶·Ñ²¹±¨Ãû
	if nCurState == nStateFighting then
		szCost = format("ChiÕn tr­êng ®· më, b¸o danh bï cÇn <color=yellow>tèn %d vµng<color>", ceil(T_KF_JOIN_SUPPLEMENTARY_CASH_COST[nBattleType]/10000))
	end
	Say("<color=green>"..g_sNpcName..format("<color>: ChiÕn tr­êng phÝa tr­íc ®· khai háa, %s muèn tham gia kh«ng?"..szCost, gf_GetPlayerSexName()),getn(selTab),selTab);
end

function kf_newbattle_return_to_battle(nBattleType)
	if kf_battle_check_open(nBattleType) ~= 1 then
		Say("<color=green>"..g_sNpcName.."<color>: "..format("ChiÕn tr­êng ch­a më, h·y chó ý thêi gian b¸o danh."), 0)
		return 0
	end

	if GetTeamSize() > 0 then -- ·µ»ØÕ½³¡¾Í²»Òª×é¶ÓÁË
		Talk(1,"","<color=green>"..g_sNpcName.."<color>".."§¹i hiÖp h·y rêi khái tæ ®éi råi quay l¹i!");
		return
	end
	local _, nCamp = kf_get_last_join_info(nBattleType)
	local nCampPlayerCount = BT_GetPlayerCount(nBattleType,nCamp);

	if nCampPlayerCount >= T_KF_MAX_SIGNUP_PLAYER_DIFF[nBattleType] then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Sè ng­êi b¸o danh chiÕn tr­êng ®· ®¹t ®Õn giíi h¹n, lÇn sau h·y quay l¹i.");
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
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Binh lùc phe nµy ®· ®ñ, B»ng h÷u h·y quay l¹i sau nhÐ! Sè ng­êi ®«i bªn hiÖn lµ: <color=yellow>Tèng ["..nSongPlayerCount.."]:["..nLiaoPlayerCount.."] Liªu<color>.");
		Msg2Player("Sè ng­êi chªnh lÖch trªn"..nMaxPlayerCountDiff);
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
	--Õ½¶·½×¶Î£¬¸¶·Ñ²¹±¨Ãû
	if nCurState == nStateFighting then
		nPayCash = T_KF_JOIN_SUPPLEMENTARY_CASH_COST[nBattleType]
	end
	if pc_pay_addtask(nPayCash) ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>:"..format("Trong tói kh«ng ®ñ %d vµng", ceil(nPayCash/10000)))
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
	local nCurState = mod(nGlobalState, 10) --»ñÈ¡Õ½³¡µ±Ç°´¦ÓÚÄÄ¸ö½×¶Î
	local nStateSign = T_KF_BATTLE_STATE[nBattleType].state_sign
	local nStateFighting = T_KF_BATTLE_STATE[nBattleType].state_fighting

	-- if nCurState ~= 1 and nCurState ~= 3 then	--¸±Õ½³¡±¨ÃûÖÐ£»Î´±¨¹ýÃûµÄ
	-- 	Talk(1,"","<color=green>"..g_sNpcName.."<color>£ºÕ½³¡ÒÑ¿ªÆô£¬ÇëÏÂ´ÎÔÙÀ´¡£");
	-- 	return 0;
	-- end
	if kf_battle_check_open(nBattleType) ~= 1 then
		Say("<color=green>"..g_sNpcName.."<color>: "..format("ChiÕn tr­êng ch­a më"), 0);
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
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: ".."ChiÕn tr­êng kh«ng thÓ dung n¹p sè ng­êi trong ®éi ngò, xin h·y ®îi trËn tiÕp theo.");
		else
			Talk(1,"","<color=green>"..g_sNpcName.."<color>: Sè ng­êi b¸o danh chiÕn tr­êng ®· ®¹t ®Õn giíi h¹n, lÇn sau h·y quay l¹i.");
		end
		return 0;
	end

	if nTeamSize > 0 and kf_newbattle_teamcheck(nBattleType) ~= 1 then
		return 0
	elseif nTeamSize <= 0 and kf_newbattle_singlecheck(nBattleType) ~= 1 then
		return 0
	end

	-- local nCamp = SONG_ID
	-- if GetTask(704) < 0 then --¾üÏÎ ÁÉ
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
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Binh lùc phe nµy ®· ®ñ, B»ng h÷u h·y quay l¹i sau nhÐ! Sè ng­êi ®«i bªn hiÖn lµ: <color=yellow>Tèng ["..nSongPlayerCount.."]:["..nLiaoPlayerCount.."] Liªu<color>.");
		Msg2Player("Sè ng­êi chªnh lÖch trªn"..nMaxPlayerCountDiff);
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
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ch¼ng ph¶i ng­¬i cã quyÓn s¸ch sao?");
	end
end

function get_kf_battle_award(nBattleType)
	local nRezult = GetTask(T_TSK_KF_BATTLE_RESULT[nBattleType]);
	local nActivity = GetTask(T_TSK_KF_ACTIVITY_TO_SOURCE[nBattleType])
	local nRank = GetTask(T_TSK_KF_PERSONAL_RANK[nBattleType])

	if nActivity <= 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: §¹i hiÖp ch­a tõng tham chiÕn, hoÆc cã §é TÝch Cùc qu¸ thÊp. Sau khi tham chiÕn xong h·y ®Õn gÆp ta nhËn th­ëng!");
		return 0;
	end
	local tSay = {};
	local tTempString = {
		[0] = "BÊt ph©n th¾ng b¹i",	
		[1] = "§· giµnh chiÕn th¾ng",
		[2] = "§· thÊt b¹i",
	}
	if not tTempString[nRezult] then
		return 0;
	end
	local strTemp = format("TrËn chiÕn lÇn tr­íc ®¹i hiÖp <color=green>%s<color>, nhËn ®­îc <color=green>%d<color> §é TÝch Cùc.", tTempString[nRezult], nActivity);
	local nNeedActivity = T_TSK_KF_AWARD_NEED_PERSONAL_POINT[nBattleType]
	if nActivity < nNeedActivity then
		-- »îÔ¾¶È¹ýµÍ
		strTemp = format("%s <color=red>§iÓm n¨ng ®éng kh«ng ®ñ %d, kh«ng thÓ nhËn th­ëng.<color>", strTemp, nNeedActivity)
		SetTask(T_TSK_KF_BATTLE_RESULT[nBattleType], 0)
		SetTask(T_TSK_KF_ACTIVITY_TO_SOURCE[nBattleType], 0)
		SetTask(T_TSK_KF_PERSONAL_RANK[nBattleType], 0);
		BT_SetData(PT_POINT_AWARD_KF,0);
		BT_SetData(PTNC_BATTLEPOINT_KF,0);
		Talk(1,"",strTemp)
		return 0
	end
	if nRank > 0 and nRank <= T_TSK_KF_RANK_AWARD_NEED_RANK[nBattleType] then 
		strTemp = strTemp .. format("§¹i hiÖp ®¹t h¹ng <color=yellow>%d<color> §é TÝch Cùc, ®­îc nhËn th­ëng C«ng Tr¹ng vµ Kinh NghiÖm x<color=yellow>%.1f<color>!", nRank, T_KF_BATTLE_EXP_JUNGONG_AWARD_MUL[nBattleType])
	end
	tSay.sel = {};
	strTemp = strTemp.."Sö dông Qu©n C«ng Ch­¬ng, §¹i C«ng Ch­¬ng, Huy Hoµng Ch­¬ng ®Ó nhËn th­ëng sÏ nhËn ®­îc nhiÒu C«ng Tr¹ng h¬n."
	tinsert(tSay.sel, {"NhËn th­ëng trùc tiÕp", 		format("#get_kf_battle_award_deal(%d,%d)",nBattleType,1)})
	tinsert(tSay.sel, {"Qu©n c«ng ch­¬ng nhËn th­ëng", 	format("#get_kf_battle_award_deal(%d,%d)",nBattleType,2)})
	tinsert(tSay.sel, {"Qu©n c«ng ®¹i nhËn th­ëng", 	format("#get_kf_battle_award_deal(%d,%d)",nBattleType,3)})
	tinsert(tSay.sel, {"Qu©n c«ng huy hoµng nhËn th­ëng", format("#get_kf_battle_award_deal(%d,%d)",nBattleType,4)})
	tinsert(tSay.sel, {"Qu©n c«ng ch­¬ng Vinh Dù nhËn th­ëng", format("#get_kf_battle_award_deal(%d,%d)",nBattleType,5)})
	tinsert(tSay.sel, {"Ra khái", "nothing"})
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
		[2] = {2, 1, 9999, "Qu©n C«ng Ch­¬ng"},
		[3] = {2, 1, 9998, "Qu©n C«ng §¹i"},
		[4] = {2, 1, 9977, "Qu©n C«ng Huy Hoµng"},
		[5] = {2, 1, 30642, "qu©n c«ng ch­¬ng vinh dù "},
	}
	if tJGZ[nKind] then
		if DelItem(tJGZ[nKind][1], tJGZ[nKind][2], tJGZ[nKind][3], 1) ~= 1 then
			Talk(1,"",format("Hµnh trang kh«ng ®ñ <color=green>%s<color>", tJGZ[nKind][4]));
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

	--ÏÈÇåÀí±äÁ¿ ·ÀÖ¹¶à´ÎÁì½±
	SetTask(T_TSK_KF_BATTLE_RESULT[nBattleType], 0)
	SetTask(T_TSK_KF_ACTIVITY_TO_SOURCE[nBattleType], 0)
	SetTask(T_TSK_KF_PERSONAL_RANK[nBattleType], 0)
	-- BT_SetData(PT_POINT_AWARD_KF,0);
	-- BT_SetData(PTNC_BATTLEPOINT_KF,0);
	
	--¸ø½±Àø
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