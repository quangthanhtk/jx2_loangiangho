----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: c∏c hµm li™n quan Æ’n nh©n vÀt
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\defines\\define_player.lua");
----------------------------------------------------------------------------------------------------
WPlayer = {};
----------------------------------------------------------------------------------------------------

--------- Reborn and Level Functions
function WPlayer:GetBigLevel()
    return self:GetRebornCount() * 100 + self:GetLevel();
end

function WPlayer:GetRebornCount()
    local nReborn = GetPlayerRebornParam(REBORN_PARAM_LEVEL);
    if nReborn > 0 then
        return tonumber(nReborn + MAX_TRANSLIFE);
    end

    local nTrans = WTask:GetByte(TASKID_TRANSLIFE, TASK_TRANSLIFE_BYTE_COUNT) or 0;
    return tonumber(nTrans);
end

function WPlayer:GetRebornRoute()
    local nReborn = GetPlayerRebornParam(REBORN_PARAM_LEVEL);
    if nReborn > 0 then
        return GetPlayerRebornParam(REBORN_PARAM_ROUTE);
    end

    local nTransRoute = WTask:GetByte(TASKID_TRANSLIFE, TASK_TRANSLIFE_BYTE_ROUTE);
    return tonumber(nTransRoute);
end

function WPlayer:GetRebornRouteName(nRouteIndex)
    if nRouteIndex and nRouteIndex < 1 and nRouteIndex > 4 then
        return "Kh´ng x∏c Æﬁnh";
    end

    if nRouteIndex then
        return g_tbRebornRouteNames[nRouteIndex];
    end

    return g_tbRebornRouteNames;
end

function WPlayer:GetRebornAndLevel(nBigLevel)
    nBigLevel = nBigLevel or self:GetBigLevel();
    local nRebornCount = floor(nBigLevel / 100);
    local nLevel = mod(nBigLevel, 100);
    return nRebornCount, nLevel;
end

function WPlayer:Reborn(nBigLevel, szCallBack)
    if self:GetBigLevel() >= nBigLevel then
        return WEnv.RETCODE_ERROR;
    end

    szCallBack = szCallBack or "no";
    local tbSay = { "Ch‰n h≠Ìng chuy”n sinh<enter><color=red>(L≠u ˝, n’u tho∏t kh·i game vµo lÛc nµy sœ m t hÁ trÓ chuy”n sinh)<color>", }
    for nRebornRoute, szRouteName in g_tbRebornRouteNames do
        if nRebornRoute ~= "n" then
            tinsert(tbSay, format("Chuy”n sinh theo h≠Ìng %s/#KsgReborn:PlayerRebornWithNews(%d, %d, %s)", szRouteName, nBigLevel, nRebornRoute, szCallBack));
        end
    end
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_SUCCESS;
end

----- Faction functions
function WPlayer:GetRouteIndex()
    for nIndex, nRoute in g_tbFactionRoutes do
        if nIndex ~= "n" and nRoute == self:GetRoute() then
            return nIndex;
        end
    end
    return 0;
end

function WPlayer:ModifyFactionPoint(nPoint)
    WTask:Modify(TASKID_FACTION_POINT, nPoint);
    if nPoint > 0 then
        self:Msg(format("NhÀn Æ≠Óc %d Æi”m cËng hi’n s≠ m´n.", nPoint));
    end
    if nPoint < 0 then
        self:Msg(format("Bﬁ trı %d Æi”m cËng hi’n s≠ m´n.", abs(nPoint)));
    end
    return WEnv.RETCODE_SUCCESS;
end

function WPlayer:SetFactionPoint(nPoint)
    WTask:Set(TASKID_FACTION_POINT, nPoint);
    self:Msg(format("ßi”m cËng hi’n s≠ m´n Æ≠Óc Æ∆t thµnh %d.", nPoint));
    return WEnv.RETCODE_SUCCESS;
end

----- Mixed functions
function WPlayer:ModifyPhongHoaPoint(nPoint)
    WTask:Modify(TASKID_PHONGHOA_POINT, nPoint);
    if nPoint > 0 then
        self:Msg(format("NhÀn Æ≠Óc %d Æi”m phong hoa.", nPoint));
    end
    if nPoint < 0 then
        self:Msg(format("Ti™u hao %d Æi”m phong hoa.", abs(nPoint)));
    end
    return WEnv.RETCODE_SUCCESS;
