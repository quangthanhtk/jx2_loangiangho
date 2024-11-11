Import("\\script\\ksgvn\\lib.lua")
Import('\\script\\ksgvn\\event\\monthly\\monthly.lua')

function OnUse(nItemIndex)
    do return 0; end --LongDaiKa: ��ng t�nh n�ng

    local nMonth = tonumber(date("%m"))
    if KsgTask:Get(TASKID_TUIQUA_VOLAM_VERSION) ~= nMonth then
        KsgItem:DeleteAll(2, 1, 50016) -- x�a to�n b� t�i qu� v�o cu�i th�ng, tr�nh t�ch tr�
        KsgTask:Set(TASKID_TUIQUA_VOLAM_VERSION, nMonth)
        return KsgNpc:Talk("T�i qu� n�y �� h�t h�n. Kh�ng th� s� d�ng.")
    end

    if not KsgLib:HasEnoughBagRoom(2, 100) then
        return
    end

    local nExp = 5e6
    local nStatus = 4
    if KsgPlayer:IsVipAccount() then
        nStatus = 1
    end

    local szQuality = "%s m� T�i Qu� V� L�m nh�n ���c %d %s, th�t may m�n"
    local szHighQuality = "%s m� T�i Qu� V� L�m b�t ng� ph�t hi�n ra %d %s. Qu� l� h�ng v�n ���ng ��u!"
    local szHighestQuality = "%s c�m %d %s t� T�i Qu� V� L�m ch�m r�i c�t v�o t�i, giang h� ai n�y ��u ghen t�!"
    local tbAwardLuck = {

        { nPhongHoa = 1, nRate = 30 },
        { nPhongHoa = 2, nRate = 15 },
        { nPhongHoa = 3, nRate = 8 },
        { nPhongHoa = 4, nRate = 4 },
        { nPhongHoa = 5, nRate = 2 },
        { nPhongHoa = 10, nRate = 1 },

        { tbProp = { 0, EQUIP_TYPE_SUB_BOOK, 224 }, nStatus = nStatus, nRate = 0.005, nQuality = szQuality }, -- Ti�u dao m�t t�ch
        { tbProp = { 0, 112, 78 }, nStatus = nStatus, nRate = 0.05 }, -- L�ng 3 Vi b�
        { tbProp = { 2, 1, 1000 }, nStatus = nStatus, nRate = 0.25, nExpiredTime = 7 * 24 * 3600 }, -- B�n Long B�ch
        { tbProp = { 2, 1, 30424 }, nStatus = nStatus, nRate = 0.1 }, -- c��ng h�a quy�n 12
        { tbProp = { 2, 1, 30425 }, nStatus = nStatus, nRate = 0.1 }, -- c��ng h�a quy�n 13
        { tbProp = { 2, 1, 30426 }, nStatus = nStatus, nRate = 0.1 }, -- c��ng h�a quy�n 14
        { tbProp = { 2, 1, 30427 }, nStatus = nStatus, nRate = 0.1 }, -- c��ng h�a quy�n 15
        { tbProp = { 2, 1, 30998 }, nStatus = nStatus, nRate = 2 }, -- T�i b�o th�ch c�p 1
        { tbProp = { 2, 1, 30999 }, nStatus = nStatus, nRate = 0.5 }, -- T�i b�o th�ch c�p 2
        { tbProp = { 2, 1, 31000 }, nStatus = nStatus, nRate = 0.1 }, -- T�i b�o th�ch c�p 3
        { tbProp = { 2, 1, 30428, }, nStatus = nStatus, nRate = 1 }, -- Ma �ao Th�ch C�p 1
        { tbProp = { 2, 1, 30429, }, nStatus = nStatus, nRate = 0.5 }, -- Ma �ao Th�ch C�p 2
        { tbProp = { 2, 1, 30430, }, nStatus = nStatus, nRate = 0.05 }, -- Ma �ao Th�ch C�p 3
        { tbProp = { 2, 95, 2084 }, nStatus = nStatus, nStack = 1, nRate = 0.5 }, --H�o Hi�p L�nh
        { tbProp = { 2, 1, 30913 }, nStatus = nStatus, nRate = 0.05 }, -- ��ng t� chi nguy�n
        { tbProp = { 2, 1, 31386 }, nStatus = nStatus, nRate = 1 }, -- M�nh th� c��i
        { tbProp = { 2, 1, random(31383, 31385) }, nStatus = nStatus, nRate = 0.1, nStack = 3 }, -- M�nh kx 6
        { tbProp = { 2, 1, 1067 }, nStatus = nStatus, nRate = 0.05, nExpiredTime = 7 * 24 * 3600 }, -- ��nh h�n nh�
        { tbProp = { 2, 1, 1113 }, nStatus = nStatus, nRate = 0.001, nExpiredTime = 7 * 24 * 3600, nQuality = szHighQuality }, -- ��nh h�n l�n

        { tbProp = { 2, 0, 554 }, nStatus = nStatus, nExpiredTime = 7 * 24 * 3600, nRate = 0.5 }, -- Tu Ch�n YQ
        { tbProp = { 2, 1, 30269 }, nStatus = nStatus, nExpiredTime = 7 * 24 * 3600, nRate = 0.5 }, -- C�y t� linh

        { tbProp = { 2, 1, 30367 }, nStatus = 4, nRate = 1 }, -- T�i ti�n
        { tbProp = { 2, 1, 1009 }, nStatus = nStatus, nRate = 0.5 }, -- Thi�n th�ch tinh th�ch
        { tbProp = { 2, 1, 1068 }, nStatus = nStatus, nExpiredTime = 7 * 24 * 3600, nRate = 0.1 }, -- Thi�n th�ch linh th�ch

        { tbProp = { 2, 1, 3206 }, nStatus = nStatus, nExpiredTime = 30 * 24 * 3600, nRate = 0.01 }, -- V� L�m B�o �i�n

        { tbProp = { 2, 1, 31118 }, nStatus = nStatus, nRate = 1, nStack = 1 }, -- ��n Ho�ng Huy�n Thuy�t
        { tbProp = { 2, 1, 31119 }, nStatus = nStatus, nRate = 1, nStack = 1 }, -- ��n Ho�ng H� Ph�ch
        { tbProp = { 2, 1, 31120 }, nStatus = nStatus, nRate = 1, nStack = 1 }, -- ��n Ho�ng Huy�n Tinh
        { tbProp = { 2, 1, 31121 }, nStatus = nStatus, nRate = 1, nStack = 1 }, -- ��n Ho�ng M� N�o

        { tbProp = { 2, 1, 30847 }, nStatus = nStatus, nRate = 0.02, nStack = 1 }, -- H�i Ti�n ��n

        { tbProp = { 2, 1, 30521 }, nStatus = nStatus, nRate = 2 }, -- T�y t�m th�ch 1
        { tbProp = { 2, 1, 30522 }, nStatus = nStatus, nRate = 0.5 }, -- T�y t�m th�ch 2
        { tbProp = { 2, 1, 30523 }, nStatus = nStatus, nRate = 0.1 }, -- T�y t�m th�ch 3

        { tbProp = { 2, 1, 30527 }, nStatus = nStatus, nRate = 2 }, -- Luy�n L� th�ch 1
        { tbProp = { 2, 1, 30528 }, nStatus = nStatus, nRate = 0.5 }, -- Luy�n L� th�ch 2
        { tbProp = { 2, 1, 30529 }, nStatus = nStatus, nRate = 0.1 }, -- Luy�n L� th�ch 3

        { tbProp = { 2, 1, 30533 }, nStatus = nStatus, nRate = 2 }, -- Thi�t tinh c�p 1
        { tbProp = { 2, 1, 30534 }, nStatus = nStatus, nRate = 0.5 }, -- Thi�t tinh c�p 2
        { tbProp = { 2, 1, 30535 }, nStatus = nStatus, nRate = 0.2 }, -- Thi�t tinh c�p 3
        { tbProp = { 0, 107, random(51, 66) }, nStatus = nStatus, nRate = 0.05 }, -- m�t t�ch ng�u nhi�n
        { tbProp = { 2, 1, 50027 }, nStatus = nStatus, nRate = 0.005, nQuality = szQuality }, -- R��ng Tr�n Ph�i
    }

    local tbVipAward = {
        { tbProp = { 2, 1, 30370 }, nStatus = nStatus, nRate = 0.01, nQuality = szHighestQuality, nStack = 1 }, -- Thi�n M�n Kim L�nh
        { tbProp = { 2, 95, 204 }, nStatus = nStatus, nRate = 0.01, nQuality = szHighestQuality, nStack = 1 }, -- Thi�n Cang L�nh
        { tbProp = { 2, 1, random(31397, 31399) }, nStatus = nStatus, nRate = 0.05, nQuality = szHighQuality, nStack = 3 }, -- M�nh kx 7
        { tbProp = { 2, 1, 50028 }, nStatus = nStatus, nRate = 0.001, nQuality = szHighQuality }, -- C� Ph�- T�i T�n Quy�n
        { tbProp = { 2, 1, 31505 }, nStatus = nStatus, nRate = 0.005, nQuality = szHighestQuality }, -- Bao �� qu� c�p 7
        { tbProp = { 2, 1, 31410 }, nStatus = nStatus, nRate = 0.005, nQuality = szHighestQuality }, -- T�i s�ch k� n�ng th� c�ng c�p 6
    }

    tbAwardLuck = gf_MergeTable(tbAwardLuck, tbVipAward)
    if KsgPlayer:IsVipAccount() then
        nStatus = 1
    end

    local nRate = 0
    for k, v in tbAwardLuck do
        nRate = nRate + v.nRate
    end

    KsgLog:Print("Rate T�i Qu� Hi�n l�  " .. nRate)

    local tbAdditionAward = {

    }
    if CanModifyExp(nExp) ~= 1 then
        if KsgLib:IsRate(50) then
            tinsert(tbAdditionAward, { nRepute = 10 })
        else
            tinsert(tbAdditionAward, { nFactionPoint = 10 })
        end
    end
    if 1 == KsgItem:DeleteByIndex(nItemIndex) then
        if CanModifyExp(nExp) == 1 then
            KsgPlayer:BigAddExp(nExp)
        end
        KsgAward:Give(tbAwardLuck, 'T�i qu� V� L�m 2-May m�n')
        if getn(tbAdditionAward) > 0 then
            KsgAward:Give(tbAdditionAward, 'T�i qu� V� L�m 2-Th��ng Th�m')
        end
    end
end
