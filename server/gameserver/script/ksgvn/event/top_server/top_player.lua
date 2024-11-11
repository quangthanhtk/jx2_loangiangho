Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\event\\top_server\\top_server_head.lua")

-- Xem th�ng tin top m�n ph�i
function eventTop_QueryTopFaction()
    LIB_txtData:Init(FILENAME_TOP_ROUTE)
    LIB_txtData:LoadData()
    local szList = "Th�ng tin ph�n th��ng <color=yellow>Top 1 h� ph�i<color>: \n\n"
    local szList2 = szList
    local szList3 = szList
    for i = 1, getn(LIB_txtData.tbTextData) do
        if KsgPlayer:GetRouteName(i, 1) ~= "" then
            local nStatus = tonumber(LIB_txtData.tbTextData[i])
            local szStatus = "<color=gray>Ch�a nh�n<color>"
            if nStatus >= 1 then
                szStatus = "<color=green>�� nh�n<color>"
            end
            if i < 12 then
                szList = szList .. "Ph�i <color=gold>" .. KsgPlayer:GetRouteName(i) .. "<color>: " .. szStatus .. "\n"
            elseif i < 22 then
                szList2 = szList2 .. "Ph�i <color=gold>" .. KsgPlayer:GetRouteName(i) .. "<color>: " .. szStatus .. "\n"
            else
                szList3 = szList3 .. "Ph�i <color=gold>" .. KsgPlayer:GetRouteName(i) .. "<color>: " .. szStatus .. "\n"
            end
        end
    end
    Talk(3, "", szList, szList2, szList3)
end

-- Xem th�ng tin top 3 nv chuy�n sinh
function eventTop_QueryTopReborn()
    LIB_txtData:Init(FILENAME_TOP_REBORN)
    LIB_txtData:LoadData()
    local nCount = tonumber(LIB_txtData.tbTextData[1])
    local szHead = g_szNpcName .. "Top 3 nh�n v�t <color=yellow>��t chuy�n sinh 10 c�p 99 ��u ti�n<color>:\n\n"
    if nCount == 0 then
        return KsgNpc:Talk(szHead .. "<color=gray>Hi�n ch�a c� ai nh�n th��ng.<color>")
    end
    if nCount >= 3 then
        return KsgNpc:Talk(szHead .. "<color=green>Hi�n ph�n th��ng �� ph�t h�t.<color>")
    end
    KsgNpc:Talk(szHead .. format("Hi�n �� c� <color=gold>%d cao th� nh�n th��ng<color>.", nCount))
end

-- Xem th�ng tin top 1 nv qu�n c�ng 4m8
function eventTop_QueryTopHonor1()
    LIB_txtData:Init(FILENAME_TOP_HONOR1)
    LIB_txtData:LoadData()
    local szList = g_szNpcName .. "Th�ng tin ph�n th��ng <color=yellow>Top 1 nh�n s� ��u ti�n ��t 6.600.000 �i�m c�ng tr�ng chi�n tr��ng<color>: \n\n"
    local nNationRank = 0
    local szCamp
    for i = 1, 2 do
        nNationRank = tonumber(LIB_txtData.tbTextData[tonumber(i)])
        if nNationRank == 1 then
            szCamp = g_tbBattleCamps[i]
            break
        end
    end
    local szStatus = "<color=gray>Ch�a c� ch� nh�n<color>"
    if nNationRank >= 1 then
        szStatus = format("�� thu�c v� <color=gold>1 cao th� phe %s<color>", szCamp)
    end
    KsgNpc:Talk(szList .. szStatus)
end

-- Xem th�ng tin top 2 nv qu�n c�ng 3m6
function eventTop_QueryTopHonor2()
    LIB_txtData:Init(FILENAME_TOP_HONOR2)
    LIB_txtData:LoadData()
    local szList = g_szNpcName .. "Th�ng tin ph�n th��ng <color=yellow>Top 2 nh�n s� m�i phe ��t 5.400.000 �i�m c�ng tr�ng chi�n tr��ng<color>: \n\n"
    for i = 1, getn(LIB_txtData.tbTextData) do
        local nStatus = tonumber(LIB_txtData.tbTextData[i])
        local szStatus = "<color=gray>Ch�a c� ai nh�n<color>."
        if nStatus >= 1 then
            szStatus = format("<color=gold>�� c� %d cao th� nh�n th��ng<color>.", nStatus)
        end
        szList = szList .. "Phe <color=green>" .. g_tbBattleCamps[i] .. "<color>: " .. szStatus .. "\n"
    end
    KsgNpc:Talk(szList)
