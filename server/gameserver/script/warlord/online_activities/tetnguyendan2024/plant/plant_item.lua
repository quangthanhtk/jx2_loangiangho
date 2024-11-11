Include("\\script\\warlord\\online_activities\\tetnguyendan2024\\plant\\head.lua");
Include("\\script\\warlord\\online_activities\\tetnguyendan2024\\event_head.lua");
----------------------------------------------------------------------------------------------------
-- Replace:
-- self: EVENT_SINH_TO_LUA_MACH
-- function prefix: SinhToLuaMach_
----------------------------------------------------------------------------------------------------

function OnUse(nItem)
    local self = "H�t Gi�ng C�y T� Linh";
    local nCountCayTL = GetTask(WTASKID_DAYLY_CAYTULINH);

    --if checkEventDate() == 0 then
    --    Talk(1, "", "H�t gi�ng �� qu� h�n, kh�ng th� m�c m�m ���c.");
    --    return
    --end
    if nCountCayTL >=30 then
        Talk(1, "", "B�n �� thu ho�ch �� 30 l�n trong ng�y. Kh�ng th� tr�ng th�m!");
        return 0;
    end
    local nItemG, nItemD, nItemP = GetItemInfoByIndex(nItem);

    if MATERIAL_ITEM[nItemP] == nil then
        Talk(1, "", "Lo�i c�y gi�ng kh�ng h�p l�.");
        return 0;
    end

    if GetLevel() < PLANT_ITEM_LV_REQ then
        Talk(1, "", "��i hi�p c�n ��t c�p �� ".. PLANT_ITEM_LV_REQ .." tr� l�n m�i tr�ng ���c c�y n�y.");
        return 0;
    end
    if KsgPlayer:GetBigLevel() < 1099 then
        Talk(1, "", "��i hi�p ch�a �� c�p �� tr�ng ���c c�y n�y.");
        return 0;
    end

    if validate_map() ~= 1 then
        Talk(1, "", "��a �i�m n�i ��y kh�ng th�ch h�p �� tr�ng c�y, ��i hi�p h�y ra gi�a b�n �� Linh B�o S�n �� c�y ���c sinh tr��ng ph�t tri�n t�t nh�t.");
        return 0;
    end

    --local szGoldTime = "��c bi�t khi thu ho�ch trong khung gi� v�ng: <color=gold>";
    --for _,tbTime in pairs(AWARD_GOLD_TIME) do --check khung gi� v�ng
    --	szGoldTime = szGoldTime .. tbTime[3] .. ", ";
    --end
    --szGoldTime = szGoldTime .. "<color>s� nh�n ���c <color=green>10 "..AWARD_ITEM[nItemP][1].."<color>";
    local szGoldTime = "";
    local nCountCayTL = GetTask(WTASKID_DAYLY_CAYTULINH);
    local szRandItem = AWARD_ITEM[nItemP].tbRand[1][2] .. '-'.. AWARD_ITEM[nItemP].tbRand[getn(AWARD_ITEM[nItemP].tbRand)][2] .. ' ';

    Say("<color=green>" .. MATERIAL_ITEM[nItemP][1] .. ":<color>��i hi�p �� thu ho�ch C�y T� Linh: "..nCountCayTL.." l�n trong ng�y.\n N�i ��y sinh kh� th�ch h�p cho h�t gi�ng ph�t tri�n t�t. ��i hi�p c� mu�n gieo h�t n�y kh�ng?\nKhi thu ho�ch, s� nh�n ���c nhi�u ph�n th��ng ", 2, {
        format("��ng, t�i h� x�c nh�n mu�n tr�ng c�y/#plantAction(%d)", nItem),
        "N�i ��y th�t nguy hi�m, t�i h� s� quay l�i sau/nothing"
    });
end

function plantAction(nItem)
    local szName = GetName();
    local nPlayerId = GetPlayerID();
    local nItemG, nItemD, nItemP = GetItemInfoByIndex(nItem);
    local nMapID, nX, nY = GetWorldPos();

    local tNpcs = GetMapNpcIdx(nMapID);
    if type(tNpcs) == "table" then
        for k, v in tNpcs do
            if GetUnitCurStates(v, 1) == nPlayerId and GetUnitCurStates(v, 6) == nItemP then
                Talk(1, "", "��i hi�p �ang tr�ng 1 c�y n�y r�i, h�y mau �i t�m �� thu ho�ch k�p th�i nh�.");
                return 0;
            end
        end
    end

    if DelItem(WATER_CONSUME_ITEM[1], WATER_CONSUME_ITEM[2], WATER_CONSUME_ITEM[3], WATER_CONSUME_ITEM[4]) ~= 1 then
        Talk(1, "", "�� tr�ng ���c c�y, ��i hi�p c�n chu�n b� �t nh�t " .. WATER_CONSUME_ITEM[4] .. " L� Th�y.");
        return 0;
    end

    if DelItemByIndex(nItem, 1) ~= 1 then
        Talk(1, "", "Kh�ng th� ti�u th� h�t gi�ng, xin th� l�i.");
        return 0;
    end

    local npcTreeIndex = CreateNpc(MATERIAL_ITEM[nItemP][2], format(MATERIAL_ITEM[nItemP][1].." c�a (%s)", szName), nMapID, nX, nY);
    if npcTreeIndex == 0 then
        gf_WriteLog("SinhToLuaMach_plant_err", "L�c tr�ng c�y, CreateNpc l� 0. Tham s� CreateNpc l�: " .. MATERIAL_ITEM[nItemP][2] .. " (2,1," .. nItemP .. "), do " .. szName .. " tr�ng, " .. nMapID .. ", " .. nX .. ", " .. nY);
        Talk(1, "", "C� v�n �� x�y ra khi gieo h�t gi�ng, xin li�n h� ADMIN ki�m tra.");
        return 0;
    end
    --local nItemP1={50217,50216}
    SetUnitCurStates(npcTreeIndex, 1, nPlayerId);
    WLib:SetUnitCurStates(npcTreeIndex, 5, GetTime());
    WLib:SetUnitCurStates(npcTreeIndex, 6, nItemP);

    SetNpcLifeTime(npcTreeIndex, PLANT_LIFE_TIME);
    SetNpcScript(npcTreeIndex, "\\script\\warlord\\online_activities\\tetnguyendan2024\\plant\\plant_npc.lua");
    SetDeathScript("\\script\\warlord\\online_activities\\tetnguyendan2024\\plant\\player_death.lua");

    StartTimeGuage("Thu ho�ch", PLANT_CONSUME_TIME, 0, 1);

    Say("��i hi�p v�a gieo xu�ng 1 " .. MATERIAL_ITEM[nItemP][1] .. ". C� th� thu ho�ch sau " .. PLANT_CONSUME_TIME .. " gi�y, <color=yellow>n�u trong 1 ph�t kh�ng thu ho�ch, c�y s� gi� v� ch�t �i.<color>", 0);

    gf_WriteLog("SinhToLuaMach_plant", format("Tr�ng c�y s� ki�n (2,1," .. nItemP .. ") - Idx: %d", npcTreeIndex));
end
