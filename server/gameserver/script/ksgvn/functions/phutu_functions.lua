Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\functions\\phutu_head.lua")

function phutu_Main(szTalkHead)
    do return 0; end --LongDaiKa: ®ãng tÝnh n¨ng phô tu m«n ph¸i
    szTalkHead = szTalkHead or g_szTalkHead
    if KsgPlayer:GetBigLevel() < PHUTU_REQUIRE_MIN_LEVEL then
        return KsgNpc:Talk(szTalkHead .. "N¨ng lùc cña ng­¬i cßn h¹n chÕ, ch­a thÓ lÜnh ngé vâ häc c¸c m«n ph¸i kh¸c, h·y cè g¾ng tu luyÖn thªm.")
    end
    local tSay = {
        szTalkHead .. "§Ö tö bæn ph¸i muèn vang danh thiªn h¹ ¾t ph¶i tinh th«ng nhiÒu lo¹i vâ nghÖ, nÕu ng­¬i ®· cã ®ñ n¨ng lùc, cã thÓ ®Õn chç ta, ta sÏ tiÕn cö ng­¬i tíi c¸c ®¹i m«n ph¸i kh¸c ®Ó tiÕp tôc tu luyÖn.",
    }
    for nRouteNum, tbCfg in g_tbPhuTuCfg do
        local nRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, tbCfg.nByte)
        if KsgPlayer:GetBigLevel() >= tbCfg.nRequireLevel and nRoute == 0 then
            tinsert(tSay, format("Ta muèn phô tu m«n ph¸i thø %s /#phutu_JoinFaction(%d)", tbCfg.szName, nRouteNum))
        end
        if KsgPlayer:GetRoute() ~= nRoute and nRoute > 0 then
            tinsert(tSay, format("Thay ®æi ®Õn %s /#phutu_ChangeFactionRoute(%d)", KsgPlayer:GetRouteName(nRoute), nRouteNum))
        end
    end
    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    if nOriginRoute ~= 0 and KsgPlayer:GetRoute() ~= nOriginRoute then
        tinsert(tSay, format("\nThay ®æi ®Õn %s (Ph¸i chñ tu)/phutu_ChangeFactionRoute", KsgPlayer:GetRouteName(nOriginRoute)))
    end
    tinsert(tSay, "\nLiªn quan tíi phô tu/phutu_Intro")
    tinsert(tSay, "\nKÕt thóc ®èi tho¹i/no")
    KsgNpc:SayDialog(tSay)
end

function phutu_Intro()
    local talk1 = g_szTalkHead .. "§Ö tö bæn ph¸i nÕu ®¹t <color=yellow>ChuyÓn sinh 8 cÊp 90 trë lªn<color> cã thÓ ®Õn t×m Ch­ëng M«n ®Ó lùa chän m«n ph¸i phô tu."
    talk1 = talk1 .. "<enter><enter>Mçi ®Ö tö tèi ®a chØ <color=gold>cã thÓ phô tu thªm 3 hÖ ph¸i<color>.<enter>- §¹t chuyÓn sinh 8 cÊp 90 cã thÓ phô tu ph¸i thø nhÊt."
    talk1 = talk1 .. "<enter>- §¹t chuyÓn sinh 9 cÊp 90 cã thÓ phô tu ph¸i thø hai.<enter>- §¹t chuyÓn sinh 10 cÊp 90 trë lªn cã thÓ phô tu thªm hÖ ph¸i thø ba."
    local talk2 = g_szTalkHead .. "Cã thÓ t×m ta hoÆc th«ng qua <color=red>Tu LuyÖn Ch©u<color> ®Ó tiÕn hµnh chuyÓn sang hÖ ph¸i phô tu."
    talk2 = talk2 .. "<enter>Mçi lÇn ®æi sang hÖ ph¸i kh¸c <color=red>30 phót sau<color> míi cã thÓ thao t¸c tiÕp. Sau khi ®æi sÏ nhËn ®­îc <color=yellow>Danh phËn ®Ö tö ký danh<color> vµ <color=green>Danh hiÖu ký danh t­¬ng øng<color>"
    talk2 = talk2 .. "<enter>Khi thao t¸c cÇn tiÕn hµnh <color=red>th¸o trang bÞ, vò khÝ vµ mËt tÞch<color> ®ang trang bÞ trªn ng­êi.<enter><color=gray>(Vò khÝ bao gåm c¶ vò khÝ phô, trang bÞ gåm: Nãn, ¸o, quÇn vµ 2 ngäc béi)<color>"
    Talk(2, "", talk1, talk2)
end

