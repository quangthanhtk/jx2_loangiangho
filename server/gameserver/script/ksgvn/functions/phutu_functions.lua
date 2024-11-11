Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\functions\\phutu_head.lua")

function phutu_Main(szTalkHead)
    do return 0; end --LongDaiKa: ��ng t�nh n�ng ph� tu m�n ph�i
    szTalkHead = szTalkHead or g_szTalkHead
    if KsgPlayer:GetBigLevel() < PHUTU_REQUIRE_MIN_LEVEL then
        return KsgNpc:Talk(szTalkHead .. "N�ng l�c c�a ng��i c�n h�n ch�, ch�a th� l�nh ng� v� h�c c�c m�n ph�i kh�c, h�y c� g�ng tu luy�n th�m.")
    end
    local tSay = {
        szTalkHead .. "�� t� b�n ph�i mu�n vang danh thi�n h� �t ph�i tinh th�ng nhi�u lo�i v� ngh�, n�u ng��i �� c� �� n�ng l�c, c� th� ��n ch� ta, ta s� ti�n c� ng��i t�i c�c ��i m�n ph�i kh�c �� ti�p t�c tu luy�n.",
    }
    for nRouteNum, tbCfg in g_tbPhuTuCfg do
        local nRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, tbCfg.nByte)
        if KsgPlayer:GetBigLevel() >= tbCfg.nRequireLevel and nRoute == 0 then
            tinsert(tSay, format("Ta mu�n ph� tu m�n ph�i th� %s /#phutu_JoinFaction(%d)", tbCfg.szName, nRouteNum))
        end
        if KsgPlayer:GetRoute() ~= nRoute and nRoute > 0 then
            tinsert(tSay, format("Thay ��i ��n %s /#phutu_ChangeFactionRoute(%d)", KsgPlayer:GetRouteName(nRoute), nRouteNum))
        end
    end
    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    if nOriginRoute ~= 0 and KsgPlayer:GetRoute() ~= nOriginRoute then
        tinsert(tSay, format("\nThay ��i ��n %s (Ph�i ch� tu)/phutu_ChangeFactionRoute", KsgPlayer:GetRouteName(nOriginRoute)))
    end
    tinsert(tSay, "\nLi�n quan t�i ph� tu/phutu_Intro")
    tinsert(tSay, "\nK�t th�c ��i tho�i/no")
    KsgNpc:SayDialog(tSay)
end

function phutu_Intro()
    local talk1 = g_szTalkHead .. "�� t� b�n ph�i n�u ��t <color=yellow>Chuy�n sinh 8 c�p 90 tr� l�n<color> c� th� ��n t�m Ch��ng M�n �� l�a ch�n m�n ph�i ph� tu."
    talk1 = talk1 .. "<enter><enter>M�i �� t� t�i �a ch� <color=gold>c� th� ph� tu th�m 3 h� ph�i<color>.<enter>- ��t chuy�n sinh 8 c�p 90 c� th� ph� tu ph�i th� nh�t."
    talk1 = talk1 .. "<enter>- ��t chuy�n sinh 9 c�p 90 c� th� ph� tu ph�i th� hai.<enter>- ��t chuy�n sinh 10 c�p 90 tr� l�n c� th� ph� tu th�m h� ph�i th� ba."
    local talk2 = g_szTalkHead .. "C� th� t�m ta ho�c th�ng qua <color=red>Tu Luy�n Ch�u<color> �� ti�n h�nh chuy�n sang h� ph�i ph� tu."
    talk2 = talk2 .. "<enter>M�i l�n ��i sang h� ph�i kh�c <color=red>30 ph�t sau<color> m�i c� th� thao t�c ti�p. Sau khi ��i s� nh�n ���c <color=yellow>Danh ph�n �� t� k� danh<color> v� <color=green>Danh hi�u k� danh t��ng �ng<color>"
    talk2 = talk2 .. "<enter>Khi thao t�c c�n ti�n h�nh <color=red>th�o trang b�, v� kh� v� m�t t�ch<color> �ang trang b� tr�n ng��i.<enter><color=gray>(V� kh� bao g�m c� v� kh� ph�, trang b� g�m: N�n, �o, qu�n v� 2 ng�c b�i)<color>"
    Talk(2, "", talk1, talk2)
end

