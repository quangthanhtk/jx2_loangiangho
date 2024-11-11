Import("\\script\\ksgvn\\lib.lua")

function factionSupport_IsTodayReceived()
    local today = tonumber(date('%d'))
    if KsgTask:GetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_FACTION_SUPPORT) == today then
        return 1
    end
    return nil
end

function factionSupport_SetLimit()
    if KsgPlayer:IsAdmin() then
        return
    end
    local nDate = tonumber(date('%d'))
    --KsgTask:SetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_FACTION_SUPPORT, nDate)
    --KsgNpc:Talk("H� tr� m�n ph�i m�i ng�y ch� ���c nh�n 1 l�n, xin h�y gi� g�n c�n th�n, ��ng �� l�ng ph�!")
end

function factionSupport_TLT()
    if not KsgLib:HasEnoughBagRoom(2, 1) then
        return
    end
    local tbItemSupport = {
        { tbProp = { 2, 3, 4 }, nStatus = 4, nStack = 999 }, --goc ksgvn 99 -- Thi�n Ph�t Ch�u
        { tbProp = { 2, 3, 12 }, nStatus = 4, nStack = 999 }, --goc ksgvn 99 -- Ph� Ma Ch�
    }
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_DuongMon()
    if not KsgLib:HasEnoughBagRoom(11, 1) then
        return
    end
    local tbItemSupport = {
        { tbProp = { 2, 3, 6 }, nStatus = 4, nStack = 999 } -- C� quan
    }
    for i = 1, 9 do
        tinsert(tbItemSupport, { tbProp = { 2, 11, i }, nStatus = 4, nStack = 2000 }) -- �m kh�
    end
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_NgaMiKiem()
    if not KsgLib:HasEnoughBagRoom(1, 1) then
        return
    end
    KsgAward:Give({ tbProp = { 2, 3, 7 }, nStatus = 4, nStack = 200 }) -- X� L�i Kim ��n
    factionSupport_SetLimit()
end

g_tbHorseAttribute = {
    { "T�ng sinh l�c 4000 �i�m", 4000, 2, 486 },
    { "Ngo�i c�ng t�ng 4 %", 1500, 1, 261 },
    { "Ngo�i c�ng t�ng 8 %", 4, 2, 261 },
    { "T�ng t�c �� xu�t chi�u 6 %", 1, 1, 24 },
    { "T�ng t�c �� xu�t chi�u 9 %", 1, 2, 24 },
    { "H� tr� m�t t�ch t�ng th�m 4 %", 1, 1, 564 },
    { "H� tr� m�t t�ch t�ng th�m 5 %", 1, 2, 564 },
    { "T�ng sinh l�c 1000 �i�m", 100, 1, 486 },
    { "N�i ph�ng, ngo�i ph�ng t�ng 98 �i�m", 1500, 5, 420 },
    { "N�i l�c ti�u hao 15 %", 1000, 2, 443 },
    { "X�c su�t gi�m n�a th� th��ng 10 %", 900, 1, 302 },
    { "Kh�ng t�t c� 10 �i�m", 990, 2, 329 },
    { "L�c t�n c�ng D��ng Gia B�n Lang Th��ng t�ng 15 %", 1, 1, 323 },
    { "L�c t�n c�ng D��ng Gia To�i Kim Ti�n t�ng 15 %", 1, 1, 325 },
}

function factionSupport_DGT()
    if not KsgLib:HasEnoughBagRoom(1, 10) then
        return
    end

    if BigGetItemCount(0, 105, 38) == 0 then
        local nRand = gf_GetRandItemByTable(g_tbHorseAttribute, 10000, 1)
        KsgAward:Give({ tbProp = { 0, 105, 38 }, nStatus = 4, tbParam = { 1, 306, 6, 404, g_tbHorseAttribute[nRand][3], g_tbHorseAttribute[nRand][4] } })
        factionSupport_SetLimit()
    end
end

