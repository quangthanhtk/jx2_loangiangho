--Ã¿Ìì14:30×¼Ê±Ë¢ĞÂ

function TaskShedule()
	TaskName("T¹o míi BOSS Tµi Nguyªn ChiÕn");

	-- Ò»ÌìÒ»´Î
	TaskInterval(1440);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	--TaskTime(23, 00);
	TaskTime(14, 10);
	OutputMsg(format("BOSS §«ng Ph­¬ng Gi¸o Chñ  sÏ xuÊt hiÖn ë %s...", "14:10"));
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);
end

function TaskContent()
	GlobalExecute("dw _w_r2s_CreateBossTnc()");
end