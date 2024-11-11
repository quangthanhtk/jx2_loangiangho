Import("\\script\\ksgvn\\lib.lua")
_thisFile = "\\script\\ksgvn\\autoexec\\ksg_system_head.lua"

KSG_ITEMPACK_START = 50268
KSG_ITEMPACK_END = 50335

g_tbItemTalkCfg = {
    { tbProp = { 2, 1, 50018 }, szFunc = "_ksg_HandleItemPack" },
    { tbProp = { 2, 1, 50019 }, szFunc = "_ksg_HandleItemPack" },
    { tbProp = { 2, 1, 50020 }, szFunc = "_ksg_HandleItemPack" },
    { tbProp = { 2, 1, 50029 }, szFunc = "_ksg_HandleBaoRuongTK" },
    { tbProp = { 2, 1, 50250 }, szFunc = "_ksg_HandleKinhNghiemDon" },
    { tbProp = { 2, 1, 50251 }, szFunc = "_ksg_HandleKinhNghiemDon" },
    { tbProp = { 2, 1, 50252 }, szFunc = "_ksg_HandleKinhNghiemDon" },
    { tbProp = { 2, 1, 50253 }, szFunc = "_ksg_HandleKinhNghiemDon" },
    { tbProp = { 2, 1, 31004 }, szFunc = "_ksg_HandlePhongHoaQuyen" },
}

--LongDaika: th�m t�nh n�ng cho npc
m_szHoctroThorenluuFile = '\\script\\warlord\\npcs\\npc_hoctro_thorenluu.lua';
m_szThorenluuFile = '\\script\\warlord\\npcs\\npc_thorenluu.lua';
m_szTieuVienLauFile = '\\script\\warlord\\npcs\\npc_tieuvienlau.lua';
m_szChuTienTrangFile = '\\script\\warlord\\npcs\\npc_chutientrang.lua';
g_tbNpcTalkCfg = {
    --{ szName = "Th� r�n L�u", nMapId = 350, szFuncExecuteAt = _thisFile, szHandleFunc = "_ksg_ExchangeTTLL", szTalk = "Gh�p T�y T�m Th�ch v� Luy�n L� Thi�t", }, --LongDaiKa: ��ng t�nh n�ng
    --{ szName = "Th� r�n L�u", nMapId = 350, szFuncExecuteAt = _thisFile, szHandleFunc = "_ksg_ExchangeKx5", szTalk = "R�n trang b� Kim X� c�p 5", }, --LongDaiKa: ��ng t�nh n�ng
    --{ szName = "Th� r�n L�u", nMapId = 350, szFuncExecuteAt = _thisFile, szHandleFunc = "_ksg_ExchangeKx6", szTalk = "R�n trang b� Kim X� c�p 6", }, --LongDaiKa: ��ng t�nh n�ng
    --{ szName = "Th� r�n L�u", nMapId = 350, szFuncExecuteAt = _thisFile, szHandleFunc = "_ksg_ExchangeKx7", szTalk = "R�n trang b� Kim X� c�p 7", }, --LongDaiKa: ��ng t�nh n�ng
    --{ szName = "Th� r�n L�u", nMapId = 350, szFuncExecuteAt = _thisFile, szHandleFunc = "_ksg_upgradeSatTinh", szTalk = "Luy�n h�a b� S�t Tinh", }, --LongDaiKa: ��ng t�nh n�ng

    { szName = "H�c tr� Th� r�n L�u", nMapId = 350, szFuncExecuteAt = m_szHoctroThorenluuFile, szHandleFunc = "_w_NpcMain", szTalk = "Xem c�ng th�c ch� t�o m�i", }, --LongDaiKa: th�m t�nh n�ng
    --{ szName = "Th� r�n L�u", nMapId = 350, szFuncExecuteAt = m_szThorenluuFile, szHandleFunc = "_w_NpcMain", szTalk = "Xem c�ng th�c ch� t�o m�i", }, --LongDaiKa: th�m t�nh n�ng
    --{ szName = "Ti�u Vi�n L�u", nMapId = 200, szFuncExecuteAt = m_szTieuVienLauFile, szHandleFunc = "_w_NpcMain", szTalk = "D�ng �i�m t�ch l�y ��i l�y b�o v�t", }, --LongDaiKa: th�m t�nh n�ng
    --{ szName = "Ti�u Vi�n L�u", nMapId = 200, szFuncExecuteAt = m_szTieuVienLauFile, szHandleFunc = "_w_ExchanceBattleEquip", szTalk = "Chuy�n phe trang b� chi�n tr��ng", }, --LongDaiKa: th�m t�nh n�ng
    { szName = "Ch� ti�n trang", nMapId = 200, szFuncExecuteAt = m_szChuTienTrangFile, szHandleFunc = "_w_NpcMain", szTalk = "H� tr� m�i", }, --LongDaiKa: th�m t�nh n�ng
}

function _ksg_upgradeSatTinh()
    KsgLib:OpenEquipShop(EQUIP_SHOP_EXCHANGE_SATTINH_TRACVIET)
end

function _ksg_ExchangeTTLL()
    KsgLib:OpenEquipShop(EQUIP_SHOP_EXCHANGE_TTLL)
