----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-12-16
--- Description: ��nh ngh�a c�c h�m cho ho�t ��ng nh�n giftcode alphatest
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\online_activities\\giftcode_alphatest\\head.lua");
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
--- Act1: ��t top chi�n tr��ng
----------------------------------------------------------------------------------------------------
--- Ph�n th��ng top m�i tr�n chi�n tr��ng
function WGIFTCODE_ALPHATEST:GiveBattleTopAward(nRank)
    if WLib:IsTestServer() ~= WEnv.TRUE
            or g_WCFG_GIFTCODE_ALPHATEST:IsDateOpen() ~= WEnv.TRUE
    then
        return WEnv.RETCODE_NOTOPEN;
    end

    if self.tbBattleTopAwardDef[nRank] and self.tbBattleTopAwardDef[nRank].nGiftCodeId then
        WGiftCode:GenCode(self.tbBattleTopAwardDef[nRank].nGiftCodeId);
    end
end
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
--- Act2: L�m c�c nhi�m v�
----------------------------------------------------------------------------------------------------
--- H�m ho�n th�nh nhi�m v�
function WGIFTCODE_ALPHATEST:SuccessTaskReq(szTaskKey, nAddValue)
    if WLib:IsTestServer() ~= WEnv.TRUE
            or g_WCFG_GIFTCODE_ALPHATEST:IsDateOpen() ~= WEnv.TRUE
            or g_WCFG_GIFTCODE_ALPHATEST.bTaskReqEnable ~= WEnv.TRUE then
        return WEnv.RETCODE_NOTOPEN;
    end

    nAddValue = tonumber(nAddValue) or 1;

    local bFoundKey = WEnv.FALSE;

    for i = 1, getn(self.tbTaskReqAwardDef) do
        if bFoundKey == WEnv.TRUE then
            break ;
        end

        local tbTaskReq = self.tbTaskReqAwardDef[i].tbTaskReq[szTaskKey];
        if tbTaskReq ~= WEnv.NULL then

            if tbTaskReq.tbTaskByteReq ~= nil then
                local nCurrentCount = WTask:GetByte(tbTaskReq.tbTaskByteReq[1], tbTaskReq.tbTaskByteReq[2]);
                if nCurrentCount < tbTaskReq.tbTaskByteReq[3] then
                    bFoundKey = WEnv.TRUE;
                    WTask:SetByte(tbTaskReq.tbTaskByteReq[1], tbTaskReq.tbTaskByteReq[2], nCurrentCount + nAddValue);
                    WPlayer:Msg(format(self.tbMsgString[1], i, WTask:GetByte(tbTaskReq.tbTaskByteReq[1], tbTaskReq.tbTaskByteReq[2]), tbTaskReq.tbTaskByteReq[3]));
                    break ;
                end
            elseif tbTaskReq.tbTaskBitReq ~= nil then
                if WTask:GetBit(tbTaskReq.tbTaskByteReq[1], tbTaskReq.tbTaskByteReq[2]) == 0 then
                    bFoundKey = WEnv.TRUE;
                    WTask:SetBit(tbTaskReq.tbTaskByteReq[1], tbTaskReq.tbTaskByteReq[2], nAddValue);
                    WPlayer:Msg(format(self.tbMsgString[1], i, nAddValue, 1));
                    break ;
                end
            elseif tbTaskReq.tbTaskReq ~= nil then
                local nCurrentCount = WTask:Get(tbTaskReq.tbTaskReq[1]);
                if nCurrentCount < tbTaskReq.tbTaskReq[2] then
                    bFoundKey = WEnv.TRUE;
                    WTask:Set(tbTaskReq.tbTaskReq[1], nCurrentCount + nAddValue);
                    WPlayer:Msg(format(self.tbMsgString[1], i, WTask:Get(tbTaskReq.tbTaskReq[1]), tbTaskReq.tbTaskReq[2]));
                    break ;
                end
            end

        end
    end

    if bFoundKey == WEnv.FALSE then
        print(format("WGIFTCODE_ALPHATEST.tbTaskAwardDef[i][%s] not define!", szTaskKey));
    end