end


-- Nhan thuong cap toan may chu
function eventTop_ShowLevelAward()
    local nStartDate = KsgLib:GetSrvCfg('tbTimeTop').nStartDate
    local nEndDate = KsgLib:GetSrvCfg('tbTimeTop').nEndDate
    local tSay = {
        g_szNpcName .. "Ho�t ��ng <color=yellow>�ua Top Nh�n Th��ng<color> di�n ra t� ng�y<color=gold> " .. KsgDate:ToString(nStartDate) .. " ��n 24:00 " .. KsgDate:ToString(nEndDate) .. "<color>. Trong th�i gian n�y, qu� ��ng ��o c� th� ��n g�p ta �� nh�n c�c ph�n th��ng h�p d�n. Th�ng tin chi ti�t ho�t ��ng ��ng ��o c� th� xem t�i trang ch�."
    }
    for nIndex, tbLevelCfg in g_tbNewPlayerLevelAward do
        if KsgTask:GetBit(TASKID_TOP_LEVEL_AWARD, tbLevelCfg.nTaskBit) ~= 1 then
            tinsert(tSay, format("Nh�n th��ng %s/#getLevelAward(%d)", KsgLib:Level2String(tbLevelCfg.nRequireLevel), nIndex))
        end
    end
    if getn(tSay) == 1 then
        return KsgNpc:FormalTalk(g_szNpcName, "�� nh�n h�t to�n b� ph�n th��ng l�n n�y!")
    end
    tinsert(tSay, "\nT�m th�i ch�a mu�n nh�n/no")
    KsgNpc:SayDialog(tSay)
end

function getLevelAward(nIndex)
    if KsgTask:GetBit(TASKID_TOP_LEVEL_AWARD, g_tbNewPlayerLevelAward[nIndex].nTaskBit) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� �� nh�n ph�n th��ng n�y r�i!")
    end

    if not KsgLib:HasEnoughBagRoom(25, 1000) then
        return
    end

    if KsgLib:PayMaterial(g_tbNewPlayerLevelAward[nIndex].tbCondition) then
        KsgAward:Give(g_tbNewPlayerLevelAward[nIndex].tbAward)
        KsgTask:SetBit(TASKID_TOP_LEVEL_AWARD, g_tbNewPlayerLevelAward[nIndex].nTaskBit, 1)
    end
end

function eventTop_GetTopHonor1Award_Confirm()
    local nHonor = KsgPlayer:GetHonor(1)
    local nBattleCamp = 1
    if nHonor < 0 then
        nBattleCamp = 2
    end

    if KsgTask:GetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_HONOR2) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� �� nh�n ph�n th��ng c�ng tr�ng 5.400.000 r�i, kh�ng th� nh�n th�m ph�n th��ng n�y n�a!!")
    end

    if KsgTask:GetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_HONOR1) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� �� nh�n ph�n th��ng n�y r�i!")
    end

    LIB_txtData:Init(FILENAME_TOP_HONOR1)
    LIB_txtData:LoadData()

    local nNationRank = 0
    for i = 1, 2 do
        nNationRank = tonumber(LIB_txtData.tbTextData[tonumber(i)])
        if not nNationRank then
            -- If data file is empty
            nNationRank = 0
        end
        if nNationRank == 1 then
            break
        end
    end

    if tonumber(nNationRank) >= 1 then
        return KsgNpc:Talk(g_szNpcName .. "Ph�n th��ng cao th� ��u ti�n c�ng tr�ng ��t 6.600.000 �� c� ch� nh�n!")
    end
    
    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    if nOriginRoute ~= 0 and nOriginRoute ~= KsgPlayer:GetRoute() then
        return KsgNpc:Talk(g_szNpcName .. "C�n chuy�n v� m�n ph�i ch� tu m�i c� th� nh�n th��ng!")
    end

    if not KsgLib:CheckMaterial(g_tbTopHonor1Cfg.Condition) then
        return
    end

    if not KsgLib:HasEnoughBagRoom(25, 1500) then
        return
    end

    if LIB_txtData:AddValue(tonumber(nBattleCamp), 1, 1) and KsgLib:PayMaterial(g_tbTopHonor1Cfg.Condition) then
        KsgTask:SetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_HONOR1, 1)
        KsgAward:Give(g_tbTopHonor1Cfg.Award, "Nh�n th��ng c�ng tr�ng 1")
        KsgNpc:Talk("Nh�n th�nh c�ng ph�n th��ng c�ng tr�ng ��t 6.600.000!")
    end
