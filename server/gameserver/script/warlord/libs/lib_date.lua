----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: c¸c hµm liªn quan tíi datetime
----------------------------------------------------------------------------------------------------
WDate = {};
----------------------------------------------------------------------------------------------------

function WDate:DayInSecond(nDay)
    nDay = nDay or 1;
    return nDay * 24 * 3600;
end

function WDate:DateDiff(nFromTime, nToTime)
    local nDiffTime = nToTime - nFromTime;
    local nDay = floor(nDiffTime / 86400);
    nDiffTime = mod(nDiffTime, 86400);
    local nHour = floor(nDiffTime / 3600);
    nDiffTime = mod(nDiffTime, 3600);
    local nMin = floor(nDiffTime / 60);
    return nDay, nHour, nMin;
end

-- Parse date number yyyyMMdd to d, m, y
function WDate:Parse(nDate)
    local v = tonumber(nDate);
    if v > 99999999 then
        local M = mod(v, 100);
        v = floor(v / 100);
        local H = mod(v, 100);
        v = floor(v / 100);
        local d = mod(v, 100);
        v = floor(v / 100);
        local m = mod(v, 100);
        v = floor(v / 100);
        local y = mod(v, 10000);
        return d, m, y, M, H;
    else
        local d = mod(v, 100);
        v = floor(v / 100);
        local m = mod(v, 100);
        v = floor(v / 100);
        local y = mod(v, 10000);
        return d, m, y, 0, 0;
    end
end

-- Parse date number yyyyMMdd to d/mm/yyyy
function WDate:ToString(nDate, bWithTime)
    local nDay, nMonth, nYear, nMin, nHour = self:Parse(nDate);
    if bWithTime then
        return format("%02d:%02d %02d/%02d/%d", nHour, nMin, nDay, nMonth, nYear); --HH:MM dd/mm/yyyy
    else
        return format("%02d/%02d/%d", nDay, nMonth, nYear); --dd/mm/yyyy
    end
end

function WDate:Today(bWithTime, bWithSeconds)
    local szFormat = "%Y%m%d";
    if bWithTime then
        szFormat = szFormat .. "%H%M";
        if bWithSeconds then
            szFormat = szFormat .. "%S";
        end
    end
    return tonumber(date(szFormat));
end

function WDate:GetTime(bWithSeconds)
    local szFormat = "%H%M";
    if bWithSeconds then
        szFormat = szFormat .. "%S";
    end
    return tonumber(date(szFormat));
end

function WDate:CurrentTestDay()
    return abs(tf_GetDayDiff(WLib:GetSrvCfg("tbTimeTest").nStartDate, self:Today()) or 1);
end

function WDate:CurrentRunningDay()
    local tbTimeOpen = WLib:GetSrvCfg("tbTimeOpen");
    if tbTimeOpen == WEnv.NULL then
        return 0;
    end
    local diffTime = GetTime() - MkTime(tbTimeOpen.nYear, tbTimeOpen.nMonth, tbTimeOpen.nDay, tbTimeOpen.nHour, 0, 0);
    return floor(diffTime / (24 * 3600)) + 1;
end

function WDate:TestRemainingDays()
    local nRemainingDay = abs(tf_GetDayDiff(WLib:GetSrvCfg("tbTimeTest").nStartDate, WLib:GetSrvCfg("tbTimeTest").nEndDate) or 0) - self:CurrentTestDay();
    if nRemainingDay < 0 then
        nRemainingDay = 0;
    end
    return nRemainingDay;
end

function WDate:GetDaysInMonth(nMonth, nYear)
    nYear = tonumber(nYear) or tonumber(date("%Y"));
    nMonth = tonumber(nMonth) or tonumber(date("%m"));
    local tbDaysInMonth = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
    local nDayInMonth = tbDaysInMonth[nMonth];

    -- check for leap year
    if (nMonth == 2) then
        if (mod(nYear, 4) == 0) then
            if (mod(nYear, 100) == 0) then
                if (mod(nYear, 400) == 0) then
                    nDayInMonth = 29;
                end
            else
                nDayInMonth = 29;
            end
        end
    end

    return nDayInMonth;
end

function WDate:SetDate(nStartDate, nDayAdd)
    local nDay, nMonth, nYear = WDate:Parse(nStartDate);
    local nDaysInMonth = WDate:GetDaysInMonth(nMonth, nYear);
    local nDayAddRemain = 0;

    if nDay + nDayAdd > nDaysInMonth then
        nDayAddRemain = nDayAdd - (nDaysInMonth - nDay) - 1;
        nDay = 1;
        nMonth = nMonth + 1;

        if nMonth > 12 then
            nMonth = 1;
            nYear = nYear + 1;
        end
    elseif nDay + nDayAdd < 1 then
        nDayAddRemain = -(abs(nDayAdd) - nDay - 1);
        nMonth = nMonth - 1;

        if nMonth < 1 then
            nMonth = 12;
            nYear = nYear - 1;
        end

        nDay = WDate:GetDaysInMonth(nMonth, nYear);
    else
        nDay = nDay + nDayAdd;
    end

    if nDayAddRemain ~= 0 then
        return WDate:SetDate(tonumber(format("%d%02d%02d", nYear, nMonth, nDay)), nDayAddRemain);
    end

    return nDay, nMonth, nYear;
end
