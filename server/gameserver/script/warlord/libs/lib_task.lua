----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: c�c h�m li�n quan ��n task l�u c�a nh�n v�t, define taskid t�i \script\warlord\defines\define_task.lua
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\defines\\define_task.lua");
----------------------------------------------------------------------------------------------------
WTask = {};
----------------------------------------------------------------------------------------------------

function WTask:Modify(nTaskId, nValue, nAccessCode)
    self:Set(nTaskId, self:Get(nTaskId) + nValue, nAccessCode);
    return WEnv.RETCODE_SUCCESS;
end

function WTask:GetByte(nTaskId, nByte)
    return GetByte(self:Get(nTaskId), nByte)
end

function WTask:SetByte(nTaskID, nByte, nValue, nAccessCode)
    if nValue == WEnv.NULL or nValue > 255 then
        print("WTask:SetByte nValue > 255 or nil");
        return WEnv.RETCODE_ERROR;
    end
    self:Set(nTaskID, SetByte(self:Get(nTaskID), nByte, nValue), nAccessCode);
    return WEnv.RETCODE_SUCCESS;
end

function WTask:Set(nTaskId, nValue, nAccessCode)
    nAccessCode = nAccessCode or 0;
    SetTask(nTaskId, nValue, nAccessCode);
    return WEnv.RETCODE_SUCCESS;
end

function WTask:Get(nTaskId)
    return GetTask(nTaskId);
end

function WTask:SetBit(nTaskID, nBit, nValue, nAccessCode)
    if nValue == WEnv.NULL or nValue > 1 then
        print("ERROR:WTask:SetBit nValue > 1 or nil");
        return WEnv.RETCODE_ERROR;
    end
    self:Set(nTaskID, SetBit(self:Get(nTaskID), nBit, nValue), nAccessCode);
    return WEnv.RETCODE_SUCCESS;
end

function WTask:GetBit(nTaskID, nBit)
    return GetBit(self:Get(nTaskID), nBit);
end

function WTask:GetPosValue(nTaskId, nStart, nEnd)
    local nTaskValue = self:Get(nTaskId);
    return WLib:GetPosValue(nTaskValue, nStart, nEnd);
end

function WTask:SetPosValue(nTaskId, nSetValue, nStart, nEnd, nAccessCode)
    local nTaskValue = self:Get(nTaskId);
    nTaskValue = WLib:SetPosValue(nTaskValue, nSetValue, nStart, nEnd);
    return WTask:Set(nTaskId, nTaskValue, nAccessCode);
end

