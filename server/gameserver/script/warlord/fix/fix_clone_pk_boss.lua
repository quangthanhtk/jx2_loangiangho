----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-24
--- Description: Module chèng clone c©u tkt ho¹t ®éng s¨n boss
----------------------------------------------------------------------------------------------------

---C¸c lo¹i boss sÏ check trong map, gi¸ trÞ lµ m¸u cßn l¹i
---®èi víi boss thu thi, ®Ó gi¸ trÞ 1
---®èi víi boss mÊt x¸c liÒn th× ®Ó lµ 0
m_tbBossNameCanFreePK = {
    -- Boss thÕ giíi
    ["B¾c Lôc L©m Minh Chñ"] = 1,
    ["Th­¬ng ThÇn Doanh Thiªn"] = 1,
    ["L·nh H­¬ng L¨ng"] = 1,

    -- Boss nv n©ng cÊp ngäc Th¸i H­
    ["Thî rÌn L­u"] = 1,

    -- Boss Lan Hoa Anh Tö
    ["Lan Hoa"] = 1,
    ["Anh Tö"] = 1,

    -- Boss S­ M«n
    ["HuyÒn Ch©n"] = 1,
    ["Thanh Th­"] = 1,
    ["TuÖ Minh"] = 1,
    ["Hoµng ChÝnh NhÊt"] = 1,
    ["§­êng Hû"] = 1,
    ["D­¬ng Diªn §øc"] = 1,
    ["Cæ MÆc"] = 1,
    
    --WorldBoss
    ["§µo Hoa §¶o Chñ Hoµng Long"] = 1,
    ["T©y Vùc Th­¬ng Lang B¸ V­¬ng"] = 1,
    ["Ngäc S¬n Chi Linh Thiªn Cöu"] = 1,
    ["U Tr¹ch Chi ¶nh Minh Vâ"] = 1,
};

---C¸c map boss sÏ xuÊt hiÖn
m_tbMapHaveBoss = {
    -- B¾c Lôc L©m
    --[108] = "B¾c TuyÒn Ch©u", -- lo¹i map nµy ra, trong file: \script\task\boss\boss_pos.lua còng bá theo
    [105] = "T©y TuyÒn Ch©u",
    [201] = "Nam BiÖn Kinh",
    [203] = "T©y BiÖn Kinh",
    [205] = "§«ng BiÖn Kinh",
    [308] = "B¾c Thµnh §«",
    --[301] = "T©y Thµnh §«", -- lo¹i map nµy ra, trong file: \script\task\boss\boss_pos.lua còng bá theo
    [304] = "Nam Thµnh §«",

    -- Th­¬ng ThÇn Doanh Thiªn
    [107] = "Vò Di s¬n",
    [207] = "NhÞ Long s¬n",
    [218] = "Linh B¶o s¬n",
    [302] = "Thanh Thµnh s¬n",
    [311] = "Phôc Ng­u s¬n",

    -- L·nh H­¬ng L¨ng
    [319] = "Phong Ma ®éng-1",
    [306] = "Giang T©n Th«n",

    -- Lan Hoa Anh Tö
    [151] = "V©n M«ng Tr¹ch",

    -- Boss S­ M«n
    [204] = "ThiÕu L©m",
    [312] = "Vâ §ang",
    [303] = "Nga Mi",
    [305] = "§­êng M«n",
    [209] = "C¸i Bang",
    [407] = "Ngò §éc Gi¸o",
    [219] = "Thiªn Ba D­¬ng Phñ",
    
    -- WorldBoss
    [102] = "§µo Hoa ®¶o",
    [508] = "Quang Minh ®Ønh",
    [401] = "§iÓm Th­¬ng s¬n",
    [151] = "V©n Méng Tr¹ch",
};

