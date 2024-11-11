
local _GetNexStartTime = function(nStartHour, nStartMinute)
	local nNextHour = nStartHour
	local nNextMinute = nStartMinute + 1
	
	if nNextMinute >= 60 then
		nNextHour = nNextHour + floor(nNextMinute / 60)
		nNextMinute = mod(nNextMinute, 60) 
	end
	
	if (nNextHour >= 24) then
		nNextHour = mod(nNextHour, 24);
	end
	return nNextHour, nNextMinute
end

function TaskShedule()
	TaskName("tong_activity");	
	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute)
	-- 10分钟一次
	TaskInterval(10);
	-- 设置触发时间
	TaskTime(nStartHour, nStartMinute);   
	-- 执行1次
	TaskCountLimit(0);
end

function TaskContent()
	GlobalExecute("dw tong_activity_auto_save()");
end