---Reset task theo ng�y
function WTask:ResetDaily()
    local tbTaskId = {
        -- Th�i gian treo onl h�ng ng�y
        WTASKID_TREO_ONLINE_MIN_DAILY_COUNT,
        
        -- S� l��t m� r��ng ho�t ��ng
        WTASKID_RUONG_BNL_DAILY_COUNT,
        WTASKID_RUONG_BNN_DAILY_COUNT,
        WTASKID_NEWBATTLE_EXPAWARD_DAILY_COUNT,
        WTASKID_RUONG_HOATDONG_DAILY_COUNT,
        -----------Tang Kiem+ Thai Hu moi
        WTASKID_DAYLY_TANGKIEM_DAILY_COUNT,
        WTASKID_DAYLY_THAIHU_DAILY_COUNT,
        WTASKID_RUONG_TANGKIEM_DAILY_COUNT,
        WTASKID_RUONG_THAIHU_DAILY_COUNT,
        WTASKID_DAYLY_VANTIEU_DAILY_COUNT,
        WTASKID_DAYLY_BATNHALON_DAILY_COUNT,
        WTASKID_DAYLY_TNC_DAILY_COUNT,
        
        -- S� l�n s� d�ng N� Oa B�o H�p v� Ng�i Sao May M�n
        WTASKID_USE_NUOA_DAILY,
        WTASKID_USE_NGOISAO_DAILY,

        -- Nhi�m v� ng�y
        { nType = "byte", nTaskId = WTASKID_DAILYTASK_BYTE, tbSubId = {
            WTASKID_DAILYTASK_BYTE_CTC_DONE,
            WTASKID_DAILYTASK_BYTE_CTP_DONE,
            WTASKID_DAILYTASK_BYTE_TNC_DONE,
        } },
        
        -- Tr�ng th�i nh�n th��ng nhi�m v� ng�y
        { nType = "bit", nTaskId = WTASKID_NEWBIE_GIVEDAILY_BIT, tbSubId = {
            WTASKID_NEWBIE_GIVEDAILY_BIT_VANG,
            WTASKID_NEWBIE_GIVEDAILY_BIT_BIDIEN,
            WTASKID_NEWBIE_GIVEDAILY_BIT_TUCHAN,
            WTASKID_NEWBIE_GIVEDAILY_BIT_LICHLUYEN,
            WTASKID_NEWBIE_GIVEDAILY_BIT_MANHMACGIA,
            WTASKID_NEWBIE_GIVEDAILY_BIT_SACHKYNANGPET,
            WTASKID_NEWBIE_GIVEDAILY_BIT_THUONGHAIDICHAU,
            WTASKID_NEWBIE_GIVEDAILY_BIT_BOTTRANCHAU,
            WTASKID_NEWBIE_GIVEDAILY_BIT_DAMAI,
            WTASKID_NEWBIE_GIVEDAILY_BIT_TTTT,
            WTASKID_NEWBIE_GIVEDAILY_BIT_TAYTAMLUYENLO,
            WTASKID_NEWBIE_GIVEDAILY_BIT_LUUKIM,
            WTASKID_NEWBIE_GIVEDAILY_BIT_THIENVANTHACH,
            --WTASKID_NEWBIE_GIVEDAILY_BIT_COKIMTHACH,
            WTASKID_NEWBIE_GIVEDAILY_BIT_DAQUY,
            WTASKID_NEWBIE_GIVEDAILY_BIT_VANSUC3,
            WTASKID_NEWBIE_GIVEDAILY_BIT_TCL,
            WTASKID_NEWBIE_GIVEDAILY_BIT_TMKL,
            WTASKID_NEWBIE_GIVEDAILY_BIT_TAYTAMLUYENLO7,
            WTASKID_NEWBIE_GIVEDAILY_BIT_SACHKYNANGPET6,
            WTASKID_NEWBIE_GIVEDAILY_BIT_NLHOACANH,
            WTASKID_NEWBIE_GIVEDAILY_BIT_HUYETBODE,
            WMISSION_AWARD_BIT_DAILY_NANGDONG_BATNHA,
            WMISSION_AWARD_BIT_DAILY_NANGDONG_VANTIEU,
            WMISSION_AWARD_BIT_DAILY_NANGDONG_CHIENTRUONGPHU,
            WMISSION_AWARD_BIT_DAILY_NANGDONGCHIENTRUONGCHINH,
        } },
        -- Tr�ng th�i nh�n c�c h� tr� h�ng ng�y �i�m n�ng ��ng
        { nType = "bit", nTaskId = WMISSION_AWARD_NANGDONG, tbSubId = {
            WMISSION_AWARD_BIT_DAILY_NANGDONG_BATNHA,
            WMISSION_AWARD_BIT_DAILY_NANGDONG_VANTIEU,
            WMISSION_AWARD_BIT_DAILY_NANGDONG_CHIENTRUONGPHU,
            WMISSION_AWARD_BIT_DAILY_NANGDONGCHIENTRUONGCHINH,
        } },

        -- Tr�ng th�i nh�n c�c h� tr� h�ng n�y t�i th� t�n th�
        { nType = "bit", nTaskId = WTASKID_NEWBIE_BIT_GIVE_STATUS, tbSubId = {
            WTASKID_NEWBIE_BIT_GIVE_KINHMACHDONGNHAN,
            WTASKID_NEWBIE_BIT_GIVE_KINHMACHNGANNHAN,
            WTASKID_NEWBIE_BIT_GIVE_SUADO,
        } },
        
        -- R��ng V�ng ��i Chi�n - Boss Th� Gi�i
        { nType = "bit", nTaskId = TASKID_WORLD_BOSS_USE, tbSubId = {
            1, -- R��ng nh� 1
            2, -- R��ng nh� 2
            3, -- R��ng l�n
        }, nAccessCode = TASK_ACCESS_CODE_WORLD_BOSS },
        
        -- ��ng Ph��ng B�o H�p - Boss T�i Nguy�n Chi�n
        WTASKID_OPENBOX_BOSSTNC_TODAY,
        WTASKID_OPENBOX_BOSSTET2024_TODAY,
        
    };
    
    local nToday = WDate:Today();
    if nToday ~= self:Get(WTASKID_CURRENT_DATE) then
        self:Set(WTASKID_CURRENT_DATE, nToday);
        
        for i = 1, getn(tbTaskId) do
            if type(tbTaskId[i]) == "number" then
                self:Set(tbTaskId[i], 0);
            elseif type(tbTaskId[i]) == "table" and type(tbTaskId[i].nTaskId) == "number" then
                if tbTaskId[i].nType == "bit" then
                    for j = 1, getn(tbTaskId[i].tbSubId) do
                        if type(tbTaskId[i].tbSubId[j]) == "number" then
                            self:SetBit(tbTaskId[i].nTaskId, tbTaskId[i].tbSubId[j], 0, tbTaskId[i].nAccessCode or 0);
                        end
                    end
                elseif tbTaskId[i].nType == "byte" then
                    for j = 1, getn(tbTaskId[i].tbSubId) do
                        if type(tbTaskId[i].tbSubId[j]) == "number" then
                            self:SetByte(tbTaskId[i].nTaskId, tbTaskId[i].tbSubId[j], 0, tbTaskId[i].nAccessCode or 0);
                        end
                    end
                elseif tbTaskId[i].nType == "task" then
                    self:Set(tbTaskId[i].nTaskId,0, tbTaskId[i].nAccessCode or 0);
                end
            end
        end
        
    end

    self:ResetWeekly();