end


-- Nh�n th��ng top 2 c�ng tr�ng
function eventTop_GetTopHonor2Award_Confirm()
    local nHonor = KsgPlayer:GetHonor(1)
    local nBattleCamp = 1
    if nHonor < 0 then
        nBattleCamp = 2
    end

    if KsgTask:GetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_HONOR1) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� �� nh�n ph�n th��ng c�ng tr�ng 6.600.000 r�i, kh�ng th� nh�n th�m ph�n th��ng n�y n�a!!")
    end

    if KsgTask:GetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_HONOR2) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� �� nh�n ph�n th��ng n�y r�i!")
    end

    LIB_txtData:Init(FILENAME_TOP_HONOR2)
    LIB_txtData:LoadData()

    local nNationRank = tonumber(LIB_txtData.tbTextData[tonumber(nBattleCamp)])

    if nNationRank >= 2 then
        return KsgNpc:Talk(g_szNpcName .. format("Ph�n th��ng 2 cao th� ��u ti�n c�ng tr�ng ��t 5.400.000 <color=green>phe %s<color> �� c� ch� nh�n!", g_tbBattleCamps[nBattleCamp]))
    end
    
    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    if nOriginRoute ~= 0 and nOriginRoute ~= KsgPlayer:GetRoute() then
        return KsgNpc:Talk(g_szNpcName .. "C�n chuy�n v� m�n ph�i ch� tu m�i c� th� nh�n th��ng!")
    end
    
    if not KsgLib:CheckMaterial(g_tbTopHonor2Cfg.Condition) then
        return
    end

    if not KsgLib:HasEnoughBagRoom(25, 1500) then
        return
    end

    if LIB_txtData:AddValue(tonumber(nBattleCamp), 1, 2) == 1 and KsgLib:PayMaterial(g_tbTopHonor2Cfg.Condition) then
        KsgTask:SetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_HONOR2, 1)
        KsgAward:Give(g_tbTopHonor2Cfg.Award, "Nh�n th��ng c�ng tr�ng 2_" .. g_tbBattleCamps[nBattleCamp])
        KsgNpc:Talk("Nh�n th�nh c�ng ph�n th��ng c�ng tr�ng ��t 5.400.000!")
    end
end

---- Nh�n th��ng Top 1 m�n ph�i  ----------
function eventTop_GetTop1FactionAward()
    if KsgLib:IsInDualTopTime() then
        KsgNpc:SayDialog({
            g_szNpcName .. "Nh�n ph�n th��ng cao th� top 1 theo h� ph�i (m�i h� ph�i ch� c� 1 ph�n th��ng)",
            "Ta mu�n nh�n/eventTop_GetTop1FactionAward_Confirm",
            "\n�� ta suy ngh� l�i./no",
        })
    else
        KsgNpc:Talk(g_szNpcName .. "Ho�t ��ng �� k�t th�c!")
    end
end

---- Nh�n th��ng top 3 nh�n v�t chuy�n sinh 10 94 ----------
function eventTop_GetTop3RebornAward()
    if KsgLib:IsInDualTopTime() then
        KsgNpc:SayDialog({
            g_szNpcName .. "Nh�n ph�n th��ng 3 cao th� ho�n th�nh <color=red>chuy�n sinh 10 c�p 99<color> ��u ti�n c�a m�y ch�.",
            "Ta mu�n nh�n/eventTop_GetTop3RebornAward_Confirm",
            "\n�� ta suy ngh� l�i./no",
        })
    else
        KsgNpc:Talk(g_szNpcName .. "Ho�t ��ng �� k�t th�c!")
    end
end

