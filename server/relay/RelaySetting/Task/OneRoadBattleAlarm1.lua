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
	TaskName("one_road_battle_alarm1");	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute)
    TaskInterval(1);   -- check per 60min
	TaskTime(nNextHour, nNextMinute);   -- start Timer at 11:15am
	TaskCountLimit(0);  -- loop forever
end

function TaskContent()
	local nHour = tonumber(date("%H")) ;
	local nMinute = tonumber(date("%M"));
	if ( nHour == 22) and (nMinute <= 15) then
		GlobalExecute("dw one_road_battle_alarm()");
	end
end
