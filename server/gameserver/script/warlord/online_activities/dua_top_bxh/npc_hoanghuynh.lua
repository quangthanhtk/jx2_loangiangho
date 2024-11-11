----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-12
--- Description: Npc trao th­ëng ®ua top
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\online_activities\\dua_top_bxh\\functions.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>Hoµng Huynh<color>: ";

function main()
    local tbSay = { "<color=yellow>Ho¹t ®éng ®ua top diÔn ra tõ 19h00 ngµy 31/12/2022 ®Õn 21h00 ngµy 14/01/2023<color>\n" ..
                            "<color=green> - Top 5 Tèng Liªu sÏ chèt danh s¸ch dùa trªn BXH c«ng tr¹ng vµo 21h00 ngµy 14/01/2023<color>\n" ..
                            --"<color=green> - Top 10 cÊp toµn server sÏ chèt danh s¸ch dùa trªn BXH cÊp vµo 24h00 ngµy 15/10/2023<color>\n" ..
                            "<color=red> *** L­u ý: Trao th­ëng sÏ b¾t ®Çu vµo lóc " .. WDate:ToString(WDUATOPBXH.nGiveAwardTime, WEnv.TRUE) .. ". Quý nh©n sÜ nÕu cã khiÕu n¹i vÒ k qu¶ vui lßng inbox Fanpage ®Ó ®­îc gi¶i quyÕt sím!<color>\n" ..
                            --"<color=red> *** L­u ý: mçi nh©n vËt chØ ®­îc nhËn 1 top duy nhÊt, trong tr­êng hîp nh©n vËt ®­îc c¶ 2 top cïng lóc th× sÏ nhËn top c«ng tr¹ng, top cÊp sÏ chuyÓn cho ng­êi tiÕp theo<color>" ..
                            "" };

    for i = 1, getn(WDUATOPBXH.tbTopDef) do
        tinsert(tbSay, format("Xem %s/#WDUATOPBXH:ShowAwardList(%d)", WDUATOPBXH.tbTopDef[i].szName, i));
    end

    if WPlayer:IsSuperAdmin() == WEnv.TRUE then
        tinsert(tbSay, "\nLÊy danh s¸ch top c«ng tr¹ng/#WDUATOPBXH:GetData_TopMerrit()");
    end

    tinsert(tbSay, "\nTa chØ xem qua th«i./nothing");
    WNpc:SayDialog(tbSay);
end
