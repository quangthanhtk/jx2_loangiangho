----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-24
--- Description: file ch�a c�c h�m li�n quan ��n ng��i ch�i m�i
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\warlord\\functions\\function_book.lua");
----------------------------------------------------------------------------------------------------

m_nDayStartCheckDailyTask = 3;

--Nhi�m v� h�ng ng�y
m_tbNewbieDailyTaskSupport = {
    { szTaskName = "Tham gia chi�n tr��ng ch�nh", nDateOpen = 20221229, nTaskId = WTASKID_DAILYTASK_BYTE, nByteId = WTASKID_DAILYTASK_BYTE_CTC_DONE, nValueReq = 1 },
    { szTaskName = "Tham gia chi�n tr��ng ph�", nDateOpen = 20221229, nTaskId = WTASKID_DAILYTASK_BYTE, nByteId = WTASKID_DAILYTASK_BYTE_CTP_DONE, nValueReq = 1 },
    --{ szTaskName = "Thu ho�ch B�t Nh� L�n", nDateOpen = 20221229, nTaskId = WTASKID_WEEKLYTASK2_BYTE, nByteId = WTASKID_WEEKLYTASK2_BYTE_BNL_DONE, nValueReq = 20 },
   -- { szTaskName = "Ho�n th�nh nhi�m v� t�i nguy�n chi�n", nDateOpen = 20221229, nTaskId = WTASKID_DAILYTASK_BYTE, nByteId = WTASKID_DAILYTASK_BYTE_TNC_DONE, nValueReq = 2 },
};

--Nhi�m v� ��c th�
m_tbNewbieDailyTaskSupport2 = {
    { szTaskName = "Ho�n th�nh nhi�m v� t�i nguy�n chi�n", nDateOpen = 20221229, nTaskId = WTASKID_DAILYTASK_BYTE, nByteId = WTASKID_DAILYTASK_BYTE_TNC_DONE, nValueReq = 2 },
};

--Nhi�m v� h�ng tu�n
m_tbWeeklyTaskSupport = {
    { szTaskName = "Tham gia chi�n tr��ng ch�nh", nDateOpen = 20221229, nTaskId = WTASKID_WEEKLYTASK_BYTE, nByteId = WTASKID_WEEKLYTASK_BYTE_CTC_DONE, nValueReq = 4 },
    { szTaskName = "Tham gia chi�n tr��ng ph�", nDateOpen = 20221229, nTaskId = WTASKID_WEEKLYTASK_BYTE, nByteId = WTASKID_WEEKLYTASK_BYTE_CTP_DONE, nValueReq = 4 },
    { szTaskName = "Ho�n th�nh nhi�m v� t�i nguy�n chi�n", nDateOpen = 20221229, nTaskId = WTASKID_WEEKLYTASK_BYTE, nByteId = WTASKID_WEEKLYTASK_BYTE_TNC_DONE, nValueReq = 15 },
    { szTaskName = "Thu ho�ch B�t Nh� L�n", nDateOpen = 20221229, nTaskId = WTASKID_WEEKLYTASK2_BYTE, nByteId = WTASKID_WEEKLYTASK2_BYTE_BNL_DONE, nValueReq = 30 },
    { szTaskName = "V�n ti�u Ho�ng Gia", nDateOpen = 20221229, nTaskId = WTASKID_WEEKLYTASK2_BYTE, nByteId = WTASKID_WEEKLYTASK2_BYTE_VANTIEU_DONE, nValueReq = 10 },
    --{ szTaskName = "C��p ti�u", nDateOpen = 20221229, nTaskId = WTASKID_WEEKLYTASK2_BYTE, nByteId = WTASKID_WEEKLYTASK2_BYTE_CUOPTIEU_DONE, nValueReq = 5 },
};

--Nhi�m v� h� tr� t�n th� 1
m_tbTaskSupport1 = {
    { szTaskName = "Tham gia chi�n tr��ng ch�nh", nDateOpen = 20221229, nTaskId = WTASKID_SUPPORT1_TASK_BYTE, nByteId = WTASKID_SUPPORT1_TASK_BYTE_CTC_DONE, nValueReq = 2 },
    { szTaskName = "Tham gia chi�n tr��ng ph�", nDateOpen = 20221229, nTaskId = WTASKID_SUPPORT1_TASK_BYTE, nByteId = WTASKID_SUPPORT1_TASK_BYTE_CTP_DONE, nValueReq = 2 },
    { szTaskName = "Ho�n th�nh nhi�m v� t�i nguy�n chi�n", nDateOpen = 20221229, nTaskId = WTASKID_SUPPORT1_TASK_BYTE, nByteId = WTASKID_SUPPORT1_TASK_BYTE_TNC_DONE, nValueReq = 4 },
    { szTaskName = "Thu ho�ch B�t Nh� L�n", nDateOpen = 20221229, nTaskId = WTASKID_SUPPORT1_TASK2_BYTE, nByteId = WTASKID_SUPPORT1_TASK2_BYTE_BNL_DONE, nValueReq = 2 },
    { szTaskName = "V�n ti�u Ho�ng Gia", nDateOpen = 20221229, nTaskId = WTASKID_SUPPORT1_TASK2_BYTE, nByteId = WTASKID_SUPPORT1_TASK2_BYTE_VANTIEU_DONE, nValueReq = 1 },
    --{ szTaskName = "C��p ti�u", nDateOpen = 20221229, nTaskId = WTASKID_SUPPORT1_TASK2_BYTE, nByteId = WTASKID_SUPPORT1_TASK2_BYTE_CUOPTIEU_DONE, nValueReq = 5 },
};

---Ki�m tra c�c nhi�m v� �� ho�n th�nh ch�a
---@return number, table return1: WEnvTRUE= ho�n th�nh, WEnv.FALSE= ch�a ho�n th�nh; return2: danh s�ch tr�ng th�i nhi�m v�
function _w_newbie_CheckDailyTask()
    --if WPlayer:IsNewbie(m_nDayStartCheckDailyTask * DATETIME_SEC_ONE_DAY) == WEnv.TRUE then
    --    local nDay, nHour, nMin = WDate:DateDiff(GetTime(), GetCreateTime() + (m_nDayStartCheckDailyTask * DATETIME_SEC_ONE_DAY));
    --    return WEnv.TRUE, { format("<color=green> - Th�i gian t�n th� c�n %d ng�y %d gi� %d ph�t<color>", nDay, nHour, nMin ) };
    --end

    local nTotalTaskReq = 0;
    local nTotalTaskSuccess = 0;
    local tbTaskStatus = {};
    local szColor = "white";
    local nCurrentDate = WDate:Today();

    local tbDailyTask = m_tbNewbieDailyTaskSupport;

    for i = 1, getn(tbDailyTask) do
        if tbDailyTask[i].nDateOpen <= nCurrentDate then
            nTotalTaskReq = nTotalTaskReq + 1;

            if type(tbDailyTask[i].nBitId) == "number" then
                if WTask:GetBit(tbDailyTask[i].nTaskId, tbDailyTask[i].nBitId) >= tbDailyTask[i].nValueReq then
                    nTotalTaskSuccess = nTotalTaskSuccess + 1;
                    szColor = "green";
                else
                    szColor = "red";
                end
                tinsert(tbTaskStatus, format("<color=%s> - %s: %d/%d<color>", szColor, tbDailyTask[i].szTaskName, WTask:GetBit(tbDailyTask[i].nTaskId, tbDailyTask[i].nBitId), tbDailyTask[i].nValueReq));
            elseif type(tbDailyTask[i].nByteId) == "number" then
                if WTask:GetByte(tbDailyTask[i].nTaskId, tbDailyTask[i].nByteId) >= tbDailyTask[i].nValueReq then
                    nTotalTaskSuccess = nTotalTaskSuccess + 1;
                    szColor = "green";
                else
                    szColor = "red";
                end
                tinsert(tbTaskStatus, format("<color=%s> - %s: %d/%d<color>", szColor, tbDailyTask[i].szTaskName, WTask:GetByte(tbDailyTask[i].nTaskId, tbDailyTask[i].nByteId), tbDailyTask[i].nValueReq));
            else
                if WTask:Get(tbDailyTask[i].nTaskId) >= tbDailyTask[i].nValueReq then
                    nTotalTaskSuccess = nTotalTaskSuccess + 1;
                    szColor = "green";
                else
                    szColor = "red";
                end
                tinsert(tbTaskStatus, format("<color=%s> - %s: %d/%d<color>", szColor, tbDailyTask[i].szTaskName, WTask:Get(tbDailyTask[i].nTaskId), tbDailyTask[i].nValueReq));
            end

        end
    end

    if nTotalTaskReq == nTotalTaskSuccess and nTotalTaskSuccess ~= 0 then
        return WEnv.TRUE, tbTaskStatus;
    end

    return WEnv.FALSE, tbTaskStatus;
end
function _w_newbie_CheckDailyTask2()
    if WTask:GetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_FINISHTASK_NEWBIE_GIVEDAILY2) == 1 then
        return WEnv.TRUE, { "<color=green> - �� ho�n th�nh nhi�m v�, c� th� nh�n th��ng<color>" };
    end

    local nTotalTaskReq = 0;
    local nTotalTaskSuccess = 0;
    local tbTaskStatus = {};
    local szColor = "white";
    local nCurrentDate = WDate:Today();

    local tbDailyTask = m_tbNewbieDailyTaskSupport2;

    for i = 1, getn(tbDailyTask) do
        if tbDailyTask[i].nDateOpen <= nCurrentDate then
            nTotalTaskReq = nTotalTaskReq + 1;

            if type(tbDailyTask[i].nBitId) == "number" then
                if WTask:GetBit(tbDailyTask[i].nTaskId, tbDailyTask[i].nBitId) >= tbDailyTask[i].nValueReq then
                    nTotalTaskSuccess = nTotalTaskSuccess + 1;
                    szColor = "green";
                else
                    szColor = "red";
                end
                tinsert(tbTaskStatus, format("<color=%s> - %s: %d/%d<color>", szColor, tbDailyTask[i].szTaskName, WTask:GetBit(tbDailyTask[i].nTaskId, tbDailyTask[i].nBitId), tbDailyTask[i].nValueReq));
            elseif type(tbDailyTask[i].nByteId) == "number" then
                if WTask:GetByte(tbDailyTask[i].nTaskId, tbDailyTask[i].nByteId) >= tbDailyTask[i].nValueReq then
                    nTotalTaskSuccess = nTotalTaskSuccess + 1;
                    szColor = "green";
                else
                    szColor = "red";
                end
                tinsert(tbTaskStatus, format("<color=%s> - %s: %d/%d<color>", szColor, tbDailyTask[i].szTaskName, WTask:GetByte(tbDailyTask[i].nTaskId, tbDailyTask[i].nByteId), tbDailyTask[i].nValueReq));
            else
                if WTask:Get(tbDailyTask[i].nTaskId) >= tbDailyTask[i].nValueReq then
                    nTotalTaskSuccess = nTotalTaskSuccess + 1;
                    szColor = "green";
                else
                    szColor = "red";
                end
                tinsert(tbTaskStatus, format("<color=%s> - %s: %d/%d<color>", szColor, tbDailyTask[i].szTaskName, WTask:Get(tbDailyTask[i].nTaskId), tbDailyTask[i].nValueReq));
            end

        end
    end

    if nTotalTaskReq == nTotalTaskSuccess and nTotalTaskSuccess ~= 0 then
        WTask:SetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_FINISHTASK_NEWBIE_GIVEDAILY2, 1);
        return WEnv.TRUE, tbTaskStatus;
    end

    return WEnv.FALSE, tbTaskStatus;
end

