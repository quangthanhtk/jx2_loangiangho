--����ģ�黯��һ����׼���ļ�����ģ��ֻ��Ҫʵ�ֶ�Ӧ�ı�׼�¼�������������Ҫ������Щ����ʲôʱ�򱻵���
--ģ���ģ��֮�䲻����Include�͵��ù�ϵ
--����ÿ��ģ���Ƕ�����
--����Ҫ��handler��ע�͵�������ջص�Ӱ��Ч��

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")

N_START_DATE = 20160328
N_END_DATE = 20160430
TASK_HARD_JOIN_TIME = {3386,40,2}--task_id,access_code,limit_time

t_isolate_base_cfg = { --����һ������������
    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "",
    szViewName 			= "",
    nTalkBeginDate		= 0,
    nBeginDate 			= N_START_DATE,
    nEndDate 			= N_END_DATE,
}

function is_hard_mission_in_date()
	local _today = tonumber(date("%Y%m%d"))
	if _today >= N_START_DATE and _today <= N_END_DATE then
		return 1
	end
	return 0
end
function check_hard_join_time()
	if GetTask(TASK_HARD_JOIN_TIME[1]) < TASK_HARD_JOIN_TIME[3] then
		return 1
	end
	return 0
end
function add_hard_join_time()
	local nValue = GetTask(TASK_HARD_JOIN_TIME[1]) + 1
	SetTask(TASK_HARD_JOIN_TIME[1], nValue, TASK_HARD_JOIN_TIME[2])
end

--����ΪӦ��ģ��Ŀ�ѡ���ã�ֻҪ��������Щ�����ͺ�����ϵͳ�ͻ��Զ�ע��ͻص�
--t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskId, nAcessCode = 0},
--    {id={"id_hard_limit", 3386, 40}, clear="daily" }, 
--}
--t_isolate_user_batch_watch_list = { {szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), ...}, }
--t_isolate_batch_export_gdata = { name = data, }
--t_isolate_batch_import_gdata = { name1, name2, }
--function on_init() end
--function on_init_ok() end
--function on_uninit() end
--function on_export_gdata() end
--function on_import_gdata() end
--function on_add_watches() end
--function on_new_day(nToday) end

--function on_event_server_start() end
--function on_event_player_login(nExchangeComing) end
--function on_event_player_logout() end
function on_event_daily_clear(nCurDate, nLastDate)
	SetTask(TASK_HARD_JOIN_TIME[1], 0, TASK_HARD_JOIN_TIME[2])
end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end