end

function WPlayer:ModifyLinhKhiPoint(nPoint)
    WTask:Modify(TASKID_TULUYENCHAU_LINHKHI, nPoint);
    if nPoint > 0 then
        self:Msg(format("NhÀn Æ≠Óc %d Æi”m linh kh›.", nPoint));
    end
    if nPoint < 0 then
        self:Msg(format("Ti™u hao %d Æi”m linh kh›.", abs(nPoint)));
    end
    return WEnv.RETCODE_SUCCESS;
end

function WPlayer:ModifyPopur2(nPoint)
    WTask:Modify(TASKID_BOOK_POPUR2_TOTAL, nPoint);
    WTask:Modify(TASKID_BOOK_POPUR2, nPoint);
    if nPoint > 0 then
        self:Msg(format("NhÀn Æ≠Óc %d Æi”m lﬁch luy÷n.", nPoint));
    end
    if nPoint < 0 then
        self:Msg(format("Ti™u hao %d Æi”m lﬁch luy÷n", abs(nPoint)));
    end
    return WEnv.RETCODE_SUCCESS;
end

function WPlayer:ModifyBattlePoint(nPoint)
    WTask:Modify(TASKID_BATTLE_POINT, nPoint);
    if nPoint > 0 then
        self:Msg(format("NhÀn Æ≠Óc %d Æi”m t›ch lÚy chi’n tr≠Íng.", nPoint));
    end
    if nPoint < 0 then
        self:Msg(format("Ti™u hao %d Æi”m t›ch lÚy chi’n tr≠Íng.", abs(nPoint)));
    end
    return WEnv.RETCODE_SUCCESS;
end

function WPlayer:SetBattlePoint(nPoint)
    WTask:Set(TASKID_BATTLE_POINT, nPoint);
    self:Msg(format("T›ch lÚy chi’n tr≠Íng Æ≠Óc Æ∆t thµnh %d Æi”m.", abs(nPoint)));
    return WEnv.RETCODE_SUCCESS;
end

function WPlayer:GetBattlePoint()
    return WTask:Get(TASKID_BATTLE_POINT);
end

function WPlayer:GetBattleCamp()
    local nHonor = self:GetHonor(1);
    if nHonor >= 0 then
        return WEnv.BATTLECAMP_TONG, WEnv.BATTLECAMP_NAMES[WEnv.BATTLECAMP_TONG];
    else
        return WEnv.BATTLECAMP_LIEU, WEnv.BATTLECAMP_NAMES[WEnv.BATTLECAMP_LIEU];
    end
end

function WPlayer:ModifyHonor(nPoint)
    local nHonor = self:GetHonor(1);
    if nPoint ~= 0 then
        if nHonor > 0 then
            WTask:Modify(TASKID_BATTLE_HONOR, nPoint);
        else
            WTask:Modify(TASKID_BATTLE_HONOR, -nPoint);
        end
        self:Msg(format("NhÀn Æ≠Óc %d Æi”m c´ng trπng.", abs(nPoint)));
    end
    return WEnv.RETCODE_SUCCESS;
end

function WPlayer:SetHonor(nPoint)
    local nHonor = self:GetHonor(1);
    if nHonor ~= 0 then
        if nHonor > 0 then
            WTask:Set(TASKID_BATTLE_HONOR, nPoint);
        else
            WTask:Set(TASKID_BATTLE_HONOR, -nPoint);
        end
        self:Msg(format("C´ng trπng Æ≠Óc Æ∆t thµnh %d Æi”m.", abs(nPoint)));
    end
    return WEnv.RETCODE_SUCCESS;
end

function WPlayer:GetPhongHoa()
    return WTask:Get(TASKID_PHONGHOA_POINT);
end

function WPlayer:GetFactionPoint()
    return WTask:Get(TASKID_FACTION_POINT);
end

function WPlayer:GetLinhKhiPoint()
    return WTask:Get(TASKID_TULUYENCHAU_LINHKHI);
end

function WPlayer:GetBattleRank(bByCamp)
    local nRank = WTask:Get(TASKID_BATTLE_RANK);
    if bByCamp then
        return nRank;
    end
    return abs(nRank);