function phutu_JoinFaction(nRouteNum, nSelectRoute)
    if not g_tbPhuTuCfg[nRouteNum] then
        return KsgNpc:Talk(g_szTalkHead .. "T�nh n�ng n�y t�m th�i ch�a m�")
    end

    local tbCfg = g_tbPhuTuCfg[nRouteNum]
    if nSelectRoute and KsgLib:IsInTable(nSelectRoute, g_tbFactionRoutes) then
        if not phutu_CanJoinRoute(nSelectRoute) then
            return KsgNpc:Talk(g_szTalkHead .. "Kh�ng th� ph� tu m�n ph�i n�y, h�y ch�n m�t m�n ph�i kh�c.")
        end
        local tSay = {
            g_szTalkHead .. format("Ng��i x�c nh�n mu�n ch�n <color=gold>%s<color> l�m m�n ph�i ph� tu <color=red>th� %s<color> ch�?", KsgPlayer:GetRouteName(nSelectRoute), tbCfg.szName),
            format("��ng v�y/#phutu_JoinFaction_Confirm(%d, %d)", nRouteNum, nSelectRoute),
            "\n�� ta suy ngh� k� l�i ��/no"
        }
        return KsgNpc:SayDialog(tSay)
    end

    local nPhuTuRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, tbCfg.nByte)
    if nPhuTuRoute > 0 then
        -- �� ch�n ph� tu r�i
        return KsgNpc:Talk(g_szTalkHead .. format("C�c h� �� ch�n ph�i ph� tu th� %s, kh�ng th� ch�n l�i!", tbCfg.szName))
    end
    local tSay = {
        g_szTalkHead .. "H�y ch�n m�n ph�i ng��i mu�n ��n ph� tu:"
    }
    for _, nFactionRoute in g_tbFactionRoutes do
        if phutu_CanJoinRoute(nFactionRoute) then
            tinsert(tSay, format("Ta mu�n ph� tu %s/#phutu_JoinFaction(%d, %d)", KsgPlayer:GetRouteName(nFactionRoute), nRouteNum, nFactionRoute))
        end
    end
    tinsert(tSay, "\nTa suy ngh� l�i m�t l�t/no")
    KsgNpc:PageSay(tSay, 2, 10)
end

function phutu_JoinFaction_Confirm(nSelectRouteNum, nSelectRoute)
    if not g_tbPhuTuCfg[nSelectRouteNum] then
        return KsgNpc:Talk(g_szTalkHead .. "T�nh n�ng n�y t�m th�i ch�a m�")
    end
    if KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE) == 0 then
        KsgTask:SetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE, KsgPlayer:GetRoute())
    end
    for nRouteNum, tbCfg in g_tbPhuTuCfg do
        if nRouteNum == nSelectRouteNum then
            KsgTask:SetByte(TASKID_PHUTU_ROUTE, tbCfg.nByte, nSelectRoute)
            KsgNpc:Talk(g_szTalkHead .. format("�� ch�n h� ph�i <color=gold>%s<color> l�m m�n ph�i ph� tu <color=green>th� %s<color><enter>C� th� th�ng qua <color=red>Tu Luy�n Ch�u<color> ho�c tr� l�i t�m ta �� ��i sang m�n ph�i m�i", KsgPlayer:GetRouteName(nSelectRoute), tbCfg.szName))
        end
    end
end

function phutu_ChangeFactionRoute(nRouteNum)
    local nLastChange = KsgTask:Get(TASKID_PHUTU_LAST_CHANGE_ROUTE)
    local _, _, nMinDiff = KsgDate:DateDiff(GetTime(), nLastChange + PHUTU_WAIT_TIME)
    if nLastChange + PHUTU_WAIT_TIME > GetTime() then
        return KsgNpc:Talk(g_szTalkHead .. format("Sau <color=yellow>%d ph�t n�a<color> m�i c� th� ti�p t�c ��i ph�i ph� tu ho�c tr� v� m�n ph�i ban ��u. H�y ki�n nh�n ��i m�t l�t!", nMinDiff))
    end
    if nRouteNum then
        if not g_tbPhuTuCfg[nRouteNum] then
            return KsgNpc:Talk(g_szTalkHead .. "T�nh n�ng n�y t�m th�i ch�a m�")
        end
        local tbCfg = g_tbPhuTuCfg[nRouteNum]
        local nRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, tbCfg.nByte)
        local tSay = {
            g_szTalkHead .. format("Ng��i x�c nh�n mu�n tr� th�nh �� t� ph�i <color=gold>%s<color> ch�?", KsgPlayer:GetRouteName(nRoute)),
            format("X�c nh�n/#phutu_ChangeFactionRoute_Confirm(%d)", nRoute),
            "\nKh�ng/no"
        }
        return KsgNpc:SayDialog(tSay)
    end

    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    local tSay = {
        g_szTalkHead .. format("X�c nh�n tr� v� <color=gold>%s<color>?", KsgPlayer:GetRouteName(nOriginRoute)),
        format("X�c nh�n/#phutu_ChangeFactionRoute_Confirm(%d)", nOriginRoute),
        "\nKh�ng/no"
    }
    return KsgNpc:SayDialog(tSay)
end

