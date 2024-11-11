Import("\\script\\ksgvn\\lib.lua")

SOURCE_SERVER_ID = 5 -- from Phi Long
TARGET_SERVER_ID = 6 -- to Ng�a H�
NEW_SERVER_ID = 7 -- Phi Long + Ng�a H�  = Long H� M�n

function OnUse(nItemIdx)
    if not KsgLib:HasEnoughBagRoom(10, 100) then
        return
    end
    if KsgPlayer:GetBigLevel() < 991 then
        return KsgNpc:Talk("Nh�n v�t c�n ��t chuy�n sinh 9 c�p 91 tr� l�n m�i c� th� m� t�i qu� n�y.")
    end

    local nLastServerId = KsgTask:GetByte(TASKID_SERVER, TASK_SERVER_BYTE_LAST_SERVER_ID)
    local nExpPill = 10
    if nLastServerId == TARGET_SERVER_ID then
        nExpPill = 20
    end

    local tbAward = {
        { tbProp = { 2, 1, 50016 }, nStatus = 4, nStack = 200 }, -- T�i Qu� V� L�m
        { tbProp = { 2, 95, 204 }, nStatus = 4, nStack = 10 }, -- Thi�n Cang L�nh
        { tbProp = { 2, 1, 30370 }, nStatus = 4, nStack = 10 }, -- Thi�n M�n Kim L�nh
        { tbProp = { 2, 102, 214, }, nStatus = 4, nStack = 1 }, -- Th��ng H�i Ch�u c�p 7 - kh�a
        { tbProp = { 2, 1, 50265 }, nStatus = 4, nStack = 1 }, -- Th� t�a k� Truy�n Thuy�t
        { tbProp = { 2, 1, 50253 }, nStatus = 4, nStack = nExpPill },
    }

    if KsgLib:GetServerId() ~= NEW_SERVER_ID then
        return KsgNpc:Talk("C�c h� kh�ng �� �i�u ki�n m� t�i qu� n�y.")
    end

    if DelItemByIndex(nItemIdx, 1) == 1 then
        KsgAward:Give(tbAward, "Qu� G�p M�y Ch�")
    end
end
