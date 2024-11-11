--2007Äê2ÔÂ28ÈÕĞŞ¸Ä
--ĞŞ¸ÄÄÚÈİ£ºÔö¼ÓÌ«ĞéÊ×ÊÎÈÎÎñÏà¹Ø¶Ô»°
--²ß»®ÈË£ºÉòÑó
--´úÂë±àĞ´ÈË£º´å³¤
--2013Äê4ÔÂ12ÈÕĞŞ¸Ä
Include("\\script\\online\\plant\\tree_head.lua");
Include("\\script\\Ì«Ğé»Ã¾³\\head.lua")
Include("\\script\\Ì«Ğé»Ã¾³\\award.lua")
--Ì«ĞéÈÎÎñÔö¼Ó
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\task\\lingshi_task.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua");
Include("\\script\\missions\\taixu_mission\\head.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Import("\\script\\lib\\missionfunctions.lua")

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

TAIXU_TIME = 1782;--½øÈëÌ«ĞéµÄÊ±¼ä
taixu_jwl_taskID = 998
--½áÊø

--°ËØÔ»»È¡ÊıÁ¿ ¶ÔÓ¦GetEquipBaGua()·µ»ØÖµ£¬×¢Òâ·µ»Ø5ÎªÌ«¼«
tBaguaNum = {--µÚ2£¬3£¬4ÎªÎïÆ·id£¬µÚ5Î»ÎªÁéÆøÖµ81-120ĞèÒªµÄÊıÁ¿  µÚÁùÎ»ÁéÆøÖµ61-80ĞèÒªµÄÊıÁ¿
	[1]={"Kh¶m",2,1,471,10,10},
	[2]={"Kh«n",2,1,470,10,10},
	[3]={"ChÊn",2,1,474,9,2},
	[4]={"Tèn",2,1,476,9,2},
	[6]={"Cµn",2,1,469,10,10},
	[7]={"§oµi",2,1,472,10,10},
	[8]={"CÊn",2,1,475,9,3},
	[9]={"Ly",2,1,473,9,3}
	}
tWood = {
	{0,0,0,0,0,0,0,5,5},	--100ÁéÆøÉñÄ¾°ËØÔ
	{0,0,5,5,0,0,0,0,0},	--100ÁéÆø×Ï½ğ°ËØÔ
	{0,0,0,0,0,0,0,0,0},	--80ÁéÆøÉñÄ¾°ËØÔ
	{0,0,0,0,0,0,0,0,0},	--80ÁéÆø×Ï½ğ°ËØÔ
}
function tx_level_chk()
	local nOldIndex = PlayerIndex
	local ret = 1
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local player_level = gf_GetTransLevel()
		if player_level < g_NeedLevel then
			ret = 0
			break
		end
	end
	PlayerIndex = nOldIndex
	return ret;
end
function TodayCanEnter()
	local nNow = tonumber(date("%Y%m%d"))
	local nLastTime = GetTask(TAIXU_TIME)
	local nDuration = nNow - nLastTime
	return nDuration
end

function chk_enter()
	local szSex = {"ThiÕu hiÖp", "N÷ hiÖp "}
	local szNoTeam ={"Th¸i H­ HuyÔn C¶nh nguy hiÓm trïng trïng,", " nªn tæ ®éi hay h¬n!"}
	local szNoGroupTeam = {"<color=green>ThÇn Du Ch©n Nh©n<color>: Kh«ng thÓ tæ ®éi vµo Th¸i H­ HuyÔn C¶nh."}
	local szNoGs = {"Th¸i H­ HuyÔn C¶nh nguy hiÓm trïng trïng,", "H·y tËp hîp c¸c thµnh viªn ®éi tr­íc."}
	local nSex = GetSex()
	local szLevel = format("<color=green>CÊp ®¹t Lv%d trë lªn<color>", g_NeedLevel);
	local szTimes = "<color=green>4 lÇn<color>"
	local szLeader = "<color=green>§éi tr­ëng<color>"
	local szTown = "<color=green>§éi viªn cïng mét thµnh thŞ<color>"
	local szExMsg = ""				-- ¶îÍâµÄĞÅÏ¢
	local nRetCode = 1
	local szCash = "<color=green> Mçi thµnh viªn cã ®ñ 39 vµng, <color>"
	local szEnergy = "";
	--	local szItemCount = "<color=green>1¸öÌ«Ğé¶àÃÛ»¨¹û<color>"
	if IsinTeam() == 0 then --ÊÇ·ñ×é¶Ó
		nRetCode = 0
		return nRetCode, szNoTeam[1]..szSex[nSex]..szNoTeam[2]
	end

	if 1 ~= gf_team_check_gs(GetTeamID()) then --¶ÓÔ±²»ÔÚÒ»¿é
		nRetCode = 0
		return nRetCode, szNoGs[1]..szSex[nSex]..szNoGs[2]
	end
	
	if gf_IsGroupTeam() == 1 then
		nRetCode = 0;
		return nRetCode, szNoGroupTeam[1];
	end
	
	if IsCaptain() == 0 then
		nRetCode = 0
		szLeader = "<color=red>§éi tr­ëng<color>"
	end

	local nSize = GetTeamSize()
	local nCount = 1
	local OldPlayer = PlayerIndex
	if tx_level_chk() ~= 1 then
		nRetCode = 0
		szLevel = format("<color=red> CÊp ®¹t Lv%d trë lªn, <color>", g_NeedLevel)
	end
	if CheckCashJoin() ~= 1 then
		nRetCode = 0
		szCash = "<color=red> Mçi thµnh viªn cÇn cã 39 vµng, <color>"
	end

	-- mod thªm tiªu hao tinh lùc
	if g_WCFG_THAIHU2.bEnableEnergyMode == WEnv.TRUE and g_WCFG_THAIHU2.nConsumeEnergy > 0 then
		szEnergy = format("<color=green> Mçi thµnh viªn cã ®ñ %d tinh lùc, <color>", g_WCFG_THAIHU2.nConsumeEnergy);
		if WTeam:CheckMemberHaveEnergy(g_WCFG_THAIHU2.nConsumeEnergy, WEnv.TRUE) == WEnv.FALSE then
			nRetCode = 0;
			szEnergy = format("<color=red> Mçi thµnh viªn cã ®ñ %d tinh lùc, <color>", g_WCFG_THAIHU2.nConsumeEnergy);
		end
	end

	--for i = 1, nSize do
	--	PlayerIndex = GetTeamMember(i)
	--	if TodayCanEnter() <= 0 then
	--		nRetCode = 0
	--		szTimes = "<color=red> 4 lÇn <color>"
	--		szExMsg = szExMsg..GetName()..", "
	--	end
	--end
	PlayerIndex = OldPlayer
	if szExMsg ~= "" then
		local nLen = strlen(szExMsg)
		szExMsg = strsub(szExMsg, 1, nLen - 2)
		szExMsg = szExMsg.."H«m nay ®· vµo 1 lÇn råi"
	end

	if AreaCheck() == 0 then --¶ÓÔ±²»ÔÙÍ¬Ò»¸ö³ÇÊĞ
		nRetCode = 0
		szTown = "<color=red>§éi viªn cïng mét thµnh thŞ<color>"
	end

	local nSleepCheckRet = 0
	local szSleepCheck = ""
	nSleepCheckRet, szSleepCheck = SleepCheck()
	if nSleepCheckRet == 0 then
		nRetCode = 0
	end

	if szExMsg ~= "" then --¶ÓÔ±½ñÈÕÊÇ·ñÒÑ¾­½øÈë¹ıÌáÊ¾
		gf_Msg2Team(szExMsg)
	end
	if szSleepCheck ~= "" then
		gf_Msg2Team(szSleepCheck)
--		return
	end

	if g_WCFG_THAIHU2.bEnableEnergyMode == WEnv.TRUE and g_WCFG_THAIHU2.nConsumeEnergy > 0 then
		-- mod thªm tiªu hao tinh lùc
		local szMsg = "Do "..szLeader.." dÉn ®Çu, "..szCash..szLevel..szTown..szEnergy..", 1 ngµy vµo "..szTimes.." Th¸i H­ HuyÔn C¶nh_. \n\n(<color=white>Mµu xanh t­îng tr­ng ®ñ ®iÒu kiÖn, mµu ®á kh«ng ®ñ nguyªn nh©n<color>)"
		return nRetCode, szMsg
	else
		-- mÆc ®Şnh
		local szMsg = "Do "..szLeader.." dÉn ®Çu, "..szCash..szLevel..szTown..", 1 ngµy vµo "..szTimes.." Th¸i H­ HuyÔn C¶nh. \n\n(<color=white>Mµu xanh t­îng tr­ng ®ñ ®iÒu kiÖn, mµu ®á kh«ng ®ñ nguyªn nh©n<color>)"
		return nRetCode, szMsg

	end
end
function entry(nType,npcIdx,nJump)
	nJump = nJump or 0;
	local strnotice="";
	local ncheck=0;
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if  GetTask(4085)>=4 then
			ncheck=ncheck+1;
			strnotice=strnotice..GetName().."--"
		end
	end
	PlayerIndex = nOldIndex;
	if ncheck>=4 then
		return Msg2Player("Nh©n vËt: "..strnotice.."®· v­ît ¶i qu¸ 4 lÇn. Kh«ng thÓ ®i tiÕp")
	end
	local nRetCode, szMsg = chk_enter();
	if nRetCode == nil and szMsg == nil then
		return
	end
	if nRetCode == 0 then
		Talk(1, "", szMsg)
		return
	end
	--- Ìø¹ØµÄ¶îÍâÅĞ¶Ï
	local tJumpTicket = {10,25};
	if nJump > 0 then
		local bRet = 0;
		local szNameList = "";
		
		local nPIdx = PlayerIndex;
		
		local nNow = tonumber(date("%y%m%d"))
		local MASK = 10000000
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			
			local nValue = GetTask(EAT_TIME_TODAY)
			local nDate = mod(nValue, MASK)
			local nChance = floor(nValue / MASK)
			if nNow == nDate and nChance >= 1 then
				szNameList = szNameList .. GetName() .. ",";
				bRet = 1;
			end
		end
		
		PlayerIndex = nPIdx;
		if bRet == 1 then
			local szErr = format("%s ®· dïng Th¸i H­ §a MËt Qu¶, kh«ng thÓ chän Nh¶y ?i, h·y khiªu chiÕn theo c¸ch th­êng.", strsub(szNameList, 1, -3))
			gf_Msg2Team(szErr);
			Talk(1, "", "<color=green>ThÇn Du Ch©n Nh©n<color>:" .. szErr);
			return
		end
		
		if GetItemCount(2,97,236) < tJumpTicket[nJump] then
			Talk(1, "", format("<color=green>ThÇn Du Ch©n Nh©n<color>: [Thiªn Kiªu LÖnh] trªn ng­êi kh«ng ®ñ %d.", tJumpTicket[nJump]))
			return
		end
	end
	
	
	local nPlace = random(1,4);

	local nId,nX,nY = GetNpcWorldPos(npcIdx);
	SendScript2VM("\\script\\missions\\taixu_mission\\mission.lua",format("create_enter_exit_pos(%d,%d)", nPlace,nId)); 
	local nMapID = tbTaiXu:Create();
	local szLog = format("[§éi Tr­ëng: %s][Nh¶y ?i: %d]", GetName(), nJump);
	local nOldPlayer = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		Pay(390000)
		-- mod tiªu hao tinh lùc
		if g_WCFG_THAIHU2.bEnableEnergyMode == WEnv.TRUE and g_WCFG_THAIHU2.nConsumeEnergy > 0 then
			ModifyEnergy(-g_WCFG_THAIHU2.nConsumeEnergy, 1);
		end
		SetTask(TAIXU_TIME,tonumber(date("%Y%m%d")));
		szLog = szLog .. format("[acc:%s role:%s lv:%d route:%s]", GetAccount(), GetName(), GetLevel(), gf_GetRouteName(GetPlayerRoute()));
	end
	PlayerIndex = nOldPlayer;
	if nJump > 0 then
		DelItem(2,97,236, tJumpTicket[nJump]);
	end
	WriteLog("[Th¸i H­ HuyÔn C¶nh] [Vµo Th¸i H­ HuyÔn C¶nh]" .. szLog);
	mf_SetMissionV(tbTaiXu.missionID,tbTaiXu.mv4,nPlace,nMapID)--ÇøÓò
	mf_SetMissionV(tbTaiXu.missionID,tbTaiXu.mv6,nJump,nMapID);--Ìø¹Ø
	if GetTeamSize() > 0 then
		if GetTeamMember(0) == PlayerIndex then
			-- ¼ÇÂ¼×é¶Ó½øÈëµÄÍæ¼ÒÊı + Teamsize
			AddRuntimeStat(70, 1, 0, GetTeamSize())
		end
	else
		-- µ¥¶À½øÈë + 1
		AddRuntimeStat(70, 1, 0, 1)
	end
	tbTaiXu:TeamEnter(nMapID,nType);

end

function main()
	if g_WCFG_THAIHU2:IsDateOpen(1) ~= WEnv.TRUE then
		return WEnv.RETCODE_NOTOPEN;
	end
	if  GetTask(WTASKID_DAYLY_THAIHU_DAILY_COUNT)>= g_WCFG_THAIHU2.nCountStageLimit then
		return Talk(1,"","Mçi ngµy chØ v­ît ¶i 4 lÇn")
	end

	local nNpcIdx = GetTargetNpc()
	local strtab = {
		"Th¸i H­ HuyÔn C¶nh lµ g×/Hewei",
		"DÉn ®éi v­ît Th¸i H­/try_entry",
		--"Mua 1 Th¸i H­ ThÇn Du §¬n: Sö dông x2 phÇn th­ëng v­ît ¶i (100 xu vËt phÈm)/buy_ThanDuDon", --LongDaiKa: bá ®i dßng nµy v× phÇn th­ëng ®­îc set mÆc ®Şnh råi
		-- "»ñÈ¡[Ì«ĞéÉñÓÎµ¤]/get_exp_drug",
		-- "»ñÈ¡[Ì«ĞéÂÓÓ°µ¤]/get_exp_drug",
		-- "Ì«Ğé»Ã¾³¹Ø¿¨¾º¼¼Ä£Ê½/athletics_mode",
		--"ÁìÈ¡Ì«Ğé°ãÈôÊ÷ÖÖ/WantSeed",
		--"ÓÃÌ«Ğé°ËØÔÅÆ»»È¡½±Àø/GetAwardPai",
		--"Sö dông Th¸i H­ B¸t Qu¸i bµi ®æi phÇn th­ëng/GetAwardPai",
		"Sö dông 20 xu ®Ó v­ît ¶i nhanh/notice_vuotainhanh",
		-- "ÓÃÌ«Ğé°ËØÔÅÆ»»È¡½±Àø/#show_equip_shop(22)",
		--"ÎÒÏëÌáÉıÌ«ĞéÊ×ÊÎ/taixu_jwl_up_inf",
--		"Ta muèn t¨ng cÊp Trang søc Th¸i H­/taixu_jwl_up_inf",
		--"Ta muèn kİch ho¹t lùc b¸t qu¸i cña trang bŞ/choose_lingqi",
		"KÕt thóc ®èi tho¹i/no"
		}
	-- if GetTask(TASK_LINGSHI_ID) == 3 or GetTask(TASK_LINGSHI_ID) == 9 or GetTask(TASK_LINGSHI_ID)==10 then
	-- 	tinsert(strtab, getn(strtab), "¼ÌĞøÁéÊ¯°ËØÔÑ§Ï°ÈÎÎñ/new_task2");
	-- end
	Say("BÇn ®¹o phông mÖnh Cöu Thiªn HuyÒn N÷ ®Õn nh©n gian ®é hãa mäi ng­êi ®Õn Th¸i H­ HuyÔn C¶nh. Thİ chñ xem ra ng­êi h÷u duyªn ®Õn ®©y cã chuyÖn g× kh«ng?",
		getn(strtab),
		strtab)
end

--===================================================================½áÊø==========================================================
TaiXu_TJL2TXSYD = 2  -- Ìì½¾Áî¶Ò»»Ì«ĞéÉñÓÎµ¤
TaiXu_XYZZ2TXSYD = 300  -- ÏÀÒåÖ®Ö¤¶Ò»»Ì«ĞéÉñÓÎµ¤
function notice_vuotainhanh()
	Say("<color=yellow>ChØ dÉn<color>: B¹n muèn v­ît ¶i nhanh Th¸i H­! ®ång ı kh«ng?",
			2,
			"§ång ı/#vuotainhanh_thaihu()",
			"Kh«ng ®ång ı/main"
	)
end
function vuotainhanh_thaihu()
	if GetTask(WTASKID_DAYLY_THAIHU_DAILY_COUNT)>=4 then
		return Talk(1,"","Mçi ngµy chØ v­ît ¶i 4 lÇn")
	end
	if GetFreeItemRoom() < 4 then
		Talk(1,"","Hµnh trang kh«ng ®ñ chç")
		return
	end
	if DelItem(2,1,30230,20) == 1 then
		WAward:ThaiHu2_HoanThanhTatCaAi();
	end
end

function get_exp_drug_tjl_cb(nExchange)
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Hµnh trang kh«ng ®ñ chç")
		return
	end
	if DelItem(2,97,236,TaiXu_TJL2TXSYD*nExchange) == 1 then
		gf_AddItemEx({2,1,31268,nExchange}, "Th¸i H­ ThÇn Du §¬n");
	end
end
function get_exp_drug_tjl()
	local MAX = 100
	local nItem = GetItemCount(2,97,236)
	local nCanExchange = floor(nItem / TaiXu_TJL2TXSYD)
	if nItem < TaiXu_TJL2TXSYD then
		Talk(1,"","§¹o cô mang theo trªn ng­êi kh«ng ®ñ")
		return
	end
	AskClientForNumber("get_exp_drug_tjl_cb", 1, min(MAX, nCanExchange), "CÇn ®æi bao nhiªu c¸i")
end

function get_exp_drug_xyzz_cb(nExchange)
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Hµnh trang kh«ng ®ñ chç")
		return
	end
	if DelItem(2,1,30912,TaiXu_XYZZ2TXSYD*nExchange) == 1 then
		gf_AddItemEx({2,1,31268,nExchange}, "Th¸i H­ ThÇn Du §¬n");
	end
end

function get_exp_drug_xyzz()
	local MAX = 100
	local nItem = GetItemCount(2,1,30912)
	local nCanExchange = floor(nItem / TaiXu_XYZZ2TXSYD)
	if nItem < TaiXu_XYZZ2TXSYD then
		Talk(1,"","§¹o cô mang theo trªn ng­êi kh«ng ®ñ")
		return
	end
	AskClientForNumber("get_exp_drug_xyzz_cb", 1, min(MAX, nCanExchange), "CÇn ®æi bao nhiªu c¸i")
end

function get_exp_drug()
	local nNpcIdx = GetTargetNpc()
	local strtab = {
		"§æi b»ng Thiªn Kiªu LÖnh/get_exp_drug_tjl",
		"§æi b»ng HiÖp NghÜa Chi Chøng/get_exp_drug_xyzz",
		"Hñy bá/main"
		}
	local szSay = format("<color=green>%s<color>: %s vèn lµ n¬i tiªn c¶nh, muèn ph¸t huy tèi ®a c«ng hiÖu n¬i nµy, ph¶i LuyÖn Khİ Hãa ThÇn, v­ît khái rµng buéc cña phµm thÓ. Tuy nãi th× dÔ, nh­ng muèn LuyÖn Khİ Hãa ThÇn v« cïng phøc t¹p, ng­êi th­êng khã mµ thùc hiÖn. May lµ ë chç ta cã mét lo¹i <color=yellow>%s<color>, cã thÓ gióp phµm thÓ <color=red>t¹m thêi<color> ®¹t ®Õn c¶nh giíi nµy. DÜ nhiªn, lo¹i ®¬n d­îc nµy v« cïng quı hiÕm, ta kh«ng lı nµo ®em tÆng miÔn phİ! NÕu thiÕu hiÖp cÇn, cã thÓ dïng <color=yellow>2 Thiªn Kiªu LÖnh<color> hoÆc <color=yellow>300 HiÖp NghÜa Chi Chøng<color> ®Ó ®æi.",
		GetTargetNpcName(),
		"Th¸i H­ HuyÔn C¶nh",
		"Th¸i H­ ThÇn Du §¬n"
	)
	Say(szSay,
		getn(strtab),
		strtab)
end

function choose_lingqi()
	local strtab = {
		"Ta muèn kİch ho¹t trang bŞ b¸t qu¸i cã ®iÓm linh khİ d­íi 60/mianfei_jihuo",
		"Ta muèn kİch ho¹t trang bŞ b¸t qu¸ ®iÓm linh khİ 61-79/#jihuo_bagua(2)",
		"Ta muèn kİch ho¹t trang bŞ b¸t qu¸ ®iÓm linh khİ 80-120/#jihuo_bagua(1)",
		"§îi chót, ®Ó ta xem ®iÓm linh khİ trang bŞ cña ng­¬i/nothing"
		}
	Say("Muèn kİch ho¹t b¸t qu¸i trªn trang bŞ, cÇn Th¸i H­ B¸t Qu¸i Bµi t­¬ng øng, nÕu ®­a ®ñ sè l­îng ta sÏ khİch ho¹t cho ng­¬i. H·y chän trŞ linh khİ muèn kİch ho¹t, trŞ linh khİ <color=yellow>d­íi 60<color>, ngoµi trang bŞ quÎ <color=yellow>ChÊn vµ Tèn<color>, ta cã thÓ kİch ho¹t <color=yellow>miÔn phİ<color> nh÷ng c¸i kh¸c cho ng­¬i. Kho¶ng trŞ linh khİ lín h¬n 60 kh¸c nhau sÏ cÇn sè l­îng Th¸i H­ B¸t Qu¸i kh¸c nhau.",
		getn(strtab),
		strtab)
end

function mianfei_jihuo()
	local strtab = {
		"§Çu/#mianfei_jihuo_weizhi(0)",
		"Y phôc/#mianfei_jihuo_weizhi(1)",
		"H¹ y/#mianfei_jihuo_weizhi(3)",
		"Vò khİ/#mianfei_jihuo_weizhi(2)",
		"§îi ta mÆc trang bŞ cÇn kİch ho¹t vµo./nothing"
		}
	Say("NÕu trŞ linh khİ cña trang bŞ tõ <color=yellow>60 trë xuèng<color>, kİch ho¹t <color=yellow>ChÊn vµ Tèn<color> qu¸i trang bŞ cÇn <color=yellow>1<color> Th¸i H­ B¸t Qu¸i bµi t­¬ng øng, cßn l¹i ta cã thÓ kİch ho¹t miÔn phİ cho ng­¬i. Chó ı, ta kh«ng r¶nh kiÓm tra hµnh trang cña ng­¬i, h·y ®em trang bŞ cÇn kİch ho¹t ®Õn gÆp ta. Ng­¬i muèn kİch ho¹t trang bŞ ë bé phËn nµo?",
		getn(strtab),
		strtab)
end

function mianfei_jihuo_weizhi(nWz)
	local nIndex = GetPlayerEquipIndex(nWz);
	if nIndex == 0 then
		Talk(1,"","Ng­¬i kh«ng mÆc nã trªn ng­êi!");
		return
	end
	if GetEquipBaGua(nIndex) == 0 then
		Talk(1,"","Trang bŞ ng­¬i ®ang mÆc kh«ng ph¶i trang bŞ b¸t qu¸i ch­a kİch ho¹t.");
		return
	end
	local nLingqi = GetItemMaxLingQi(nIndex);
	if GetEquipBaGuaJiHuo(nIndex) ~= 0 then
		Talk(1,"","Trang bŞ trªn ng­êi ng­¬i ®· kİch ho¹t råi.")
		return
	end
	if nLingqi > 60 then
		Talk(1,"","TrŞ linh khİ tõ <color=yellow>60 trë xuèng<color>, ta cã thÓ miÔn phİ kİch ho¹t n¨ng lùc trang bŞ b¸t qu¸i cho ng­¬i. Nh­ng trang bŞ b¸t qu¸i ng­¬i ®ang mÆc cÇn Th¸i H­ B¸t Qu¸i bµi ®Ó kİch ho¹t.");
		return
	elseif nLingqi == 0 then
		Talk(1,"","Trang bŞ ng­¬i ®ang mÆc kh«ng ph¶i trang bŞ b¸t qu¸i.")
		return
	end
	if GetEquipBaGua(nIndex) == 3 then
		if GetItemCount(tBaguaNum[3][2],tBaguaNum[3][3],tBaguaNum[3][4]) < 1 then
			Talk(1,"","Muèn kİch ho¹t ChÊn qu¸i trang bŞ, cÇn 1 ChÊn Bµn, ng­¬i kh«ng cã ChÊn Bµn.");
			return
		else
			Say("Ng­¬i quyÕt ®Şnh kİch ho¹t <color=yellow>ChÊn<color> qu¸i trang bŞ? Tèn 1 ChÊn Bµn.",
				2,
				"§óng, ta muèn kİch ho¹t/#jihuo_zhengua(3,"..nWz..")",
				"§Ó ta suy nghÜ l¹i/nothing")
			return
		end
	end
	if GetEquipBaGua(nIndex) == 4 then
		if GetItemCount(tBaguaNum[4][2],tBaguaNum[4][3],tBaguaNum[4][4]) < 1 then
			Talk(1,"","Muèn kİch ho¹t Tèn qu¸i trang bŞ, cÇn 1 Tèn Bµn, ng­¬i kh«ng cã Tèn Bµn.");
			return
		else
			Say("Ng­¬i quyÕt ®Şnh kİch ho¹t <color=yellow>Tèn<color> qu¸i trang bŞ? Tèn 1 Tèn Bµn.",
				2,
				"§óng, ta muèn kİch ho¹t/#jihuo_zhengua(4,"..nWz..")",
				"§Ó ta suy nghÜ l¹i/nothing")
			return
		end
	end
	if nLingqi > 0 and nLingqi <= 60 and GetEquipBaGuaJiHuo(nIndex) == 0 then
		local tZhuangBei = {"§Çu","Y phôc","Vò khİ","H¹ y"};
		SetEquipBaGuaJiHuo(nIndex,1);
		Msg2Player("Chóc mõng b¹n ®· kİch ho¹t."..tZhuangBei[nWz+1].."Trang bŞ thuéc tİnh b¸t qu¸i");
	end
end

function jihuo_zhengua(nType,nWz)
	local nIndex = GetPlayerEquipIndex(nWz);
	if DelItem(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4],1) == 1 then
		local tZhuangBei = {"§Çu","Y phôc","Vò khİ","H¹ y"};
		SetEquipBaGuaJiHuo(nIndex,1);
		Msg2Player("Chóc mõng b¹n ®· kİch ho¹t."..tZhuangBei[nWz+1].."Trang bŞ thuéc tİnh b¸t qu¸i");
	end
