function TaskShedule()
	TaskName("one_road_battle");	
	-- 一天一次
    TaskInterval(60);
	-- 设置触发时间
	TaskTime(22, 15);
	-- 执行无限次
	TaskCountLimit(0);
end

function TaskContent()
    local nCurHour = tonumber(date("%H")) 
    local nCurMin = tonumber(date("%M"));
    if nCurHour == 22 and nCurMin == 15 then
        GlobalExecute("dw one_road_battle_start()");
    end
end
