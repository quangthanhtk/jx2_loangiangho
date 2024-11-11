----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-24
--- Description: Module ch�ng clone c�u tkt ho�t ��ng s�n boss
----------------------------------------------------------------------------------------------------

---C�c lo�i boss s� check trong map, gi� tr� l� m�u c�n l�i
---��i v�i boss thu thi, �� gi� tr� 1
---��i v�i boss m�t x�c li�n th� �� l� 0
m_tbBossNameCanFreePK = {
    -- Boss th� gi�i
    ["B�c L�c L�m Minh Ch�"] = 1,
    ["Th��ng Th�n Doanh Thi�n"] = 1,
    ["L�nh H��ng L�ng"] = 1,

    -- Boss nv n�ng c�p ng�c Th�i H�
    ["Th� r�n L�u"] = 1,

    -- Boss Lan Hoa Anh T�
    ["Lan Hoa"] = 1,
    ["Anh T�"] = 1,

    -- Boss S� M�n
    ["Huy�n Ch�n"] = 1,
    ["Thanh Th�"] = 1,
    ["Tu� Minh"] = 1,
    ["Ho�ng Ch�nh Nh�t"] = 1,
    ["���ng H�"] = 1,
    ["D��ng Di�n ��c"] = 1,
    ["C� M�c"] = 1,
    
    --WorldBoss
    ["��o Hoa ��o Ch� Ho�ng Long"] = 1,
    ["T�y V�c Th��ng Lang B� V��ng"] = 1,
    ["Ng�c S�n Chi Linh Thi�n C�u"] = 1,
    ["U Tr�ch Chi �nh Minh V�"] = 1,
};

---C�c map boss s� xu�t hi�n
m_tbMapHaveBoss = {
    -- B�c L�c L�m
    --[108] = "B�c Tuy�n Ch�u", -- lo�i map n�y ra, trong file: \script\task\boss\boss_pos.lua c�ng b� theo
    [105] = "T�y Tuy�n Ch�u",
    [201] = "Nam Bi�n Kinh",
    [203] = "T�y Bi�n Kinh",
    [205] = "��ng Bi�n Kinh",
    [308] = "B�c Th�nh ��",
    --[301] = "T�y Th�nh ��", -- lo�i map n�y ra, trong file: \script\task\boss\boss_pos.lua c�ng b� theo
    [304] = "Nam Th�nh ��",

    -- Th��ng Th�n Doanh Thi�n
    [107] = "V� Di s�n",
    [207] = "Nh� Long s�n",
    [218] = "Linh B�o s�n",
    [302] = "Thanh Th�nh s�n",
    [311] = "Ph�c Ng�u s�n",

    -- L�nh H��ng L�ng
    [319] = "Phong Ma ��ng-1",
    [306] = "Giang T�n Th�n",

    -- Lan Hoa Anh T�
    [151] = "V�n M�ng Tr�ch",

    -- Boss S� M�n
    [204] = "Thi�u L�m",
    [312] = "V� �ang",
    [303] = "Nga Mi",
    [305] = "���ng M�n",
    [209] = "C�i Bang",
    [407] = "Ng� ��c Gi�o",
    [219] = "Thi�n Ba D��ng Ph�",
    
    -- WorldBoss
    [102] = "��o Hoa ��o",
    [508] = "Quang Minh ��nh",
    [401] = "�i�m Th��ng s�n",
    [151] = "V�n M�ng Tr�ch",
};

