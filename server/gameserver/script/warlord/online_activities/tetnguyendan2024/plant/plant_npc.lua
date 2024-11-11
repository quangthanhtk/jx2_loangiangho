Include("\\script\\warlord\\online_activities\\tetnguyendan2024\\plant\\head.lua");
----------------------------------------------------------------------------------------------------
-- Replace:
-- self: EVENT_SINH_TO_LUA_MACH
-- function prefix: SinhToLuaMach_
----------------------------------------------------------------------------------------------------

function main()
    local nNpcIdx = GetTargetNpc()
    if GetUnitCurStates(nNpcIdx, 1) ~= GetPlayerID() then
        Say("§©y kh«ng ph¶i lµ c©y b¹n trång.", 0);
        return 0;
    end

    local nCreateTime = GetUnitCurStates(nNpcIdx, 5);
    local nItemP = GetUnitCurStates(nNpcIdx, 6);
    --Talk(1, "", "Lo¹i c©y"..nItemP.." gièng kh«ng hîp lÖ.:"..nCreateTime.."::"..GetTime().."::"..GetUnitCurStates(nNpcIdx, 1));

    if GetTime() - nCreateTime < PLANT_CONSUME_TIME then
        Say("<color=green>".. MATERIAL_ITEM[nItemP][1] ..": <color>C©y hiÖn t¹i ®ang sinh tr­ëng. Cã thÓ thu ho¹ch sau " .. (PLANT_CONSUME_TIME - (GetTime() - nCreateTime)) .. " gi©y n÷a.", 0);
        return 0;
    end
    Say("<color=green>".. MATERIAL_ITEM[nItemP][1] ..": <color>C©y ®· lín, cã thÓ thu ho¹ch. NÕu sau " .. (PLANT_LIFE_TIME - (GetTime() - nCreateTime)) .. " gi©y kh«ng thu ho¹ch c©y sÏ chÕt ®i.", 2, {
        format("Thu ho¹ch c©y nµy/#plant_consume(" .. nNpcIdx .. ")"),
        "T¹m thêi ®Ó ®Êy/nothing"
    });
end

function plant_consume(nNpcIdx)
    if GetUnitCurStates(nNpcIdx, 1) ~= GetPlayerID() then
        Say("§©y kh«ng ph¶i lµ c©y b¹n trång.", 0);
        return 0;
    end
    local nItemP = GetUnitCurStates(nNpcIdx, 6);
    if gf_CheckInv(2, 10, "") ~= 1 then
        return 0;
    end

    if MATERIAL_ITEM[nItemP][1] ~= strsub(GetNpcName(nNpcIdx), 1, strlen(MATERIAL_ITEM[nItemP][1])) then
        gf_WriteLogEx('SinhToLuaMach_plant', "Lçi kh«ng x¸c ®Þnh ®­îc c©y: ".. GetNpcName(nNpcIdx));
        Say("Lçi kh«ng x¸c ®Þnh ®­îc c©y.", 0);
        return 0;
    end


    SetNpcScript(nNpcIdx, "");
    SetNpcLifeTime(nNpcIdx, 0);
    SetDeathScript("");

    if AWARD_ITEM[nItemP] == nil then
        gf_WriteLog("SinhToLuaMach_plant_err", format("Lçi kh«ng x¸c ®Þnh ®­îc nItemP: %d - Idx: %d", nItemP, nNpcIdx));
        return 0;
    end

    gf_WriteLog("SinhToLuaMach_plant", format("Thu ho¹ch thµnh c«ng c©y sù kiÖn - Idx: %d", nNpcIdx));
    WAward:CayTuLinh_ThuHoach();
    --local nRand = random(1, 100);
    --local tbRand = AWARD_ITEM[nItemP].tbRand;
    --for i=1, getn(tbRand) do
    --    if nRand <= tbRand[i][1] then
    --        AWARD_ITEM[nItemP].tbProp[4] = tbRand[i][2];
    --        break;
    --    end
    --end
    --local nHM = tonumber(date("%H%M"));
    --for _,tbTime in pairs(AWARD_GOLD_TIME) do --check khung giê vµng
    --	if nHM >= tbTime[1] and nHM <= tbTime[2] then
    --		nQtt = 10;
    --	end
    --end

    --gf_AddItemEx2(AWARD_ITEM[nItemP].tbProp, AWARD_ITEM[nItemP].szName, "SinhToLuaMach_plant", "Thu ho¹ch c©y: " .. AWARD_ITEM[nItemP].szName .. " - Idx: " .. nNpcIdx, 0, 1);
end











