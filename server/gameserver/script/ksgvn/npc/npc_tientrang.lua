Import("\\script\\ksgvn\\lib.lua")
Import("\\script\\ksgvn\\event\\nganphieu\\nganphieu.lua")

g_szNpcName = "<color=yellow>Ch� ti�n trang: <color>"

function main()
    local szHead = g_szNpcName .. format("%s t�m ta c� vi�c g� kh�ng?", KsgPlayer:GetSexName())

    if KsgDate:Today() <= EVENT_NGANPHIEU_END_DATE then
        g_tbCurrentExchange[GetName()] = 0
        local szNganPhieuInfo = format("Hi�n ��i hi�p �ang c� <color=yellow>%d Ng�n Phi�u<color>", _nganPhieu_GetNganPhieu())
        szHead = g_szNpcName .. "G�n ��y ta c� kh�ch c�n ��t m�t l��ng l�n T�i Qu� V� L�m v� c�c b�o v�t tr�n giang h�, n�u ��i hi�p c� th� gi�p, ta s� t�ng ��i hi�p m�t l��ng <color=gold>Ng�n Phi�u<color> l�m qu�!!<enter>" .. szNganPhieuInfo
    end

    local tSay = {
        szHead,
    }

    if KsgDate:Today() >= EVENT_NGANPHIEU_START_DATE and KsgDate:Today() <= EVENT_NGANPHIEU_END_DATE then
        tinsert(tSay, "Ta ��n ��i b�o v�t l�y Ng�n Phi�u/nganPhieu_ExchangeMenu")
        tinsert(tSay, "Ta mu�n d�ng Ng�n Phi�u ��i b�o v�t/_tienTrang_ShowExchangeNganPhieuShop")
    end

    tinsert(tSay, "\nT�i h� ch� ti�n gh� qua!/no")

    return KsgNpc:SayDialog(tSay)
end

function _tienTrang_ShowExchangeNganPhieuShop()
    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� ch�a gia nh�p m�n ph�i n�n kh�ng th� tham gia ho�t ��ng n�y.")
    end

    return KsgLib:OpenEquipShop(EQUIP_SHOP_EXCHANGE_NGANPHIEU)
end