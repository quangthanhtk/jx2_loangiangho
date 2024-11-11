----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: th­ viÖn më réng chøc n¨ng cña InviteCode
----------------------------------------------------------------------------------------------------
Include('\\script\\function\\invite_code\\ic_define.lua');
----------------------------------------------------------------------------------------------------
WICBase = {
    fnDebug = nothing,
    szDataName = "jx2ib_cdkey",
    szTableName = "WICBase",
};
m_szIniRelayCfg = "..\\..\\gateway\\relay\\relay.ini";
if IniFile_Load(m_szIniRelayCfg) == 1 then
    WICBase.szDataName = IniFile_GetData(m_szIniRelayCfg, "GlobalDatabase", "Database");
    IniFile_Unload(m_szIniRelayCfg);
end
--print("WICBase.szDataName=", WICBase.szDataName);
----------------------------------------------------------------------------------------------------
function _w_WICBase_cb(nRetCode, nPoint)
    local szPrefixKey = WPlayer:GetUserData("WIC_szPrefixKey");
    local tbWICData = WPlayer:GetUserData(szPrefixKey);

    if tbWICData == WEnv.NULL
            or tbWICData.self == WEnv.NULL
            or tbWICData.fnCallback == WEnv.NULL
            or tbWICData.szPrefixKey ~= szPrefixKey
            or type(tbWICData.fnCallback) ~= "function"
    then
        WPlayer:SetUserData(szPrefixKey, WEnv.NULL); -- reset
        return WEnv.RETCODE_NOTOPEN;
    end

    local self = tbWICData.self;
    local fnCallback = tbWICData.fnCallback;
    local tbArgs = tbWICData.tbArgs;

    nRetCode = tonumber(nRetCode) or 0;
    nPoint = tonumber(nPoint) or 0;
    self.fnDebug("[_w_WICBase_cb]", self.szKey, "nRetCode=" .. nRetCode, "nPoint=" .. nPoint);
    fnCallback(self, nRetCode, nPoint, WLib:UnPack(tbArgs));
    WPlayer:SetUserData(szPrefixKey, WEnv.NULL); -- reset
    return WEnv.RETCODE_SUCCESS;
end

--- Hµm set nµy sÏ t¹o míi hoÆc replace l¹i c¸i ®· cã
function WICBase:Set(icKey, roleName, nDefaultValue, fnCallback, tbArgs)
    icKey = tostring(icKey or "");
    roleName = tostring(roleName or "");
    nDefaultValue = nDefaultValue or 0;
    if icKey == "" then
        return WEnv.RETCODE_NOTOPEN;
    end
    self.fnDebug(format("[%s:Set]", self.szKey), WPlayer:GetName(), icKey, roleName, nDefaultValue, WLib.UnPack(tbArgs));
    local szPrefixKey = WLib:Replace(tostring(fnCallback) or "WICBase_Set", " ", "");
    WPlayer:SetUserData("WIC_szPrefixKey", szPrefixKey);
    WPlayer:SetUserData(szPrefixKey, { self = self, fnCallback = fnCallback, tbArgs = tbArgs, szPrefixKey = szPrefixKey });
    InviteCode(self.szTableName, IC_QUERY_TYPE_REG, icKey, nDefaultValue, "_w_WICBase_cb", roleName);
    return WEnv.RETCODE_SUCCESS;
end

function WICBase:Get(icKey, roleName, fnCallback, tbArgs)
    icKey = tostring(icKey or "");
    roleName = tostring(roleName or "");
    if icKey == "" then
        return WEnv.RETCODE_NOTOPEN;
    end
    self.fnDebug(format("[%s:Get]", self.szKey), WPlayer:GetName(), icKey, roleName, WLib.UnPack(tbArgs));
    local szPrefixKey = WLib:Replace(tostring(fnCallback) or "WICBase_Get", " ", "");
    WPlayer:SetUserData("WIC_szPrefixKey", szPrefixKey);
    WPlayer:SetUserData(szPrefixKey, { self = self, fnCallback = fnCallback, tbArgs = tbArgs, szPrefixKey = szPrefixKey });
    InviteCode(self.szTableName, IC_QUERY_TYPE_QRY, icKey, 0, "_w_WICBase_cb", roleName);
    return WEnv.RETCODE_SUCCESS;
