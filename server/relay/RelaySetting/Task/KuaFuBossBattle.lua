function TaskShedule()
	TaskName("kuafu_boss_battle");	
	-- һ��һ��
    TaskInterval(60);
	-- ���ô���ʱ��
	TaskTime(21, 00);
    OutputMsg(format("BOSS Li�n Server s� m� v�o %s T7 h�ng tu�n...", "21:00"));
	-- ִ�����޴�
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