function phutu_JoinFaction(nRouteNum, nSelectRoute)
    if not g_tbPhuTuCfg[nRouteNum] then
        return KsgNpc:Talk(g_szTalkHead .. "TÝnh n¨ng nµy t¹m thêi ch­a më")
    end

    local tbCfg = g_tbPhuTuCfg[nRouteNum]
    if nSelectRoute and KsgLib:IsInTable(nSelectRoute, g_tbFactionRoutes) then
        if not phutu_CanJoinRoute(nSelectRoute) then
            return KsgNpc:Talk(g_szTalkHead .. "Kh«ng thÓ phô tu m«n ph¸i nµy, h·y chän mét m«n ph¸i kh¸c.")
        end
        local tSay = {
            g_szTalkHead .. format("Ng­¬i x¸c nhËn muèn chän <color=gold>%s<color> lµm m«n ph¸i phô tu <color=red>thø %s<color> chø?", KsgPlayer:GetRouteName(nSelectRoute), tbCfg.szName),
            format("§óng vËy/#phutu_JoinFaction_Confirm(%d, %d)", nRouteNum, nSelectRoute),
            "\n§Ó ta suy nghÜ kü l¹i ®·/no"
        }
        return KsgNpc:SayDialog(tSay)
    end

    local nPhuTuRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, tbCfg.nByte)
    if nPhuTuRoute > 0 then
        -- §· chän phô tu råi
        return KsgNpc:Talk(g_szTalkHead .. format("C¸c h¹ ®· chän ph¸i phô tu thø %s, kh«ng thÓ chän l¹i!", tbCfg.szName))
    end
    local tSay = {
        g_szTalkHead .. "H·y chän m«n ph¸i ng­¬i muèn ®Õn phô tu:"
    }
    for _, nFactionRoute in g_tbFactionRoutes do
        if phutu_CanJoinRoute(nFactionRoute) then
            tinsert(tSay, format("Ta muèn phô tu %s/#phutu_JoinFaction(%d, %d)", KsgPlayer:GetRouteName(nFactionRoute), nRouteNum, nFactionRoute))
        end
    end
    tinsert(tSay, "\nTa suy nghÜ l¹i mét l¸t/no")
    KsgNpc:PageSay(tSay, 2, 10)
end

function phutu_JoinFaction_Confirm(nSelectRouteNum, nSelectRoute)
    if not g_tbPhuTuCfg[nSelectRouteNum] then
        return KsgNpc:Talk(g_szTalkHead .. "TÝnh n¨ng nµy t¹m thêi ch­a më")
    end
    if KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE) == 0 then
        KsgTask:SetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE, KsgPlayer:GetRoute())
    end
    for nRouteNum, tbCfg in g_tbPhuTuCfg do
        if nRouteNum == nSelectRouteNum then
            KsgTask:SetByte(TASKID_PHUTU_ROUTE, tbCfg.nByte, nSelectRoute)
            KsgNpc:Talk(g_szTalkHead .. format("§· chän hÖ ph¸i <color=gold>%s<color> lµm m«n ph¸i phô tu <color=green>thø %s<color><enter>Cã thÓ th«ng qua <color=red>Tu LuyÖn Ch©u<color> hoÆc trë l¹i t×m ta ®Ó ®æi sang m«n ph¸i míi", KsgPlayer:GetRouteName(nSelectRoute), tbCfg.szName))
        end
    end
end

function phutu_ChangeFactionRoute(nRouteNum)
    local nLastChange = KsgTask:Get(TASKID_PHUTU_LAST_CHANGE_ROUTE)
    local _, _, nMinDiff = KsgDate:DateDiff(GetTime(), nLastChange + PHUTU_WAIT_TIME)
    if nLastChange + PHUTU_WAIT_TIME > GetTime() then
        return KsgNpc:Talk(g_szTalkHead .. format("Sau <color=yellow>%d phót n÷a<color> míi cã thÓ tiÕp tôc ®æi ph¸i phô tu hoÆc trë vÒ m«n ph¸i ban ®Çu. H·y kiªn nhÉn ®îi mét l¸t!", nMinDiff))
    end
    if nRouteNum then
        if not g_tbPhuTuCfg[nRouteNum] then
            return KsgNpc:Talk(g_szTalkHead .. "TÝnh n¨ng nµy t¹m thêi ch­a më")
        end
        local tbCfg = g_tbPhuTuCfg[nRouteNum]
        local nRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, tbCfg.nByte)
        local tSay = {
            g_szTalkHead .. format("Ng­¬i x¸c nhËn muèn trë thµnh ®Ö tö ph¸i <color=gold>%s<color> chø?", KsgPlayer:GetRouteName(nRoute)),
            format("X¸c nhËn/#phutu_ChangeFactionRoute_Confirm(%d)", nRoute),
            "\nKh«ng/no"
        }
        return KsgNpc:SayDialog(tSay)
    end

    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    local tSay = {
        g_szTalkHead .. format("X¸c nhËn trë vÒ <color=gold>%s<color>?", KsgPlayer:GetRouteName(nOriginRoute)),
        format("X¸c nhËn/#phutu_ChangeFactionRoute_Confirm(%d)", nOriginRoute),
        "\nKh«ng/no"
    }
    return KsgNpc:SayDialog(tSay)