end

function WPlayer:GetPetLevel()
    return GetSkillLevel(SKILL_PET_ID);
end

function WPlayer:GetGold()
    return floor(GetCash() / 10000);
end

function WPlayer:PayGold(nAmount)
    if Pay(nAmount * 10000) == 1 then
        return WEnv.RETCODE_SUCCESS;
    else
        return WEnv.RETCODE_ERROR;
    end
end

function WPlayer:AddGold(nAmount)
    Earn(nAmount * 10000);
    return WEnv.RETCODE_SUCCESS;
end

function WPlayer:GetTongName()
    return GetTongName() or "";
end

function WPlayer:IsDeath()
    if IsPlayerDeath() == 1 then
        return WEnv.TRUE;
    else
        return WEnv.FALSE;
    end
end

function WPlayer:GetMeridianLevel()
    return MeridianGetLevel();
end

function WPlayer:GetLevel()
    return GetLevel();
end

function WPlayer:GetExp()
    return GetExp();
end

function WPlayer:GetRepute()
    return GetReputation();
end
function WPlayer:SetReputation(nPoint)
    local nCurrentPoint = self:GetRepute();
    local nPointAdd = 0;
    if nPoint > nCurrentPoint then
        nPointAdd = nPoint - nCurrentPoint;
    elseif nPoint < nCurrentPoint then
        nPointAdd = -(nCurrentPoint - nPoint);
    end
    ModifyReputation(nPointAdd, 0);
end

function WPlayer:GetPopur()
    return GetPopur();
end

function WPlayer:GetHonor(bByCamp)
    local nHonor = WTask:Get(TASKID_BATTLE_HONOR);
    if bByCamp then
        return nHonor;
    end
    return abs(nHonor);
end

function WPlayer:GetSexName()
    local nPlayerSex = self:GetSex();
    local nPlayerRoute = self:GetRoute();
    local nPlayerLevel = self:GetLevel();

    if nPlayerSex == 1 then
        if nPlayerRoute > 0 and nPlayerLevel > 85 then
            return "ßπi hi÷p";
        else
            return "Thi’u hi÷p";
        end
    elseif nPlayerSex == 2 then
        if nPlayerRoute > 0 and nPlayerLevel > 85 then
            return "N˜ hi÷p";
        else
            return "C´ n≠¨ng";
        end
    else
        return "C∏c hπ";
    end
end

function WPlayer:BigDelExp(nValue)
    if self:GetExp() < nValue then
        return WEnv.RETCODE_ERROR;
    end

    if nValue > MAX_EXP then
        ModifyExp(-MAX_EXP);
        nValue = nValue - MAX_EXP;
        self:BigDelExp(nValue);
        self:Msg(format("TÊn th t %d Æi”m kinh nghi÷m.", abs(MAX_EXP)));
    else
        ModifyExp(-nValue);
        self:Msg(format("TÊn th t %d Æi”m kinh nghi÷m.", abs(nValue)));
    end
    return WEnv.RETCODE_SUCCESS;
end

function WPlayer:BigAddExp(nValue)
    if nValue > MAX_EXP then
        ModifyExp(MAX_EXP)
        nValue = nValue - MAX_EXP
        self:BigAddExp(nValue)
        self:Msg(format("NhÀn Æ≠Óc %d Æi”m kinh nghi÷m", MAX_EXP))
    else
        ModifyExp(nValue)
        self:Msg(format("NhÀn Æ≠Óc %d Æi”m kinh nghi÷m", nValue))
    end
    return WEnv.RETCODE_SUCCESS;
end

function WPlayer:GetRouteName(nRoute, nExceptFaction)
    nRoute = nRoute or self:GetRoute();
    local tbRoute = g_tbFactionRoute_Names;
    if nExceptFaction then
        tbRoute[ROUTE_VOMONPHAI] = "";
        tbRoute[ROUTE_THIEULAM] = "";
        tbRoute[ROUTE_DUONGMON] = "";
        tbRoute[ROUTE_NGAMI] = "";
        tbRoute[ROUTE_CAIBANG] = "";
        tbRoute[ROUTE_VODANG] = "";
        tbRoute[ROUTE_DUONGGIA] = "";
        tbRoute[ROUTE_NGUDOC] = "";
        tbRoute[ROUTE_CONLON] = "";
        tbRoute[ROUTE_MINHGIAO] = "";
        tbRoute[ROUTE_THUYYEN] = "";
    end
    if nRoute < 0 or tbRoute[nRoute] == WEnv.NULL then
        if nExceptFaction then
            return "";
        end
        return "Ch≠a r‚ h≠Ìng";
    end
    return tbRoute[nRoute];
