----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-08-17
--- Description: Giftcode
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\functions\\function_book.lua");
----------------------------------------------------------------------------------------------------
enumWGiftCodeLogTypes = {
    DUPLICATE = 1,
    GENSUCCESS = 2,
    ACTIVECODE = 3,
};
function _w_giftcode_AddCanhFanCung(nDate)
    nDate = nDate or 30;
    local nBodyOffset = WPlayer:GetBody() - 1;
    local tbAward = {
        { [1] = {
            { tbProp = { 0, 119, 327 + nBodyOffset }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nExpiredTime = nDate * 24 * 3600 }, -- Thanh
            { tbProp = { 0, 120, 327 + nBodyOffset }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nExpiredTime = nDate * 24 * 3600 }, -- Linh
            { tbProp = { 0, 121, 327 + nBodyOffset }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nExpiredTime = nDate * 24 * 3600 }, -- Tr�o
        }, nRate = 50 },
        { [1] = {
            { tbProp = { 0, 119, 331 + nBodyOffset }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nExpiredTime = nDate * 24 * 3600 }, -- T�a
            { tbProp = { 0, 120, 331 + nBodyOffset }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nExpiredTime = nDate * 24 * 3600 }, -- Song
            { tbProp = { 0, 121, 331 + nBodyOffset }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nExpiredTime = nDate * 24 * 3600 }, -- H�n
        }, nRate = 50 },
    };
    WAward:Give(tbAward, "K�ch ho�t code fan c�ng");
