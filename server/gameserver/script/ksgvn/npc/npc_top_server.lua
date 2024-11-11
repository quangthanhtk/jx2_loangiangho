Import("\\script\\ksgvn\\lib.lua")
Import("\\script\\ksgvn\\event\\top_server\\top_server.lua")

g_szNpcName = "<color=green>B¹ch Hæ<color>: "

function main()
    g_szNpcName =  format("<color=green>%s<color>: ", GetTargetNpcName())
    if KsgLib:IsTestServer() then
        return KsgNpc:Talk("C¸c h¹ ®Õn ®©y cã viÖc g× kh«ng?")
    end

    if KsgLib:GetSrvCfg('bOpenTop') ~= 1 then
        KsgNpc:Talk(g_szNpcName .. format("Ho¹t ®éng ®ua top t¹i %s ch­a më!", KsgLib:GetSrvCfg('szName')))
        return
    end
    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk(g_szNpcName .. "C¸c h¹ ch­a gia nhËp m«n ph¸i nªn kh«ng thÓ tham gia ho¹t ®éng nµy.")
    end
    local nStartDate = KsgLib:GetSrvCfg('tbTimeTop').nStartDate
    local nEndDate = KsgLib:GetSrvCfg('tbTimeTop').nEndDate
    local tSay = {
        g_szNpcName .. "Ho¹t ®éng <color=yellow>§ua Top NhËn Th­ëng<color> diÔn ra tõ ngµy <color=gold>" .. KsgDate:ToString(nStartDate) .. " ®Õn 24:00 " .. KsgDate:ToString(nEndDate) .. "<color>. Trong thêi gian nµy, quý ®ång ®¹o cã thÓ ®Õn gÆp ta ®Ó nhËn c¸c phÇn th­ëng hÊp dÉn. Th«ng tin chi tiÕt ho¹t ®éng ®ång ®¹o cã thÓ xem t¹i trang chñ."
    }

    if KsgLib:IsInDualTopTime() then
        tinsert(tSay, "NhËn th­ëng th¨ng cÊp t¹i m¸y chñ míi/eventTop_ShowLevelAward")
        tinsert(tSay, "NhËn phÇn th­ëng 3 cao thñ ®Çu tiªn ®¹t chuyÓn sinh 10 cÊp 99/eventTop_GetTop3RebornAward")
        tinsert(tSay, "\nNhËn phÇn th­ëng 1 cao thñ ®Çu tiªn ®¹t 6.600.000 ®iÓm c«ng tr¹ng/eventTop_GetTopHonor1Award_Confirm")
        tinsert(tSay, "NhËn phÇn th­ëng 2 cao thñ ®Çu tiªn mçi phe ®¹t 5.400.000 c«ng tr¹ng/eventTop_GetTopHonor2Award_Confirm")
        tinsert(tSay, "NhËn phÇn th­ëng cao thñ Top 1 mçi hÖ ph¸i/eventTop_GetTop1FactionAward")
    end
    tinsert(tSay, "\n§ua Top Bang Héi/eventTop_ShowMenuTopBang")
    tinsert(tSay, "\nXem t×nh h×nh nhËn th­ëng Top hÖ ph¸i/eventTop_QueryTopFaction")
    tinsert(tSay, "Xem t×nh h×nh nhËn th­ëng Top chuyÓn sinh/eventTop_QueryTopReborn")
    tinsert(tSay, "Xem t×nh h×nh nhËn th­ëng qu©n c«ng ®¹t 6.600.000/eventTop_QueryTopHonor1")
    tinsert(tSay, "Xem t×nh h×nh nhËn th­ëng qu©n c«ng ®¹t 5.400.000/eventTop_QueryTopHonor2")
    tinsert(tSay, "\nTa biÕt råi/no")

    KsgNpc:SayDialog(tSay)
end

