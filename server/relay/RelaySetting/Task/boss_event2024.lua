----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2023-04-25
--- Description: G‰i boss Tµi Nguy™n Chi’n
----------------------------------------------------------------------------------------------------

function TaskShedule()
	TaskName("Tπo mÌi BOSS Event 2024");

	-- “ªÃÏ“ª¥Œ
	TaskInterval(1440);
	-- …Ë÷√¥•∑¢ ±º‰
	--TaskTime(23, 00);
	TaskTime(11, 01);
	OutputMsg(format("BOSS  sœ xu t hi÷n Î %s...", "11:01"));
	-- ÷¥––Œﬁœﬁ¥Œ
	TaskCountLimit(0);
end

function TaskContent()
	GlobalExecute("dw _w_event2024_CreateBossEvent2024()");
end
