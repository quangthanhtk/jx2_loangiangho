Include("\\script\\ksgvn\\award_types\\award_exp.lua")
Include("\\script\\ksgvn\\award_types\\award_gold.lua")
Include("\\script\\ksgvn\\award_types\\award_pet.lua")
Include("\\script\\ksgvn\\award_types\\award_phonghoa.lua")
Include("\\script\\ksgvn\\award_types\\award_popur.lua")
Include("\\script\\ksgvn\\award_types\\award_popur2.lua")
Include("\\script\\ksgvn\\award_types\\award_repute.lua")
Include("\\script\\ksgvn\\award_types\\award_honor.lua")
Include("\\script\\ksgvn\\award_types\\award_energy.lua")
Include("\\script\\ksgvn\\award_types\\award_faction_point.lua")
Include("\\script\\ksgvn\\award_types\\award_battle_point.lua")
Include("\\script\\ksgvn\\award_types\\award_chan_khi.lua")
Include("\\script\\ksgvn\\award_types\\award_item.lua")
Include("\\script\\ksgvn\\award_types\\award_func.lua")
Include("\\script\\ksgvn\\award_types\\award_custom.lua")
Include("\\script\\ksgvn\\award_types\\award_collection_coin.lua")
Include("\\script\\ksgvn\\award_types\\award_meridian_level.lua")
Include("\\script\\ksgvn\\award_types\\award_reborn.lua")
Include("\\script\\ksgvn\\award_types\\award_reborn_custom.lua")

KsgAward = KsgAward or {}
KsgAward.TYPES = {}

function KsgAward:RegType(szKey, pClass)
    KsgAward.TYPES[szKey] = pClass
end

function KsgAward:GiveByRandom(tbItem, tbLogTitle, nAwardCount)
    if not tbItem then
        return
    end
    local nRateTotal = 10000000
    local nRandom = random(1, nRateTotal)
    local nStep = 0
    for i = 1, getn(tbItem) do
        nStep = nStep + floor(tbItem[i].nRate * nRateTotal / 100);
        if (nRandom <= nStep) then
            return self:Give(tbItem[i], tbLogTitle, nAwardCount)
        end
    end
end

function KsgAward:Give(tbItem, szLogTitle, nAwardCount)
    if not tbItem then
        return
    end
    nAwardCount = nAwardCount or 1
    if type(tbItem[1]) == "table" then
        if tbItem[1].nRate then
            for _ = 1, nAwardCount do
                self:GiveByRandom(tbItem, szLogTitle, 1)
            end
            return 1
        else
            for i = 1, getn(tbItem) do
                self:Give(tbItem[i], szLogTitle, nAwardCount)
            end
            return 1
        end
    else
        for k, v in self.TYPES do
            if tbItem[k] then
                v:Give(tbItem, szLogTitle, nAwardCount)
                return 1
            end
        end
    end
end

-- Registers

KsgAward:RegType(AwardExp.szKey, AwardExp)
KsgAward:RegType(AwardGold.szKey, AwardGold)
KsgAward:RegType(AwardPet.szKey, AwardPet)
KsgAward:RegType(AwardPhongHoa.szKey, AwardPhongHoa)
KsgAward:RegType(AwardPopur.szKey, AwardPopur)
KsgAward:RegType(AwardPopur2.szKey, AwardPopur2)
KsgAward:RegType(AwardRepute.szKey, AwardRepute)
KsgAward:RegType(AwardHonor.szKey, AwardHonor)
KsgAward:RegType(AwardEnergy.szKey, AwardEnergy)
KsgAward:RegType(AwardFactionPoint.szKey, AwardFactionPoint)
KsgAward:RegType(AwardBattlePoint.szKey, AwardBattlePoint)
KsgAward:RegType(AwardChanKhi.szKey, AwardChanKhi)
KsgAward:RegType(AwardItem.szKey, AwardItem)
KsgAward:RegType(AwardFunc.szKey, AwardFunc)
KsgAward:RegType(AwardCustom.szKey, AwardCustom)
KsgAward:RegType(AwardCollectionCoin.szKey, AwardCollectionCoin)
KsgAward:RegType(AwardMeridianLevel.szKey, AwardMeridianLevel)
KsgAward:RegType(AwardReborn.szKey, AwardReborn)
KsgAward:RegType(AwardRebornCustom.szKey, AwardRebornCustom)

