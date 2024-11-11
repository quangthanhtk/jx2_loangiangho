----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-08-26
--- Description: Gi�i h�n phe + nh�n v�t tham gia t�nh n�ng chi�n tr��ng
----------------------------------------------------------------------------------------------------
enumWBattleJoinLogTypes = {
    REGISTERSUCCES = 1,
    REGISTERSKIP = 2,
};
WBattleJoin = WIC:RegType("warlord_battlejoin", {
    fnDebug = nothing,

    nMaxPerCamp = 3,
    nFirstJoinAwardCheckPoint = 1000, -- >= 1000 th� m�i th�ng b�o
    tbSkipMacHash = { -- danh s�ch ���c ph�p v�o tr�c ti�p kh�ng qua gi�i h�n b�o danh

    },

    tbMsgString = {
        [1] = "Nh�n s� vui l�ng t�t c�a s� game, m� game v� ��ng nh�p l�i �� v�o chi�n tr��ng!",
        [2] = "<npcname>: Thao t�c c�a <sex> qu� nhanh t�i h� ch�a theo k�p, m�i thao t�c l�i trong <color=green>%d gi�y<color> n�a!",
        [3] = "<npcname>: <color=red>M�i tr�n ch� b�o danh t�i �a 1 phe v� tham chi�n t�i �a %d nh�n v�t<color>. \n" ..
                "L�a ch�n phe 1 l�n n�y s� �p d�ng cho to�n tr�n <color=green>%s<color> hi�n t�i, <sex> c� th� thay ��i phe � tr�n kh�c. \n" ..
                "<sex> v�n mu�n b�o danh <color=green>phe %s<color> ch�?",
        [4] = "Ta ��ng � gia nh�p ��i %s\n ",
        [5] = "Ta c�n c� vi�c kh�c c�n l�m.\n ",
        [6] = "Ph�n th��ng %d �i�m qu�n c�ng kh�ch l� nh�n s� l�n ��u tham gia chi�n tr��ng.",
        [7] = "<npcname>: <color=red>M�i tr�n ch� c� th� tham chi�n t�i �a %d nh�n v�t<color>, <sex> khi kh�c h�y ��n �ng chi�n!",
        [8] = "<npcname>: <color=red>M�i tr�n ch� c� th� tham gia m�t phe<color>, m�i <sex> ��n s� gi� phe %s �� b�o danh!",
    },
});

function WBattleJoin:ResetLimit()
    local szQuery = format([[DELETE FROM %s WHERE icKey LIKE "%_%d";]], self.szTableName, WIpMac:GetCurrentMac());
    SendGlbDBData(0, szQuery);
    return WEnv.RETCODE_SUCCESS;
end

function WBattleJoin:CheckJoinCamp(szPrefix, fnCallback, ...)
    local nMacHash = WIpMac:GetCurrentMac();
    local szBattleKey = (szPrefix or '0_') .. nMacHash;

    -- Tr��ng h�p b�o l�i kh�ng get ���c MAC
    if nMacHash == 0 then
        WNpc:Talk(self.tbMsgString[1], 1, "ExitGame"); -- b�t ��ng nh�p l�i �� c�p nh�p mac
        return WEnv.RETCODE_ERROR;
    end

    self:Get(szBattleKey, WPlayer:GetName(), fnCallback, arg);
    return WEnv.RETCODE_SUCCESS;
end

function WBattleJoin:SignupCamp(szPrefix, fnCallback, ...)
    local nMacHash = WIpMac:GetCurrentMac();
    local szBattleKey = (szPrefix or '0_') .. nMacHash;

    -- Tr��ng h�p b�o l�i kh�ng get ���c MAC
    if nMacHash == 0 then
        WNpc:Talk(self.tbMsgString[1], 1, "ExitGame"); -- b�t ��ng nh�p l�i �� c�p nh�p mac
        return WEnv.RETCODE_ERROR;
    end

    self:Set(szBattleKey, WPlayer:GetName(), g_nNpcCamp * 100, fnCallback, arg);
    return WEnv.RETCODE_SUCCESS;
end

