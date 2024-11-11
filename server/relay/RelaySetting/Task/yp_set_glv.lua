function TaskShedule()
	TaskName("PVP ngo礽 th祅h");

	-- 每小时boss触发
	TaskInterval(60);

	-- 设置触发时间
	local nHour = tonumber(date("%H"));
	nHour = nHour + 1;
	if nHour >= 24 then
		nHour = nHour - 24;
	end

	TaskTime(nHour,0);
	OutputMsg(format("T秈 th祅h c玭g PVP ngo礽 th祅h"));

	-- 执行无限次
	TaskCountLimit(0);
end


function TaskContent()
	local nHour = tonumber(date("%H"));
	if nHour == 4 then --凌晨4点 人少好办事
		GlobalExecute("dw yp_write_data()");
	end
end
            