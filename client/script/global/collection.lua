--½Å±¾Ãû³Æ£ºÍâ×°ÔÌÁéµÄ½éÉÜ
--½Å±¾¹¦ÄÜ£º
--¹¦ÄÜ²ß»®£º
--¹¦ÄÜ¿ª·¢£ºÖìÁ¦
--¿ª·¢Ê±¼ä£º2010-03-09
--´úÂëĞŞ¸Ä¼ÇÂ¼

function ShowHelp()
	local szTitle	= "C¸c h¹ cã biÕt kh«ng?"
	local tMenu	= {
		"Ta biÕt råi /nothing",
	};

	Say(szTitle, getn(tMenu), tMenu);
end

function ShowHelp_Ex()
	local szTitle	= "C¸c h¹ ®· biÕt råi??"
	local tMenu	= {
		"Ta biÕt råi /nothing",
	};

	Say(szTitle, getn(tMenu), tMenu);
end

function ShowHelp_Coat()
	local szTitle	= "";
	szTitle = szTitle.."    Ngo¹i trang sau khi ®­îc l­u tr÷, vËt phÈm sÏ <color=yellow>biÕn mÊt<color> vµ ®­îc ghi nhí vµo 'Tñ ¸o Nhá', ®­îc lÊy ra kh«ng giíi h¹n sè lÇn nh­ng sÏ biÕn thµnh vËt phÈm khãa, <color=yellow>kh«ng thÓ giao dŞch<color>, sau khi lÊy ra cã h¹n sö dông 30 ngµy.\n";
	szTitle = szTitle.."    UÈn Linh sau khi ®­îc l­u tr÷, vËt phÈm sÏ <color=yellow>biÕn mÊt<color> vµ ®­îc ghi nhí vµo giao diÖn 'UÈn Linh''. Khi mua Ngù Hiªn Thiªn BiÕn H¹p vµ lÊy ngo¹i trang ra, kh¾c vµo hiÖn qu¶ UÈn Linh, cã thÓ dïng kh«ng giíi h¹n sè lÇn.\n";
	szTitle = szTitle.."    §iÒu kiÖn l­u tr÷ ngo¹i trang: VËt phÈm b¸n ë <color=yellow>Tñ ¸o Thiªn BiÕn TiÕu<color> cã tİnh chÊt <color=yellow>vÜnh viÔn<color> vµ vËt phÈm ngo¹i trang <color=yellow>vÜnh viÔn<color> nhËn ®­îc trong game ®Òu cã thÓ l­u tr÷. Kh«ng thÓ l­u tr÷ UÈn Linh chuyÓn sinh.\n";
	--szTitle = szTitle.."    ÔÌÁéÄÜÁ¦Ñ§Ï°£º¿ÉÒÔÈ¥·ïÏèµÄÁú¹âÕæÈË´¦Ñ§Ï°Óë²éÑ¯¡£\n";
	szTitle = szTitle.."\n<color>";
	Say(szTitle, 1, {"Ta biÕt råi /nothing"});
end

function ShowHelp_Coat_Ex()
	local szTitle	= "";
	szTitle = szTitle.."    Ngo¹i trang sau khi ®­îc l­u tr÷, vËt phÈm sÏ <color=yellow>biÕn mÊt<color> vµ ®­îc ghi nhí vµo 'Tñ ¸o Nhá', ®­îc lÊy ra kh«ng giíi h¹n sè lÇn, sau khi lÊy ra cã h¹n sö dông 30 ngµy.\n";
	szTitle = szTitle.."    UÈn Linh sau khi ®­îc l­u tr÷, vËt phÈm sÏ <color=yellow>biÕn mÊt<color> vµ ®­îc ghi nhí vµo giao diÖn 'UÈn Linh'. Khi mua Ngù Hiªn Thiªn BiÕn H¹p vµ lÊy ngo¹i trang ra, kh¾c vµo hiÖn qu¶ UÈn Linh, cã thÓ dïng kh«ng giíi h¹n sè lÇn.\n";
	szTitle = szTitle.."    §iÒu kiÖn l­u tr÷ ngo¹i trang: VËt phÈm b¸n ë <color=yellow>Tñ ¸o Thiªn BiÕn TiÕu<color> cã tİnh chÊt <color=yellow>vÜnh viÔn<color> vµ vËt phÈm ngo¹i trang <color=yellow>vÜnh viÔn<color> nhËn ®­îc trong game ®Òu cã thÓ l­u tr÷. Kh«ng thÓ l­u tr÷ UÈn Linh chuyÓn sinh.\n";
	--szTitle = szTitle.."    ÔÌÁéÄÜÁ¦Ñ§Ï°£º¿ÉÒÔÈ¥·ïÏèµÄÁú¹âÕæÈË´¦Ñ§Ï°Óë²éÑ¯¡£\n";
	szTitle = szTitle.."\n";
	Say(szTitle, 1, {"Ta biÕt råi /nothing"});
