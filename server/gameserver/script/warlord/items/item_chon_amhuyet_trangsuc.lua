----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item thÎ chän ngäc Èm huyÕt
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

m_szLogTitle = "item_chon_amhuyet_ngoc";
m_tbTrangBi = {
    [1] = { "Èm HuyÕt T¶ Giíi", { 0, 102, 31272, 1, 4, -1, -1, -1, -1, -1, -1 } },
    [2] = { "Èm HuyÕt H÷u Giíi", { 0, 102, 31273, 1, 4, -1, -1, -1, -1, -1, -1 } },
    [3] = { "Èm HuyÕt Béi", { 0, 102, 31414, 1, 4, -1, -1, -1, -1, -1, -1 } },
    [4] = { "Èm HuyÕt Trôy", { 0, 102, 31415, 1, 4, -1, -1, -1, -1, -1, -1 } },
};

function OnUse(nItemIdx)
    local tbSay = { "Trang søc Èm HuyÕt gåm cã 2 bé gåm: \n<color=white>" ..
                            "  - Bé 1 gåm: Èm huyÕt T¶ Giíi vµ Èm HuyÕt H÷u Giíi\n" ..
                            "  - Bé 2 gåm: Èm huyÕt Béi vµ Èm HuyÕt Trôy\n" ..
                            "  - Bé 2 gåm: Èm huyÕt Béi vµ Èm HuyÕt Trôy\n" ..
                            "<color><sex> H·y lùa chän thËt kÜ v¨n søc 3 mµ b¹n muèn!", };
    for nSelectIdx = 1, getn(m_tbTrangBi) do
        local szNewLine = "\n";
        if mod(nSelectIdx, 2) ~= 0 then
            szNewLine = "";
        end
        tinsert(tbSay, format("Ta chän %s %s /#_w_OnSelect(%d, %d)", m_tbTrangBi[nSelectIdx][1], szNewLine, nItemIdx, nSelectIdx));
    end
    tinsert(tbSay, "Ta sÏ chän l¹i sau/nothing");
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_SUCCESS;
end

function _w_OnSelect(nItemIdx, nSelectIdx, bConfirm)
    if bConfirm == WEnv.NULL then
        WNpc:SayConfirm(format("<sex> x¸c ®Þnh muèn lÊy [<color=white>%s<color>] chø?", m_tbTrangBi[nSelectIdx][1]), format("_w_OnSelect(%d, %d, 1)", nItemIdx, nSelectIdx));
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if WLib:CheckInv(3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    if WItem:DelByIndex(nItemIdx) ~= WEnv.RETCODE_SUCCESS then
        return WEnv.RETCODE_ERROR;
    end

    local nRetAdd, nItemIdx = gf_AddItemEx2(m_tbTrangBi[nSelectIdx][2], m_tbTrangBi[nSelectIdx][1], m_szLogTitle, "NhËn", 0, 1);
    WPlayerLog:WriteAddItemLog("item_chon_amhuyet_trangsuc", "Më lÖnh bµi", nRetAdd, nItemIdx, m_tbTrangBi[nSelectIdx][2][1]);
    return WEnv.RETCODE_SUCCESS;
end