end

function jihuo_bagua(nType)
	local strtab = {};

	if nType == 2 then
		tinsert(strtab,"Ta muèn dïng "..tBaguaNum[3][6].."M¶nh Th¸i H­ B¸t Qu¸i bµi-ChÊn, ®Ó kİch ho¹t ChÊn qu¸i trang bŞ/#check_bagua(3,2)");
		tinsert(strtab,"Ta muèn dïng "..tBaguaNum[4][6].."M¶nh Th¸i H­ B¸t Qu¸i bµi-Tèn, ®Ó kİch ho¹t Tèn qu¸i trang bŞ/#check_bagua(4,2)");
		tinsert(strtab,"Ta muèn dïng "..tBaguaNum[1][5].."M¶nh Th¸i H­ B¸t Qu¸i bµi-Kh¶m, ®Ó kİch ho¹t Kh¶m qu¸i trang bŞ/#check_bagua(1,2)");
		tinsert(strtab,"Ta muèn dïng "..tBaguaNum[2][5].."M¶nh Th¸i H­ B¸t Qu¸i bµi-Kh«n, ®Ó kİch ho¹t Kh«n qu¸i trang bŞ/#check_bagua(2,2)");
	elseif nType == 1 then
		tinsert(strtab,"Ta muèn dïng "..tBaguaNum[3][5].."c¸i Th¸i H­ B¸t Qu¸i Bµi - TrËn + 5 c¸i Tö Kim B¸t Qu¸i ®Ó kİch ho¹t mét chiÕc trang bŞ TrËn Qu¸i/#check_bagua(3,1)");
		tinsert(strtab,"Ta muèn dïng "..tBaguaNum[4][5].."c¸i Th¸i H­ B¸t Qu¸i Bµi - Tèn + 5 c¸i Tö Kim B¸t Qu¸i ®Ó kİch ho¹t mét chiÕc trang bŞ Tèn Qu¸i/#check_bagua(4,1)");
		tinsert(strtab,"Ta muèn dïng "..tBaguaNum[1][5].."M¶nh Th¸i H­ B¸t Qu¸i bµi-Kh¶m, ®Ó kİch ho¹t Kh¶m qu¸i trang bŞ/#check_bagua(1,1)");
		tinsert(strtab,"Ta muèn dïng "..tBaguaNum[2][5].."M¶nh Th¸i H­ B¸t Qu¸i bµi-Kh«n, ®Ó kİch ho¹t Kh«n qu¸i trang bŞ/#check_bagua(2,1)");
	end
	tinsert(strtab,"Trang kÕ/#jihuo_bagua2("..nType..")");
	tinsert(strtab,"Ta kh«ng cã trang bŞ b¸t qu¸i ch­a kİch ho¹t./nothing");
	Say("Ng­¬i muèn kİch ho¹t trang bŞ thuéc tİnh b¸t qu¸i nµo? Chó ı, ta kh«ng r¶nh kiÓm tra hµnh trang cña ng­¬i, h·y ®em trang bŞ cÇn kİch ho¹t ®Õn gÆp ta.",
		getn(strtab),
		strtab);