end

function WPlayer:GetRoute()
    return GetPlayerRoute()
end

function WPlayer:GetFaction()
    return GetPlayerFaction()
end

function WPlayer:IsJoinedRoute()
    return WLib:IsInTable(self:GetRoute(), g_tbFactionRoutes);
end

function WPlayer:IsTongMaster()
    if IsTongMember() == 1 then
        return WEnv.TRUE;
    else
        return WEnv.FALSE;
    end
end

function WPlayer:GetSex()
    return GetSex();
end

function WPlayer:GetBody()
    return GetBody();
end

function WPlayer:GetAccount()
    return GetAccount();
end

function WPlayer:GetName()
    return GetName();
end

-- 0 = KTC, 1 = ngoπi c´ng, 2 = nÈi c´ng
function WPlayer:GetRouteType(nRoute)
    nRoute = nRoute or self:GetRoute();
    return g_tbFactionRoute_Types[nRoute];
end

function WPlayer:GetRouteBodyOffset()
    local nPlayerBody = self:GetBody();
    local nPlayerRoute = self:GetRoute();
    if WLib:IsInTable(nPlayerRoute, g_tbFactionRoute_Females) == WEnv.TRUE then
        return (nPlayerBody - 2) - 1;
    end
    return nPlayerBody - 1;
end

function WPlayer:GetWeaponTypeByRoute(nRoute)
    nRoute = nRoute or self:GetRoute();
    return g_tbFactionRoute_WeaponTypes[nRoute];
end

function WPlayer:Msg(szMsg)
    Msg2Player(WLib:RemoveTag(szMsg, "<", ">"));
end

----- Account Functions
function WPlayer:IsVipAccount()
    if GetVipCardRemainTime() > 0 then
        return WEnv.TRUE;
    end
    return WEnv.FALSE;
end

function WPlayer:IsAdmin(szAccount)
    szAccount = szAccount or self:GetAccount();
    return WLib:IsInTable(szAccount, g_tbAccountCfg.admin);
end

function WPlayer:IsSuperMod(szAccount)
    szAccount = szAccount or self:GetAccount();
    return WLib:IsInTable(szAccount, g_tbAccountCfg.supermod);
end

function WPlayer:IsModLive(szAccount)
    szAccount = szAccount or self:GetAccount();
    return WLib:IsInTable(szAccount, g_tbAccountCfg.modlive);
end

function WPlayer:IsTester(szAccount)
    if WLib:IsTestServer() == WEnv.TRUE then
        szAccount = szAccount or self:GetAccount();
        return WLib:IsInTable(szAccount, g_tbAccountCfg.tester);
    else
        return WEnv.FALSE;
    end
end

function WPlayer:IsSuperAdmin(szAccount)
    szAccount = szAccount or GetAccount();
    return WLib:IsInTable(szAccount, g_tbAccountCfg.superadmin);
end

---Ki”m tra lµ tµi kho∂n lµ Æ∆c bi÷t
---@return number WEnv.TRUE= Lµ tµi kho∂n admin, supermod, modlive, tester
function WPlayer:IsGm()
    if WPlayer:IsAdmin() == WEnv.TRUE
        or WPlayer:IsSuperAdmin() == WEnv.TRUE
        or WPlayer:IsSuperMod() == WEnv.TRUE
        or WPlayer:IsModLive() == WEnv.TRUE
        or WPlayer:IsTester() == WEnv.TRUE
    then
        return WEnv.TRUE;
    else
        return WEnv.FALSE;
    end
end

function WPlayer:IsNewbie(nTime)
    nTime = nTime or DATETIME_SEC_ONE_WEEK;
    local nCreateTime = GetCreateTime();
    local nNowTime = GetTime();
    local nDiffTime = nNowTime - nCreateTime;
    if nDiffTime < nTime then
        return WEnv.TRUE;
    else
        return WEnv.FALSE;
    end
