--½Å±¾Ãû³Æ£ºÓÊÏä
--½Å±¾¹¦ÄÜ£º
--¹¦ÄÜ²ß»®£º
--¹¦ÄÜ¿ª·¢£ºÖìÁ¦
--¿ª·¢Ê±¼ä£º2010-12-16
--´úÂëĞŞ¸Ä¼ÇÂ¼

tMsg = {
	"<color=green>H­íng dÉn sö dông hép th­:<color>\n"..
	"    <color=yellow>§èi th­îng göi th­<color>: H¶o h÷u, thµnh viªn bang héi, cõu nh©n, ng­êi ch¬i bÊt kú trong danh s¸ch ®en.\n"..
	"    <color=yellow>§iÒu kiÖn göi th­<color>: Ng­êi ch¬i cÊp 10 trë lªn míi ®­îc göi th­. Mçi ngµy ®­îc göi tèi ®a 3 th­.",
	"    <color=yellow>§iÒu kiÖn vËt phÈm ®İnh kÌm qua th­<color>: <color=red> B©y giê t¹m kh«ng thÓ göi vËt phÈm vµ tiÒm vµng cho ng­êi ch¬i kh¸c.\n"..
	"    <color=yellow>Quy t¾c l­u th­<color>: §èi víi th­ ch­a ®äc, hÖ thèng sÏ l­u l¹i trong 30 ngµy, sau ®ã sÏ tù ®éng xãa. §èi víi th­ ®· ®äc vµ cã ®İnh kÌm ch­a nhËn, hÖ thèng sÏ l­u l¹i trong 30 ngµy, sau ®ã tù ®éng xãa. §èi víi th­ ®· ®äc vµ kh«ng cã ®İnh kÌm, hÖ thèng sÏ l­u l¹i 3 ngµy, sau ®ã tù ®éng xãa. Th­ cã ®İnh kÌm sÏ ®­îc ®¸nh dÊu [!] ®Ó nh¾c nhë.\n\n",
	"    <color=red>Nh¾c nhë 1<color>: Kı hiÖu th­ cña th­ hÖ thèng lµ logo game, kı hiÖu th­ cña ng­êi ch¬i lµ th­ th­êng. Vui lßng kh«ng tin vµo bÊt kú th­ cña ng­êi ch¬i nµo tù nhËn lµ ng­êi cña B§H, <color=red>h¬n n÷a B§H còng kh«ng bao giê yªu cÇu ng­êi ch¬i cung cÊp th«ng tin tµi kho¶n vµ mËt khÈu. H·y cÈn thËn ®Ò phßng!<color>\n",
	"    <color=red>Nh¾c nhë 2<color>: Khi b¹n cßn th­ ch­a ®äc, kı hiÖu nh¾c nhë th­ sÏ lãe s¸ng, kı hiÖu nh¾c nhë th­ n»m ë bªn tr¸i b¶n ®å nhá trong giao diÖn chİnh. H·y chó ı ®äc th­ kŞp thêi, tr¸nh qu¸ h¹n sÏ bŞ hÖ thèng xãa!\n",
	"    <color=red>Nh¾c nhë 3<color>: NÕu v× lı do c¸ nh©n mµ kh«ng thÓ ®äc th­ kŞp lóc, dÉn ®Õn vËt phÈm ®İnh kÌm trong th­ qu¸ h¹n vµ bŞ xãa, tÊt c¶ sÏ kh«ng ®­îc xö lı!",
}


function OnUse()
	Talk(getn(tMsg), "", unpack(tMsg));
end