end
WGiftCode = WIC:RegType("warlord_giftcode", {
    fnDebug = nothing,
    bClearRoundLeft = WEnv.FALSE, -- switch t�t l�nh t�o nhi�u code 1 l��t
    szDirPath = "data/warlord/giftcode/",
    szFileName = "giftcode_%d.txt",

    tbMsgString = {
        [1] = "Giftcode n�y �� t�n t�i, h�y li�n h� nh� ph�t h�nh �� x� l�!",
        [2] = "Ch�c m�ng <sex> nh�n ���c 1 GiftCode <color=green>%s<color>: \n" ..
                "M� c�a b�n l�: <color=yellow>%s<color> \n" ..
                "H�y l�u l�i �� s� d�ng k�ch ho�t trong c�m nang s� ki�n!",
        [3] = "�a t�, ta �� hi�u.",
        [4] = "Nh�n GiftCode th�t b�i, h�y li�n h� nh� ph�t h�nh �� x� l�!",
        [5] = "M� kh�ng c� s� 0",
        [6] = "Ph�n th��ng GiftCode [<color=white>%s<color>] kh�ng t�n t�i ho�c �� h�t h�n!",
        [7] = "GiftCode [<color=white>%s<color>] �� ���c k�ch ho�t ho�c kh�ng ��ng!",
        [8] = "Ph�n th��ng GiftCode [<color=white>%s<color>] kh�ng t�n t�i ho�c �� h�t h�n!",
        [9] = "Ch�c m�ng <sex> �� k�ch ho�t giftcode [<color=white>%s<color>] th�nh c�ng, h�y ki�m tra l�i ph�n th��ng!",
        [10] = "�a t�, �� ta xem qua.",
        [11] = "K�ch ho�t GiftCode [<color=white>%s<color>] kh�ng th�nh c�ng, h�y li�n h� nh� ph�t h�nh �� x� l�!",
        [12] = "T�i kho�n n�y �� k�ch ho�t %d/%d l�n lo�i GiftCode n�y, kh�ng th� k�ch ho�t th�m ���c n�a!",
    },

    nCodeLength = 6,
    tbAwardDef = {
        -- 1 -> 10 l� th��ng top 10 chi�n tr��ng t�ng li�u svr test
        [1] = {
            szName = "Top 1 chi�n tr��ng ch�nh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 50 }, -- Phong Bao 10k VND
            },
        },
        [2] = {
            szName = "Top 2 chi�n tr��ng ch�nh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 50 }, -- Phong Bao 10k VND
            },
        },
        [3] = {
            szName = "Top 3 chi�n tr��ng ch�nh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 50 }, -- Phong Bao 10k VND
            },
        },
        [4] = {
            szName = "Top 4 chi�n tr��ng ch�nh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 50 }, -- Phong Bao 10k VND
            },
        },
        [5] = {
            szName = "Top 5 chi�n tr��ng ch�nh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 50 }, -- Phong Bao 10k VND
            },
        },
        [6] = {
            szName = "Top 6 chi�n tr��ng ch�nh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 20 }, -- Phong Bao 10k VND
            },
        },
        [7] = {
            szName = "Top 7 chi�n tr��ng ch�nh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 20 }, -- Phong Bao 10k VND
            },
        },
        [8] = {
            szName = "Top 8 chi�n tr��ng ch�nh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 20 }, -- Phong Bao 10k VND
            },
        },
        [9] = {
            szName = "Top 9 chi�n tr��ng ch�nh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 20 }, -- Phong Bao 10k VND
            },
        },
        [10] = {
            szName = "Top 10 chi�n tr��ng ch�nh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 20 }, -- Phong Bao 10k VND
            },
        },
        [11] = {
            szName = "Code fan c�ng",
            bEnable = 1,
            nActiveLimit = 1,
            nAccountActiveLimit = 1,
            tbAward = {
                { tbProp = { 2, 1, 30491 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- V� Ti�u y V�ng
                { tbProp = {2,0,398,1 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- B�t Nh� L�n
               -- { tbProp = { 2, 1, 50293 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- L Bao T� Th�i xu�n
                { tbProp = { 2, 102, 214 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- Th��ng H�i Di Ch�u 7
                { tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- T�i �� Qu� C�p 7
                { tbProp = { 2, 1, 30370 }, nStack = 2, nStatus = ITEMSTATUS_LOCK }, -- Thi�n M�n kim l�nh
                { tbProp = { 2,95,204}, nStack = 2, nStatus = ITEMSTATUS_LOCK }, -- Thi�n Cang L�nh
                { tbProp = {2,97,236 }, nStack = 500, nStatus = ITEMSTATUS_LOCK }, -- Thi�n ki�u l�nh
            },
        },
        [12] = {
            szName = "Code chia s�",
            bEnable = 1,
            nActiveLimit = 1,
            nAccountActiveLimit = 1,
            tbAward = {
               -- { nFunc = "_w_newbie_Give_LichLuyen(0, 5000, 100)" }, -- 5000 �i�m l�ch luy�n
                --{ nFunc = "award_tongscore(5000)" }, -- 5000 C�ng Hi�n Bang
                { tbProp = { 2, 1, 30914 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- L�nh b�i c�ng hi�n Bang
                --{ tbProp = {  2, 114, 143 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- 10 Ch�n v� h�n th�ch
                { tbProp = { 2, 102, 213 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- Th��ng H�i Di Ch�u 6
                { tbProp = { 2, 1, 1009 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- 20Thi�n th�ch tinh th�ch
                { tbProp = { 2, 0, 554 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- 100 Tu ch�n y�u quy�t
                { tbProp = { 2, 1, 31174 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- 50 �i�m phi�u li�n ��u
                { tbProp = { 2, 1, 1068 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- thi�n th�ch linh thach
                { tbProp = { 2, 1, 1067 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- ti�u ��nh h�n
                { tbProp = { 2, 1, 1113 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- ��i ��nh h�n
            },
        },
        [13] = {
            szName = "Code livestream",
            bEnable = 1,
            nActiveLimit = 1,
            nAccountActiveLimit = 1,
            tbAward = {
                { tbProp = { 2, 102, 214 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Th��ng H�i Di Ch�u 7
                { tbProp = { 2, 114, 143 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Ch�n V� H�n Th�ch
                { tbProp = { 2, 1, 30847 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- H�i Ti�n ��n
                { tbProp = { 2, 1, 30914 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- L�nh b�i c�ng hi�n Bang
                { tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Thi�n m�n kim l�nh
                { tbProp = { 2, 95, 204 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Thi�n cang l�nh
                --{ tbProp = { 2, 1, 31244 }, nStack = 200, nStatus = ITEMSTATUS_LOCK }, -- M�nh C� Quan M�c Gia
            },
        },
        [14] = {
            szName = "Code tr�i nghi�m",
            bEnable = 0,
            nActiveLimit = 1,
            nAccountActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 50001 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Th� Tr�i Nghi�m
                --{ nFunc = "WTask:SetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_ACTIVETESTCARD, 1)" },
            },
        },
        [15] = {
            szName = "Code ho�n th�nh ho�t ��ng AlphaTest M�c 1",
            bEnable = 0,
            nActiveLimit = 1,
            nAccountActiveLimit = 1,
            tbAward = {
                { tbProp = { 2, 102, 211 }, nStack = 15, nStatus = ITEMSTATUS_LOCK }, -- Th��ng H�i Ch�u C�p4
                { tbProp = { 2, 1, 30525 }, nStack = 200, nStatus = ITEMSTATUS_LOCK }, -- T�y T�m Th�ch Lv5
                { tbProp = { 2, 1, 30531 }, nStack = 200, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� Thi�t Lv5
                { tbProp = { 2, 1, 40047 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- M�nh B� �i�n 25
                { tbProp = {2, 114, 143}, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- Ch�n v� h�n th�ch
            },
        },
        [16] = {
            szName = "Code ho�n th�nh ho�t ��ng AlphaTest M�c 2",
            bEnable = 0,
            nActiveLimit = 1,
            nAccountActiveLimit = 1,
            tbAward = {
                { tbProp = { 2, 102, 211 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- Th��ng H�i Ch�u C�p 4 (Ch�a gi�m ��nh)
                { tbProp = { 2, 1, 30525 }, nStack = 300, nStatus = ITEMSTATUS_LOCK }, -- T�y T�m Th�ch Lv6
                { tbProp = { 2, 1, 30531 }, nStack = 300, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� Thi�t Lv6
                { tbProp = { 2, 1, 40048 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- M�nh B� �i�n 27
                { tbProp = { 2, 1, 30914 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- L�nh b�i CH Bang
            },
        },
        [17] = {
            szName = "Code ho�n th�nh ho�t ��ng AlphaTest M�c 3",
            bEnable = 0,
            nActiveLimit = 1,
            nAccountActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 102, 214 }, nStack = 15, nStatus = ITEMSTATUS_LOCK }, -- Th��ng H�i Ch�u C�p 7 (Ch�a gi�m ��nh)
                --{ tbProp = { 2, 1, 30526 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- T�y T�m Th�ch Lv6
                --{ tbProp = { 2, 1, 30532 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� Thi�t Lv6
                --{ tbProp = { 2, 1, 40048 }, nStack = 40, nStatus = ITEMSTATUS_LOCK }, -- M�nh B� �i�n 27
                --{ tbProp = { 2, 1, 40046 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- M�nh T�y Bi�n Ch�u
            },
        },
    },
});

function WGiftCode:ClearRoundLeft()
    self.bClearRoundLeft = WEnv.TRUE;
end

function WGiftCode:CheckCondition(nAwardIdx)
    if nAwardIdx == WEnv.NULL or (nAwardIdx < 1 and nAwardIdx > 50) then
        WNpc:Talk(format(self.tbMsgString[7], szCode), WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end

    if type(self.tbAwardDef[nAwardIdx].nAccountActiveLimit) == "number" then
        local szDataFilePath = format("\\%s%s", WLib:Replace(self.szDirPath, "/", "\\"), format(self.szFileName, nAwardIdx));
        local szFile = format(szDataFilePath, nAwardIdx);
        local tbFile = new(KTabFile, szFile);
        if tbFile == WEnv.NULL then
            TabFile_Unload(szFile);
            return WEnv.RETCODE_SUCCESS;
        end
        local nActiveCount = 0;
        local nRow = tbFile:getRow();
        for i = 1, nRow do
            local cell_szAccount = WLib:Trim(tbFile:getCell(i, 2) or "");
            if cell_szAccount ~= "" and cell_szAccount == WPlayer:GetAccount() then
                nActiveCount = nActiveCount + 1;
                if self.tbAwardDef[nAwardIdx].nAccountActiveLimit == 1 then
                    break ;
                end
            end
        end
        TabFile_Unload(szFile);
        if nActiveCount >= self.tbAwardDef[nAwardIdx].nAccountActiveLimit then
            WNpc:Talk(format(self.tbMsgString[12], nActiveCount, self.tbAwardDef[nAwardIdx].nAccountActiveLimit), WEnv.TRUE);
            return WEnv.RETCODE_ERROR;
        end
    end

    return WEnv.RETCODE_SUCCESS;
end

function WGiftCode:GenCode(nAwardIdx, bSilent, nAmount, nRoundLeft)
    nAwardIdx = nAwardIdx or "";
    bSilent = bSilent or WEnv.FALSE;
    nAmount = nAmount or 1;
    nRoundLeft = nRoundLeft or nAmount;
    if nAwardIdx == WEnv.NULL or self.tbAwardDef[nAwardIdx] == WEnv.NULL then
        return WEnv.RETCODE_NOTOPEN;
    end

    if nAmount > 1 then
        bSilent = WEnv.TRUE;
    end
    local szCode = WLib:GenRandomCode(self.nCodeLength);
    self:Get(szCode, "", WGiftCode.GenCode_cb, { szCode, nAwardIdx, bSilent, nAmount, nRoundLeft });
    return WEnv.RETCODE_SUCCESS;
end

function WGiftCode:GenCode_cb(nRetCode, nPoint, ...)
    local szCode = arg[1];
    local nAwardIdx = arg[2];
    local bSilent = arg[3];
    local nAmount = arg[4];
    local nRoundLeft = arg[5];
    if szCode == WEnv.NULL or szCode == "" or nAwardIdx == WEnv.NULL or self.tbAwardDef[nAwardIdx] == WEnv.NULL then
        return WEnv.RETCODE_NOTOPEN;
    end

    if nRetCode == 1 then
        self:WriteLog(enumWGiftCodeLogTypes.DUPLICATE, { "Duplicate code", WPlayer:GetAccount(), WPlayer:GetName() .. " ", nRetCode, nPoint, szCode, nAwardIdx, 0 }, szCode);
        if bSilent == WEnv.FALSE then
            WNpc:Talk(self.tbMsgString[1], WEnv.TRUE);
        end
    else
        self:Set(szCode, nAwardIdx, self:MakeScore(nAwardIdx, 0), WGiftCode.GenCode_cb2, { szCode, nAwardIdx, bSilent, nAmount, nRoundLeft });
    end
    return WEnv.RETCODE_SUCCESS;
end

function WGiftCode:GenCode_cb2(nRetCode, nPoint, ...)
    local szCode = arg[1];
    local nAwardIdx, nActiveTimes = self:ParseScore(nPoint);
    local bSilent = arg[3];
    local nAmount = arg[4];
    local nRoundLeft = arg[5];
    if szCode == WEnv.NULL or szCode == "" or nAwardIdx == WEnv.NULL or self.tbAwardDef[nAwardIdx] == WEnv.NULL then
        return WEnv.RETCODE_NOTOPEN;
    end

    if nRetCode == 1 then
        self:WriteLog(enumWGiftCodeLogTypes.GENSUCCESS, { "Generate success", WPlayer:GetAccount(), WPlayer:GetName() .. " ", nRetCode, nPoint, szCode, nAwardIdx, nActiveTimes }, szCode);
        if bSilent == WEnv.FALSE then
            WNpc:SayDialog({
                format(self.tbMsgString[2], self.tbAwardDef[nAwardIdx].szName, szCode),
                format("%s/nothing", self.tbMsgString[3]),
            });
            WPlayer:Msg(format("GiftCode %s: %s", self.tbAwardDef[nAwardIdx].szName, szCode));
            HeadMsg2Player(szCode);
            ProgressSlot(5, "#SendScript2Client('PrintScreen()')");
        end
        --print(format("Generate giftcode %d/%d: %s", nAmount-nRoundLeft+1, nAmount, szCode));
        if WPlayer:IsSuperAdmin() == WEnv.TRUE then
            WPlayer:Msg(format("Generate giftcode %d/%d: %s", nAmount - nRoundLeft + 1, nAmount, szCode));
            if self.bClearRoundLeft == WEnv.TRUE then
                self.bClearRoundLeft = WEnv.FALSE;
                nRoundLeft = 0;
            else
                if nRoundLeft > 1 then
                    WGiftCode:GenCode(nAwardIdx, bSilent, nAmount, nRoundLeft - 1);
                end
            end
        end
    else
        if bSilent == WEnv.FALSE then
            WNpc:Talk(self.tbMsgString[4], WEnv.TRUE);
        end
    end
end

function WGiftCode:ActiveCode(szCode)
    --WNpc:Talk("T�nh n�ng giftcode t�m ��ng, m�i ��i hi�p khi kh�c h�y quay l�i!", 1);
    --do return 0; end

    if WLib:CheckInv(50, 200) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    if szCode == WEnv.NULL then
        WLib:InputString("", self.tbMsgString[5], 1, 16, 0, WGiftCode.ActiveCode, WGiftCode);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szCode == "" then
        return WEnv.RETCODE_NOTOPEN;
    end

    self:Get(szCode, "", self.ActiveCode_cb, { strupper(szCode) });
    return WEnv.RETCODE_SUCCESS;
end

function WGiftCode:ActiveCode_cb(nRetCode, nPoint, ...)
    local szCode = arg[1];
    local nAwardIdx, nActiveTimes = self:ParseScore(nPoint);
    if szCode == WEnv.NULL or szCode == "" or nAwardIdx == WEnv.NULL or self.tbAwardDef[nAwardIdx] == WEnv.NULL then
        WNpc:Talk(format(self.tbMsgString[6], szCode), WEnv.TRUE);
        return WEnv.RETCODE_NOTOPEN;
    end

    if self.tbAwardDef[nAwardIdx].bEnable == 1 and nRetCode == 1 and nActiveTimes < self.tbAwardDef[nAwardIdx].nActiveLimit then
        if self:CheckCondition(nAwardIdx) == WEnv.RETCODE_SUCCESS then
            --local szQuery = format("UPDATE `%s` SET `roleName`=%q, `Score`=`Score`+1000 WHERE icKey=%q and roleName=%q;", self.szTableName, WPlayer:GetName(), szCode, "<noactive>");
            --SendGlbDBData(0, szQuery);
            self:Modify(szCode, "", 1, WGiftCode.ActiveCode_cb2, { szCode });
        end
    else
        WNpc:Talk(format(self.tbMsgString[7], szCode), WEnv.TRUE);
    end
    return WEnv.RETCODE_SUCCESS;
end

function WGiftCode:ActiveCode_cb2(nRetCode, nPoint, ...)
    local szCode = arg[1];
    local nAwardIdx, nActiveTimes = self:ParseScore(nPoint);
    if szCode == WEnv.NULL or szCode == "" or nAwardIdx == WEnv.NULL or self.tbAwardDef[nAwardIdx] == WEnv.NULL then
        WNpc:Talk(format(self.tbMsgString[8], szCode), WEnv.TRUE);
        return WEnv.RETCODE_NOTOPEN;
    end

    if nRetCode == 1 then
        WAward:Give(self.tbAwardDef[nAwardIdx].tbAward, format("Activate giftcode: %s szCode: %s", self.tbAwardDef[nAwardIdx].szName, szCode));

        local szFullLogContent = self:WriteLog(enumWGiftCodeLogTypes.ACTIVECODE, { "Activate success", WPlayer:GetAccount(), WPlayer:GetName() .. " ", nRetCode, nPoint, szCode, nAwardIdx, nActiveTimes }, szCode);

        local szDataFilePath = format("%s%s", self.szDirPath, format(self.szFileName, nAwardIdx));
        local pf = openfile(szDataFilePath, "a+");
        if pf == WEnv.NULL then
            execute(format("mkdir -p %q", self.szDirPath));
            pf = openfile(szDataFilePath, "a+");
        end
        write(pf, szFullLogContent .. "\n");
        closefile(pf);

        WNpc:SayDialog({
            format(self.tbMsgString[9], szCode),
            format("%s/nothing", self.tbMsgString[10]),
        });
    else
        WNpc:Talk(format(self.tbMsgString[11], szCode), WEnv.TRUE);
    end
    return WEnv.RETCODE_SUCCESS;
end
