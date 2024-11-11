----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-21
--- Description: Giao tiÕp gi÷a web qu¶n lý vµ nh©n vËt trong game
----------------------------------------------------------------------------------------------------
enumWWebServiceLogTypes = {
    KICK_PLAYER = 1,
    CLEARPASS_BOX = 2,
    CLEARPASS_ITEM = 3,
    CLEARPASS_ALL = 4,
    LOCK_ACCOUNT = 5,
};
WWebService = WIC:RegType("warlord_webservice", {
    fnDebug = nothing,
    nMaxVerifyFailed = 5,

    tbServiceDef = { -- service giíi h¹n tõ 1-9, xem h­íng dÉn t¹i hµm WWebService:ParseScore, param thø 3 = true lµ kh«ng cÇn hái player
        [enumWWebServiceLogTypes.KICK_PLAYER] = { "Kick tµi kho¶n", "WWebService:KickPlayer", WEnv.TRUE },
        [enumWWebServiceLogTypes.CLEARPASS_BOX] = { "Më khãa r­¬ng", "WWebService:ClearPassBox", WEnv.FALSE },
        [enumWWebServiceLogTypes.CLEARPASS_ITEM] = { "Më khãa vËt phÈm", "WWebService:ClearPassItem", WEnv.FALSE },
        [enumWWebServiceLogTypes.CLEARPASS_ALL] = { "Më khãa r­¬ng vµ vËt phÈm", "WWebService:ClearPassAll", WEnv.FALSE },
        [enumWWebServiceLogTypes.LOCK_ACCOUNT] = { "Kick tµi kho¶n", "WWebService:LockAccount", WEnv.TRUE },
    },

    tbMsgString = {
        [1] = "HÖ thèng ch­a ghi nhËn ®­îc tin nh¾n SMS hç trî nµo!\n\n" ..
                "Có ph¸p kick tµi kho¶n: <color=green>KICK<color><dÊu_c¸ch><color=green>tªn_tµi_kho¶n<color> göi tíi <color=white>087 840 6458<color>\n" ..
                "Có ph¸p më kho¸ ®å: <color=green>MKD<color><dÊu_c¸ch><color=green>tªn_tµi_kho¶n<color> göi tíi <color=white>087 840 6458<color>\n" ..
                "Dïng sè ®iÖn tho¹i ®¨ng ký tµi kho¶n so¹n tin theo có ph¸p trªn göi ®Õn hotline, b¹n sÏ nhËn ®­îc mét m· bÝ mËt sö dông 1 lÇn t¹i ®©y ®Ó tiÕp tôc lùa chän më kho¸. NÕu ®· nh¾n tin mµ kh«ng nhËn ®­îc m· bÝ mËt, h·y liªn hÖ admin ®Ó ®­îc hç trî.",
        [2] = "Xem h­íng dÉn nh¾n tin hç trî",
        [3] = "\nTa ®· hiÓu råi, ®ãng ®èi tho¹i",
        [4] = "Tµi kho¶n nµy nhËn ®­îc mét tin nh¾n SMS yªu cÇu hç trî!\n\n" ..
                "<color=red>NÕu kh«ng ph¶i lµ b¹n, vui lßng chän \"<color=yellow>Hñy bá lÖnh nµy, ®©y kh«ng ph¶i lµ chÝnh chñ<color>\" vµ cËp nhËp l¹i th«ng tin tµi kho¶n nhanh nhÊt cã thÓ ®Ó ®¶m b¶o an toµn tµi s¶n!<color>",
        [5] = "\n  * §ång ý nhËn hç trî (nhËp m· nhËn ®­îc tõ SMS)",
        [6] = "\n  * Hñy bá lÖnh nµy, ®©y kh«ng ph¶i lµ chÝnh chñ",
        [7] = "\n  * T¹m thêi ch­a cÇn ®Õn, hiÓn thÞ vµo lÇn ®¨ng nhËp sau",
        [8] = "NhËp m· OTP...",
        [9] = "NhËp m· thµnh c«ng, vui lßng chän hç trî t­¬ng øng:",
        [10] = "M· nhËp vµo <color=white>%d<color> kh«ng ®óng!\n" ..
                "M· nµy nhËn tõ tæng ®µi hç trî th«ng qua tin nh¾n SMS chÝnh chñ, chi tiÕt xem t¹i môc h­íng dÉn.\n\n" ..
                "<color=red>L­u ý: nhËp sai m· %d/%d lÇn sÏ bÞ khãa tµi kho¶n.<color>",
        [11] = "B¹n muèn t¹m dõng thao t¸c cho ®Õn lÇn ®¨ng nhËp sau?",
        [12] = "B¹n muèn xãa m· hç trî nµy?",
        [13] = "<color=green>B¹n ®· ®­îc më khãa r­¬ng ®å!<color>\n\n" .. 
                "<color=red>Chó ý b¶o qu¶n tµi s¶n sau khi më khãa!<color>",
        [14] = "<color=green>B¹n ®· ®­îc më khãa tÊt c¶ c¸c trang bÞ trªn ng­êi, h·y trë l¹i ®Ó hoµn tÊt qu¸ tr×nh!<color>\n\n" ..
                "<color=red>Chó ý b¶o qu¶n tµi s¶n sau khi më khãa!<color>",
        [15] = "§¨ng nhËp l¹i ®Ó hoµn tÊt qu¸ tr×nh",
        [16] = "\nT¹m thêi ch­a muèn tho¸t game",
        [17] = "<color=green>B¹n ®· ®­îc më khãa r­¬ng vµ tÊt c¶ c¸c trang bÞ trªn ng­êi, h·y trë l¹i ®Ó hoµn tÊt qu¸ tr×nh!<color>\n\n" ..
                "<color=red>Chó ý b¶o qu¶n tµi s¶n sau khi më khãa!<color>",
    },
});