end
--- H�m l�y ra th�ng tin nhi�m v�, ��ng th�i c�ng l� h�m ki�m tra �� ho�n th�nh nhi�m v� ch�a
function WGIFTCODE_ALPHATEST:GetAllTaskReqStatus(nTaskIdx)
    local tbTaskStatus = {};
    if WLib:IsTestServer() == WEnv.TRUE
            and g_WCFG_GIFTCODE_ALPHATEST:IsDateOpen() == WEnv.TRUE
            and g_WCFG_GIFTCODE_ALPHATEST.bTaskReqEnable == WEnv.TRUE
            and self.tbTaskReqAwardDef[nTaskIdx] ~= WEnv.NULL
            and self.tbTaskReqAwardDef[nTaskIdx].tbTaskReq ~= WEnv.NULL
    then
        local nTaskReqCount = 0;
        local nCompleteTaskReqCount = 0;

        for k, v in pairs(self.tbTaskReqAwardDef[nTaskIdx].tbTaskReq) do
            if k ~= "n" and v ~= nil then
                nTaskReqCount = nTaskReqCount + 1;

                local tbTaskReq = v;

                if tbTaskReq ~= WEnv.NULL then
                    if tbTaskReq.tbTaskByteReq ~= nil then
                        local nCurrentCount = WTask:GetByte(tbTaskReq.tbTaskByteReq[1], tbTaskReq.tbTaskByteReq[2]);
                        if nCurrentCount >= tbTaskReq.tbTaskByteReq[3] then
                            nCompleteTaskReqCount = nCompleteTaskReqCount + 1;
                            tinsert(tbTaskStatus, format("<color=green>%s: �� ho�n th�nh %d/%d<color>", tbTaskReq.szTaskName, nCurrentCount, tbTaskReq.tbTaskByteReq[3]));
                        else
                            tinsert(tbTaskStatus, format("<color=red>%s: ch�a ho�n th�nh %d/%d<color>", tbTaskReq.szTaskName, nCurrentCount, tbTaskReq.tbTaskByteReq[3]));
                        end
                    elseif tbTaskReq.tbTaskBitReq ~= nil then
                        if WTask:GetBit(tbTaskReq.tbTaskByteReq[1], tbTaskReq.tbTaskByteReq[2]) == tbTaskReq.tbTaskByteReq[3] then
                            nCompleteTaskReqCount = nCompleteTaskReqCount + 1;
                            tinsert(tbTaskStatus, format("<color=green>%s: �� ho�n th�nh<color>", tbTaskReq.szTaskName));
                        else
                            tinsert(tbTaskStatus, format("<color=red>%s: ch�a ho�n th�nh<color>", tbTaskReq.szTaskName));
                        end
                    elseif tbTaskReq.tbTaskReq ~= nil then
                        local tbFnFormat = {
                            [701] = abs,
                        };
                        local nCurrentCount = WTask:Get(tbTaskReq.tbTaskReq[1]);
                        if type(tbFnFormat[tbTaskReq.tbTaskReq[1]]) == "function" then
                            nCurrentCount = tbFnFormat[tbTaskReq.tbTaskReq[1]](nCurrentCount);
                        end
                        if nCurrentCount >= tbTaskReq.tbTaskReq[2] then
                            nCompleteTaskReqCount = nCompleteTaskReqCount + 1;
                            tinsert(tbTaskStatus, format("<color=green>%s: �� ho�n th�nh %d/%d<color>", tbTaskReq.szTaskName, nCurrentCount, tbTaskReq.tbTaskReq[2]));
                        else
                            tinsert(tbTaskStatus, format("<color=red>%s: ch�a ho�n th�nh %d/%d<color>", tbTaskReq.szTaskName, nCurrentCount, tbTaskReq.tbTaskReq[2]));
                        end
                    end
                end

            end
        end

        if nTaskReqCount > 0 and nCompleteTaskReqCount == nTaskReqCount then
            return WEnv.TRUE, tbTaskStatus;
        end
    end
    return WEnv.FALSE, tbTaskStatus;
end
--- H�m trao th��ng nhi�m v� test
function WGIFTCODE_ALPHATEST:GiveTaskReqAward(nTaskIdx)
    if WLib:IsTestServer() ~= WEnv.TRUE
            or self.tbTaskReqAwardDef[nTaskIdx] == WEnv.NULL
            or self.tbTaskReqAwardDef[nTaskIdx].tbAwardDef == WEnv.NULL
    then
        return WEnv.RETCODE_NOTOPEN;
    end

    local nTaskIdSave = self.tbTaskReqAwardDef[nTaskIdx].tbAwardDef.nTaskId;
    local nBitId = self.tbTaskReqAwardDef[nTaskIdx].tbAwardDef.nBitId;
    local nGiftCodeId = self.tbTaskReqAwardDef[nTaskIdx].tbAwardDef.nGiftCodeId;

    if WTask:GetBit(nTaskIdSave, nBitId) ~= 0 then
        WNpc:Talk(self.tbMsgString[2], WEnv.TRUE);
        return WEnv.RETCODE_DENY;
    end

    if self:GetAllTaskReqStatus(nTaskIdx) == WEnv.TRUE then
        WTask:SetBit(nTaskIdSave, nBitId, 1);
        WGiftCode:GenCode(nGiftCodeId);
    else
        WNpc:Talk(self.tbMsgString[3], WEnv.TRUE);
    end
end
----------------------------------------------------------------------------------------------------
