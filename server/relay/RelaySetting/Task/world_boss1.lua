--Ã¿Ìì20:00×¼Ê±Ë¢ĞÂ

function TaskShedule()
	TaskName("T¹o míi BOSS ThÕ Giíi");	

	-- Ò»ÌìÒ»´Î
	TaskInterval(1440);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	TaskTime(22,10);
	OutputMsg(format("BOSS ThÕ Giíi sÏ xuÊt hiÖn ë %s...", "22:10"));
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);

end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d%H")) + random(10000);
	GlobalExecute(format("dw wb_CreateBoss(%d)", tonumber(nDate)));
end