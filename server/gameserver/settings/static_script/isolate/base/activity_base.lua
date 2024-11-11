--============================================= 
--author: daizejun 
--date	: 2015.09
--desc	: ���ǻϵͳ��չ������isolate CRTʵ�֣����л��ģ��Include���ļ���ok��
--related files: 
--=============================================

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Include("\\script\\misc\\taskmanager.lua")

--t_isolate_base_cfg = { --����һ������������
--    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
--    szEngName 			= "",
--    szViewName 			= "",
--    nTalkBeginDate		= 0,
--    nBeginDate 			= 0,
--    nEndDate 			= 0,
--    nTaskGroup 			= 0, 
--    nTaskGroupVersion	= 0,
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

--function on_event_server_start() end
--function on_event_player_login(nExchangeComing) end
--function on_event_player_logout() end
--function on_event_daily_clear(nLastDate,nCurDate) end
--function on_event_weekly_clear(nLastWeek,nCurWeek) end
--function on_event_monthly_clear(nLastMonth,nCurMonth) end
--function on_event_gdata_change(szGdataName) end
--function on_first_login_clear() end --isolate���ߺ��һ�ε�¼ʱ������

--�ϵͳ����ʵ��
AcivityBase = IsolateBase

AcivityBase.nTaskGroup = 0
AcivityBase.nTaskGroupVersion = 0
AcivityBase.TaskGroup = nil

function AcivityBase:__on_activity_init(nTaskGroup, nTaskGroupVersion)
	if nTaskGroup > 0  and nTaskGroupVersion > 0 then
		AcivityBase.nTaskGroup, AcivityBase.nTaskGroupVersion = nTaskGroup, nTaskGroupVersion
		AcivityBase.TaskGroup = TaskManager:Create(nTaskGroup, nTaskGroupVersion)
		IsolateTaskManager:init(t_isolate_task_list, AcivityBase.TaskGroup)--��ʼ�������������ģ��
		t_isolate_task_list = nil
		return 1
	end
	print("[error] [AcivityBase] Init task group error :", isolate_eng_name(), isolate_view_name(), nTaskGroup, nTaskGroupVersion)
	return 0
end
--------------------------------------------
function _verify_isolate_register_activity(szMainVMScript)
	if _verify_isolate_register_base(szMainVMScript) ~= 1 then
		return 0
	end
	local t = t_isolate_base_cfg
	assert(t.nTaskGroup and t.nTaskGroupVersion)
	if t.nTaskGroup > 0 and t.nTaskGroupVersion > 0 then
		return 1
	end
	return 0
end
----------------------------------------------------------------------------------------------------------------------------------
function __on_activity_init(nTaskGroup, nTaskGroupVersion)
	return AcivityBase:__on_activity_init(nTaskGroup, nTaskGroupVersion)
end

isolate_register_self = nil --��ȥ��base�����ע�ắ��
function isolate_register_self(szMainVMScript)
	local t = t_isolate_base_cfg
	if _verify_isolate_register_activity(szMainVMScript) == 1 then
		RegIsolate(t.nPriority, t.szEngName, t.szViewName, t.nTalkBeginDate, t.nBeginDate, t.nEndDate, szMainVMScript, t.nTaskGroup, t.nTaskGroupVersion)
	end
end

----------------------------------------------------------------------------------------------------------------------------------
--�ר���������������ӿ�
function get_task_group()
	return AcivityBase.nTaskGroup, AcivityBase.nTaskGroupVersion
end