function phutu_ChangeFactionRoute_Confirm(nRoute)
    if KsgLib:IsInTable(nRoute, g_tbFactionRoutes) then
        if not phutu_CheckItem(nRoute) then
            return
        end
        if GetFightState() == 1 then
            return KsgNpc:Talk(g_szTalkHead .. "Tr�ng th�i chi�n ��u kh�ng th� th�c hi�n thao t�c n�y!")
        end
        local nOldRoute = KsgPlayer:GetRoute()
        if nOldRoute == nRoute then
            return KsgNpc:Talk(g_szTalkHead .. format("Hi�n t�i ��i hi�p �� l� ph�i <color=green>%s<color>, kh�ng c�n ��i.", KsgPlayer:GetRouteName(nRoute)))
        end
        --X�a tr�ng th�i k� n�ng hi�n t�i
        for i = 1, 4096 do
            RemoveState(i);
        end
        phutu_SaveSuperSkill(nOldRoute)
        phutu_RemoveSkills(nOldRoute)
        phutu_ResetAllPoints()
        -- New Route
        SetPlayerRoute(nRoute)
        phutu_FixFactionTask()
        phutu_LearnSkills(nRoute)
        -- ��t chi�u m�t ��nh th�nh skill ��nh qu�i
        SetLRSkill(g_tbFactionRoute_Skill[nRoute].tbMonsters[1], 0)
        SetLRSkill(g_tbFactionRoute_Skill[nRoute].tbMonsters[1], 1)
        -- X�a thi ng� ��c
        RemoveRevivals()
        phutu_AddTitle(nRoute)
        -- L�u th�i gian ��i ph�i g�n nh�t
        KsgTask:Set(TASKID_PHUTU_LAST_CHANGE_ROUTE, GetTime())
        return KsgNpc:Talk(g_szTalkHead .. format("�� chuy�n sang ph�i <color=gold>%s<color>.", KsgPlayer:GetRouteName(nRoute)))
    end
    return KsgNpc:Talk(g_szTalkHead .. "T�nh n�ng n�y t�m th�i ch�a m�")
end

function phutu_CheckMap()
    local nMapID = GetWorldPos()
    if nMapID == 200 then
        return 1
    end

    return nil
end

function phutu_SaveSuperSkill(nRoute)
    local tbSkillCfg = g_tbFactionRoute_Skill[nRoute]
    if not tbSkillCfg then
        return
    end
    local nSuperSkillLevel = GetSkillLevel(tbSkillCfg.nTranPhai)

    KsgTask:SetByte(TASKID_PHUTU_TRANPHAI, phutu_GetByteTranPhaiByRoute(nRoute), nSuperSkillLevel) -- L�u c�p tr�n ph�i hi�n t�i
end

function phutu_FixFactionTask()
    if KsgPlayer:GetFaction() == ROUTE_DUONGMON and GetTask(1005) < 8 then
        -- fix nv so nhap duong mon
        SetTask(1005, 8)
    end
end

function phutu_AddTitle(nRoute)
    local nFaction = KsgPlayer:GetFaction()
    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    if IsTitleExist(PHUTU_TITLE_GROUP, nFaction) ~= 1 and nRoute ~= nOriginRoute then
        AddTitle(PHUTU_TITLE_GROUP, nFaction)
        SetCurTitle(PHUTU_TITLE_GROUP, nFaction)
    end
end

function phutu_ResetAllPoints()
    local nCurStrength = GetStrength()
    local nCurVitality = GetVitality()
    local nCurDexterity = GetDexterity()
    local nCurEnergy = GetEnergy()
    local nCurObserve = GetObserve()

    if ((nCurStrength <= 1) and
            (nCurVitality <= 1) and
            (nCurDexterity <= 1) and
            (nCurEnergy <= 1) and
            (nCurObserve <= 1)) then
        return
    end

    SetStrength(1 - nCurStrength);
    SetVitality(1 - nCurVitality);
    SetDexterity(1 - nCurDexterity);
    SetEnergy(1 - nCurEnergy);
    SetObserve(1 - nCurObserve);
end

function phutu_RemoveSkills(nRoute)
    if not g_tbFactionRoute_Skill[nRoute] then
        return
    end
    local tbSkillCfg = g_tbFactionRoute_Skill[nRoute]
    if 1 == HaveLearnedSkill(tbSkillCfg.nTranPhai) then
        RemoveSkill(tbSkillCfg.nTranPhai);
    end
    for i = tbSkillCfg.nBegin, tbSkillCfg.nEnd do
        -- C�c skill c� b�n
        if 1 == HaveLearnedSkill(i) then
            RemoveSkill(i);
        end
    end
    for _, nSkillId in tbSkillCfg.tbDefault do
        -- Skill ��nh th��ng
        if 1 == HaveLearnedSkill(nSkillId) then
            RemoveSkill(nSkillId);
        end
    end
    for _, nSkillId in tbSkillCfg.tbMonsters do
        -- Skill ��nh qu�i
        if 1 == HaveLearnedSkill(nSkillId) then
            RemoveSkill(nSkillId);
        end
    end
