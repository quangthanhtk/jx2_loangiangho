Import("\\script\\ksgvn\\lib.lua")

function OnUse(nItemIdx)
    if not KsgLib:HasEnoughBagRoom(10, 500) then
        return
    end
    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk("C�c h� c�n gia nh�p m�n ph�i m�i c� th� m� t�i qu� n�y.")
    end

    local tbAward = {
        { nFunc = 'KsgAward:SetDieuDuong(9)' },
        { nFunc = 'KsgAward:SuperFactionBook(1)' },
        { tbProp = { 2, 1, 1006 }, nStatus = 4, nStack = 1 }, -- C�u Thi�n V� C�c ��n
        { tbProp = { 2, 1, 50016 }, nStatus = 4, nStack = 10 }, -- T�i Qu� V� L�m
        { tbProp = { 2, 1, 50005 }, nStatus = 4 }, -- R��ng YQ
        { tbProp = { 0, 105, 14 }, tbParam = { 3, 403 }, nStatus = 4 }, -- Tuy�t ��a 100%
        { nReborn = 790 },
        { nGold = 1 }
    }

    if DelItemByIndex(nItemIdx, 1) == 1 then
        KsgAward:Give(tbAward, "Qu� T�n Th�")
    end
end