end

function ShowHelp_Horse()
	local szTitle	= "";
	szTitle = szTitle.."    Thó c­ìi sau khi ®­îc l­u tr÷, vËt phÈm sÏ <color=yellow>biÕn mÊt<color> vµ ®­îc ghi nhí vµo 'Chuång Ngùa Nhá', ®­îc lÊy ra kh«ng giíi h¹n sè lÇn, sau khi lÊy ra cã h¹n sö dông 30 ngµy.\n";
	szTitle = szTitle.."    Thó c­ìi sau khi ®­îc l­u tr÷, lÊy ra sÏ biÕn thµnh vËt phÈm khãa, <color=yellow>kh«ng thÓ giao dŞch<color>.\n";
	--szTitle = szTitle.."    ÓĞÊ±ÏŞµÄ×øÆï²»ÄÜ³£°éÉí²à£¬¹Ê²»ÄÜ±»ÊÕ²Ø¡£"
	szTitle = szTitle.."\n";
	Say(szTitle, 1, {"Ta biÕt råi /nothing"});
end

ShowHelp_Horse_Ex	= ShowHelp_Horse;

--function ShowHelp_Follower()
--	local szTitle	= "";
--	szTitle = szTitle.."    ¡ô ¸ú³è±»ÊÕ²Øºó£¬ÎïÆ·½«<color=yellow>ÏûÊ§<color>²¢¼ÇÂ¼µ½¡°Ğ¡Ğ¡ÊŞ¼÷¡±ÖĞ£¬¿ÉÎŞÏŞ´ÎÈ¡³ö¡£\n";
--	szTitle = szTitle.."    ¡ô ¸ú³è±»ÊÕ²Øºó£¬ÔÙ´ÎÈ¡³ö¼´Îª°ó¶¨ÎïÆ·£¬<color=yellow>²»¿É½»Ò×<color>¡£\n";
--	szTitle = szTitle.."    ¡ô ÓĞÊ±ÏŞµÄ¸ú³è²»ÄÜ³£°éÉí²à£¬¹Ê²»ÄÜ±»ÊÕ²Ø¡£"
--	szTitle = szTitle.."\n";
--	Say(szTitle, 1, {"ÎÒÖªµÀÁË /nothing"});
--end

ShowHelp_Follower_Ex	= ShowHelp_Follower;

function ShowHelp_Ornament()
	local szTitle	= "";
	szTitle = szTitle.."    Trang søc sau khi ®­îc l­u tr÷, vËt phÈm sÏ <color=yellow>biÕn mÊt<color> vµ ®­îc ghi nhí vµo 'Tr¸p Ngäc Nhá', ®­îc lÊy ra kh«ng giíi h¹n sè lÇn, sau khi lÊy ra cã h¹n sö dông 30 ngµy.\n";
	szTitle = szTitle.."    Trang søc sau khi ®­îc l­u tr÷, lÊy ra sÏ biÕn thµnh vËt phÈm khãa, <color=yellow>kh«ng thÓ giao dŞch<color>.\n";
	szTitle = szTitle.."    Trang søc cã h¹n sö dông kh«ng thÓ ®eo trªn ng­êi th­êng xuyªn, nªn kh«ng thÓ l­u tr÷."
	szTitle = szTitle.."\n";
	Say(szTitle, 1, {"Ta biÕt råi /nothing"});
end

ShowHelp_Ornament_Ex	= ShowHelp_Ornament;

function nothing()
end
