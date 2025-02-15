Import("\\settings\\static_script\\lib\\globalfunction\\gf_task.lua")

-- ?gm ds SetPos(2023,3276); SetFightState(1)

ORB_TSKID_HONOR = 3507

ORB_MAX_KILLQUE_LEN = 10    -- 10步杀一人 10s杀10人
ORB_KILL_IN_SEC = 10

ORB_KING_OF_SLAYER = 100    -- 杀人王 杀100人
ORB_FREEZE_THIEF_NUM = 10   -- 站住小偷 抓10个猴子    
ORB_DETECTIVE_NUM = 5       -- 明察秋毫 抓5个猴子
ORB_TOWER_BREAK = 2         -- 毁塔先锋 对面塔被摧毁时站住工程车旁边2次
ORB_TOWER_BREAK_MASTER = 3  -- 毁塔高手 对面塔被摧毁时站住工程车旁边3次
ORB_STRIKER = 1             -- 当头一棒 成功获得黑风寨当家的最后一击一次
ORB_STRIKER_MASTER = 2      -- 剿匪名将 一场比赛中获得黑风寨当家的最后一击2次。（任意BOSS）
orb_honor_list = {
    -- [szHonorStr] = {nBit, "szHonorName", nHonorType, honorLevel}, nHonorType[1 single : 2 team] 
    ["10kill_in_10s"]           = {1,"[10 Bc Di謙 1]", 1 , 2 },
    ["king_of_slayer"]          = {2,"[Vua S竧 Nh﹏]",     1  , 1 },
    ["detective"]               = {3,"[Minh S竧 Thu H祇]",   1  , 1 },
    ["freeze_thief"]            = {4,"[K� Tr閙 ng L筰]",  1  , 2 },
    ["striker"]                 = {5,"[Л琻g u]",   1  , 1 },
    ["striker_master"]          = {6,"[Tng Di謙 Ph豜",   1  , 2 },
    ["tower_breaker"]           = {7,"[Ti猲 Phong H駓 Th竝]",   1  , 1 },
    ["tower_breaker_master"]    = {8,"[Cao Th� H駓 Th竝]",   1  , 2 },
    ["rampage"]                 = {9,"[Th� Nh� Ph� Tr骳]",   2  , 1 },
    ["win_back"]                = {10,"[Xoay Chuy觧 C祅 Kh玭]",  2  , 1 },
    ["white_hot"]               = {11,"[C� Qua C� L筰]",  2  , 1 },
}

orb_honor = {
--     ['PlayerName'] = { 
--         nTimeIdentity   = 2017122014,
-- -------------- Circular Queue --------------
--         tKillQueue      = {},
--         nKillQueuePt    = 1,
-- --------------------------------------------
--         nKillPlayerCnt  = 0,
--         nCatchMonkey    = 0,
--         nKillBossCnt    = 0,
--         nKillTowerCnt   = 0,
--     }
    Cache = {},
}

function orb_honor:OnPlayerJoin()
    local nTimeIdentity     = nil
    local szPlayerName      = GetName()
    local nCurTimeIdentity  = orb_GetTimeIdentity()
    if self.Cache[szPlayerName] ~= nil then
        nTimeIdentity = self.Cache[szPlayerName].nTimeIdentity
    end
    if nTimeIdentity ~= nCurTimeIdentity then
        self.Cache[szPlayerName]                 = {}
        self.Cache[szPlayerName].tKillQueue      = {}
        self.Cache[szPlayerName].nTimeIdentity   = nCurTimeIdentity
        self.Cache[szPlayerName].nKillQueuePt    = 1
        self.Cache[szPlayerName].nKillPlayerCnt  = 0
        self.Cache[szPlayerName].nCatchMonkey    = 0
        self.Cache[szPlayerName].nKillBossCnt    = 0
        self.Cache[szPlayerName].nKillTowerCnt   = 0
    end
end

function orb_honor_ClearPersonalHonor()
    for k,v in orb_honor_list do
		if orb_honor_GetHonor(k) == 1 and v[3] == 1 then
            local nBit = v[1]
            if nBit == nil then
                WriteLog("[ERROR][ORB]orb_honor_ClearPersonalHonor szType is error!")
                return 
            end
            gf_SetTaskBit(ORB_TSKID_HONOR, nBit, 0)
		end
	end
end

function orb_honor_ClearTeamHonor()
    for k,v in orb_honor_list do
		if orb_honor_GetHonor(k) == 1 and v[3] == 2 then
            local nBit = v[1]
            if nBit == nil then
                WriteLog("[ERROR][ORB]orb_honor_ClearTeamHonor szType is error!")
                return 
            end
            gf_SetTaskBit(ORB_TSKID_HONOR, nBit, 0)
		end
	end
end

function orb_honor_GetHonor(szType)
    local nBit = orb_honor_list[szType][1]
    if nBit == nil then
        WriteLog("[ERROR][ORB]orb_honor_GetHonor szType is error!")
        return 
    end
    return gf_GetTaskBit(ORB_TSKID_HONOR, nBit)
end

