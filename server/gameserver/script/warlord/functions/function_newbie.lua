----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-24
--- Description: file chøa c¸c hµm liªn quan ®Õn ng­êi ch¬i míi
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\warlord\\functions\\function_book.lua");
----------------------------------------------------------------------------------------------------

m_nDayStartCheckDailyTask = 3;

--NhiÖm vô h»ng ngµy
m_tbNewbieDailyTaskSupport = {
    { szTaskName = "Tham gia chiÕn tr­êng chÝnh", nDateOpen = 20221229, nTaskId = WTASKID_DAILYTASK_BYTE, nByteId = WTASKID_DAILYTASK_BYTE_CTC_DONE, nValueReq = 1 },
    { szTaskName = "Tham gia chiÕn tr­êng phô", nDateOpen = 20221229, nTaskId = WTASKID_DAILYTASK_BYTE, nByteId = WTASKID_DAILYTASK_BYTE_CTP_DONE, nValueReq = 1 },
    --{ szTaskName = "Thu ho¹ch B¸t Nh· Lín", nDateOpen = 20221229, nTaskId = WTASKID_WEEKLYTASK2_BYTE, nByteId = WTASKID_WEEKLYTASK2_BYTE_BNL_DONE, nValueReq = 20 },
   -- { szTaskName = "Hoµn thµnh nhiÖm vô tµi nguyªn chiÕn", nDateOpen = 20221229, nTaskId = WTASKID_DAILYTASK_BYTE, nByteId = WTASKID_DAILYTASK_BYTE_TNC_DONE, nValueReq = 2 },
};

--NhiÖm vô ®Æc thï
m_tbNewbieDailyTaskSupport2 = {
    { szTaskName = "Hoµn thµnh nhiÖm vô tµi nguyªn chiÕn", nDateOpen = 20221229, nTaskId = WTASKID_DAILYTASK_BYTE, nByteId = WTASKID_DAILYTASK_BYTE_TNC_DONE, nValueReq = 2 },
};

--NhiÖm vô h»ng tuÇn
m_tbWeeklyTaskSupport = {
    { szTaskName = "Tham gia chiÕn tr­êng chÝnh", nDateOpen = 20221229, nTaskId = WTASKID_WEEKLYTASK_BYTE, nByteId = WTASKID_WEEKLYTASK_BYTE_CTC_DONE, nValueReq = 4 },
    { szTaskName = "Tham gia chiÕn tr­êng phô", nDateOpen = 20221229, nTaskId = WTASKID_WEEKLYTASK_BYTE, nByteId = WTASKID_WEEKLYTASK_BYTE_CTP_DONE, nValueReq = 4 },
    { szTaskName = "Hoµn thµnh nhiÖm vô tµi nguyªn chiÕn", nDateOpen = 20221229, nTaskId = WTASKID_WEEKLYTASK_BYTE, nByteId = WTASKID_WEEKLYTASK_BYTE_TNC_DONE, nValueReq = 15 },
    { szTaskName = "Thu ho¹ch B¸t Nh· Lín", nDateOpen = 20221229, nTaskId = WTASKID_WEEKLYTASK2_BYTE, nByteId = WTASKID_WEEKLYTASK2_BYTE_BNL_DONE, nValueReq = 30 },
    { szTaskName = "VËn tiªu Hoµng Gia", nDateOpen = 20221229, nTaskId = WTASKID_WEEKLYTASK2_BYTE, nByteId = WTASKID_WEEKLYTASK2_BYTE_VANTIEU_DONE, nValueReq = 10 },
    --{ szTaskName = "C­íp tiªu", nDateOpen = 20221229, nTaskId = WTASKID_WEEKLYTASK2_BYTE, nByteId = WTASKID_WEEKLYTASK2_BYTE_CUOPTIEU_DONE, nValueReq = 5 },
};

--NhiÖm vô hç trî t©n thñ 1
m_tbTaskSupport1 = {
    { szTaskName = "Tham gia chiÕn tr­êng chÝnh", nDateOpen = 20221229, nTaskId = WTASKID_SUPPORT1_TASK_BYTE, nByteId = WTASKID_SUPPORT1_TASK_BYTE_CTC_DONE, nValueReq = 2 },
    { szTaskName = "Tham gia chiÕn tr­êng phô", nDateOpen = 20221229, nTaskId = WTASKID_SUPPORT1_TASK_BYTE, nByteId = WTASKID_SUPPORT1_TASK_BYTE_CTP_DONE, nValueReq = 2 },
    { szTaskName = "Hoµn thµnh nhiÖm vô tµi nguyªn chiÕn", nDateOpen = 20221229, nTaskId = WTASKID_SUPPORT1_TASK_BYTE, nByteId = WTASKID_SUPPORT1_TASK_BYTE_TNC_DONE, nValueReq = 4 },
    { szTaskName = "Thu ho¹ch B¸t Nh· Lín", nDateOpen = 20221229, nTaskId = WTASKID_SUPPORT1_TASK2_BYTE, nByteId = WTASKID_SUPPORT1_TASK2_BYTE_BNL_DONE, nValueReq = 2 },
    { szTaskName = "VËn tiªu Hoµng Gia", nDateOpen = 20221229, nTaskId = WTASKID_SUPPORT1_TASK2_BYTE, nByteId = WTASKID_SUPPORT1_TASK2_BYTE_VANTIEU_DONE, nValueReq = 1 },
    --{ szTaskName = "C­íp tiªu", nDateOpen = 20221229, nTaskId = WTASKID_SUPPORT1_TASK2_BYTE, nByteId = WTASKID_SUPPORT1_TASK2_BYTE_CUOPTIEU_DONE, nValueReq = 5 },
};

---KiÓm tra c¸c nhiÖm vô ®· hoµn thµnh ch­a
---@return number, table return1: WEnvTRUE= hoµn thµnh, WEnv.FALSE= ch­a hoµn thµnh; return2: danh s¸ch tr¹ng th¸i nhiÖm vô
function _w_newbie_CheckDailyTask()
    --if WPlayer:IsNewbie(m_nDayStartCheckDailyTask * DATETIME_SEC_ONE_DAY) == WEnv.TRUE then
    --    local nDay, nHour, nMin = WDate:DateDiff(GetTime(), GetCreateTime() + (m_nDayStartCheckDailyTask * DATETIME_SEC_ONE_DAY));
    --    return WEnv.TRUE, { format("<color=green> - Thêi gian t©n thñ cßn %d ngµy %d giê %d phót<color>", nDay, nHour, nMin ) };
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
        return WEnv.TRUE, { "<color=green> - §· hoµn thµnh nhiÖm vô, cã thÓ nhËn th­ëng<color>" };
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

---KiÓm tra c¸c nhiÖm vô tuÇn ®· hoµn thµnh ch­a
---@return number, table return1: WEnvTRUE= hoµn thµnh, WEnv.FALSE= ch­a hoµn thµnh; return2: danh s¸ch tr¹ng th¸i nhiÖm vô
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

---KiÓm tra c¸c nhiÖm vô hç trî t©n thñ 1 ®· hoµn thµnh ch­a
---@return number, table return1: WEnvTRUE= hoµn thµnh, WEnv.FALSE= ch­a hoµn thµnh; return2: danh s¸ch tr¹ng th¸i nhiÖm vô
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

---Interface cña c¸c hµm nhËn th­ëng ë d­íi cã check thªm ®iÒu kiÖn nhiÖm vô tr­íc khi trao th­ëng
function _w_newbie_GiveDailySupport(nTaskId, nBitId, szFunc)
    --- Check
    if _w_newbie_CheckDailyTask() ~= WEnv.TRUE then
        return WNpc:Talk("<sex> ch­a hoµn thµnh nhiÖm vô h«m nay!", WEnv.TRUE);
    end

    _w_newbie_GiveOnceSupport(nTaskId, nBitId, szFunc);
end
function _w_newbie_GiveDailySupport2(nTaskId, nBitId, szFunc)
    --- Check
    if _w_newbie_CheckDailyTask2() ~= WEnv.TRUE then
        return WNpc:Talk("<sex> ch­a hoµn thµnh nhiÖm vô h«m nay!", WEnv.TRUE);
    end

    _w_newbie_GiveOnceSupport(nTaskId, nBitId, szFunc);
end

---Interface cña c¸c hµm nhËn th­ëng nhiÖm vô tuÇn
function _w_newbie_GiveWeeklySupport(nTaskId, nBitId, szFunc)
    --- Check
    if _w_newbie_CheckWeeklyTask() ~= WEnv.TRUE then
        return WNpc:Talk("<sex> ch­a hoµn thµnh nhiÖm vô tuÇn nµy!", WEnv.TRUE);
    end

    _w_newbie_GiveOnceSupport(nTaskId, nBitId, szFunc);
end

---Interface cña c¸c hµm nhËn th­ëng nhiÖm vô t©n thñ 1
function _w_newbie_GiveSupport1(nTaskId, nBitId, szFunc)
    --- Check
    if _w_newbie_CheckSupport1Task() ~= WEnv.TRUE then
        return WNpc:Talk("<sex> ch­a hoµn thµnh nhiÖm vô t©n thñ nµy!", WEnv.TRUE);
    end

    _w_newbie_GiveOnceSupport(nTaskId, nBitId, szFunc);
