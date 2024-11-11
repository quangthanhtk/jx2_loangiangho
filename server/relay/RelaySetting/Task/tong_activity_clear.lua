
function TaskShedule()
	TaskName("tong_activity_clear");	
	
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(0, 1);   
	-- 执行无限次
	TaskCountLimit(0);
end

function TaskContent()
	GlobalExecute("dw tong_activity_weekly_clear()");
end