function KsgAward:SuperFactionBook(nCount, szLogTitle, nStatus, nQuality)
    nQuality = nQuality or 0
    local nRoute = KsgPlayer:GetRoute()
    local nBookId = g_tbFactionBook_Super[nRoute]
    if not nBookId then
        return
    end
    local tbAward = {
        tbProp = { GENRE_ITEM_EQUIP, EQUIP_TYPE_BOOK, nBookId }, nStatus = nStatus or 1, nQuality = nQuality, nStack = nCount or 1
    }
    self:Give(tbAward, szLogTitle)
end

function KsgAward:AddKimXa(nItemLevel, nUpgradeLevel, nType, nStatus, szLogTitle, nFeed)
    if not KsgLib:HasEnoughBagRoom(3, 3 * 100) then
        return
    end
    if not KsgLib:IsInRange(nItemLevel, 1, 9) then
        print("[KsgAward] Nh�n kim x� level kh�ng h�p l� " .. nItemLevel)
        return
    end
    nType = nType or 0
    local nDetailedId
    if nItemLevel < 3 then
        nDetailedId = nItemLevel
    end
    if nItemLevel == 3 then
        --nDetailedId = random(3, 9)
        nDetailedId = 9; -- m�c ��nh l� �m ch�
    end
    if nItemLevel == 4 then
        nDetailedId = 26
    end
    if nItemLevel == 5 then
        nDetailedId = 29
    end
    if nItemLevel == 6 then
        nDetailedId = 32
    end
    if nItemLevel == 7 then
        nDetailedId = 35
    end 
    if nItemLevel == 8 then
        nDetailedId = 38
    end
    if nItemLevel == 9 then
        nDetailedId = 41
    end
    nStatus = nStatus or 4
    nFeed = nFeed or 0
    if KsgPlayer:IsGM() and nStatus == 4 then
        nFeed = 1000000
    end
    if KsgLib:GetServerId() == 100 then
        nFeed = 1000000
    end
    local tbAward = {
        { tbProp = { GENRE_ITEM_EQUIP, EQUIP_TYPE_CAPE, nDetailedId + nType }, nLevel = nUpgradeLevel, nStatus = nStatus, nFeed = nFeed },
        { tbProp = { GENRE_ITEM_EQUIP, EQUIP_TYPE_BADGE, nDetailedId + nType }, nLevel = nUpgradeLevel, nStatus = nStatus, nFeed = nFeed },
        { tbProp = { GENRE_ITEM_EQUIP, EQUIP_TYPE_FOOT, nDetailedId + nType }, nLevel = nUpgradeLevel, nStatus = nStatus, nFeed = nFeed },
    }
    self:Give(tbAward, szLogTitle or "Nh�n Kim X� c�p " .. nItemLevel)
end

function KsgAward:ReceiveGem(nLevel, nAmount, nStatus)
    nLevel = nLevel or 1
    if nLevel < 1 or nLevel > 8 then
        return
    end
    nStatus = nStatus or 4
    nAmount = nAmount or 1
    if not KsgLib:HasEnoughBagRoom(floor(nAmount / 100), nAmount) then
        return
    end
    local tbAward = {}
    tinsert(tbAward, { tbProp = { 2, 22, 100 + nLevel }, nStack = nAmount, nStatus = nStatus }) -- Huy�t Tr�ch Th�ch
    tinsert(tbAward, { tbProp = { 2, 22, 200 + nLevel }, nStack = nAmount, nStatus = nStatus }) -- Nguy�t B�ch Th�ch
    tinsert(tbAward, { tbProp = { 2, 22, 300 + nLevel }, nStack = nAmount, nStatus = nStatus }) -- H� Ph�ch Th�ch
    tinsert(tbAward, { tbProp = { 2, 22, 400 + nLevel }, nStack = nAmount, nStatus = nStatus }) -- H�c Di�u Th�ch
    self:Give(tbAward, "Nh�n �� Kh�m")
