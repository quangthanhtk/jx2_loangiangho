----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-08-17
--- Description: L­u ip mac cña nh©n vËt lóc login
----------------------------------------------------------------------------------------------------
enumWIpMacLogTypes = {
    KICKOUTGAME = 1,
    LOCKACCOUNT = 2,
    BANMAC = 3,
    VMWAREMAC = 4,
    MACLENGTH = 5,
    LOGINNORMAL = 6,
};
WIpMac = WIC:RegType("warlord_ipmac", {
    fnDebug = nothing,
    tbDec = { "11", "12", "13", "14", "15", "16", "17", "18", "19", "21", "22", "23", "24", "25", "26", "27" },
    tbHex = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F" },
    szNotFoundChar = "_",
    nNotFoundNum = 28,

    tbMsgString = {
        [1] = "<color=red>B¹n ®· bÞ chÆn ®¨ng nhËp do vi ph¹m luËt cña game, vui lßng liªn hÖ fanpage ®Ó biÕt thªm chi tiÕt!<color>",
    },
});
local szQuery = format([[ALTER TABLE %s.%s ADD COLUMN IF NOT EXISTS %s VARCHAR(255);]], "paysys", "account", "ExtendData");
SendGlbDBData(0, szQuery);

function WIpMac:MacEncrypt(szMACAddress)
    --szMACAddress = "0050-56C0-0001";
    szMACAddress = trim(strupper(szMACAddress));
    local nMacAddressLength = strlen(szMACAddress);
    local szNewMACAddress = "";
    for i = 1, nMacAddressLength do
        if i > 12 then
            -- giíi h¹n vßng lÆp
            break ;
        end
        local szChar = strsub(szMACAddress, i, i);
        local bIsFound = 0;
        for j = 1, getn(self.tbHex) do
            if szChar == self.tbHex[j] then
                szNewMACAddress = szNewMACAddress .. self.tbDec[j];
                bIsFound = 1;
                break ;
            end
        end
        if szChar ~= "-" and bIsFound == 0 then
            szNewMACAddress = szNewMACAddress .. self.nNotFoundNum;
        end
    end

    -- Ori: 0050-56C0-0001 => 005056C00001
    -- Encrypt: 11111611 16172411 11111112
    -- Max task: 2147483648

    local szPart1 = strsub(szNewMACAddress, 1, 8);
    local szPart2 = strsub(szNewMACAddress, 9, 16);
    local szPart3 = strsub(szNewMACAddress, 17, 24);
    --print("encrypt:", szNewMACAddress);
    --print("parse:", szPart1, szPart2, szPart3);
    --print("decrypt:", self:MacDecrypt(tonumber(szPart1), tonumber(szPart2), tonumber(szPart3)));
    return tonumber(szPart1), tonumber(szPart2), tonumber(szPart3);
end

function WIpMac:MacDecrypt(nPart1, nPart2, nPart3)
    local szMACAddress = "" .. nPart1 .. nPart2 .. nPart3;
    local nMacAddressLength = strlen(szMACAddress);
    local szNewMACAddress = "";
    for i = 1, nMacAddressLength, 2 do
        local szChar = strsub(szMACAddress, i, i + 1);
        local bIsFound = 0;
        for j = 1, getn(self.tbDec) do
            if szChar == self.tbDec[j] then
                szNewMACAddress = szNewMACAddress .. self.tbHex[j];
                bIsFound = 1;
                break ;
            end
        end
        if szChar ~= "-" and bIsFound == 0 then
            szNewMACAddress = szNewMACAddress .. self.szNotFoundChar;
        end
    end

    return szNewMACAddress;
end

function WIpMac:GetLastMac()
    local nMacHashPart1 = tostring(WTask:Get(WTASKID_LAST_MAC_PART1));
    local nMacHashPart2 = tostring(WTask:Get(WTASKID_LAST_MAC_PART2));
    local nMacHashPart3 = tostring(WTask:Get(WTASKID_LAST_MAC_PART3));
    return self:MacDecrypt(nMacHashPart1, nMacHashPart2, nMacHashPart3);