end

function WICBase:Modify(icKey, roleName, nModifyPoint, fnCallback, tbArgs)
    icKey = tostring(icKey or "");
    roleName = tostring(roleName or "");
    nModifyPoint = nModifyPoint or 0;
    if icKey == "" then
        return WEnv.RETCODE_NOTOPEN;
    end
    self.fnDebug(format("[%s:Modify]", self.szKey), WPlayer:GetName(), icKey, roleName, nModifyPoint, WLib.UnPack(tbArgs));
    local szPrefixKey = WLib:Replace(tostring(fnCallback) or "WICBase_Modify", " ", "");
    WPlayer:SetUserData("WIC_szPrefixKey", szPrefixKey);
    WPlayer:SetUserData(szPrefixKey, { self = self, fnCallback = fnCallback, tbArgs = tbArgs, szPrefixKey = szPrefixKey });
    InviteCode(self.szTableName, IC_QUERY_TYPE_MDY, icKey, nModifyPoint, "_w_WICBase_cb", roleName);
    return WEnv.RETCODE_SUCCESS;
end

function WICBase:ParseScore(nPoint)
    -- limit int: 65535
    local nAwardIdx = floor(nPoint / 1000);
    local nActiveTimes = mod(nPoint, 1000);
    return nAwardIdx, nActiveTimes;
end

function WICBase:MakeScore(nAwardIdx, nPoint)
    -- limit int: 65535
    if nAwardIdx < 1 or nAwardIdx > 50 then
        -- ®Ó max nAwardIdx lµ 50 môc ®Ých ®Ó sè lÇn kÝch ho¹t code ®c 999 lÇn tÝnh tõ 0-999
        print("[%s:MakeScore] nAwardIdx min=1, max=50, current set=%d", self.szKey, nAwardIdx);
        return WEnv.RETCODE_ERROR;
    end
    if nPoint < 0 or nPoint > 999 then
        print("[%s:MakeScore] nPoint min=0, max=999, current set=%d", self.szKey, nPoint);
        return WEnv.RETCODE_ERROR;
    end
    return nAwardIdx * 1000 + nPoint;
end
----------------------------------------------------------------------------------------------------
WIC = {};
WIC.TYPES = {};
function WIC:RegType(szKey, tbClass)
    if self.TYPES[szKey] == WEnv.NULL then
        tbClass.szKey = szKey;
        tbClass.szTableName = szKey;

        tbClass._WDbLog = WDbLog:RegType(tbClass.szKey, {
            fnDebug = tbClass.fnDebug,
            szDataName = tbClass.szDataName,
            szTableName = tbClass.szTableName .. "_log";
        });

        tbClass.WriteLog = function(self, nLogType, szLogContent, szObjName, nFlag, nEditable)
            return self._WDbLog:WriteDbLog(nLogType, szLogContent, szObjName, nFlag, nEditable);
        end

        self.TYPES[szKey] = inherit(WICBase, tbClass);

        -- add column ExtendData
        local szQuery = format([[ALTER TABLE %s.%s ADD COLUMN IF NOT EXISTS %s VARCHAR(255);]],
                self.TYPES[szKey].szDataName, self.TYPES[szKey].szTableName, "ExtendData");
        SendGlbDBData(0, szQuery);
    end

    return self.TYPES[szKey];
end
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\libs\\lib_ic_types\\ic_ipmac.lua");
Include("\\script\\warlord\\libs\\lib_ic_types\\ic_battlejoin.lua");
Include("\\script\\warlord\\libs\\lib_ic_types\\ic_giftcode.lua");
Include("\\script\\warlord\\libs\\lib_ic_types\\ic_webcoin.lua");
Include("\\script\\warlord\\libs\\lib_ic_types\\ic_webservice.lua");
