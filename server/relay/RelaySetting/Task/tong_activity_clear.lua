
function TaskShedule()
	TaskName("tong_activity_clear");	
	
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(0, 1);   
	-- ִ�����޴�
	TaskCountLimit(0);
end

function TaskContent()
	GlobalExecute("dw tong_activity_weekly_clear()");
end