end

function WIpMac:GetCurrentMac()
    local nMacHashPart1 = tostring(WTask:Get(WTASKID_CURRENT_MAC_PART1));
    local nMacHashPart2 = tostring(WTask:Get(WTASKID_CURRENT_MAC_PART2));
    local nMacHashPart3 = tostring(WTask:Get(WTASKID_CURRENT_MAC_PART3));
    return self:MacDecrypt(nMacHashPart1, nMacHashPart2, nMacHashPart3);
end

function WIpMac:SaveIpMac(szIPAddress, szMACAddress)
    szMACAddress = szMACAddress or "";
    if szMACAddress == "" then
        return WEnv.RETCODE_ERROR;
    end

    local tbVMMACAddress = {
        ["0050-56C0-0001"] = 1,
        ["0050-56C0-0002"] = 1,
        ["0050-56C0-0003"] = 1,
        ["0050-56C0-0004"] = 1,
        ["0050-56C0-0005"] = 1,
        ["0050-56C0-0006"] = 1,
        ["0050-56C0-0007"] = 1,
        ["0050-56C0-0008"] = 1,
    };

    local szNewMacAddress = szMACAddress;
    local nLogType = enumWIpMacLogTypes.LOGINNORMAL;
    local nMacLength = strlen(szMACAddress);
    local szLogAction = "MAC valid";
    if nMacLength < 14 then
        -- < 14 lµ dcom
        if nMacLength >= 4 then
            szNewMacAddress = String2Hash(strsub(trim(szMACAddress), 1, 4));
            szLogAction = "MAC length >= 4";
        else
            szNewMacAddress = szIPAddress;
            szLogAction = "MAC length <= 4";
        end
        nLogType = enumWIpMacLogTypes.MACLENGTH;
    elseif tbVMMACAddress[szMACAddress] ~= WEnv.NULL then
        szNewMacAddress = szIPAddress .. '_' .. szMACAddress;
        nLogType = enumWIpMacLogTypes.VMWAREMAC;
        szLogAction = "MAC vmware detected";
    end

    local nMacHashPart1, nMacHashPart2, nMacHashPart3 = self:MacEncrypt(szNewMacAddress);
    self:WriteLog(nLogType, { szLogAction, WPlayer:GetAccount(), WPlayer:GetName() .. " ", 0, szIPAddress, szMACAddress }, WPlayer:GetAccount());
    self:Get(WIpMac:MacDecrypt(nMacHashPart1, nMacHashPart2, nMacHashPart3), "", WIpMac.SaveIpMac_cb1, { nMacHashPart1, nMacHashPart2, nMacHashPart3 });
    return WEnv.RETCODE_SUCCESS;
end

function WIpMac:SaveIpMac_cb1(nRetCode, nPoint, ...)
    local nMacHashPart1 = arg[1];
    local nMacHashPart2 = arg[2];
    local nMacHashPart3 = arg[3];
    if nMacHashPart1 == WEnv.NULL or nMacHashPart2 == WEnv.NULL or nMacHashPart3 == WEnv.NULL then
        return WEnv.RETCODE_NOTOPEN;
    end

    if nPoint > 0 then
        self:KickoutGame("login deny", "system_heimdall");
        return WEnv.RETCODE_SUCCESS;
    end

    if nRetCode == 0 then
        self:Set(WIpMac:MacDecrypt(nMacHashPart1, nMacHashPart2, nMacHashPart3), WPlayer:GetName(), 0, WIpMac.SaveIpMac_cb1, { nMacHashPart1, nMacHashPart2, nMacHashPart3 });
        return WEnv.RETCODE_SUCCESS;
    end

    ProgressSlot(1 * 18, format('#WIpMac:SaveIpMac_cb2(%d, %d, %d)', nMacHashPart1, nMacHashPart2, nMacHashPart3));
    return WEnv.RETCODE_SUCCESS;
end

