function TaskShedule()
	TaskName("CityWar");
	-- һ��һ��
	TaskInterval(1440);
	-- ���ô���ʱ��
	TaskTime(20, 0);   
	-- ִ�����޴�
	TaskCountLimit(0);
end
function TaskContent()
	CityWarDailyCheck()
end
function CityWarDailyCheck()
	GlobalExecute("dw city_war_daily_check()");
end