end

function phutu_ChangeFactionRoute_Confirm(nRoute)
    if KsgLib:IsInTable(nRoute, g_tbFactionRoutes) then
        if not phutu_CheckItem(nRoute) then
            return
        end
        if GetFightState() == 1 then
            return KsgNpc:Talk(g_szTalkHead .. "Tr¹ng th¸i chiÕn ®Êu kh«ng thÓ thùc hiÖn thao t¸c nµy!")
        end
        local nOldRoute = KsgPlayer:GetRoute()
        if nOldRoute == nRoute then
            return KsgNpc:Talk(g_szTalkHead .. format("HiÖn t¹i ®¹i hiÖp ®· lµ ph¸i <color=green>%s<color>, kh«ng cÇn ®æi.", KsgPlayer:GetRouteName(nRoute)))
        end
        --Xãa tr¹ng th¸i kü n¨ng hiÖn t¹i
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
        -- §Æt chiªu mÆt ®Þnh thµnh skill ®¸nh qu¸i
        SetLRSkill(g_tbFactionRoute_Skill[nRoute].tbMonsters[1], 0)
        SetLRSkill(g_tbFactionRoute_Skill[nRoute].tbMonsters[1], 1)
        -- Xãa thi ngò ®éc
        RemoveRevivals()
        phutu_AddTitle(nRoute)
        -- L­u thêi gian ®æi ph¸i gÇn nhÊt
        KsgTask:Set(TASKID_PHUTU_LAST_CHANGE_ROUTE, GetTime())
        return KsgNpc:Talk(g_szTalkHead .. format("§· chuyÓn sang ph¸i <color=gold>%s<color>.", KsgPlayer:GetRouteName(nRoute)))
    end
    return KsgNpc:Talk(g_szTalkHead .. "TÝnh n¨ng nµy t¹m thêi ch­a më")
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

    KsgTask:SetByte(TASKID_PHUTU_TRANPHAI, phutu_GetByteTranPhaiByRoute(nRoute), nSuperSkillLevel) -- L­u cÊp trÊn ph¸i hiÖn t¹i
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
        -- C¸c skill c¬ b¶n
        if 1 == HaveLearnedSkill(i) then
            RemoveSkill(i);
        end
    end
    for _, nSkillId in tbSkillCfg.tbDefault do
        -- Skill ®¸nh th­êng
        if 1 == HaveLearnedSkill(nSkillId) then
            RemoveSkill(nSkillId);
        end
    end
    for _, nSkillId in tbSkillCfg.tbMonsters do
        -- Skill ®¸nh qu¸i
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
        LearnSkill(20) -- Khinh c«ng
    end
    LearnSkill(tbSkillCfg.nTranPhai) -- TrÊn Ph¸i
    for i = tbSkillCfg.nBegin, tbSkillCfg.nEnd do
        -- C¸c skill c¬ b¶n
        LearnSkill(i)
        while LevelUpSkill(i) == 1 do
            KsgPlayer:Msg("Th¨ng cÊp kü n¨ng thµnh c«ng")
        end
    end
    for _, nSkillId in tbSkillCfg.tbDefault do
        -- Skill ®¸nh th­êng
        if 1 ~= HaveLearnedSkill(nSkillId) then
            LearnSkill(nSkillId)
        end
    end
    for _, nSkillId in tbSkillCfg.tbMonsters do
        -- Skill ®¸nh qu¸i
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
        [EQUIP_POS_CAP] = 'Nãn',
        [EQUIP_POS_BODY] = '¸o',
        [EQUIP_POS_PANTS] = 'QuÇn',
        [EQUIP_POS_RING1] = 'NhÉn trªn',
        [EQUIP_POS_RING2] = 'NhÉn d­íi',
        [EQUIP_POS_BOOK] = 'MËt tÞch',
        [EQUIP_POS_EXTEND_BOOK] = 'MËt tÞch phô',
        [EQUIP_POS_WEAPON] = 'Vò khÝ',
        [EQUIP_POS_EXTEND_WEAPON] = 'Vò khÝ phô',
    }
    local nPass = 1
    local szItem = ''
    for nEquipPos, szName in tbPunish do
        local nEquipIdx = GetPlayerEquipIndex(nEquipPos)
        if nEquipIdx ~= 0 then
            if nEquipPos == EQUIP_POS_WEAPON then
                KsgNpc:Talk(g_szTalkHead .. format("§æi hÖ ph¸i cÇn ph¶i th¸o <color=red>Vò khÝ<color> xuèng tr­íc."))
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
        local szTalk = g_szTalkHead .. format("<color=red>%s<color>mµ ®¹i hiÖp ®ang mÆc kh«ng thÝch hîp víi hÖ ph¸i <color=yellow>%s<color>, xin h·y th¸o trang bÞ nµy xuèng.", szItem, KsgPlayer:GetRouteName(nRoute))
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