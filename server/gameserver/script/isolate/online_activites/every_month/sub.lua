Include("\\settings\\static_script\\lib\\normal_exchange.lua")

--×Ó»î¶¯³õÊ¼»¯º¯Êı,×Ó»î¶¯ºÍÖ÷»î¶¯ÎïÀíÉÏ·Ö¿ª£¬ÒÔ±ã×Ó»î¶¯¿ÉÒÔËæÊ±´ÓÖ÷»î¶¯·ÖÀë
function on_sub_init()
	--×Ó»î¶¯ÈÎÎñ±äÁ¿¶¨Òå
	if not t_isolate_task_list then
		t_isolate_task_list = {}
	end
	tinsert(t_isolate_task_list, { id={"task_sub_daily_task",  6}, clear="daily" , word_kill_cnt = 2, bit_acc = 1, bit_award = 2,} )
	tinsert(t_isolate_task_list, { id={"task_sub_weekly_task", 7}, clear="daily" , word_kill_cnt = 2, bit_acc = 1, bit_award = 2,} )
	
	on_sub_new_day(tonumber(date("%Y%m%d")))
end

function on_sub_add_watches()
	isolate_watch_npc_talk("Vò N­¬ng", 300, "sub_handle_on_npc_talk")--³É¶¼-ÎèÄï¶Ô»°
end

function on_sub_new_day(today) --Ã¿Ìì¸üĞÂÉ±¹Ö¼àÌı
	t_sub_cfg.daily_map_idx = _rand_by_seed(today, getn(t_sub_cfg.daily_kill_info))
	isolate_unwatch_event("event_kill_npc", "sub_handle_on_daily_kill_npc")
	local t = t_sub_cfg.daily_kill_info[t_sub_cfg.daily_map_idx]
	isolate_watch_event(TeamEvent("event_kill_npc"), "sub_handle_on_daily_kill_npc", "", t[1])
	t_sub_cfg.task_info.daily.desc = format("§Õn b¶n ®å <color=gold>%s<color> tiªu diÖt %d con qu¸i", t[2], t_sub_cfg.task_info.daily.kill_num)
	local w = tonumber(date("%w"))
	if w == 6 or w == 0 then --ÖÜÄ©²ÅÄÜ´òboss
		isolate_watch_event(TeamEvent("event_mission_affairs"), "sub_handle_on_weekly_kill_npc", "worldboss", "killboss", -1)
	else
		isolate_unwatch_event("event_mission_affairs", "sub_handle_on_weekly_kill_npc")
	end
end

function sub_on_event_player_login(nExchangeComing)
	_refresh_kill_event_switch()
end

---------------------------------------------------
t_sub_cfg = {
	daily_map_idx = 0,
	task_info = {--ÈÎÎñÃèÊö
		--kill
		daily = {task = "task_sub_daily_task", kill_num = 333, award = {"daily_nor", "daily_adv"}, desc = "",  },
		weekly = {task = "task_sub_weekly_task", kill_num = 1, award = {"weekly"}, desc = "Tiªu diÖt 1 BOSS tïy ı <color=gold>§µo Hoa §¶o Chñ Hoµng Phong: Phong Linh Ch©u, T©y Vùc Th­¬ng Lang B¸ V­¬ng: Háa Linh Ch©u, Ngäc S¬n Chi Linh Thiªn Cöu: L«i Linh Ch©u, U Tr¹ch Chi ?nh Minh Vâ: §iÖn Linh Ch©u<color>!"},
	},
	daily_kill_info = 
    {
    	{6000, "Thiªn Long Tù", 
    		{
                {"B¹ch Linh Tù T¨ng Nh©n"},
                {"Hoµng Téc Ph¶n Qu©n"},
                {"Hoµng Téc T­íng LÜnh"},
                {"Tr­êng Mao T­îng"},
                {"ThÇn §µn Gi¸o Chóng"},
                {"ThÇn §µn ThuËt SÜ"},
                {"ThÇn §µn Thèng LÜnh"},
    		},
    	},
    	{6100, "Quúnh KÕt", 
    		{
                {"Bé téc ph¶n lo¹n"},
                {"Th­¬ng ¦ng"},
                {"NguyÖt §µn Gi¸o Chóng"},
                {"Mao ng­u cao nguyªn"},
                {"D· nh©n"},
                {"NguyÖt §µn ThuËt SÜ"},
    		},
    	},
    	{6200, "H­ng Kh¸nh", 
        	{
                {"VÖ Thó Ph¶n Qu©n"},
                {"ChÊt Tö Ph¶n Qu©n"},
                {"Tinh §µn ThuËt SÜ"},
                {"Tinh §µn Gi¸o Chóng"},
        	},
    	},
    },
}

