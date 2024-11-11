--base��Ҫ�����һЩ�¼������isolateʵ��

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Import("\\script\\task_access_code_def.lua")
Include("\\settings\\static_script\\global\\bit_task_support.lua")
t_isolate_base_cfg = { --����һ������������
    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "baseHandler",
    szViewName 			= "",
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}

--����Ĵ���֪ͨisolate center���غ�ж��ģ��
function handle_event_new_day(data, para)
	local nNewDate = unpack(data)
	local szScriptFile = "\\settings\\static_script\\isolate\\base\\script_data_center.lua"
	local szCode = format("isolate_center_handle_on_new_day(%d)", nNewDate)
	SendScript2VM(szScriptFile, szCode)
end

--ÿ��5��showһ��Eventϵͳ��ͳ����Ϣ
function handle_event_5h(data, para)
	--ShowGdata()
	ShowEvent()
	ShowIsolate()
end

function on_event_player_login()
	--�����־λ�������ƿ��0���¼���isolate�Ľ�ɫ�����Զ�����
	--���µ�¼���Ͱ������־��0
	bt_SetBitTask(N_BIT_TASK_INDEX_PLAYER_NEW_DAY_CLEAR, 0)
end

function on_event_player_logout()
	if PlayerIndex and PlayerIndex > 0 then
		EnableIsolateEventDispatch("", PlayerIndex) --ȥ�������������йص�event dispatch������
		EnablePlayerEventWatchDispatch("", "", "", 0) --ȥ������ҵ�����Watch-Level player_event_dispatch������
	end
end

--ÿ�������������ڼ�¼event_player_daily_online_minute�����������ֵ
function on_event_daily_clear(nCurDate, nLastDate)
	local TASK_ID_DAILY_ONLINE_MINUTE = 3379
	SetTask(TASK_ID_DAILY_ONLINE_MINUTE, 0, TASK_ACCESS_CODE_EVENT_CENTER)
end

function on_add_watches()
	isolate_watch_event("event_server_new_day", "handle_event_new_day", -1)
	isolate_watch_event("event_server_time", "handle_event_5h", 5, 0)
end
