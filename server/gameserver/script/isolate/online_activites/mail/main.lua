--����ģ�黯��һ����׼���ļ�����ģ��ֻ��Ҫʵ�ֶ�Ӧ�ı�׼�¼�������������Ҫ������Щ����ʲôʱ�򱻵���
--ģ���ģ��֮�䲻����Include�͵��ù�ϵ
--����ÿ��ģ���Ƕ�����
--����Ҫ��handler��ע�͵�������ջص�Ӱ��Ч��

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Include("\\script\\mail\\mail_lux.lua")
t_isolate_base_cfg = { --����һ������������
    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "mail",
    szViewName 			= "",
    nTalkBeginDate		= 0,
    nBeginDate 			= 20170310,
    nEndDate 			= 20170325,
    nTaskGroup 			= 2,
    nTaskGroupVersion	= 26,
}

--����ΪӦ��ģ��Ŀ�ѡ���ã�ֻҪ��������Щ�����ͺ�����ϵͳ�ͻ��Զ�ע��ͻص�
t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskGroupIdx},
    {id={"id_award", 1,} }, 
}
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

function on_event_player_login(nExchangeComing)
	if get_task("id_award") ~= 0 then
		return
	end
	
	set_task("id_award", tonumber(date("%Y%m%d")))
	
	local szContent = format("%s\n%s\n%s\n%s\n%s\n%s\n%s"
		, "Qu� ��i hi�p th�n m�n"
		, "    Xin ch�o!"
		, "    Nh�m cung c�p d�ch v� game c�ng t�t v� c�ng ti�n l�i h�n, nay ch�ng t�i ch�nh th�c ra m�t h� th�ng th�."
		, "    Hi�n t�i, h� th�ng th� t�m th�i ch�a cho ph�p ng��i ch�i g�i v�t ph�m v� ti�n cho nhau, Vui l�ng nh�n d�u ? � g�c tr�n b�n ph�i giao di�n th� �� t�m hi�u h��ng d�n s� d�ng th�. C�m �n c�c b�n �� lu�n �ng h� VLTK 2. Ch�c b�n ch�i game vui v�!"
		, "    Th�n �i"
		, "        K�nh b�t!"
		, "            BH� V� L�m Truy�n K� 2")
	sendScriptMail("BH� V� L�m Truy�n K� 2", GetName(), "Ra m�t h� th�ng th� ho�n to�n m�i", szContent, "", "")

	szContent = format("%s\n%s\n%s\n%s\n%s\n%s"
		, "Qu� ��i hi�p th�n m�n"
		, "    Xin ch�o!"
		, "    �� ch�c m�ng h� th�ng th� ch�nh th�c ra m�t, ch�ng t�i s� t�ng c�c b�n ��ng T� Chi Nguy�n*7 �� c�m �n s� �ng h� c�a b�n d�nh cho VLTK2 trong su�t th�i gian qua. Ch�c b�n ch�i game vui v�!"
		, "    Th�n �i"
		, "        K�nh b�t!"
		, "            BH� V� L�m Truy�n K� 2")
	sendScriptMail("BH� V� L�m Truy�n K� 2", GetName(), "Ra m�t h� th�ng th� ho�n to�n m�i", szContent, "AddItem(2,1,30913,7,4)", "checkNormal")
	
	szContent = format("%s\n%s\n%s\n%s\n%s"
		, "Qu� ��i hi�p th�n m�n"
		, "    Xin ch�o!"
		, "    V� L�m Truy�n K� 2 c�p nh�t phi�n b�n m�i v�i �i�u ch�nh k� n�ng h� ph�i, Th� Code Thanh Long L�nh h� tr� th�ng c�p nhanh ch�ng c�ng ph�n th��ng h�p d�n, �ua top server m�i Thanh Long nh�n trang b� chi�n tr��ng m�i Thanh Long, l� h�nh trang chu�n b� cho gi�i ��u Bang H�i Tinh Anh 17 s�p t�i."
		, "    Tr�n tr�ng k�nh m�i qu� ��ng ��o c�ng tr�i nghi�m c�c c�p nh�t m�i v�o ng�y 10/03/2017 c�ng V� L�m Truy�n K� 2."
		, "    Th�ng tin chi ti�t ho�t ��ng ��ng ��o c� th� xem t�i trang ch�.")
	sendScriptMail("BH� V� L�m Truy�n K� 2", GetName(), "Phi�n b�n m�i nh�t ra m�t", szContent, "", "")
end

--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
--function on_first_login_clear(nLastLoginDate) --isolate���ߺ��һ�ε�¼ʱ������ end 