end

function KsgAward:SetChienCuong(nLevel, nStatus)
    if not KsgLib:HasEnoughBagRoom(10, 1000) then
        return
    end
    nStatus = nStatus or 4
    local nRoute = KsgPlayer:GetRoute()
    nLevel = nLevel or 0

    if not g_tbEquipSet_ChienCuong[nRoute] then
        return KsgNpc:Talk("Ch�a gia nh�p m�n ph�i, kh�ng th� nh�n th��ng!")
    end
    if nRoute > 30 then
        KsgItem:AddSuit(g_tbEquipSet_ChienCuong[nRoute].nEquipStartId, nLevel, 'Nh�n b� chi�n cu�ng', nStatus)
        KsgItem:AddWeaponByRoute(g_tbEquipSet_ChienCuong[nRoute].nWeaponId, nStatus, nLevel, 'Nh�n b� chi�n cu�ng')
    else
        KsgItem:AddSuitByRoute(g_tbEquipSet_ChienCuong[nRoute].nEquipStartId, nLevel, 'Nh�n b� chi�n cu�ng', nStatus)
        KsgItem:AddWeaponByBodyIndex(g_tbEquipSet_ChienCuong[nRoute].nWeaponId, nStatus, nLevel, 'Nh�n b� chi�n cu�ng')
    end
end

function KsgAward:SetDieuDuong(nLevel, nStatus)
    if not KsgLib:HasEnoughBagRoom(10, 1000) then
        return
    end
    nStatus = nStatus or 4
    local nRoute = KsgPlayer:GetRoute()
    nLevel = nLevel or 0

    if not g_tbEquipSet_DieuDuong[nRoute] then
        return KsgNpc:Talk("Ch�a gia nh�p m�n ph�i, kh�ng th� nh�n th��ng!")
    end
    KsgItem:AddSuitByRoute(g_tbEquipSet_DieuDuong[nRoute].nEquipStartId, nLevel, 'Nh�n b� di�u d��ng', nStatus)
    KsgItem:AddWeaponByRoute(g_tbEquipSet_DieuDuong[nRoute].nWeaponId, nStatus, nLevel, 'Nh�n b� di�u d��ng')
    KsgItem:AddJewelry(3190, 5, "Nh�n b� di�u d��ng")
end

function KsgAward:SetLenhBaiVoHaHaoHiep(nLevel, nStatus)
    if not KsgLib:HasEnoughBagRoom(10, 1000) then
        return
    end
    nStatus = nStatus or 4
    local nRoute = KsgPlayer:GetRoute()
    nLevel = nLevel or 0

    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk("Ch�a gia nh�p m�n ph�i, kh�ng th� nh�n th��ng!")
    end

    local tbAward = {
        {tbProp = {2,1,40011}, nStack = 1, nStatus = nStatus, nLevel = nLevel}, -- V� H� H�o Hi�p L�nh (N�n)
        {tbProp = {2,1,40012}, nStack = 1, nStatus = nStatus, nLevel = nLevel}, -- V� H� H�o Hi�p L�nh (�o)
        {tbProp = {2,1,40013}, nStack = 1, nStatus = nStatus, nLevel = nLevel}, -- V� H� H�o Hi�p L�nh (Qu�n)
        {tbProp = {2,1,40014}, nStack = 1, nStatus = nStatus, nLevel = nLevel}, -- V� H� H�o Hi�p L�nh (V� Kh�)
        {tbProp = {2,1,40015}, nStack = 1, nStatus = nStatus, nLevel = 0}, -- V� H� H�o Hi�p L�nh (Trang S�c)
        {tbProp = {2,1,40015}, nStack = 1, nStatus = nStatus, nLevel = 0}, -- V� H� H�o Hi�p L�nh (Trang S�c)
    }
    self:Give(tbAward, format("Nh�n b� l�nh b�i V� H� H�o Hi�p nLevel=%d nStatus=%d", nLevel, nStatus));
