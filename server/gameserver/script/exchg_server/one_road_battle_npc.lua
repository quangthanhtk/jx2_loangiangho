Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")
Include("\\script\\exchg_server\\exchange_server_npc.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
Include("\\script\\missions\\one_road_battle\\mission.lua")
Include("\\settings\\static_script\\exchg_server\\exchange_paycoin_head.lua")

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua"); --LongDaiKa: thªm vµo ®Ó dïng g_WCFG
----------------------------------------------------------------------------------------------------

orb_perpare_map = {
    {8908, 1483, 2999},
    {8909, 1483, 2999},
    {8910, 1483, 2999},
}

orb_battle_map = {}

function orb_teamCheck(bAfterStart)
    local check = {}
    local nTeamSize = GetTeamSize()
    if nTeamSize > ORB_MAX_TEAM_MEMBER then
        Talk(1,"", format("§éi ngò tæ ®éi tham gia b¸o danh kh«ng ®­îc v­ît qu¸ %d ng­êi",ORB_MAX_TEAM_MEMBER) )
        return
    end  

    local oldPlayerIndex = PlayerIndex
    local errStr = format("<color=green>%s<color>: §éi cã hiÖp sÜ kh«ng phï hîp ®iÒu kiÖn tham gia!\n\n",GetTargetNpcName())
    local res = 1
    for i = 1, nTeamSize do
        PlayerIndex     = GetTeamMember(i)
        local nLv       = GetLevel();
        local nTrans    = gf_GetTransCount();
        local level     = nTrans*100 + nLv;
        local jungong   = abs(GetTask(701))
        local szName    = GetName()
        local nCash     = GetCash()

        if orb_GetTimeIdentity() == GetTask(TASKID_ORB_TIMEIDENTITY) then  -- Ö®Ç°ÒÑ¾­½øÈë¹ý±¾³¡Õ½³¡ÁË
            tinsert(check, format("%s ®· b¸o danh chiÕn tr­êng nµy råi\n",szName))
        end

        if level < ORB_NEED_LEVEL_TEAM then
            tinsert(check, format("%s ch­a ®¹t chuyÓn sinh 7 cÊp 90\n",szName))
        end
        if jungong < ORB_NEED_JUNGONG then
            tinsert(check, format("%s c«ng tr¹ng ch­a ®ñ 100000\n",szName))
        end
        if bAfterStart == 1 then -- ²¹±¨Ãû
            if nCash < ORB_JOIN_AFTER_START_COST then
                tinsert(check, format("Trªn ng­êi %s kh«ng ®ñ 50 Vµng\n",szName))
            end
        end
    end
    if getn(check) > 0 then
        res = 0
        for i = 1, getn(check) do
            errStr = errStr..check[i]
        end
        for i = 1, nTeamSize do
            PlayerIndex = GetTeamMember(i)
            Talk(1,"",errStr)
        end
    end
    PlayerIndex = oldPlayerIndex
    return res
end

function orb_singleCheck(bAfterStart)
    local check     = {}
    local nLv       = GetLevel();
    local nTrans    = gf_GetTransCount();
    local level     = nTrans*100 + nLv;
    local jungong   = abs(GetTask(701))
    local szName    = GetName()
    local nCash     = GetCash()
    local res       = 1
    local errStr    = format("<color=green>%s<color>: Kh«ng phï hîp ®iÒu kiÖn tham gia!\n\n",GetTargetNpcName())
    if level < ORB_NEED_LEVEL then
        tinsert(check, "Ch­a ®¹t chuyÓn sinh 8 cÊp 90\n")
    end
    if jungong < ORB_NEED_JUNGONG then
        tinsert(check, "C«ng tr¹ng ch­a ®ñ 100000\n")
    end
    if bAfterStart == 1 then -- ²¹±¨Ãû
        if nCash < ORB_JOIN_AFTER_START_COST then
            tinsert(check, "Trªn ng­êi kh«ng ®ñ 50 Vµng\n")
        end
    end
    if getn(check) > 0 then
        res = 0
        for i = 1, getn(check) do
            errStr = errStr..check[i]
        end
        Talk(1,"",errStr)
    end
    return res
end


function orb_TimeCheck()
    local nNow = tonumber(date("%H%M"))
    local state = 0 -- 1:¿É±¨Ãû 2:¿É²¹±¨Ãû»òÖØÐÂ½øÈë 0:³¬Ê±
    for i = 1, getn(t_orb_battle_time) do
        local time = t_orb_battle_time[i]
        if nNow >= time.signUp and nNow < time.start then
            state = 1
            break
        end
        if nNow >= time.start and nNow <= time.joinEnd then
            state = 2
            break
        end
    end
    return state
end


function orb_totalCheck()
    local res = 1
    local teamSize = GetTeamSize()
    if orb_TimeCheck() ~= 1 then res = 0 end
    if teamSize > 0 then
        if orb_teamCheck() ~= 1 then res = 0 end
    else
        if orb_singleCheck() ~= 1 then res = 0 end
    end
    return res
end

function orb_SignUp() -- ±¨Ãû
    if orb_totalCheck() == 0 then return end
    local targetMap = 0
    for i = 1, getn(orb_perpare_map) do
        local MapIdx = SubWorldID2Idx(orb_perpare_map[i][1])
        if MapIdx == -1 then return end
        local _, PlayerNumber = GetMapNpcCountByIdx(MapIdx)
        if PlayerNumber < ORB_MAX_SIGNUP_NUM then
            targetMap = i
            break
        end
    end
    if targetMap == 0 then
        Talk(1,"",format("<color=green>%s<color>: T©y Thôc §¹o ®· ®Çy, ®¹i hiÖp h·y quay l¹i sau.",GetTargetNpcName()))
        return
    end

    local nOffsetX = random(0,30) - 15
    local nOffsetY = random(0,30) - 15

    if GetTeamSize() > 0 then
        local oldPlayerIndex = PlayerIndex
        for i = 1, GetTeamSize() do
            PlayerIndex = GetTeamMember(i)
            NewWorld(
                orb_perpare_map[targetMap][1],
                orb_perpare_map[targetMap][2] + nOffsetX,
                orb_perpare_map[targetMap][3] + nOffsetY
            )
            SetCreateTeam(1); --½ûÖ¹×é¶Ó²Ù×÷
        end
        PlayerIndex = oldPlayerIndex
    else
        NewWorld(
            orb_perpare_map[targetMap][1],
            orb_perpare_map[targetMap][2] + nOffsetX,
            orb_perpare_map[targetMap][3] + nOffsetY
        )
        SetCreateTeam(1); --½ûÖ¹×é¶Ó²Ù×÷
    end
end

function orb_GetBattleGroup(tMapPlayer)
    local tBattleGroup = {} -- { {player = {}, power = 0}, }
    local oldPlayerIndex = PlayerIndex
    for i = 1, getn(tMapPlayer) do
        local continue = 0
        PlayerIndex = tMapPlayer[i]
        local tObj = {player = {}, power = 0}
        local teamSize = GetTeamSize()
        SetTask(TASKID_ORB_TIMEIDENTITY, orb_GetTimeIdentity())
        if teamSize == 0 then      -- µ¥ÈË²ÎÓë
            tinsert(tObj.player, PlayerIndex)
            tObj.power = abs(GetTask(701))
        else                            -- ¶àÈË²ÎÓë
            if PlayerIndex == GetTeamMember(1) then -- ¶Ó³¤
                local tmpPlayerIdx = PlayerIndex
                for j = 1, teamSize do
                    PlayerIndex = GetTeamMember(j)
                    tinsert(tObj.player, PlayerIndex)
                    tObj.power = tObj.power + abs(GetTask(701))
                end
                PlayerIndex = tmpPlayerIdx
            else
                continue = 1
            end
        end
        if continue == 0 then tinsert(tBattleGroup, tObj) end
    end

    local fCompare = function(tObj1, tObj2)
            local var1 = tObj1.power / getn(tObj1.player)
            local var2 = tObj2.power / getn(tObj2.player)
            if var1 > var2 then
                return 1
            else
                return nil
            end
    end
    sort(tBattleGroup, fCompare)
    PlayerIndex = oldPlayerIndex
    return tBattleGroup
end

function orb_StartBattle(nHalfNumber,tGroup)
    local mapID = createMission()
    if mapID <= 0 then return end
    tinsert(orb_battle_map, mapID)
    local tCampNum = {0,0}
    local tCampPower = {0,0}
    --- ÎªÁË·ÀÖ¹Ã¿´ÎµÚÒ»Ãû¶¼±»·ÖÔÚÒ»¸öÕóÓª£¬µÚÒ»Ãû½øÐÐËæ»ú´¦Àí ---
    local championCamp = random(1,2)
    tCampNum[championCamp] = getn(tGroup[1].player)
    tCampPower[championCamp] = tGroup[1].power
    local oldPlayerIndex = PlayerIndex
    PlayerIndex = tGroup[1].player[1]
    this:TeamEnter(mapID, championCamp)
    ---------------------------------------------------------
    for i = 2, getn(tGroup) do
        local weekCamp, strongCamp= 1, 2
        PlayerIndex = tGroup[i].player[1]
        if tCampPower[1] > tCampPower[2] then
            weekCamp, strongCamp = 2, 1
        end
        if tCampNum[weekCamp] >= nHalfNumber then  --Èõ¶ÓÒÑ¾­ÂúÈËÁË,Ê£ÏÂµÄÈËÖ»ÄÜ¼ÓÈëÇ¿¶Ó
            tCampNum[strongCamp] = tCampNum[strongCamp] + getn(tGroup[i].player)
            tCampPower[strongCamp] = tCampPower[strongCamp] + tGroup[i].power
            this:TeamEnter(mapID, strongCamp)
        else                                        -- Èõ¶ÓÎ´ÂúÈË£¬ÓÅÏÈ¼ÓÈëÈõ¶Ó
            tCampNum[weekCamp] = tCampNum[weekCamp] + getn(tGroup[i].player)
            tCampPower[weekCamp] = tCampPower[weekCamp] + tGroup[i].power
            this:TeamEnter(mapID, weekCamp)
        end
    end
    PlayerIndex = oldPlayerIndex
end

function orb_Back2PlayerGround()
	local nPosidx = random(1, getn(t_ggs_svr_exit_pos))
	local tPos = t_ggs_svr_exit_pos[nPosidx]
	local x,y = tPos[2], tPos[3]
	local x2, y2 = x + random(-3, 3), y + random(-3, 3);
	NewWorld(tPos[1], x2, y2)
end

function orb_TryBattleStart()
    orb_battle_map = {}
    for i = 1, getn(orb_perpare_map) do
        if SubWorldID2Idx(orb_perpare_map[i][1]) > 0 then  -- ¸Ã·þÎñÆ÷ÓÐ´ËµØÍ¼
            local tMapPlayer = GetMapPlayer(orb_perpare_map[i][1])
            local tGroup = {}
            if getn(tMapPlayer) < ORB_MAX_SIGNUP_MIN_NUM then -- ÈËÊý²»×ã
                local oldPlayerIndex = PlayerIndex
                for j = 1, getn(tMapPlayer) do
                    PlayerIndex = tMapPlayer[j]
                    Msg2Player("S©n chuÈn bÞ kh«ng ®ñ ng­êi ®Ó b¾t ®Çu thi ®Êu, cã thÓ thö ®Õn chç [HiÖp Lé T­¬ng Phïng Tham T­íng] gia nhËp chiÕn tr­êng HiÖp Lé T­¬ng Phïng ®· më.")
                    orb_Back2PlayerGround()                    
                end
                PlayerIndex = oldPlayerIndex
            else
                tGroup = orb_GetBattleGroup(tMapPlayer)
                local halfNumber = floor((getn(tMapPlayer)+1)/2)
                orb_StartBattle(halfNumber, tGroup)
                Orb_AddRuntimeStat(RUNTIMEID_BattleStart, 0, 1)
    ----------------------------------DEBUG----------------------------------
                -- for j = 1, getn(tGroup) do
                --     local group = tGroup[j]
                --     local nameList = ""
                --     local tmpPlayerIdx = PlayerIndex
                --     for k = 1, getn(group.player) do
                --         PlayerIndex = group.player[k]
                --         nameList = nameList.." "..GetName()
                --     end
                --     print(format("[DEBUG][battle %d][Group %d][power %d] %s",i,j,group.power, nameList))
                --     PlayerIndex = tmpPlayerIdx
                -- end
    ----------------------------------DEBUG----------------------------------
            end
        end
    end
end

function debugItem()
    AddItem(2,0,505,1)
end

function orb_CloseAll()
    for i = 1, getn(orb_battle_map) do
        if orb_battle_map[i] > 0 then
            this:setMap(orb_battle_map[i])
            this.msCamp:removeAllPlayer(Mission_OneRoadBattle.missionID, 1)
            this.msCamp:removeAllPlayer(Mission_OneRoadBattle.missionID, 2)
            this:Close()
            this:resetMap()
        end
    end
end


t_orb_battle_time = {
    -- {
    --     signUp  = 1100,
    --     start   = 1115,
    --     joinEnd = 1145,
    -- },
    {
        signUp  = 2200,
        start   = 2215,
        joinEnd = 2245,
    },
}

function orb_ImBack()
    local check         = 0
    local curBattleMap  = GetTask(TASKID_ORB_MAPID)
    local nCamp         = GetTask(TASKID_DLGC_CAMP)
    local nState        = orb_TimeCheck()

    if GetTeamSize() > 0 then                           -- ÖØ»ØÕ½³¡¾Í²»ÄÜ×é¶ÓÁË£¬×Ô¼º»Ø°É
        Talk(1,"",format("<color=green>%s<color>: ChØ cã thÓ trë vÒ chiÕn tr­êng mét m×nh, h·y tho¸t ®éi tr­íc.",GetTargetNpcName()))
        return
    end

    if nState ~= 2 then 
        Talk(1,"",format("<color=green>%s<color>: Kû luËt nhµ binh nghiªm ngÆt, ®©u thÓ ®Ó ng­¬i nãi ®Õn lµ ®Õn. §¹i qu©n sím ®· giao chiÕn, b©y giê ®Õn qu¸ trÔ råi.",GetTargetNpcName()))
        return
    end

    for i = 1, getn(orb_battle_map) do                  -- ÔÙ¼ì²éÒ»ÏÂ¼ÇÂ¼µÄÕ½³¡µØÍ¼ID¶Ô²»¶Ô
        if orb_battle_map[i] == curBattleMap then
            check = 1
            break
        end
    end

    if check == 0 then
        Talk(1,"",format("<color=green>%s<color>: ChiÕn tr­êng tham gia tr­íc ®ã ®· kÕt thóc.",GetTargetNpcName()))
        SetTask(TASKID_ORB_TIMEIDENTITY, 0)
        return
    end

    this:setMap(curBattleMap)
    local curPlayerNum = this.msCamp:getCount(this.missionID, nCamp)
    this:resetMap()
    if curPlayerNum > ORB_MAX_HALF_BATTLE_NUM then
        Talk(1,"",format("<color=green>%s<color>: T©y Thôc §¹o ®· ®Çy, ®¹i hiÖp h·y quay l¹i sau.",GetTargetNpcName()))
        return
    end

    this:TeamEnter(curBattleMap, nCamp)
end

function orb_OldDriverWaitMeConfirm(nMapId)
    local nState = orb_TimeCheck()
    local nTeamSize = GetTeamSize() 
    if nState ~= 2 then 
        Talk(1,"",format("<color=green>%s<color>: Kû luËt nhµ binh nghiªm ngÆt, ®©u thÓ ®Ó ng­¬i nãi ®Õn lµ ®Õn. §¹i qu©n sím ®· giao chiÕn, b©y giê ®Õn qu¸ trÔ råi.",GetTargetNpcName()))
        return
    end
    if nTeamSize > 0 then
        if GetTeamMember(1) ~= PlayerIndex then
            Talk(1,"",format("<color=green>%s<color>: B¶o thñ lÜnh ®éi c¸c ng­¬i nãi chuyÖn víi ta.",GetTargetNpcName()))
            return
        end
        if orb_teamCheck(1) ~= 1 then
            return
        end
        local oldPlayerIndex = PlayerIndex
        for i = 1, nTeamSize do
            PlayerIndex = GetTeamMember(i)
            Pay(ORB_JOIN_AFTER_START_COST)
            SetTask(PC_COIN_TASK, GetTask(PC_COIN_TASK) + ORB_JOIN_AFTER_START_COST, TASK_ACCESS_CODE_KUAFU_DRAG)
        end
        Orb_AddRuntimeStat(RUNTIMEID_OldDriverWaitMe, 0, nTeamSize)
        PlayerIndex = oldPlayerIndex
    else
        if orb_singleCheck(1) ~= 1 then
            return
        end
        Pay(ORB_JOIN_AFTER_START_COST)
        SetTask(PC_COIN_TASK, GetTask(PC_COIN_TASK) + ORB_JOIN_AFTER_START_COST, TASK_ACCESS_CODE_KUAFU_DRAG)
        Orb_AddRuntimeStat(RUNTIMEID_OldDriverWaitMe, 0, 1)
    end
    local nCamp = 1
    this:setMap(nMapId)
    local curPlayerNum1 = this.msCamp:getCount(this.missionID, 1)
    local curPlayerNum2 = this.msCamp:getCount(this.missionID, 2)
    this:resetMap()
    if curPlayerNum1 > curPlayerNum2 then
        nCamp = 2
    end
    this:TeamEnter(nMapId, nCamp)
end

function orb_OldDriverWaitMe()
    local nState = orb_TimeCheck()
    local szName = GetTargetNpcName()
    local maxPlayerMap, maxPlayerNum = 0, 0
    if nState ~= 2 then 
        Talk(1,"",format("<color=green>%s<color>: Kû luËt nhµ binh nghiªm ngÆt, ®©u thÓ ®Ó ng­¬i nãi ®Õn lµ ®Õn. §¹i qu©n sím ®· giao chiÕn, b©y giê ®Õn qu¸ trÔ råi.",GetTargetNpcName()))
        return
    end
    if getn(orb_battle_map) == 0 then
        Talk(1,"",format("<color=green>%s<color>: HiÖn kh«ng cã chiÕn sù, ®¹i hiÖp h·y quay vÒ.",GetTargetNpcName()))
        return
    end
    for i = 1, getn(orb_battle_map) do
        local mapId = orb_battle_map[i]
        this:setMap(mapId)
        local curPlayerNum1 = this.msCamp:getCount(this.missionID, 1)
        local curPlayerNum2 = this.msCamp:getCount(this.missionID, 2)
        local curPlayerNum = curPlayerNum1 + curPlayerNum2
        this:resetMap()
        if curPlayerNum < ORB_MAX_BATTLE_NUM then
            if curPlayerNum > maxPlayerNum then
                maxPlayerNum = curPlayerNum
                maxPlayerMap = mapId
            end
        end
    end
    if maxPlayerMap == 0 then
        Talk(1,"",format("<color=green>%s<color>: T©y Thôc §¹o ®· ®Çy, c¸c ng­êi h·y quay l¹i sau.",GetTargetNpcName()))
        return
    end
    local tbSay = {}
    local szTitle = format("<color=green>%s<color>: Kû luËt nhµ binh nghiªm ngÆt, ®©u thÓ ®Ó ng­¬i nãi ®Õn lµ ®Õn! Nh­ng nÕu mçi ng­êi ®­a ta 50 Vµng, ta sÏ ch©m ch­íc cho.", szName)
    tinsert(tbSay, format("Nép tiÒn vµo chiÕn tr­êng/#orb_OldDriverWaitMeConfirm(%d)",maxPlayerMap))
    tinsert(tbSay, "Ta tuyÖt ®èi kh«ng hèi lé/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function orb_ShowDetails()
    local str = format("<color=green>%s<color>: Liªu Quèc tÊn c«ng T©y Thôc, chiÕm s¹n ®¹o lËp c¨n cø tÊn c«ng. TriÖu Diªn Niªn nghe tin b¸o Vâ L©m Minh, hy väng hiÖp sÜ Trung Nguyªn cã thÓ trî gióp kh¸ng ®Þch. T©y Thôc §¹o dÔ thñ khã c«ng, ai chiÕm ®­îc m¸y nÐm ®¸ hñy tiÔn th¸p ®Þch trë thµnh mÊu chèt...", GetTargetNpcName())
    Talk(1,"main",str)
end

function orb_withAward()
    -- Íæ¼ÒÃ»ÓÐÁìÈ¡ÏÁÂ·Ïà·êµÄ½±Àø
    local hasPersonalHonor = 0
	for k,v in orb_honor_list do
		if orb_honor_GetHonor(k) == 1 then
				return 1
		end
    end
    if GetTask(TASKID_ORB_LAST_RESULT) ~= 0 and gf_GetTaskByte(TASKID_ORB_LAST_RESULT, 3) == 1 then
        -- ÓÐÊ¤¸º½±ÀøÃ»Áì½±
        return 1
    end
    return 0
end

function main()
    if g_WCFG_CHIENTRUONG_HIEPLO:IsDateOpen(1) ~= WEnv.TRUE then
        return WEnv.RETCODE_NOTOPEN;
    end

    local m,_,_ = GetWorldPos()
    local szName = GetTargetNpcName()
    local szTitle = format("<color=green>%s<color>: Thôc §¹o khã h¬n lªn trêi. Dï cã tin hµnh lang nh­ng ®­êng nói hiÓm trë, kh«ng thÓ tra râ thùc h­. ThiÕu hiÖp cÇn ph¶i cÈn thËn.\n<color=red>Chó ý: NÕu thiÕu hiÖp ®· tõng tham gia chiÕn tr­êng nµy, h·y nhËn th­ëng tr­íc ®ã tr­íc råi b¸o danh<color>", szName)
    local nState = orb_TimeCheck()
    local nTimeIdentity = orb_GetTimeIdentity()
    local tbSay = {}

    if orb_withAward() == 1 then
        Talk(1, "", szTitle)
        return
    end

    if m == t_kuafu_one_road_battle_npc[1][1] then          -- ¿ç·þ³¡µØ
        if nState == 1 then
            tinsert(tbSay, format("\n%s/orb_SignUp", "B¸o danh"))
        elseif nState == 2 then
            if nTimeIdentity == GetTask(TASKID_ORB_TIMEIDENTITY) then -- Ö®Ç°ÒÑ¾­½øÈë¹ý±¾³¡Õ½³¡ÁË
                tinsert(tbSay, format("\n%s/orb_ImBack", "Trë vÒ chiÕn tr­êng"))
            else
                tinsert(tbSay, format("\n%s/orb_OldDriverWaitMe", "B¸o danh bï"))
            end
        else
            szTitle = szTitle .. "<color=yellow>Thêi gian b¸o danh: 22:00 hµng ngµy<color>."
        end
        tinsert(tbSay, format("\n%s/orb_ShowDetails", "T×nh h×nh T©y Thôc §¹o thÕ nµo? (Giíi thiÖu c¸ch ch¬i)"))
    else                                                    -- ×¼±¸³¡ÄÚ
        -- tinsert(tbSay, format("\n%s/debugItem", "[Debug]µ÷ÊÔµÀ¾ß", nCamp))
        -- tinsert(tbSay, format("\n%s/orb_TryBattleStart", "[Debug]¿ªÊ¼"))
        -- tinsert(tbSay, format("\n%s/orb_CloseAll", "[Debug]¹Ø±ÕËùÓÐÕ½³¡"))
        tinsert(tbSay, format("\n%s/npc_talk_back_to_source_gs", "Bá qua b¸o danh"))
    end
    tinsert(tbSay, format("\n%s/nothing", "Ta chØ ghÐ ch¬i"))
    Say(szTitle, getn(tbSay), tbSay)
end

