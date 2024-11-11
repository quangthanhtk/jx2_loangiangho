KsgReborn = KsgReborn or {}

function KsgReborn:ChangeRoute(nRebornRoute)
    if g_tbRebornRouteNames[nRebornRoute] then
        local nCurLevel = GetLevel()
        local nRebornCount = KsgPlayer:GetRebornCount()
        local tbRequirements = {
            tbItems = {
                { szName = "Xu", tbProp = { 2, 1, 30230 }, nCount = nRebornCount * 100 }
            },
        }
        
        if KsgLib:PayMaterial(tbRequirements) then
            if nRebornCount > 5 then
                PlayerReborn(nRebornCount - 5, nRebornRoute) --Thay ��i h��ng ph�c sinh
                SetLevel(nCurLevel, 0)
            end

            KsgTask:SetByte(TASKID_TRANSLIFE, TASK_TRANSLIFE_BYTE_ROUTE, nRebornRoute) --set reborn route
            KsgReborn:ReceiveSeal(nRebornRoute)
            KsgReborn:ReceiveCoat(nRebornCount, nRebornRoute)
            return KsgNpc:Talk("Ch�c m�ng ��i hi�p �� thay ��i h��ng Chuy�n Sinh th�nh c�ng!", 1)
        end
    end
end

-- Nh�n �n v� ngo�i trang chuy�n sinh
function KsgReborn:ReceiveCoatAndSeal()
    if not KsgLib:HasEnoughBagRoom(5, 300) then
        return
    end
    local nRebornCount = KsgPlayer:GetRebornCount()
    if nRebornCount == 0 then
        return KsgNpc:Talk("C�c h� ch�a chuy�n sinh, kh�ng th� th�c hi�n thao t�c n�y")
    end
    local nRebornRoute = KsgPlayer:GetRebornRoute()
    local tbRequirements = {
        nGold = 100 * nRebornCount,
    }
    if KsgLib:PayMaterial(tbRequirements) then
        KsgReborn:ReceiveSeal(nRebornRoute)
        KsgReborn:ReceiveCoat(nRebornCount, nRebornRoute)
    end
end

-- Nh�n �n
function KsgReborn:ReceiveSeal(nRebornRoute)
    if not g_tbRebornSeal[nRebornRoute] then
        return
    end
    for _, cfgSeal in g_tbRebornSeal do
        KsgItem:DeleteAll(cfgSeal.tbProp) -- X�a �n
    end
    local tbSeal = g_tbRebornSeal[nRebornRoute]
    KsgAward:Give(tbSeal, 'Nh�n �n ' .. tbSeal.szName)
end

-- Nh�n hi�u
function KsgReborn:ReceiveTitle(nRebornCount)
    assert(nRebornCount > 0 and nRebornCount <= MAX_REBORN_LEVEL, format("KsgReborn:ReceiveTitle fail, invalid reborn level %d", nRebornCount))
    local nRoute = KsgPlayer:GetRoute()
    if nRoute == 0 then
        return
    end
    if nRebornCount < 6 then
        if nRebornCount > 1 then
            RemoveTitle(g_tbRebornTitle_Basic[nRebornCount - 1][nRoute][2], g_tbRebornTitle_Basic[nRebornCount - 1][nRoute][3])
        end
        AddTitle(g_tbRebornTitle_Basic[nRebornCount][nRoute][2], g_tbRebornTitle_Basic[nRebornCount][nRoute][3])
        SetCurTitle(g_tbRebornTitle_Basic[nRebornCount][nRoute][2], g_tbRebornTitle_Basic[nRebornCount][nRoute][3])
    end

    if nRebornCount == 6 then
        RemoveTitle(g_tbRebornTitle_Basic[5][nRoute][2], g_tbRebornTitle_Basic[5][nRoute][3])
    end
    if g_tbRebornTitle_Advanced[nRebornCount] ~= nil then
        local nTitleA, nTitleB = g_tbRebornTitle_Advanced[nRebornCount][1], g_tbRebornTitle_Advanced[nRebornCount][2]
        AddTitle(nTitleA, nTitleB)
        if g_tbRebornTitle_Advanced[nRebornCount - 1] ~= nil then
            nTitleA, nTitleB = g_tbRebornTitle_Advanced[nRebornCount - 1][1], g_tbRebornTitle_Advanced[nRebornCount - 1][2]
            RemoveTitle(nTitleA, nTitleB)
        end
    end
end

function KsgReborn:ReceiveHorse(nRebornCount)
    assert(nRebornCount > 0 and nRebornCount <= MAX_REBORN_LEVEL, format("KsgReborn:ReceiveHorse fail, invalid reborn level %d", nRebornCount))
    if g_tbRebornHorses[nRebornCount] then
        KsgAward:Give(g_tbRebornHorses[nRebornCount], "Th� c��i chuy�n sinh " .. nRebornCount)
    end
