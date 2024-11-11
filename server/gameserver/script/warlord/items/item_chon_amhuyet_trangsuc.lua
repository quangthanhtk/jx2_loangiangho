----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item th� ch�n ng�c �m huy�t
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

m_szLogTitle = "item_chon_amhuyet_ngoc";
m_tbTrangBi = {
    [1] = { "�m Huy�t T� Gi�i", { 0, 102, 31272, 1, 4, -1, -1, -1, -1, -1, -1 } },
    [2] = { "�m Huy�t H�u Gi�i", { 0, 102, 31273, 1, 4, -1, -1, -1, -1, -1, -1 } },
    [3] = { "�m Huy�t B�i", { 0, 102, 31414, 1, 4, -1, -1, -1, -1, -1, -1 } },
    [4] = { "�m Huy�t Tr�y", { 0, 102, 31415, 1, 4, -1, -1, -1, -1, -1, -1 } },
};

function OnUse(nItemIdx)
    local tbSay = { "Trang s�c �m Huy�t g�m c� 2 b� g�m: \n<color=white>" ..
                            "  - B� 1 g�m: �m huy�t T� Gi�i v� �m Huy�t H�u Gi�i\n" ..
                            "  - B� 2 g�m: �m huy�t B�i v� �m Huy�t Tr�y\n" ..
                            "  - B� 2 g�m: �m huy�t B�i v� �m Huy�t Tr�y\n" ..
                            "<color><sex> H�y l�a ch�n th�t k� v�n s�c 3 m� b�n mu�n!", };
    for nSelectIdx = 1, getn(m_tbTrangBi) do
        local szNewLine = "\n";
        if mod(nSelectIdx, 2) ~= 0 then
            szNewLine = "";
        end
        tinsert(tbSay, format("Ta ch�n %s %s /#_w_OnSelect(%d, %d)", m_tbTrangBi[nSelectIdx][1], szNewLine, nItemIdx, nSelectIdx));
    end
    tinsert(tbSay, "Ta s� ch�n l�i sau/nothing");
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_SUCCESS;
end

function _w_OnSelect(nItemIdx, nSelectIdx, bConfirm)
    if bConfirm == WEnv.NULL then
        WNpc:SayConfirm(format("<sex> x�c ��nh mu�n l�y [<color=white>%s<color>] ch�?", m_tbTrangBi[nSelectIdx][1]), format("_w_OnSelect(%d, %d, 1)", nItemIdx, nSelectIdx));
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if WLib:CheckInv(3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    if WItem:DelByIndex(nItemIdx) ~= WEnv.RETCODE_SUCCESS then
        return WEnv.RETCODE_ERROR;
    end

    local nRetAdd, nItemIdx = gf_AddItemEx2(m_tbTrangBi[nSelectIdx][2], m_tbTrangBi[nSelectIdx][1], m_szLogTitle, "Nh�n", 0, 1);
    WPlayerLog:WriteAddItemLog("item_chon_amhuyet_trangsuc", "M� l�nh b�i", nRetAdd, nItemIdx, m_tbTrangBi[nSelectIdx][2][1]);
    return WEnv.RETCODE_SUCCESS;
end
