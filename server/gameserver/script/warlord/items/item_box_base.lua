----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-01
--- Description: file base item r­¬ng më ra vËt phÈm
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
WItemBoxBase = {
    szKey = "",
    szName = "",
    szCaption = "<npcname>: Bªn trong cã chøa ngÉu nhiªn phÇn th­ëng gi¸ trÞ, <sex> muèn khai më b¶o r­¬ng",

    nOpenTypeTaskTempId = 0,

    bEnableLimitDaily = WEnv.FALSE,
    nLimitDailyTaskId = 0,
    nLimitDailyCount = 0,

    tbAwardTypes = {},
};

function WItemBoxBase:GetTodayUseCount()
    if self.nLimitDailyTaskId > 0 then
        return WTask:Get(self.nLimitDailyTaskId);
    end
    return 0;
end

function WItemBoxBase:ModifyTodayCount(nAddValue)
    if self.nLimitDailyTaskId > 0 then
        return WTask:Modify(self.nLimitDailyTaskId, nAddValue);
    end
    return WEnv.RETCODE_ERROR;
end

function WItemBoxBase:GetLastOpenType()
    if self.nOpenTypeTaskTempId > 0 then
        return WTaskTemp:Get(self.nOpenTypeTaskTempId);
    end
    return 0;
end

function WItemBoxBase:SaveOpenType(nType)
    if self.nOpenTypeTaskTempId > 0 then
        return WTaskTemp:Set(self.nOpenTypeTaskTempId, nType);
    end
    return WEnv.RETCODE_ERROR;
end

function WItemBoxBase:OnUse(nItemIdx, nOpenType, bAutoOpen)
    --WNpc:SayDialog({"B¶o r­¬ng t¹m ®ãng!", "Ta ®· hiÓu/nothing"})
    --do return 0; end

    local nLastOpenType = self:GetLastOpenType();
    if bAutoOpen == WEnv.NULL and nLastOpenType ~= 0 then
        self:OnUse(nItemIdx, nLastOpenType, WEnv.TRUE);
        return WEnv.RETCODE_SUCCESS;
    end

    --WTask:ResetDaily();

    if nOpenType == WEnv.NULL then
        local nTotalOpenType = getn(self.tbAwardTypes);
        if nTotalOpenType >= 1 then
            local szLimitStr = "?";
            if self.bEnableLimitDaily == WEnv.TRUE then
                szLimitStr = format(" lÇn thø %d/%d trong ngµy?", self:GetTodayUseCount(), self.nLimitDailyCount);
            end
            local tbSay = { self.szCaption .. szLimitStr };
            for nOpenType, tbAwardTypes in pairs(self.tbAwardTypes) do
                if nOpenType ~= "n" then
                    tinsert(tbSay, format("%s/#m_tbItem:OnUse(%d, %d)", tbAwardTypes.szName, nItemIdx, nOpenType));
                end
            end
            tinsert(tbSay, "T¹i h¹ chØ xem qua th«i/nothing");
            WNpc:SayDialog(tbSay);
            return WEnv.RETCODE_NEEDCONFIRM;
        elseif nTotalOpenType == 1 then
            self:OnUse(nItemIdx, 1);
            return WEnv.RETCODE_SUCCESS;
        else
            WNpc:Talk("Nh×n kü cã dßng ch÷ nhá hiÖn lªn \"cã g× ®©u mµ nh×n\"!");
            return WEnv.RETCODE_NOTOPEN;
        end
    end

    nOpenType = tonumber(nOpenType);
    if self.tbAwardTypes[nOpenType] == WEnv.NULL then
        self:SaveOpenType(0);
        WNpc:Talk("Bªn trong kh«ng cã g×!");
        return WEnv.RETCODE_NOTOPEN;
    end

    local tbItemConsumes = self.tbAwardTypes[nOpenType].tbItemConsumes or {};
    local tbFixedAward = self.tbAwardTypes[nOpenType].tbFixedAward or {};
    local tbRandomAward = self.tbAwardTypes[nOpenType].tbRandomAward or {};

    if tbItemConsumes.tbItems == WEnv.NULL then
        self:SaveOpenType(0);
        WNpc:Talk("Kh«ng t×m thÊy nguyªn liÖu phï hîp.", 1);
        return WEnv.RETCODE_CONSUMEERROR;
    end

    if WLib:CheckMaterial(tbItemConsumes, WEnv.NULL, WEnv.NULL, 1) ~= WEnv.TRUE then
        self:SaveOpenType(0);
        WNpc:Talk(format("<sex> cÇn %s\n(<color=green>mµu xanh<color> lµ ®ñ ®iÒu kiÖn, <color=red>mµu ®á<color> lµ kh«ng ®ñ ®iÒu kiÖn)", WLib:MaterialDescription(tbItemConsumes)), 1);
        return WEnv.RETCODE_CONSUMEERROR;
    end

    if WLib:CheckInv(WLib:GetMaterialNeedRoom(tbItemConsumes) + 3, 100) ~= WEnv.TRUE then
        self:SaveOpenType(0);
        return WEnv.RETCODE_NEEDROOM;
    end

    local nCurrentUseCount = self:GetTodayUseCount();
    if self.bEnableLimitDaily == WEnv.TRUE then
        if nCurrentUseCount >= self.nLimitDailyCount then
            self:SaveOpenType(0);
            WNpc:Talk(format("H«m nay <sex> ®· sö dông tèi ®a %d/%d råi, ngµy mai h·y thö l¹i!", nCurrentUseCount, self.nLimitDailyCount));
            return WEnv.RETCODE_USELIMIT;
        end
    end

    if type(self.CheckConditions) == "function" then
        local nRetCheck, szMsgCheck = self:CheckConditions(nType);
        if nRetCheck ~= WEnv.RETCODE_SUCCESS then
            if szMsgCheck ~= "" then
                self:SaveOpenType(0);
                WNpc:Talk(szMsgCheck);
            end
            return WEnv.RETCODE_ERROR;
        end
    end

    if WLib:PayMaterial(tbItemConsumes) ~= WEnv.TRUE then
        self:SaveOpenType(0);
        return WEnv.RETCODE_CONSUMEERROR;
    end

    self:ModifyTodayCount(1);
    self:SaveOpenType(nOpenType);
    if type(tbFixedAward) == "function" then
        tbFixedAward = tbFixedAward(nCurrentUseCount + 1, nOpenType);
    end
    if getn(tbFixedAward) > 0 then
        WAward:Give(tbFixedAward, format("%s_%d", self.szKey, nOpenType));
    end
    if getn(tbRandomAward) > 0 then
        WAward:GiveByRandom(tbRandomAward, format("%s_%d", self.szKey, nOpenType));
    end
    return WEnv.RETCODE_SUCCESS;
end