function WIpMac:SaveIpMac_cb2(nMacHashPart1, nMacHashPart2, nMacHashPart3)
    WTask:Set(WTASKID_LAST_MAC_PART1, WTask:Get(WTASKID_CURRENT_MAC_PART1));
    WTask:Set(WTASKID_LAST_MAC_PART2, WTask:Get(WTASKID_CURRENT_MAC_PART2));
    WTask:Set(WTASKID_LAST_MAC_PART3, WTask:Get(WTASKID_CURRENT_MAC_PART3));
    WTask:Set(WTASKID_CURRENT_MAC_PART1, nMacHashPart1);
    WTask:Set(WTASKID_CURRENT_MAC_PART2, nMacHashPart2);
    WTask:Set(WTASKID_CURRENT_MAC_PART3, nMacHashPart3);
    return WEnv.RETCODE_SUCCESS;
end

function WIpMac:ClearIpMac()
    WTask:Set(WTASKID_CURRENT_MAC_PART1, 0);
    WTask:Set(WTASKID_CURRENT_MAC_PART2, 0);
    WTask:Set(WTASKID_CURRENT_MAC_PART3, 0);
    return WEnv.RETCODE_SUCCESS;
end

function WIpMac:KickoutGame(szReason, szActionBy)
    szReason = szReason or "unknow";
    szActionBy = szActionBy or "system";
    self:WriteLog(enumWIpMacLogTypes.KICKOUTGAME, { "Kickout game", WPlayer:GetAccount(), WPlayer:GetName() .. " ", 0, szActionBy, szReason }, WPlayer:GetAccount());
    ExitGame();
    return WEnv.RETCODE_SUCCESS;
end

function WIpMac:SetLockAccountFlag(bBanFlag, szReason, szActionBy, nAddCounter)
    szReason = WLib:RemoveTag((szReason or "unknow"), "<", ">");
    szActionBy = szActionBy or "system";
    bBanFlag = bBanFlag or 1;
    nAddCounter = nAddCounter or 1;
    if bBanFlag ~= 1 then
        bBanFlag = 0;
    end

    local szExtendData = "";
    if szReason ~= "" then
        szExtendData = WLib:Join(

                { date("%y-%m-%d %H:%M:%S"), WPlayer:GetAccount(), WPlayer:GetName(), WPlayer:GetBigLevel(), self:GetCurrentMac(), bBanFlag, szActionBy, szReason }, "\t");
    end
    local szQuery = format([[UPDATE %s SET locked=%d, trytohack=trytohack+%d, ExtendData=%q WHERE username=%q;]], "paysys.account", bBanFlag, nAddCounter, szExtendData, WPlayer:GetAccount());
    SendGlbDBData(0, szQuery);
    self:WriteLog(enumWIpMacLogTypes.LOCKACCOUNT, { "Set lock account", WPlayer:GetAccount(), WPlayer:GetName() .. " ", bBanFlag, szActionBy, szReason }, WPlayer:GetAccount());
    return WEnv.RETCODE_SUCCESS;
end

function WIpMac:SetBanMacFlag(bBanFlag, szReason, szActionBy)
    szReason = WLib:RemoveTag((szReason or "unknow"), "<", ">");
    szActionBy = szActionBy or "system";
    bBanFlag = bBanFlag or 1;
    if bBanFlag ~= 1 then
        bBanFlag = 0;
    end

    local szExtendData = "";
    if szReason ~= "" then
        szExtendData = WLib:Join({ date("%y-%m-%d %H:%M:%S"), WPlayer:GetAccount(), WPlayer:GetName(), WPlayer:GetBigLevel(), self:GetCurrentMac(), bBanFlag, szActionBy, szReason }, "\t");
    end
    local szQuery = format([[UPDATE %s SET Score=Score+%d, ExtendData=%q WHERE icKey=%q;]], self.szTableName, bBanFlag, szExtendData, self:GetCurrentMac());
    SendGlbDBData(0, szQuery);
    self:WriteLog(enumWIpMacLogTypes.BANMAC, { "Set ban device", WPlayer:GetAccount(), WPlayer:GetName() .. " ", bBanFlag, szActionBy, szReason }, WPlayer:GetAccount());
    return WEnv.RETCODE_SUCCESS;
end
