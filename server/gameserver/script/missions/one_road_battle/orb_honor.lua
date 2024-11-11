Import("\\settings\\static_script\\lib\\globalfunction\\gf_task.lua")

-- ?gm ds SetPos(2023,3276); SetFightState(1)

ORB_TSKID_HONOR = 3507

ORB_MAX_KILLQUE_LEN = 10    -- 10≤Ω…±“ª»À 10s…±10»À
ORB_KILL_IN_SEC = 10

ORB_KING_OF_SLAYER = 100    -- …±»ÀÕı …±100»À
ORB_FREEZE_THIEF_NUM = 10   -- ’æ◊°–°Õµ ◊•10∏ˆ∫Ô◊”    
ORB_DETECTIVE_NUM = 5       -- √˜≤Ï«Ô∫¡ ◊•5∏ˆ∫Ô◊”
ORB_TOWER_BREAK = 2         -- ªŸÀ˛œ»∑Ê ∂‘√ÊÀ˛±ª¥›ªŸ ±’æ◊°π§≥Ã≥µ≈‘±ﬂ2¥Œ
ORB_TOWER_BREAK_MASTER = 3  -- ªŸÀ˛∏ﬂ ÷ ∂‘√ÊÀ˛±ª¥›ªŸ ±’æ◊°π§≥Ã≥µ≈‘±ﬂ3¥Œ
ORB_STRIKER = 1             -- µ±Õ∑“ª∞Ù ≥…π¶ªÒµ√∫⁄∑Á’Øµ±º“µƒ◊Ó∫Û“ªª˜“ª¥Œ
ORB_STRIKER_MASTER = 2      -- ΩÀ∑À√˚Ω´ “ª≥°±»»¸÷–ªÒµ√∫⁄∑Á’Øµ±º“µƒ◊Ó∫Û“ªª˜2¥Œ°££®»Œ“‚BOSS£©
orb_honor_list = {
    -- [szHonorStr] = {nBit, "szHonorName", nHonorType, honorLevel}, nHonorType[1 single : 2 team] 
    ["10kill_in_10s"]           = {1,"[10 B≠Ìc Di÷t 1]", 1 , 2 },
    ["king_of_slayer"]          = {2,"[Vua S∏t Nh©n]",     1  , 1 },
    ["detective"]               = {3,"[Minh S∏t Thu Hµo]",   1  , 1 },
    ["freeze_thief"]            = {4,"[KŒ TrÈm ß¯ng Lπi]",  1  , 2 },
    ["striker"]                 = {5,"[ß≠¨ng ß«u]",   1  , 1 },
    ["striker_master"]          = {6,"[T≠Ìng Di÷t Phÿ]",   1  , 2 },
    ["tower_breaker"]           = {7,"[Ti™n Phong HÒy Th∏p]",   1  , 1 },
    ["tower_breaker_master"]    = {8,"[Cao ThÒ HÒy Th∏p]",   1  , 2 },
    ["rampage"]                 = {9,"[Th’ Nh≠ Ph∏ TrÛc]",   2  , 1 },
    ["win_back"]                = {10,"[Xoay Chuy”n Cµn Kh´n]",  2  , 1 },
    ["white_hot"]               = {11,"[C„ Qua C„ Lπi]",  2  , 1 },
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
    if orb_honor_GetHonor(szType) == 1 then  -- ’‚∏ˆπ¶—´“—æ≠ªÒµ√¡À
        return                             
    end
    local nBit = orb_honor_list[szType][1]
    if nBit == nil then
        WriteLog("[ERROR][ORB]orb_honor_SetHonor szType is error!")
        return 
    end
    gf_SetTaskBit(ORB_TSKID_HONOR, nBit, Var)
    if Var == 1 then
        Msg2Player(format("ChÛc mıng bπn nhÀn Æ≠Óc c´ng lao chi’n tr≠Íng: %s",orb_honor_list[szType][2]))
        if orb_honor_list[szType][3] == 1 then
            Orb_AddRuntimeStat(RUNTIMEID_GetPersonalHonorCountByLevel, orb_honor_list[szType][4], 1)
        end
        FireEvent("event_mission_affairs","one_road_battle", "honor", szType)
    end
    if needBroadcast == 1 then
        Msg2SubWorld(format("[ChÛ ˝] [%s] nhÀn Æ≠Óc c´ng lao chi’n tr≠Íng: %s",GetName(), orb_honor_list[szType][2]))
    end
end

function orb_honor:OnKillPlayer()
    local nCurTime                      = GetTime()
    local szPlayerName                  = GetName()
    local nextPoint                     = mod(self.Cache[szPlayerName].nKillQueuePt, ORB_MAX_KILLQUE_LEN) + 1 -- —≠ª∑∂”¡–º∆À„œ¬“ª∏ˆŒª÷√
    self.Cache[szPlayerName].nKillPlayerCnt   = self.Cache[szPlayerName].nKillPlayerCnt + 1
    if self.Cache[szPlayerName].nKillPlayerCnt >= ORB_MAX_KILLQUE_LEN then
        local nTimediff = nCurTime - self.Cache[szPlayerName].tKillQueue[nextPoint]  -- ”…”⁄ «—≠ª∑∂”¡–£¨¥À ±µƒnextPointŒª÷√Ω´ª· «∂” ◊
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
    local szHonor = "Vinh d˘ chi’n tr≠Íng Hi÷p LÈ T≠¨ng PhÔng:\n"
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