function factionSupport_DGC()
    if not KsgLib:HasEnoughBagRoom(2, 100) then
        return
    end
    local tbItemSupport = {
        { tbProp = { 2, 15, 10 }, nStack = 4000, nStatus = 4 } --goc ksgvn 2000 -- T�n
    }

    if BigGetItemCount(0, 105, 38) == 0 then
        local nRand = gf_GetRandItemByTable(g_tbHorseAttribute, 10000, 1)
        tinsert(tbItemSupport, { tbProp = { 0, 105, 38 }, nStatus = 4, tbParam = { 1, 306, 6, 404, g_tbHorseAttribute[nRand][3], g_tbHorseAttribute[nRand][4] } })
    end
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_HiepDoc()
    if not KsgLib:HasEnoughBagRoom(5, 100) then
        return
    end
    local tbItemSupport = {
        { tbProp = { 1, 6, 34 }, nStack = 30, nStatus = 4 }, -- Tr�ng Qu�i V��ng
        { tbProp = { 1, 6, 46 }, nStack = 30, nStatus = 4 }, -- H�a k� l�n
        { tbProp = { 1, 6, 84 }, nStack = 30, nStatus = 4 }, -- Huy�n V� �ao
        { tbProp = { 1, 6, 153 }, nStack = 30, nStatus = 4 }, -- X�ch Luy�n H�a H�
        { tbProp = { 1, 6, 154 }, nStack = 30, nStatus = 4 }, -- Li�t Nhan Li Long
        --{ tbProp = { 1, 6, 150 }, nStack = 2, nStatus = 4 }, -- L�nh H��ng L�ng
    }
    if KsgLib:GetSrvCfg("bOpenTestCard") == 1 then
        tinsert(tbItemSupport, { szName = "L�nh H��ng L�ng", tbProp = { 1, 6, 150 }, nStack = 30, nStatus = 4 })
    end
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_TaDoc()
    if not KsgLib:HasEnoughBagRoom(32, 1) then
        return
    end
    local tbItemSupport = {};
    for i = 1, 31 do
        tinsert(tbItemSupport, { tbProp = { 2, 17, i }, nStatus = 4, nStack = 999 }); --goc ksgvn 200 -- c�c lo�i c�
    end
    if BigGetItemCount(2, 0, 1063) < 1 then
        tinsert(tbItemSupport, { tbProp = { 2, 0, 1063 }, nStatus = 4 }) -- Th�n M�c V��ng ��nh
    end
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_CLKT()
    if not KsgLib:HasEnoughBagRoom(1, 1) then
        return
    end
    local tbItemSupport = {}
    if BigGetItemCount(2, 20, 100) < 1 then
        tinsert(tbItemSupport, {
            tbProp = { 2, 20, 100 }, nStatus = 4 --Linh Ki�m c�p 1
            --tbProp = { 2, 20, 104 }, nStatus = 4 --Kho�ng Th� Th�n Ki�m
        })
    end
    if BigGetItemCount(2, 201, 21) < 1 then
        tinsert(tbItemSupport, { tbProp = { 2, 201, 21 }, nStatus = 4 }) -- L� Luy�n Ki�m
    end

    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_ThuyYenLinhNu()
    local tbSay = {
        g_szTitle .. "Thao t�c Ti�u �i�u",
        "Nh�n Ti�u �i�u/factionSupport_NhanTieuDieu",
        "Nu�i Ti�u �i�u/factionSupport_NuoiTieuDieu",
        "Hu�n luy�n Ti�u �i�u/factionSupport_HuanLuyenTieuDieu",
        "Tr� l�i/no",
    }
    KsgNpc:SayDialog(tbSay)
end

function factionSupport_NhanTieuDieu()
    if not KsgLib:HasEnoughBagRoom(1, 1) then
        return
    end
    KsgAward:Give({ tbProp = { 2, 20, random(1, 5) }, nStatus = 4 }); -- c�c lo�i �i�u
    factionSupport_SetLimit()
end

function factionSupport_NuoiTieuDieu()
    if not KsgLib:HasEnoughBagRoom(11, 1) then
        return
    end
    local tbItemSupport = {}
    for i = 6, 12 do
        if i == 11 then
            tinsert(tbItemSupport, { tbProp = { 2, 97, i }, nStatus = 4 }); -- Hu�n Luy�n Ti�u
        else
            tinsert(tbItemSupport, { tbProp = { 2, 97, i }, nStatus = 4, nStack = 100 }); -- c�c lo�i th�c �n c�a �i�u
        end
    end
    KsgAward:Give(tbItemSupport)
    factionSupport_SetLimit()
end

function factionSupport_HuanLuyenTieuDieu()
    local nPetItemIndex = GetPlayerEquipIndex(12)
    if (nPetItemIndex == nil or nPetItemIndex <= 0) then
        return KsgPlayer:Msg("C�c h� ch�a c� th� c�ng, kh�ng th� ti�n h�nh hu�n luy�n!")
    end
    local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex)
    if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil) or (ItemGen ~= 2 or ItemDetail ~= 20)
    then
        return KsgPlayer:Msg("C�c h� ch�a c� th� c�ng, kh�ng th� ti�n h�nh hu�n luy�n!")
    end

    for _ = 1, 84 do
        LevelUpPet(nPetItemIndex)
    end
    factionSupport_SetLimit()
end