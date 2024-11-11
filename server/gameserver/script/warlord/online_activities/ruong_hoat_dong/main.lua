----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-12-21
--- Description: §Þnh nghÜa c¸c hàm entrypoint ®Ó t­¬ng t¸c víi hµm trong functions
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\online_activities\\ruong_hoat_dong\\functions.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>§¹i Sø Ho¹t §éng<color>: ";
----------------------------------------------------------------------------------------------------
function WRUONGHD_Act1()
    local tbSay = { "<npcname>: <sex> sau khi më <color=white>R­¬ng Ho¹t §éng<color> cã thÓ tÝch lòy <color=white>1 ®iÓm ho¹t ®éng<color> vµ sÏ reset mét lÇn sau 0h mçi ngµy." ..
                            "3 nh©n sÜ cã sè ®iÓm tÝch lòy cao duy nhÊt sÏ nhËn ®­îc 1 bé trang bÞ <color=white>V« Song ChiÕn ThÇn<color> vµ 1 bé <color=white>V« Cùc Minh Tinh<color>"
    };

    tinsert(tbSay, format("%s/#WRUONGHD:ShowAwardList(1)", "Xem top ®iÓm tÝch lòy h«m qua"));

    tinsert(tbSay, format("%s/nothing", "Ta chØ xem qua th«i."));
    WNpc:SayDialog(tbSay);
end

function WRUONGHD_Act2()
    local tbSay = { "<npcname>: <sex> sau khi më <color=white>R­¬ng Ho¹t §éng<color> cã thÓ nhËn ngÉu nhiªn <color=white>1 m¶nh ghÐp [Vâ] [L©m] [2] [HuyÒn] [Tho¹i]<color>." ..
                            "M¶nh ghÐp cã thÓ dïng ®Ó ®æi c¸c vËt phÈm, ®Æc biÖt cã 5 bé V« Song ChiÕn ThÇn cho nh©n sÜ nhanh tay nhÊt thu thËp ®ñ 5 m¶nh ghÐp!"
    };

    tinsert(tbSay, format("%s/#WRUONGHD:ExchanceGoods()", "Xem vËt phÈm cã thÓ ®æi"));

    tinsert(tbSay, format("%s/nothing", "Ta chØ xem qua th«i."));
    WNpc:SayDialog(tbSay);
end