---C�c map m�c ��nh s� kh�ng check
m_tbFreePkExcludeMapId = {
    -- C�c map th�nh th�
    --[200] = 1, -- Bi�n Kinh
    --[100] = 1, -- Tuy�n Ch�u
    --[300] = 1, -- Th�nh ��
    --[350] = 1, -- T��ng D��ng
    --[150] = 1, -- D��ng Ch�u
    --[400] = 1, -- ��i L�
    -- [500] = 1, -- Ph��ng T��ng
    -- [425] = 1, -- V� L�m Minh

    -- C�c map th�i h�
    [1010] = 1,
    [2010] = 1,
    [3010] = 1,
    [4010] = 1,

    -- Map t� v�
    [7100] = 1, -- T� v� l�i ��i
    [971] = 1, -- T� v� l�i ��i
    [972] = 1, -- T� v� l�i ��i
    [973] = 1, -- T� v� l�i ��i
    [974] = 1, -- B�n ngo�i ��i h�i t� v�
    [975] = 1, -- B�n ngo�i ��i h�i t� v�
    [976] = 1, -- B�n ngo�i ��i h�i t� v�
    [977] = 1, -- �i�m ��ng ��i

    [801] = 1, -- Th�ng Thi�n ��i L�i
    [802] = 1, -- L�i Ch�n B�t Ph��ng
    [803] = 1, -- C��c �i�m kh�ch s�n
    [804] = 1, -- Lang Nha ��ng ph�
    [805] = 1, -- S�n gian s�ch ki�u
    [810] = 1, -- Kh� l�u b�c b�
    [811] = 1, -- Thi�n ngo�i phi ti�n

    -- Map chi�n tr��ng
    [881] = 1, -- Chi�n tr��ng Th�n trang-Nh�n M�n Quan
    [882] = 1, -- Chi�n tr��ng Th�o c�c-Nh�n M�n Quan
    [883] = 1, -- Chi�n tr��ng ph�o ��i-Nh�n M�n Quan
    [884] = 1, -- Chi�n tr��ng ch�nh-Nh�n M�n Quan

    [606] = 1, -- Thi�n M�n tr�n n�i

    [885] = 1, -- S�t Th� ���ng ph�n ��

    [1106] = 1, -- Qu�n tr� Long m�n
    [1105] = 1, -- Cu�i Sa m�c
    [1205] = 1, -- Cu�i Sa m�c
    [1305] = 1, -- Cu�i Sa m�c
    [1405] = 1, -- Cu�i Sa m�c
    [1505] = 1, -- Cu�i Sa m�c

    [969] = 1, -- BHTA Hoa S�n

    -- C�c map t�ng ki�m
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

---Ki�m tra map c� boss hay kh�ng
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

---Ki�m tra map c� cho ph�p mi�n tr�ng ph�t pk hay kh�ng
---@param nMapIdx number
---@return number
function _w_fix_ClonePk_CheckMapCanFreePk(nMapIdx)
    if _w_fix_ClonePk_CheckMapHaveBoss(nMapIdx) == 1 then
        return 1;
    else
        return 0;
    end
end

---H�m n�y ��t t�i PlayerLogin v� trigger rect.txt
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
        local szMsg = "Ti�n v�o b�n �� giao tranh BOSS trong th�i gian n�y s� kh�ng b� tr�ng ph�t PK!";
        Msg2Player(szMsg);
        TaskTip(szMsg);
    end
end

---H�m n�y ch� ��t t�i trigger rect.txt
function _w_fix_ClonePk_OnLeaveMapFreePk()
    local nSubWorldIdx, nMapId = SubWorldIdx2ID(SubWorld);
    if m_tbFreePkExcludeMapId[nMapId] ~= nil or nSubWorldIdx > 65535 then
        SetDeathPunish(0);
    else
        SetDeathPunish(1);
    end
end

---H�m n�y ��t t�i c�c h�m t�o boss
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
        local szMsg = "Trong th�i gian giao tranh BOSS t�i b�n �� n�y s� kh�ng b� tr�ng ph�t PK!";
        Msg2Player(szMsg);
        TaskTip(szMsg);
        PlayerIndex = nOldPlayerIdx;
    end
    PlayerIndex = nOldPlayerIdx;
end

---H�m n�y ��t t�i c�c h�m boss ch�t ho�c remove
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
        -- Tr��ng h�p boss bi�n m�t th� s� check ��ng map th� m�i th�c hi�n
        if m_tbMapHaveBoss[nMapIdx] == nil then
            return 0;
        end
    else
         -- Tr��ng h�p boss b� gi�t th� ki�m tra c�n boss kh�c trong map th� kh�ng th�c hi�n
        if _w_fix_ClonePk_CheckMapHaveBoss(nMapIdx) == 1 then
            return 0;
        end
    end

    local tbPlayerData = GetMapPlayer(nMapIdx) or {};
    local nOldPlayerIdx = PlayerIndex;
    for i = 1, getn(tbPlayerData) do
        PlayerIndex = tbPlayerData[i];
        SetDeathPunish(1);
        local szMsg = "Th�i gian mi�n tr�ng ph�t PK �� h�t!";
        Msg2Player(szMsg);
        TaskTip(szMsg);
        PlayerIndex = nOldPlayerIdx;
    end
    PlayerIndex = nOldPlayerIdx;
end
