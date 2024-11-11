Include("\\script\\class\\clause3.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\define.lua")
Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")
--Include("\\script\\misc\\data_state\\state.lua")
Include("\\script\\online_activites\\award.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")

msg = "Ch�c m�ng $n m� B�o R��ng ��a Huy�n Cung nh�n ���c $i";

T_YinBoxScript = {
    "\\script\\missions\\dixuangong\\npc\\box_yin1.lua",
    "\\script\\missions\\dixuangong\\npc\\box_yin1.lua",
    nil,
    "\\script\\missions\\dixuangong\\npc\\box_yin1.lua",
    "\\script\\missions\\dixuangong\\npc\\box_yin1.lua",
    "\\script\\missions\\dixuangong\\npc\\box_yin1.lua",
    nil,
}

T_YIN_BOX_IDX = {}
function remove_yin_box()
    for i, v in T_YIN_BOX_IDX do
        if GetNpcName(i) == "R��ng B�c" then
            SetNpcLifeTime(i, 0);
        end
    end
    T_YIN_BOX_IDX = {}
end

function create_box_yin(m, x, y, nStage)
    if g_WCFG_DIAHUYENCUNG.bDisableDropBox == WEnv.TRUE then
        return WEnv.RETCODE_NOTOPEN;
    end

    if not T_YinBoxScript[nStage] then
        return
    end
    --local m, x, y = GetNpcWorldPos(nNpcIdx);
    local x2, y2 = x + random(-5, 5), y + random(-5, 5);
    local npc = CreateNpc("yinbaoxiang", "R��ng B�c", m, x2, y2);
    if npc and npc > 0 then
        T_YIN_BOX_IDX[npc] = 1
        --SetNpcLifeTime(npc, 180);
        SetNpcScript(npc, T_YinBoxScript[nStage]);
    else
        print("create dixuangong yinbaoxiang fail")
    end
end

tAward = {
    randMulti = 1,
    subclauses = {
        { { "C�y B�t Nh� nh�", { 2, 0, 504, 1, 1 }, nil, { 604800 } }, 500 },
        { { "C�y B�t Nh�", { 2, 0, 398, 1, 1 }, nil, { 604800 } }, 200 },
        { { "C�y T� Linh", { 2, 1, 30269, 1, 1 }, nil, { 604800 } }, 500 },
        { { "B�ch C�u Ho�n", { 2, 1, 270, 1, 1 }, nil, { 604800 } }, 700 },
        { { "��i B�ch C�u ho�n", { 2, 1, 1007, 1, 1 }, nil, { 604800 } }, 700 },
        { { "B�ch C�u Ti�n ��n", { 2, 1, 1008, 1, 1 }, nil, { 604800 } }, 600 },
        { { "��i Nh�n s�m", { 2, 0, 553, 1, 1 }, nil, { 604800 } }, 500 },
        --{{"Ӣ��ѫ��", {2, 1, 30499, 1, 4}, nil, nil}, 800},
        { { "Hu�n ch��ng anh h�ng", { 2, 1, 30499, 2, 1 }, nil, nil }, 600 },
        { { "Hu�n ch��ng anh h�ng", { 2, 1, 30499, 4, 1 }, nil, nil }, 200 },
        { { "Hu�n ch��ng anh h�ng", { 2, 1, 30499, 10, 1 }, nil, nil }, 50 },
        { { "M�nh Thi�n M�n", { 2, 1, 30410, 2, 1 }, nil, nil }, 400 },
        { { "M�nh Thi�n M�n", { 2, 1, 30410, 4, 1 }, nil, nil }, 100 },
        { { "M�nh Thi�n M�n", { 2, 1, 30410, 20, 1 }, msg, nil }, 20 },
        { { "Thi�n M�n Kim L�nh", { 2, 1, 30370, 1, 1 }, msg, nil }, 1 },
        -- {{"��������", {0, 152, 26, 1, 1}, nil, nil}, 50},
        -- {{"��Ѫ����", {0, 152, 27, 1, 1}, nil, nil}, 50},
        -- {{"���ι���", {0, 152, 28, 1, 1}, nil, nil}, 50},
        { { "Ho�ng Kim ��i H�ng Bao (tr�ng)", { 2, 1, 538, 1, 1 }, nil, { 1296000 } }, 500 },
        { { "B�ch Kim ��i H�ng Bao (kh�ng)", { 2, 1, 30228, 1, 1 }, nil, { 1296000 } }, 100 },
        { { "�o kho�c Hi�p C�t", { 0, 152, 29, 1, 1 }, nil, nil }, 30 },
        { { "�o kho�c Q�y Ph�", { 0, 152, 30, 1, 1 }, nil, nil }, 30 },
        { { "�o kho�c ��ng V�n", { 0, 152, 31, 1, 1 }, nil, nil }, 30 },
        { { "Phi�u ��i Ngo�i Trang", { 2, 1, 31233, 1, 1 }, nil, nil }, 500 },
        { { "Nh�n S�m V�n N�m", { 2, 1, 30071, 1, 1 }, nil, nil }, 784 },
        { { "T�i �� Qu� C�p 1", { 2, 1, 30998, 1, 1 }, nil, nil }, 300 },
        { { "T�i �� Qu� C�p 2", { 2, 1, 30999, 1, 1 }, nil, nil }, 300 },
        { { "T�i �� Qu� C�p 3", { 2, 1, 31000, 1, 1 }, nil, nil }, 150 },
        { { "T�i �� Qu� C�p 4", { 2, 1, 31001, 1, 1 }, nil, nil }, 50 },
        { { "Qu�n C�ng Ch��ng Huy Ho�ng", { 2, 1, 9977, 1, 1 }, nil, nil }, 100 },

        { { "Kinh M�ch Ng�n Nh�n", { 2, 1, 30731, 1, 1 }, nil, nil }, 500 },
        { { "M�nh Th� C��i", { 2, 1, 31386, 1, 1 }, nil, nil }, 500 },
        { { "Linh Ngh�", { 0, 105, 201, 1, 1, -1, -1, -1, -1, -1, -1 }, msg, nil }, 1 },
        { { "Phong S��ng Ki�m", { 0, 105, 209, 1, 1, -1, -1, -1, -1, -1, -1 }, msg, nil }, 1 },
        { { "M�nh Phi Phong Kim X� Lv6", { 2, 1, 31385, 5, 1 }, nil, nil }, 638 },
        { { "M�nh Phi Phong Kim X� Lv7", { 2, 1, 31399, 1, 1 }, nil, nil }, 500 },
        { { "Phi Phong S�t Lang", { 0, 152, 35, 1, 1 }, msg, nil }, 5 },
        { { "Phi Phong Nhu� Nha", { 0, 152, 36, 1, 1 }, msg, nil }, 5 },
        { { "Phi Phong M�ng S�t", { 0, 152, 37, 1, 1 }, msg, nil }, 5 },
    },
    giveClause = ClauseRandom.giveClause,
    give = ClauseRandom.giveClause,
}