end

function _ksg_ExchangeKx5()
    KsgLib:OpenEquipShop(EQUIP_SHOP_EXCHANGE_KX5)
end

function _ksg_ExchangeKx6()
    KsgLib:OpenEquipShop(EQUIP_SHOP_EXCHANGE_KX6)
end

function _ksg_ExchangeKx7()
    KsgLib:OpenEquipShop(EQUIP_SHOP_EXCHANGE_KX7)
end

function _ksg_HandleItemPack(nItemIndex)
    local g, d, p = GetItemInfoByIndex(nItemIndex)
    local tbCfg = g_tbItemPackCfg[PackItemId(g, d, p)]
    if tbCfg then
        local szType = tbCfg.szType
        if tbCfg.tbIds then
            local nId = KsgLib:RandomTableValue(tbCfg.tbIds)
            _ksg_GiveItemPackByType(nItemIndex, szType, nId)
        end
        if tbCfg.nId then
            _ksg_GiveItemPackByType(nItemIndex, szType, tbCfg.nId)
        end
        if tbCfg.tbItem then
            _ksg_GiveItemPackItem(nItemIndex, szType, tbCfg.tbItem)
        end
    end
end

function _ksg_GiveItemPackByType(nItemIndex, szType, nId)
    if szType == ITEMPACK_TYPE_ORN then
        -- ngo�i trang c�nh
        if not KsgLib:HasEnoughBagRoom(3) then
            return
        end
        if KsgItem:DeleteByIndex(nItemIndex) ~= 1 then
            return KsgNpc:Talk("Kh�ng th� m� h�p ngo�i trang c�nh n�y")
        end
        KsgItem:AddOrnByBody(nId, 4, 0, "KSG_ITEMPACK")
    end
    if szType == ITEMPACK_TYPE_COAT then
        -- ngo�i trang qu�n �o
        if not KsgLib:HasEnoughBagRoom(3) then
            return
        end
        if KsgItem:DeleteByIndex(nItemIndex) ~= 1 then
            return KsgNpc:Talk("Kh�ng th� m� h�p ngo�i trang n�y")
        end
        KsgItem:AddCoatByBody(nId, 4, 0, "KSG_ITEMPACK")
    end
    if szType == ITEMPACK_TYPE_HORSE then
        -- th� c��i
        if not KsgLib:HasEnoughBagRoom(1) then
            return
        end
        if KsgItem:DeleteByIndex(nItemIndex) ~= 1 then
            return KsgNpc:Talk("Kh�ng th� m� h�p th� c��i n�y")
        end
        KsgItem:AddHorse(nId, 4, 0, "KSG_ITEMPACK")
    end

    if szType == ITEMPACK_TYPE_ORN_CLOTH then
        -- ngo�i trang c�nh - l�ng
        if not KsgLib:HasEnoughBagRoom(1) then
            return
        end
        if KsgItem:DeleteByIndex(nItemIndex) ~= 1 then
            return KsgNpc:Talk("Kh�ng th� m� h�p ngo�i trang c�nh n�y")
        end
        KsgItem:AddOrnClothByBody(nId, 4, 0, "KSG_ITEMPACK")
    end
end

function _ksg_GiveItemPackItem(nItemIndex, szType, tbItem)
    if szType == ITEMPACK_TYPE_ITEM then
        -- C�c v�t ph�m
        if KsgItem:DeleteByIndex(nItemIndex) ~= 1 then
            return KsgNpc:Talk("Kh�ng th� m� t�i v�t ph�m n�y")
        end
        KsgAward:Give(tbItem, "ItemPack")
    end
end

function _ksg_HandleBaoRuongTK(nItemIndex)
    if not KsgLib:HasEnoughBagRoom(1, 200) then
        return 0
    end
    if KsgItem:DeleteByIndex(nItemIndex, 1) ~= 1 then
        return KsgNpc:Talk("M� r��ng th�t b�i")
    end
    KsgItem:AddSuitByBody(95)
end

function _ksg_HandleKinhNghiemDon(nItemIndex)
    local g, d, p = GetItemInfoByIndex(nItemIndex)
    if not g_tbKinhNghiemDonCfg[PackItemId(g, d, p)] then
        return
    end
    local nExp = g_tbKinhNghiemDonCfg[PackItemId(g, d, p)]

    if CanModifyLargeExp(nExp) ~= 1 then
        return KsgNpc:Talk("�i�m kinh nghi�m �� ��t gi�i h�n, kh�ng th� s� d�ng Kinh Nghi�m ��n")
    end

    if KsgItem:DeleteByIndex(nItemIndex) ~= 1 then
        return KsgNpc:Talk("Kh�ng th� d�ng kinh nghi�m ��n, h�y th� l�i sau")
    end
    KsgAward:Give({ nExp = nExp }, "Kinh Nghi�m ��n")
end

function _ksg_HandlePhongHoaQuyen(nItemIndex)
    if KsgItem:DeleteByIndex(nItemIndex) == 1 then
        KsgAward:Give({ nPhongHoa = 1 }, "Phong Hoa Quy�n")
    end
end
