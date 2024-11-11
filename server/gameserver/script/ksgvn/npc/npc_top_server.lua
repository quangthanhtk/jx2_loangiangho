Import("\\script\\ksgvn\\lib.lua")
Import("\\script\\ksgvn\\event\\top_server\\top_server.lua")

g_szNpcName = "<color=green>B�ch H�<color>: "

function main()
    g_szNpcName =  format("<color=green>%s<color>: ", GetTargetNpcName())
    if KsgLib:IsTestServer() then
        return KsgNpc:Talk("C�c h� ��n ��y c� vi�c g� kh�ng?")
    end

    if KsgLib:GetSrvCfg('bOpenTop') ~= 1 then
        KsgNpc:Talk(g_szNpcName .. format("Ho�t ��ng �ua top t�i %s ch�a m�!", KsgLib:GetSrvCfg('szName')))
        return
    end
    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� ch�a gia nh�p m�n ph�i n�n kh�ng th� tham gia ho�t ��ng n�y.")
    end
    local nStartDate = KsgLib:GetSrvCfg('tbTimeTop').nStartDate
    local nEndDate = KsgLib:GetSrvCfg('tbTimeTop').nEndDate
    local tSay = {
        g_szNpcName .. "Ho�t ��ng <color=yellow>�ua Top Nh�n Th��ng<color> di�n ra t� ng�y <color=gold>" .. KsgDate:ToString(nStartDate) .. " ��n 24:00 " .. KsgDate:ToString(nEndDate) .. "<color>. Trong th�i gian n�y, qu� ��ng ��o c� th� ��n g�p ta �� nh�n c�c ph�n th��ng h�p d�n. Th�ng tin chi ti�t ho�t ��ng ��ng ��o c� th� xem t�i trang ch�."
    }

    if KsgLib:IsInDualTopTime() then
        tinsert(tSay, "Nh�n th��ng th�ng c�p t�i m�y ch� m�i/eventTop_ShowLevelAward")
        tinsert(tSay, "Nh�n ph�n th��ng 3 cao th� ��u ti�n ��t chuy�n sinh 10 c�p 99/eventTop_GetTop3RebornAward")
        tinsert(tSay, "\nNh�n ph�n th��ng 1 cao th� ��u ti�n ��t 6.600.000 �i�m c�ng tr�ng/eventTop_GetTopHonor1Award_Confirm")
        tinsert(tSay, "Nh�n ph�n th��ng 2 cao th� ��u ti�n m�i phe ��t 5.400.000 c�ng tr�ng/eventTop_GetTopHonor2Award_Confirm")
        tinsert(tSay, "Nh�n ph�n th��ng cao th� Top 1 m�i h� ph�i/eventTop_GetTop1FactionAward")
    end
    tinsert(tSay, "\n�ua Top Bang H�i/eventTop_ShowMenuTopBang")
    tinsert(tSay, "\nXem t�nh h�nh nh�n th��ng Top h� ph�i/eventTop_QueryTopFaction")
    tinsert(tSay, "Xem t�nh h�nh nh�n th��ng Top chuy�n sinh/eventTop_QueryTopReborn")
    tinsert(tSay, "Xem t�nh h�nh nh�n th��ng qu�n c�ng ��t 6.600.000/eventTop_QueryTopHonor1")
    tinsert(tSay, "Xem t�nh h�nh nh�n th��ng qu�n c�ng ��t 5.400.000/eventTop_QueryTopHonor2")
    tinsert(tSay, "\nTa bi�t r�i/no")

    KsgNpc:SayDialog(tSay)
end