---C¸c map mÆc ®Þnh sÏ kh«ng check
m_tbFreePkExcludeMapId = {
    -- C¸c map thµnh thÞ
    --[200] = 1, -- BiÖn Kinh
    --[100] = 1, -- TuyÒn Ch©u
    --[300] = 1, -- Thµnh §«
    --[350] = 1, -- T­¬ng D­¬ng
    --[150] = 1, -- D­¬ng Ch©u
    --[400] = 1, -- §¹i Lý
    -- [500] = 1, -- Ph­îng T­êng
    -- [425] = 1, -- Vâ L©m Minh

    -- C¸c map th¸i h­
    [1010] = 1,
    [2010] = 1,
    [3010] = 1,
    [4010] = 1,

    -- Map tû vâ
    [7100] = 1, -- Tû vâ l«i ®µi
    [971] = 1, -- Tû vâ l«i ®µi
    [972] = 1, -- Tû vâ l«i ®µi
    [973] = 1, -- Tû vâ l«i ®µi
    [974] = 1, -- Bªn ngoµi §¹i héi tû vâ
    [975] = 1, -- Bªn ngoµi §¹i héi tû vâ
    [976] = 1, -- Bªn ngoµi §¹i héi tû vâ
    [977] = 1, -- §iÓm ®¨ng ®µi

    [801] = 1, -- Th«ng Thiªn §¹i L«i
    [802] = 1, -- L«i ChÊn B¸t Ph­¬ng
    [803] = 1, -- C­íc ®iÕm kh¸ch s¹n
    [804] = 1, -- Lang Nha ®éng phñ
    [805] = 1, -- S¬n gian s¸ch kiÒu
    [810] = 1, -- Khª l­u béc bè
    [811] = 1, -- Thiªn ngo¹i phi tiªn

    -- Map chiÕn tr­êng
    [881] = 1, -- ChiÕn tr­êng Th«n trang-Nh¹n M«n Quan
    [882] = 1, -- ChiÕn tr­êng Th¶o cèc-Nh¹n M«n Quan
    [883] = 1, -- ChiÕn tr­êng ph¸o ®µi-Nh¹n M«n Quan
    [884] = 1, -- ChiÕn tr­êng chÝnh-Nh¹n M«n Quan

    [606] = 1, -- Thiªn M«n trËn néi

    [885] = 1, -- S¸t Thñ ®­êng ph©n ®µ

    [1106] = 1, -- Qu¸n trä Long m«n
    [1105] = 1, -- Cuèi Sa m¹c
    [1205] = 1, -- Cuèi Sa m¹c
    [1305] = 1, -- Cuèi Sa m¹c
    [1405] = 1, -- Cuèi Sa m¹c
    [1505] = 1, -- Cuèi Sa m¹c

    [969] = 1, -- BHTA Hoa S¬n

    -- C¸c map tµng kiÕm
    [901] = 1,
    [902] = 1,
    [903] = 1,
    [904] = 1,
    [905] = 1,
    [906] = 1,
    [907] = 1,
    [908] = 1,
    [909] = 1,
    [911] = 1,
    [922] = 1,
    [913] = 1,
    [914] = 1,
    [915] = 1,
    [916] = 1,
    [917] = 1,
    [918] = 1,
    [919] = 1,

    [1011] = 1,
    [1012] = 1,
    [1013] = 1,
    [1014] = 1,
    [1015] = 1,
    [1016] = 1,
    [1017] = 1,
    [1018] = 1,
    [1019] = 1,
    [1021] = 1,
    [1022] = 1,
    [1023] = 1,
    [1024] = 1,
    [1025] = 1,
    [1026] = 1,
    [1027] = 1,
    [1028] = 1,
    [1029] = 1,
    [1031] = 1,
    [1032] = 1,
    [1033] = 1,
    [1034] = 1,
    [1035] = 1,
    [1036] = 1,
    [1037] = 1,
    [1038] = 1,
    [1039] = 1,
    [1041] = 1,
    [1042] = 1,
    [1043] = 1,
    [1044] = 1,
    [1045] = 1,
    [1046] = 1,
    [1047] = 1,
    [1048] = 1,
    [1049] = 1,
    [1051] = 1,
    [1052] = 1,
    [1053] = 1,
    [1054] = 1,
    [1055] = 1,
    [1056] = 1,
    [1057] = 1,
    [1058] = 1,
    [1059] = 1,

    [2011] = 1,
    [2012] = 1,
    [2013] = 1,
    [2014] = 1,
    [2015] = 1,
    [2016] = 1,
    [2017] = 1,
    [2018] = 1,
    [2019] = 1,
    [2021] = 1,
    [2022] = 1,
    [2023] = 1,
    [2024] = 1,
    [2025] = 1,
    [2026] = 1,
    [2027] = 1,
    [2028] = 1,
    [2029] = 1,
    [2031] = 1,
    [2032] = 1,
    [2033] = 1,
    [2034] = 1,
    [2035] = 1,
    [2036] = 1,
    [2037] = 1,
    [2038] = 1,
    [2039] = 1,
    [2041] = 1,
    [2042] = 1,
    [2043] = 1,
    [2044] = 1,
    [2045] = 1,
    [2046] = 1,
    [2047] = 1,
    [2048] = 1,
    [2049] = 1,
    [2051] = 1,
    [2052] = 1,
    [2053] = 1,
    [2054] = 1,
    [2055] = 1,
    [2056] = 1,
    [2057] = 1,
    [2058] = 1,
    [2059] = 1,

    [3011] = 1,
    [3012] = 1,
    [3013] = 1,
    [3014] = 1,
    [3015] = 1,
    [3016] = 1,
    [3017] = 1,
    [3018] = 1,
    [3019] = 1,
    [3021] = 1,
    [3022] = 1,
    [3023] = 1,
    [3024] = 1,
    [3025] = 1,
    [3026] = 1,
    [3027] = 1,
    [3028] = 1,
    [3029] = 1,
    [3031] = 1,
    [3032] = 1,
    [3033] = 1,
    [3034] = 1,
    [3035] = 1,
    [3036] = 1,
    [3037] = 1,
    [3038] = 1,
    [3039] = 1,
    [3041] = 1,
    [3042] = 1,
    [3043] = 1,
    [3044] = 1,
    [3045] = 1,
    [3046] = 1,
    [3047] = 1,
    [3048] = 1,
    [3049] = 1,
    [3051] = 1,
    [3052] = 1,
    [3053] = 1,
    [3054] = 1,
    [3055] = 1,
    [3056] = 1,
    [3057] = 1,
    [3058] = 1,
    [3059] = 1,

    [4011] = 1,
    [4012] = 1,
    [4013] = 1,
    [4014] = 1,
    [4015] = 1,
    [4016] = 1,
    [4017] = 1,
    [4018] = 1,
    [4019] = 1,
    [4021] = 1,
    [4022] = 1,
    [4023] = 1,
    [4024] = 1,
    [4025] = 1,
    [4026] = 1,
    [4027] = 1,
    [4028] = 1,
    [4029] = 1,
    [4031] = 1,
    [4032] = 1,
    [4033] = 1,
    [4034] = 1,
    [4035] = 1,
    [4036] = 1,
    [4037] = 1,
    [4038] = 1,
    [4039] = 1,
    [4041] = 1,
    [4042] = 1,
    [4043] = 1,
    [4044] = 1,
    [4045] = 1,
    [4046] = 1,
    [4047] = 1,
    [4048] = 1,
    [4049] = 1,
    [4051] = 1,
    [4052] = 1,
    [4053] = 1,
    [4054] = 1,
    [4055] = 1,
    [4056] = 1,
    [4057] = 1,
    [4058] = 1,
    [4059] = 1,

    [5011] = 1,
    [5012] = 1,
    [5013] = 1,
    [5014] = 1,
    [5015] = 1,
    [5016] = 1,
    [5017] = 1,
    [5018] = 1,
    [5019] = 1,
    [5021] = 1,
    [5022] = 1,
    [5023] = 1,
    [5024] = 1,
    [5025] = 1,
    [5026] = 1,
    [5027] = 1,
    [5028] = 1,
    [5029] = 1,
    [5031] = 1,
    [5032] = 1,
    [5033] = 1,
    [5034] = 1,
    [5035] = 1,
    [5036] = 1,
    [5037] = 1,
    [5038] = 1,
    [5039] = 1,
    [5041] = 1,
    [5042] = 1,
    [5043] = 1,
    [5044] = 1,
    [5045] = 1,
    [5046] = 1,
    [5047] = 1,
    [5048] = 1,
    [5049] = 1,
    [5051] = 1,
    [5052] = 1,
    [5053] = 1,
    [5054] = 1,
    [5055] = 1,
    [5056] = 1,
    [5057] = 1,
    [5058] = 1,
    [5059] = 1,
};