needItem = { T_TIANJIAOLING[4], { T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_OPEN_BOX_TIANJIAOLING_NEED } };

tTemp = {};

function on_open_box_yin()
    local npcIdx = GetTargetNpc();
    if GetMissionV(MV_DAYE_2) == 0 then
        Say(format("M� [R��ng B�c] c�n 1 [Thi�n Ki�u L�nh] (Ng� C�c c� b�n).", N_OPEN_BOX_TIANJIAOLING_NEED),
                2,
                "\n x�c nh�n m�/#IamDaye(" .. npcIdx .. ")",
                "\n h�y m�/nothing");
        return
    else
        speLoot(npcIdx);
    end
end

function IamDaye(npcIdx)
    local daye = GetMissionV(MV_DAYE_2);

    if 0 ~= daye then
        Talk(1, "", "�� c� ng��i m� r��ng n�y r�i");
        return 0;
    end

    if DelItem(T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_OPEN_BOX_TIANJIAOLING_NEED) == 1 then
        SetMissionV(MV_DAYE_2, PlayerIndex);
        SetMissionV(MV_LAO_ER_2, PlayerIndex);
        gf_ModifyTask(TASKID_DXG_SCORE, N_OPEN_BOX_TIANJIAOLING_NEED, TASK_ACCESS_CODE_DXG_MISSION);
        speLoot(npcIdx);
        --����ʥ���俪������ͳ��
        AddRuntimeStat(1, 11, 0, 1);
        --����������ͨ����������ͳ��
        AddRuntimeStat(1, 13, 0, N_OPEN_BOX_TIANJIAOLING_NEED);
        --2Xu�
        vaf_award_api("tDXGYinBox")
        FireEvent("event_mission_box_award", "dixuangong", "silver", 0)
        FireEvent("event_ib_cost", T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_OPEN_BOX_TIANJIAOLING_NEED)
    else
        Talk(1, "", "Tr�n ng��i kh�ng c� [Thi�n Ki�u L�nh], kh�ng th� m� <color=green>R��ng B�c<color>. [Thi�n Ki�u L�nh] c� th� mua trong <color=yellow>Ng� C�c<color>");
    end
end

function getLootSeting()
    return tAward.subclauses;
end

function getLootItem()
    local tClause = getLootSeting();

    local nMax = 0;
    for i = 1, getn(tClause) do
        nMax = nMax + tClause[i][2];
    end
    local rnd = random(1, nMax);
    for i = 1, getn(tClause) do
        rnd = rnd - tClause[i][2];
        if rnd <= 0 then
            return i, tClause[i][1];
        end
    end
    print("[getLootItem] [error random] [nMax=%d, rnd=%d]", nMax, rnd);
    assert();
end