--- Hµm t¸ch nServiceID, nOTP tõ nPoint,
--- nServiceID gi¸ trÞ tõ 1-9
--- nOTP gi¸ trÞ random tõ 1000-5000
--- vd: nPoint=12364 th× nServiceId= 4, nOTP= 1236
--- cËp nhËp thay ®æi, chØ cÇn nPoint > 10 th× sÏ tÝnh lµ nOTP, nOTP random 1000->50000
function WWebService:ParseScore(nPoint)
    nPoint = tonumber(nPoint) or 0;
    if nPoint >= 1 and nPoint <= 9 then
        return nPoint, 0;
    else
        return 0, nPoint;
    end

    --nPoint = tonumber(nPoint) or 0;
    --if nPoint >= 1 and nPoint < 9 then
    --    return nPoint, 0;
    --elseif nPoint > 10 then
    --    local szPoint = tostring(nPoint);
    --    local szServiceID = strsub(szPoint, strlen(szPoint), strlen(szPoint));
    --    local szOTP = strsub(szPoint, 0, strlen(szPoint)-strlen(szServiceID));
    --    --Msg2Player('szPoint='..szPoint, 'szServiceID='..szServiceID, 'szOTP='..szOTP);
    --    return tonumber(szServiceID), tonumber(szOTP);
    --end
    --return 0, 0;
end

function WWebService:CheckCode(bSilent)
    bSilent = bSilent or WEnv.FALSE;
    self:Get(WPlayer:GetAccount(), "", WWebService.CheckCode_cb, { bSilent });
    return WEnv.RETCODE_SUCCESS;
end

function WWebService:HowToUse()
    
end