end

---Reset task theo tu�n
function WTask:ResetWeekly()
    local tbTaskId = {
        -- Nhi�m v� tu�n
        { nType = "byte", nTaskId = WTASKID_WEEKLYTASK_BYTE, tbSubId = {
            WTASKID_WEEKLYTASK_BYTE_CTC_DONE,
            WTASKID_WEEKLYTASK_BYTE_CTP_DONE,
            WTASKID_WEEKLYTASK_BYTE_TNC_DONE,
        } },
        { nType = "byte", nTaskId = WTASKID_WEEKLYTASK2_BYTE, tbSubId = {
            WTASKID_WEEKLYTASK2_BYTE_BNL_DONE,
            WTASKID_WEEKLYTASK2_BYTE_VANTIEU_DONE,
            WTASKID_WEEKLYTASK2_BYTE_CUOPTIEU_DONE,
            WTASKID_WEEKLYTASK2_BYTE_BNN_DONE,
            WTASKID_WEEKLYTASK2_BYTE_HATGIONG_DONE,
        } },

        -- Tr�ng th�i nh�n th��ng c�a nhi�m v� tu�n
        { nType = "bit", nTaskId = WTASKID_WEEKLYTASK_GIVE_BIT, tbSubId = {
            WTASKID_WEEKLYTASK_GIVE_BIT_DANHHIEU,
            WTASKID_WEEKLYTASK_GIVE_BIT_MANHBIDIEN,
            WTASKID_WEEKLYTASK_GIVE_BIT_DICHAU,
            WTASKID_WEEKLYTASK_GIVE_BIT_TAYTAMLUYENLO,
            WTASKID_WEEKLYTASK_GIVE_BIT_TCL,
            WTASKID_WEEKLYTASK_GIVE_BIT_TMKL,
            WTASKID_WEEKLYTASK_GIVE_BIT_TAYTAMLUYENLO7,
            WTASKID_WEEKLYTASK_GIVE_BIT_Vang,
            WTASKID_WEEKLYTASK_GIVE_BIT_THANHLONGHON,
        } },
    };
    
    local nCurrentWeek = tonumber(date("%Y%W"));
    local nBeforeWeek = self:Get(WTASKID_CURRENT_WEEK);
    if nCurrentWeek ~= self:Get(WTASKID_CURRENT_WEEK) then
        self:Set(WTASKID_CURRENT_WEEK, nCurrentWeek);
        
        local szLogTime = date('%Y-%m-%d %H:%M:%S');
        WFileLog:WriteTabFile("data/warlord/fix_bug/weekly_reset.txt",
                { szLogTime, (WPlayer:GetAccount() or "") .. " ", (WPlayer:GetName() or "") .. " ", nBeforeWeek, nCurrentWeek, self:Get(WTASKID_CURRENT_WEEK) },
                { "szLogTime", "szAccount", "szRoleName", "nBeforeWeek", "nCurrentWeek", "nAfterWeek" });
        

        for i = 1, getn(tbTaskId) do
            if type(tbTaskId[i]) == "number" then
                self:Set(tbTaskId[i], 0);
            elseif type(tbTaskId[i]) == "table" and type(tbTaskId[i].nTaskId) == "number" then
                if tbTaskId[i].nType == "bit" then
                    for j = 1, getn(tbTaskId[i].tbSubId) do
                        if type(tbTaskId[i].tbSubId[j]) == "number" then
                            self:SetBit(tbTaskId[i].nTaskId, tbTaskId[i].tbSubId[j], 0, tbTaskId[i].nAccessCode or 0);
                        end
                    end
                elseif tbTaskId[i].nType == "byte" then
                    for j = 1, getn(tbTaskId[i].tbSubId) do
                        if type(tbTaskId[i].tbSubId[j]) == "number" then
                            self:SetByte(tbTaskId[i].nTaskId, tbTaskId[i].tbSubId[j], 0, tbTaskId[i].nAccessCode or 0);
                        end
                    end
                elseif tbTaskId[i].nType == "task" then
                    self:Set(tbTaskId[i].nTaskId,0, tbTaskId[i].nAccessCode or 0);
                end
            end
        end
        
    end
end