end

function jihuo_bagua2(nType)
	if nType == 1 then
		local strtab = {
			"Ta muèn dïng "..tBaguaNum[6][5].."M¶nh Th¸i H­ B¸t Qu¸i bµi-Cµn, ®Ó kİch ho¹t Cµn qu¸i trang bŞ/#check_bagua(6,1)",
			"Ta muèn dïng "..tBaguaNum[7][5].."M¶nh Th¸i H­ B¸t Qu¸i bµi-§oµi, ®Ó kİch ho¹t §oµi qu¸i trang bŞ/#check_bagua(7,1)",
			"Ta muèn dïng "..tBaguaNum[8][5].."c¸i Th¸i H­ B¸t Qu¸i Bµi - CÊn + 5 c¸i ThÇn Méc B¸t Qu¸i ®Ó kİch ho¹t mét chiÕc trang bŞ CÊn Qu¸i/#check_bagua(8,1)",
			"Ta muèn dïng "..tBaguaNum[9][5].."c¸i Th¸i H­ B¸t Qu¸i Bµi - Ly + 5 c¸i ThÇn Méc B¸t Qu¸i ®Ó kİch ho¹t mét chiÕc trang bŞ Ly Qu¸i/#check_bagua(9,1)",
			"Trang tr­íc/#jihuo_bagua("..nType..")",
			"Ta kh«ng cã trang bŞ b¸t qu¸i ch­a kİch ho¹t./nothing"
			}
		Say("Ng­¬i muèn kİch ho¹t trang bŞ thuéc tİnh b¸t qu¸i nµo? Chó ı, ta kh«ng r¶nh kiÓm tra hµnh trang cña ng­¬i, h·y ®em trang bŞ cÇn kİch ho¹t ®Õn gÆp ta.",
			getn(strtab),
			strtab);
	elseif nType == 2 then
		local strtab = {
			"Ta muèn dïng "..tBaguaNum[6][6].."M¶nh Th¸i H­ B¸t Qu¸i bµi-Cµn, ®Ó kİch ho¹t Cµn qu¸i trang bŞ/#check_bagua(6,2)",
			"Ta muèn dïng "..tBaguaNum[7][6].."M¶nh Th¸i H­ B¸t Qu¸i bµi-§oµi, ®Ó kİch ho¹t §oµi qu¸i trang bŞ/#check_bagua(7,2)",
			"Ta muèn dïng "..tBaguaNum[8][6].."M¶nh Th¸i H­ B¸t Qu¸i bµi-CÊn, ®Ó kİch ho¹t CÊn qu¸i trang bŞ/#check_bagua(8,2)",
			"Ta muèn dïng "..tBaguaNum[9][6].."M¶nh Th¸i H­ B¸t Qu¸i bµi-Li, ®Ó kİch ho¹t Li qu¸i trang bŞ/#check_bagua(9,2)",
			"Trang tr­íc/#jihuo_bagua("..nType..")",
			"Ta kh«ng cã trang bŞ b¸t qu¸i ch­a kİch ho¹t./nothing"
			}
		Say("Ng­¬i muèn kİch ho¹t trang bŞ thuéc tİnh b¸t qu¸i nµo? Chó ı, ta kh«ng r¶nh kiÓm tra hµnh trang cña ng­¬i, h·y ®em trang bŞ cÇn kİch ho¹t ®Õn gÆp ta.",
			getn(strtab),
			strtab);
	end