function orb_honor_SetHonor(szType, Var, needBroadcast)
    if orb_honor_GetHonor(szType) == 1 then  -- 这个功勋已经获得了
        return                             
    end
    local nBit = orb_honor_list[szType][1]
    if nBit == nil then
        WriteLog("[ERROR][ORB]orb_honor_SetHonor szType is error!")
        return 
    end
    gf_SetTaskBit(ORB_TSKID_HONOR, nBit, Var)
    if Var == 1 then
        Msg2Player(format("Ch骳 m鮪g b筺 nh薾 頲 c玭g lao chi課 trng: %s",orb_honor_list[szType][2]))
        if orb_honor_list[szType][3] == 1 then
            Orb_AddRuntimeStat(RUNTIMEID_GetPersonalHonorCountByLevel, orb_honor_list[szType][4], 1)
        end
        FireEvent("event_mission_affairs","one_road_battle", "honor", szType)
    end
    if needBroadcast == 1 then
        Msg2SubWorld(format("[Ch� 齗 [%s] nh薾 頲 c玭g lao chi課 trng: %s",GetName(), orb_honor_list[szType][2]))
    end
end

function orb_honor:OnKillPlayer()
    local nCurTime                      = GetTime()
    local szPlayerName                  = GetName()
    local nextPoint                     = mod(self.Cache[szPlayerName].nKillQueuePt, ORB_MAX_KILLQUE_LEN) + 1 -- 循环队列计算下一个位置
    self.Cache[szPlayerName].nKillPlayerCnt   = self.Cache[szPlayerName].nKillPlayerCnt + 1
    if self.Cache[szPlayerName].nKillPlayerCnt >= ORB_MAX_KILLQUE_LEN then
        local nTimediff = nCurTime - self.Cache[szPlayerName].tKillQueue[nextPoint]  -- 由于是循环队列，此时的nextPoint位置将会是队首
        if nTimediff <= ORB_KILL_IN_SEC then
            orb_honor_SetHonor("10kill_in_10s", 1)
        end
    end
    self.Cache[szPlayerName].tKillQueue[self.Cache[szPlayerName].nKillQueuePt] = nCurTime
    self.Cache[szPlayerName].nKillQueuePt = nextPoint
    if self.Cache[szPlayerName].nKillPlayerCnt == ORB_KING_OF_SLAYER then
        orb_honor_SetHonor("king_of_slayer", 1, 1)
    end
end

function orb_honor:OnCatchMonkey()
    local szPlayerName                  = GetName()
    self.Cache[szPlayerName].nCatchMonkey     = self.Cache[szPlayerName].nCatchMonkey + 1
    if self.Cache[szPlayerName].nCatchMonkey == ORB_DETECTIVE_NUM then
        orb_honor_SetHonor("detective", 1)
    end
    if self.Cache[szPlayerName].nCatchMonkey == ORB_FREEZE_THIEF_NUM then
        orb_honor_SetHonor("freeze_thief", 1, 1)
    end
end

function orb_honor:OnKillTower()
    local szPlayerName                  = GetName()
    self.Cache[szPlayerName].nKillTowerCnt    = self.Cache[szPlayerName].nKillTowerCnt + 1
    if self.Cache[szPlayerName].nKillTowerCnt == ORB_TOWER_BREAK then
        orb_honor_SetHonor("tower_breaker", 1)
    end
    if self.Cache[szPlayerName].nKillTowerCnt == ORB_TOWER_BREAK_MASTER then
        orb_honor_SetHonor("tower_breaker_master", 1, 1)
    end
end

function orb_honor:OnKillBoss()
    local szPlayerName                  = GetName()
    self.Cache[szPlayerName].nKillBossCnt    = self.Cache[szPlayerName].nKillBossCnt + 1
    if self.Cache[szPlayerName].nKillBossCnt == ORB_STRIKER then
        orb_honor_SetHonor("striker", 1)
    end
    if self.Cache[szPlayerName].nKillBossCnt == ORB_STRIKER_MASTER then
        orb_honor_SetHonor("striker_master", 1)
    end
end

function orb_honor_Rampage()
    orb_honor_SetHonor("rampage", 1)
end
function orb_honor_WinBack()
    orb_honor_SetHonor("win_back", 1)
end
function orb_honor_WhiteHot()
    orb_honor_SetHonor("white_hot", 1)
end

function orb_showAllHonor()
    local szHonor = "Vinh d� chi課 trng Hi謕 L� Tng Ph飊g:\n"
    for k, v in orb_honor_list do
        if orb_honor_GetHonor(k) == 1 then
            szHonor = format("%s ---- <color=yellow>%s<color>\n",szHonor, v[2])
        end
    end
    Talk(1,"",szHonor)
end

function orb_showCache()
    for k,v in orb_honor.Cache do
        print("--------------------------------------------")
        print(format("-->[%s]:nTimeIdentity = %d",k,v.nTimeIdentity))
        print(format("-->[%s]:nKillQueuePt = %d",k,v.nKillQueuePt))
        print(format("-->[%s]:nKillPlayerCnt = %d",k,v.nKillPlayerCnt))
        print(format("-->[%s]:nCatchMonkey = %d",k,v.nCatchMonkey))
        print("\n")
        -- self.Cache[szPlayerName].tKillQueue      = {}
        -- self.Cache[szPlayerName].nTimeIdentity   = nCurTimeIdentity
        -- self.Cache[szPlayerName].nKillQueuePt    = 1
        -- self.Cache[szPlayerName].nKillPlayerCnt  = 0
        -- self.Cache[szPlayerName].nCatchMonkey    = 0
        -- self.Cache[szPlayerName].nKillBossCnt    = 0
        -- self.Cache[szPlayerName].nKillTowerCnt   = 0
    end
end