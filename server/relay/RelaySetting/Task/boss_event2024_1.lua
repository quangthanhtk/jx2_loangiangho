----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2023-04-25
--- Description: G鋓 boss T礽 Nguy猲 Chi課
----------------------------------------------------------------------------------------------------

function TaskShedule()
	TaskName("T筼 m韎 BOSS Event 2024");

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	--TaskTime(23, 00);
	TaskTime(22, 01);
	OutputMsg(format("BOSS Ng鋍 S琻 Chi Linh  s� xu蕋 hi謓 � %s...", "22:01"));
	-- 执行无限次
	TaskCountLimit(0);
end

function TaskContent()
	GlobalExecute("dw _w_event2024_CreateBossEvent2024()");
end