end

function check_bagua(nType,nLqType)
	if nLqType == 1 then
		if GetItemCount(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4]) < tBaguaNum[nType][5] then
			Talk(1,"","thu thËp ®ñ Th¸i H­ B¸t Qu¸i bµi råi quay l¹i t×m ta, bÊy nhiªu ®ã sao cã thÓ kİch ho¹t.");
			return
		end
	elseif nLqType == 2 then
		if GetItemCount(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4]) < tBaguaNum[nType][6] then
			Talk(1,"","thu thËp ®ñ Th¸i H­ B¸t Qu¸i bµi råi quay l¹i t×m ta, bÊy nhiªu ®ã sao cã thÓ kİch ho¹t.");
			return
		end
	end
	local nCount1 = tWood[nLqType * 2 - 1][nType];
	if GetItemCount(2,95,550) < nCount1 then
		Talk(1, "", "<color=green>ThÇn Du Tr©n Nh©n<color>: cã ®ñ ThÇn Méc B¸t Qu¸i  råi ®Õn gÆp t«i, chØ cã mÊy c¸i nµy lµm sao kİch ho¹t ®­îc.");
		return
	end
	local nCount2 = tWood[nLqType * 2][nType];
	if GetItemCount(2,95,551) < nCount2 then
		Talk(1, "", "<color=green>ThÇn Du Tr©n Nh©n<color>: cã ®ñ Tö Kim B¸t Qu¸i  råi ®Õn gÆp t«i, chØ cã mÊy c¸i nµy lµm sao kİch ho¹t ®­îc.");
		return
	end
		local nMaoziIndex = GetPlayerEquipIndex(0);
		local nYifuIndex = GetPlayerEquipIndex(1);
		local nKuziIndex = GetPlayerEquipIndex(3);
		local nWuqiIndex = GetPlayerEquipIndex(2);
		local strtab = {} ;
		if GetEquipBaGua(nMaoziIndex) == nType and GetEquipBaGuaJiHuo(nMaoziIndex) == 0 then
			tinsert(strtab,"§Çu/#item_jihuo("..nMaoziIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nYifuIndex) == nType and GetEquipBaGuaJiHuo(nYifuIndex) == 0 then
			tinsert(strtab,"Y phôc/#item_jihuo("..nYifuIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nKuziIndex) == nType and GetEquipBaGuaJiHuo(nKuziIndex) == 0 then
			tinsert(strtab,"H¹ y/#item_jihuo("..nKuziIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nWuqiIndex) == nType and GetEquipBaGuaJiHuo(nWuqiIndex) == 0 then
			tinsert(strtab,"Vò khİ/#item_jihuo("..nWuqiIndex..","..nLqType..","..nType..")");
		end
		if getn(strtab) == 0 then
			Talk(1,"","Ng­¬i kh«ng cã trang bŞ ch­a kİch ho¹t t­¬ng øng víi thuéc tİnh b¸t qu¸i nµy.");
		else
			tinsert(strtab,"Th«i ta kh«ng kİch ho¹t n÷a./nothing");
			Say("Nµy, ng­¬i quyÕt ®Şnh kİch ho¹t thuéc tİnh b¸t qu¸i nµo?"..tBaguaNum[nType][1].."H·y chän trang bŞ cÇn kİch ho¹t trªn ng­êi ng­¬i.",getn(strtab),strtab)
		end
