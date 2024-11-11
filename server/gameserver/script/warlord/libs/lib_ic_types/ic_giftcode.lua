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
            { tbProp = { 0, 121, 327 + nBodyOffset }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nExpiredTime = nDate * 24 * 3600 }, -- Tr¶o
        }, nRate = 50 },
        { [1] = {
            { tbProp = { 0, 119, 331 + nBodyOffset }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nExpiredTime = nDate * 24 * 3600 }, -- Táa
            { tbProp = { 0, 120, 331 + nBodyOffset }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nExpiredTime = nDate * 24 * 3600 }, -- Song
            { tbProp = { 0, 121, 331 + nBodyOffset }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nExpiredTime = nDate * 24 * 3600 }, -- Hµn
        }, nRate = 50 },
    };
    WAward:Give(tbAward, "KÝch ho¹t code fan cøng");
end
WGiftCode = WIC:RegType("warlord_giftcode", {
    fnDebug = nothing,
    bClearRoundLeft = WEnv.FALSE, -- switch t¾t lÖnh t¹o nhiÒu code 1 l­ît
    szDirPath = "data/warlord/giftcode/",
    szFileName = "giftcode_%d.txt",

    tbMsgString = {
        [1] = "Giftcode nµy ®· tån t¹i, h·y liªn hÖ nhµ ph¸t hµnh ®Ó xö lý!",
        [2] = "Chóc mõng <sex> nhËn ®­îc 1 GiftCode <color=green>%s<color>: \n" ..
                "M· cña b¹n lµ: <color=yellow>%s<color> \n" ..
                "H·y l­u l¹i ®Ó sö dông kÝch ho¹t trong cÈm nang sù kiÖn!",
        [3] = "§a t¹, ta ®· hiÓu.",
        [4] = "NhËn GiftCode thÊt b¹i, h·y liªn hÖ nhµ ph¸t hµnh ®Ó xö lý!",
        [5] = "M· kh«ng cã sè 0",
        [6] = "PhÇn th­ëng GiftCode [<color=white>%s<color>] kh«ng tån t¹i hoÆc ®· hÕt h¹n!",
        [7] = "GiftCode [<color=white>%s<color>] ®· ®­îc kÝch ho¹t hoÆc kh«ng ®óng!",
        [8] = "PhÇn th­ëng GiftCode [<color=white>%s<color>] kh«ng tån t¹i hoÆc ®· hÕt h¹n!",
        [9] = "Chóc mõng <sex> ®· kÝch ho¹t giftcode [<color=white>%s<color>] thµnh c«ng, h·y kiÓm tra l¹i phÇn th­ëng!",
        [10] = "§a t¹, ®Ó ta xem qua.",
        [11] = "KÝch ho¹t GiftCode [<color=white>%s<color>] kh«ng thµnh c«ng, h·y liªn hÖ nhµ ph¸t hµnh ®Ó xö lý!",
        [12] = "Tµi kho¶n nµy ®· kÝch ho¹t %d/%d lÇn lo¹i GiftCode nµy, kh«ng thÓ kÝch ho¹t thªm ®­îc n÷a!",
    },

    nCodeLength = 6,
    tbAwardDef = {
        -- 1 -> 10 lµ th­ëng top 10 chiÕn tr­êng tèng liªu svr test
        [1] = {
            szName = "Top 1 chiÕn tr­êng chÝnh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 50 }, -- Phong Bao 10k VND
            },
        },
        [2] = {
            szName = "Top 2 chiÕn tr­êng chÝnh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 50 }, -- Phong Bao 10k VND
            },
        },
        [3] = {
            szName = "Top 3 chiÕn tr­êng chÝnh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 50 }, -- Phong Bao 10k VND
            },
        },
        [4] = {
            szName = "Top 4 chiÕn tr­êng chÝnh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 50 }, -- Phong Bao 10k VND
            },
        },
        [5] = {
            szName = "Top 5 chiÕn tr­êng chÝnh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 50 }, -- Phong Bao 10k VND
            },
        },
        [6] = {
            szName = "Top 6 chiÕn tr­êng chÝnh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 20 }, -- Phong Bao 10k VND
            },
        },
        [7] = {
            szName = "Top 7 chiÕn tr­êng chÝnh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 20 }, -- Phong Bao 10k VND
            },
        },
        [8] = {
            szName = "Top 8 chiÕn tr­êng chÝnh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 20 }, -- Phong Bao 10k VND
            },
        },
        [9] = {
            szName = "Top 9 chiÕn tr­êng chÝnh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 20 }, -- Phong Bao 10k VND
            },
        },
        [10] = {
            szName = "Top 10 chiÕn tr­êng chÝnh",
            bEnable = 0,
            nActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 40062 }, nStack = 20 }, -- Phong Bao 10k VND
            },
        },
        [11] = {
            szName = "Code fan cøng",
            bEnable = 1,
            nActiveLimit = 1,
            nAccountActiveLimit = 1,
            tbAward = {
                { tbProp = { 2, 1, 30491 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- VÐ TiÓu y Vµng
                { tbProp = {2,0,398,1 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- B¸t Nh· Lín
               -- { tbProp = { 2, 1, 50293 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- L Bao Tø Thêi xu©n
                { tbProp = { 2, 102, 214 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- Th­¬ng H¶i Di Ch©u 7
                { tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Tói §¸ Quý CÊp 7
                { tbProp = { 2, 1, 30370 }, nStack = 2, nStatus = ITEMSTATUS_LOCK }, -- Thiªn M«n kim lÖnh
                { tbProp = { 2,95,204}, nStack = 2, nStatus = ITEMSTATUS_LOCK }, -- Thiªn Cang LÖnh
                { tbProp = {2,97,236 }, nStack = 500, nStatus = ITEMSTATUS_LOCK }, -- Thiªn kiªu lÖnh
            },
        },
        [12] = {
            szName = "Code chia sÎ",
            bEnable = 1,
            nActiveLimit = 1,
            nAccountActiveLimit = 1,
            tbAward = {
               -- { nFunc = "_w_newbie_Give_LichLuyen(0, 5000, 100)" }, -- 5000 ®iÓm lÞch luyÖn
                --{ nFunc = "award_tongscore(5000)" }, -- 5000 Cèng Hiªn Bang
                { tbProp = { 2, 1, 30914 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- LÖnh bµi cèng hiÕn Bang
                --{ tbProp = {  2, 114, 143 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- 10 Ch©n vâ hån th¹ch
                { tbProp = { 2, 102, 213 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- Th­¬ng H¶i Di Ch©u 6
                { tbProp = { 2, 1, 1009 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- 20Thiªn th¹ch tinh th¹ch
                { tbProp = { 2, 0, 554 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- 100 Tu ch©n yÕu quyÕt
                { tbProp = { 2, 1, 31174 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- 50 ®iÓm phiÕu liªn ®Êu
                { tbProp = { 2, 1, 1068 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- thiªn th¹ch linh thach
                { tbProp = { 2, 1, 1067 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- tiÓu ®Þnh hån
                { tbProp = { 2, 1, 1113 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- ®¹i ®Þnh hån
            },
        },
        [13] = {
            szName = "Code livestream",
            bEnable = 1,
            nActiveLimit = 1,
            nAccountActiveLimit = 1,
            tbAward = {
                { tbProp = { 2, 102, 214 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Th­¬ng H¶i Di Ch©u 7
                { tbProp = { 2, 114, 143 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Ch©n Vâ Hån Th¹ch
                { tbProp = { 2, 1, 30847 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Håi Tiªn §¬n
                { tbProp = { 2, 1, 30914 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- LÖnh bµi cèng hiÕn Bang
                { tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Thiªn m«n kim lÖnh
                { tbProp = { 2, 95, 204 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Thiªn cang lÖnh
                --{ tbProp = { 2, 1, 31244 }, nStack = 200, nStatus = ITEMSTATUS_LOCK }, -- M¶nh C¬ Quan MÆc Gia
            },
        },
        [14] = {
            szName = "Code tr¶i nghiÖm",
            bEnable = 0,
            nActiveLimit = 1,
            nAccountActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 1, 50001 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- ThÎ Tr¶i NghiÖm
                --{ nFunc = "WTask:SetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_ACTIVETESTCARD, 1)" },
            },
        },
        [15] = {
            szName = "Code hoµn thµnh ho¹t ®éng AlphaTest Mèc 1",
            bEnable = 0,
            nActiveLimit = 1,
            nAccountActiveLimit = 1,
            tbAward = {
                { tbProp = { 2, 102, 211 }, nStack = 15, nStatus = ITEMSTATUS_LOCK }, -- Th­¬ng H¶i Ch©u CÊp4
                { tbProp = { 2, 1, 30525 }, nStack = 200, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv5
                { tbProp = { 2, 1, 30531 }, nStack = 200, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv5
                { tbProp = { 2, 1, 40047 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- M¶nh BÝ §iÓn 25
                { tbProp = {2, 114, 143}, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- Ch©n vâ hån th¹ch
            },
        },
        [16] = {
            szName = "Code hoµn thµnh ho¹t ®éng AlphaTest Mèc 2",
            bEnable = 0,
            nActiveLimit = 1,
            nAccountActiveLimit = 1,
            tbAward = {
                { tbProp = { 2, 102, 211 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- Th­¬ng H¶i Ch©u CÊp 4 (Ch­a gi¸m ®Þnh)
                { tbProp = { 2, 1, 30525 }, nStack = 300, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv6
                { tbProp = { 2, 1, 30531 }, nStack = 300, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv6
                { tbProp = { 2, 1, 40048 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- M¶nh BÝ §iÓn 27
                { tbProp = { 2, 1, 30914 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- LÖnh bµi CH Bang
            },
        },
        [17] = {
            szName = "Code hoµn thµnh ho¹t ®éng AlphaTest Mèc 3",
            bEnable = 0,
            nActiveLimit = 1,
            nAccountActiveLimit = 1,
            tbAward = {
                --{ tbProp = { 2, 102, 214 }, nStack = 15, nStatus = ITEMSTATUS_LOCK }, -- Th­¬ng H¶i Ch©u CÊp 7 (Ch­a gi¸m ®Þnh)
                --{ tbProp = { 2, 1, 30526 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv6
                --{ tbProp = { 2, 1, 30532 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv6
                --{ tbProp = { 2, 1, 40048 }, nStack = 40, nStatus = ITEMSTATUS_LOCK }, -- M¶nh BÝ §iÓn 27
                --{ tbProp = { 2, 1, 40046 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- M¶nh Tïy BiÕn Ch©u
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
    --WNpc:Talk("TÝnh n¨ng giftcode t¹m ®ãng, mêi ®¹i hiÖp khi kh¸c h·y quay l¹i!", 1);
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