function WWebService:CheckCode_cb(nRetCode, nPoint, ...)
    local bSilent = arg[1];
    local nServiceID, nOTP = self:ParseScore(nPoint);
    if nRetCode == 1 then
        if self.tbServiceDef[nServiceID] ~= WEnv.NULL and self.tbServiceDef[nServiceID][3] == WEnv.TRUE then
            -- thùc hiÖn trùc tiÕp kh«ng cÇn hái
            dostring(format("%s(%d,%d)", self.tbServiceDef[nServiceID][2], nServiceID, nOTP));
        else
            if nOTP > 0 then
                if bSilent == WEnv.FALSE or WTaskTemp:Get(WTASKTEMPID_WEBSERVICE_IGNORE) == 0 then
                    self:NoticePlayer(nServiceID, nOTP);
                end
            end
        end
    end

    if nOTP <= 0 then
        if bSilent == WEnv.FALSE then
            --local szAccount = strupper(WPlayer:GetAccount());
            --if WPlayer:IsGm() == WEnv.TRUE then
            --    szAccount = "Tªn_Tµi_Kho¶n";
            --end
            local tbSay = { self.tbMsgString[1],
                            --format("%s/WWebService:HowToUse", self.tbMsgString[2]),
                            format("%s/nothing", self.tbMsgString[3]),
            };
            WNpc:SayDialog(tbSay);
        end
    end

    return WEnv.RETCODE_SUCCESS;
end

function WWebService:NoticePlayer(nServiceID, nOTP)
    if nOTP > 0 then
        local tbSay = { self.tbMsgString[4],
                        format("%s/#WWebService:VerifyOTP(%d, %d)", self.tbMsgString[5], nServiceID, nOTP),
                        format("%s/#WWebService:DeleteOTP(%d, %d)", self.tbMsgString[6], nServiceID, nOTP),
                        format("%s/#WWebService:IgnoreOTP(%d, %d)", self.tbMsgString[7], nServiceID, nOTP),
        };

        WNpc:SayDialog(tbSay);
    end
end

function WWebService:VerifyOTP(nServiceID, nOTP, nConfirmOTP)
    if nConfirmOTP == WEnv.NULL then
        WLib:InputNumber(self.tbMsgString[8], 1, 50000, 0, WWebService.VerifyOTP, WWebService, nServiceID, nOTP);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if nOTP == nConfirmOTP then
        WTask:SetByte(WTASKID_WEBSERVICE_BYTE, WTASKID_WEBSERVICE_BYTE_VERIFY_FAILED_COUNT, 0);
        local tbSay = { self.tbMsgString[9] };

        for i = 1, getn(self.tbServiceDef) do
            if self.tbServiceDef[i][3] == WEnv.FALSE then
                tinsert(tbSay, format("  * %s/#%s(%d, %d)", self.tbServiceDef[i][1], self.tbServiceDef[i][2], nServiceID, nOTP));
            end
        end

        tinsert(tbSay, format("%s/#WWebService:IgnoreOTP(%d, %d)", self.tbMsgString[7], nServiceID, nOTP));
        WNpc:SayDialog(tbSay);
    else
        local nVerifyFailedCount = WTask:GetByte(WTASKID_WEBSERVICE_BYTE, WTASKID_WEBSERVICE_BYTE_VERIFY_FAILED_COUNT);
        WTask:SetByte(WTASKID_WEBSERVICE_BYTE, WTASKID_WEBSERVICE_BYTE_VERIFY_FAILED_COUNT, nVerifyFailedCount + 1);

        if nVerifyFailedCount + 1 >= self.nMaxVerifyFailed then
            seff:LockAccount(nServiceID, nOTP, format("SMS verify OPT failed nCount=%d/%d", nVerifyFailedCount + 1, self.nMaxVerifyFailed));
        else
            WNpc:Talk(format(self.tbMsgString[10], nConfirmOTP, nVerifyFailedCount + 1, self.nMaxVerifyFailed), WEnv.TRUE);
        end
    end
end

function WWebService:IgnoreOTP(nServiceID, nOTP, bConfirm)
    if bConfirm == WEnv.NULL then
        WNpc:SayConfirm(self.tbMsgString[11],
                format("WWebService:IgnoreOTP(%d, %d, 1)", nServiceID, nOTP),
                format("WWebService:CheckCode()"));
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    WTaskTemp:Set(WTASKTEMPID_WEBSERVICE_IGNORE, 1);
end