end

function item_jihuo(nIndex,nLqType,nType)
	local tZhuangBei = {"§Çu","Y phôc","Vò khİ","H¹ y"};
	local nLingqi = GetItemMaxLingQi(nIndex);
	if nLqType == 1 then
		if nLingqi < 80 or nLingqi > 120 then
			Talk(1,"","Sai råi, linh khİ trang bŞ cña ng­¬i kh«ng ph¶i tõ 80-120.");
			return
		end
	end
	if nLqType == 2 then
		if nLingqi <= 60 or nLingqi >= 80 then
			Talk(1,"","Sai råi, linh khİ trang bŞ cña ng­¬i kh«ng ph¶i tõ 60-80.");
			return
		end
	end

	local nCount1 = tWood[nLqType * 2 - 1][nType];
	if nCount1 > 0 and DelItem(2,95,550, nCount1) ~= 1 then
		Talk(1, "", "<color=green>ThÇn Du Tr©n Nh©n<color>: cã ®ñ ThÇn Méc B¸t Qu¸i  råi ®Õn gÆp t«i, chØ cã mÊy c¸i nµy lµm sao kİch ho¹t ®­îc.");
		return
	end
	local nCount2 = tWood[nLqType * 2][nType];
	if nCount2 > 0 and DelItem(2,95,551, nCount2) ~= 1 then
		Talk(1, "", "<color=green>ThÇn Du Tr©n Nh©n<color>: cã ®ñ Tö Kim B¸t Qu¸i  råi ®Õn gÆp t«i, chØ cã mÊy c¸i nµy lµm sao kİch ho¹t ®­îc.");
		return
	end

	if nLqType == 1 then
		if DelItem(tBaguaNum[GetEquipBaGua(nIndex)][2],tBaguaNum[GetEquipBaGua(nIndex)][3],tBaguaNum[GetEquipBaGua(nIndex)][4],tBaguaNum[GetEquipBaGua(nIndex)][5]) == 1 then
			for i=1,4 do
				if GetPlayerEquipIndex(i-1) == nIndex then
				  SetEquipBaGuaJiHuo(nIndex,1);
					Msg2Player("Chóc mõng b¹n ®· kİch ho¹t."..tZhuangBei[i].."Trang bŞ thuéc tİnh b¸t qu¸i");
					break;
				end
			end
		end
	elseif nLqType == 2 then
		if DelItem(tBaguaNum[GetEquipBaGua(nIndex)][2],tBaguaNum[GetEquipBaGua(nIndex)][3],tBaguaNum[GetEquipBaGua(nIndex)][4],tBaguaNum[GetEquipBaGua(nIndex)][6]) == 1 then
			for i=1,4 do
				if GetPlayerEquipIndex(i-1) == nIndex then
					SetEquipBaGuaJiHuo(nIndex,1);
					Msg2Player("Chóc mõng b¹n ®· kİch ho¹t."..tZhuangBei[i].."Trang bŞ thuéc tİnh b¸t qu¸i");
					break;
				end
			end
		end
	end
