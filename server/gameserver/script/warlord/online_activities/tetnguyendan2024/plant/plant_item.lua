Include("\\script\\warlord\\online_activities\\tetnguyendan2024\\plant\\head.lua");
Include("\\script\\warlord\\online_activities\\tetnguyendan2024\\event_head.lua");
----------------------------------------------------------------------------------------------------
-- Replace:
-- self: EVENT_SINH_TO_LUA_MACH
-- function prefix: SinhToLuaMach_
----------------------------------------------------------------------------------------------------

function OnUse(nItem)
    local self = "H¹t Gièng C©y Tø Linh";
    local nCountCayTL = GetTask(WTASKID_DAYLY_CAYTULINH);

    --if checkEventDate() == 0 then
    --    Talk(1, "", "H¹t gièng ®· qu¸ h¹n, kh«ng thÓ mäc mÇm ®­îc.");
    --    return
    --end
    if nCountCayTL >=30 then
        Talk(1, "", "B¹n ®· thu ho¹ch ®ñ 30 lÇn trong ngµy. Kh«ng thÓ trång thªm!");
        return 0;
    end
    local nItemG, nItemD, nItemP = GetItemInfoByIndex(nItem);

    if MATERIAL_ITEM[nItemP] == nil then
        Talk(1, "", "Lo¹i c©y gièng kh«ng hîp lÖ.");
        return 0;
    end

    if GetLevel() < PLANT_ITEM_LV_REQ then
        Talk(1, "", "§¹i hiÖp cÇn ®¹t cÊp ®é ".. PLANT_ITEM_LV_REQ .." trë lªn míi trång ®­îc c©y nµy.");
        return 0;
    end
    if KsgPlayer:GetBigLevel() < 1099 then
        Talk(1, "", "§¹i hiÖp ch­a ®ñ cÊp ®Ó trång ®­îc c©y nµy.");
        return 0;
    end

    if validate_map() ~= 1 then
        Talk(1, "", "§Þa ®iÓm n¬i ®©y kh«ng thÝch hîp ®Ó trång c©y, ®¹i hiÖp h·y ra gi÷a b¶n ®å Linh B¶o S¬n ®Ó c©y ®­îc sinh tr­ëng ph¸t triÓn tèt nhÊt.");
        return 0;
    end

    --local szGoldTime = "§Æc biÖt khi thu ho¹ch trong khung giê vµng: <color=gold>";
    --for _,tbTime in pairs(AWARD_GOLD_TIME) do --check khung giê vµng
    --	szGoldTime = szGoldTime .. tbTime[3] .. ", ";
    --end
    --szGoldTime = szGoldTime .. "<color>sÏ nhËn ®­îc <color=green>10 "..AWARD_ITEM[nItemP][1].."<color>";
    local szGoldTime = "";
    local nCountCayTL = GetTask(WTASKID_DAYLY_CAYTULINH);
    local szRandItem = AWARD_ITEM[nItemP].tbRand[1][2] .. '-'.. AWARD_ITEM[nItemP].tbRand[getn(AWARD_ITEM[nItemP].tbRand)][2] .. ' ';

    Say("<color=green>" .. MATERIAL_ITEM[nItemP][1] .. ":<color>§¹i hiÖp ®· thu ho¹ch C©y Tø Linh: "..nCountCayTL.." lÇn trong ngµy.\n N¬i ®©y sinh khÝ thÝch hîp cho h¹t gièng ph¸t triÓn tèt. §¹i hiÖp cã muèn gieo h¹t nµy kh«ng?\nKhi thu ho¹ch, sÏ nhËn ®­îc nhiÒu phÇn th­ëng ", 2, {
        format("§óng, t¹i h¹ x¸c nhËn muèn trång c©y/#plantAction(%d)", nItem),
        "N¬i ®©y thËt nguy hiÓm, t¹i h¹ sÏ quay l¹i sau/nothing"
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
                Talk(1, "", "§¹i hiÖp ®ang trång 1 c©y nµy råi, h·y mau ®i t×m ®Ó thu ho¹ch kÞp thêi nhÐ.");
                return 0;
            end
        end
    end

    if DelItem(WATER_CONSUME_ITEM[1], WATER_CONSUME_ITEM[2], WATER_CONSUME_ITEM[3], WATER_CONSUME_ITEM[4]) ~= 1 then
        Talk(1, "", "§Ó trång ®­îc c©y, ®¹i hiÖp cÇn chuÈn bÞ Ýt nhÊt " .. WATER_CONSUME_ITEM[4] .. " Lé Thñy.");
        return 0;
    end

    if DelItemByIndex(nItem, 1) ~= 1 then
        Talk(1, "", "Kh«ng thÓ tiªu thô h¹t gièng, xin thö l¹i.");
        return 0;
    end

    local npcTreeIndex = CreateNpc(MATERIAL_ITEM[nItemP][2], format(MATERIAL_ITEM[nItemP][1].." cña (%s)", szName), nMapID, nX, nY);
    if npcTreeIndex == 0 then
        gf_WriteLog("SinhToLuaMach_plant_err", "Lóc trång c©y, CreateNpc lµ 0. Tham sè CreateNpc lµ: " .. MATERIAL_ITEM[nItemP][2] .. " (2,1," .. nItemP .. "), do " .. szName .. " trång, " .. nMapID .. ", " .. nX .. ", " .. nY);
        Talk(1, "", "Cã vÊn ®Ò x¶y ra khi gieo h¹t gièng, xin liªn hÖ ADMIN kiÓm tra.");
        return 0;
    end
    --local nItemP1={50217,50216}
    SetUnitCurStates(npcTreeIndex, 1, nPlayerId);
    WLib:SetUnitCurStates(npcTreeIndex, 5, GetTime());
    WLib:SetUnitCurStates(npcTreeIndex, 6, nItemP);

    SetNpcLifeTime(npcTreeIndex, PLANT_LIFE_TIME);
    SetNpcScript(npcTreeIndex, "\\script\\warlord\\online_activities\\tetnguyendan2024\\plant\\plant_npc.lua");
    SetDeathScript("\\script\\warlord\\online_activities\\tetnguyendan2024\\plant\\player_death.lua");

    StartTimeGuage("Thu ho¹ch", PLANT_CONSUME_TIME, 0, 1);

    Say("§¹i hiÖp võa gieo xuèng 1 " .. MATERIAL_ITEM[nItemP][1] .. ". Cã thÓ thu ho¹ch sau " .. PLANT_CONSUME_TIME .. " gi©y, <color=yellow>nÕu trong 1 phót kh«ng thu ho¹ch, c©y sÏ giµ vµ chÕt ®i.<color>", 0);

    gf_WriteLog("SinhToLuaMach_plant", format("Tr«ng c©y sù kiÖn (2,1," .. nItemP .. ") - Idx: %d", npcTreeIndex));
end