--- Nh�n th��ng top 1 m�n ph�i----
function eventTop_GetTop1FactionAward_Confirm()
    local nRoute = KsgPlayer:GetRoute()
    if nRoute == 0 then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� ch�a gia nh�p m�n ph�i n�n kh�ng th� nh�n th��ng.")
    end
    
    if KsgTask:GetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_FACTION1) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� �� nh�n ph�n th��ng top 1 theo h� ph�i r�i.")
    end

    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    if nOriginRoute ~= 0 and nOriginRoute ~= KsgPlayer:GetRoute() then
        return KsgNpc:Talk(g_szNpcName .. "C�n chuy�n v� m�n ph�i ch� tu m�i c� th� nh�n th��ng!")
    end

    LIB_txtData:Init(FILENAME_TOP_ROUTE)
    LIB_txtData:LoadData()
    local nFactionRank = tonumber(LIB_txtData.tbTextData[tonumber(nRoute)])
    if nFactionRank >= 1 then
        KsgNpc:Talk(g_szNpcName .. "Ph�n th��ng n�y �� c� ch� nh�n!")
        return
    end

    if not KsgLib:CheckMaterial(g_tbTop1FactionCfg.Condition) then
        return
    end

    if not KsgLib:HasEnoughBagRoom(10, 300) then
        return
    end

    local szRouteName = KsgPlayer:GetRouteName(tonumber(nRoute))

    if LIB_txtData:AddValue(tonumber(nRoute), 1, 1) == 1 and KsgLib:PayMaterial(g_tbTop1FactionCfg.Condition) then
        KsgTask:SetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_FACTION1, 1)
        KsgAward:Give(g_tbTop1FactionCfg.Award, 'Nh�n th��ng top 1 ' .. szRouteName)
        KsgNpc:Talk("Nh�n th�nh c�ng ph�n th��ng h�ng " .. (nFactionRank + 1) .. " m�n ph�i " .. szRouteName .. ".")
        AddLocalNews(format("Cao th� [%s] �� nh�n ph�n th��ng Top 1 %s", KsgPlayer:GetName(), szRouteName))
        Msg2SubWorld(format("Cao th� [%s] �� nh�n ph�n th��ng Top 1 %s", KsgPlayer:GetName(), szRouteName))
    end
end

--- Nh�n th��ng top 3 chuy�n sinh ----
function eventTop_GetTop3RebornAward_Confirm()
    if KsgTask:GetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_REBORN3) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� �� nh�n ph�n th��ng n�y r�i.")
    end
    LIB_txtData:Init(FILENAME_TOP_REBORN)
    LIB_txtData:LoadData()
    local nRebornRank = tonumber(LIB_txtData.tbTextData[1])

    if nRebornRank >= 3 then
        return KsgNpc:Talk(g_szNpcName .. "Ph�n th��ng 3 cao th� ��u ti�n ��t chuy�n sinh 10 c�p 99 ��u �� c� ch� nh�n!")
    end

    local nOriginRoute = KsgTask:GetByte(TASKID_PHUTU_ROUTE, TASKID_PHUTU_BYTE_ORIGIN_ROUTE)
    if nOriginRoute ~= 0 and nOriginRoute ~= KsgPlayer:GetRoute() then
        return KsgNpc:Talk(g_szNpcName .. "C�n chuy�n v� m�n ph�i ch� tu m�i c� th� nh�n th��ng!")
    end

    if not KsgLib:CheckMaterial(g_tbTop3RebornCfg.Condition) then
        return
    end

    if not KsgLib:HasEnoughBagRoom(5, 300) then
        return
    end

    if LIB_txtData:AddValue(1, 1, 3) == 1 and KsgLib:PayMaterial(g_tbTop3RebornCfg.Condition) then
        KsgTask:SetBit(TASKID_TOP_AWARD_FLAG, TASK_TOP_BIT_AWARD_REBORN3, 1)
        KsgAward:Give(g_tbTop3RebornCfg.Award, 'Nh�n th��ng top chuy�n sinh')
        KsgNpc:Talk("Nh�n th�nh c�ng ph�n th��ng Top chuy�n sinh.")
        AddLocalNews(format("Cao th� [%s] �� nh�n ph�n th��ng Top chuy�n sinh.", KsgPlayer:GetName()))
        Msg2SubWorld(format("Cao th� [%s] �� nh�n ph�n th��ng Top chuy�n sinh.", KsgPlayer:GetName()))
    end
end