end

function phutu_LearnSkills(nRoute)
    local tbSkillCfg = g_tbFactionRoute_Skill[nRoute]
    if not tbSkillCfg then
        return
    end
    if HaveLearnedSkill(20) == 0 then
        LearnSkill(20) -- Khinh c�ng
    end
    LearnSkill(tbSkillCfg.nTranPhai) -- Tr�n Ph�i
    for i = tbSkillCfg.nBegin, tbSkillCfg.nEnd do
        -- C�c skill c� b�n
        LearnSkill(i)
        while LevelUpSkill(i) == 1 do
            KsgPlayer:Msg("Th�ng c�p k� n�ng th�nh c�ng")
        end
    end
    for _, nSkillId in tbSkillCfg.tbDefault do
        -- Skill ��nh th��ng
        if 1 ~= HaveLearnedSkill(nSkillId) then
            LearnSkill(nSkillId)
        end
    end
    for _, nSkillId in tbSkillCfg.tbMonsters do
        -- Skill ��nh qu�i
        if 1 ~= HaveLearnedSkill(nSkillId) then
            LearnSkill(nSkillId)
        end
    end
    local nByteTranPhai = phutu_GetByteTranPhaiByRoute(nRoute)
    local nSaveTranPhaiLevel = KsgTask:GetByte(TASKID_PHUTU_TRANPHAI, nByteTranPhai)
    if nSaveTranPhaiLevel > 0 then
        for _ = 1, nSaveTranPhaiLevel - 1 do
            LevelUpSkill(tbSkillCfg.nTranPhai)
        end
    end
end

function phutu_GetByteTranPhaiByRoute(nCheckRoute)
    for _, tbCfg in g_tbPhuTuCfg do
        local nRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, tbCfg.nByte)
        if nCheckRoute == nRoute then
            return tbCfg.nByteTranPhai
        end
    end
    return TASKID_PHUTU_BYTE_ORIGIN_ROUTE
end

function phutu_CheckItem(nRoute)
    local tbPunish = {
        [EQUIP_POS_CAP] = 'N�n',
        [EQUIP_POS_BODY] = '�o',
        [EQUIP_POS_PANTS] = 'Qu�n',
        [EQUIP_POS_RING1] = 'Nh�n tr�n',
        [EQUIP_POS_RING2] = 'Nh�n d��i',
        [EQUIP_POS_BOOK] = 'M�t t�ch',
        [EQUIP_POS_EXTEND_BOOK] = 'M�t t�ch ph�',
        [EQUIP_POS_WEAPON] = 'V� kh�',
        [EQUIP_POS_EXTEND_WEAPON] = 'V� kh� ph�',
    }
    local nPass = 1
    local szItem = ''
    for nEquipPos, szName in tbPunish do
        local nEquipIdx = GetPlayerEquipIndex(nEquipPos)
        if nEquipIdx ~= 0 then
            if nEquipPos == EQUIP_POS_WEAPON then
                KsgNpc:Talk(g_szTalkHead .. format("��i h� ph�i c�n ph�i th�o <color=red>V� kh�<color> xu�ng tr��c."))
                return nil
            end
            local nEquipRoute = GetEquipRoute(nEquipIdx)
            if nEquipRoute ~= 0 and nEquipRoute ~= nRoute then
                szItem = szItem .. szName .. ", "
                nPass = nil
            end
        end
    end
    if not nPass then
        local szTalk = g_szTalkHead .. format("<color=red>%s<color>m� ��i hi�p �ang m�c kh�ng th�ch h�p v�i h� ph�i <color=yellow>%s<color>, xin h�y th�o trang b� n�y xu�ng.", szItem, KsgPlayer:GetRouteName(nRoute))
        KsgNpc:Talk(szTalk)
    end
    return nPass
end

function phutu_CanJoinRoute(nFactionRoute)
    local nCurrentRoute = KsgPlayer:GetRoute()
    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    local tbRoutes = {}
    tbRoutes[nCurrentRoute] = 1
    tbRoutes[nOriginRoute] = 1
    for _, tbCfg in g_tbPhuTuCfg do
        local nRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, tbCfg.nByte)
        tbRoutes[nRoute] = 1
    end
    if g_tbFactionRoute_Gender[nFactionRoute] ~= 0 then
        if g_tbFactionRoute_Gender[nFactionRoute] ~= GetSex() then
            return nil
        end
    end

    return tbRoutes[nFactionRoute] == nil
end