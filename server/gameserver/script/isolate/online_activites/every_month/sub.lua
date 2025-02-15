Include("\\settings\\static_script\\lib\\normal_exchange.lua")

--子活动初始化函数,子活动和主活动物理上分开，以便子活动可以随时从主活动分离
function on_sub_init()
	--子活动任务变量定义
	if not t_isolate_task_list then
		t_isolate_task_list = {}
	end
	tinsert(t_isolate_task_list, { id={"task_sub_daily_task",  6}, clear="daily" , word_kill_cnt = 2, bit_acc = 1, bit_award = 2,} )
	tinsert(t_isolate_task_list, { id={"task_sub_weekly_task", 7}, clear="daily" , word_kill_cnt = 2, bit_acc = 1, bit_award = 2,} )
	
	on_sub_new_day(tonumber(date("%Y%m%d")))
end

function on_sub_add_watches()
	isolate_watch_npc_talk("V� Nng", 300, "sub_handle_on_npc_talk")--成都-舞娘对话
end

function on_sub_new_day(today) --每天更新杀怪监听
	t_sub_cfg.daily_map_idx = _rand_by_seed(today, getn(t_sub_cfg.daily_kill_info))
	isolate_unwatch_event("event_kill_npc", "sub_handle_on_daily_kill_npc")
	local t = t_sub_cfg.daily_kill_info[t_sub_cfg.daily_map_idx]
	isolate_watch_event(TeamEvent("event_kill_npc"), "sub_handle_on_daily_kill_npc", "", t[1])
	t_sub_cfg.task_info.daily.desc = format("дn b秐  <color=gold>%s<color> ti猽 di謙 %d con qu竔", t[2], t_sub_cfg.task_info.daily.kill_num)
	local w = tonumber(date("%w"))
	if w == 6 or w == 0 then --周末才能打boss
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
	task_info = {--任务描述
		--kill
		daily = {task = "task_sub_daily_task", kill_num = 333, award = {"daily_nor", "daily_adv"}, desc = "",  },
		weekly = {task = "task_sub_weekly_task", kill_num = 1, award = {"weekly"}, desc = "Ti猽 di謙 1 BOSS t飝 � <color=gold>Уo Hoa Фo Ch� Ho祅g Phong: Phong Linh Ch﹗, T﹜ V鵦 Thng Lang B� Vng: H醓 Linh Ch﹗, Ng鋍 S琻 Chi Linh Thi猲 C鰑: L玦 Linh Ch﹗, U Tr筩h Chi ?nh Minh V�: 謓 Linh Ch﹗<color>!"},
	},
	daily_kill_info = 
    {
    	{6000, "Thi猲 Long T�", 
    		{
                {"B筩h Linh T� T╪g Nh﹏"},
                {"Ho祅g T閏 Ph秐 Qu﹏"},
                {"Ho祅g T閏 Tng L躰h"},
                {"Trng Mao Tng"},
                {"Th莕 Уn Gi竜 Ch髇g"},
                {"Th莕 Уn Thu藅 S�"},
                {"Th莕 Уn Th鑞g L躰h"},
    		},
    	},
    	{6100, "Qu鷑h K誸", 
    		{
                {"B� t閏 ph秐 lo筺"},
                {"Thng g"},
                {"Nguy謙 Уn Gi竜 Ch髇g"},
                {"Mao ng璾 cao nguy猲"},
                {"D� nh﹏"},
                {"Nguy謙 Уn Thu藅 S�"},
    		},
    	},
    	{6200, "H璶g Kh竛h", 
        	{
                {"V� Th� Ph秐 Qu﹏"},
                {"Ch蕋 T� Ph秐 Qu﹏"},
                {"Tinh Уn Thu藅 S�"},
                {"Tinh Уn Gi竜 Ch髇g"},
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
--	{_tMaterials[3][1], _tMaterials[3][2][1],  _tMaterials[3][2][2],  _tMaterials[3][2][3], 2000}, --2000材料3
	{"Ti猽 Dao Ng鋍", 2, 1, 30603, 99, },
}
t_sub_award.daily_nor.tAward = {
	{"Ch﹏ kh�", -4, 0, 0, 3000},
	{"Exp", -3, 0, 0, 150000000},
	{"Kinh M筩h уng Nh﹏", 2, 1, 30730, 9, },
	{"V� T� Kinh Th�", 2, 1, 30785, 50, },
}
t_sub_award.daily_nor.tRoomWeight = {2, 100}
t_sub_award.daily_nor.szName = "Ph莕 thng thng"
t_sub_award.daily_nor.id=1
t_sub_award.daily_adv.tConsume = {
--	{_tMaterials[3][1], _tMaterials[3][2][1],  _tMaterials[3][2][2],  _tMaterials[3][2][3], 3000}, --3000材料3
	{"Ti猽 Dao Ng鋍", 2, 1, 30603, 199, },
}
t_sub_award.daily_adv.tAward = {
	{"Ch﹏ kh�", -4, 0, 0, 6000},
	{"Exp", -3, 0, 0, 250000000},
	{"V� T� Kinh Th�", 2, 1, 30785, 100, },
	{"Kinh M筩h Ng﹏ Nh﹏", 2, 1, 30731, 6, },
}
t_sub_award.daily_adv.tRoomWeight = {2, 100}
t_sub_award.daily_adv.szName = "Ph莕 thng cao c蕄"
t_sub_award.daily_adv.id=2
t_sub_award.weekly.tConsume = {
--	{_tMaterials[3][1], _tMaterials[3][2][1],  _tMaterials[3][2][2],  _tMaterials[3][2][3], 3000}, --3000材料3
	{"Ti猽 Dao Ng鋍", 2, 1, 30603, 239, },
}
t_sub_award.weekly.tAward = {
	{"Ch﹏ kh�", -4, 0, 0, 9000},
	{"Exp", -3, 0, 0, 300000000},
	{"V� T� Kinh Th�", 2, 1, 30785, 100, },
	{"Kinh M筩h Ng﹏ Nh﹏", 2, 1, 30731, 6, },
}
t_sub_award.weekly.tRoomWeight = {2, 100}
t_sub_award.weekly.szName = "Ph莕 thng thng"
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
	local szMsg = format("ti猽 di謙%s %d/%d",szNpcName, nNewNum, nNeedNum)
	if nNewNum >= nNeedNum then
		szMsg = format("%s(%s)", szMsg, "Ho祅 th祅h")
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
	local szMsg = format("ti猽 di謙%s %d/%d",szNpcName, nNewNum, nNeedNum)
	if nNewNum >= nNeedNum then
		szMsg = format("%s(%s),%s", szMsg, "Ho祅 th祅h", "H穣 t譵 Th祅h Й-V� Nng nh薾 thng")
	end
	Msg2Player(szMsg)
end

function sub_handle_on_npc_talk(nIndex)
	if isolate_in_date()~=1 then
		Talk(1, "", "Hi謓 t筰 kh玭g c� hi謚 l鵦")
		return 0
	end
	
--	local playerLv = GetLevel();
--	local playerGenre = GetPlayerGenre();
--	if playerLv < 90 or playerGenre == 0 then
--		local talkStr = format("<color=yellow>%s:<color>%s",GetNpcName(nIndex),"玩家需要角色等级达到90以上且已经加入流派才能参与")
--		Talk(1,"",talkStr)
--		return 0
--	end
	
    local tbSay = {}
    local szTitle = format("<color=yellow>%s:<color>%s", GetNpcName(nIndex), "Ta c� m閠 s� nhi謒 v�, m鏸 ng祔 ch� 頲 nh薾 thng 1 l莕")
    tinsert(tbSay, format("%s/#_task_talk(%d,%s)", "Nhi謒 v� ng祔", nIndex, gVal2String("daily")))
    local w = tonumber(date("%w"))
	if w == 6 or w == 0 then --周末才能打boss
		tinsert(tbSay, format("%s/#_task_talk(%d,%s)", "Nhi謒 v� cu鑙 tu莕", nIndex, gVal2String("weekly")))
	end
	tinsert(tbSay, format("%s/nothing", "K誸 th骳 i tho筰"))
    Say(szTitle, getn(tbSay), tbSay)
end

function _task_talk(nIndex, szTask, bConfirm, szAward)
	local t = t_sub_cfg.task_info[szTask]
	local bAward = get_task_bit(t.task, "bit_award")
	if bAward == 1 then
		Talk(1, "", "H玬 nay  nh薾 thng nhi謒 v� r錳")
		return
	end
	local bAcc = get_task_bit(t.task, "bit_acc")
	local tbSay = {}
	local szTitle = format("<color=yellow>%s:<color>", GetNpcName(nIndex))
	if bAcc == 0 then
		if bConfirm and bConfirm == 1 then
			set_task_bit(t.task, "bit_acc", 1)
			_refresh_kill_event_switch()
			szTitle = format("%s%s,%s",szTitle,"Х nh薾 nhi謒 v�",t.desc)
			Talk(1,"",szTitle)
		else
			szTitle = format("%s%s,%s",szTitle,t.desc, "уng � nh薾 nhi謒 v� kh玭g?")
			tinsert(tbSay, format("%s/#_task_talk(%d,%s,1)", "уng � nh薾", nIndex, gVal2String(szTask)))
			tinsert(tbSay, format("%s/nothing", "K誸 th骳 i tho筰"))
    		Say(szTitle, getn(tbSay), tbSay)
    		return
		end
		return
	end
	local nKillCnt = get_task_word(t.task, "word_kill_cnt")
	if nKillCnt < t.kill_num then
		local szProcess = format("Ti課  nhi謒 v� %d/%d",nKillCnt, t.kill_num)
		szTitle = format("%s%s%s,%s",szTitle,"Nhi謒 v� ch璦 ho祅 th祅h",t.desc, szProcess)
		tinsert(tbSay, format("%s/nothing", "K誸 th骳 i tho筰"))
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
					Talk(1,"","Nh薾 thng th祅h c玭g")
					return
				end
			else
				local r,msg = check_award_by_list(tAward.tAward, 0)
				local szDesc = format("\n%s[%s]\n%s[<color=yellow>%s<color>]\n%s[<color=yellow>%s<color>]<color=red>%s<color><color=yellow>\n%s<color>"
					, "Phng th鴆 nh薾 thng"	, t_sub_award[szAward].szName
					, "ph莕 thng nhi謒 v�"	, tAward:get_award_desc()
					, "C莕 ti猽 hao", tAward:get_consume_desc()
					, msg
					, "Sau khi nh薾 thng s� kh玭g th� nh薾 ph莕 thng kh竎, ng � nh薾 kh玭g?"
					)
				szTitle = format("%s%s,%s,%s",szTitle,"Х ho祅 th祅h nhi謒 v�",t.desc, szDesc)
				tinsert(tbSay, format("%s/#_task_talk(%d,%s,1,%s)", "X竎 nh薾", nIndex, gVal2String(szTask), gVal2String(szAward)))
				tinsert(tbSay, format("%s/#_task_talk(%d,%s)", "tr� l筰", nIndex, gVal2String(szTask)))
				tinsert(tbSay, format("%s/nothing", "K誸 th骳 i tho筰"))
				Say(szTitle, getn(tbSay), tbSay)
				return
			end
		else
			local tAward = t.award
			szTitle = format("%s%s,%s,%s",szTitle,"Х ho祅 th祅h nhi謒 v�",t.desc, "H穣 ch鋘 ph莕 thng mu鑞 nh薾")
			for i = 1,getn(tAward) do
				local award = tAward[i]
				tinsert(tbSay, format("%s/#_task_talk(%d,%s,nil,%s)", t_sub_award[award].szName, nIndex, gVal2String(szTask), gVal2String(award)))
			end
			tinsert(tbSay, format("%s/nothing", "K誸 th骳 i tho筰"))
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