function speLoot(npcIdx)
    local daye = GetMissionV(MV_DAYE_2);
    if daye == 0 then
        return 0;
    end
    local tSel = {
        "K�t th�c ��i tho�i/nothing",
    }
    local OldPlayerIndex = PlayerIndex;
    if daye == PlayerIndex then
        local player_name = ""
        for i = 1, GetTeamSize() do
            PlayerIndex = GetTeamMember(i);
            if PlayerIndex ~= OldPlayerIndex then
                player_name = GetName();
                player_name = zgc_pub_name_replace(player_name, "/", "-");
                player_name = zgc_pub_name_replace(player_name, "|", "-");
                player_name = zgc_pub_name_replace(player_name, ":", "-");
                tinsert(tSel, 1, "Ta c�n mang ph�n th��ng ph�n cho " .. player_name .. "/#lootAwardOther(" .. PlayerIndex .. "," .. npcIdx .. ")");
            end
        end
        PlayerIndex = OldPlayerIndex;
        tinsert(tSel, 1, "Ta mu�n nh�n ph�n th��ng/#lootAward(" .. PlayerIndex .. "," .. npcIdx .. ")");
    end

    local nLootItemId = GetMissionV(MV_LOOT_ID_2);
    if nLootItemId == 0 then
        nLootItemId = getLootItem();
        SetMissionV(MV_LOOT_ID_2, nLootItemId);
    end

    local tClause = getLootSeting();
    local tLootItem = tClause[nLootItemId][1];
    local nCount = 1;
    if tLootItem[2] and type(tLootItem[2]) == "table" then
        nCount = tLootItem[2][4];
    end
    local msg = format("<color=yellow>[%s]x%d<color>", tLootItem[1], nCount);
    Say("<color=green>B�o r��ng<color>: � ��y c� " .. msg, getn(tSel), tSel);
end

function lootAwardOther(player_index, box_index)
    local player_index_save = PlayerIndex
    --�жϸ������Ƿ����ڸö�����
    local index_chg_chk_flag = 0
    local team_size = GetTeamSize()
    if team_size ~= 0 then
        index_chg_chk_flag = zgc_pub_same_team_chk(player_index)
    else
        index_chg_chk_flag = 1
    end
    if index_chg_chk_flag ~= 1 then
        Talk(1, "", "<color=green>Ch� �<color>: Xin m�i h�y ki�m tra l�i nh�ng ng��i m� b�n ph�n chia c� ph�i c� c�ng <color=yellow>t� ��i<color> v�i b�n!")
        return
    end
    --�������Ŀռ为�ؼ��
    PlayerIndex = player_index
    local s_palyer_name = GetName()
    if GetFreeItemRoom() < 3 then
        Talk(1, "", "<color=green>Th�ng b�o<color>: <color=yellow>H�nh trang<color> c�c h� kh�ng ��!")
        PlayerIndex = player_index_save
        Talk(1, "", "<color=green>Th�ng b�o<color>: : <color=green>" .. s_palyer_name .. "<color><color=yellow>H�nh trang<color> �� ��y, kh�ng th� ph�n ph�i!")
        return
    end

    PlayerIndex = player_index_save
    lootAward(player_index, box_index)
end

function lootAward(player_index, box_index)
    local player_index_save = PlayerIndex

    PlayerIndex = player_index;
    if gf_JudgeRoomWeight(3, 100, "") ~= 1 then
        return
    end
    PlayerIndex = player_index_save;

    local nLootItemId = GetMissionV(MV_LOOT_ID_2);
    if nLootItemId == 0 then
        nLootItemId = getLootItem();
    end
    local tLoot = getLootSeting()[nLootItemId][1];
    SetMissionV(MV_LOOT_ID_2, 0);
    SetMissionV(MV_DAYE_2, 0);
    SetMissionV(MV_LAO_ER_2, 0);

    SetNpcLifeTime(box_index, 0);
    PlayerIndex = player_index;
    gf_SetLogCaption("dixuangong:ib_box2");
    Clause3.giveClause(tLoot);
    gf_SetLogCaption("");
    --ͳ�Ƶ���
    if tLoot[1] == "Thi�n M�n Kim L�nh" then
        AddRuntimeStat(1, 14, 0, tLoot[2][4]);
    elseif tLoot[1] == "C�p 3 Luy�n L� Thi�t" then
        AddRuntimeStat(1, 16, 0, tLoot[2][4]);
    elseif tLoot[1] == "C�p 3 T�y T�m Th�ch" then
        AddRuntimeStat(1, 17, 0, tLoot[2][4]);
    elseif tLoot[1] == "B� Ng�n To�n" then
        AddRuntimeStat(1, 18, 0, tLoot[2][4]);
    elseif tLoot[1] == "B� Ng�n Ch�y" then
        AddRuntimeStat(1, 19, 0, tLoot[2][4]);
    end

    PlayerIndex = player_index_save;
end
