function TaskShedule()
	TaskName("one_road_battle");	
	-- һ��һ��
    TaskInterval(60);
	-- ���ô���ʱ��
	TaskTime(22, 15);
	-- ִ�����޴�
	TaskCountLimit(0);
end

function TaskContent()
    local nCurHour = tonumber(date("%H")) 
    local nCurMin = tonumber(date("%M"));
    if nCurHour == 22 and nCurMin == 15 then
        GlobalExecute("dw one_road_battle_start()");
    end
end