---KiÓm tra map cã boss hay kh«ng
---@param nMapIdx number
---@return number
function _w_fix_ClonePk_CheckMapHaveBoss(nMapIdx)
    nMapIdx = nMapIdx or SubWorldIdx2ID(SubWorld);
    if m_tbMapHaveBoss[nMapIdx] == nil then
        return 0;
    end

    local tbNpcData = GetMapNpcIdx(nMapIdx) or {};
    local nRetCode = 0;
    for i = 1, getn(tbNpcData) do
        local szNpcName = GetNpcName(tbNpcData[i]);
        if m_tbBossNameCanFreePK[szNpcName] ~= nil then
            local nNpcMaxLife, nNpcCurLife = GetUnitCurStates(tbNpcData[i], 1);
            if nNpcCurLife > m_tbBossNameCanFreePK[szNpcName] then
                nRetCode = 1;
                break ;
            end
        end
    end
    return nRetCode;
end

---KiÓm tra map cã cho phÐp miÔn trõng ph¹t pk hay kh«ng
---@param nMapIdx number
---@return number
function _w_fix_ClonePk_CheckMapCanFreePk(nMapIdx)
    if _w_fix_ClonePk_CheckMapHaveBoss(nMapIdx) == 1 then
        return 1;
    else
        return 0;
    end