end

--------- Meridian Functions
function WPlayer:GetMeridianName(nLevel)
    nLevel = nLevel or MeridianGetLevel();
    return g_tbMeridianNames[nLevel] or "Ch≠a mÎ";
end

function WPlayer:MeridianLevelUp(nLevel, nAddChanKhi)
    nLevel = nLevel or 1;
    local nCurLevel = self:GetMeridianLevel();
    if nCurLevel >= nLevel then
        return WEnv.RETCODE_ERROR;
    end

    for _ = nCurLevel + 1, nLevel do
        MeridianUpdateLevel();
    end
    if nAddChanKhi then
        local nNum = nAddChanKhi - (MeridianGetDanTian() + MeridianGetQiHai());
        if nNum > 0 then
            AwardGenuineQi(nNum);
        end
    end
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
    return WEnv.RETCODE_SUCCESS;
end

function WPlayer:ResetMeridianPoint(nConfirm)
    if nConfirm == WEnv.NULL or tonumber(nConfirm) ~= 1 then
        local tbSay = { "X∏c nhÀn t»y Æi”m kinh mπch?",
                        "ßÂng ˝/#WPlayer:ResetMeridianPoint(1)",
                        "Hu˚/no",
        };
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_UNDEFINE;
    end
    MeridianRestore(-1);
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
    return WEnv.RETCODE_SUCCESS;
end

----- Hoa canh
function WPlayer:OpenFair()
    if WTask:Get(TASKID_FAIR_UP_FLAG) == 0 then
        WTask:Set(TASKID_FAIR_UP_FLAG, 1);
        self:Msg("ß∑ mÎ h„a c∂nh.");
        PlaySound("\\sound\\sound_i016.wav");
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        return WEnv.RETCODE_SUCCESS;
    else
        return WEnv.RETCODE_ERROR;
    end
end

function WPlayer:SetFairLevel(nLevel)
    nLevel = nLevel or 1;
    if nLevel > MAX_FAIR_LEVEL and self:IsAdmin() == WEnv.FALSE then
        nLevel = MAX_FAIR_LEVEL;
    end
    WTask:Set(TASKID_FAIR_VALUE, nLevel);
    local szParam = format("%s|%d|%d", self:GetName(), self:GetRoute(), nLevel);
    SendScript2Global("fair_level_changed", szParam); -- ”√¿¥∏¸–¬ªØæ≥≈≈––∞Ò
    return WEnv.RETCODE_SUCCESS;
end

function WPlayer:LevelUpFair(nLevel)
    self:OpenFair();
    local nFairLv = WTask:Get(TASKID_FAIR_VALUE);
    local nNextFairLv = nFairLv + 1;
    local szPlayerName = self:GetName();
    local nPlayerRoute = self:GetRoute();

    --- up tıng c p 1
    if nLevel == WEnv.NULL then
        UpPlayerFairStar(nNextFairLv)
        SetTask(TASKID_FAIR_UP_TIMESTAMP, GetTime());
        WriteLog(format("H„a C∂nh Tinh HÂn k›ch hoπt Name=%s PreLevel=%d CurLevel=%d", szPlayerName, nFairLv, nNextFairLv));
        local szParam = format("%s|%d|%d", szPlayerName, nPlayerRoute, nNextFairLv);
        SendScript2Global("fair_level_changed", szParam); -- ”√¿¥∏¸–¬ªØæ≥≈≈––∞Ò
        SendScript2VM("\\script\\global\\attr_point_addon.lua", "Update_Player_Attr_Point_Addon()");
        return WEnv.RETCODE_SUCCESS;
    end

    nLevel = nLevel - nFairLv;
    if nLevel <= 0 then
        return WEnv.RETCODE_ERROR;
    end
    if nLevel > MAX_FAIR_LEVEL and self:IsAdmin() == WEnv.FALSE then
        return WEnv.RETCODE_NOTOPEN;
    end

    for _ = 1, nLevel do
        nFairLv = WTask:Get(TASKID_FAIR_VALUE);
        nNextFairLv = nFairLv + 1;
        UpPlayerFairStar(nNextFairLv);
        SetTask(TASKID_FAIR_UP_TIMESTAMP, GetTime());
        WriteLog(format("H„a C∂nh Tinh HÂn k›ch hoπt Name=%s PreLevel=%d CurLevel=%d", szPlayerName, nFairLv, nNextFairLv));
        local szParam = format("%s|%d|%d", szPlayerName, nPlayerRoute, nNextFairLv);
        SendScript2Global("fair_level_changed", szParam); -- ”√¿¥∏¸–¬ªØæ≥≈≈––∞Ò
        SendScript2VM("\\script\\global\\attr_point_addon.lua", "Update_Player_Attr_Point_Addon()");
    end
    return WEnv.RETCODE_SUCCESS;
