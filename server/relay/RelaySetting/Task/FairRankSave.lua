function _GetNexStartTime(nStartHour, nStartMinute)
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
    TaskName("fair_rank_save");
    local nStartHour = tonumber(date("%H"));
    local nStartMinute = tonumber(date("%M"));
    local nNextHour, nNextMinute = _GetNexStartTime(nStartHour, nStartMinute)
    TaskInterval(10);   -- check per 10 min
    TaskTime(nNextHour, nNextMinute);
    TaskCountLimit(0) -- loop forever
end

function TaskContent()
    GlobalExecute("dw fair_rank_auto_save()");
end