---------------------------------------------------
t_sub_award =	{
	daily_nor = gtNormalExchange:new(), --daily award normal
	daily_adv = gtNormalExchange:new(), --daily award advance
	weekly = gtNormalExchange:new(), --weekly award
}
_tMaterials = tConfig.tMaterials
_Products = tConfig.tProducts
t_sub_award.daily_nor.tConsume = {
--	{_tMaterials[3][1], _tMaterials[3][2][1],  _tMaterials[3][2][2],  _tMaterials[3][2][3], 2000}, --2000²ÄÁÏ3
	{"Tiªu Dao Ngäc", 2, 1, 30603, 99, },
}
t_sub_award.daily_nor.tAward = {
	{"Ch©n khİ", -4, 0, 0, 3000},
	{"Exp", -3, 0, 0, 150000000},
	{"Kinh M¹ch §ång Nh©n", 2, 1, 30730, 9, },
	{"V« Tù Kinh Th­", 2, 1, 30785, 50, },
}
t_sub_award.daily_nor.tRoomWeight = {2, 100}
t_sub_award.daily_nor.szName = "PhÇn th­ëng th­êng"
t_sub_award.daily_nor.id=1
t_sub_award.daily_adv.tConsume = {
--	{_tMaterials[3][1], _tMaterials[3][2][1],  _tMaterials[3][2][2],  _tMaterials[3][2][3], 3000}, --3000²ÄÁÏ3
	{"Tiªu Dao Ngäc", 2, 1, 30603, 199, },
}
t_sub_award.daily_adv.tAward = {
	{"Ch©n khİ", -4, 0, 0, 6000},
	{"Exp", -3, 0, 0, 250000000},
	{"V« Tù Kinh Th­", 2, 1, 30785, 100, },
	{"Kinh M¹ch Ng©n Nh©n", 2, 1, 30731, 6, },
}
t_sub_award.daily_adv.tRoomWeight = {2, 100}
t_sub_award.daily_adv.szName = "PhÇn th­ëng cao cÊp"
t_sub_award.daily_adv.id=2
t_sub_award.weekly.tConsume = {
--	{_tMaterials[3][1], _tMaterials[3][2][1],  _tMaterials[3][2][2],  _tMaterials[3][2][3], 3000}, --3000²ÄÁÏ3
	{"Tiªu Dao Ngäc", 2, 1, 30603, 239, },
}
t_sub_award.weekly.tAward = {
	{"Ch©n khİ", -4, 0, 0, 9000},
	{"Exp", -3, 0, 0, 300000000},
	{"V« Tù Kinh Th­", 2, 1, 30785, 100, },
	{"Kinh M¹ch Ng©n Nh©n", 2, 1, 30731, 6, },
}
t_sub_award.weekly.tRoomWeight = {2, 100}
t_sub_award.weekly.szName = "PhÇn th­ëng th­êng"
t_sub_award.weekly.id=3
_tMaterials = nil
_Products = nil

function sub_handle_on_daily_kill_npc(data, para)
	if get_task_bit("task_sub_daily_task", "bit_acc") == 0 then return end
	local nOldNum = get_task_word("task_sub_daily_task", "word_kill_cnt")
	local nNeedNum = t_sub_cfg.task_info.daily.kill_num
	if nOldNum >= nNeedNum then return end
	local nNewNum = nOldNum + 1
	set_task_word("task_sub_daily_task", "word_kill_cnt", nNewNum)
	_refresh_kill_event_switch()
	local szNpcName = GetNpcName(data[3])
	local szMsg = format("tiªu diÖt%s %d/%d",szNpcName, nNewNum, nNeedNum)
	if nNewNum >= nNeedNum then
		szMsg = format("%s(%s)", szMsg, "Hoµn thµnh")
	end
	Msg2Player(szMsg)
