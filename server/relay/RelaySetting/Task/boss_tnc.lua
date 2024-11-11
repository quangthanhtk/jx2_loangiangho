----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2023-04-25
--- Description: G‰i boss Tµi Nguy™n Chi’n
----------------------------------------------------------------------------------------------------

function TaskShedule()
	TaskName("Tπo mÌi BOSS Tµi Nguy™n Chi’n");	

	-- “ªÃÏ“ª¥Œ
	TaskInterval(1440);
	-- …Ë÷√¥•∑¢ ±º‰
	--TaskTime(23, 00);
	TaskTime(22, 05);
	OutputMsg(format("BOSS ß´ng Ph≠¨ng Gi∏o ChÒ  sœ xu t hi÷n Î %s...", "22:05"));
	-- ÷¥––Œﬁœﬁ¥Œ
	TaskCountLimit(0);
end

function TaskContent()
	GlobalExecute("dw _w_r2s_CreateBossTnc()");
end
