Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")

Include("\\script\\isolate\\functions\\missions\\yp\\shiluoya_boss\\head.lua")
Include("\\script\\isolate\\functions\\missions\\yp\\shiluoya_boss\\handle.lua")
Include("\\script\\isolate\\functions\\missions\\yp\\shiluoya_boss\\npc_death.lua")

t_isolate_base_cfg = { --����һ������������
    nPriority 		= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 		= "shiluoya_boss",
    szViewName 		= "��i chi�n Th�t L�c nhai BOSS",
    nTalkBeginDate 	= 0,
    nBeginDate 		= 0,
    nEndDate 		= 0,
}

function on_add_watches()
	isolate_watch_event("event_kill_npc", "handle_on_kill_npc", "", 6300)--��ʧ����ɱ��
	isolate_watch_event("event_server_tick_hour", "handle_on_server_tick_hour", 3)--3Сʱ����һ��ϵͳ����
	
	isolate_watch_event("event_player_enter_map", "handle_on_enter_map", 6300)--����ʧ����
	isolate_watch_event("event_player_leave_map", "handle_on_leave_map", 6300)--�뿪ʧ����
	
	isolate_watch_npc_talk("C�t Kh�m X�ch Ba", 425, "handle_on_npc_talk")--��ެ
	isolate_watch_npc_talk("L� K� Tinh", 425, "handle_on_npc_talk")--����
	isolate_watch_npc_talk("�o�n H�a Huy�n", 425, "handle_on_npc_talk")--������
	
	isolate_watch_item_talk(2,1,30925, "handle_on_item_talk")--��������
	
	isolate_watch_event("event_server_time", "handle_on_server_time", 19, 0, "open")
	isolate_watch_event("event_server_time", "handle_on_server_time", 19, 10, "npc1")
	isolate_watch_event("event_server_time", "handle_on_server_time", 19, 20, "npc2")
	isolate_watch_event("event_server_time", "handle_on_server_time", 19, 30, "boss")
	isolate_watch_event("event_server_time", "handle_on_server_time", 20, 0, "rank")
	isolate_watch_event("event_server_time", "handle_on_server_time", 22, 55, "before_close")
	isolate_watch_event("event_server_time", "handle_on_server_time", 23, 0, "close")
end

function on_event_daily_clear(nCurDate, nLastDate)
	SetTask(tCfg.TASK_ID_PERSONAL_SCORE, 0)
end