function WWebService:DeleteOTP(nServiceID, nOTP, bConfirm)
    if bConfirm == WEnv.NULL then
        WNpc:SayConfirm(self.tbMsgString[12],
                format("WWebService:DeleteOTP(%d, %d, 1)", nServiceID, nOTP),
                format("WWebService:CheckCode()"));
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    WTaskTemp:Set(WTASKTEMPID_WEBSERVICE_IGNORE, 0);
    local sQuery = format([[DELETE FROM `%s`.`%s` WHERE icKey=%q;]], self.szDataName, self.szTableName, WPlayer:GetAccount());
    SendGlbDBData(0, sQuery);
end
----------------------------------------------------------------------------------------------------
--- C¸c hµm service ®­îc khai b¸o trªn WWebService.tbServiceDef
function WWebService:KickPlayer(nServiceID, nOTP, szLogContent)
    szLogContent = szLogContent or "SMS kick player";
    self:WriteLog(enumWWebServiceLogTypes.KICK_PLAYER, { szLogContent, WPlayer:GetAccount(), WPlayer:GetName() .. " ", nServiceID, nOTP }, WPlayer:GetAccount());
    self:DeleteOTP(nServiceID, nOTP, 1);
    SaveNow();
    WIpMac:KickoutGame(szLogContent, WPlayer:GetName());
end

function WWebService:LockAccount(nServiceID, nOTP, szLogContent)
    szLogContent = szLogContent or "SMS lock account";
    self:WriteLog(enumWWebServiceLogTypes.LOCK_ACCOUNT, { szLogContent, WPlayer:GetAccount(), WPlayer:GetName() .. " ", nServiceID, nOTP }, WPlayer:GetAccount());
    self:DeleteOTP(nServiceID, nOTP, 1);
    SaveNow();
    WIpMac:SetLockAccountFlag(1, szLogContent, WPlayer:GetName(), 0);
    WIpMac:KickoutGame(szLogContent, WPlayer:GetName());
end

function WWebService:ClearPassBox(nServiceID, nOTP, szLogContent)
    szLogContent = szLogContent or "SMS clear box password";
    self:WriteLog(enumWWebServiceLogTypes.CLEARPASS_BOX, { szLogContent, WPlayer:GetAccount(), WPlayer:GetName() .. " ", nServiceID, nOTP }, WPlayer:GetAccount());
    self:DeleteOTP(nServiceID, nOTP, 1);
    CancelBoxPassword();
    SaveNow();
    WNpc:SayDialog({
        self.tbMsgString[13],
        format("%s/nothing", self.tbMsgString[3])
    });
end

function WWebService:ClearPassItem(nServiceID, nOTP, szLogContent)
    szLogContent = szLogContent or "SMS clear item password";
    self:WriteLog(enumWWebServiceLogTypes.CLEARPASS_BOX, { szLogContent, WPlayer:GetAccount(), WPlayer:GetName() .. " ", nServiceID, nOTP }, WPlayer:GetAccount());
    self:DeleteOTP(nServiceID, nOTP, 1);
    UnLockAllItem();
    SaveNow();
    WNpc:SayDialog({
        self.tbMsgString[14],
        format("%s/ExitGame", self.tbMsgString[15]),
        format("%s/nothing", self.tbMsgString[16]),
    });
end

function WWebService:ClearPassAll(nServiceID, nOTP, szLogContent)
    szLogContent = szLogContent or "SMS clear all password";
    self:WriteLog(enumWWebServiceLogTypes.CLEARPASS_BOX, { szLogContent, WPlayer:GetAccount(), WPlayer:GetName() .. " ", nServiceID, nOTP }, WPlayer:GetAccount());
    self:DeleteOTP(nServiceID, nOTP, 1);
    CancelBoxPassword();
    UnLockAllItem();
    SaveNow();
    WNpc:SayDialog({
        self.tbMsgString[17],
        format("%s/ExitGame", self.tbMsgString[15]),
        format("%s/nothing", self.tbMsgString[16]),
    });
end

----------------------------------------------------------------------------------------------------