-- ��GS�ر�ʱ��ȫ�ֵ��õĽű�
-- ��main�����н�����Ҫִ�еĲ���


function tong_activity_auto_save()
	SendScript2VM("\\script\\missions\\tong_activity\\tong_activity_value.lua", "TongActivity_SaveTongDataPer10min()")
end
function main()
   tong_activity_auto_save()
end