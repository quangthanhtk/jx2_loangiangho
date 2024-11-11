--Ìì¹¤ÇÉÊÖÁõÊ«Ó¢

g_NpcName = "<color=green>Thiªn c«ng x¶o thñ L­u Thi Anh<color>:";

function main()
	local strtab = {
		format("%s/#lsy_enhance(201)", "Muèn c­êng hãa thuéc tİnh c¬ b¶n cña V¨n Søc"),
		format("%s/#lsy_enhance(202)", "Muèn t¨ng phÈm chÊt V¨n Søc"),
		-- format("%s/#lsy_enhance(206)", "ÎÒÒªÉı¼¶¿Ì°å"),
--		format("%s/#lsy_enhance(204)", "ÎÒÒª¾«Á¶ÖØÖıÎÆÊÎ"),
		--format("%s/change_lv4_armory", "×ª»»4¼¶Á÷ÅÉ×¨ÊôÎÆÊÎËæ»úÊôĞÔ(Ã¿´Î10000½ğ)"),
		format("%s/lsy_intro_main", "Giíi thiÖu V¨n Søc"),
		format("%s/nothing", "Ra khái"),
	};
	Say(g_NpcName.."",
		getn(strtab),
		strtab)
end

function lsy_enhance(nType)
	nType = nType or 201;
	SendScript2Client(format("Open([[CommonEnhanceItem]],%d);", nType));
end

function lsy_intro_main()
	local strtab = {
		format("%s/#lsy_intro(1)", "V¨n Søc lµ g×"),
		format("%s/#lsy_intro(2)", "C­êng hãa cÊp V¨n Søc cã t¸c dông g×"),
		format("%s/#lsy_intro(3)", "T¨ng phÈm chÊt V¨n Søc cã t¸c dông g×"),
		-- format("%s/#lsy_intro(4)", "ÈçºÎ¾«Á¶ÖØÖıÎÆÊÎ"),
		format("%s/#lsy_intro(5)", "C¸ch nhËn V¨n Søc"),
		format("%s/#lsy_intro(6)", "C¸ch nhËn nguyªn liÖu c­êng hãa V¨n Søc"),
		format("%s/#lsy_intro(7)", "C­êng hãa V¨n Søc Nh­ ThÕ Nµo"),
		format("%s/#lsy_intro(8)", "N©ng cÊp phÈm chÊt V¨n Søc nh­ thÕ nµo"),
		format("%s/nothing", "Ra khái"),
	};
	Say(g_NpcName.."",
		getn(strtab),
		strtab)
end


lsy_tIntro = {
	[1] = "Nguyªn liÖu V¨n Søc gåm ChØ Vµng, Ng©n Ti, Ngäc Th¹ch, M· N·o, sö dông kü thuËt cò §«ng Ph­¬ng ®Ó rËp h×nh vµo trang bŞ, \n     cã søc m¹nh ngò hµnh, kh«ng chØ t¨ng thuéc tİnh chiÕn ®Êu cña ng­êi mang, mµ cßn t¨ng phßng ngù ngò hµnh. ",
	[2] = "C­êng hãa cÊp V¨n Søc sÏ t¨ng kh¸ng tİnh ngò hµnh t­¬ng øng, gi¶m s¸t th­îng cña thuéc tİnh ngò hµnh t­¬ng øng.",
	[3] = "V¨n Søc gåm 4 phÈm chÊt: Vì, Th­êng, V« H¹, Hoµn mü.\n    T¨ng phÈm chÊt V¨n Søc sÏ t¨ng gi¸ trŞ cña bé phËn V¨n Søc ®ang ®eo hoÆc tÊt c¶ thuéc tİnh chiÕn ®Êu.",
	[4] = "Tinh luyÖn/trïng luyÖn V¨n Søc cã thÓ trïng luyÖn V¨n Søc V« H¹ vµ Hoµn Mü thµnh V¨n Søc Kh¾c B¶n cïng vŞ trİ cÊp cao h¬n, c¨n cø ®é c­êng hãa cña V¨n Søc ban ®Çu hoµn tr¶ nguyªn liÖu c­êng hãa víi sè l­îng nhÊt ®Şnh. Quy t¾c hoµn tr¶ nh­ sau:\n",
	[5] = "Th¸i ®é cña ChiÕt Xung X· ®èi víi b¹n sÏ quyÕt ®Şnh lo¹i v¨n søc mµ b¹n cã thÓ nhËn ®­îc, cho nªn n©ng cÊp danh väng ChiÕt Xung X· cã thÓ nhËn ®­îc tÊt c¶ c¸c lo¹i trang sóc. \n tiªu hao kh¾c b¶n v¨n søc cã thÓ nhËn ®­îc v¨n søc t­¬ng øng vŞ trİ víi thuéc tİnh ngÉu nhiªn vµ ngò hµnh.",
	[6] = "Trong phã b¶n anh hïng KiÕm §·ng YÕn V©n cã thÓ nhËn ®­îc nguyªn liÖu c­êng hãa v¨n søc.",
	[7] = "C­êng hãa v¨n søc cÇn tiªu hao L­u Kim, trong qu¸ tr×nh c­êng hãa cã thÓ thªm vµo Thiªn V¨n Th¹ch ®Ó gi¶m tæn thÊt khi c­êng hãa thÊt b¹i.\n    Sau khi ®é c­êng hã V¨n Søc ®¹t ®Õn 10, tiÕp tôc c­êng hãa ph¶i thªm vµo Thiªn V¨n Th¹ch míi cã thÓ tiÕn hµnh c­êng hãa.",
	[8] = "N©ng cÊp phÈm chÊt cÇn tiªu hao V¨n Søc cã ®»ng cÊp, vŞ trİ, phÈm chÊt ®Òu gièng nhau.\n    Nguyªn liÖu thªm vµo cµng nhiÒu, x¸c suÊt thµnh c«ng th× cµng cao. <color=red>(nÕu V¨n Søc cÇn n©ng cÊp phÈm chÊt hoÆc nguyªn liÖu ®Ó n©ng cÊp cã vËt phÈm khãa, th× V¨n Søc sau khi n©ng cÊp còng sÏ bŞ khãa. )<color>",
};

function lsy_intro(nType)
	if not lsy_tIntro[nType] then return end
	Talk(1,"lsy_intro_main",g_NpcName..lsy_tIntro[nType]);
end