function WBattleJoin:JoinCampCounting(szPrefix)
    local nMacHash = WIpMac:GetCurrentMac();
    local szBattleKey = (szPrefix or '0_') .. nMacHash;

    -- Tr��ng h�p b�o l�i kh�ng get ���c MAC
    --if nMacHash == 0 then
    --    WNpc:Talk(self.tbMsgString[1], 1, "ExitGame"); -- b�t ��ng nh�p l�i �� c�p nh�p mac
    --    return WEnv.RETCODE_ERROR;
    --end

    WTask:Set(WTASKID_NEWBATTLE_LASTDATA_DATE, WDate:Today());
    WTask:Set(WTASKID_NEWBATTLE_LASTDATA_BYTE, 0);
    WTask:SetByte(WTASKID_NEWBATTLE_LASTDATA_BYTE, WTASKID_NEWBATTLE_LASTDATA_BYTE_JOINHOUR, tonumber(date("%H")));
    WTask:SetByte(WTASKID_NEWBATTLE_LASTDATA_BYTE, WTASKID_NEWBATTLE_LASTDATA_BYTE_JOINMIN, tonumber(date("%M")));
    self:Modify(szBattleKey, WPlayer:GetName(), 1, nothing);
    --BT_SetData(PT_SIGN_UP, nBattleType * 10 + nCamp);
    --BT_SetData(PT_BATTLE_DATE, tonumber(date("%y%m%d")) * 1000 + nGlobalState);
    local nSignUpData = BT_GetData(PT_SIGN_UP);
    local nBattleType = floor(nSignUpData / 10);
    local nCamp = mod(nSignUpData, 10);
    self:WriteLog(enumWBattleJoinLogTypes.REGISTERSUCCES, { "JoinCampCounting Register success", WPlayer:GetAccount(), WPlayer:GetName() .. " ", date("%Y-%m-%d %H:%M:%S"), nBattleType, nCamp }, nMacHash);
    return WEnv.RETCODE_SUCCESS;
end

----------------------------------------------------------------------------------------------------
--- H�m n�y replace h�m sign_up_confirm c� s�n c�a file \\script\\newbattles\\sign_up_npc.lua
--- H�m sign_up_confirm  g�c ��i t�n th�nh sign_up_confirm_bk
function sign_up_confirm(nBattleType, nSignUpType)
    if WPlayer:GetHonor() < g_WCFG_NEWBATTLES_MAIN.nHonorSkipCaptcha
            and g_WCFG_NEWBATTLES_MAIN.bEnableCaptchaEntry == WEnv.TRUE
    then
        WLib:OpenCaptcha(nil, sign_up_confirm_captcha_ok, { nBattleType, nSignUpType });
    else
        sign_up_confirm_captcha_ok(nBattleType, nSignUpType);
    end
end

function sign_up_confirm_captcha_ok(nBattleType, nSignUpType)
    local nMacHash = WIpMac:GetCurrentMac();
    if WBattleJoin.tbSkipMacHash[nMacHash] ~= WEnv.NULL then
        sign_up_confirm_bk(nBattleType, nSignUpType);
        --BT_SetData(PT_SIGN_UP, nBattleType * 10 + nCamp);
        --BT_SetData(PT_BATTLE_DATE, tonumber(date("%y%m%d")) * 1000 + nGlobalState);
        local nSignUpData = BT_GetData(PT_SIGN_UP);
        local nBattleType = floor(nSignUpData / 10);
        local nCamp = mod(nSignUpData, 10);
        WBattleJoin:WriteLog(enumWBattleJoinLogTypes.REGISTERSUCCES, { "sign_up_confirm Register skip", WPlayer:GetAccount(), WPlayer:GetName() .. " ", date("%Y-%m-%d %H:%M:%S"), nBattleType, nCamp }, nMacHash);
        return WEnv.RETCODE_SUCCESS;
    end

    local nCurrentTime = GetGameTime();
    local nDelayClick = nCurrentTime - WTaskTemp:Get(WTASKTEMPID_CLICKNPC_TIMEOUT);
    if nDelayClick < 3 then
        WNpc:Talk(format(WBattleJoin.tbMsgString[2], nDelayClick));
        return WEnv.RETCODE_NEEDCONFIRM;
    end
    WTaskTemp:Set(WTASKTEMPID_CLICKNPC_TIMEOUT, nCurrentTime);
    local szPrefix = date("%m%d%H_") .. nBattleType .. "_";
    WBattleJoin:CheckJoinCamp(szPrefix, sign_up_confirm_cb, nBattleType, nSignUpType);
end