end

function KsgReborn:ReceiveCoat(nRebornCount, nRebornRoute)
    assert(nRebornCount > 0 and nRebornCount <= MAX_REBORN_LEVEL, format("KsgReborn:ReceiveCoat fail, invalid reborn level %d", nRebornCount))
    if nRebornCount > 10 then
        nRebornCount = 10
    end
    local tbRebornCoatCfg = {}
    local nBody = KsgPlayer:GetBody()
    if nRebornCount > 5 then
        tbRebornCoatCfg = g_tbRebornCoats[nRebornCount][nRebornRoute][nBody]
    else
        tbRebornCoatCfg = g_tbRebornCoats[nRebornCount][nRebornRoute]
    end
    local nBodyIndex = nBody - 1
    local tbRemoveCoatP = {
        [2] = 570 + nBodyIndex,
        [3] = 562 + nBodyIndex,
        [4] = 30001 + nBodyIndex,
        [5] = 30005 + nBodyIndex,
        [6] = 30009 + nBodyIndex,
        [7] = 30029 + nBodyIndex,
        [8] = 680 + nBodyIndex,
        [9] = 901 + nBodyIndex,
        [10] = 634 + nBodyIndex,
    }
    local tbAward = {}
    for _, coatCfg in tbRebornCoatCfg do
        local G, D, P, nNum, nStatus, nAttr1Lv, nAttr1, nAttr2Lv, nAttr2, nAttr3Lv, nAttr3 = KsgLib:UnPack(coatCfg)
        if nRebornCount < 6 then
            P = P + nBody - 1
        end
        nAttr3Lv = nAttr3Lv or 0
        nAttr3 = nAttr3 or 0
        for rbCount, nDelP in tbRemoveCoatP do
            if nRebornCount >= rbCount then
                KsgItem:DeleteAll(G, D, nDelP)
            end
        end
        KsgItem:DeleteAll(G, D, P)
        tinsert(tbAward, { tbProp = { G, D, P }, tbParam = { nAttr1Lv, nAttr1, nAttr2Lv, nAttr2, nAttr3Lv, nAttr3 }, nStatus = nStatus, nStack = nNum })
    end
    if nRebornCount > 8 then
        local nCixiuId = g_tbRebornCixiuCfg[nRebornCount][nRebornRoute]
        tinsert(tbAward, { tbProp = { 0, 148, nCixiuId }, nStatus = 4 })
        tinsert(tbAward, { tbProp = { 0, 149, nCixiuId + 4 }, nStatus = 4 })
        tinsert(tbAward, { tbProp = { 0, 150, nCixiuId }, nStatus = 4 })
    end
    KsgAward:Give(tbAward, 'Nh�n ngo�i trang chuy�n sinh ' .. nRebornCount)
end

function KsgReborn:SendNews(nRebornCount)
    assert(nRebornCount > 0 and nRebornCount <= MAX_REBORN_LEVEL, format("KsgReborn:SendNews fail, invalid reborn level %d", nRebornCount))
    local nMapId, nX, nY = GetWorldPos()
    local tMapName = {
        [100] = "Tuy�n Ch�u",
        [150] = "D��ng Ch�u",
        [200] = "Bi�n Kinh",
        [300] = "Th�nh ��",
        [350] = "T��ng D��ng",
        [400] = "��i L�",
        [500] = "Ph�ng T��ng",
    }
    if not tMapName[nMapId] then
        return
    end
    local x = floor(nX / 8)
    local y = floor(nY / 16)
    local msg = "C� tin ��n r�ng %s t�i %d/%d %s �ang ti�n h�nh luy�n Tr��ng Sinh Quy�t t�ng th� %d, tr� th�nh m�t Cao Th� Giang H�.";
    if nRebornCount > 1 then
        msg = "Cao th� %s t�i %d/%d %s �ang ti�n h�nh luy�n Tr��ng Sinh Quy�t t�ng th� %d, t�ng b��c m�u �� x�ng b� v� l�m!";
    end
    if nRebornCount == 6 then
        msg = "��i cao th� %s t�i %d/%d %s �� h�c ���c Ph�c Sinh Quy�t t�ng th� 1, ti�n b� l�n tr�n con ���ng v� h�c!";
    end
    if nRebornCount == 7 then
        msg = "Tuy�t th� cao th� %s t�i %d/%d %s �ang luy�n Ph�c Sinh Quy�t t�ng th� 2, giang h� s�p x�y ra ��i lo�n!";
    end
    if nRebornCount == 8 then
        msg = "Giang h� t��ng truy�n %s t�i %d/%d %s �� nghi�n c�u v� luy�n th�nh Ph�c Sinh Quy�t t�ng th� 3, tr� th�nh C�u Ng� Ch� T�n trong thi�n h�!";
    end
    if nRebornCount == 9 then
        msg = "Giang h� t��ng truy�n %s t�i %d/%d %s �� d�n l�nh ng� Ph�c Sinh Quy�t ��n t�ng th� 4, tr� th�nh m�t C�i Th� H�o Ki�t!";
    end
    if nRebornCount == 10 then
        msg = "Giang h� t��ng truy�n %s t�i %d/%d %s �� luy�n th�nh Ph�c Sinh Quy�t t�ng th� 5. Uy Ch�n Thi�n H�, V� ��ng C�n Kh�n!";
    end
    if nRebornCount > 5 then
        AddGlobalNews(format(msg, GetName(), x, y, tMapName[nMapId]))
        Msg2Global(format(msg, GetName(), x, y, tMapName[nMapId]))
    else
        AddGlobalNews(format(msg, GetName(), x, y, tMapName[nMapId], nRebornCount))
        Msg2Global(format(msg, GetName(), x, y, tMapName[nMapId], nRebornCount))
    end
