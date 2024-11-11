----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: c¸c hµm liªn quan ®Õn npc
----------------------------------------------------------------------------------------------------
WNpc = {};
----------------------------------------------------------------------------------------------------

function WNpc:GetName(nNpcIdx)
    nNpcIdx = nNpcIdx or GetTargetNpc();
    if m_szNpcName == WEnv.NULL then
        return GetNpcName(nNpcIdx) or "§èi tho¹i";
    else
        return WLib:Trim(WLib:RemoveTag(WLib:Replace(m_szNpcName, ":", ""), "<", ">"));
    end
end

function WNpc:Talk(szMsg, bMsgToPlayer, szCallback)
    szMsg = szMsg or "";
    szCallback = szCallback or "";

    if type(szMsg) == "string" then
        local szNewMsg = WLib:StringFormal(szMsg);

        Talk(1, szCallback, szNewMsg);
        if bMsgToPlayer then
            WPlayer:Msg(szNewMsg);
        end
    elseif type(szMsg) == "table" then
        local nTotalTalk = getn(szMsg);
        local tbNewMsg = {};

        for i = 1, nTotalTalk do
            tbNewMsg[i] = WLib:StringFormal(szMsg[i]);
            tbNewMsg["n"] = i;
        end

        Talk(nTotalTalk, szCallback, tbNewMsg);
        if bMsgToPlayer and nTotalTalk > 1 then
            WPlayer:Msg(tbNewMsg[1]);
        end
    end
    return WEnv.RETCODE_SUCCESS;
end

function WNpc:SayDialog(tbMenuOptions)
    local szMsg, szSelect = "", "";
    local nOptionCount = getn(tbMenuOptions);

    if nOptionCount < 2 then
        return WEnv.RETCODE_ERROR;
    end

    if nOptionCount > 2 then
        for i = 2, nOptionCount - 1 do
            szSelect = szSelect .. format("%q", tbMenuOptions[i]) .. ",";
        end
        szSelect = szSelect .. format("%q", tbMenuOptions[nOptionCount]);
        szMsg = "Say(" .. WLib:StringFormal("%q", tbMenuOptions[1]) .. "," .. (nOptionCount - 1) .. "," .. szSelect .. ")";
    elseif nOptionCount == 2 then
        szSelect = format("%q", tbMenuOptions[nOptionCount]);
        szMsg = "Say(" .. WLib:StringFormal("%q", tbMenuOptions[1]) .. ",1" .. "," .. szSelect .. ")";
    end

    dostring(szMsg);
    return WEnv.RETCODE_SUCCESS;
end

function WNpc:SayConfirm(szConfirmPrompts, szFuncAcept, szFuncIgnore)
    local tbSay = { szConfirmPrompts or "X¸c nhËn ®ång ý hay kh«ng?",
                    format("§ång ý \n /#%s", szFuncAcept or "nothing()"),
                    format("T¹m thêi ch­a cÇn ®Õn/#%s", szFuncIgnore or "nothing()"),
    };

    self:SayDialog(tbSay);
    return WEnv.RETCODE_SUCCESS;
end