end

function new_task2()
	if GetTask(TASK_LINGSHI_ID) == 3 then
		Talk(1,"give_lingshi","CÇn dïng Th¸i H­ B¸t Qu¸i bµi ®Ó kİch ho¹t thuéc tİnh b¸t qu¸i trªn trang bŞ, ta cã thÓ dïng B¸t Qu¸i bµi t­¬ng øng ®Ó cã ®­îc søc m¹nh cña trang bŞ thuéc tİnh ®ã, sau ®ã ng­¬i cã thÓ thö kİch ho¹t trang bŞ b¸t qu¸i theo tæ hîp nhÊt ®Şnh ®Ó cã ®­îc tgran phôc b¸t qu¸i. Thø tù kh¶m n¹m h·y tham kh¶o trong \'B¸t Qu¸i B¶o §iÓn\' <color=yellow>Ta muèn t×m hiÓu c¸ch chÕ t¹o trang bŞ thuéc tİnh b¸t qu¸i t­¬ng øng<color>")
	elseif GetTask(TASK_LINGSHI_ID) == 9 then
		Say("Sao råi? Hîp thµnh trang bŞ ch­a kich ho¹t ch­a?<color=yellow>H·y mÆc chóng lªn ng­êi<color>, ta sÏ miÔn phİ kİch ho¹t cho ng­¬i. Chó ı, ta chØ kİch ho¹t 1 lÇn",
			4,
			"Ta ®· mÆc trªn ng­êi råi, kİch ho¹t ®i./jihuo_newtask",
			"§îi ta mÆc chóng vµo./nothing",
			"Ta ®· tõ bá miÔn phİ kİch ho¹t, ®­a ta ®Õn chç cña truyÒn nh©n C«ng D· ThÕ Gia./confirm_fangqi",
			"§­îc råi, ta ®· hiÓu!/confirm_cancel");
	elseif GetTask(TASK_LINGSHI_ID) == 10 then
		Say("§· kİch ho¹t xong trang bŞ b¸t qu¸i, cã thÓ t×m truyÒn nh©n cña C«ng D· thÕ gia hîp thµnh trang phôc b¸t qu¸i.",
			3,
			"Ta muèn ®Õn chç truyÒn nh©n cña C«ng D· ThÕ Gia hîp thµnh trang phôc b¸t qu¸i./#goto_gongye2(1)",
			"T¹m thêi ch­a muèn ®i!/#goto_gongye2(2)",
			"§­îc råi, ta ®· hiÓu!/confirm_cancel");
	end
end

function confirm_fangqi()
	Say("Ng­¬i quyÕt ®Şnh tõ bá kİch ho¹t?",
		2,
		"§óng, ta muèn ®Õn chç truyÒn nh©n cña C«ng D· thÕ gia./#goto_gongye2(1)",
		"Chän sai råi, trë l¹i/new_task2")
end

