function TaskShedule()
	TaskName("��n Hoa ��ng");	

	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(17, 00);
	-- ִ�����޴�
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d%H")) + random(10000);
	GlobalExecute(format("dw hd_CallNpc(%d)", tonumber(nDate)));
end