end

function WPlayer:IsMaxSkill55()
    local nRoute = self:GetRoute();
    if g_tbFactionRoute_Skill[nRoute] == WEnv.NULL then
        return WEnv.FALSE;
    end

    local nSkillID = g_tbFactionRoute_Skill[nRoute].nSkill55;
    if GetSkillLevel(nSkillID) >= MAX_FACTION_SKILL_LV_55 then
        return WEnv.TRUE;
    end

    return WEnv.FALSE;
end

function WPlayer:GetWorldPos()
    return GetWorldPos();
end

function WPlayer:GetLoginIP()
    local nLastLoginIp, nCurrentLoginIp = GetLoginIP();
    local nLIP1, nCIP1 = floor(nLastLoginIp / 2 ^ 24), floor(nCurrentLoginIp / 2 ^ 24);
    local nLIP2, nCIP2 = floor((nLastLoginIp - nLIP1 * 2 ^ 24) / 2 ^ 16), floor((nCurrentLoginIp - (nCIP1 * 2 ^ 24)) / 2 ^ 16);
    local nLIP3, nCIP3 = floor((nLastLoginIp - nLIP1 * 2 ^ 24 - nLIP2 * 2 ^ 16) / 2 ^ 8), floor((nCurrentLoginIp - nCIP1 * 2 ^ 24 - nCIP2 * 2 ^ 16) / 2 ^ 8);
    local nLIP4, nCIP4 = nLastLoginIp - nLIP1 * 2 ^ 24 - nLIP2 * 2 ^ 16 - nLIP3 * 2 ^ 8, nCurrentLoginIp - nCIP1 * 2 ^ 24 - nCIP2 * 2 ^ 16 - nCIP3 * 2 ^ 8;
    local szLIP = tostring(nLIP1 .. "." .. nLIP2 .. "." .. nLIP3 .. "." .. nLIP4);
    local szCIP = tostring(nCIP1 .. "." .. nCIP2 .. "." .. nCIP3 .. "." .. nCIP4);
    return szLIP, szCIP;
end

function WPlayer:GetLoginMAC()
    return WIpMac:GetLastMac(), WIpMac:GetCurrentMac();
end

-- g_WPlayerData Æ≠Óc chuy”n Æ’n \script\warlord\defines\define_static.lua
function WPlayer:GetUserDataKey()
    local szUserDataKey = format("%s_%s", self:GetAccount(), self:GetName());
    if g_WPlayerData[szUserDataKey] == WEnv.NULL then
        g_WPlayerData[szUserDataKey] = {};
    end
    return szUserDataKey;
end
function WPlayer:SetUserData(key, value)
    local szUserDataKey = self:GetUserDataKey();
    g_WPlayerData[szUserDataKey][key] = value;
end
function WPlayer:GetUserData(key)
    local szUserDataKey = self:GetUserDataKey();
    return g_WPlayerData[szUserDataKey][key];
end

function WPlayer:IsPKState()
    local nFightState = GetFightState(); -- nFightState=0 lµ trπng th∏i phi chi’n Æ u
    local nPkFlag1, nPkFlag2 = GetPKFlag(); -- nPkFlag1=0 lµ Æang luy÷n c´ng, nPkFlag2=0 lµ pk1 -> nPkFlag2=3 lµ pk bang
    local nPKEnmityState = GetPKEnmityState(); -- nPKEnmityState=1 lµ trπng th∏i tÿ v‚
    if nFightState == 0 or nPkFlag1 == 0 or nPKEnmityState ~= 0 then
        return WEnv.FALSE;
    end

    return WEnv.TRUE;
end