function give_lingshi()
		if Zgc_pub_goods_add_chk(16) ~= 1 then
			return
		end
		SetTask(TASK_LINGSHI_ID,9);
		AddLingShi(tLingqi[1][1],tLingqi[1][2],tLingqi[1][3],tLingqi[1][4]);
		AddLingShi(tLingqi[2][1],tLingqi[2][2],tLingqi[2][3],tLingqi[2][4]);
		AddLingShi(tLingqi[3][1],tLingqi[3][2],tLingqi[3][3],tLingqi[3][4]);
		AddLingShi(tLingqi[4][1],tLingqi[4][2],tLingqi[4][3],tLingqi[4][5]);
		AddLingShi(tLingqi[5][1],tLingqi[5][2],tLingqi[5][3],tLingqi[5][5]);
		AddLingShi(tLingqi[6][1],tLingqi[6][2],tLingqi[6][3],tLingqi[6][5]);
		AddLingShi(tLingqi[7][1],tLingqi[7][2],tLingqi[7][3],tLingqi[7][5]);
		AddLingShi(tLingqi[8][1],tLingqi[8][2],tLingqi[8][3],tLingqi[8][4]);
		AddLingShi(tLingqi[9][1],tLingqi[9][2],tLingqi[9][3],tLingqi[9][5]);
		AddLingShi(tLingqi[10][1],tLingqi[10][2],tLingqi[10][3],tLingqi[10][4]);
		AddLingShi(tLingqi[11][1],tLingqi[11][2],tLingqi[11][3],tLingqi[11][4]);
		AddLingShi(tLingqi[12][1],tLingqi[12][2],tLingqi[12][3],tLingqi[12][5]);
		local nTi = GetBody();
		local nRoute = GetPlayerRoute();
		local nToubuLq = tLingqi[1][4]+tLingqi[2][4]+tLingqi[3][4];
		local nYifuLq = tLingqi[4][5]+tLingqi[5][5]+tLingqi[6][5];
		local nKuziLq = tLingqi[7][5]+tLingqi[8][4]+tLingqi[9][5];
		local nWuqiLq = tLingqi[10][4]+tLingqi[10][4]+tLingqi[10][5];
		AddItem(tZhuangbeiOne[nTi][1],tZhuangbeiOne[nTi][2],tZhuangbeiOne[nTi][3],1,1,0,0,0,0,0,0,0,0,nToubuLq);
		AddItem(tZhuangbeiOne[nTi][4],tZhuangbeiOne[nTi][5],tZhuangbeiOne[nTi][6],1,1,0,0,0,0,0,0,0,0,nYifuLq);
		AddItem(tZhuangbeiOne[nTi][7],tZhuangbeiOne[nTi][8],tZhuangbeiOne[nTi][9],1,1,0,0,0,0,0,0,0,0,nKuziLq);
		if nRoute == 2 or nRoute == 3 or nRoute == 4 or nRoute == 6 or nRoute == 8 or nRoute == 9 or nRoute == 11 or nRoute == 12 or nRoute == 14 or nRoute == 15 or nRoute == 17 or nRoute == 18 or nRoute == 20 or nRoute == 21 then
			AddItem(tWeapon10[nRoute][1],tWeapon10[nRoute][2],tWeapon10[nRoute][3],1,1,0,0,0,0,0,0,0,0,nWuqiLq);
		else
			AddItem(0,0,3,1,1,0,0,0,0,0,0,0,0,nWuqiLq);
		end
		Msg2Player("NhËn ®­îc §Çu, Y Phôc, H¹ Y, Vò Khİ vµ 12 viªn Linh Th¹ch.");
		TaskTip("HÖ thèng nhiÖm vô Linh Th¹ch: Thö hîp thµnh trang bŞ ch­a kİch ho¹t, sau ®ã t×m ThÇn Du Ch©n Nh©n ®Ó miÔn phİ kİch ho¹t trang bŞ b¸t qu¸i.");
end

function jihuo_newtask()
	local nMaoziId1,nMaoziId2,nMaoziId3 = GetPlayerEquipInfo(0);
	local nYifuId1,nYifuId2,nYifuId3 = GetPlayerEquipInfo(1);
	local nKuziId1,nKuziId2,nKuziId3 = GetPlayerEquipInfo(3);
	local nWuqiId1,nWuqiId2,nWuqiId3 = GetPlayerEquipInfo(2);
	local nMaoziIndex = GetPlayerEquipIndex(0);
	local nYifuIndex = GetPlayerEquipIndex(1);
	local nKuziIndex = GetPlayerEquipIndex(3);
	local nWuqiIndex = GetPlayerEquipIndex(2);
	local nTi = GetBody();
	local nRoute = GetPlayerRoute();
	if nMaoziId1==tZhuangbeiOne[nTi][1] and nMaoziId2==tZhuangbeiOne[nTi][2] and nMaoziId3==tZhuangbeiOne[nTi][3] and GetEquipBaGuaJiHuo(nMaoziIndex) == 0 then
		SetEquipBaGuaJiHuo(nMaoziIndex,1);
	end
	if nYifuId1==tZhuangbeiOne[nTi][4] and nYifuId2==tZhuangbeiOne[nTi][5] and nYifuId3==tZhuangbeiOne[nTi][6] and GetEquipBaGuaJiHuo(nYifuIndex) == 0 then
		SetEquipBaGuaJiHuo(nYifuIndex,1);
	end
	if nKuziId1==tZhuangbeiOne[nTi][7] and nKuziId2==tZhuangbeiOne[nTi][8] and nKuziId3==tZhuangbeiOne[nTi][9] and GetEquipBaGuaJiHuo(nKuziIndex) == 0 then
		SetEquipBaGuaJiHuo(nKuziIndex,1);
	end
	if nRoute == 2 or nRoute == 3 or nRoute == 4 or nRoute == 6 or nRoute == 8 or nRoute == 9 or nRoute == 11 or nRoute == 12 or nRoute == 14 or nRoute == 15 or nRoute == 17 or nRoute == 18 or nRoute == 20 or nRoute == 21 then
		if nWuqiId1==tWeapon10[nRoute][1] and nWuqiId2==tWeapon10[nRoute][2] and nWuqiId3==tWeapon10[nRoute][3] and GetEquipBaGuaJiHuo(nWuqiIndex) == 0 then
			SetEquipBaGuaJiHuo(nWuqiIndex,1);
		end
	else
		if nWuqiId1==0 and nWuqiId2==0 and nWuqiId3==3 and GetEquipBaGuaJiHuo(nWuqiIndex) == 0 then
			SetEquipBaGuaJiHuo(nWuqiIndex,1);
		end
	end
	SetTask(TASK_LINGSHI_ID,10);
	TaskTip("HÖ thèng nhiÖm vô Linh Th¹ch: Ng­¬i ®· kİch ho¹t trang bŞ b¸t qu¸i, vÒ t×m ThÇn Du Ch©n Nh©n");
end

function goto_gongye2(nType)
	SetTask(TASK_LINGSHI_ID,4);
	if nType == 1 then
		local nRand = random(1,3);
		NewWorld(tGongyeNpc[nRand][1],tGongyeNpc[nRand][2],tGongyeNpc[nRand][3]);
	end
end

