Import("\\script\\ksgvn\\lib.lua")

function book_AddBookByType(nNum, nType)
    -- M�t t�ch m�n ph�i
    local nRoute = KsgPlayer:GetRoute()
    local tbBook = g_tbFactionBook_Basic
    nType = nType or 1
    if nType == 2 then
        tbBook = g_tbFactionBook_Advanced
    end
    if nType == 3 then
        tbBook = g_tbFactionBook_High
    end
    if nType == 4 then
        tbBook = g_tbFactionBook_High_VIP
    end
    if nType == 5 then
        tbBook = g_tbFactionBook_Super
    end   
    if nType == 6 then
        tbBook = g_tbFactionBook_Secret
    end
    if not tbBook[nRoute] then
        return
    end
    local tbAward = {
        { tbProp = { GENRE_ITEM_EQUIP, EQUIP_TYPE_BOOK, tbBook[nRoute] }, nStack = nNum, nStatus = 4 }
    }
    if nType == 1 then
        tinsert(tbAward, { tbProp = { GENRE_ITEM_EQUIP, EQUIP_TYPE_BOOK, tbBook[nRoute] + 1 }, nStack = nNum, nStatus = 4 })
    end
    KsgAward:Give(tbAward)
end

function book_AddCommonBook(nId, nNum)
    nNum = nNum or 1
    KsgAward:Give({ tbProp = { GENRE_ITEM_EQUIP, EQUIP_TYPE_BOOK, nId }, nStack = nNum, nStatus = 4 })
end

function book_ShowCommonMenu()
    local tSay = {
        "H�y ch�n lo�i m�t t�ch:",
    }
    for i = 55, 66 do
        tinsert(tSay, format("Nh�n %s/#book_AddCommonBook(%d)", KsgItem:GetName(GENRE_ITEM_EQUIP, EQUIP_TYPE_BOOK, i), i))
    end
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function book_AddMasterBook()
    if not KsgLib:HasEnoughBagRoom(1, 1) then
        return
    end
    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk("C�c h� ch�a gia nh�p m�n ph�i, kh�ng th� m� r��ng y�u quy�t n�y!")
    end
    local nRoute = KsgPlayer:GetRoute()
    if not g_tbFactionBook_Master[nRoute] then
        return
    end
    local tbAward = {
        { tbProp = { GENRE_ITEM_EQUIP, EQUIP_TYPE_EXTEND_BOOK, g_tbFactionBook_Master[nRoute] }, nStatus = 4 },
    }
    KsgAward:Give(tbAward, "Nh�n Tr�n Ph�i")
end

function book_FastPractice()
    for _ = 1, 100 do
        LevelUpBook()
    end
    for _ = 1, 100 do
        LevelUpBook(1)
    end
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
    KsgPlayer:Msg("Ho�n th�nh luy�n m�t t�ch!!")
end

function book_AddYeuQuyet()
    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk("C�c h� ch�a gia nh�p m�n ph�i, kh�ng th� nh�n r��ng y�u quy�t!")
    end

    KsgAward:Give({ tbProp = { 2, 1, 50005 }, nStack = 1, nStatus = 4 })
end

function book_AddCoPho()
    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk("C�c h� ch�a gia nh�p m�n ph�i, kh�ng th� l�nh ng� v� c�ng trong C� ph�!")
    end
    local tbAward = {
        { tbProp = { 2, 1, 50028 }, nStack = 10, nStatus = 4 },
    }
    KsgAward:Give(tbAward)
end

function book_AddManhCoQuan()
    KsgAward:Give({ tbProp = { 2, 1, 31244 }, nStack = 5000, nStatus = 4 })
end

function book_AddPopur()
    ModifyPopur(10000)
    KsgPlayer:ModifyPopur2(10000)
end

function book_AddLangBa()
    local tbAward = {
        { tbProp = { GENRE_ITEM_EQUIP, EQUIP_TYPE_EXTEND_BOOK, 158 }, nStatus = 4 },
    }
    KsgAward:Give(tbAward, "Nh�n L�ng Ba Vi B�")
end

function book_AddTieuDao()
    local tbAward = {
        { tbProp = { GENRE_ITEM_EQUIP, EQUIP_TYPE_EXTEND_BOOK, 224 }, nStatus = 4 },
    }
    KsgAward:Give(tbAward, "Nh�n Ti�u Dao M�t t�ch")
end