function sign_up_confirm_cb(NULL, nRetCode, nPoint, ...)
    local nBattleType = arg[1];
    local nSignUpType = arg[2];
    if nBattleType == WEnv.NULL or nSignUpType == WEnv.NULL then
        return WEnv.RETCODE_NOTOPEN;
    end

    -- Tr��ng h�p ch�a ch�n phe: nRet = 0, nPoint = 0
    if nRetCode == 0 then
        local tbSay = { format(WBattleJoin.tbMsgString[3], WBattleJoin.nMaxPerCamp, tBattleName[nBattleType], tCampNameZ[g_nNpcCamp]) };
        tinsert(tbSay, format("%s/#_w_BattleJoin_SignupCamp(%d, %d)", format(WBattleJoin.tbMsgString[4], tCampNameZ[g_nNpcCamp]), nBattleType, nSignUpType));
        tinsert(tbSay, format("%s/nothing", WBattleJoin.tbMsgString[5]));
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    -- Tr��ng h�p �� ch�n phe: nRet = 1, nPoint > 0
    local nJoinCount = mod(nPoint, 100);
    local nRegisterCamp = floor(nPoint / 100);

    if nRegisterCamp ~= g_nNpcCamp then
        -- sai phe
        _w_BattleJoin_SignupWrongCamp(nRetCode, nPoint, WLib:UnPack(arg));
        return WEnv.RETCODE_SUCCESS;
    end

    if nJoinCount >= WBattleJoin.nMaxPerCamp then
        -- v��t qu� s� l��ng cho ph�p ��ng k�
        _w_BattleJoin_SignupCampMax(nRetCode, nPoint, WLib:UnPack(arg));
        return WEnv.RETCODE_SUCCESS;
    end

    _w_BattleJoin_SignupSuccess(nRetCode, nPoint, WLib:UnPack(arg)); -- ��ng k� th�nh c�ng, ��m s� l��t
    return WEnv.RETCODE_SUCCESS;
end

function _w_BattleJoin_SignupCamp(nBattleType, nSignUpType)
    local szPrefix = date("%m%d%H_") .. nBattleType .. "_";
    WBattleJoin:SignupCamp(szPrefix, sign_up_confirm_cb, nBattleType, nSignUpType);
    return WEnv.RETCODE_NEEDCONFIRM;
end

function _w_BattleJoin_SignupCounting(nBattleType, nSignUpType)
    local szPrefix = date("%m%d%H_") .. nBattleType .. "_";
    WBattleJoin:JoinCampCounting(szPrefix);
    return WEnv.RETCODE_NEEDCONFIRM;
end

function _w_BattleJoin_SignupSuccess(nRetCode, nPoint, ...)
    local nBattleType = arg[1];
    local nSignUpType = arg[2];
    if nBattleType == WEnv.NULL or nSignUpType == WEnv.NULL then
        return WEnv.RETCODE_NOTOPEN;
    end

    -- Th�m �i�m �� x�c ��nh phe
    local nCheckPoint = WBattleJoin.nFirstJoinAwardCheckPoint;
    if WPlayer:GetHonor() < nCheckPoint then
        if g_nNpcCamp == SONG_ID then
            WTask:Set(704, 1);
            WTask:Modify(TASKID_BATTLE_HONOR, nCheckPoint);
        elseif g_nNpcCamp == LIAO_ID then
            WTask:Set(704, -1);
            WTask:Modify(TASKID_BATTLE_HONOR, -nCheckPoint);
        end
        if nCheckPoint >= 1000 then
            WPlayer:Msg(format(WBattleJoin.tbMsgString[6], nCheckPoint));
        end
    end

    sign_up_confirm_bk(nBattleType, nSignUpType);
    return WEnv.RETCODE_SUCCESS;
end

function _w_BattleJoin_SignupCampMax(nRetCode, nPoint, ...)
    WNpc:Talk(format(WBattleJoin.tbMsgString[7], WBattleJoin.nMaxPerCamp));
    return WEnv.RETCODE_SUCCESS;
end

function _w_BattleJoin_SignupWrongCamp(nRetCode, nPoint, ...)
    local nSelectCamp = SONG_ID;
    if g_nNpcCamp == SONG_ID then
        nSelectCamp = LIAO_ID;
    end
    WNpc:Talk(format(WBattleJoin.tbMsgString[8], tCampNameZ[nSelectCamp]));
    return WEnv.RETCODE_SUCCESS;
end