--º¯ÊıÃû³Æ£ºÎïÆ·Ìí¼Ó¼ì²éº¯Êı
--¹¦        ÄÜ£º¶Ôµ±Ç°Íæ¼Ò¿É·ñÕı³£Ìí¼ÓÎïÆ·½øĞĞ¼ì²â
--´å³¤
function Zgc_pub_goods_add_chk(goods_num)
		if GetFreeItemRoom() < goods_num then
			Talk(1,"","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
			return 0
		else
			return 1
		end
end

function nothing()
end

function end_say()
end

function Hewei()
	local nNpcIdx = GetTargetNpc()

	Say("Cöu Thiªn HuyÒn N÷ lÊy tam thu thanh lé vµ b¸ch hoa qu¶ mËt lµm ra nhiÒu lo¹i linh thó; ngoµi ra cßn lÊy m©y mï luyÖn ngò s¾c kú th¹ch ®Æt chóng t¹i mét thÕ giíi huyÒn ¶o cã tªn Th¸i H­. Phµm ai vµo ®­îc trong ®Òu to¹i nguyÖn.",
		3, 
		"Lµm sao vµo ®­îc Th¸i H­ HuyÔn C¶nh?/Ruhe", 
		-- "ÈçºÎÌø¹ØÌôÕ½/TiaoGuan",
		format("\n Xin ®¹i s­ ®­a chóng t«i vµo \n /try_entry"), 
		"Ta chØ hái th«i!/no")
end

function Ruhe()
	local nNpcIdx = GetTargetNpc();
	local szTitle = format("<color=green>ThÇn Du Ch©n Nh©n<color>: ChØ cÇn gäi vµi ba b»ng h÷u, hîp thµnh tæ ®éi, lµ cã thÓ vµo v­ît ¶i. Cã ®iÒu Th¸i H­ lµ n¬i tiªn c¶nh, ng­êi phµm ë l¹i qu¸ l©u sÏ bŞ hao tæn, lîi bÊt cËp h¹i. Do ®ã, mçi ng­êi mçi ngµy chØ ®­îc vµo Th¸i H­ HuyÔn C¶nh 1 lÇn, mçi lÇn tèi ®a 30 phót. Th¸i H­-Míi gåm %s tÇng, mçi tÇng ®Òu ph¶i ®¸nh b¹i c¸c Linh Thó vµ ThÇn Thó Gi÷ ? míi ®­îc vµo tÇng kÕ. Sau khi v­ît ®­îc mçi tÇng, sÏ ®­îc nhËn th­ëng kinh nghiÖm vµ rÌn luyÖn. Sè l­u ph¸i cã mÆt trong ®éi cµng nhiÒu, th­ëng kinh nghiÖm vµ rÌn luyÖn cµng nhiÒu. Ngoµi ra, mçi tÇng sÏ xuÊt hiÖn r­¬ng tïy theo sè l­u ph¸i cã mÆt trong ®éi, ®¸nh vì chóng sÏ nhËn ®­îc Th¸i H­ Bµn.",g_MaxLevel);
	Say(szTitle,
		3, 
		"Th¸i H­ HuyÔn C¶nh lµ sao?/Hewei", 
		-- "ÈçºÎÌø¹ØÌôÕ½£¿/TiaoGuan",
		format("\n Xin ®¹i s­ ®­a chóng t«i vµo \n /try_entry"), 
		"Ta chØ hái th«i!/no")
end

function TiaoGuan()
	local nNpcIdx = GetTargetNpc();
	Say("<color=green>ThÇn Du Ch©n Nh©n<color>: C¸c hiÖp sÜ cã thÓ dïng mét l­îng Thiªn Kiªu LÖnh nhÊt ®Şnh, chän ®é khã thİch hîp víi m×nh ®Ó khiªu chiÕn. Nh¶y ?i khiªu chiÕn chØ cã 20 phót , tïy theo h×nh thøc Nh¶y ?i kh¸c nhau, nhËn ®­îc phÇn th­ëng kh¸c nhau. HiÖn cã thÓ chän dïng 10 Thiªn Kiªu LÖnh ®Ó vµo, nhËn th­ëng x2, hoÆc chän dïng 25 Thiªn Kiªu LÖnh ®Ó vµo, nhËn th­ëng x4. Sau khi chän Nh¶y ?i ®Ó vµo, sÏ nhËn ®­îc 12 ®iÓm tİch cùc. Kinh nghiÖm nhËn ®­îc khi Nh¶y ?i khiªu chiÕn sÏ ®­îc céng thªm tõ cÊp ®é, l­u ph¸i vµ kü n¨ng Th©n TruyÒn, HiÖp L÷ cña nh©n vËt. Nh¶y ?i khiªu chiÕn ®­îc tİnh chung l­ît vµo víi khiªu chiÕn th­êng, mçi ngµy hiÖp sÜ chØ ®­îc chän 1 c¸ch ®Ó vµo khiªu chiÕn. L­ît khiªu chiÕn sÏ ®­îc xãa lóc 0 giê mçi ngµy.",
		4, 
		"Th¸i H­ HuyÔn C¶nh lµ g×/Hewei", 
		"Lµm sao vµo ®­îc Th¸i H­ HuyÔn C¶nh?/Ruhe", 
		format("\n Xin ®¹i s­ ®­a chóng t«i vµo \n /try_entry"), 
		"Ta chØ hái th«i!/no")
end

-- function athletics_mode()
-- 	local szScript = [[\script\missions\nephalem_rift\¿Õ¿ÕºÍÉĞ.lua]];
-- 	SetPlayerScript(szScript);
-- 	SendScript2VM(szScript, "main()");
-- end

function try_entry()
	local nNpcIdx = GetTargetNpc();
	local szMsg = "<color=green>ThÇn Du Ch©n Nh©n<color>: H·y chän c¸ch muèn vµo."
	local tSel = {
		"Khiªu chiÕn/#entry(1," ..nNpcIdx .. ", 0)",
		-- "´ÓµÚ41¹Ø¿ªÊ¼ÌôÕ½£¨»¨·Ñ10¸öÌì½¾Áî£¬ÌôÕ½Ê±¼äÎª20·ÖÖÓ£¬»ñµÃ½±ÀøÎªÕı³£ÌôÕ½µÄÁ½±¶£©/#entry(1," ..nNpcIdx .. ", 1)",
		-- "´ÓµÚ61¹Ø¿ªÊ¼ÌôÕ½£¨»¨·Ñ25¸öÌì½¾Áî£¬ÌôÕ½Ê±¼äÎª20·ÖÖÓ£¬»ñµÃ½±ÀøÎªÕı³£ÌôÕ½µÄËÄ±¶£©/#entry(1," ..nNpcIdx .. ", 2)",
		"trë l¹i/main",
		"Ta chØ hái th«i!/no",
	};
	Say(szMsg, getn(tSel), tSel);
end
function CheckCashJoin()
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetCash() < 390000 then
--			gf_Msg2Team("Tæ ®éi cña b¹n cã thµnh viªn "..GetName().." kh«ng cã 29 vµng",2)
			return 0	
		end
	end
	PlayerIndex = nOldIndex
	return 1
end
function buy_ThanDuDon()
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,1,30230) < 100 then
		Talk(1,"","<color=yellow>ThÇn Du Ch©n Nh©n: <color> B¹n kh«ng cã ®ñ 100 xu vËt phÈm!")
		return 0
	end
	if DelItem(2,1,30230,100) == 1 then
		gf_AddItemEx2({2, 1, 31268, 1},"ThanDuDon", "ThÇn du ®¬n","thÇn du ®¬n")
	end
	
end