end
function sub_handle_on_weekly_kill_npc(data, para)
	if get_task_bit("task_sub_weekly_task", "bit_acc") == 0 then return end
	local nOldNum = get_task_word("task_sub_weekly_task", "word_kill_cnt")
	local nNeedNum = t_sub_cfg.task_info.weekly.kill_num
	if nOldNum >= nNeedNum then return end
	local nNewNum = nOldNum + 1
	set_task_word("task_sub_weekly_task", "word_kill_cnt", nNewNum)
	_refresh_kill_event_switch()
	local szNpcName = GetNpcName(data[3])
	local szMsg = format("tiªu diÖt%s %d/%d",szNpcName, nNewNum, nNeedNum)
	if nNewNum >= nNeedNum then
		szMsg = format("%s(%s),%s", szMsg, "Hoµn thµnh", "H·y t×m Thµnh §«-Vò N­¬ng nhËn th­ëng")
	end
	Msg2Player(szMsg)
end

function sub_handle_on_npc_talk(nIndex)
	if isolate_in_date()~=1 then
		Talk(1, "", "HiÖn t¹i kh«ng cã hiÖu lùc")
		return 0
	end
	
--	local playerLv = GetLevel();
--	local playerGenre = GetPlayerGenre();
--	if playerLv < 90 or playerGenre == 0 then
--		local talkStr = format("<color=yellow>%s:<color>%s",GetNpcName(nIndex),"Íæ¼ÒĞèÒª½ÇÉ«µÈ¼¶´ïµ½90ÒÔÉÏÇÒÒÑ¾­¼ÓÈëÁ÷ÅÉ²ÅÄÜ²ÎÓë")
--		Talk(1,"",talkStr)
--		return 0
--	end
	
    local tbSay = {}
    local szTitle = format("<color=yellow>%s:<color>%s", GetNpcName(nIndex), "Ta cã mét sè nhiÖm vô, mçi ngµy chØ ®­îc nhËn th­ëng 1 lÇn")
    tinsert(tbSay, format("%s/#_task_talk(%d,%s)", "NhiÖm vô ngµy", nIndex, gVal2String("daily")))
    local w = tonumber(date("%w"))
	if w == 6 or w == 0 then --ÖÜÄ©²ÅÄÜ´òboss
		tinsert(tbSay, format("%s/#_task_talk(%d,%s)", "NhiÖm vô cuèi tuÇn", nIndex, gVal2String("weekly")))
	end
	tinsert(tbSay, format("%s/nothing", "KÕt thóc ®èi tho¹i"))
    Say(szTitle, getn(tbSay), tbSay)
end

