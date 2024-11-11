function TaskShedule()
	TaskName("CityWar");
	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	TaskTime(20, 0);   
	-- 执行无限次
	TaskCountLimit(0);
end
function TaskContent()
	CityWarDailyCheck()
end
function CityWarDailyCheck()
	GlobalExecute("dw city_war_daily_check()");
end