end
-------nhan yeu Quyet
function _w_newbie_Give_YeuQuyet()

    local tbAward = {
        { tbProp = { 2, 1, 50005 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- R­¬ng yÕu QuyÕt
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
---Interface cña c¸c hµm nhËn th­ëng 1 lÇn
function _w_newbie_GiveOnceSupport(nTaskId, nBitId, szFunc)
    if nTaskId == nil or nBitId == nil then
        return WEnv.RETCODE_ERROR;
    end

    --Check
    if WTask:GetBit(nTaskId, nBitId) ~= 0 then
        return WNpc:Talk("<sex> ®· nhËn hç trî nµy råi!", WEnv.TRUE);
    end
    if WPlayer:IsJoinedRoute() ~= WEnv.TRUE then
        return WNpc:Talk("<sex> ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn hç trî!", WEnv.TRUE);
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
---C¸c hµm nhËn hç trî 1 lÇn mçi ngµy

---Hµm nhËn item Hoµng Kim §¹i Hång Bao (vµng)
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_MoneyItem(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 539 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Hoµng Kim §¹i Hång Bao
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---NhËn item MËt TÞch BÝ §iÓn mçi ngµy
---@param nAmount number Sè l­îng cÇn add

---NhËn item Tu Ch©n YÕu QuyÕt mçi ngµy
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_TuChan(nAmount)
    local tbAward = {
        { tbProp = { 2, 0, 554 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Tu Ch©n YÕu QuyÕt
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn ®iÓm lÞch luyÖn vµ ch©n vâ tinh hoa dµnh cho tiÕn cÊp mËt tÞch
function _w_newbie_Give_LichLuyen(nPopur, nPopur2, nChanQuyen)
    nPopur = tonumber(nPopur) or 1;
    nPopur2 = tonumber(nPopur2) or 1;
    nChanQuyen = tonumber(nChanQuyen) or 1;
    local tbAward = {
        { nPopur = nPopur },
        { nPopur2 = nPopur2 },
    };

    if nChanQuyen > 0 then
        tinsert(tbAward, { tbProp = { 2, 114, 117 }, nStack = nChanQuyen, nStatus = ITEMSTATUS_LOCK }); -- Ch©n QuyÓn Tinh Hoa
    end

    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn item M¶nh C¬ Quan MÆc Gia mçi ngµy
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_ManhMacGia(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- M¶nh C¬ Quan MÆc Gia
    };
    WAward:Give(tbAward, "item_newbie_card");
end


---NhËn item s¸ch kü n¨ng b¹n ®ång hµnh Lv5
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_SachPetLv5(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 40025 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Tói Kü N¨ng B§H Lv5
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn item Th­¬ng H¶i Di Ch©u
---@param nLevel number cÊp cña ch©u
---@param nQuantity number Sè l­îng cÇn add
function _w_newbie_Give_ThuongHaiDiChau(nLevel, nQuantity)
    nLevel = tonumber(nLevel) or 1;
    nQuantity = tonumber(nQuantity) or 1;
    KsgAward:ThuongHaiChau(nLevel, nQuantity, ITEMSTATUS_LOCK);
end

---NhËn item Tui da quy
---@param nLevel number cÊp cña ch©u
---@param nQuantity number Sè l­îng cÇn add
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
        tbDaQuy[nLevel].tbItems, -- Bét Tr©n Ch©u
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---NhËn item Bét Tr©n Ch©u
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_BotTranChau(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 102, 215 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Bét Tr©n Ch©u
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---NhËn item §¸ Mµi vò khÝ
---@param nQuantity number Sè l­îng cÇn add
function _w_newbie_Give_DaMai(nQuantity)
    nQuantity = tonumber(nQuantity) or 1;
    local tbAward = {
        { tbProp = { 2, 1, 30428 }, nStack = nQuantity, nStatus = ITEMSTATUS_LOCK }, -- Ma §ao Th¹ch CÊp 1
        { tbProp = { 2, 1, 30429 }, nStack = nQuantity, nStatus = ITEMSTATUS_LOCK }, -- Ma §ao Th¹ch CÊp 2
        { tbProp = { 2, 1, 30430 }, nStack = nQuantity, nStatus = ITEMSTATUS_LOCK }, -- Ma §ao Th¹ch CÊp 3
    };
    WAward:Give(tbAward, "item_newbie_card");
end
---------NhËn Ph¸ Hån lÖnh bµi
function _w_newbie_Give_PhaHonLenhBai()
    local tbAward = {
        { tbProp = { 2, 1, 31529 }, nStack = 1,nStatus = ITEMSTATUS_LOCK },
        { tbProp = { 2, 1, 31530 }, nStack = 1,nStatus = ITEMSTATUS_LOCK },
        { tbProp = { 2, 1, 31531 }, nStack = 1,nStatus = ITEMSTATUS_LOCK },
        { tbProp = { 2, 1, 31532 }, nStack = 1,nStatus = ITEMSTATUS_LOCK },
        { tbProp = { 2, 1, 31533 }, nStack = 2,nStatus = ITEMSTATUS_LOCK },
    }
    KsgAward:Give(tbAward, 'NhËn bé Ph¸ Hån')
end
function _w_newbie_Give_LangSuongLenhBai()
    local tbAward = {
        { tbProp = { 2, 1, 31684 }, nStack = 1,nStatus = ITEMSTATUS_LOCK },
        { tbProp = { 2, 1, 31685 }, nStack = 1,nStatus = ITEMSTATUS_LOCK },
        { tbProp = { 2, 1, 31686 }, nStack = 1,nStatus = ITEMSTATUS_LOCK },
        { tbProp = { 2, 1, 31687 }, nStack = 1,nStatus = ITEMSTATUS_LOCK },
        { tbProp = { 2, 1, 31688 }, nStack = 2,nStatus = ITEMSTATUS_LOCK },
    }
    KsgAward:Give(tbAward, 'NhËn bé L¨ng S­¬ng')
end

---NhËn item Thiªn Th¹ch Tinh Th¹ch mçi ngµy
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_ThienThachTinhThach(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 1009 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Thiªn Th¹ch Tinh Th¹ch
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn item Qu©n C«ng Vinh Dù mçi ngµy
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_QuanCongVinhDu(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 30642}, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Thiªn Th¹ch Tinh Th¹ch
    };
    WAward:Give(tbAward, "item_newbie_card");
end

function _w_newbie_Buy_TienDieu()
    if not KsgLib:HasEnoughBagRoom(5) then
        return WEnv.RETCODE_NEEDROOM
    end

    local tbCondition = {
        tbItems = {
            { tbProp = { 2, 95, 204 }, nCount = 10 }, -- thiªn cang lÖnh
            { tbProp = { 2, 1, 30370 }, nCount = 10 }, -- thiªn m«n kim lÖnh
        },
    }
    if KsgLib:PayMaterial(tbCondition) then
        KsgAward:Give({
            tbProp = { 2, 20, 24 }, nStack = 1, nStatus = 4
        }, "Mua Tiªn §iªu")
    else
        return WEnv.RETCODE_CONSUMEERROR;
    end
end

---NhËn item Linh ph¸ch ®¬n mçi ngµy
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_LinhPhachDon(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 31239}, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Linh Ph¸ch §¬n
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn TÈy T©m LuyÖn L«
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_TayTamLuyenLo(nLevel, nAmount)
    nLevel = tonumber(nLevel) or 0;
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {};

    if nLevel == -1 or nLevel == 1 then
        tinsert(tbAward, { tbProp = { 2, 1, 30521 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- TÈy T©m Th¹ch Lv1
        tinsert(tbAward, { tbProp = { 2, 1, 30527 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- LuyÖn L« ThiÕt Lv1
    end
    
    if nLevel == -1 or nLevel == 2 then
        tinsert(tbAward, { tbProp = { 2, 1, 30522 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- TÈy T©m Th¹ch Lv2
        tinsert(tbAward, { tbProp = { 2, 1, 30528 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- LuyÖn L« ThiÕt Lv2
    end
    
    if nLevel == -1 or nLevel == 3 then
        tinsert(tbAward, { tbProp = { 2, 1, 30523 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- TÈy T©m Th¹ch Lv3
        tinsert(tbAward, { tbProp = { 2, 1, 30529 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- LuyÖn L« ThiÕt Lv3
    end

    if nLevel == -1 or nLevel == 4 then
        tinsert(tbAward, { tbProp = { 2, 1, 30524 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- TÈy T©m Th¹ch Lv4
        tinsert(tbAward, { tbProp = { 2, 1, 30530 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- LuyÖn L« ThiÕt Lv4
    end

    if nLevel == -1 or nLevel == 5 then
        tinsert(tbAward, { tbProp = { 2, 1, 30525 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- TÈy T©m Th¹ch Lv5
        tinsert(tbAward, { tbProp = { 2, 1, 30531 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- LuyÖn L« ThiÕt Lv5
    end

    if nLevel == -1 or nLevel == 6 then
        tinsert(tbAward, { tbProp = { 2, 1, 30526 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- TÈy T©m Th¹ch Lv6
        tinsert(tbAward, { tbProp = { 2, 1, 30532 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- LuyÖn L« ThiÕt Lv6
    end

    if nLevel == -1 or nLevel == 7 then
        tinsert(tbAward, { tbProp = { 2, 1, 31402 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- TÈy T©m Th¹ch Lv7
        tinsert(tbAward, { tbProp = { 2, 1, 31401 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- LuyÖn L« ThiÕt Lv7
    end
    if nLevel == -1 or nLevel == 8 then
        tinsert(tbAward, { tbProp = { 2, 1, 31614 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- TÈy T©m Th¹ch Lv8
        tinsert(tbAward, { tbProp = { 2, 1, 31615 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- LuyÖn L« ThiÕt Lv8
    end

    if getn(tbAward) > 0 and nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---NhËn item L­u Kim mçi ngµy
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_LuuKim(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 31096 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- L­u Kim
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn item Thiªn V¨n Th¹ch mçi ngµy
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_ThienVanThach(nAmount)
    local tbAward = {
        { tbProp = { 2, 201, 13 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Thiªn V¨n Th¹ch
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn item Cæ Kim Th¹ch c­êng ho¸ v¨n søc +10 mçi ngµy
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_CoKimThach(nAmount)
    local tbAward = {
        { tbProp = { 2, 201, 14 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Cæ Kim Th¹ch
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn item Cæ Kim Th¹ch c­êng ho¸ v¨n søc +10 mçi ngµy
---@param nLevel number CÊp ®¸ quý
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_DaQuy(nLevel, nAmount)
    nLevel = tonumber(nLevel) or 0;
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {};

    if nLevel == -1 or nLevel == 1 then
        tinsert(tbAward, { tbProp = { 2, 1, 30998 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- Tói §¸ Quý CÊp 1
    end
    if nLevel == -1 or nLevel == 2 then
        tinsert(tbAward, { tbProp = { 2, 1, 30999 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- Tói §¸ Quý CÊp 2
    end
    if nLevel == -1 or nLevel == 3 then
        tinsert(tbAward, { tbProp = { 2, 1, 31000 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- Tói §¸ Quý CÊp 3
    end
    if nLevel == -1 or nLevel == 4 then
        tinsert(tbAward, { tbProp = { 2, 1, 31001 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- Tói §¸ Quý CÊp 4
    end
    if nLevel == -1 or nLevel == 5 then
        tinsert(tbAward, { tbProp = { 2, 1, 31024 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- Tói §¸ Quý CÊp 5
    end
    if nLevel == -1 or nLevel == 6 then
        tinsert(tbAward, { tbProp = { 2, 1, 31123 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- Tói §¸ Quý CÊp 6
    end

    if getn(tbAward) > 0 and nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

----------------------------------------------------------------------------------------------------

---NhËn bé trang bÞ Èm HuyÕt
---@param nLevel number C­êng ho¸ trang bÞ
function _w_newbie_Give_AmHuyet(nLevel)
    WItem:AddSuit_AmHuyet(nLevel, ITEMSTATUS_LOCK, GIVETYPE_SUIT_RING_WEAPON, "item_newbie_card");
end

---NhËn bé trang bÞ Thanh Long T­íng
---@param nLevel number C­êng ho¸ trang bÞ
function _w_newbie_Give_ThanhLongTuong(nLevel)
    nLevel = tonumber(nLevel) or 0;
    KsgItem:AddBattleSuit_ThanhLong_Tuong(nLevel, BATTLE_ITEM_TYPE_SUIT_RING_WEAPON);

end
---NhËn bé trang bÞ Chu Tuoc T­íng
---@param nLevel number C­êng ho¸ trang bÞ
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



---NhËn bé trang bÞ Thanh Long So¸i
---@param nLevel number C­êng ho¸ trang bÞ
function _w_newbie_Give_ThanhLongSoai(nLevel)
    nLevel = tonumber(nLevel) or 0;
    KsgItem:AddBattleSuit_ThanhLong_Soai(nLevel, BATTLE_ITEM_TYPE_SUIT_RING_WEAPON);
end
function _w_newbie_Give_ThanhLongSoai_HT()
    local nLevel = 7;
    KsgItem:AddBattleSuit_ThanhLong_Soai(nLevel, BATTLE_ITEM_TYPE_SUIT_RING_WEAPON);
    WTask:SetBit(WTASKID_NEWBIE_BIT_GIVE_STATUS,WTASKID_NEWBIE_BIT_GIVE_THANHLONGSOAI,1);
end



---NhËn bé trang bÞ Ho¶ Phông So¸i
---@param nLevel number C­êng ho¸ trang bÞ
function _w_newbie_Give_HoaPhungSoai(nLevel)
    nLevel = tonumber(nLevel) or 0;
    KsgItem:AddBattleSuit_HoaPhung_Soai(nLevel, BATTLE_ITEM_TYPE_SUIT_RING_WEAPON);
end

---NhËn bé trang bÞ Uy Hæ T­íng
---@param nLevel number C­êng ho¸ trang bÞ
function _w_newbie_Give_UyHoTuong(nLevel)
    nLevel = tonumber(nLevel) or 0;
    KsgItem:AddBattleSuit_UyHo_Tuong(nLevel, BATTLE_ITEM_TYPE_SUIT_RING_WEAPON);
end

---NhËn bé trang bÞ Uy Hæ So¸i
---@param nLevel number C­êng ho¸ trang bÞ
function _w_newbie_Give_UyHoSoai(nLevel)
    nLevel = tonumber(nLevel) or 0;
    KsgItem:AddBattleSuit_UyHo_Soai(nLevel, BATTLE_ITEM_TYPE_SUIT_RING_WEAPON);
end

---NhËn bé trang bÞ V¨n Søc Lv3 + Cæ Kim Th¹ch
---@param nAmount number Sè l­îng Cæ Kim Th¹ch cÇn add
function _w_newbie_Give_VanSuc3(nAmount)
    nAmount = tonumber(nAmount) or 0;
    if nAmount > 0 then
        local tbAward = {
            { tbProp = { 2, 201, 14 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Cæ Kim Th¹ch
        };
        WAward:Give(tbAward, "item_newbie_card");
    end
    WItem:AddSuit_VanSuc(3, ITEMSTATUS_LOCK, "item_newbie_card");
end

---NhËn bé trang bÞ V¨n Søc Lv4 + Cæ Kim Th¹ch
---@param nAmount number Sè l­îng Cæ Kim Th¹ch cÇn add
function _w_newbie_Give_VanSuc4(nAmount)
    nAmount = tonumber(nAmount) or 0;
    if nAmount > 0 then
        local tbAward = {
            { tbProp = { 2, 201, 14 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Cæ Kim Th¹ch
        };
        WAward:Give(tbAward, "item_newbie_card");
    end
    WItem:AddSuit_VanSuc(4, ITEMSTATUS_LOCK, "item_newbie_card");
end

---NhËn bé trang bÞ V¨n Søc Lv4 + Cæ Kim Th¹ch
---@param nAmount number Sè l­îng Cæ Kim Th¹ch cÇn add
function _w_newbie_Give_VanSuc5(nAmount)
    nAmount = tonumber(nAmount) or 0;
    if nAmount > 0 then
        local tbAward = {
            { tbProp = { 2, 201, 14 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Cæ Kim Th¹ch
        };
        WAward:Give(tbAward, "item_newbie_card");
    end
    WItem:AddSuit_VanSuc(5, ITEMSTATUS_LOCK, "item_newbie_card");
end

---NhËn 3 bé trang bÞ Kim Xµ Lv6
---@param nLevel number C­êng ho¸ trang bÞ
function _w_newbie_Give_KimXa6(nLevel, nSelectIdx)
    ----nSelectIdx = nSelectIdx or 0;
    ----if nSelectIdx == 0 then
    ----    local tbSay = { "Chän <color=yellow>1 bé trang bÞ Kim xµ d­íi ®©y<color>, h·y suy nghÜ kü tr­íc khi chän!" };
    ----    for nType, szName in g_tbKimXaCfg[nLevel] do
    ----        tinsert(tbSay, format("Ta muèn nhËn bé %s/#_w_newbie_Give_KimXa6(%d)", szName, nType));
    ----    end
    ----    tinsert(tbSay, "Ta ch­a muèn nhËn b©y giê/nothing");
    ----    WNpc:SayDialog(tbSay);
    ----    return WEnv.RETCODE_NEEDCONFIRM;
    ----end

    --- Give award
    nLevel = tonumber(nLevel) or 0;
    KsgAward:AddKimXa(6, nLevel, KIMXA_TYPE_KHANGTATCA, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
    KsgAward:AddKimXa(6, nLevel, KIMXA_TYPE_NGOAICONG, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
    KsgAward:AddKimXa(6, nLevel, DAME_TYPE_NOICONG, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
end

---NhËn 3 bé trang bÞ Kim Xµ Lv7
---@param nLevel number C­êng ho¸ trang bÞ
function _w_newbie_Give_KimXa7(nLevel, nSelectIdx)
    ----nSelectIdx = nSelectIdx or 0;
    ----if nSelectIdx == 0 then
    ----    local tbSay = { "Chän <color=yellow>1 bé trang bÞ Kim xµ d­íi ®©y<color>, h·y suy nghÜ kü tr­íc khi chän!" };
    ----    for nType, szName in g_tbKimXaCfg[nLevel] do
    ----        tinsert(tbSay, format("Ta muèn nhËn bé %s/#_w_newbie_Give_KimXa6(%d)", szName, nType));
    ----    end
    ----    tinsert(tbSay, "Ta ch­a muèn nhËn b©y giê/nothing");
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
        { tbProp = { 2, 1, 40099 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- Hoan L¨ng LÖnh (Phi Phong)
        { tbProp = { 2, 1, 40100 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- Hoan L¨ng LÖnh (Huy Ch­¬ng)
        { tbProp = { 2, 1, 40101 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- Hoan L¨ng LÖnh (ChiÕn Hµi)

        { tbProp = { 2, 1, 40102 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- §»ng Giao LÖnh (Phi Phong)
        { tbProp = { 2, 1, 40103 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- §»ng Giao LÖnh (Huy Ch­¬ng)
        { tbProp = { 2, 1, 40104 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- §»ng Giao LÖnh (ChiÕn Hµi)

        { tbProp = { 2, 1, 40105 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- Khëi Ph­îng LÖnh (Phi Phong)
        { tbProp = { 2, 1, 40106 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- Khëi Ph­îng LÖnh (Huy Ch­¬ng)
        { tbProp = { 2, 1, 40107 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- Khëi Ph­îng LÖnh (ChiÕn Hµi)
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
    ----    local tbSay = { "Chän <color=yellow>1 bé trang bÞ Kim xµ d­íi ®©y<color>, h·y suy nghÜ kü tr­íc khi chän!" };
    ----    for nType, szName in g_tbKimXaCfg[nLevel] do
    ----        tinsert(tbSay, format("Ta muèn nhËn bé %s/#_w_newbie_Give_KimXa6(%d)", szName, nType));
    ----    end
    ----    tinsert(tbSay, "Ta ch­a muèn nhËn b©y giê/nothing");
    ----    WNpc:SayDialog(tbSay);
    ----    return WEnv.RETCODE_NEEDCONFIRM;
    ----end

    --- Give award
    nLevel = tonumber(nLevel) or 0;
    KsgAward:AddKimXa(9, nLevel, KIMXA_TYPE_KHANGTATCA, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
    KsgAward:AddKimXa(9, nLevel, KIMXA_TYPE_NGOAICONG, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
    KsgAward:AddKimXa(9, nLevel, DAME_TYPE_NOICONG, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
end
---NhËn bé trang bÞ ChiÕn Cuång
---@param nLevel number C­êng ho¸ trang bÞ
function _w_newbie_Give_ChienCuong(nLevel)
    WItem:AddSuit_ChienCuong(nLevel, ITEMSTATUS_LOCK, GIVETYPE_SUIT_RING_WEAPON, "item_newbie_card");
end

---NhËn bé trang bÞ DiÖu D­¬ng
---@param nLevel number C­êng ho¸ trang bÞ
function _w_newbie_Give_DieuDuong(nLevel)
    WItem:AddSuit_DieuDuong(nLevel, ITEMSTATUS_LOCK, GIVETYPE_SUIT_RING_WEAPON, "item_newbie_card");
end

---NhËn bé S¸t Tinh
---@param nLevel table
---@param nStatus table
function _w_newbie_Give_SatTinh(nLevel, nStatus)
    nLevel = nLevel or 0;
    nStatus = nStatus or ITEMSTATUS_LOCK;

    local tbAward = {
        { tbProp = { 2, 1, 40001 }, nStack = 1, nStatus = nStatus, nLevel = nLevel }, -- S¸t Tinh LÖnh Bµi (§Çu)
        { tbProp = { 2, 1, 40002 }, nStack = 1, nStatus = nStatus, nLevel = nLevel }, -- S¸t Tinh LÖnh Bµi (¸o)
        { tbProp = { 2, 1, 40003 }, nStack = 1, nStatus = nStatus, nLevel = nLevel }, -- S¸t Tinh LÖnh Bµi (QuÇn)
        { tbProp = { 2, 1, 40004 }, nStack = 1, nStatus = nStatus, nLevel = nLevel }, -- S¸t Tinh LÖnh Bµi (Vò KhÝ)
        { tbProp = { 2, 1, 40005 }, nStack = 2, nStatus = nStatus }, -- S¸t Tinh LÖnh Bµi (Trang Søc)
    }
    WAward:Give(tbAward, 'NhËn bé S¸t Tinh')
end

---NhËn bé trang bÞ Kim Xµ Lv3 + 500 TÈy T©m + 500 LuyÖn L«
---@param nLevel number C­êng ho¸ trang bÞ
function _w_newbie_Give_KimXa3(nLevel)
    nLevel = tonumber(nLevel) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 30523 }, nStack = 500, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv3
        { tbProp = { 2, 1, 30529 }, nStack = 500, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv3
    }
    WAward:Give(tbAward, "item_newbie_card");
    KsgAward:AddKimXa(3, nLevel, 0, ITEMSTATUS_LOCK, "item_newbie_card", ITEMFEED_12);
end

---NhËn bé trang bÞ s­ m«n Lv3
---@param nLevel number C­êng ho¸ trang bÞ
function _w_newbie_Give_SuMon3(nLevel)
    WItem:AddSuit_SuMon3(nLevel, ITEMSTATUS_LOCK, GIVETYPE_SUIT_RING_WEAPON, "item_newbie_card");
end

---NhËn bé trang bÞ s­ m«n Lv4
---@param nLevel number C­êng ho¸ trang bÞ
function _w_newbie_Give_SuMon4(nLevel)
    WItem:AddSuit_SuMon4(nLevel, ITEMSTATUS_LOCK, GIVETYPE_SUIT_RING_WEAPON, "item_newbie_card");
end

---NhËn bé trang bÞ s­ m«n Lv5
---@param nLevel number C­êng ho¸ trang bÞ
function _w_newbie_Give_SuMon5(nLevel)
    WItem:AddSuit_SuMon5(nLevel, ITEMSTATUS_LOCK, GIVETYPE_SUIT_RING_WEAPON, "item_newbie_card");
end

---NhËn bé trang bÞ buff 35%
---@param nLevel number C­êng ho¸ trang bÞ
function _w_newbie_Give_SetBuff(nLevel)
    ---NhËn TÈy T©m LuyÖn L«
    ---@param nAmount number Sè l­îng cÇn add
    WItem:AddSuit_Buff35(nLevel, ITEMSTATUS_LOCK, GIVETYPE_SUIT_RING_WEAPON, "item_newbie_card");
end

-------------------------------------------------------------------------------------------------------


---NhËn Bét Tr©n Ch©u
---@param nAmount number Sè l­îng cÇn add

-------------------------------------------------------------------------------------------------------

---NhËn kÝch ho¹t ho¸ c¶nh
---@param nBigLevel number Level sau khi hoµn tÊt
function _w_newbie_Give_ChuyenSinh(nBigLevel, nSelectIdx)
    nSelectIdx = tonumber(nSelectIdx) or 0;
    if nSelectIdx == 0 then
        local tbSay = { "Chän h­íng chuyÓn sinh:" };
        for nRebornRoute, szRouteName in pairs(g_tbRebornRouteNames) do
            tinsert(tbSay, format("ChuyÓn sinh theo h­íng %s/#_w_newbie_Give_ChuyenSinh(%d, %d)", szRouteName, nBigLevel, nRebornRoute))
        end
        --tinsert(tbSay, "Ta ch­a muèn nhËn b©y giê/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    nBigLevel = tonumber(nBigLevel or 1099);
    KsgReborn:PlayerRebornWithNews(nBigLevel, nSelectIdx, "nothing");
end

---NhËn kÝch ho¹t ho¸ c¶nh
---@param nSelectIdx number
function _w_newbie_Give_ChangeChuyenSinh(nSelectIdx)
    nSelectIdx = tonumber(nSelectIdx) or 0;
    if GetLevel() < 99 then
        WNpc:Talk("B¹n ch­a ®ñ ®iÒu kiÖn ®Ó chuyÓn h­íng", 1);
        return
    end
    if nSelectIdx == 0 then
        local tbSay = { "Chän h­íng chuyÓn sinh:" };
        for nRebornRoute, szRouteName in pairs(g_tbRebornRouteNames) do
            if type(nRebornRoute) == "number" then
                tinsert(tbSay, format("ChuyÓn sinh theo h­íng %s %d/#_w_newbie_Give_ChangeChuyenSinh(%d)", szRouteName, nRebornRoute, nRebornRoute))
            end
        end
        --tinsert(tbSay, "Ta ch­a muèn nhËn b©y giê/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    KsgReborn:PlayerRebornWithNew2s(WPlayer:GetBigLevel(), nSelectIdx, "nothing");
    ExitGame();
end

---NhËn kÝch ho¹t ho¸ c¶nh
---@param nLevel number Sè tÇng ho¸ c¶nh cÇn add
function _w_newbie_Give_HoaCanh(nLevel)
    nLevel = tonumber(nLevel) or 1;
    WPlayer:LevelUpFair(nLevel);
end

-------------------------------------------------------------------------------------------------------

---NhËn mËt tÞch th«ng th­êng (chiªm y, tö hµ, thiªn hµ ...)
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_MatTichThongDung(nAmount)
    _w_book_AddCommonBook(nil, nAmount);
end

---NhËn item Tu Ch©n YÕu QuyÕt mçi ngµy
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_TuChan(nAmount)
    local tbAward = {
        { tbProp = { 2, 0, 554 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Tu Ch©n YÕu QuyÕt
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn MËt TÞch BÝ §iÓn theo hÖ ph¸i
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_MatTichBiDien(nAmount)
    _w_book_AddBookByType(nAmount, 6);
end

---NhËn R­¬ng YÕu QuyÕt s¬ cÊp (bé theo hÖ ph¸i)
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_YeuQuyet(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 50005 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- R­¬ng YÕu QuyÕt_S¬
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn §iÓm LuyÖn MËt TÞch, LÞch LuyÖn, Tinh Vâ Ch©n Hoa
---@param nPopur number Sè ®iÓm luyÖn
---@param nPopur2 number LÞch LuyÖn
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_DiemLuyenMatTich(nPopur, nPopur2, nChanQuyen)
    nPopur = tonumber(nPopur) or 1;
    nPopur2 = tonumber(nPopur2) or 1;
    nChanQuyen = tonumber(nChanQuyen) or 1;
    local tbAward = {
        { nPopur = nPopur },
        { nPopur2 = nPopur2 },
    };

    if nChanQuyen > 0 then
        tinsert(tbAward, { tbProp = { 2, 114, 117 }, nStack = nChanQuyen, nStatus = ITEMSTATUS_LOCK }); -- Ch©n QuyÓn Tinh Hoa
    end

    WAward:Give(tbAward, "item_newbie_card");
end

----------------------------------------------------------------------------------------------------

---NhËn Kinh M¹ch Vâ Th¸nh + 900000 Ch©n KhÝ
function _w_newbie_Give_KinhMachVoThanh()
    local tbAward = {
        { nMeridianLevel = 6 }, -- Vâ Th¸nh
        { nChanKhi = 900000 },
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn  900000 Ch©n KhÝ
function _w_newbie_Give_900KCK()
    local tbAward = {
        { nChanKhi = 900000 },
    };
    WAward:Give(tbAward, "item_newbie_card");
end
-----TÈy Ch©n KhÝ
function _w_newbie_TayChanKhi()
    MeridianRestore(-1)
    PlaySound("\\sound\\sound_i016.wav")
    --SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end

---NhËn Kinh M¹ch §ång Nh©n
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_KinhMachDongNhan(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 30730 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Kinh M¹ch §ång Nh©n
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---NhËn Kinh M¹ch Ng©n Nh©n
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_KinhMachNganNhan(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 30731 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Kinh M¹ch Ng©n Nh©n
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---NhËn pet Lv5
---@param nAmount number Sè l­îng cÇn add
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

---NhËn tÝn vËt bang héi
---@param nLevel number CÊp cña tÝn vËt
function _w_newbie_Give_TinVatBangHoi(nLevel)
    nLevel = tonumber(nLevel) or 1;
    if nLevel < 1 then
        nLevel = 1;
    end
    if nLevel > 25 then
        nLevel = 25;
    end
    local tbAward = {
        { tbProp = { 0, 155, nLevel }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- TÝn VËt 25
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn danh hiÖu bang
---@param nLevel number CÊp cña danh hiÖu
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
    WNpc:Talk(format("NhËn thµnh c«ng hiÖu bang cÊp %d", nLevel), WEnv.TRUE);
end

----------------------------------------------------------------------------------------------------

---NhËn phôc sinh pet 1+2
---@param nSelectIdx number Lùa chän néi ngo¹i c«ng
function _w_newbie_Give_PhucSinhPet1(nSelectIdx)
    local nIsPS_lan1 = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B) / 10), 10);
    if nIsPS_lan1 >= 1 then
        WNpc:Talk("B¹n ®ång hµnh cña ®¹i hiÖp ®· phôc sinh lÇn 1 råi, ®· qu¸ m¹nh råi!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end

    nSelectIdx = nSelectIdx or 0;
    if nSelectIdx == 0 then
        local tbSay = { "H·y chän h­íng phôc sinh cho b¹n ®ång hµnh cña <sex>:" };
        tinsert(tbSay, "Hç trî hÖ Néi C«ng/#_w_newbie_Give_PhucSinhPet1(1)");
        tinsert(tbSay, "Hç trî hÖ Ngo¹i C«ng/#_w_newbie_Give_PhucSinhPet1(2)");
        --tinsert(tbSay, "Ta ch­a muèn nhËn b©y giê/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    --- Give award
    _w_newbie_Give_PhucSinhPet1_AddBuff(nSelectIdx);
end
function _w_newbie_Give_PhucSinhPet1_AddBuff(nWay)
    local tNoiNgoai = {
        [1] = {
            { "Néi C«ng 6%", "state_m_attack_percent_add", 6 },
            { "Sinh Lùc +6000", "state_life_max_point_add", 8000 },
            { "Sinh Lùc 6%", "state_life_max_percent_add", 6 },
            { "Kh¸ng tÊt c¶ +12", "state_add_allability", 12 },
        },
        [2] = {
            { "Ngo¹i C«ng 12%", "state_p_attack_percent_add", 12 },
            { "Sinh Lùc +6000", "state_life_max_point_add", 10000 },
            { "Sinh Lùc 6%", "state_life_max_percent_add", 6 },
            { "Néi phßng/Ngo¹i phßng +60", "state_i_defence_point_add", 60 },
            { "Ngo¹i phßng +60", "state_o_defence_point_add", 60 },
        },
    }

    local t_pet_type = {
        [1] = { "Thá tr¾ng", 3333, 24 },
        [2] = { "Thá x¸m", 3333, 25 },
        [3] = { "Thá ®en", 3334, 26 },
    }

    ------------------------------
    local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B) / 10); --mod 10 lµ gi¸ trÞ x¸c ®Þnh cã Phôc Sinh PET
    nIsPS = (nIsPS + 1) * 10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B), 10);
    SetTask(TSK_PET_PS_GIAIDOAN_B, nIsPS); --set gi¸ trÞ x¸c ®Þnh cã Phôc Sinh PET
    -------------
    local nCount_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A) / 10);
    nCount_PET_PS = (nCount_PET_PS + 1) * 10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_A), 10);
    SetTask(TSK_PET_PS_GIAIDOAN_A, nCount_PET_PS); --set gi¸ trÞ x¸c ®Þnh sè lÇn Phôc Sinh PET
    -------------
    local nNewValue = SetBytePos(GetTask(TSK_PET_PS_GIAIDOAN_A), nWay, 4);
    SetTask(TSK_PET_PS_GIAIDOAN_A, nNewValue); -- set h­íng Phôc Sinh cña PET
    ------------- set c¸c chØ sè buff
    local nAttrId = 2908130; --29/08/13 + x
    for i = 1, getn(tNoiNgoai[nWay]) do
        CastState(tNoiNgoai[nWay][i][2], tNoiNgoai[nWay][i][3], -1, 1, nAttrId);
        nAttrId = nAttrId + 1;
    end
    ------------- add PET míi
    local nRand = gf_GetRandItemByTable(t_pet_type, 10000, 1);
    local nNewType = t_pet_type[nRand][3];
    local nResult = AddPet(nNewType);
    if nResult >= 0 then
        WNpc:Talk("Chóc mõng <sex> ®· chiªu mé B¹n §ång Hµnh thµnh c«ng!", WEnv.TRUE);
    else
        gf_WriteLogEx("PHUC SINH PET BK", "add thÊt b¹i", 1, "Add pet thÊt b¹i");
    end
    -------------
    WNpc:Talk("Chóc mõng <sex> ®· hoµn thµnh phôc sinh B¹n §ång Hµnh lÇn 1!", WEnv.TRUE);
    gf_WriteLogEx("PHUC SINH PET BK", "xong giai ®o¹n 2", 1, "Hoµn thµnh Giai §o¹n buff")

    _w_newbie_Give_PhucSinhPet2();
end
function _w_newbie_Give_PhucSinhPet2()
    --- buéc ph¶i ps lÇn 1 míi cho chän dßng 2
    local nIsPS_lan1 = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B) / 10), 10);
    local nIsPS_lan2 = floor(GetTask(TSK_PET_PSLAN2_TASK_1) / 1000000000);
    if nIsPS_lan1 < 1 then
        WNpc:Talk("H·y phôc sinh B¹n §ång Hµnh cña ®¹i hiÖp lÇn 1 xong råi h·y ®Õn gÆp ta!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end
    if nIsPS_lan2 >= 1 then
        Talk(1, "", "B¹n ®ång hµnh cña ®¹i hiÖp ®· phôc sinh lÇn 2 råi, ®· qu¸ m¹nh råi!");
        WNpc:Talk("B¹n ®ång hµnh cña ®¹i hiÖp ®· phôc sinh lÇn 2 råi, ®· qu¸ m¹nh råi!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end

    --- Give award
    VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_1, 1, 10, 10); -- t¨ng b­íc nhiÖm vô lªn gi¸ trÞ 1 lµ ®· phôc sinh pet lÇn 2 thµnh c«ng
    VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_2, 2, 10, 10);  -- t¨ng b­íc nhiÖm vô lªn gi¸ trÞ 2 lµ hoµn thµnh chuçi nhiÖm vô
    AddTitle(77, 1); -- title phôc sinh b¹n ®ång hµnh lÇn 2
    WNpc:Talk("Chóc mõng <sex> ®· hoµn thµnh phôc sinh B¹n §ång Hµnh lÇn 2!", WEnv.TRUE);
    gf_WriteLogEx("PHUC SINH PET LAN 2", "Hoµn thµnh nhanh PS Pet lÇn 2", 1, "Hoµn thµnh nhanh nv PS Pet lÇn 2");
end

---NhËn pet Lv5
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_HacBachKy(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 31168 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- H¾c B¹ch Kú
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn s¸ch pet cÊp 6
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_SachPetLv6(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 40037 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Tói Kü N¨ng B§H Lv6
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn s¸ch pet cÊp 7
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_SachPetLv7(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 40038 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Tói Kü N¨ng B§H Lv6
    };
    WAward:Give(tbAward, "item_newbie_card");
end
---NhËn §Þa Linh Tinh hoa
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_DiaLinhTinhHoa(nAmount)
    local tbAward = {
        { tbProp = {  2, 1, 31600}, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- §Þa Linh Tinh Hoa
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn 4 Linh Ph¸ch §¬n + 5 Håi Tiªn §¬n
function _w_newbie_Give_NguyenLieuHoaCanh(nLinhPhachDonAmount, nHoiTienDonAmount)
    local tbAward = {
        { tbProp = { 2, 1, 31239 }, nStack = nLinhPhachDonAmount, nStatus = ITEMSTATUS_LOCK }, -- Linh Ph¸ch §¬n
        { tbProp = { 2, 1, 30847 }, nStack = nHoiTienDonAmount, nStatus = ITEMSTATUS_LOCK }, -- Håi Tiªn §¬n
    };
    WAward:Give(tbAward, "item_newbie_card");
end

----------------------------------------------------------------------------------------------------

---@param nLevel number CÊp cña ®¸ quý 1-5, -1 lµ nhËn tÊt c¶
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_HuyetBoDe(nAmount)

    local tbAward = {
        { tbProp = { 2,1,31241 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- huyÕt Bå §Ò
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---NhËn B¨ng Th¹ch, M¶nh B¨ng Th¹ch söa ®å
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_RepairStone(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 148 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- M¶nh B¨ng Th¹ch
        { tbProp = { 2, 1, 149 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- B¨ng Th¹ch
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---NhËn c¸c lo¹i ®¸ mµi damage Lv1->Lv3
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_DaMai(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 30428 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Ma §ao Th¹ch CÊp 1
        { tbProp = { 2, 1, 30429 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Ma §ao Th¹ch CÊp 2
        { tbProp = { 2, 1, 30430 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Ma §ao Th¹ch CÊp 3
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---NhËn ®iÓm TiÕu Y Ph­êng + Phong Hoa
---@param nAmount number Sè l­îng cÇn add
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

---NhËn c¸c danh hiÖu th«ng th­êng (ph¸ qu©n + chiÕn cuång)
function _w_newbie_Give_NormalTitle()
    RemoveTitle(65, 3);
    RemoveTitle(70, 1);
    AddTitle(65, 3);
    AddTitle(70, 1);
    SetCurTitle(70, 1);
    WNpc:Talk("<sex> ®· nhËn ®­îc danh hiÖu ChiÕn Cuång, Ph¸ Qu©n!", WEnv.TRUE);
end

---NhËn c¸c lo¹i m¸u, l¾c
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_Medicine(nAmount)
    nAmount = tonumber(nAmount) or 0;

    local tbAward = {
        { tbProp = { 1, 0, 4 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- B¹ch V©n T¸n
        { tbProp = { 1, 0, 6 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- H¾c Ngäc §o¹n Tôc Cao
        { tbProp = { 1, 0, 9 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- §¹i Hoµn §¬n
        { tbProp = { 1, 0, 11 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- V¹n VËt Quy Nguyªn §¬n
        { tbProp = { 1, 0, 14 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Ngäc Linh T¸n
        { tbProp = { 1, 0, 16 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Sinh Sinh Hãa T¸n
        { tbProp = { 1, 0, 21 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- B«n Tinh NguyÖt §¬n
        { tbProp = { 1, 0, 26 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- §¹i NhËt D­¬ng T¸n
        { tbProp = { 1, 0, 32 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Cöu ChuyÓn Hoµn Hån §an
        { tbProp = { 1, 1, 1 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- B¸nh Ng«
        { tbProp = { 1, 1, 15 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- B¸nh Bét Vµng
        { tbProp = { 1, 1, 17 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Minh NguyÖt D¹
        { tbProp = { 1, 1, 19 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- T©y B¾c Väng

        { tbProp = { 1, 0, 30012 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Linh Chi Tôc MÖnh Hoµn
        { tbProp = { 1, 0, 30013 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Dao Tr× §¹i Hoµn §¬n
        { tbProp = { 1, 0, 30014 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- TuyÕt S©m Ph¶n KhÝ Hoµn
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---NhËn vµng, ®¬n vÞ tÝnh lµ ®ång
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_Money(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { nGold = nAmount }, -- Vµng
        --{ tbProp = { 2, 1, 539 }, nStack = nQuantity, nStatus = ITEMSTATUS_LOCK }, -- Hoµng Kim §¹i Hång Bao
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---NhËn ThÇn Hµnh B¶o §iÓn
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_ThanHanh(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 0, 200, 40 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- ThÇn Hµnh B¶o §iÓn
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---NhËn §¹i §Þnh Hån gi÷ c­êng ho¸ +10 trë lªn
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_DaiDinhHon(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 1113 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- §¹i §Þnh Hån
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---NhËn ngÉu nhiªn thó c­ìi
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_ThuCuoi(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 0, 105, 184 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK, nRate = 12.5 }, -- L¹c §µ Cõu Tr¾ng
        { tbProp = { 0, 105, 185 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK, nRate = 12.5 }, -- L¹c §µ Cõu §en
        { tbProp = { 0, 105, 186 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK, nRate = 12.5 }, -- L¹c §µ Cõu N©u
        { tbProp = { 0, 105, 187 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK, nRate = 12.5 }, -- L¹c §µ Cõu S÷a
        { tbProp = { 0, 105, 188 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK, nRate = 12.5 }, -- B¹ch Anh
        { tbProp = { 0, 105, 189 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK, nRate = 12.5 }, -- B¹ch Hoa
        { tbProp = { 0, 105, 191 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK, nRate = 12.5 }, -- B¹ch Khuª
        { tbProp = { 0, 105, 200 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK, nRate = 12.5 }, -- Phong Nghª
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---NhËn ThiÕt Tinh Lv1->Lv4
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_NLNuoiKimXa(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 30533 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- ThiÕt Tinh Lv1
        { tbProp = { 2, 1, 30534 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- ThiÕt Tinh Lv2
        { tbProp = { 2, 1, 30535 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- ThiÕt Tinh Lv3
        { tbProp = { 2, 1, 30612 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- ThiÕt Tinh Lv4
    };

    if nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

----------------------------------------------------------------------------------------------------

---NhËn V« Song ChiÕn ThÇn
---@param nLevel number C­êng ho¸ trang bÞ
function _w_newbie_Give_VoSongChienThan(nLevel)
    nLevel = tonumber(nLevel) or 0;
    WItem:AddSuit_VoSongChienThan(nLevel, ITEMSTATUS_LOCK, "item_newbie_card");
    local tbAward = {
        { tbProp = { 2, 1, 30525 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv5
        { tbProp = { 2, 1, 30531 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv5
    };
    WAward:Give(tbAward, "item_newbie_card");
end

----------------------------------------------------------------------------------------------------

---NhËn M¶nh BÝ §iÓn 27%
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_ManhBiDien27(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 40048 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- M¶nh BÝ §iÓn 27
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn M¶nh BÝ §iÓn 30%
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_ManhBiDien30(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 40049 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- M¶nh BÝ §iÓn 30
    };
    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn danh hiÖu Ph¸ V­¬ng 7 ngµy
function _w_newbie_Give_DanhHieuPhaVuong()
    AddTitle(200, 1);
    SetTitleTime(200, 1, GetTime() + DATETIME_SEC_ONE_WEEK);
    SetCurTitle(200, 1);
    WNpc:Talk("<sex> ®· nhËn ®­îc danh hiÖu Ph¸ V­¬ng h¹n 7 ngµy", WEnv.TRUE);
end

---NhËn danh hiÖu chiÕn thÇn 7 ngµy
function _w_newbie_Give_DanhHieuChienThan()
    AddTitle(200, 2);
    SetTitleTime(200, 2, GetTime() + DATETIME_SEC_ONE_WEEK);
    SetCurTitle(200, 2);
    WNpc:Talk("<sex> ®· nhËn ®­îc danh hiÖu ChiÕn ThÇn h¹n 7 ngµy", WEnv.TRUE);
end

---NhËn item Ch©n Vâ Hån Th¹ch
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_ChanVoHonThach(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 114, 143 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Ch©n Vâ Hån Th¹ch
    };

    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn item §¹i §Þnh Hån
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_DaiDinhHon(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 1113 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- §¹i §Þnh Hån
    };

    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn item §¸ Mµi vò khÝ
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_BuaCuongHoa(nLevel, nAmount)
    nLevel = tonumber(nLevel) or 0;
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {};

    if nLevel == -1 or nLevel == 12 then
        tinsert(tbAward, { tbProp = { 2, 1, 30424 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- C­êng hãa quyÓn 12
    end
    if nLevel == -1 or nLevel == 13 then
        tinsert(tbAward, { tbProp = { 2, 1, 30425 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- C­êng hãa quyÓn 13
    end
    if nLevel == -1 or nLevel == 14 then
        tinsert(tbAward, { tbProp = { 2, 1, 30426 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- C­êng hãa quyÓn 14
    end
    if nLevel == -1 or nLevel == 15 then
        tinsert(tbAward, { tbProp = { 2, 1, 30427 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }); -- C­êng hãa quyÓn 15
    end

    if getn(tbAward) > 0 and nAmount > 0 then
        WAward:Give(tbAward, "item_newbie_card");
    end
end

---NhËn item Thiªn Cang LÖnh
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_ThienCangLenh(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 95, 204 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Thiªn Cang LÖnh
    };

    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn item Thiªn M«n Kim LÖnh
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_ThienMonKimLenh(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 30370 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Thiªn M«n Kim LÖnh
    };

    WAward:Give(tbAward, "item_newbie_card");
end

---NhËn item manh Tuy Bien Chau
---@param nAmount number Sè l­îng cÇn add
function _w_newbie_Give_ManhTuyBienChau(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 40046 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- m¶nh Tïy biÕn ch©u
    };

    WAward:Give(tbAward, "item_newbie_card");
end
-----Mua B¸t Nh· nhá- 50 vµng/1
function _w_newbie_Buy_BatNhaLon(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 0, 504 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, --
    };
    if Pay(nAmount * 500000) == 1 then
        WAward:Give(tbAward, "item_newbie_card");
    else
        WNpc:Talk("HiÖn kh«ng ®ñ vµng");
    end
    --WAward:Give(tbAward, "item_newbie_card");
end
-----Mua Tói Hat Giong- 200 vµng/1
function _w_newbie_Buy_HatGiong(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 30087 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Thiªn M«n Kim LÖnh
    };
    if Pay(nAmount * 2000000) == 1 then
        WAward:Give(tbAward, "item_newbie_card");
    else
        WNpc:Talk("HiÖn kh«ng ®ñ vµng");
    end
    --WAward:Give(tbAward, "item_newbie_card");
end

function _w_newbie_Give_ThanhLongHon(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local tbAward = {
        { tbProp = { 2, 1, 31194 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Thiªn M«n Kim LÖnh
    };

    WAward:Give(tbAward, "item_newbie_card");
end
------------------ hµm b¸n gãi Thanh V©n Giíi H¹n
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
        WNpc:Talk("Ta chØ gióp c¸c nh©n sÜ cã c«ng tr¹ng thÊp h¬n th«i!");
        return WEnv.RETCODE_ERROR;
    end

    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 1, 30490 }, nCount = 1 }, -- Hoµng Kim §¹i Ng©n PhiÕu
        }
    };

    if WLib:PayMaterial(tbConsume) ~= WEnv.TRUE then
        return WEnv.RETCODE_CONSUMEERROR;
    end

    local nHonorAward = nHonorSet - nHonorBefore;
    WPlayer:ModifyHonor(nHonorAward);
    --WPlayer:LevelUpFair(160)
    SetTask(3510,100)
    WPlayerLog:WriteBattleLog("npc_tientrang", "NhËn nhanh 1 triÖu c«ng tr¹ng", 0, "", WPlayer:GetExp(), 0, nHonorBefore, nHonorAward, WPlayer:GetBattlePoint(), 0);
end


function _w_newbie_Give_HoaCanh120()
    local nFairLv = GetTask(3510);
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 95, 204 }, nCount = 25 }, -- Thiªn Cang lÖnh
            { tbProp = { 2, 1, 30370 }, nCount = 25 }, -- Thiªn m«n Kim LÖnh
            { tbProp = { 2, 1, 31239 }, nCount = 15 }, -- Linh Ph¸ch §¬n
        }
    };
    nLevel = 120;
    if nFairLv <110 or nFairLv >119 then
        Talk(1,"","Hãa M¹ch ph¶i nhã h¬n 120 vµ l¬n h¬n 110 míi ®­îc nhËn")
        return
    end
    if WLib:PayMaterial(tbConsume) == WEnv.TRUE and WPlayer:LevelUpFair(nLevel)== WEnv.RETCODE_SUCCESS then
        Talk(1,"","NhËn Hãa M¹ch 120 thµnh c«ng")
    else
        return WEnv.RETCODE_CONSUMEERROR;
    end
end
function _w_newbie_Give_HoaCanh130()
    local nFairLv = GetTask(3510);
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 95, 204 }, nCount = 50 }, -- Thiªn Cang lÖnh
            { tbProp = { 2, 1, 30370 }, nCount = 50 }, -- Thiªn m«n Kim LÖnh
            { tbProp = { 2, 1, 31239 }, nCount = 30 }, -- Linh Ph¸ch §¬n
        }
    };
    nLevel = 130;
    if nFairLv <120 or nFairLv >129 then
        Talk(1,"","Hãa M¹ch ph¶i nhã h¬n 130 vµ l¬n h¬n 120 míi ®­îc nhËn")
        return
    end
    if WLib:PayMaterial(tbConsume) == WEnv.TRUE and WPlayer:LevelUpFair(nLevel)== WEnv.RETCODE_SUCCESS then
        Talk(1,"","NhËn Hãa M¹ch 130 thµnh c«ng")
    else
        return WEnv.RETCODE_CONSUMEERROR;
    end
end
function _w_newbie_Give_VIP122023()
    local nFairLv = GetTask(3510) or 0;
    local nCheckTask= GetTask(WTASKID_TASK_HOAMACHVIPT12_STATUS) or 0
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 95, 204 }, nCount = 75 }, -- Thiªn Cang lÖnh
            { tbProp = { 2, 1, 30370 }, nCount = 75 }, -- Thiªn m«n Kim LÖnh
            { tbProp = { 2, 1, 31239 }, nCount = 45 }, -- Linh Ph¸ch §¬n
        }
    };
    local nLevel = 0;
    if nFairLv <140 then
        Talk(1,"HÖ Thèng:","Hãa M¹ch ph¶i lín h¬n 140 míi ®­îc sö dông")
        return
    end
    if nCheckTask==1 then
        Talk(1,"HÖ Thèng:","B¹n ®· nhËn Hç Trî nµy råi. Kh«ng thÓ nhËn thªm")
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
        Talk(1,"HÖ Thèng:","B¹n ®· ®¹t max Hãa C¶nh hiÖn t¹i kh«ng thÓ nhËn n÷a")
        return
    end
    if WLib:PayMaterial(tbConsume) == WEnv.TRUE and WPlayer:LevelUpFair(nLevel)== WEnv.RETCODE_SUCCESS then
        Talk(1,"","NhËn Hãa M¹ch VIP thµnh c«ng")
        SetTask(WTASKID_TASK_HOAMACHVIPT12_STATUS,1)
    else
        return WEnv.RETCODE_CONSUMEERROR;
    end
end
function _w_newbie_Buy_UHT_2024()
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 95, 204 }, nCount = 100 }, -- Thiªn Cang lÖnh
            { tbProp = { 2, 1, 30370 }, nCount = 100 }, -- Thiªn m«n Kim LÖnh
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
            { tbProp = { 2, 95, 204 }, nCount = 50 }, -- Thiªn Cang lÖnh
            { tbProp = { 2, 1, 30370 }, nCount = 50 }, -- Thiªn m«n Kim LÖnh
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
    KsgAward:Give(tbAward, 'NhËn bé Ph¸ Hån')
end
function _w_newbie_Buy_QhTuong()
    local nCurRank=GetTask(704);
    if nCurRank==0 then
        WNpc:Talk("B¹n ch­a cã qu©n Hµm. H·y ra TiÓu Ngäc ®¸nh gi¸ Qu©n hµm Tr­íc", 1);
        return
    end
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 1, 30230 }, nCount = 500 }, -- Xu vËt phÈm
        }
    };
    if WLib:PayMaterial(tbConsume) == WEnv.TRUE then
        if nCurRank < 0 then
            SetTask(704,-5)
        elseif nCurRank>0 then
            SetTask(704,5)
        end
        WNpc:Talk("Chóc m­ng b¹n ®· lªn Qu©n hµm T­íng", 1);
    else
        return WEnv.RETCODE_CONSUMEERROR;
    end
end

function _w_newbie_Buy_QhTuong_Unlimit()
    local nCurRank=GetTask(704);
    if nCurRank==0 then
        WNpc:Talk("B¹n ch­a cã qu©n Hµm. H·y ra TiÓu Ngäc ®¸nh gi¸ Qu©n hµm Tr­íc", 1);
        return
    end
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 1, 30230 }, nCount = 3000 }, -- Xu vËt phÈm
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
        WNpc:Talk("Chóc m­ng b¹n ®· lªn Qu©n hµm T­íng", 1);
    else
        return WEnv.RETCODE_CONSUMEERROR;
    end
end

function _t_newbie_Give_HoTro2024()
    local tbAward = {
        --{ nFunc = "_w_newbie_Give_1500000CongTrang()" }, -- 1500cONGtRANG
        { nFunc = "_w_newbie_Give_UyHoTuong(10)" }, -- uyHoTuong
        { nFunc = "WPlayer:LevelUpFair(140)" }, -- HoaCanh140
        { nFunc = "WItem:AddSuit_VanSuc(4, 4, 'item_newbie_card')" }, -- v¨n søc 4
        { tbProp = { 2, 1, 31307 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Chiªu Yªu Kú
        { tbProp = { 2, 1, 31122 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Linh khÝ rùc rì
        { tbProp = { 2, 114, 143 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Ch©n vâ hån th¹ch
        { tbProp = { 2, 102, 212 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- Th­¬ng H¶i Di Ch©u 5
        { tbProp = { 2, 102, 213 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Th­¬ng H¶i Di Ch©u 6
        { tbProp = { 2, 102, 214 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- Th­¬ng H¶i Di Ch©u 7
        { tbProp = { 2, 1, 31604 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Tinh VÉn Táa Linh Th¹ch 1
        { tbProp = { 2, 1, 31605 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Tinh VÉn Táa Linh Th¹ch 2
        { tbProp = { 2, 1, 31606 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Tinh VÉn Táa Linh Th¹ch 3
        { tbProp = { 2, 1, 31607 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Tinh VÉn Táa Linh Th¹ch 4
        { tbProp = { 2, 1, 31608 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Tinh VÉn Táa Linh Th¹ch 5
        { tbProp = { 2, 1, 31609 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Tinh VÉn Táa Linh Th¹ch 6
        { tbProp = { 2, 1, 1124 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Banh it chan Ga
        { tbProp = { 2, 1, 1125 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Banh it bat Bao
        { tbProp = { 2, 1, 1009 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- Thiªn Th¹ch Tinh Th¹ch
        { tbProp = { 2, 1, 30424 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- C­êng hãa quyÓn 12
        { tbProp = { 2, 1, 30425 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- C­êng hãa quyÓn 13
        { tbProp = { 2, 1, 30426 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- C­êng hãa quyÓn 14
        { tbProp = { 2, 1, 30427 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- C­êng hãa quyÓn 15
        { tbProp = { 2, 1, 30430 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- 100 ma ®ao th¹ch c3
        { tbProp = { 2, 1, 30687 }, nStack = 3000, nStatus = ITEMSTATUS_LOCK }, -- Th¸i NhÊt LÖnh
        { tbProp = { 2, 0, 554 }, nStack = 200, nStatus = ITEMSTATUS_LOCK }, -- Tu ch©n yÕu quyÕt
        { tbProp = { 2, 1, 31402 }, nStack = 100, nStatus = ITEMSTATUS_LOCK}, -- TÈy t©m 7
        { tbProp = { 2, 1, 31401 }, nStack = 100, nStatus = ITEMSTATUS_LOCK}, -- LuyÖn L« 7
        { tbProp = { 2, 1, 50257 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- lÖnh bµi më réng r­¬ng
        { tbProp = { 2, 1, 40057 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- M¶nh mËt tÞch bÝ ®iÓn 27
        { tbProp = { 2, 1, 30912 }, nStack = 20000, nStatus = ITEMSTATUS_LOCK }, -- hiÖp nghÜa chi cøng
    }
    if WLib:CheckInv(40, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end
    if WTask:Get(TASKID_HOTRO_NEW_2024_STATUS) ==1 then
        Talk(1,"","B¹n ®· nhËn phÇn th­ëng nµy råi")
    end
    if WAward:Give(tbAward, "tanthu") == WEnv.RETCODE_SUCCESS then
        WTask:Set(TASKID_HOTRO_NEW_2024_STATUS, 1);
    else
        Talk(1,"","Cã lçi! Liªn hÖ GM")
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
    WPlayerLog:WriteBattleLog("npc_tientrang", "NhËn nhanh 1.5 triÖu c«ng tr¹ng", 0, "", WPlayer:GetExp(), 0, nHonorBefore, nHonorAward, WPlayer:GetBattlePoint(), 0);
end

function _w_newbie_buy_HoaCanh2024(nValue)
    local nFairLv = GetTask(3510);
    local tbConsume = {
        tbItems = {
            { tbProp = { 2, 95, 204 }, nCount = 145+10*nValue }, -- Thiªn Cang lÖnh
            { tbProp = { 2, 1, 30370 }, nCount = 145+10*nValue }, -- Thiªn m«n Kim LÖnh
            { tbProp = { 2, 1, 31239 }, nCount = 50+10*nValue }, -- Linh Ph¸ch §¬n
        }
    };
    local nLevel = 200+10*nValue;
    local nNeedLevel = 190+10*nValue;
    if nFairLv < nNeedLevel or nFairLv >nLevel then
        Talk(1,"","Hãa M¹ch ch­a ®ñ ®iÒu kiÖn ®Ó nhËn")
        return
    end
    if WLib:PayMaterial(tbConsume) == WEnv.TRUE and WPlayer:LevelUpFair(nLevel)== WEnv.RETCODE_SUCCESS then
        Talk(1,"","NhËn Hãa M¹ch thµnh c«ng lªn cÊp: "..nLevel)
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
        return WNpc:Talk("<sex> ch­a ®ñ cÊp Hãa M¹ch C¶nh!"..nHMC, WEnv.TRUE);
    end
    if WTask:GetBit(WTASKID_NHAN_THUONG_HOAMACHCANH,nTaskBitId) ==1  then
        return WNpc:Talk("<sex> ®· nhËn th­ëng cÊp Hãa M¹ch C¶nh!"..nHMC, WEnv.TRUE);
    end
    if WLib:CheckInv(25, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end
    local tbAward = {
        [165] = {
            { tbProp = { 2, 1, 31614 }, nStack = 30,nStatus = ITEMSTATUS_LOCK }, -- TÈy t©m 8
            { tbProp = { 2, 1, 31615 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« 8
            { tbProp = { 2, 102, 214 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- Ch©u 7 khãa

        },
        [170] = {
            { tbProp = { 2, 1, 31614 }, nStack = 50,nStatus = ITEMSTATUS_LOCK }, -- TÈy t©m 8
            { tbProp = { 2, 1, 31615 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« 8
            { tbProp = { 2, 1, 40046 }, nStack = 200, nStatus = ITEMSTATUS_LOCK }, -- M¶nh tïy biªns chu
        },
        [175] = {
            { tbProp = { 2, 1, 40046 }, nStack = 300, nStatus = ITEMSTATUS_LOCK }, -- M¶nh tïy biÕn ch©u 7
            { tbProp = { 2, 1, 40137 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- Bét tr©n ch©u tinh anh
        },
        [180] = {
            { tbProp = { 2, 1, 31122 }, nStack = 200, nStatus = ITEMSTATUS_LOCK }, --Linh KhÝ rùc rì
            { tbProp = { 2, 1, 40137 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- Bét tr©n ch©u tinh anh
        },
        [190] = {
            { tbProp = { 2, 1, 30370 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- Thiªn M«n Kim LÖnh
            { tbProp = { 2, 95, 204 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- Thiªn cang lÖnh
            { tbProp = { 2, 1, 40137 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- Bét tr©n ch©u tinh anh
        },
        [200] = {
            { nFunc = "AddTitle(200, 3)" },
        },
    }
    if tbAward[nHMC] then
        WAward:Give(tbAward[nHMC], format("NhËn th­ëng HMC %s", nHMC));
        WTask:SetBit(WTASKID_NHAN_THUONG_HOAMACHCANH,nTaskBitId,1)
    end
    --Save give status

end
function _w_give_award_HMC()
    local tbSay = { format("<npcname>: Chµo <color=yellow>%s<color>, thêi gian hiÖn t¹i lµ %s!\n Mçi nh©n vËt <color=red>chØ nhËn th­ëng 1 lÇn t¹i 1 mèc<color>. ", WPlayer:GetName(), date("%Y-%m-%d %H:%M:%S")) };

    local tbSayOptionDef = {
        {
            szSelect = "Hãa M¹ch C¶nh 165",
            nTaskBitId = 1,
            nHMC = 165
        },
        {
            szSelect = "Hãa M¹ch C¶nh 170",
            nTaskBitId = 2,
            nHMC = 170
        },
        {
            szSelect = "Hãa M¹ch C¶nh 175",
            nTaskBitId = 3,
            nHMC = 175
        },
        {
            szSelect = "Hãa M¹ch C¶nh 180",
            nTaskId = 4,
            nHMC = 180
        },
        {
            szSelect = "Hãa M¹ch C¶nh 190",
            nTaskBitId = 5,
            nHMC = 190
        },
        {
            szSelect = "Hãa M¹ch C¶nh 200",
            nTaskBitId = 6,
            nHMC = 200
        },
    };

    local tbReadyGet = {};
    --local checkTop=GetTask(4064) or 0;
    for i = 1, getn(tbSayOptionDef) do
        if WTask:GetBit(WTASKID_NHAN_THUONG_HOAMACHCANH,tbSayOptionDef[i].nTaskBitId) == 0 and  GetTask(3510) >=tbSayOptionDef[i].nHMC  then
            --tinsert(tbSay, format("%s%s/#_w_give_award_HMC_end(%d, %d)", "", tbSayOptionDef[i].szSelect, tbSayOptionDef[i].nHMC, tbSayOptionDef[i].nTaskBitId));
            tinsert(tbSay, format("%s%s/#_w_give_award_HMC_end(%d, %d)", "Mèc: ", tbSayOptionDef[i].szSelect, tbSayOptionDef[i].nHMC, i));
            --tinsert(tbSay,"test"..i)
            --Msg2Player(tbSayOptionDef[i].szSelect)
        else
            --tinsert(tbReadyGet, format("%s%s/nothing", "[®· nhËn] ", tbSayOptionDef[i].szSelect));
        end
    end

    -- hiÓn thÞ ®· nhËn ë d­íi
    for i = 1, getn(tbReadyGet) do
        tinsert(tbSay, tbReadyGet[i]);
    end

    if getn(tbSay) == 1 then
        tbSay[1] = "Chµo <sex>! HiÖn kh«ng cã phÇn th­ëng nµo phï hîp víi b¹n hoÆc ®· ph¸t hÕt, khi kh¸c h·y quay l¹i!";
    end

    tinsert(tbSay, format("%s/nothing", "Ta chØ xem qua th«i."));
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
