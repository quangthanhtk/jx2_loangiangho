--============================================= 
--author: daizejun 
--date	: 2015.09
--desc	: ����isolate�ű�ϵͳΨһ�����������
--related files: 
--=============================================

--script_data_center
--������Ҫ�洢�ڽű��е����ݶ��������������У���������ļ�ֻIncludeһЩ�д洢����Ľű�û��ʵ��ʵ�ִ���

if not __script_date_center__ then
	__script_date_center__ = 1
	Include("\\settings\\static_script\\isolate\\base\\gdata_center\\gdata_impl.lua")		--GdataImpl
	Include("\\settings\\static_script\\isolate\\base\\event_center\\event_impl.lua")		--EventImpl
	Include("\\settings\\static_script\\isolate\\base\\isolate_center_impl.lua")	--IsolateCenterImpl
	
	function script_data_center_init()
		print("init script_data_center.lua begin====")
		GdataImpl:_init()			--��VM�����ݴ�ȡ����
        EventImpl:_init()			--�����¼�ϵͳ����
        IsolateCenterImpl:_init()	--Isolateע��ͼ��ط���
        print("init script_data_center.lua end====")
	end
	
	--script_data_center_init();--��C++ g_InitScriptEngine �����е���
end