end

function KsgAward:SetSuMon4(nLevel, nStatus)
    if not KsgLib:HasEnoughBagRoom(10, 1000) then
        return WEnv.RETCODE_NEEDROOM;
    end
    nStatus = nStatus or 4;
    local nRoute = KsgPlayer:GetRoute();
    nLevel = nLevel or 0;

    if not g_tbEquipSet_SuMon4[nRoute] then
        return KsgNpc:Talk("Ch�a gia nh�p m�n ph�i, kh�ng th� nh�n th��ng!");
    end
    KsgItem:AddSuitByRoute(g_tbEquipSet_SuMon4[nRoute].nEquipStartId, nLevel, 'Nh�n b� s� m�n 4', nStatus);
    KsgItem:AddWeaponByRoute(g_tbEquipSet_SuMon4[nRoute].nWeaponStartId, nStatus, nLevel, 'Nh�n b� s� m�n 4');
    KsgItem:AddJewelryByRoute(g_tbEquipSet_SuMon4[nRoute].nRing1StartId, "Nh�n b� s� m�n 4", nStatus);
    KsgItem:AddJewelryByRoute(g_tbEquipSet_SuMon4[nRoute].nRing2StartId, "Nh�n b� s� m�n 4", nStatus);
end

function KsgAward:SetSuMon5(nLevel, nStatus)
    if not KsgLib:HasEnoughBagRoom(10, 1000) then
        return WEnv.RETCODE_NEEDROOM;
    end
    nStatus = nStatus or 4;
    local nRoute = KsgPlayer:GetRoute();
    nLevel = nLevel or 0;

    if not g_tbEquipSet_SuMon5[nRoute] then
        return KsgNpc:Talk("Ch�a gia nh�p m�n ph�i, kh�ng th� nh�n th��ng!");
    end
    KsgItem:AddSuitByRoute(g_tbEquipSet_SuMon5[nRoute].nEquipStartId, nLevel, 'Nh�n b� s� m�n 5', nStatus);
    KsgItem:AddWeaponByRoute(g_tbEquipSet_SuMon5[nRoute].nWeaponStartId, nStatus, nLevel, 'Nh�n b� s� m�n 5');
    KsgItem:AddJewelryByRoute(g_tbEquipSet_SuMon5[nRoute].nRing1StartId, "Nh�n b� s� m�n 5", nStatus);
    KsgItem:AddJewelryByRoute(g_tbEquipSet_SuMon5[nRoute].nRing2StartId, "Nh�n b� s� m�n 5", nStatus);
end

function KsgAward:MenuKimXaTuChon(nLevel, nUpgradeLevel, bCanClose)
    nUpgradeLevel = nUpgradeLevel or 0
    local tSay = {
        "Ch�n <color=yellow>1 b� trang b� Kim x� d��i ��y<color>, h�y suy ngh� k� tr��c khi ch�n!<enter><color=red>(L�u �: N�u r�i tr� ch�i trong khi ch�n s� m�t ph�n th��ng n�y)",
    }
    for nType, szName in g_tbKimXaCfg[nLevel] do
        tinsert(tSay, format("Ta mu�n nh�n b� %s/#KsgAward:AddKimXa(%d, %d, %d)", szName, nLevel, nUpgradeLevel, nType))
    end
    if bCanClose then
        tinsert("\n��ng/no")
    end
    KsgNpc:SayDialog(tSay)
end

function KsgAward:SetVanSuc(nLevel, nAmount, nStatus)
    nLevel = nLevel or 1
    nAmount = nAmount or 1
    nStatus = nStatus or 4
    if not KsgLib:HasEnoughBagRoom(nAmount) then
        return
    end
    if nLevel < 1 or nLevel > 5 then
        return
    end
    local nStart, nEnd = 31068, 31072
    if nLevel == 2 then
        nStart, nEnd = 31073, 31077
    end
    if nLevel == 3 then
        nStart, nEnd = 31261, 31265
    end
    if nLevel == 4 then
        nStart, nEnd = 31405, 31409
    end
    if nLevel == 5 then
        nStart, nEnd = 31618, 31622
    end
    local tbAward = { }
    for i = nStart, nEnd do
        tinsert(tbAward, {
            { tbProp = { 2, 1, i }, nStack = nAmount, nStatus = nStatus }
        })
    end
    self:Give(tbAward, 'Nh�n V�n S�c Lv' .. nLevel)
