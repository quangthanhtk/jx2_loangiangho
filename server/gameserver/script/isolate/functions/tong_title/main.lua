Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")

Include("\\script\\isolate\\functions\\tong_title\\head.lua")
Include("\\script\\isolate\\functions\\tong_title\\tong_title.lua")

Include("\\script\\isolate\\functions\\tong_title\\item\\item_taofaling.lua")
Include("\\script\\isolate\\functions\\tong_title\\item\\item_gxd_lingpai.lua")

t_isolate_base_cfg = { --����һ������������
    nPriority 		= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 		= "tong_title",
    szViewName 		= "Danh hi�u bang h�i",
    nTalkBeginDate 	= 0,
    nBeginDate 		= 0,
    nEndDate 		= 0,
}


--t_isolate_batch_import_gdata = {
--	--"gIsVipCardActive"
--}

function handle_on_leave_tong(data, para)
	change_tong_title(0, 1)
end

function handle_on_kill_npc(data, para)
	if check_drop_xyzz() ~= 1 then
		isolate_disable_player_event_watch("event_kill_npc", "handle_on_kill_npc") --ɱ���˲����ٵ�������
		return 0 
	end
	local nCur = get_tong_title_lv()
	local tPara = tTongTitlePara[nCur]
	if tPara then
		local nRate = tPara[5]
		local nRand = random(1, DROP_RATE_MAX_RAND)
		if nRand <= nRate then
			AddItem(2,1,30912,1)--��������֤֮
			add_drop_xyzz(1)
		end
	end
end

function on_event_server_start()
	local npc = CreateNpc("T� Th�c", "Qu�n gia Bang h�i", 200, 1410, 2807)
	SetNpcScript(npc, "\\script\\isolate\\functions\\tong_title\\npc_main.lua")
end

function on_event_player_login(nExchangeComing)
	if check_drop_xyzz() == 1 then--�����Ե��� �ʹ�ɱ�ֿ���
		isolate_enable_player_event_watch("event_kill_npc", "handle_on_kill_npc")
	end
end

--function on_event_player_logout(bExchangeServer)
--	
--end

function on_event_daily_clear(nCurDate, nLastDate)
	reset_daily_task()
	daily_consume()
end

--function on_event_weekly_clear(nCurWeek, nLastWeek)
--	
--end

function on_add_watches()
	isolate_watch_event("event_kill_npc", "handle_on_kill_npc", "", 6000)--������
	isolate_watch_event("event_kill_npc", "handle_on_kill_npc", "", 6100)--���
	isolate_watch_event("event_kill_npc", "handle_on_kill_npc", "", 6200)--����
	isolate_watch_event("event_kill_npc", "handle_on_kill_npc", "", 6300)--ʧ����
	isolate_watch_event("event_player_tong_operation", "handle_on_leave_tong", "leave")--������
	isolate_watch_event("event_player_tong_operation", "handle_on_leave_tong", "kick")
	isolate_watch_item_talk(2,1,30915, "handle_use_item_taofaling")
	isolate_watch_item_talk(2,1,30914, "handle_use_item_gxd_linpai")
end
