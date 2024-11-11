Import("\\script\\ksgvn\\lib.lua")
Include('\\script\\ksgvn\\event\\bachbaoruong\\bachbaoruong_head.lua')

function bachbaoruong_CreateBoxes()
    local nToday = KsgDate:Today()
    --if nToday >= EVENT_BACHBAORUONG_START_DATE and nToday <= EVENT_BACHBAORUONG_END_DATE then
    if nToday >= EVENT_BACHBAORUONG_START_DATE then
        for i = 1, getn(_g_tbBoxPos) do
            local nMapId, nX, nY = KsgLib:UnPack(_g_tbBoxPos[i])
            local npcIndex = CreateNpc("tongbaoxiang", "R��ng B�u V�t", nMapId, nX, nY)
            SetNpcScript(npcIndex, "\\script\\ksgvn\\event\\bachbaoruong\\npc\\npc_treasure_box.lua")
        end
        for i = 1, getn(_g_tbBoxPosLocal) do
            local nMapId, nX, nY = KsgLib:UnPack(_g_tbBoxPosLocal[i])
            local npcIndex = CreateNpc("yinbaoxiang", "R��ng B�u V�t-Th�", nMapId, nX, nY)
            SetNpcScript(npcIndex, "\\script\\ksgvn\\event\\bachbaoruong\\npc\\npc_treasure_box.lua")
        end
    end
end

function _bachbaoruong_OpenBox(nOpenType)
    if not _g_tbExchangeBox[nOpenType] then
        return KsgNpc:Talk(g_szNpcName .. "Kh�ng th� ch�n h�nh th�c m� r��ng n�y!")
    end

    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk(g_szNpcName .. "Tr�ng th�i hi�n t�i kh�ng th� m� r��ng.")
    end
    
    local nOpenedBox = KsgTask:GetPosValue(TASKID_EVENT_BACHBAORUONG, 1, 4)
    if nOpenedBox >= MAX_OPEN_BOX_COUNT then
        return KsgNpc:FormalTalk(g_szNpcName, format("�� m� r��ng %d l�n r�i, kh�ng th� m� th�m n�a.", MAX_OPEN_BOX_COUNT))
    end

    if nOpenType == 2 and KsgTask:GetPosValue(WTASKID_BACHBAORUONG_OPENTYPE_LIMIT, 4, 8) >= _g_tbExchangeBox[nOpenType].nLimit then
        return KsgNpc:FormalTalk(g_szNpcName, format("�� m� r��ng %d l�n b�ng v�ng r�i, h�y th� c�ch kh�c nh�.", _g_tbExchangeBox[nOpenType].nLimit));
    end

    if not KsgLib:HasEnoughBagRoom(5, 500) then
        return
    end

    if not KsgLib:CheckMaterial(_g_tbExchangeBox[nOpenType].tbCondition) then
        return
    end

    local nBoxIndex = GetTargetNpc()

    if GetUnitCurStates(nBoxIndex, 2) ~= 1 or (GetTime() - GetUnitCurStates(nBoxIndex, 1)) > 3 then
        KsgTask:SetPosValue(TASKID_EVENT_BACHBAORUONG, nOpenType, 5, 5)
        KsgLib:SetUnitCurStates(nBoxIndex, 1, GetTime())
        KsgLib:SetUnitCurStates(nBoxIndex, 2, 1)
        DoWait(200, 201, 1)
    else
        return KsgNpc:Talk(g_szNpcName .. "Hi�n �� c� ng��i kh�c m� b�o r��ng!")
    end

end

function bachbaoruong_GiveAward()
    local nOpenType = KsgTask:GetPosValue(TASKID_EVENT_BACHBAORUONG, 5, 5)
    if not _g_tbExchangeBox[nOpenType] then
        return KsgNpc:Talk(g_szNpcName .. "Kh�ng th� ch�n h�nh th�c m� r��ng n�y!")
    end
    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk(g_szNpcName .. "Tr�ng th�i hi�n t�i kh�ng th� nh�n th��ng m� r��ng.")
    end
    if not KsgLib:HasEnoughBagRoom(5, 500) then
        return
    end

    local nOpenedBox = KsgTask:GetPosValue(TASKID_EVENT_BACHBAORUONG, 1, 4)
    --if nOpenedBox >= MAX_OPEN_BOX_COUNT then
    --    return KsgNpc:FormalTalk(g_szNpcName, format("�� m� r��ng %d l�n r�i, kh�ng th� m� th�m n�a.", MAX_OPEN_BOX_COUNT))
    --end

    if nOpenType == 2 and KsgTask:GetPosValue(WTASKID_BACHBAORUONG_OPENTYPE_LIMIT, 4, 8) >= _g_tbExchangeBox[nOpenType].nLimit then
        return KsgNpc:FormalTalk(g_szNpcName, format("�� m� r��ng %d l�n b�ng v�ng r�i, h�y th� c�ch kh�c nh�.", _g_tbExchangeBox[nOpenType].nLimit));
    end

    if KsgLib:PayMaterial(_g_tbExchangeBox[nOpenType].tbCondition) then

        KsgAward:Give({ nExp = BOX_AWARD_EXP })
        local tbRandomAward = KsgLib:Random(_g_tbBoxAward)
        if tbRandomAward then
            KsgAward:Give(tbRandomAward, "B�ch b�o r��ng - Th��ng may m�n")
        end

        local nNextOpenBoxCount = nOpenedBox + 1
        if _g_tbAccumulateAward[nNextOpenBoxCount] then
            KsgAward:Give(_g_tbAccumulateAward[nNextOpenBoxCount], "B�ch b�o r��ng - Th��ng m�c " .. nNextOpenBoxCount)
        end

        KsgTask:SetPosValue(TASKID_EVENT_BACHBAORUONG, nNextOpenBoxCount, 1, 4);
        if nOpenType == 2 then
            KsgTask:SetPosValue(WTASKID_BACHBAORUONG_OPENTYPE_LIMIT, KsgTask:GetPosValue(WTASKID_BACHBAORUONG_OPENTYPE_LIMIT, 4, 8) + 1, 4, 8);
        end
    end

end
