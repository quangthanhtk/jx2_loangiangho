----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2023-04-25
--- Description: G鋓 boss T礽 Nguy猲 Chi課
----------------------------------------------------------------------------------------------------

function TaskShedule()
	TaskName("T筼 m韎 BOSS T礽 Nguy猲 Chi課");	

	-- 一天一次
	TaskInterval(1440);
	-- 设置触发时间
	--TaskTime(23, 00);
	TaskTime(22, 05);
	OutputMsg(format("BOSS Йng Phng Gi竜 Ch�  s� xu蕋 hi謓 � %s...", "22:05"));
	-- 执行无限次
	TaskCountLimit(0);
end

function TaskContent()
	GlobalExecute("dw _w_r2s_CreateBossTnc()");
end