end

---Hµm nµy ®Æt t¹i PlayerLogin vµ trigger rect.txt
---\script\warlord\global\playerloginin.lua
function _w_fix_ClonePk_OnEnterMapFreePk()
    -- Init triger
    local tbTriggerId = { 3024, 3025 };
    for i = 1, getn(tbTriggerId) do
        if GetTrigger(tbTriggerId[i] * 2) == 0 then
            CreateTrigger(2, tbTriggerId[i], tbTriggerId[i] * 2);
        end
    end
    
    -- Enable free pk if enter map boss
    if _w_fix_ClonePk_CheckMapCanFreePk() == 1 then
        SetDeathPunish(0);
        local szMsg = "TiÕn vµo b¶n ®å giao tranh BOSS trong thêi gian nµy sÏ kh«ng bÞ trõng ph¹t PK!";
        Msg2Player(szMsg);
        TaskTip(szMsg);
    end
end

---Hµm nµy chØ ®Æt t¹i trigger rect.txt
function _w_fix_ClonePk_OnLeaveMapFreePk()
    local nSubWorldIdx, nMapId = SubWorldIdx2ID(SubWorld);
    if m_tbFreePkExcludeMapId[nMapId] ~= nil or nSubWorldIdx > 65535 then
        SetDeathPunish(0);
    else
        SetDeathPunish(1);
    end
end

---Hµm nµy ®Æt t¹i c¸c hµm t¹o boss
---\script\gmscript.lua
---\script\online\viet_event\factionboss\head_factionboss.lua
---\script\task\taixu_jwl_up\taixu_liu_ondeath.lua
---\script\function\world_boss\wb_head.lua
---@param nMapIdx number
function _w_fix_ClonePk_OpenFreePk(nMapIdx)
    if _w_fix_ClonePk_CheckMapCanFreePk(nMapIdx) ~= 1 then
        return 0;
    end

    local tbPlayerData = GetMapPlayer(nMapIdx) or {};
    local nOldPlayerIdx = PlayerIndex;
    for i = 1, getn(tbPlayerData) do
        PlayerIndex = tbPlayerData[i];
        SetDeathPunish(0);
        local szMsg = "Trong thêi gian giao tranh BOSS t¹i b¶n ®å nµy sÏ kh«ng bÞ trõng ph¹t PK!";
        Msg2Player(szMsg);
        TaskTip(szMsg);
        PlayerIndex = nOldPlayerIdx;
    end
    PlayerIndex = nOldPlayerIdx;
end

---Hµm nµy ®Æt t¹i c¸c hµm boss chÕt hoÆc remove
---\script\task\boss\boss_ondeath.lua
---\script\online\viet_event\lanhua_boss\lanhua_boss.lua
---\script\online\viet_event\factionboss\factionboss_death.lua
---\script\function\world_boss\wb_boss_death.lua
---\script\function\world_boss\wb_boss_remove.lua
---@param nMapIdx number
---@param bRemoveBoss boolean Default is 0
function _w_fix_ClonePk_CloseFreePk(nMapIdx, bRemoveBoss)
    bRemoveBoss = bRemoveBoss or 0;
    if bRemoveBoss == 1 then
        -- Tr­êng hîp boss biÕn mÊt th× sÏ check ®óng map th× míi thùc hiÖn
        if m_tbMapHaveBoss[nMapIdx] == nil then
            return 0;
        end
    else
         -- Tr­êng hîp boss bÞ giÕt th× kiÓm tra cßn boss kh¸c trong map th× kh«ng thùc hiÖn
        if _w_fix_ClonePk_CheckMapHaveBoss(nMapIdx) == 1 then
            return 0;
        end
    end

    local tbPlayerData = GetMapPlayer(nMapIdx) or {};
    local nOldPlayerIdx = PlayerIndex;
    for i = 1, getn(tbPlayerData) do
        PlayerIndex = tbPlayerData[i];
        SetDeathPunish(1);
        local szMsg = "Thêi gian miÔn trõng ph¹t PK ®· hÕt!";
        Msg2Player(szMsg);
        TaskTip(szMsg);
        PlayerIndex = nOldPlayerIdx;
    end
    PlayerIndex = nOldPlayerIdx;
end
