Include("\\settings\\static_script\\lib\\normal_exchange.lua")

--�ӻ��ʼ������,�ӻ����������Ϸֿ����Ա��ӻ������ʱ���������
function on_sub_init()
	--�ӻ�����������
	if not t_isolate_task_list then
		t_isolate_task_list = {}
	end
	tinsert(t_isolate_task_list, { id={"task_sub_daily_task",  6}, clear="daily" , word_kill_cnt = 2, bit_acc = 1, bit_award = 2,} )
	tinsert(t_isolate_task_list, { id={"task_sub_weekly_task", 7}, clear="daily" , word_kill_cnt = 2, bit_acc = 1, bit_award = 2,} )
	
	on_sub_new_day(tonumber(date("%Y%m%d")))
end

function on_sub_add_watches()
	isolate_watch_npc_talk("V� N��ng", 300, "sub_handle_on_npc_talk")--�ɶ�-����Ի�
end

function on_sub_new_day(today) --ÿ�����ɱ�ּ���
	t_sub_cfg.daily_map_idx = _rand_by_seed(today, getn(t_sub_cfg.daily_kill_info))
	isolate_unwatch_event("event_kill_npc", "sub_handle_on_daily_kill_npc")
	local t = t_sub_cfg.daily_kill_info[t_sub_cfg.daily_map_idx]
	isolate_watch_event(TeamEvent("event_kill_npc"), "sub_handle_on_daily_kill_npc", "", t[1])
	t_sub_cfg.task_info.daily.desc = format("��n b�n �� <color=gold>%s<color> ti�u di�t %d con qu�i", t[2], t_sub_cfg.task_info.daily.kill_num)
	local w = tonumber(date("%w"))
	if w == 6 or w == 0 then --��ĩ���ܴ�boss
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
	task_info = {--��������
		--kill
		daily = {task = "task_sub_daily_task", kill_num = 333, award = {"daily_nor", "daily_adv"}, desc = "",  },
		weekly = {task = "task_sub_weekly_task", kill_num = 1, award = {"weekly"}, desc = "Ti�u di�t 1 BOSS t�y � <color=gold>��o Hoa ��o Ch� Ho�ng Phong: Phong Linh Ch�u, T�y V�c Th��ng Lang B� V��ng: H�a Linh Ch�u, Ng�c S�n Chi Linh Thi�n C�u: L�i Linh Ch�u, U Tr�ch Chi ?nh Minh V�: �i�n Linh Ch�u<color>!"},
	},
	daily_kill_info = 
    {
    	{6000, "Thi�n Long T�", 
    		{
                {"B�ch Linh T� T�ng Nh�n"},
                {"Ho�ng T�c Ph�n Qu�n"},
                {"Ho�ng T�c T��ng L�nh"},
                {"Tr��ng Mao T��ng"},
                {"Th�n ��n Gi�o Ch�ng"},
                {"Th�n ��n Thu�t S�"},
                {"Th�n ��n Th�ng L�nh"},
    		},
    	},
    	{6100, "Qu�nh K�t", 
    		{
                {"B� t�c ph�n lo�n"},
                {"Th��ng �ng"},
                {"Nguy�t ��n Gi�o Ch�ng"},
                {"Mao ng�u cao nguy�n"},
                {"D� nh�n"},
                {"Nguy�t ��n Thu�t S�"},
    		},
    	},
    	{6200, "H�ng Kh�nh", 
        	{
                {"V� Th� Ph�n Qu�n"},
                {"Ch�t T� Ph�n Qu�n"},
                {"Tinh ��n Thu�t S�"},
                {"Tinh ��n Gi�o Ch�ng"},
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
--	{_tMaterials[3][1], _tMaterials[3][2][1],  _tMaterials[3][2][2],  _tMaterials[3][2][3], 2000}, --2000����3
	{"Ti�u Dao Ng�c", 2, 1, 30603, 99, },
}
t_sub_award.daily_nor.tAward = {
	{"Ch�n kh�", -4, 0, 0, 3000},
	{"Exp", -3, 0, 0, 150000000},
	{"Kinh M�ch ��ng Nh�n", 2, 1, 30730, 9, },
	{"V� T� Kinh Th�", 2, 1, 30785, 50, },
}
t_sub_award.daily_nor.tRoomWeight = {2, 100}
t_sub_award.daily_nor.szName = "Ph�n th��ng th��ng"
t_sub_award.daily_nor.id=1
t_sub_award.daily_adv.tConsume = {
--	{_tMaterials[3][1], _tMaterials[3][2][1],  _tMaterials[3][2][2],  _tMaterials[3][2][3], 3000}, --3000����3
	{"Ti�u Dao Ng�c", 2, 1, 30603, 199, },
}
t_sub_award.daily_adv.tAward = {
	{"Ch�n kh�", -4, 0, 0, 6000},
	{"Exp", -3, 0, 0, 250000000},
	{"V� T� Kinh Th�", 2, 1, 30785, 100, },
	{"Kinh M�ch Ng�n Nh�n", 2, 1, 30731, 6, },
}
t_sub_award.daily_adv.tRoomWeight = {2, 100}
t_sub_award.daily_adv.szName = "Ph�n th��ng cao c�p"
t_sub_award.daily_adv.id=2
t_sub_award.weekly.tConsume = {
--	{_tMaterials[3][1], _tMaterials[3][2][1],  _tMaterials[3][2][2],  _tMaterials[3][2][3], 3000}, --3000����3
	{"Ti�u Dao Ng�c", 2, 1, 30603, 239, },
}
t_sub_award.weekly.tAward = {
	{"Ch�n kh�", -4, 0, 0, 9000},
	{"Exp", -3, 0, 0, 300000000},
	{"V� T� Kinh Th�", 2, 1, 30785, 100, },
	{"Kinh M�ch Ng�n Nh�n", 2, 1, 30731, 6, },
}
t_sub_award.weekly.tRoomWeight = {2, 100}
t_sub_award.weekly.szName = "Ph�n th��ng th��ng"
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
	local szMsg = format("ti�u di�t%s %d/%d",szNpcName, nNewNum, nNeedNum)
	if nNewNum >= nNeedNum then
		szMsg = format("%s(%s)", szMsg, "Ho�n th�nh")
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
	local szMsg = format("ti�u di�t%s %d/%d",szNpcName, nNewNum, nNeedNum)
	if nNewNum >= nNeedNum then
		szMsg = format("%s(%s),%s", szMsg, "Ho�n th�nh", "H�y t�m Th�nh ��-V� N��ng nh�n th��ng")
	end
	Msg2Player(szMsg)
end

function sub_handle_on_npc_talk(nIndex)
	if isolate_in_date()~=1 then
		Talk(1, "", "Hi�n t�i kh�ng c� hi�u l�c")
		return 0
	end
	
--	local playerLv = GetLevel();
--	local playerGenre = GetPlayerGenre();
--	if playerLv < 90 or playerGenre == 0 then
--		local talkStr = format("<color=yellow>%s:<color>%s",GetNpcName(nIndex),"�����Ҫ��ɫ�ȼ��ﵽ90�������Ѿ��������ɲ��ܲ���")
--		Talk(1,"",talkStr)
--		return 0
--	end
	
    local tbSay = {}
    local szTitle = format("<color=yellow>%s:<color>%s", GetNpcName(nIndex), "Ta c� m�t s� nhi�m v�, m�i ng�y ch� ���c nh�n th��ng 1 l�n")
    tinsert(tbSay, format("%s/#_task_talk(%d,%s)", "Nhi�m v� ng�y", nIndex, gVal2String("daily")))
    local w = tonumber(date("%w"))
	if w == 6 or w == 0 then --��ĩ���ܴ�boss
		tinsert(tbSay, format("%s/#_task_talk(%d,%s)", "Nhi�m v� cu�i tu�n", nIndex, gVal2String("weekly")))
	end
	tinsert(tbSay, format("%s/nothing", "K�t th�c ��i tho�i"))
    Say(szTitle, getn(tbSay), tbSay)
end

function _task_talk(nIndex, szTask, bConfirm, szAward)
	local t = t_sub_cfg.task_info[szTask]
	local bAward = get_task_bit(t.task, "bit_award")
	if bAward == 1 then
		Talk(1, "", "H�m nay �� nh�n th��ng nhi�m v� r�i")
		return
	end
	local bAcc = get_task_bit(t.task, "bit_acc")
	local tbSay = {}
	local szTitle = format("<color=yellow>%s:<color>", GetNpcName(nIndex))
	if bAcc == 0 then
		if bConfirm and bConfirm == 1 then
			set_task_bit(t.task, "bit_acc", 1)
			_refresh_kill_event_switch()
			szTitle = format("%s%s,%s",szTitle,"�� nh�n nhi�m v�",t.desc)
			Talk(1,"",szTitle)
		else
			szTitle = format("%s%s,%s",szTitle,t.desc, "��ng � nh�n nhi�m v� kh�ng?")
			tinsert(tbSay, format("%s/#_task_talk(%d,%s,1)", "��ng � nh�n", nIndex, gVal2String(szTask)))
			tinsert(tbSay, format("%s/nothing", "K�t th�c ��i tho�i"))
    		Say(szTitle, getn(tbSay), tbSay)
    		return
		end
		return
	end
	local nKillCnt = get_task_word(t.task, "word_kill_cnt")
	if nKillCnt < t.kill_num then
		local szProcess = format("Ti�n �� nhi�m v� %d/%d",nKillCnt, t.kill_num)
		szTitle = format("%s%s%s,%s",szTitle,"Nhi�m v� ch�a ho�n th�nh",t.desc, szProcess)
		tinsert(tbSay, format("%s/nothing", "K�t th�c ��i tho�i"))
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
					Talk(1,"","Nh�n th��ng th�nh c�ng")
					return
				end
			else
				local r,msg = check_award_by_list(tAward.tAward, 0)
				local szDesc = format("\n%s[%s]\n%s[<color=yellow>%s<color>]\n%s[<color=yellow>%s<color>]<color=red>%s<color><color=yellow>\n%s<color>"
					, "Ph��ng th�c nh�n th��ng"	, t_sub_award[szAward].szName
					, "ph�n th��ng nhi�m v�"	, tAward:get_award_desc()
					, "C�n ti�u hao", tAward:get_consume_desc()
					, msg
					, "Sau khi nh�n th��ng s� kh�ng th� nh�n ph�n th��ng kh�c, ��ng � nh�n kh�ng?"
					)
				szTitle = format("%s%s,%s,%s",szTitle,"�� ho�n th�nh nhi�m v�",t.desc, szDesc)
				tinsert(tbSay, format("%s/#_task_talk(%d,%s,1,%s)", "X�c nh�n", nIndex, gVal2String(szTask), gVal2String(szAward)))
				tinsert(tbSay, format("%s/#_task_talk(%d,%s)", "tr� l�i", nIndex, gVal2String(szTask)))
				tinsert(tbSay, format("%s/nothing", "K�t th�c ��i tho�i"))
				Say(szTitle, getn(tbSay), tbSay)
				return
			end
		else
			local tAward = t.award
			szTitle = format("%s%s,%s,%s",szTitle,"�� ho�n th�nh nhi�m v�",t.desc, "H�y ch�n ph�n th��ng mu�n nh�n")
			for i = 1,getn(tAward) do
				local award = tAward[i]
				tinsert(tbSay, format("%s/#_task_talk(%d,%s,nil,%s)", t_sub_award[award].szName, nIndex, gVal2String(szTask), gVal2String(award)))
			end
			tinsert(tbSay, format("%s/nothing", "K�t th�c ��i tho�i"))
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
