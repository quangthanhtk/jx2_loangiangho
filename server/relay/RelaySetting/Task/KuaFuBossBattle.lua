function TaskShedule()
	TaskName("kuafu_boss_battle");	
	-- 一天一次
    TaskInterval(60);
	-- 设置触发时间
	TaskTime(21, 00);
    OutputMsg(format("BOSS Li猲 Server s� m� v祇 %s T7 h祅g tu莕...", "21:00"));
	-- 执行无限次
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