function _task_talk(nIndex, szTask, bConfirm, szAward)
	local t = t_sub_cfg.task_info[szTask]
	local bAward = get_task_bit(t.task, "bit_award")
	if bAward == 1 then
		Talk(1, "", "H«m nay ®· nhËn th­ëng nhiÖm vô råi")
		return
	end
	local bAcc = get_task_bit(t.task, "bit_acc")
	local tbSay = {}
	local szTitle = format("<color=yellow>%s:<color>", GetNpcName(nIndex))
	if bAcc == 0 then
		if bConfirm and bConfirm == 1 then
			set_task_bit(t.task, "bit_acc", 1)
			_refresh_kill_event_switch()
			szTitle = format("%s%s,%s",szTitle,"§· nhËn nhiÖm vô",t.desc)
			Talk(1,"",szTitle)
		else
			szTitle = format("%s%s,%s",szTitle,t.desc, "§ång ı nhËn nhiÖm vô kh«ng?")
			tinsert(tbSay, format("%s/#_task_talk(%d,%s,1)", "§ång ı nhËn", nIndex, gVal2String(szTask)))
			tinsert(tbSay, format("%s/nothing", "KÕt thóc ®èi tho¹i"))
    		Say(szTitle, getn(tbSay), tbSay)
    		return
		end
		return
	end
	local nKillCnt = get_task_word(t.task, "word_kill_cnt")
	if nKillCnt < t.kill_num then
		local szProcess = format("TiÕn ®é nhiÖm vô %d/%d",nKillCnt, t.kill_num)
		szTitle = format("%s%s%s,%s",szTitle,"NhiÖm vô ch­a hoµn thµnh",t.desc, szProcess)
		tinsert(tbSay, format("%s/nothing", "KÕt thóc ®èi tho¹i"))
    	Say(szTitle, getn(tbSay), tbSay)
    	return
	end
	local bAward = get_task_bit(t.task, "bit_award")
	if bAward == 0 then
		if szAward then
			local tAward = t_sub_award[szAward]
			if bConfirm and bConfirm == 1 then
				if 1 == tAward:do_exchange(1,1) then
					set_task_bit("task_sub_daily_task", "bit_award", 1)
					set_task_bit("task_sub_weekly_task", "bit_award", 1)
					AddRuntimeStat(33, 5, tAward.id, 1)
					Talk(1,"","NhËn th­ëng thµnh c«ng")
					return
				end
			else
				local r,msg = check_award_by_list(tAward.tAward, 0)
				local szDesc = format("\n%s[%s]\n%s[<color=yellow>%s<color>]\n%s[<color=yellow>%s<color>]<color=red>%s<color><color=yellow>\n%s<color>"
					, "Ph­¬ng thøc nhËn th­ëng"	, t_sub_award[szAward].szName
					, "phÇn th­ëng nhiÖm vô"	, tAward:get_award_desc()
					, "CÇn tiªu hao", tAward:get_consume_desc()
					, msg
					, "Sau khi nhËn th­ëng sÏ kh«ng thÓ nhËn phÇn th­ëng kh¸c, ®ång ı nhËn kh«ng?"
					)
				szTitle = format("%s%s,%s,%s",szTitle,"§· hoµn thµnh nhiÖm vô",t.desc, szDesc)
				tinsert(tbSay, format("%s/#_task_talk(%d,%s,1,%s)", "X¸c nhËn", nIndex, gVal2String(szTask), gVal2String(szAward)))
				tinsert(tbSay, format("%s/#_task_talk(%d,%s)", "trë l¹i", nIndex, gVal2String(szTask)))
				tinsert(tbSay, format("%s/nothing", "KÕt thóc ®èi tho¹i"))
				Say(szTitle, getn(tbSay), tbSay)
				return
			end
		else
			local tAward = t.award
			szTitle = format("%s%s,%s,%s",szTitle,"§· hoµn thµnh nhiÖm vô",t.desc, "H·y chän phÇn th­ëng muèn nhËn")
			for i = 1,getn(tAward) do
				local award = tAward[i]
				tinsert(tbSay, format("%s/#_task_talk(%d,%s,nil,%s)", t_sub_award[award].szName, nIndex, gVal2String(szTask), gVal2String(award)))
			end
			tinsert(tbSay, format("%s/nothing", "KÕt thóc ®èi tho¹i"))
    		Say(szTitle, getn(tbSay), tbSay)
    		return
		end
	end
end

---------------------------------------------------
function _refresh_kill_event_switch()
	if get_task_bit("task_sub_daily_task", "bit_acc") == 1 and get_task_word("task_sub_daily_task", "word_kill_cnt") < t_sub_cfg.task_info.daily.kill_num then
		isolate_enable_player_event_watch("event_kill_npc", "sub_handle_on_daily_kill_npc")
	else
		isolate_disable_player_event_watch("event_kill_npc", "sub_handle_on_daily_kill_npc")
	end
	if get_task_bit("task_sub_weekly_task", "bit_acc") == 1 and get_task_word("task_sub_weekly_task", "word_kill_cnt") < t_sub_cfg.task_info.weekly.kill_num then
		isolate_enable_player_event_watch("event_mission_affairs", "sub_handle_on_weekly_kill_npc")
	else
		isolate_disable_player_event_watch("event_mission_affairs", "sub_handle_on_weekly_kill_npc")
	end
end

function _rand_by_seed(seed, max)
	local r = seed*4789+761
	return mod(r,max)+1
end