end

-- Chuy�n sinh
function KsgReborn:PlayerReborn(nRebornLevel, nRebornRoute, nLevel, szCallback)
    assert(nRebornLevel > 0 and nRebornLevel <= MAX_REBORN_LEVEL, format("KsgReborn:PlayerReborn fail, invalid reborn level %d", nRebornLevel))
    nLevel = nLevel or 10
    if nRebornRoute < 0 or nRebornRoute > 4 then
        nRebornRoute = random(1, 4)
    end
    if GetStoreBoxPageCount() < 4 then
        SetStoreBoxPageCount(GetStoreBoxPageCount() + 1)
    end
    local szRebornName = "Tr��ng Sinh Quy�t"
    if nRebornLevel > 5 then
        PlayerReborn(nRebornLevel - 5, nRebornRoute) -- Reborn API
        SetTask(TASKID_REBORN1, 5)    -- Ho�n th�nh nhi�m v� ph�c sinh 1
        szRebornName = "Ph�c Sinh Quy�t "
    end

    if nRebornLevel < 6 then
        -- Set s� l�n chuy�n sinh
        KsgTask:SetByte(TASKID_TRANSLIFE, TASK_TRANSLIFE_BYTE_COUNT, nRebornLevel)
    end
    local nCurLevel = KsgPlayer:GetLevel()
    if nCurLevel < nLevel then
        AddLevelUp(nLevel - nCurLevel)
    end
    -- Set h��ng chuy�n sinh
    KsgTask:SetByte(TASKID_TRANSLIFE, TASK_TRANSLIFE_BYTE_ROUTE, nRebornRoute)
    KsgReborn:ReceiveTitle(nRebornLevel)
    KsgReborn:ReceiveHorse(nRebornLevel)
    KsgReborn:ReceiveSeal(nRebornRoute)
    KsgReborn:ReceiveCoat(nRebornLevel, nRebornRoute)

    KsgPlayer:Msg(format("�ang ti�n h�nh tu luy�n %s t�ng %d, h��ng tu luy�n: %s", szRebornName, nRebornLevel, KsgPlayer:GetRebornRouteName(nRebornRoute)))
    PlaySound("\\sound\\sound_i016.wav")
    ResetProperty()
    SetCurrentNpcSFX(PIdx2NpcIdx(), 945, 1, 0, 18 * 10)
    SaveNow()
    szCallback = szCallback or ""
    if type(szCallback) == "function" then
        szCallback()
    end
    Talk(1, szCallback, "Ch�c m�ng c�c h� �� l�nh h�i th�nh c�ng th�m 1 t�ng Ph�c Sinh Quy�t, h�y ��ng nh�p l�i!")
end

function KsgReborn:PlayerRebornWithNews(nBigLevel, nRebornRoute, szCallback)
    if KsgPlayer:GetBigLevel() >= nBigLevel then
        return
    end
    local nRebornCount, nLevel = KsgPlayer:GetRebornAndLevel(nBigLevel)
    assert(nRebornCount > 0 and nRebornCount <= MAX_REBORN_LEVEL, format("KsgReborn:PlayerRebornWithNews fail, invalid reborn level %d", nRebornCount))
    KsgReborn:PlayerReborn(nRebornCount, nRebornRoute, nLevel, szCallback)
    KsgReborn:SendNews(nRebornCount)
end

function KsgReborn:PlayerRebornWithNew2s(nBigLevel, nRebornRoute, szCallback)
    local nRebornCount, nLevel = KsgPlayer:GetRebornAndLevel(nBigLevel)
    assert(nRebornCount > 0 and nRebornCount <= MAX_REBORN_LEVEL, format("KsgReborn:PlayerRebornWithNews fail, invalid reborn level %d", nRebornCount))
    KsgReborn:PlayerReborn(nRebornCount, nRebornRoute, nLevel, szCallback)
    KsgReborn:SendNews(nRebornCount)
end
