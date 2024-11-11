Include("\\script\\warlord\\online_activities\\tetnguyendan2024\\plant\\head.lua");
----------------------------------------------------------------------------------------------------
-- Replace:
-- self: EVENT_SINH_TO_LUA_MACH
-- function prefix: SinhToLuaMach_
----------------------------------------------------------------------------------------------------

function main()
    local nNpcIdx = GetTargetNpc()
    if GetUnitCurStates(nNpcIdx, 1) ~= GetPlayerID() then
        Say("��y kh�ng ph�i l� c�y b�n tr�ng.", 0);
        return 0;
    end

    local nCreateTime = GetUnitCurStates(nNpcIdx, 5);
    local nItemP = GetUnitCurStates(nNpcIdx, 6);
    --Talk(1, "", "Lo�i c�y"..nItemP.." gi�ng kh�ng h�p l�.:"..nCreateTime.."::"..GetTime().."::"..GetUnitCurStates(nNpcIdx, 1));

    if GetTime() - nCreateTime < PLANT_CONSUME_TIME then
        Say("<color=green>".. MATERIAL_ITEM[nItemP][1] ..": <color>C�y hi�n t�i �ang sinh tr��ng. C� th� thu ho�ch sau " .. (PLANT_CONSUME_TIME - (GetTime() - nCreateTime)) .. " gi�y n�a.", 0);
        return 0;
    end
    Say("<color=green>".. MATERIAL_ITEM[nItemP][1] ..": <color>C�y �� l�n, c� th� thu ho�ch. N�u sau " .. (PLANT_LIFE_TIME - (GetTime() - nCreateTime)) .. " gi�y kh�ng thu ho�ch c�y s� ch�t �i.", 2, {
        format("Thu ho�ch c�y n�y/#plant_consume(" .. nNpcIdx .. ")"),
        "T�m th�i �� ��y/nothing"
    });
end

function plant_consume(nNpcIdx)
    if GetUnitCurStates(nNpcIdx, 1) ~= GetPlayerID() then
        Say("��y kh�ng ph�i l� c�y b�n tr�ng.", 0);
        return 0;
    end
    local nItemP = GetUnitCurStates(nNpcIdx, 6);
    if gf_CheckInv(2, 10, "") ~= 1 then
        return 0;
    end

    if MATERIAL_ITEM[nItemP][1] ~= strsub(GetNpcName(nNpcIdx), 1, strlen(MATERIAL_ITEM[nItemP][1])) then
        gf_WriteLogEx('SinhToLuaMach_plant', "L�i kh�ng x�c ��nh ���c c�y: ".. GetNpcName(nNpcIdx));
        Say("L�i kh�ng x�c ��nh ���c c�y.", 0);
        return 0;
    end


    SetNpcScript(nNpcIdx, "");
    SetNpcLifeTime(nNpcIdx, 0);
    SetDeathScript("");

    if AWARD_ITEM[nItemP] == nil then
        gf_WriteLog("SinhToLuaMach_plant_err", format("L�i kh�ng x�c ��nh ���c nItemP: %d - Idx: %d", nItemP, nNpcIdx));
        return 0;
    end

    gf_WriteLog("SinhToLuaMach_plant", format("Thu ho�ch th�nh c�ng c�y s� ki�n - Idx: %d", nNpcIdx));
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
    --for _,tbTime in pairs(AWARD_GOLD_TIME) do --check khung gi� v�ng
    --	if nHM >= tbTime[1] and nHM <= tbTime[2] then
    --		nQtt = 10;
    --	end
    --end

    --gf_AddItemEx2(AWARD_ITEM[nItemP].tbProp, AWARD_ITEM[nItemP].szName, "SinhToLuaMach_plant", "Thu ho�ch c�y: " .. AWARD_ITEM[nItemP].szName .. " - Idx: " .. nNpcIdx, 0, 1);
end











