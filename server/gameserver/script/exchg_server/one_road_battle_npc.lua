Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")
Include("\\script\\exchg_server\\exchange_server_npc.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
Include("\\script\\missions\\one_road_battle\\mission.lua")
Include("\\settings\\static_script\\exchg_server\\exchange_paycoin_head.lua")

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua"); --LongDaiKa: th�m v�o �� d�ng g_WCFG
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
        Talk(1,"", format("��i ng� t� ��i tham gia b�o danh kh�ng ���c v��t qu� %d ng��i",ORB_MAX_TEAM_MEMBER) )
        return
    end  

    local oldPlayerIndex = PlayerIndex
    local errStr = format("<color=green>%s<color>: ��i c� hi�p s� kh�ng ph� h�p �i�u ki�n tham gia!\n\n",GetTargetNpcName())
    local res = 1
    for i = 1, nTeamSize do
        PlayerIndex     = GetTeamMember(i)
        local nLv       = GetLevel();
        local nTrans    = gf_GetTransCount();
        local level     = nTrans*100 + nLv;
        local jungong   = abs(GetTask(701))
        local szName    = GetName()
        local nCash     = GetCash()

        if orb_GetTimeIdentity() == GetTask(TASKID_ORB_TIMEIDENTITY) then  -- ֮ǰ�Ѿ����������ս����
            tinsert(check, format("%s �� b�o danh chi�n tr��ng n�y r�i\n",szName))
        end

        if level < ORB_NEED_LEVEL_TEAM then
            tinsert(check, format("%s ch�a ��t chuy�n sinh 7 c�p 90\n",szName))
        end
        if jungong < ORB_NEED_JUNGONG then
            tinsert(check, format("%s c�ng tr�ng ch�a �� 100000\n",szName))
        end
        if bAfterStart == 1 then -- ������
            if nCash < ORB_JOIN_AFTER_START_COST then
                tinsert(check, format("Tr�n ng��i %s kh�ng �� 50 V�ng\n",szName))
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
    local errStr    = format("<color=green>%s<color>: Kh�ng ph� h�p �i�u ki�n tham gia!\n\n",GetTargetNpcName())
    if level < ORB_NEED_LEVEL then
        tinsert(check, "Ch�a ��t chuy�n sinh 8 c�p 90\n")
    end
    if jungong < ORB_NEED_JUNGONG then
        tinsert(check, "C�ng tr�ng ch�a �� 100000\n")
    end
    if bAfterStart == 1 then -- ������
        if nCash < ORB_JOIN_AFTER_START_COST then
            tinsert(check, "Tr�n ng��i kh�ng �� 50 V�ng\n")
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
    local state = 0 -- 1:�ɱ��� 2:�ɲ����������½��� 0:��ʱ
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

function orb_SignUp() -- ����
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
        Talk(1,"",format("<color=green>%s<color>: T�y Th�c ��o �� ��y, ��i hi�p h�y quay l�i sau.",GetTargetNpcName()))
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
            SetCreateTeam(1); --��ֹ��Ӳ���
        end
        PlayerIndex = oldPlayerIndex
    else
        NewWorld(
            orb_perpare_map[targetMap][1],
            orb_perpare_map[targetMap][2] + nOffsetX,
            orb_perpare_map[targetMap][3] + nOffsetY
        )
        SetCreateTeam(1); --��ֹ��Ӳ���
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
        if teamSize == 0 then      -- ���˲���
            tinsert(tObj.player, PlayerIndex)
            tObj.power = abs(GetTask(701))
        else                            -- ���˲���
            if PlayerIndex == GetTeamMember(1) then -- �ӳ�
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
    --- Ϊ�˷�ֹÿ�ε�һ����������һ����Ӫ����һ������������� ---
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
        if tCampNum[weekCamp] >= nHalfNumber then  --�����Ѿ�������,ʣ�µ���ֻ�ܼ���ǿ��
            tCampNum[strongCamp] = tCampNum[strongCamp] + getn(tGroup[i].player)
            tCampPower[strongCamp] = tCampPower[strongCamp] + tGroup[i].power
            this:TeamEnter(mapID, strongCamp)
        else                                        -- ����δ���ˣ����ȼ�������
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
        if SubWorldID2Idx(orb_perpare_map[i][1]) > 0 then  -- �÷������д˵�ͼ
            local tMapPlayer = GetMapPlayer(orb_perpare_map[i][1])
            local tGroup = {}
            if getn(tMapPlayer) < ORB_MAX_SIGNUP_MIN_NUM then -- ��������
                local oldPlayerIndex = PlayerIndex
                for j = 1, getn(tMapPlayer) do
                    PlayerIndex = tMapPlayer[j]
                    Msg2Player("S�n chu�n b� kh�ng �� ng��i �� b�t ��u thi ��u, c� th� th� ��n ch� [Hi�p L� T��ng Ph�ng Tham T��ng] gia nh�p chi�n tr��ng Hi�p L� T��ng Ph�ng �� m�.")
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

    if GetTeamSize() > 0 then                           -- �ػ�ս���Ͳ�������ˣ��Լ��ذ�
        Talk(1,"",format("<color=green>%s<color>: Ch� c� th� tr� v� chi�n tr��ng m�t m�nh, h�y tho�t ��i tr��c.",GetTargetNpcName()))
        return
    end

    if nState ~= 2 then 
        Talk(1,"",format("<color=green>%s<color>: K� lu�t nh� binh nghi�m ng�t, ��u th� �� ng��i n�i ��n l� ��n. ��i qu�n s�m �� giao chi�n, b�y gi� ��n qu� tr� r�i.",GetTargetNpcName()))
        return
    end

    for i = 1, getn(orb_battle_map) do                  -- �ټ��һ�¼�¼��ս����ͼID�Բ���
        if orb_battle_map[i] == curBattleMap then
            check = 1
            break
        end
    end

    if check == 0 then
        Talk(1,"",format("<color=green>%s<color>: Chi�n tr��ng tham gia tr��c �� �� k�t th�c.",GetTargetNpcName()))
        SetTask(TASKID_ORB_TIMEIDENTITY, 0)
        return
    end

    this:setMap(curBattleMap)
    local curPlayerNum = this.msCamp:getCount(this.missionID, nCamp)
    this:resetMap()
    if curPlayerNum > ORB_MAX_HALF_BATTLE_NUM then
        Talk(1,"",format("<color=green>%s<color>: T�y Th�c ��o �� ��y, ��i hi�p h�y quay l�i sau.",GetTargetNpcName()))
        return
    end

    this:TeamEnter(curBattleMap, nCamp)
end

function orb_OldDriverWaitMeConfirm(nMapId)
    local nState = orb_TimeCheck()
    local nTeamSize = GetTeamSize() 
    if nState ~= 2 then 
        Talk(1,"",format("<color=green>%s<color>: K� lu�t nh� binh nghi�m ng�t, ��u th� �� ng��i n�i ��n l� ��n. ��i qu�n s�m �� giao chi�n, b�y gi� ��n qu� tr� r�i.",GetTargetNpcName()))
        return
    end
    if nTeamSize > 0 then
        if GetTeamMember(1) ~= PlayerIndex then
            Talk(1,"",format("<color=green>%s<color>: B�o th� l�nh ��i c�c ng��i n�i chuy�n v�i ta.",GetTargetNpcName()))
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
        Talk(1,"",format("<color=green>%s<color>: K� lu�t nh� binh nghi�m ng�t, ��u th� �� ng��i n�i ��n l� ��n. ��i qu�n s�m �� giao chi�n, b�y gi� ��n qu� tr� r�i.",GetTargetNpcName()))
        return
    end
    if getn(orb_battle_map) == 0 then
        Talk(1,"",format("<color=green>%s<color>: Hi�n kh�ng c� chi�n s�, ��i hi�p h�y quay v�.",GetTargetNpcName()))
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
        Talk(1,"",format("<color=green>%s<color>: T�y Th�c ��o �� ��y, c�c ng��i h�y quay l�i sau.",GetTargetNpcName()))
        return
    end
    local tbSay = {}
    local szTitle = format("<color=green>%s<color>: K� lu�t nh� binh nghi�m ng�t, ��u th� �� ng��i n�i ��n l� ��n! Nh�ng n�u m�i ng��i ��a ta 50 V�ng, ta s� ch�m ch��c cho.", szName)
    tinsert(tbSay, format("N�p ti�n v�o chi�n tr��ng/#orb_OldDriverWaitMeConfirm(%d)",maxPlayerMap))
    tinsert(tbSay, "Ta tuy�t ��i kh�ng h�i l�/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function orb_ShowDetails()
    local str = format("<color=green>%s<color>: Li�u Qu�c t�n c�ng T�y Th�c, chi�m s�n ��o l�p c�n c� t�n c�ng. Tri�u Di�n Ni�n nghe tin b�o V� L�m Minh, hy v�ng hi�p s� Trung Nguy�n c� th� tr� gi�p kh�ng ��ch. T�y Th�c ��o d� th� kh� c�ng, ai chi�m ���c m�y n�m �� h�y ti�n th�p ��ch tr� th�nh m�u ch�t...", GetTargetNpcName())
    Talk(1,"main",str)
end

function orb_withAward()
    -- ���û����ȡ��·���Ľ���
    local hasPersonalHonor = 0
	for k,v in orb_honor_list do
		if orb_honor_GetHonor(k) == 1 then
				return 1
		end
    end
    if GetTask(TASKID_ORB_LAST_RESULT) ~= 0 and gf_GetTaskByte(TASKID_ORB_LAST_RESULT, 3) == 1 then
        -- ��ʤ������û�콱
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
    local szTitle = format("<color=green>%s<color>: Th�c ��o kh� h�n l�n tr�i. D� c� tin h�nh lang nh�ng ���ng n�i hi�m tr�, kh�ng th� tra r� th�c h�. Thi�u hi�p c�n ph�i c�n th�n.\n<color=red>Ch� �: N�u thi�u hi�p �� t�ng tham gia chi�n tr��ng n�y, h�y nh�n th��ng tr��c �� tr��c r�i b�o danh<color>", szName)
    local nState = orb_TimeCheck()
    local nTimeIdentity = orb_GetTimeIdentity()
    local tbSay = {}

    if orb_withAward() == 1 then
        Talk(1, "", szTitle)
        return
    end

    if m == t_kuafu_one_road_battle_npc[1][1] then          -- �������
        if nState == 1 then
            tinsert(tbSay, format("\n%s/orb_SignUp", "B�o danh"))
        elseif nState == 2 then
            if nTimeIdentity == GetTask(TASKID_ORB_TIMEIDENTITY) then -- ֮ǰ�Ѿ����������ս����
                tinsert(tbSay, format("\n%s/orb_ImBack", "Tr� v� chi�n tr��ng"))
            else
                tinsert(tbSay, format("\n%s/orb_OldDriverWaitMe", "B�o danh b�"))
            end
        else
            szTitle = szTitle .. "<color=yellow>Th�i gian b�o danh: 22:00 h�ng ng�y<color>."
        end
        tinsert(tbSay, format("\n%s/orb_ShowDetails", "T�nh h�nh T�y Th�c ��o th� n�o? (Gi�i thi�u c�ch ch�i)"))
    else                                                    -- ׼������
        -- tinsert(tbSay, format("\n%s/debugItem", "[Debug]���Ե���", nCamp))
        -- tinsert(tbSay, format("\n%s/orb_TryBattleStart", "[Debug]��ʼ"))
        -- tinsert(tbSay, format("\n%s/orb_CloseAll", "[Debug]�ر�����ս��"))
        tinsert(tbSay, format("\n%s/npc_talk_back_to_source_gs", "B� qua b�o danh"))
    end
    tinsert(tbSay, format("\n%s/nothing", "Ta ch� gh� ch�i"))
    Say(szTitle, getn(tbSay), tbSay)
end

