function TaskShedule()
	TaskName("kuafu_boss_battle");	
	-- “ªÃÏ“ª¥Œ
    TaskInterval(60);
	-- …Ë÷√¥•∑¢ ±º‰
	TaskTime(21, 00);
    OutputMsg(format("BOSS Li™n Server sœ mÎ vµo %s T7 hµng tu«n...", "21:00"));
	-- ÷¥––Œﬁœﬁ¥Œ
	TaskCountLimit(0);
end

function TaskContent()
	local nWeekDay = tonumber(date("%w"));
    if nWeekDay ~= 6 then
    	return
    end
    local nCurHour = tonumber(date("%H")) 
    local nCurMin = tonumber(date("%M"));
    if nCurHour ~= 21 or nCurMin ~= 0 then
    	return
    end

     GlobalExecute("dw kfb_create_all_mission()");
end