end

function KsgAward:ThuongHaiChau(nLevel, nAmount, nStatus)
    nAmount = nAmount or 1
    nStatus = nStatus or 4
    local nPStart = 219
    if nStatus == 4 then
        nPStart = 208
    end
    if not KsgLib:HasEnoughBagRoom(floor(nAmount / 100)) then
        return
    end
    if nLevel < 1 or nLevel > 7 then
        return
    end
    self:Give({ tbProp = { 2, 102, nPStart + nLevel - 1 }, nStack = nAmount, nStatus = nStatus }, 'Nh�n Th��ng H�i Di Ch�u Lv' .. nLevel)

end

function KsgAward:TuiQua(nAmount, nNoLimit)
    do return 0; end --LongDaiKa: ��ng t�nh n�ng t�i qu� v� l�m

    local nVersion, nCurGs = GetRealmType()
    if nCurGs == 1 then
        return
    end
    if KsgLib:GetServerId() >= 100 then
        return
    end
    nAmount = nAmount or 1
    if not KsgLib:HasEnoughBagRoom(1, 0, nil) then
        return
    end
    local nMonth = tonumber(date("%m"))
    if KsgTask:Get(TASKID_TUIQUA_VOLAM_VERSION) ~= nMonth then
        KsgItem:DeleteAll(2, 1, 50016) -- x�a to�n b� t�i qu� v�o cu�i th�ng, tr�nh t�ch tr�
        KsgTask:Set(TASKID_TUIQUA_VOLAM_VERSION, nMonth)
    end

    if nNoLimit then
        local tbAward = {
            { tbProp = { 2, 1, 50016 }, nStack = nAmount },
        }
        return self:Give(tbAward, 'Nh�n T�i Qu� V� L�m')
    end

    local nLimit = TUIQUA_DAILY_MAX
    local nWeek = tonumber(date("%w"))
    if (nWeek == 6 or nWeek == 0) then
        nLimit = nLimit * TUIQUA_WEEKEND_LIMIT_RATE
    end

    if KsgPlayer:IsVipAccount() then
        nLimit = nLimit * TUIQUA_VIP_BONUS_RATE
    end

    local nCurDayCount = KsgTask:Get(TASKID_TUIQUA_VOLAM_NUM)
    if nAmount <= 0 or nCurDayCount > nLimit then
        return
    end
    local tbAward = {
        { tbProp = { 2, 1, 50016 }, nStack = nAmount },
    }
    KsgTask:Modify(TASKID_TUIQUA_VOLAM_NUM, nAmount)
    self:Give(tbAward, 'Nh�n T�i Qu� V� L�m 2')
    KsgPlayer:Msg(format("H�m nay c�n c� th� nh�n %d/%d T�i Qu� V� L�m", nLimit - nCurDayCount - nAmount, nLimit))
end

function KsgAward:DropEventBox(nAmount)
    --do return 0; end --LongDaiKa: ��ng t�nh n�ng event ksg h�ng th�ng

    nAmount = nAmount or 1
    local tbAward = {
        { tbProp = { 2, 1, 50263 }, nStack = nAmount,nStatus = 4 },
    }
    self:Give(tbAward, 'Nh�n H�p Qu� S� Ki�n')
end

function KsgAward:SetChienKhiSatThan(nLevel, nStatus)
    if not KsgLib:HasEnoughBagRoom(10, 1000) then
        return WEnv.RETCODE_NEEDROOM;
    end
    nLevel = nLevel or 0;
    nStatus = nStatus or 4;

    KsgItem:AddSuitByBody(g_tbEquipSet_ChienKhiSatThan.nSuitId, nLevel, "Nh�n b� Chi�n Kh� S�t Th�n", nStatus);
end
