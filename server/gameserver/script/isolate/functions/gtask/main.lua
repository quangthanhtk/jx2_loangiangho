--����ģ�黯��һ����׼���ļ�����ģ��ֻ��Ҫʵ�ֶ�Ӧ�ı�׼�¼�������������Ҫ������Щ����ʲôʱ�򱻵���
--ģ���ģ��֮�䲻����Include�͵��ù�ϵ
--����ÿ��ģ���Ƕ�����
--����Ҫ��handler��ע�͵�������ջص�Ӱ��Ч��

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Include("\\script\\isolate\\functions\\gtask\\handler.lua")
Include("\\script\\isolate\\functions\\gtask\\talk_event_config.lua")
Include("\\script\\isolate\\functions\\gtask\\create_npc_list.lua")
t_isolate_base_cfg = { --����һ������������
    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "gtask",
    szViewName 			= "Nhi�m v� Th� gi�i",
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}

--����ΪӦ��ģ��Ŀ�ѡ���ã�ֻҪ��������Щ�����ͺ�����ϵͳ�ͻ��Զ�ע��ͻص�
--t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskId, nAcessCode = 0},
--    {id={"id_score", 3358, 11}, clear="daily"|"weekly"|"monthly", byte_score=1, byte_award=2, }, 
--}
t_isolate_user_batch_watch_list = { --{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), ...},
	--{nTaskId, nRate, {name,g,d,p,n,s}, room, weight}
	--����ϵ������
	{"event_mission_task_award", {"pvp", "plant", -1}, fn_elem, {421, "C� ���c M�c Tinh", nil, fn_award_items, {1,100,{{"H�t Gi�ng Th�n M�c",{2,1,31090,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"taiyi", 4}, fn_elem, {424, "C�ch s�a ch�a 3", nil, fn_award_items, {1,100,{{"Th�y Tinh",{2,1,31093,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"taiyihero", 4}, fn_elem, {424, "C�ch s�a ch�a 3", nil, fn_award_items, {1,100,{{"Th�y Tinh",{2,1,31093,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 1}, fn_elem, {426, "C�ch s�a ch�a 4", nil, fn_award_items, {1,100,{{"H�a Tinh",{2,1,31094,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {426, "C�ch s�a ch�a 4", nil, fn_award_items, {1,100,{{"H�a Tinh",{2,1,31094,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 1}, fn_elem, {426, "C�ch s�a ch�a 4", nil, fn_award_items, {1,100,{{"H�a Tinh",{2,1,31094,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {426, "C�ch s�a ch�a 4", nil, fn_award_items, {1,100,{{"H�a Tinh",{2,1,31094,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 3}, fn_elem, {426, "C�ch s�a ch�a 4", nil, fn_award_items, {1,100,{{"Th� Tinh",{2,1,31095,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {426, "C�ch s�a ch�a 4", nil, fn_award_items, {1,100,{{"Th� Tinh",{2,1,31095,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 3}, fn_elem, {426, "C�ch s�a ch�a 4", nil, fn_award_items, {1,100,{{"Th� Tinh",{2,1,31095,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {426, "C�ch s�a ch�a 4", nil, fn_award_items, {1,100,{{"Th� Tinh",{2,1,31095,1,4},1,100}, }}} },
	
	--9תϵ������
	{"event_mission_stage_finish", {"jiandangyanyun", 1}, fn_elem, {462, "H�a Th�n Ch�c Dung", nil, fn_award_items, {1,100,{{"U H�a Tr�y",{2,1,31112,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 2}, fn_elem, {463, "Thu�n Th�n D� Oanh", nil, fn_award_items, {1,100,{{"B�ch Th�y Ch�u",{2,1,31113,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 3}, fn_elem, {464, "Ni�t B�n T�n Gi�", nil, fn_award_items, {1,100,{{"Thi�n Huy�n Th�",{2,1,31114,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 4}, fn_elem, {465, "V� L��ng Minh V��ng", nil, fn_award_items, {1,100,{{"Huy�n Tr�ng Kim",{2,1,31115,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 5}, fn_elem, {466, "Thi�n �m r�t lui", nil, fn_award_items, {1,100,{{"Huy�t M�c �n",{2,1,31116,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 1}, fn_elem, {462, "H�a Th�n Ch�c Dung", nil, fn_award_items, {1,100,{{"U H�a Tr�y",{2,1,31112,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 2}, fn_elem, {463, "Thu�n Th�n D� Oanh", nil, fn_award_items, {1,100,{{"B�ch Th�y Ch�u",{2,1,31113,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 3}, fn_elem, {464, "Ni�t B�n T�n Gi�", nil, fn_award_items, {1,100,{{"Thi�n Huy�n Th�",{2,1,31114,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 4}, fn_elem, {465, "V� L��ng Minh V��ng", nil, fn_award_items, {1,100,{{"Huy�n Tr�ng Kim",{2,1,31115,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 5}, fn_elem, {466, "Thi�n �m r�t lui", nil, fn_award_items, {1,100,{{"Huy�t M�c �n",{2,1,31116,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {462, "H�a Th�n Ch�c Dung", nil, fn_award_items, {1,100,{{"U H�a Tr�y",{2,1,31112,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {463, "Thu�n Th�n D� Oanh", nil, fn_award_items, {1,100,{{"B�ch Th�y Ch�u",{2,1,31113,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {464, "Ni�t B�n T�n Gi�", nil, fn_award_items, {1,100,{{"Thi�n Huy�n Th�",{2,1,31114,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {465, "V� L��ng Minh V��ng", nil, fn_award_items, {1,100,{{"Huy�n Tr�ng Kim",{2,1,31115,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {466, "Thi�n �m r�t lui", nil, fn_award_items, {1,100,{{"Huy�t M�c �n",{2,1,31116,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {462, "H�a Th�n Ch�c Dung", nil, fn_award_items, {1,100,{{"U H�a Tr�y",{2,1,31112,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {463, "Thu�n Th�n D� Oanh", nil, fn_award_items, {1,100,{{"B�ch Th�y Ch�u",{2,1,31113,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {464, "Ni�t B�n T�n Gi�", nil, fn_award_items, {1,100,{{"Thi�n Huy�n Th�",{2,1,31114,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {465, "V� L��ng Minh V��ng", nil, fn_award_items, {1,100,{{"Huy�n Tr�ng Kim",{2,1,31115,1,4},1,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {466, "Thi�n �m r�t lui", nil, fn_award_items, {1,100,{{"Huy�t M�c �n",{2,1,31116,1,4},1,100}, }}} },

	--ս����������ڶ���
	{"event_mission_affairs", {"worldboss","killboss",-1}, fn_elem, {476, "BOSS Th� Gi�i", nil, fn_award_items, {1,100,{{"Binh Kh� Th�n V�",{2,1,31146,1,4},1,100}, }}} },
	{"event_mission_task_award", {"pvp","duobiao",5}, fn_elem, {470, "Ti�u Xa Ho�ng Gia", nil, fn_award_items, {1,100,{{"V�t T� C�u Tr�",{2,1,31144,1,4},1,100}, }}} },
	
	--�¿���������ÿ��1���ܹ�10��
	{"event_mission_stage_finish", {"liangshan", 8}, fn_elem, {487, "Nhi�m v� v��t �i", nil, fn_award_items, {1,100,{{"T�n V�t V��t �i",{2,1,31190,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"dixuangong", 7}, fn_elem, {487, "Nhi�m v� v��t �i", nil, fn_award_items, {1,100,{{"T�n V�t V��t �i",{2,1,31190,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"wanjianzhong", 4}, fn_elem, {487, "Nhi�m v� v��t �i", nil, fn_award_items, {1,100,{{"T�n V�t V��t �i",{2,1,31190,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"taiyi", 6}, fn_elem, {487, "Nhi�m v� v��t �i", nil, fn_award_items, {1,100,{{"T�n V�t V��t �i",{2,1,31190,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"taiyihero", 6}, fn_elem, {487, "Nhi�m v� v��t �i", nil, fn_award_items, {1,100,{{"T�n V�t V��t �i",{2,1,31190,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 5}, fn_elem, {487, "Nhi�m v� v��t �i", nil, fn_award_items, {1,100,{{"T�n V�t V��t �i",{2,1,31190,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 5}, fn_elem, {487, "Nhi�m v� v��t �i", nil, fn_award_items, {1,100,{{"T�n V�t V��t �i",{2,1,31190,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyun", 6}, fn_elem, {487, "Nhi�m v� v��t �i", nil, fn_award_items, {1,100,{{"T�n V�t V��t �i",{2,1,31190,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {487, "Nhi�m v� v��t �i", nil, fn_award_items, {1,100,{{"T�n V�t V��t �i",{2,1,31190,1,4},10,100}, }}} },

	--��������
	{"event_mission_stage_finish", {"jiandangyanyunhero", 5}, fn_elem, {579, "Nhi�m v� v��t �i", nil, fn_award_items, {1,100,{{"��u Gi�o G�y",{2,1,31266,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"jiandangyanyunhero", 6}, fn_elem, {579, "Nhi�m v� v��t �i", nil, fn_award_items, {1,100,{{"��u Gi�o G�y",{2,1,31266,1,4},10,100}, }}} },
	{"event_mission_stage_finish", {"taiyihero", 6}, fn_elem, {579, "Nhi�m v� v��t �i", nil, fn_award_items, {1,100,{{"Th� Gi�o ch�",{2,1,31267,1,4},10,100}, }}} },
}

function on_event_server_start()
	fn_call_npcs(tCreateNpcList, nil)
end
function on_add_watches()
	fn_reg_talk_events()
end

--t_isolate_batch_export_gdata = { name = data, }
--t_isolate_batch_import_gdata = { name1, name2, }
--function on_init() end
--function on_init_ok() end
--function on_uninit() end
--function on_export_gdata() end
--function on_import_gdata() end
--function on_add_watches() end
--function on_new_day(nToday) end
--function on_event_player_login(nExchangeComing) end
--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
--function on_first_login_clear() end --isolate���ߺ��һ�ε�¼ʱ������



