--���isolateȫ�ǵ�����

t_isolate_batch_export_gdata = {} --����֮��Include�����а���export_base.lua���ļ������ķ��Ž���Ϊ��������

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
t_isolate_base_cfg = { --����һ������������
    nPriority 			= 9999,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "exportGdata",
    szViewName 			= "",
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}


Include("\\settings\\static_script\\isolate\\base\\gdata_center\\base_export\\g_debug.lua")
Include("\\settings\\static_script\\isolate\\base\\gdata_center\\base_export\\g_val2string.lua")
Include("\\settings\\static_script\\isolate\\base\\gdata_center\\base_export\\g_class.lua")