---Ki�m tra c�c nhi�m v� tu�n �� ho�n th�nh ch�a
---@return number, table return1: WEnvTRUE= ho�n th�nh, WEnv.FALSE= ch�a ho�n th�nh; return2: danh s�ch tr�ng th�i nhi�m v�
function _w_newbie_CheckWeeklyTask()
    local nTotalTaskReq = 0;
    local nTotalTaskSuccess = 0;
    local tbTaskStatus = {};
    local szColor = "white";
    local nCurrentDate = WDate:Today();

    local tbDailyTask = m_tbWeeklyTaskSupport;

    for i = 1, getn(tbDailyTask) do
        if tbDailyTask[i].nDateOpen <= nCurrentDate then
            nTotalTaskReq = nTotalTaskReq + 1;

            if type(tbDailyTask[i].nBitId) == "number" then
                if WTask:GetBit(tbDailyTask[i].nTaskId, tbDailyTask[i].nBitId) >= tbDailyTask[i].nValueReq then
                    nTotalTaskSuccess = nTotalTaskSuccess + 1;
                    szColor = "green";
                else
                    szColor = "red";
                end
                tinsert(tbTaskStatus, format("<color=%s> - %s: %d/%d<color>", szColor, tbDailyTask[i].szTaskName, WTask:GetBit(tbDailyTask[i].nTaskId, tbDailyTask[i].nBitId), tbDailyTask[i].nValueReq));
            elseif type(tbDailyTask[i].nByteId) == "number" then
                if WTask:GetByte(tbDailyTask[i].nTaskId, tbDailyTask[i].nByteId) >= tbDailyTask[i].nValueReq then
                    nTotalTaskSuccess = nTotalTaskSuccess + 1;
                    szColor = "green";
                else
                    szColor = "red";
                end
                tinsert(tbTaskStatus, format("<color=%s> - %s: %d/%d<color>", szColor, tbDailyTask[i].szTaskName, WTask:GetByte(tbDailyTask[i].nTaskId, tbDailyTask[i].nByteId), tbDailyTask[i].nValueReq));
            else
                if WTask:Get(tbDailyTask[i].nTaskId) >= tbDailyTask[i].nValueReq then
                    nTotalTaskSuccess = nTotalTaskSuccess + 1;
                    szColor = "green";
                else
                    szColor = "red";
                end
                tinsert(tbTaskStatus, format("<color=%s> - %s: %d/%d<color>", szColor, tbDailyTask[i].szTaskName, WTask:Get(tbDailyTask[i].nTaskId), tbDailyTask[i].nValueReq));
            end

        end
    end

    if nTotalTaskReq == nTotalTaskSuccess and nTotalTaskSuccess ~= 0 then
        return WEnv.TRUE, tbTaskStatus;
    end

    return WEnv.FALSE, tbTaskStatus;
end

---Ki�m tra c�c nhi�m v� h� tr� t�n th� 1 �� ho�n th�nh ch�a
---@return number, table return1: WEnvTRUE= ho�n th�nh, WEnv.FALSE= ch�a ho�n th�nh; return2: danh s�ch tr�ng th�i nhi�m v�
function _w_newbie_CheckSupport1Task()
    local nTotalTaskReq = 0;
    local nTotalTaskSuccess = 0;
    local tbTaskStatus = {};
    local szColor = "white";
    local nCurrentDate = WDate:Today();

    local tbDailyTask = m_tbTaskSupport1;

    for i = 1, getn(tbDailyTask) do
        if tbDailyTask[i].nDateOpen <= nCurrentDate then
            nTotalTaskReq = nTotalTaskReq + 1;

            if type(tbDailyTask[i].nBitId) == "number" then
                if WTask:GetBit(tbDailyTask[i].nTaskId, tbDailyTask[i].nBitId) >= tbDailyTask[i].nValueReq then
                    nTotalTaskSuccess = nTotalTaskSuccess + 1;
                    szColor = "green";
                else
                    szColor = "red";
                end
                tinsert(tbTaskStatus, format("<color=%s> - %s: %d/%d<color>", szColor, tbDailyTask[i].szTaskName, WTask:GetBit(tbDailyTask[i].nTaskId, tbDailyTask[i].nBitId), tbDailyTask[i].nValueReq));
            elseif type(tbDailyTask[i].nByteId) == "number" then
                if WTask:GetByte(tbDailyTask[i].nTaskId, tbDailyTask[i].nByteId) >= tbDailyTask[i].nValueReq then
                    nTotalTaskSuccess = nTotalTaskSuccess + 1;
                    szColor = "green";
                else
                    szColor = "red";
                end
                tinsert(tbTaskStatus, format("<color=%s> - %s: %d/%d<color>", szColor, tbDailyTask[i].szTaskName, WTask:GetByte(tbDailyTask[i].nTaskId, tbDailyTask[i].nByteId), tbDailyTask[i].nValueReq));
            else
                if WTask:Get(tbDailyTask[i].nTaskId) >= tbDailyTask[i].nValueReq then
                    nTotalTaskSuccess = nTotalTaskSuccess + 1;
                    szColor = "green";
                else
                    szColor = "red";
                end
                tinsert(tbTaskStatus, format("<color=%s> - %s: %d/%d<color>", szColor, tbDailyTask[i].szTaskName, WTask:Get(tbDailyTask[i].nTaskId), tbDailyTask[i].nValueReq));
            end

        end
    end

    if nTotalTaskReq == nTotalTaskSuccess and nTotalTaskSuccess ~= 0 then
        return WEnv.TRUE, tbTaskStatus;
    end

    return WEnv.FALSE, tbTaskStatus;
end

---Interface c�a c�c h�m nh�n th��ng � d��i c� check th�m �i�u ki�n nhi�m v� tr��c khi trao th��ng
function _w_newbie_GiveDailySupport(nTaskId, nBitId, szFunc)
    --- Check
    if _w_newbie_CheckDailyTask() ~= WEnv.TRUE then
        return WNpc:Talk("<sex> ch�a ho�n th�nh nhi�m v� h�m nay!", WEnv.TRUE);
    end

    _w_newbie_GiveOnceSupport(nTaskId, nBitId, szFunc);
end
function _w_newbie_GiveDailySupport2(nTaskId, nBitId, szFunc)
    --- Check
    if _w_newbie_CheckDailyTask2() ~= WEnv.TRUE then
        return WNpc:Talk("<sex> ch�a ho�n th�nh nhi�m v� h�m nay!", WEnv.TRUE);
    end

    _w_newbie_GiveOnceSupport(nTaskId, nBitId, szFunc);
end

---Interface c�a c�c h�m nh�n th��ng nhi�m v� tu�n
function _w_newbie_GiveWeeklySupport(nTaskId, nBitId, szFunc)
    --- Check
    if _w_newbie_CheckWeeklyTask() ~= WEnv.TRUE then
        return WNpc:Talk("<sex> ch�a ho�n th�nh nhi�m v� tu�n n�y!", WEnv.TRUE);
    end

    _w_newbie_GiveOnceSupport(nTaskId, nBitId, szFunc);
end

---Interface c�a c�c h�m nh�n th��ng nhi�m v� t�n th� 1
function _w_newbie_GiveSupport1(nTaskId, nBitId, szFunc)
    --- Check
    if _w_newbie_CheckSupport1Task() ~= WEnv.TRUE then
        return WNpc:Talk("<sex> ch�a ho�n th�nh nhi�m v� t�n th� n�y!", WEnv.TRUE);
    end

    _w_newbie_GiveOnceSupport(nTaskId, nBitId, szFunc);
