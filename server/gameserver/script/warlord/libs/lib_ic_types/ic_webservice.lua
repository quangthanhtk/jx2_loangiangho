----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-21
--- Description: Giao ti�p gi�a web qu�n l� v� nh�n v�t trong game
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

    tbServiceDef = { -- service gi�i h�n t� 1-9, xem h��ng d�n t�i h�m WWebService:ParseScore, param th� 3 = true l� kh�ng c�n h�i player
        [enumWWebServiceLogTypes.KICK_PLAYER] = { "Kick t�i kho�n", "WWebService:KickPlayer", WEnv.TRUE },
        [enumWWebServiceLogTypes.CLEARPASS_BOX] = { "M� kh�a r��ng", "WWebService:ClearPassBox", WEnv.FALSE },
        [enumWWebServiceLogTypes.CLEARPASS_ITEM] = { "M� kh�a v�t ph�m", "WWebService:ClearPassItem", WEnv.FALSE },
        [enumWWebServiceLogTypes.CLEARPASS_ALL] = { "M� kh�a r��ng v� v�t ph�m", "WWebService:ClearPassAll", WEnv.FALSE },
        [enumWWebServiceLogTypes.LOCK_ACCOUNT] = { "Kick t�i kho�n", "WWebService:LockAccount", WEnv.TRUE },
    },

    tbMsgString = {
        [1] = "H� th�ng ch�a ghi nh�n ���c tin nh�n SMS h� tr� n�o!\n\n" ..
                "C� ph�p kick t�i kho�n: <color=green>KICK<color><d�u_c�ch><color=green>t�n_t�i_kho�n<color> g�i t�i <color=white>087 840 6458<color>\n" ..
                "C� ph�p m� kho� ��: <color=green>MKD<color><d�u_c�ch><color=green>t�n_t�i_kho�n<color> g�i t�i <color=white>087 840 6458<color>\n" ..
                "D�ng s� �i�n tho�i ��ng k� t�i kho�n so�n tin theo c� ph�p tr�n g�i ��n hotline, b�n s� nh�n ���c m�t m� b� m�t s� d�ng 1 l�n t�i ��y �� ti�p t�c l�a ch�n m� kho�. N�u �� nh�n tin m� kh�ng nh�n ���c m� b� m�t, h�y li�n h� admin �� ���c h� tr�.",
        [2] = "Xem h��ng d�n nh�n tin h� tr�",
        [3] = "\nTa �� hi�u r�i, ��ng ��i tho�i",
        [4] = "T�i kho�n n�y nh�n ���c m�t tin nh�n SMS y�u c�u h� tr�!\n\n" ..
                "<color=red>N�u kh�ng ph�i l� b�n, vui l�ng ch�n \"<color=yellow>H�y b� l�nh n�y, ��y kh�ng ph�i l� ch�nh ch�<color>\" v� c�p nh�p l�i th�ng tin t�i kho�n nhanh nh�t c� th� �� ��m b�o an to�n t�i s�n!<color>",
        [5] = "\n  * ��ng � nh�n h� tr� (nh�p m� nh�n ���c t� SMS)",
        [6] = "\n  * H�y b� l�nh n�y, ��y kh�ng ph�i l� ch�nh ch�",
        [7] = "\n  * T�m th�i ch�a c�n ��n, hi�n th� v�o l�n ��ng nh�p sau",
        [8] = "Nh�p m� OTP...",
        [9] = "Nh�p m� th�nh c�ng, vui l�ng ch�n h� tr� t��ng �ng:",
        [10] = "M� nh�p v�o <color=white>%d<color> kh�ng ��ng!\n" ..
                "M� n�y nh�n t� t�ng ��i h� tr� th�ng qua tin nh�n SMS ch�nh ch�, chi ti�t xem t�i m�c h��ng d�n.\n\n" ..
                "<color=red>L�u �: nh�p sai m� %d/%d l�n s� b� kh�a t�i kho�n.<color>",
        [11] = "B�n mu�n t�m d�ng thao t�c cho ��n l�n ��ng nh�p sau?",
        [12] = "B�n mu�n x�a m� h� tr� n�y?",
        [13] = "<color=green>B�n �� ���c m� kh�a r��ng ��!<color>\n\n" .. 
                "<color=red>Ch� � b�o qu�n t�i s�n sau khi m� kh�a!<color>",
        [14] = "<color=green>B�n �� ���c m� kh�a t�t c� c�c trang b� tr�n ng��i, h�y tr� l�i �� ho�n t�t qu� tr�nh!<color>\n\n" ..
                "<color=red>Ch� � b�o qu�n t�i s�n sau khi m� kh�a!<color>",
        [15] = "��ng nh�p l�i �� ho�n t�t qu� tr�nh",
        [16] = "\nT�m th�i ch�a mu�n tho�t game",
        [17] = "<color=green>B�n �� ���c m� kh�a r��ng v� t�t c� c�c trang b� tr�n ng��i, h�y tr� l�i �� ho�n t�t qu� tr�nh!<color>\n\n" ..
                "<color=red>Ch� � b�o qu�n t�i s�n sau khi m� kh�a!<color>",
    },
});

--- H�m t�ch nServiceID, nOTP t� nPoint,
--- nServiceID gi� tr� t� 1-9
--- nOTP gi� tr� random t� 1000-5000
--- vd: nPoint=12364 th� nServiceId= 4, nOTP= 1236
--- c�p nh�p thay ��i, ch� c�n nPoint > 10 th� s� t�nh l� nOTP, nOTP random 1000->50000
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
            -- th�c hi�n tr�c ti�p kh�ng c�n h�i
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
            --    szAccount = "T�n_T�i_Kho�n";
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
--- C�c h�m service ���c khai b�o tr�n WWebService.tbServiceDef
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