end
-------nhan yeu Quyet
function _w_newbie_Give_YeuQuyet()

    local tbAward = {
        { tbProp = { 2, 1, 50005 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- R��ng y�u Quy�t
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
---Interface c�a c�c h�m nh�n th��ng 1 l�n
function _w_newbie_GiveOnceSupport(nTaskId, nBitId, szFunc)
    if nTaskId == nil or nBitId == nil then
        return WEnv.RETCODE_ERROR;
    end

    --Check
    if WTask:GetBit(nTaskId, nBitId) ~= 0 then
        return WNpc:Talk("<sex> �� nh�n h� tr� n�y r�i!", WEnv.TRUE);
    end
    if WPlayer:IsJoinedRoute() ~= WEnv.TRUE then
        return WNpc:Talk("<sex> ch�a gia nh�p m�n ph�i kh�ng th� nh�n h� tr�!", WEnv.TRUE);
    end
    if WLib:CheckInv(15, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    --Save give status
    WTask:SetBit(nTaskId, nBitId, 1);

    --Call
    dostring(szFunc);
end

----------------------------------------------------------------------------------------------------
---C�c h�m nh�n h� tr� 1 l�n m�i ng�y

---H�m nh�n item Ho�ng Kim ��i H�ng Bao (v�ng)
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_MoneyItem(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 539 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Ho�ng Kim ��i H�ng Bao
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---Nh�n item M�t T�ch B� �i�n m�i ng�y
---@param nAmount number S� l��ng c�n add

---Nh�n item Tu Ch�n Y�u Quy�t m�i ng�y
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_TuChan(nAmount)
    local tbAward = {
        { tbProp = { 2, 0, 554 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Tu Ch�n Y�u Quy�t
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n �i�m l�ch luy�n v� ch�n v� tinh hoa d�nh cho ti�n c�p m�t t�ch
function _w_newbie_Give_LichLuyen(nPopur, nPopur2, nChanQuyen)
    nPopur = tonumber(nPopur) or 1;
    nPopur2 = tonumber(nPopur2) or 1;
    nChanQuyen = tonumber(nChanQuyen) or 1;
    local tbAward = {
        { nPopur = nPopur },
        { nPopur2 = nPopur2 },
    };

    if nChanQuyen > 0 then
        tinsert(tbAward, { tbProp = { 2, 114, 117 }, nStack = nChanQuyen, nStatus = ITEMSTATUS_LOCK }); -- Ch�n Quy�n Tinh Hoa
    end

    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n item M�nh C� Quan M�c Gia m�i ng�y
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_ManhMacGia(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- M�nh C� Quan M�c Gia
    };
    WAward:Give(tbAward, "item_newbie_card");
end


---Nh�n item s�ch k� n�ng b�n ��ng h�nh Lv5
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_SachPetLv5(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 40025 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- T�i K� N�ng B�H Lv5
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n item Th��ng H�i Di Ch�u
---@param nLevel number c�p c�a ch�u
---@param nQuantity number S� l��ng c�n add
function _w_newbie_Give_ThuongHaiDiChau(nLevel, nQuantity)
    nLevel = tonumber(nLevel) or 1;
    nQuantity = tonumber(nQuantity) or 1;
    KsgAward:ThuongHaiChau(nLevel, nQuantity, ITEMSTATUS_LOCK);
end

---Nh�n item Tui da quy
---@param nLevel number c�p c�a ch�u
---@param nQuantity number S� l��ng c�n add
function _w_newbie_Give_TuiDaQuy(nLevel, nAmount)
    nLevel = tonumber(nLevel) or 1;
    nAmount = tonumber(nAmount) or 1;
    local tbDaQuy = {
        [1] = {
            tbItems = {
                { tbProp = { 2, 1, 30998 }, nCount = nAmount }
                }},
        [2] = {
            tbItems = {
                { tbProp = { 2, 1, 30999 }, nCount = nAmount }
            }},
        [3] = {
            tbItems = {
                { tbProp = { 2, 1, 31000 }, nCount = nAmount }
            }},
        [4] = {
            tbItems = {
                { tbProp = { 2, 1, 31001 }, nCount = nAmount }
            }},
        [5] = {
            tbItems = {
                { tbProp = { 2, 1, 31024 }, nCount = nAmount }
            }},
        [6] = {
            tbItems = {
                { tbProp = { 2, 1, 31123 }, nCount = nAmount }
            }},
    }

    local tbAward = {
        tbDaQuy[nLevel].tbItems, -- B�t Tr�n Ch�u
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---Nh�n item B�t Tr�n Ch�u
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_BotTranChau(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 102, 215 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- B�t Tr�n Ch�u
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---Nh�n item �� M�i v� kh�
---@param nQuantity number S� l��ng c�n add
function _w_newbie_Give_DaMai(nQuantity)
    nQuantity = tonumber(nQuantity) or 1;
    local tbAward = {
        { tbProp = { 2, 1, 30428 }, nStack = nQuantity, nStatus = ITEMSTATUS_LOCK }, -- Ma �ao Th�ch C�p 1
        { tbProp = { 2, 1, 30429 }, nStack = nQuantity, nStatus = ITEMSTATUS_LOCK }, -- Ma �ao Th�ch C�p 2
        { tbProp = { 2, 1, 30430 }, nStack = nQuantity, nStatus = ITEMSTATUS_LOCK }, -- Ma �ao Th�ch C�p 3
    };
    WAward:Give(tbAward, "item_newbie_card");
end
---------Nh�n Ph� H�n l�nh b�i
function _w_newbie_Give_PhaHonLenhBai()
    local tbAward = {
        { tbProp = { 2, 1, 31529 }, nStack = 1,nStatus = ITEMSTATUS_LOCK },
        { tbProp = { 2, 1, 31530 }, nStack = 1,nStatus = ITEMSTATUS_LOCK },
        { tbProp = { 2, 1, 31531 }, nStack = 1,nStatus = ITEMSTATUS_LOCK },
        { tbProp = { 2, 1, 31532 }, nStack = 1,nStatus = ITEMSTATUS_LOCK },
        { tbProp = { 2, 1, 31533 }, nStack = 2,nStatus = ITEMSTATUS_LOCK },
    }
    KsgAward:Give(tbAward, 'Nh�n b� Ph� H�n')
end
function _w_newbie_Give_LangSuongLenhBai()
    local tbAward = {
        { tbProp = { 2, 1, 31684 }, nStack = 1,nStatus = ITEMSTATUS_LOCK },
        { tbProp = { 2, 1, 31685 }, nStack = 1,nStatus = ITEMSTATUS_LOCK },
        { tbProp = { 2, 1, 31686 }, nStack = 1,nStatus = ITEMSTATUS_LOCK },
        { tbProp = { 2, 1, 31687 }, nStack = 1,nStatus = ITEMSTATUS_LOCK },
        { tbProp = { 2, 1, 31688 }, nStack = 2,nStatus = ITEMSTATUS_LOCK },
    }
    KsgAward:Give(tbAward, 'Nh�n b� L�ng S��ng')
end

---Nh�n item Thi�n Th�ch Tinh Th�ch m�i ng�y
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_ThienThachTinhThach(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 1009 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Thi�n Th�ch Tinh Th�ch
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n item Qu�n C�ng Vinh D� m�i ng�y
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_QuanCongVinhDu(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 30642}, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Thi�n Th�ch Tinh Th�ch
    };
    WAward:Give(tbAward, "item_newbie_card");
end

function _w_newbie_Buy_TienDieu()
    if not KsgLib:HasEnoughBagRoom(5) then
        return WEnv.RETCODE_NEEDROOM
    end

    local tbCondition = {
        tbItems = {
            { tbProp = { 2, 95, 204 }, nCount = 10 }, -- thi�n cang l�nh
            { tbProp = { 2, 1, 30370 }, nCount = 10 }, -- thi�n m�n kim l�nh
        },
    }
    if KsgLib:PayMaterial(tbCondition) then
        KsgAward:Give({
            tbProp = { 2, 20, 24 }, nStack = 1, nStatus = 4
        }, "Mua Ti�n �i�u")
    else
        return WEnv.RETCODE_CONSUMEERROR;
    end
end

---Nh�n item Linh ph�ch ��n m�i ng�y
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_LinhPhachDon(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 31239}, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Linh Ph�ch ��n
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n T�y T�m Luy�n L�
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_TayTamLuyenLo(nLevel, nAmount)
    nLevel = tonumber(nLevel) or 0;
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {};

    if nLevel == -1 or nLevel == 1 then
        tinsert(tbAward, { tbProp = { 2, 1, 30521 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- T�y T�m Th�ch Lv1
        tinsert(tbAward, { tbProp = { 2, 1, 30527 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- Luy�n L� Thi�t Lv1
    end
    
    if nLevel == -1 or nLevel == 2 then
        tinsert(tbAward, { tbProp = { 2, 1, 30522 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- T�y T�m Th�ch Lv2
        tinsert(tbAward, { tbProp = { 2, 1, 30528 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- Luy�n L� Thi�t Lv2
    end
    
    if nLevel == -1 or nLevel == 3 then
        tinsert(tbAward, { tbProp = { 2, 1, 30523 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- T�y T�m Th�ch Lv3
        tinsert(tbAward, { tbProp = { 2, 1, 30529 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- Luy�n L� Thi�t Lv3
    end

    if nLevel == -1 or nLevel == 4 then
        tinsert(tbAward, { tbProp = { 2, 1, 30524 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- T�y T�m Th�ch Lv4
        tinsert(tbAward, { tbProp = { 2, 1, 30530 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- Luy�n L� Thi�t Lv4
    end

    if nLevel == -1 or nLevel == 5 then
        tinsert(tbAward, { tbProp = { 2, 1, 30525 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- T�y T�m Th�ch Lv5
        tinsert(tbAward, { tbProp = { 2, 1, 30531 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- Luy�n L� Thi�t Lv5
    end

    if nLevel == -1 or nLevel == 6 then
        tinsert(tbAward, { tbProp = { 2, 1, 30526 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- T�y T�m Th�ch Lv6
        tinsert(tbAward, { tbProp = { 2, 1, 30532 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- Luy�n L� Thi�t Lv6
    end

    if nLevel == -1 or nLevel == 7 then
        tinsert(tbAward, { tbProp = { 2, 1, 31402 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- T�y T�m Th�ch Lv7
        tinsert(tbAward, { tbProp = { 2, 1, 31401 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- Luy�n L� Thi�t Lv7
    end
    if nLevel == -1 or nLevel == 8 then
        tinsert(tbAward, { tbProp = { 2, 1, 31614 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- T�y T�m Th�ch Lv8
        tinsert(tbAward, { tbProp = { 2, 1, 31615 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- Luy�n L� Thi�t Lv8
    end

    if getn(tbAward) > 0 and nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---Nh�n item L�u Kim m�i ng�y
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_LuuKim(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 31096 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- L�u Kim
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n item Thi�n V�n Th�ch m�i ng�y
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_ThienVanThach(nAmount)
    local tbAward = {
        { tbProp = { 2, 201, 13 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Thi�n V�n Th�ch
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n item C� Kim Th�ch c��ng ho� v�n s�c +10 m�i ng�y
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_CoKimThach(nAmount)
    local tbAward = {
        { tbProp = { 2, 201, 14 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- C� Kim Th�ch
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n item C� Kim Th�ch c��ng ho� v�n s�c +10 m�i ng�y
---@param nLevel number C�p �� qu�
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_DaQuy(nLevel, nAmount)
    nLevel = tonumber(nLevel) or 0;
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {};

    if nLevel == -1 or nLevel == 1 then
        tinsert(tbAward, { tbProp = { 2, 1, 30998 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- T�i �� Qu� C�p 1
    end
    if nLevel == -1 or nLevel == 2 then
        tinsert(tbAward, { tbProp = { 2, 1, 30999 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- T�i �� Qu� C�p 2
    end
    if nLevel == -1 or nLevel == 3 then
        tinsert(tbAward, { tbProp = { 2, 1, 31000 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- T�i �� Qu� C�p 3
    end
    if nLevel == -1 or nLevel == 4 then
        tinsert(tbAward, { tbProp = { 2, 1, 31001 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- T�i �� Qu� C�p 4
    end
    if nLevel == -1 or nLevel == 5 then
        tinsert(tbAward, { tbProp = { 2, 1, 31024 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- T�i �� Qu� C�p 5
    end
    if nLevel == -1 or nLevel == 6 then
        tinsert(tbAward, { tbProp = { 2, 1, 31123 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- T�i �� Qu� C�p 6
    end

    if getn(tbAward) > 0 and nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

----------------------------------------------------------------------------------------------------

---Nh�n b� trang b� �m Huy�t
---@param nLevel number C��ng ho� trang b�
function _w_newbie_Give_AmHuyet(nLevel)
    WItem:AddSuit_AmHuyet(nLevel, ITEMSTATUS_LOCK, GIVETYPE_SUIT_RING_WEAPON, "item_newbie_card");
end

---Nh�n b� trang b� Thanh Long T��ng
---@param nLevel number C��ng ho� trang b�
function _w_newbie_Give_ThanhLongTuong(nLevel)
    nLevel = tonumber(nLevel) or 0;
    KsgItem:AddBattleSuit_ThanhLong_Tuong(nLevel, BATTLE_ITEM_TYPE_SUIT_RING_WEAPON);

end
---Nh�n b� trang b� Chu Tuoc T��ng
---@param nLevel number C��ng ho� trang b�
function _w_newbie_Give_ChuTuocTuong(nLevel)
    nLevel = tonumber(nLevel) or 0;
    KsgItem:AddBattleSuit_ChuTuoc_Tuong(nLevel, BATTLE_ITEM_TYPE_SUIT_RING_WEAPON);
end
function _w_newbie_Give_ChuTuocSoai(nLevel)
    nLevel = tonumber(nLevel) or 0;
    KsgItem:AddBattleSuit_ChuTuoc_Soai(nLevel, BATTLE_ITEM_TYPE_SUIT_RING_WEAPON);
end
function _w_newbie_Give_ThanUng(nLevel,nType)
    nLevel = tonumber(nLevel) or 0;
    nType= tonumber(nType) or 1;
    if (nType==1) then
        KsgItem:AddBattleSuit_ThanUng_Tuong(nLevel, BATTLE_ITEM_TYPE_SUIT_RING_WEAPON);
    else
        KsgItem:AddBattleSuit_ThanUng_Soai(nLevel, BATTLE_ITEM_TYPE_SUIT_RING_WEAPON);
    end

end



---Nh�n b� trang b� Thanh Long So�i
---@param nLevel number C��ng ho� trang b�
function _w_newbie_Give_ThanhLongSoai(nLevel)
    nLevel = tonumber(nLevel) or 0;
    KsgItem:AddBattleSuit_ThanhLong_Soai(nLevel, BATTLE_ITEM_TYPE_SUIT_RING_WEAPON);
end
function _w_newbie_Give_ThanhLongSoai_HT()
    local nLevel = 7;
    KsgItem:AddBattleSuit_ThanhLong_Soai(nLevel, BATTLE_ITEM_TYPE_SUIT_RING_WEAPON);
    WTask:SetBit(WTASKID_NEWBIE_BIT_GIVE_STATUS,WTASKID_NEWBIE_BIT_GIVE_THANHLONGSOAI,1);
end



---Nh�n b� trang b� Ho� Ph�ng So�i
---@param nLevel number C��ng ho� trang b�
function _w_newbie_Give_HoaPhungSoai(nLevel)
    nLevel = tonumber(nLevel) or 0;
    KsgItem:AddBattleSuit_HoaPhung_Soai(nLevel, BATTLE_ITEM_TYPE_SUIT_RING_WEAPON);
end

---Nh�n b� trang b� Uy H� T��ng
---@param nLevel number C��ng ho� trang b�
function _w_newbie_Give_UyHoTuong(nLevel)
    nLevel = tonumber(nLevel) or 0;
    KsgItem:AddBattleSuit_UyHo_Tuong(nLevel, BATTLE_ITEM_TYPE_SUIT_RING_WEAPON);
end

---Nh�n b� trang b� Uy H� So�i
---@param nLevel number C��ng ho� trang b�
function _w_newbie_Give_UyHoSoai(nLevel)
    nLevel = tonumber(nLevel) or 0;
    KsgItem:AddBattleSuit_UyHo_Soai(nLevel, BATTLE_ITEM_TYPE_SUIT_RING_WEAPON);
end

---Nh�n b� trang b� V�n S�c Lv3 + C� Kim Th�ch
---@param nAmount number S� l��ng C� Kim Th�ch c�n add
function _w_newbie_Give_VanSuc3(nAmount)
    nAmount = tonumber(nAmount) or 0;
    if nAmount > 0 then
        local tbAward = {
            { tbProp = { 2, 201, 14 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- C� Kim Th�ch
        };
        WAward:Give(tbAward, "item_newbie_card");
    end
    WItem:AddSuit_VanSuc(3, ITEMSTATUS_LOCK, "item_newbie_card");
end

---Nh�n b� trang b� V�n S�c Lv4 + C� Kim Th�ch
---@param nAmount number S� l��ng C� Kim Th�ch c�n add
function _w_newbie_Give_VanSuc4(nAmount)
    nAmount = tonumber(nAmount) or 0;
    if nAmount > 0 then
        local tbAward = {
            { tbProp = { 2, 201, 14 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- C� Kim Th�ch
        };
        WAward:Give(tbAward, "item_newbie_card");
    end
    WItem:AddSuit_VanSuc(4, ITEMSTATUS_LOCK, "item_newbie_card");
end

---Nh�n b� trang b� V�n S�c Lv4 + C� Kim Th�ch
---@param nAmount number S� l��ng C� Kim Th�ch c�n add
function _w_newbie_Give_VanSuc5(nAmount)
    nAmount = tonumber(nAmount) or 0;
    if nAmount > 0 then
        local tbAward = {
            { tbProp = { 2, 201, 14 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- C� Kim Th�ch
        };
        WAward:Give(tbAward, "item_newbie_card");
    end
    WItem:AddSuit_VanSuc(5, ITEMSTATUS_LOCK, "item_newbie_card");
end

---Nh�n 3 b� trang b� Kim X� Lv6
---@param nLevel number C��ng ho� trang b�
function _w_newbie_Give_KimXa6(nLevel, nSelectIdx)
    ----nSelectIdx = nSelectIdx or 0;
    ----if nSelectIdx == 0 then
    ----    local tbSay = { "Ch�n <color=yellow>1 b� trang b� Kim x� d��i ��y<color>, h�y suy ngh� k� tr��c khi ch�n!" };
    ----    for nType, szName in g_tbKimXaCfg[nLevel] do
    ----        tinsert(tbSay, format("Ta mu�n nh�n b� %s/#_w_newbie_Give_KimXa6(%d)", szName, nType));
    ----    end
    ----    tinsert(tbSay, "Ta ch�a mu�n nh�n b�y gi�/nothing");
    ----    WNpc:SayDialog(tbSay);
    ----    return WEnv.RETCODE_NEEDCONFIRM;
    ----end

    --- Give award
    nLevel = tonumber(nLevel) or 0;
    KsgAward:AddKimXa(6, nLevel, KIMXA_TYPE_KHANGTATCA, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
    KsgAward:AddKimXa(6, nLevel, KIMXA_TYPE_NGOAICONG, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
    KsgAward:AddKimXa(6, nLevel, DAME_TYPE_NOICONG, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
end

---Nh�n 3 b� trang b� Kim X� Lv7
---@param nLevel number C��ng ho� trang b�
function _w_newbie_Give_KimXa7(nLevel, nSelectIdx)
    ----nSelectIdx = nSelectIdx or 0;
    ----if nSelectIdx == 0 then
    ----    local tbSay = { "Ch�n <color=yellow>1 b� trang b� Kim x� d��i ��y<color>, h�y suy ngh� k� tr��c khi ch�n!" };
    ----    for nType, szName in g_tbKimXaCfg[nLevel] do
    ----        tinsert(tbSay, format("Ta mu�n nh�n b� %s/#_w_newbie_Give_KimXa6(%d)", szName, nType));
    ----    end
    ----    tinsert(tbSay, "Ta ch�a mu�n nh�n b�y gi�/nothing");
    ----    WNpc:SayDialog(tbSay);
    ----    return WEnv.RETCODE_NEEDCONFIRM;
    ----end

    --- Give award
    nLevel = tonumber(nLevel) or 0;
    KsgAward:AddKimXa(7, nLevel, KIMXA_TYPE_KHANGTATCA, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
    KsgAward:AddKimXa(7, nLevel, KIMXA_TYPE_NGOAICONG, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
    KsgAward:AddKimXa(7, nLevel, DAME_TYPE_NOICONG, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
end
function _w_newbie_Give_KXLenh(nLevel)
    local tbAward = {
        { tbProp = { 2, 1, 40099 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- Hoan L�ng L�nh (Phi Phong)
        { tbProp = { 2, 1, 40100 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- Hoan L�ng L�nh (Huy Ch��ng)
        { tbProp = { 2, 1, 40101 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- Hoan L�ng L�nh (Chi�n H�i)

        { tbProp = { 2, 1, 40102 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- ��ng Giao L�nh (Phi Phong)
        { tbProp = { 2, 1, 40103 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- ��ng Giao L�nh (Huy Ch��ng)
        { tbProp = { 2, 1, 40104 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- ��ng Giao L�nh (Chi�n H�i)

        { tbProp = { 2, 1, 40105 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- Kh�i Ph��ng L�nh (Phi Phong)
        { tbProp = { 2, 1, 40106 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- Kh�i Ph��ng L�nh (Huy Ch��ng)
        { tbProp = { 2, 1, 40107 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- Kh�i Ph��ng L�nh (Chi�n H�i)
        ----Thiet tinh 4 up level
        { tbProp = { 2, 1, 30612 }, nStack = 5000, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- thiet tinh 4
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_newbie_Give_KimXa9(nLevel, nSelectIdx)
    ----nSelectIdx = nSelectIdx or 0;
    ----if nSelectIdx == 0 then
    ----    local tbSay = { "Ch�n <color=yellow>1 b� trang b� Kim x� d��i ��y<color>, h�y suy ngh� k� tr��c khi ch�n!" };
    ----    for nType, szName in g_tbKimXaCfg[nLevel] do
    ----        tinsert(tbSay, format("Ta mu�n nh�n b� %s/#_w_newbie_Give_KimXa6(%d)", szName, nType));
    ----    end
    ----    tinsert(tbSay, "Ta ch�a mu�n nh�n b�y gi�/nothing");
    ----    WNpc:SayDialog(tbSay);
    ----    return WEnv.RETCODE_NEEDCONFIRM;
    ----end

    --- Give award
    nLevel = tonumber(nLevel) or 0;
    KsgAward:AddKimXa(9, nLevel, KIMXA_TYPE_KHANGTATCA, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
    KsgAward:AddKimXa(9, nLevel, KIMXA_TYPE_NGOAICONG, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
    KsgAward:AddKimXa(9, nLevel, DAME_TYPE_NOICONG, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
end
---Nh�n b� trang b� Chi�n Cu�ng
---@param nLevel number C��ng ho� trang b�
function _w_newbie_Give_ChienCuong(nLevel)
    WItem:AddSuit_ChienCuong(nLevel, ITEMSTATUS_LOCK, GIVETYPE_SUIT_RING_WEAPON, "item_newbie_card");
end

---Nh�n b� trang b� Di�u D��ng
---@param nLevel number C��ng ho� trang b�
function _w_newbie_Give_DieuDuong(nLevel)
    WItem:AddSuit_DieuDuong(nLevel, ITEMSTATUS_LOCK, GIVETYPE_SUIT_RING_WEAPON, "item_newbie_card");
end

---Nh�n b� S�t Tinh
---@param nLevel table
---@param nStatus table
function _w_newbie_Give_SatTinh(nLevel, nStatus)
    nLevel = nLevel or 0;
    nStatus = nStatus or ITEMSTATUS_LOCK;

    local tbAward = {
        { tbProp = { 2, 1, 40001 }, nStack = 1, nStatus = nStatus, nLevel = nLevel }, -- S�t Tinh L�nh B�i (��u)
        { tbProp = { 2, 1, 40002 }, nStack = 1, nStatus = nStatus, nLevel = nLevel }, -- S�t Tinh L�nh B�i (�o)
        { tbProp = { 2, 1, 40003 }, nStack = 1, nStatus = nStatus, nLevel = nLevel }, -- S�t Tinh L�nh B�i (Qu�n)
        { tbProp = { 2, 1, 40004 }, nStack = 1, nStatus = nStatus, nLevel = nLevel }, -- S�t Tinh L�nh B�i (V� Kh�)
        { tbProp = { 2, 1, 40005 }, nStack = 2, nStatus = nStatus }, -- S�t Tinh L�nh B�i (Trang S�c)
    }
    WAward:Give(tbAward, 'Nh�n b� S�t Tinh')
end

---Nh�n b� trang b� Kim X� Lv3 + 500 T�y T�m + 500 Luy�n L�
---@param nLevel number C��ng ho� trang b�
function _w_newbie_Give_KimXa3(nLevel)
    nLevel = tonumber(nLevel) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 30523 }, nStack = 500, nStatus = ITEMSTATUS_LOCK }, -- T�y T�m Th�ch Lv3
        { tbProp = { 2, 1, 30529 }, nStack = 500, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� Thi�t Lv3
    }
    WAward:Give(tbAward, "item_newbie_card");
    KsgAward:AddKimXa(3, nLevel, 0, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
end

---Nh�n b� trang b� s� m�n Lv3
---@param nLevel number C��ng ho� trang b�
function _w_newbie_Give_SuMon3(nLevel)
    WItem:AddSuit_SuMon3(nLevel, ITEMSTATUS_LOCK, GIVETYPE_SUIT_RING_WEAPON, "item_newbie_card");
end

---Nh�n b� trang b� s� m�n Lv4
---@param nLevel number C��ng ho� trang b�
function _w_newbie_Give_SuMon4(nLevel)
    WItem:AddSuit_SuMon4(nLevel, ITEMSTATUS_LOCK, GIVETYPE_SUIT_RING_WEAPON, "item_newbie_card");
end

---Nh�n b� trang b� s� m�n Lv5
---@param nLevel number C��ng ho� trang b�
function _w_newbie_Give_SuMon5(nLevel)
    WItem:AddSuit_SuMon5(nLevel, ITEMSTATUS_LOCK, GIVETYPE_SUIT_RING_WEAPON, "item_newbie_card");
end

---Nh�n b� trang b� buff 35%
---@param nLevel number C��ng ho� trang b�
function _w_newbie_Give_SetBuff(nLevel)
    ---Nh�n T�y T�m Luy�n L�
    ---@param nAmount number S� l��ng c�n add
    WItem:AddSuit_Buff35(nLevel, ITEMSTATUS_LOCK, GIVETYPE_SUIT_RING_WEAPON, "item_newbie_card");
end

-------------------------------------------------------------------------------------------------------


---Nh�n B�t Tr�n Ch�u
---@param nAmount number S� l��ng c�n add

-------------------------------------------------------------------------------------------------------

---Nh�n k�ch ho�t ho� c�nh
---@param nBigLevel number Level sau khi ho�n t�t
function _w_newbie_Give_ChuyenSinh(nBigLevel, nSelectIdx)
    nSelectIdx = tonumber(nSelectIdx) or 0;
    if nSelectIdx == 0 then
        local tbSay = { "Ch�n h��ng chuy�n sinh:" };
        for nRebornRoute, szRouteName in pairs(g_tbRebornRouteNames) do
            tinsert(tbSay, format("Chuy�n sinh theo h��ng %s/#_w_newbie_Give_ChuyenSinh(%d, %d)", szRouteName, nBigLevel, nRebornRoute))
        end
        --tinsert(tbSay, "Ta ch�a mu�n nh�n b�y gi�/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    nBigLevel = tonumber(nBigLevel or 1099);
    KsgReborn:PlayerRebornWithNews(nBigLevel, nSelectIdx, "nothing");
end

---Nh�n k�ch ho�t ho� c�nh
---@param nSelectIdx number
function _w_newbie_Give_ChangeChuyenSinh(nSelectIdx)
    nSelectIdx = tonumber(nSelectIdx) or 0;
    if GetLevel() < 99 then
        WNpc:Talk("B�n ch�a �� �i�u ki�n �� chuy�n h��ng", 1);
        return
    end
    if nSelectIdx == 0 then
        local tbSay = { "Ch�n h��ng chuy�n sinh:" };
        for nRebornRoute, szRouteName in pairs(g_tbRebornRouteNames) do
            if type(nRebornRoute) == "number" then
                tinsert(tbSay, format("Chuy�n sinh theo h��ng %s %d/#_w_newbie_Give_ChangeChuyenSinh(%d)", szRouteName, nRebornRoute, nRebornRoute))
            end
        end
        --tinsert(tbSay, "Ta ch�a mu�n nh�n b�y gi�/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    KsgReborn:PlayerRebornWithNew2s(WPlayer:GetBigLevel(), nSelectIdx, "nothing");
    ExitGame();
end

---Nh�n k�ch ho�t ho� c�nh
---@param nLevel number S� t�ng ho� c�nh c�n add
function _w_newbie_Give_HoaCanh(nLevel)
    nLevel = tonumber(nLevel) or 1;
    WPlayer:LevelUpFair(nLevel);
end

-------------------------------------------------------------------------------------------------------

---Nh�n m�t t�ch th�ng th��ng (chi�m y, t� h�, thi�n h� ...)
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_MatTichThongDung(nAmount)
    _w_book_AddCommonBook(nil, nAmount);
end

---Nh�n item Tu Ch�n Y�u Quy�t m�i ng�y
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_TuChan(nAmount)
    local tbAward = {
        { tbProp = { 2, 0, 554 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Tu Ch�n Y�u Quy�t
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n M�t T�ch B� �i�n theo h� ph�i
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_MatTichBiDien(nAmount)
    _w_book_AddBookByType(nAmount, 6);
end

---Nh�n R��ng Y�u Quy�t s� c�p (b� theo h� ph�i)
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_YeuQuyet(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 50005 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- R��ng Y�u Quy�t_S�
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n �i�m Luy�n M�t T�ch, L�ch Luy�n, Tinh V� Ch�n Hoa
---@param nPopur number S� �i�m luy�n
---@param nPopur2 number L�ch Luy�n
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_DiemLuyenMatTich(nPopur, nPopur2, nChanQuyen)
    nPopur = tonumber(nPopur) or 1;
    nPopur2 = tonumber(nPopur2) or 1;
    nChanQuyen = tonumber(nChanQuyen) or 1;
    local tbAward = {
        { nPopur = nPopur },
        { nPopur2 = nPopur2 },
    };

    if nChanQuyen > 0 then
        tinsert(tbAward, { tbProp = { 2, 114, 117 }, nStack = nChanQuyen, nStatus = ITEMSTATUS_LOCK }); -- Ch�n Quy�n Tinh Hoa
    end

    WAward:Give(tbAward, "item_newbie_card");
end

----------------------------------------------------------------------------------------------------

---Nh�n Kinh M�ch V� Th�nh + 900000 Ch�n Kh�
function _w_newbie_Give_KinhMachVoThanh()
    local tbAward = {
        { nMeridianLevel = 6 }, -- V� Th�nh
        { nChanKhi = 900000 },
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n  900000 Ch�n Kh�
function _w_newbie_Give_900KCK()
    local tbAward = {
        { nChanKhi = 900000 },
    };
    WAward:Give(tbAward, "item_newbie_card");
end
-----T�y Ch�n Kh�
function _w_newbie_TayChanKhi()
    MeridianRestore(-1)
    PlaySound("\\sound\\sound_i016.wav")
    --SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end

---Nh�n Kinh M�ch ��ng Nh�n
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_KinhMachDongNhan(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 30730 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Kinh M�ch ��ng Nh�n
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---Nh�n Kinh M�ch Ng�n Nh�n
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_KinhMachNganNhan(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 30731 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Kinh M�ch Ng�n Nh�n
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---Nh�n pet Lv5
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_ChanKhi(nAmount)
    nAmount = nAmount or 0;
    local tbAward = {
        { nChanKhi = nAmount },
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

----------------------------------------------------------------------------------------------------

---Nh�n t�n v�t bang h�i
---@param nLevel number C�p c�a t�n v�t
function _w_newbie_Give_TinVatBangHoi(nLevel)
    nLevel = tonumber(nLevel) or 1;
    if nLevel < 1 then
        nLevel = 1;
    end
    if nLevel > 25 then
        nLevel = 25;
    end
    local tbAward = {
        { tbProp = { 0, 155, nLevel }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- T�n V�t 25
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n danh hi�u bang
---@param nLevel number C�p c�a danh hi�u
function _w_newbie_Give_DanhHieuBangHoi(nLevel)
    nLevel = tonumber(nLevel) or 1;
    if nLevel < 1 then
        nLevel = 1;
    end
    if nLevel > 10 then
        nLevel = 10;
    end
    for i = 1, 10 do
        RemoveTitle(72, i);
    end
    AddTitle(72, nLevel);
    SetCurTitle(72, nLevel);
    WNpc:Talk(format("Nh�n th�nh c�ng hi�u bang c�p %d", nLevel), WEnv.TRUE);
end

----------------------------------------------------------------------------------------------------

---Nh�n ph�c sinh pet 1+2
---@param nSelectIdx number L�a ch�n n�i ngo�i c�ng
function _w_newbie_Give_PhucSinhPet1(nSelectIdx)
    local nIsPS_lan1 = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B) / 10), 10);
    if nIsPS_lan1 >= 1 then
        WNpc:Talk("B�n ��ng h�nh c�a ��i hi�p �� ph�c sinh l�n 1 r�i, �� qu� m�nh r�i!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end

    nSelectIdx = nSelectIdx or 0;
    if nSelectIdx == 0 then
        local tbSay = { "H�y ch�n h��ng ph�c sinh cho b�n ��ng h�nh c�a <sex>:" };
        tinsert(tbSay, "H� tr� h� N�i C�ng/#_w_newbie_Give_PhucSinhPet1(1)");
        tinsert(tbSay, "H� tr� h� Ngo�i C�ng/#_w_newbie_Give_PhucSinhPet1(2)");
        --tinsert(tbSay, "Ta ch�a mu�n nh�n b�y gi�/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    --- Give award
    _w_newbie_Give_PhucSinhPet1_AddBuff(nSelectIdx);
end
function _w_newbie_Give_PhucSinhPet1_AddBuff(nWay)
    local tNoiNgoai = {
        [1] = {
            { "N�i C�ng 6%", "state_m_attack_percent_add", 6 },
            { "Sinh L�c +6000", "state_life_max_point_add", 8000 },
            { "Sinh L�c 6%", "state_life_max_percent_add", 6 },
            { "Kh�ng t�t c� +12", "state_add_allability", 12 },
        },
        [2] = {
            { "Ngo�i C�ng 12%", "state_p_attack_percent_add", 12 },
            { "Sinh L�c +6000", "state_life_max_point_add", 10000 },
            { "Sinh L�c 6%", "state_life_max_percent_add", 6 },
            { "N�i ph�ng/Ngo�i ph�ng +60", "state_i_defence_point_add", 60 },
            { "Ngo�i ph�ng +60", "state_o_defence_point_add", 60 },
        },
    }

    local t_pet_type = {
        [1] = { "Th� tr�ng", 3333, 24 },
        [2] = { "Th� x�m", 3333, 25 },
        [3] = { "Th� �en", 3334, 26 },
    }

    ------------------------------
    local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B) / 10); --mod 10 l� gi� tr� x�c ��nh c� Ph�c Sinh PET
    nIsPS = (nIsPS + 1) * 10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B), 10);
    SetTask(TSK_PET_PS_GIAIDOAN_B, nIsPS); --set gi� tr� x�c ��nh c� Ph�c Sinh PET
    -------------
    local nCount_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A) / 10);
    nCount_PET_PS = (nCount_PET_PS + 1) * 10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_A), 10);
    SetTask(TSK_PET_PS_GIAIDOAN_A, nCount_PET_PS); --set gi� tr� x�c ��nh s� l�n Ph�c Sinh PET
    -------------
    local nNewValue = SetBytePos(GetTask(TSK_PET_PS_GIAIDOAN_A), nWay, 4);
    SetTask(TSK_PET_PS_GIAIDOAN_A, nNewValue); -- set h��ng Ph�c Sinh c�a PET
    ------------- set c�c ch� s� buff
    local nAttrId = 2908130; --29/08/13 + x
    for i = 1, getn(tNoiNgoai[nWay]) do
        CastState(tNoiNgoai[nWay][i][2], tNoiNgoai[nWay][i][3], -1, 1, nAttrId);
        nAttrId = nAttrId + 1;
    end
    ------------- add PET m�i
    local nRand = gf_GetRandItemByTable(t_pet_type, 10000, 1);
    local nNewType = t_pet_type[nRand][3];
    local nResult = AddPet(nNewType);
    if nResult >= 0 then
        WNpc:Talk("Ch�c m�ng <sex> �� chi�u m� B�n ��ng H�nh th�nh c�ng!", WEnv.TRUE);
    else
        gf_WriteLogEx("PHUC SINH PET BK", "add th�t b�i", 1, "Add pet th�t b�i");
    end
    -------------
    WNpc:Talk("Ch�c m�ng <sex> �� ho�n th�nh ph�c sinh B�n ��ng H�nh l�n 1!", WEnv.TRUE);
    gf_WriteLogEx("PHUC SINH PET BK", "xong giai �o�n 2", 1, "Ho�n th�nh Giai �o�n buff")

    _w_newbie_Give_PhucSinhPet2();
end
function _w_newbie_Give_PhucSinhPet2()
    --- bu�c ph�i ps l�n 1 m�i cho ch�n d�ng 2
    local nIsPS_lan1 = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B) / 10), 10);
    local nIsPS_lan2 = floor(GetTask(TSK_PET_PSLAN2_TASK_1) / 1000000000);
    if nIsPS_lan1 < 1 then
        WNpc:Talk("H�y ph�c sinh B�n ��ng H�nh c�a ��i hi�p l�n 1 xong r�i h�y ��n g�p ta!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end
    if nIsPS_lan2 >= 1 then
        Talk(1, "", "B�n ��ng h�nh c�a ��i hi�p �� ph�c sinh l�n 2 r�i, �� qu� m�nh r�i!");
        WNpc:Talk("B�n ��ng h�nh c�a ��i hi�p �� ph�c sinh l�n 2 r�i, �� qu� m�nh r�i!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end

    --- Give award
    VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_1, 1, 10, 10); -- t�ng b��c nhi�m v� l�n gi� tr� 1 l� �� ph�c sinh pet l�n 2 th�nh c�ng
    VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_2, 2, 10, 10);  -- t�ng b��c nhi�m v� l�n gi� tr� 2 l� ho�n th�nh chu�i nhi�m v�
    AddTitle(77, 1); -- title ph�c sinh b�n ��ng h�nh l�n 2
    WNpc:Talk("Ch�c m�ng <sex> �� ho�n th�nh ph�c sinh B�n ��ng H�nh l�n 2!", WEnv.TRUE);
    gf_WriteLogEx("PHUC SINH PET LAN 2", "Ho�n th�nh nhanh PS Pet l�n 2", 1, "Ho�n th�nh nhanh nv PS Pet l�n 2");
end

---Nh�n pet Lv5
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_HacBachKy(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 31168 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- H�c B�ch K�
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n s�ch pet c�p 6
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_SachPetLv6(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 40037 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- T�i K� N�ng B�H Lv6
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n s�ch pet c�p 7
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_SachPetLv7(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 40038 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- T�i K� N�ng B�H Lv6
    };
    WAward:Give(tbAward, "item_newbie_card");
end
---Nh�n ��a Linh Tinh hoa
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_DiaLinhTinhHoa(nAmount)
    local tbAward = {
        { tbProp = {  2, 1, 31600}, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- ��a Linh Tinh Hoa
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n 4 Linh Ph�ch ��n + 5 H�i Ti�n ��n
function _w_newbie_Give_NguyenLieuHoaCanh(nLinhPhachDonAmount, nHoiTienDonAmount)
    local tbAward = {
        { tbProp = { 2, 1, 31239 }, nStack = nLinhPhachDonAmount, nStatus = ITEMSTATUS_LOCK }, -- Linh Ph�ch ��n
        { tbProp = { 2, 1, 30847 }, nStack = nHoiTienDonAmount, nStatus = ITEMSTATUS_LOCK }, -- H�i Ti�n ��n
    };
    WAward:Give(tbAward, "item_newbie_card");
end

----------------------------------------------------------------------------------------------------

---@param nLevel number C�p c�a �� qu� 1-5, -1 l� nh�n t�t c�
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_HuyetBoDe(nAmount)

    local tbAward = {
        { tbProp = { 2,1,31241 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- huy�t B� ��
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---Nh�n B�ng Th�ch, M�nh B�ng Th�ch s�a ��
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_RepairStone(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 148 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- M�nh B�ng Th�ch
        { tbProp = { 2, 1, 149 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- B�ng Th�ch
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---Nh�n c�c lo�i �� m�i damage Lv1->Lv3
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_DaMai(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 30428 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Ma �ao Th�ch C�p 1
        { tbProp = { 2, 1, 30429 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Ma �ao Th�ch C�p 2
        { tbProp = { 2, 1, 30430 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Ma �ao Th�ch C�p 3
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---Nh�n �i�m Ti�u Y Ph��ng + Phong Hoa
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_NgoaiTrang(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { nCollectionCoin = nAmount },
        { nPhongHoa = nAmount },
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---Nh�n c�c danh hi�u th�ng th��ng (ph� qu�n + chi�n cu�ng)
function _w_newbie_Give_NormalTitle()
    RemoveTitle(65, 3);
    RemoveTitle(70, 1);
    AddTitle(65, 3);
    AddTitle(70, 1);
    SetCurTitle(70, 1);
    WNpc:Talk("<sex> �� nh�n ���c danh hi�u Chi�n Cu�ng, Ph� Qu�n!", WEnv.TRUE);
end

---Nh�n c�c lo�i m�u, l�c
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_Medicine(nAmount)
    nAmount = tonumber(nAmount) or 0;

    local tbAward = {
        { tbProp = { 1, 0, 4 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- B�ch V�n T�n
        { tbProp = { 1, 0, 6 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- H�c Ng�c �o�n T�c Cao
        { tbProp = { 1, 0, 9 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- ��i Ho�n ��n
        { tbProp = { 1, 0, 11 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- V�n V�t Quy Nguy�n ��n
        { tbProp = { 1, 0, 14 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Ng�c Linh T�n
        { tbProp = { 1, 0, 16 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Sinh Sinh H�a T�n
        { tbProp = { 1, 0, 21 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- B�n Tinh Nguy�t ��n
        { tbProp = { 1, 0, 26 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- ��i Nh�t D��ng T�n
        { tbProp = { 1, 0, 32 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- C�u Chuy�n Ho�n H�n �an
        { tbProp = { 1, 1, 1 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- B�nh Ng�
        { tbProp = { 1, 1, 15 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- B�nh B�t V�ng
        { tbProp = { 1, 1, 17 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Minh Nguy�t D�
        { tbProp = { 1, 1, 19 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- T�y B�c V�ng

        { tbProp = { 1, 0, 30012 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Linh Chi T�c M�nh Ho�n
        { tbProp = { 1, 0, 30013 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Dao Tr� ��i Ho�n ��n
        { tbProp = { 1, 0, 30014 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Tuy�t S�m Ph�n Kh� Ho�n
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---Nh�n v�ng, ��n v� t�nh l� ��ng
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_Money(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { nGold = nAmount }, -- V�ng
        --{ tbProp = { 2, 1, 539 }, nStack = nQuantity, nStatus = ITEMSTATUS_LOCK }, -- Ho�ng Kim ��i H�ng Bao
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---Nh�n Th�n H�nh B�o �i�n
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_ThanHanh(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 0, 200, 40 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Th�n H�nh B�o �i�n
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---Nh�n ��i ��nh H�n gi� c��ng ho� +10 tr� l�n
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_DaiDinhHon(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 1113 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- ��i ��nh H�n
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---Nh�n ng�u nhi�n th� c��i
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_ThuCuoi(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 0, 105, 184 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK, nRate = 12.5 }, -- L�c �� C�u Tr�ng
        { tbProp = { 0, 105, 185 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK, nRate = 12.5 }, -- L�c �� C�u �en
        { tbProp = { 0, 105, 186 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK, nRate = 12.5 }, -- L�c �� C�u N�u
        { tbProp = { 0, 105, 187 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK, nRate = 12.5 }, -- L�c �� C�u S�a
        { tbProp = { 0, 105, 188 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK, nRate = 12.5 }, -- B�ch Anh
        { tbProp = { 0, 105, 189 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK, nRate = 12.5 }, -- B�ch Hoa
        { tbProp = { 0, 105, 191 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK, nRate = 12.5 }, -- B�ch Khu�
        { tbProp = { 0, 105, 200 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK, nRate = 12.5 }, -- Phong Ngh�
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---Nh�n Thi�t Tinh Lv1->Lv4
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_NLNuoiKimXa(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 30533 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Thi�t Tinh Lv1
        { tbProp = { 2, 1, 30534 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Thi�t Tinh Lv2
        { tbProp = { 2, 1, 30535 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Thi�t Tinh Lv3
        { tbProp = { 2, 1, 30612 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Thi�t Tinh Lv4
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

----------------------------------------------------------------------------------------------------

---Nh�n V� Song Chi�n Th�n
---@param nLevel number C��ng ho� trang b�
function _w_newbie_Give_VoSongChienThan(nLevel)
    nLevel = tonumber(nLevel) or 0;
    WItem:AddSuit_VoSongChienThan(nLevel, ITEMSTATUS_LOCK, "item_newbie_card");
    local tbAward = {
        { tbProp = { 2, 1, 30525 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- T�y T�m Th�ch Lv5
        { tbProp = { 2, 1, 30531 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� Thi�t Lv5
    };
    WAward:Give(tbAward, "item_newbie_card");
end

----------------------------------------------------------------------------------------------------

---Nh�n M�nh B� �i�n 27%
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_ManhBiDien27(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 40048 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- M�nh B� �i�n 27
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n M�nh B� �i�n 30%
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_ManhBiDien30(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 40049 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- M�nh B� �i�n 30
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n danh hi�u Ph� V��ng 7 ng�y
function _w_newbie_Give_DanhHieuPhaVuong()
    AddTitle(200, 1);
    SetTitleTime(200, 1, GetTime() + DATETIME_SEC_ONE_WEEK);
    SetCurTitle(200, 1);
    WNpc:Talk("<sex> �� nh�n ���c danh hi�u Ph� V��ng h�n 7 ng�y", WEnv.TRUE);
end

---Nh�n danh hi�u chi�n th�n 7 ng�y
function _w_newbie_Give_DanhHieuChienThan()
    AddTitle(200, 2);
    SetTitleTime(200, 2, GetTime() + DATETIME_SEC_ONE_WEEK);
    SetCurTitle(200, 2);
    WNpc:Talk("<sex> �� nh�n ���c danh hi�u Chi�n Th�n h�n 7 ng�y", WEnv.TRUE);
end

---Nh�n item Ch�n V� H�n Th�ch
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_ChanVoHonThach(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 114, 143 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Ch�n V� H�n Th�ch
    };

    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n item ��i ��nh H�n
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_DaiDinhHon(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 1113 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- ��i ��nh H�n
    };

    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n item �� M�i v� kh�
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_BuaCuongHoa(nLevel, nAmount)
    nLevel = tonumber(nLevel) or 0;
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {};

    if nLevel == -1 or nLevel == 12 then
        tinsert(tbAward, { tbProp = { 2, 1, 30424 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- C��ng h�a quy�n 12
    end
    if nLevel == -1 or nLevel == 13 then
        tinsert(tbAward, { tbProp = { 2, 1, 30425 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- C��ng h�a quy�n 13
    end
    if nLevel == -1 or nLevel == 14 then
        tinsert(tbAward, { tbProp = { 2, 1, 30426 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- C��ng h�a quy�n 14
    end
    if nLevel == -1 or nLevel == 15 then
        tinsert(tbAward, { tbProp = { 2, 1, 30427 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- C��ng h�a quy�n 15
    end

    if getn(tbAward) > 0 and nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---Nh�n item Thi�n Cang L�nh
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_ThienCangLenh(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 95, 204 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Thi�n Cang L�nh
    };

    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n item Thi�n M�n Kim L�nh
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_ThienMonKimLenh(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 30370 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Thi�n M�n Kim L�nh
    };

    WAward:Give(tbAward, "item_newbie_card");
end

---Nh�n item manh Tuy Bien Chau
---@param nAmount number S� l��ng c�n add
function _w_newbie_Give_ManhTuyBienChau(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 40046 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- m�nh T�y bi�n ch�u
    };

    WAward:Give(tbAward, "item_newbie_card");
end
-----Mua B�t Nh� nh�- 50 v�ng/1
function _w_newbie_Buy_BatNhaLon(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 0, 504 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, --
    };
    if Pay(nAmount * 500000) == 1 then
        WAward:Give(tbAward, "item_newbie_card");
    else
        WNpc:Talk("Hi�n kh�ng �� v�ng");
    end
    --WAward:Give(tbAward, "item_newbie_card");
end
-----Mua T�i Hat Giong- 200 v�ng/1
function _w_newbie_Buy_HatGiong(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 30087 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Thi�n M�n Kim L�nh
    };
    if Pay(nAmount * 2000000) == 1 then
        WAward:Give(tbAward, "item_newbie_card");
    else
        WNpc:Talk("Hi�n kh�ng �� v�ng");
    end
    --WAward:Give(tbAward, "item_newbie_card");
end

function _w_newbie_Give_ThanhLongHon(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 31194 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Thi�n M�n Kim L�nh
    };

    WAward:Give(tbAward, "item_newbie_card");
end
------------------ h�m b�n g�i Thanh V�n Gi�i H�n
function SplitString(szData)
    tbDataTemp = {}
    while strlen(szData) > 0 do
        local nPosition = strfind(szData," ")
        local szDataTemp = ""
        if nPosition ~= nil then
            szDataTemp = strsub(szData,1,nPosition-1)
            szData = strsub(szData, nPosition + 1, strlen(szData))
        else
            szDataTemp = szData
            szData =""
        end
        tinsert(tbDataTemp, szDataTemp)
    end
    return tbDataTemp
end
function _get_thanhvan_count()
    local fileName = ""
    if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
        fileName = "data\\thanhvan_limit.txt";
    else
        fileName = "data/thanhvan_limit.txt";
    end
    local pf = openfile(fileName, "r");
    if not pf then
        return 0;
    end
    local str = read(pf, "*l");
    if not str then
        closefile(pf);
        return 0;
    end
    closefile(pf);
    return tonumber(str) or 0;
end
------------------
function _save_thanhvan_count(nCount)
    local fileName = ""
    if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
        fileName = "data\\thanhvan_limit.txt";
    else
        fileName = "data/thanhvan_limit.txt";
    end
    local pf = openfile(fileName, "w")
    if not pf then return end
    write(pf, format("%s", nCount))
    closefile(pf);
    return 1
end
--
function _w_newbie_Give_SuMonDanhVong(nPoint)
    local tbAward = {
        nFactionPoint = nPoint,
        nRepute = nPoint,
    };
    WAward:Give(tbAward, "item_test_card");
end

function _w_newbie_Nhan3TrieuCongTrang()
    local nHonorBefore = WPlayer:GetHonor();
    local nHonorSet = 3000000;
    if nHonorBefore > nHonorSet then
        WNpc:Talk("Ta ch� gi�p c�c nh�n s� c� c�ng tr�ng th�p h�n th�i!");
        return WEnv.RETCODE_ERROR;
    end

    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 1, 30490 }, nCount = 1 }, -- Ho�ng Kim ��i Ng�n Phi�u
        }
    };

    if WLib:PayMaterial(tbConsume) ~= WEnv.TRUE then
        return WEnv.RETCODE_CONSUMEERROR;
    end

    local nHonorAward = nHonorSet - nHonorBefore;
    WPlayer:ModifyHonor(nHonorAward);
    --WPlayer:LevelUpFair(160)
    SetTask(3510,100)
    WPlayerLog:WriteBattleLog("npc_tientrang", "Nh�n nhanh 1 tri�u c�ng tr�ng", 0, "", WPlayer:GetExp(), 0, nHonorBefore, nHonorAward, WPlayer:GetBattlePoint(), 0);
end


function _w_newbie_Give_HoaCanh120()
    local nFairLv = GetTask(3510);
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 95, 204 }, nCount = 25 }, -- Thi�n Cang l�nh
            { tbProp = { 2, 1, 30370 }, nCount = 25 }, -- Thi�n m�n Kim L�nh
            { tbProp = { 2, 1, 31239 }, nCount = 15 }, -- Linh Ph�ch ��n
        }
    };
    nLevel = 120;
    if nFairLv <110 or nFairLv >119 then
        Talk(1,"","H�a M�ch ph�i nh� h�n 120 v� l�n h�n 110 m�i ���c nh�n")
        return
    end
    if WLib:PayMaterial(tbConsume) == WEnv.TRUE and WPlayer:LevelUpFair(nLevel)== WEnv.RETCODE_SUCCESS then
        Talk(1,"","Nh�n H�a M�ch 120 th�nh c�ng")
    else
        return WEnv.RETCODE_CONSUMEERROR;
    end
end
function _w_newbie_Give_HoaCanh130()
    local nFairLv = GetTask(3510);
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 95, 204 }, nCount = 50 }, -- Thi�n Cang l�nh
            { tbProp = { 2, 1, 30370 }, nCount = 50 }, -- Thi�n m�n Kim L�nh
            { tbProp = { 2, 1, 31239 }, nCount = 30 }, -- Linh Ph�ch ��n
        }
    };
    nLevel = 130;
    if nFairLv <120 or nFairLv >129 then
        Talk(1,"","H�a M�ch ph�i nh� h�n 130 v� l�n h�n 120 m�i ���c nh�n")
        return
    end
    if WLib:PayMaterial(tbConsume) == WEnv.TRUE and WPlayer:LevelUpFair(nLevel)== WEnv.RETCODE_SUCCESS then
        Talk(1,"","Nh�n H�a M�ch 130 th�nh c�ng")
    else
        return WEnv.RETCODE_CONSUMEERROR;
    end
end
function _w_newbie_Give_VIP122023()
    local nFairLv = GetTask(3510) or 0;
    local nCheckTask= GetTask(WTASKID_TASK_HOAMACHVIPT12_STATUS) or 0
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 95, 204 }, nCount = 75 }, -- Thi�n Cang l�nh
            { tbProp = { 2, 1, 30370 }, nCount = 75 }, -- Thi�n m�n Kim L�nh
            { tbProp = { 2, 1, 31239 }, nCount = 45 }, -- Linh Ph�ch ��n
        }
    };
    local nLevel = 0;
    if nFairLv <140 then
        Talk(1,"H� Th�ng:","H�a M�ch ph�i l�n h�n 140 m�i ���c s� d�ng")
        return
    end
    if nCheckTask==1 then
        Talk(1,"H� Th�ng:","B�n �� nh�n H� Tr� n�y r�i. Kh�ng th� nh�n th�m")
        return
    end
    if nFairLv <150 and nFairLv >=140 then
        nLevel=150
    end
    if nFairLv <160 and nFairLv >=150 then
        nLevel=160
    end
    if nFairLv <170 and nFairLv >=160 then
        nLevel=170
    end
    if nFairLv <180 and nFairLv >=170 then
        nLevel=180
    end
    if nFairLv >=180 then
        Talk(1,"H� Th�ng:","B�n �� ��t max H�a C�nh hi�n t�i kh�ng th� nh�n n�a")
        return
    end
    if WLib:PayMaterial(tbConsume) == WEnv.TRUE and WPlayer:LevelUpFair(nLevel)== WEnv.RETCODE_SUCCESS then
        Talk(1,"","Nh�n H�a M�ch VIP th�nh c�ng")
        SetTask(WTASKID_TASK_HOAMACHVIPT12_STATUS,1)
    else
        return WEnv.RETCODE_CONSUMEERROR;
    end
end
function _w_newbie_Buy_UHT_2024()
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 95, 204 }, nCount = 100 }, -- Thi�n Cang l�nh
            { tbProp = { 2, 1, 30370 }, nCount = 100 }, -- Thi�n m�n Kim L�nh
        }
    };
    --if WLib:PayMaterial(tbConsume) == WEnv.TRUE then
    KsgItem:AddBattleSuit_UyHo_Tuong(15)
    --else
    --    return WEnv.RETCODE_CONSUMEERROR;
    --end
end
function _w_newbie_Buy_VanSuc4_2024()
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 95, 204 }, nCount = 50 }, -- Thi�n Cang l�nh
            { tbProp = { 2, 1, 30370 }, nCount = 50 }, -- Thi�n m�n Kim L�nh
        }
    };
    --if WLib:PayMaterial(tbConsume) == WEnv.TRUE then
    KsgAward:SetVanSuc(4, 1, 1)
    --else
    --    return WEnv.RETCODE_CONSUMEERROR;
    --end
end

function _w_newbie_Buy_KimXa8_2024()
    KsgAward:AddKimXa(8, 10, KIMXA_TYPE_KHANGTATCA, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
    KsgAward:AddKimXa(8, 10, KIMXA_TYPE_NGOAICONG, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
    KsgAward:AddKimXa(8, 10, DAME_TYPE_NOICONG, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
    WTask:SetBit(WTASKID_NEWBIE_BIT_GIVE_STATUS,WTASKID_NEWBIE_BIT_GIVE_KIMXA6,1);
end

function _w_newbie_Give_SetPhaHon()
    local tbAward = {
        { tbProp = { 2, 1, 31529 } },
        { tbProp = { 2, 1, 31530 } },
        { tbProp = { 2, 1, 31531 } },
        { tbProp = { 2, 1, 31532 } },
        { tbProp = { 2, 1, 31533 }, nStack = 2 },
    }
    KsgAward:Give(tbAward, 'Nh�n b� Ph� H�n')
end
function _w_newbie_Buy_QhTuong()
    local nCurRank=GetTask(704);
    if nCurRank==0 then
        WNpc:Talk("B�n ch�a c� qu�n H�m. H�y ra Ti�u Ng�c ��nh gi� Qu�n h�m Tr��c", 1);
        return
    end
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 1, 30230 }, nCount = 500 }, -- Xu v�t ph�m
        }
    };
    if WLib:PayMaterial(tbConsume) == WEnv.TRUE then
        if nCurRank < 0 then
            SetTask(704,-5)
        elseif nCurRank>0 then
            SetTask(704,5)
        end
        WNpc:Talk("Ch�c m�ng b�n �� l�n Qu�n h�m T��ng", 1);
    else
        return WEnv.RETCODE_CONSUMEERROR;
    end
end

function _w_newbie_Buy_QhTuong_Unlimit()
    local nCurRank=GetTask(704);
    if nCurRank==0 then
        WNpc:Talk("B�n ch�a c� qu�n H�m. H�y ra Ti�u Ng�c ��nh gi� Qu�n h�m Tr��c", 1);
        return
    end
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 1, 30230 }, nCount = 3000 }, -- Xu v�t ph�m
        }
    };
    if WLib:PayMaterial(tbConsume) == WEnv.TRUE then
        if nCurRank < 0 then
            SetTask(704,-5);
            SetTask(WTASKID_QHTUONG_UNLIMIT2024_LIEU,1);
        elseif nCurRank>0 then
            SetTask(704,5)
            SetTask(WTASKID_QHTUONG_UNLIMIT2024_TONG,1);
        end
        WNpc:Talk("Ch�c m�ng b�n �� l�n Qu�n h�m T��ng", 1);
    else
        return WEnv.RETCODE_CONSUMEERROR;
    end
end

function _t_newbie_Give_HoTro2024()
    local tbAward = {
        --{ nFunc = "_w_newbie_Give_1500000CongTrang()" }, -- 1500cONGtRANG
        { nFunc = "_w_newbie_Give_UyHoTuong(10)" }, -- uyHoTuong
        { nFunc = "WPlayer:LevelUpFair(140)" }, -- HoaCanh140
        { nFunc = "WItem:AddSuit_VanSuc(4, 4, 'item_newbie_card')" }, -- v�n s�c 4
        { tbProp = { 2, 1, 31307 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Chi�u Y�u K�
        { tbProp = { 2, 1, 31122 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Linh kh� r�c r�
        { tbProp = { 2, 114, 143 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Ch�n v� h�n th�ch
        { tbProp = { 2, 102, 212 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- Th��ng H�i Di Ch�u 5
        { tbProp = { 2, 102, 213 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Th��ng H�i Di Ch�u 6
        { tbProp = { 2, 102, 214 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- Th��ng H�i Di Ch�u 7
        { tbProp = { 2, 1, 31604 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Tinh V�n T�a Linh Th�ch 1
        { tbProp = { 2, 1, 31605 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Tinh V�n T�a Linh Th�ch 2
        { tbProp = { 2, 1, 31606 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Tinh V�n T�a Linh Th�ch 3
        { tbProp = { 2, 1, 31607 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Tinh V�n T�a Linh Th�ch 4
        { tbProp = { 2, 1, 31608 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Tinh V�n T�a Linh Th�ch 5
        { tbProp = { 2, 1, 31609 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Tinh V�n T�a Linh Th�ch 6
        { tbProp = { 2, 1, 1124 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Banh it chan Ga
        { tbProp = { 2, 1, 1125 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Banh it bat Bao
        { tbProp = { 2, 1, 1009 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- Thi�n Th�ch Tinh Th�ch
        { tbProp = { 2, 1, 30424 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- C��ng h�a quy�n 12
        { tbProp = { 2, 1, 30425 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- C��ng h�a quy�n 13
        { tbProp = { 2, 1, 30426 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- C��ng h�a quy�n 14
        { tbProp = { 2, 1, 30427 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- C��ng h�a quy�n 15
        { tbProp = { 2, 1, 30430 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- 100 ma �ao th�ch c3
        { tbProp = { 2, 1, 30687 }, nStack = 3000, nStatus = ITEMSTATUS_LOCK }, -- Th�i Nh�t L�nh
        { tbProp = { 2, 0, 554 }, nStack = 200, nStatus = ITEMSTATUS_LOCK }, -- Tu ch�n y�u quy�t
        { tbProp = { 2, 1, 31402 }, nStack = 100, nStatus = ITEMSTATUS_LOCK}, -- T�y t�m 7
        { tbProp = { 2, 1, 31401 }, nStack = 100, nStatus = ITEMSTATUS_LOCK}, -- Luy�n L� 7
        { tbProp = { 2, 1, 50257 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- l�nh b�i m� r�ng r��ng
        { tbProp = { 2, 1, 40057 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- M�nh m�t t�ch b� �i�n 27
        { tbProp = { 2, 1, 30912 }, nStack = 20000, nStatus = ITEMSTATUS_LOCK }, -- hi�p ngh�a chi c�ng
    }
    if WLib:CheckInv(40, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end
    if WTask:Get(TASKID_HOTRO_NEW_2024_STATUS) ==1 then
        Talk(1,"","B�n �� nh�n ph�n th��ng n�y r�i")
    end
    if WAward:Give(tbAward, "tanthu") == WEnv.RETCODE_SUCCESS then
        WTask:Set(TASKID_HOTRO_NEW_2024_STATUS, 1);
    else
        Talk(1,"","C� l�i! Li�n h� GM")
    end

    end
    function _t_newbie_check_HoTro2024()
        local startEvt = MkTime(2024,01,17,0,0,0);
        local nHonorBefore = WPlayer:GetHonor();
        local nCheckTask= WTask:Get(TASKID_HOTRO_NEW_2024_STATUS);
        if startEvt < GetCreateTime() and nCheckTask==0 and nHonorBefore >0 then
            return 1
        end
        return 0
    end

function _w_newbie_Give_1500000CongTrang()
    local nHonorBefore = WPlayer:GetHonor();
    local nHonorSet = 3000000;
    if nHonorBefore > nHonorSet then
        return
    end

    local nHonorAward = nHonorSet - nHonorBefore;
    WPlayer:SetHonor(nHonorSet);
    WPlayerLog:WriteBattleLog("npc_tientrang", "Nh�n nhanh 1.5 tri�u c�ng tr�ng", 0, "", WPlayer:GetExp(), 0, nHonorBefore, nHonorAward, WPlayer:GetBattlePoint(), 0);
end

function _w_newbie_buy_HoaCanh2024(nValue)
    local nFairLv = GetTask(3510);
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 95, 204 }, nCount = 145+10*nValue }, -- Thi�n Cang l�nh
            { tbProp = { 2, 1, 30370 }, nCount = 145+10*nValue }, -- Thi�n m�n Kim L�nh
            { tbProp = { 2, 1, 31239 }, nCount = 50+10*nValue }, -- Linh Ph�ch ��n
        }
    };
    local nLevel = 200+10*nValue;
    local nNeedLevel = 190+10*nValue;
    if nFairLv < nNeedLevel or nFairLv >nLevel then
        Talk(1,"","H�a M�ch ch�a �� �i�u ki�n �� nh�n")
        return
    end
    if WLib:PayMaterial(tbConsume) == WEnv.TRUE and WPlayer:LevelUpFair(nLevel)== WEnv.RETCODE_SUCCESS then
        Talk(1,"","Nh�n H�a M�ch th�nh c�ng l�n c�p: "..nLevel)
    else
        return WEnv.RETCODE_CONSUMEERROR;
    end
end

function _w_give_award_HMC_end(nHMC,nTaskBitId)
    if nHMC == nil or nTaskBitId==nil  then
        return WEnv.RETCODE_ERROR;
    end
    local nFairLv = GetTask(3510);

    --Check
    if nFairLv < nHMC then
        return WNpc:Talk("<sex> ch�a �� c�p H�a M�ch C�nh!"..nHMC, WEnv.TRUE);
    end
    if WTask:GetBit(WTASKID_NHAN_THUONG_HOAMACHCANH,nTaskBitId) ==1  then
        return WNpc:Talk("<sex> �� nh�n th��ng c�p H�a M�ch C�nh!"..nHMC, WEnv.TRUE);
    end
    if WLib:CheckInv(25, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end
    local tbAward = {
        [165] = {
            { tbProp = { 2, 1, 31614 }, nStack = 30,nStatus = ITEMSTATUS_LOCK }, -- T�y t�m 8
            { tbProp = { 2, 1, 31615 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� 8
            { tbProp = { 2, 102, 214 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- Ch�u 7 kh�a

        },
        [170] = {
            { tbProp = { 2, 1, 31614 }, nStack = 50,nStatus = ITEMSTATUS_LOCK }, -- T�y t�m 8
            { tbProp = { 2, 1, 31615 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� 8
            { tbProp = { 2, 1, 40046 }, nStack = 200, nStatus = ITEMSTATUS_LOCK }, -- M�nh t�y bi�ns chu
        },
        [175] = {
            { tbProp = { 2, 1, 40046 }, nStack = 300, nStatus = ITEMSTATUS_LOCK }, -- M�nh t�y bi�n ch�u 7
            { tbProp = { 2, 1, 40137 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- B�t tr�n ch�u tinh anh
        },
        [180] = {
            { tbProp = { 2, 1, 31122 }, nStack = 200, nStatus = ITEMSTATUS_LOCK }, --Linh Kh� r�c r�
            { tbProp = { 2, 1, 40137 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- B�t tr�n ch�u tinh anh
        },
        [190] = {
            { tbProp = { 2, 1, 30370 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- Thi�n M�n Kim L�nh
            { tbProp = { 2, 95, 204 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- Thi�n cang l�nh
            { tbProp = { 2, 1, 40137 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- B�t tr�n ch�u tinh anh
        },
        [200] = {
            { nFunc = "AddTitle(200, 3)" },
        },
    }
    if tbAward[nHMC] then
        WAward:Give(tbAward[nHMC], format("Nh�n th��ng HMC %s", nHMC));
        WTask:SetBit(WTASKID_NHAN_THUONG_HOAMACHCANH,nTaskBitId,1)
    end
    --Save give status

end
function _w_give_award_HMC()
    local tbSay = { format("<npcname>: Ch�o <color=yellow>%s<color>, th�i gian hi�n t�i l� %s!\n M�i nh�n v�t <color=red>ch� nh�n th��ng 1 l�n t�i 1 m�c<color>. ", WPlayer:GetName(), date("%Y-%m-%d %H:%M:%S")) };

    local tbSayOptionDef = {
        {
            szSelect = "H�a M�ch C�nh 165",
            nTaskBitId = 1,
            nHMC = 165
        },
        {
            szSelect = "H�a M�ch C�nh 170",
            nTaskBitId = 2,
            nHMC = 170
        },
        {
            szSelect = "H�a M�ch C�nh 175",
            nTaskBitId = 3,
            nHMC = 175
        },
        {
            szSelect = "H�a M�ch C�nh 180",
            nTaskId = 4,
            nHMC = 180
        },
        {
            szSelect = "H�a M�ch C�nh 190",
            nTaskBitId = 5,
            nHMC = 190
        },
        {
            szSelect = "H�a M�ch C�nh 200",
            nTaskBitId = 6,
            nHMC = 200
        },
    };

    local tbReadyGet = {};
    --local checkTop=GetTask(4064) or 0;
    for i = 1, getn(tbSayOptionDef) do
        if WTask:GetBit(WTASKID_NHAN_THUONG_HOAMACHCANH,tbSayOptionDef[i].nTaskBitId) == 0 and  GetTask(3510) >=tbSayOptionDef[i].nHMC  then
            --tinsert(tbSay, format("%s%s/#_w_give_award_HMC_end(%d, %d)", "", tbSayOptionDef[i].szSelect, tbSayOptionDef[i].nHMC, tbSayOptionDef[i].nTaskBitId));
            tinsert(tbSay, format("%s%s/#_w_give_award_HMC_end(%d, %d)", "M�c: ", tbSayOptionDef[i].szSelect, tbSayOptionDef[i].nHMC, i));
            --tinsert(tbSay,"test"..i)
            --Msg2Player(tbSayOptionDef[i].szSelect)
        else
            --tinsert(tbReadyGet, format("%s%s/nothing", "[�� nh�n] ", tbSayOptionDef[i].szSelect));
        end
    end

    -- hi�n th� �� nh�n � d��i
    for i = 1, getn(tbReadyGet) do
        tinsert(tbSay, tbReadyGet[i]);
    end

    if getn(tbSay) == 1 then
        tbSay[1] = "Ch�o <sex>! Hi�n kh�ng c� ph�n th��ng n�o ph� h�p v�i b�n ho�c �� ph�t h�t, khi kh�c h�y quay l�i!";
    end

    tinsert(tbSay, format("%s/nothing", "Ta ch� xem qua th�i."));
    WNpc:SayDialog(tbSay);
end
-------------------------------------------------------------------------------
---
function fix_LangSuong()
    local nHead=GetPlayerEquipIndex(0);
    local nBody=GetPlayerEquipIndex(1);
    local nPain=GetPlayerEquipIndex(3);
    if nHead then
        fix_LangSuong_call(nHead,0);
    end
    if nBody then
        fix_LangSuong_call(nBody,1);
    end
    if nPain then
        fix_LangSuong_call(nPain,3);
    end
end

function fix_LangSuong_call(nOldItemIdx,nIdex)
    local nG, nD, nP = GetItemInfoByIndex(nOldItemIdx)
    if nP ~=32464 then
        return
    end
    local t = {};
    t.tInfo = GetItemInfoByIndex(nOldItemIdx, 1);
    t.nEquipEnhance = GetEquipAttr(nOldItemIdx, 2);
    t.nEquipDing10 = GetItemSpecialAttr(nOldItemIdx, "DING10");
    t.nEquipDing7 = GetItemSpecialAttr(nOldItemIdx, "DING7");
    t.nBind = 1;
    if GetItemSpecialAttr(nOldItemIdx, "BIND") == 1 then
        t.nBind = 4;
    end
    t.tGem = GetItemGemInfo(nOldItemIdx);
    local tItemInfo = GetItemFeedUpAttrs(nOldItemIdx);
    local tSaveAttr = { -1, -1, -1, -1, -1, -1 };
    if tItemInfo then
        for i, tAttr in tItemInfo.tSocketInfo do
            local nAttrInfoIndex = tAttr.AttrId * 1000 + tAttr.AttrLv;
            tSaveAttr[i] = g_tbSavefixnewbie[nAttrInfoIndex] or -1;
            Msg2Player(tAttr)
        end
        t.tSaveAttr = tSaveAttr;
    end
    if DelItemByIndex(nOldItemIdx,-1) == 1 then
        _w_restoreLangSuong(t);
    end
end
function _w_restoreLangSuong(tSave)
    local tInfo = tSave.tInfo;
    local ok, nIndex = AddItem(tInfo.genre, tInfo.detail, tInfo.particular, 1, tSave.nBind, -1, -1, -1, -1, -1, -1, 0, tSave.nEquipEnhance, 0, tInfo.randseed);
    if 0 < tSave.nEquipDing10 then
        SetItemSpecialAttr(nIndex, "DING10", 1);
    end
    if 0 < tSave.nEquipDing7 then
        SetItemSpecialAttr(nIndex, "DING7", 1);
    end
    if tSave.tSaveAttr then
        SetItemFeedUpAttrs(nIndex, tSave.tSaveAttr[1], tSave.tSaveAttr[2], tSave.tSaveAttr[3], tSave.tSaveAttr[4], tSave.tSaveAttr[5], tSave.tSaveAttr[6]);
        --Msg2Player(tSave.tSaveAttr[1].."--"..tSave.tSaveAttr[2].."--"..tSave.tSaveAttr[3].."--"..tSave.tSaveAttr[4].."--"..tSave.tSaveAttr[5].."--"..tSave.tSaveAttr[6])
    end
    if tSave.tGem then
        for i, v in tSave.tGem do
            SetItemGemInfo(nIndex, i, v);
        end
    end
end

function fix_backLangSuong()
    local nHead=GetPlayerEquipIndex(0);
    local nPain=GetPlayerEquipIndex(3);
    local nG, nD, nP = GetItemInfoByIndex(nHead)
    local nG1, nD1, nP1 = GetItemInfoByIndex(nPain)
    if nP ==32464 then
        if DelItemByIndex(nHead,-1) == 1 then
            AddItem(2,1,31684,1,4)
        end
    end
    if nP1 ==32464 then
        if DelItemByIndex(nPain,-1) == 1 then
            AddItem(2,1,31686,1,4)
        end
    end
end
