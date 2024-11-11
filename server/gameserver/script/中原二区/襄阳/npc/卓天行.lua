-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Í¨¼©ÈÎÎñÉ±ÊÖÁîÅÆÎÄ¼ş(Ïà¹ØNpc:ÏåÑô×¿ÌìĞĞ)
-- Edited by starry night
-- 2005/09/15 PM 9:27

-- ======================================================

--ÒıÓÃÍ¨¼©ÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\lib\\message.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua");

g_NpcName = "<color=green>Tr¸c Thiªn Hµnh<color>:";

function main()
	local szTitle = format("%s %s", g_NpcName, "Nhí n¨m x­a l·o phu còng tõng lµ mét ®¹i hiÖp tuæi trÎ tµi cao, phong l­u phãng kho¸ng. Nay qu¶ thËt ®· giµ råi. Ng­¬i t×m ta cã viÖc g× kh«ng?")
	local tSay = {
		--format("%s/Task_Check", "ÎÒÕâÀïÓĞÒ»¿éÁîÅÆ£¬µ«Íí±²²ÅÊèÑ§Ç³£¬ÍûÇ°±²¿ÉÒÔ°ïÎÒ½â¿ª¸öÖĞĞş»ú£¡"),
		format("%s/bookDecompose", "T¸ch bİ kİp"),
		--format("%s/bookCompose", "ÃØ¼®ÁìÎò"),
		--format("%s/qby_task", "Î¯ÍĞÈÎÎñ"),
		format("%s/book_main", "Ch©n Vâ MËt TŞch"),
		format("%s/nothing", "HÑn gÆp l¹i"),
	}
	Say(szTitle,	getn(tSay), tSay)
end


function Task_Check()

	if GetItemCount(2,1,195) >= 1 then --ÅĞ¶ÏÉ±ÊÖÁîÊıÁ¿
		Say("<color=green>Tr¸c Thiªn Hµnh<color>: §©y lµ LÖnh Bµi S¸t Thñ cña T©y H¹ NhÊt PhÈm §­êng, trong ®ã Èn chøa huyÒn c¬. H·y giao nã cho ta, ta cã thÓ gi¶i huyÒn c¬ cña lÖnh bµi nµy.",
				2,
				"§­îc, lÖnh bµi nµy cho ng­¬i/Task_Confirm",
				"Th«i §­îc! §a t¹ tiÒn bèi/Task_Exit");
	else
		Say("LÖnh bµi cña ng­¬i ®©u?!",0);
	end;

end;


function Task_Confirm()

local n = 0;
local nLevel = GetLevel();

local str1 = { "<color=green>Tr¸c Thiªn Hµnh<color>:…",
						   "LÖnh bµi nµy xem ra ch¼ng cã g× ®Æc biÖt.",
						   "Ta cã mét İt th¸nh d­îc ®i l¹i trong giang hå rÊt cÇn thiÕt, tÆng ng­¬i xem nh­ kh«ng uèng c«ng cña ng­¬i vËy.",
						   "§a t¹ tiÒn bèi"}

local str2 = { "<color=green>Tr¸c Thiªn Hµnh<color>:…",
						 	 "Bªn d­íi lÖnh bµi cã Èn chøa mét b¶n vÏ, bªn trªn míi chØ lµ nh÷ng kı hiÖu",
               "Kı hiÖu?",
               "<color=yellow>Tµng B¶o §å<color> do ng­¬i mang ®Õn ®­¬ng nhiªnlµ ph¶i tr¶ l¹i cho ng­¬i råi. Nãi thËt ta giµ råi còng kh«ng cßn ®ñ søc ®Ó ®i qu·ng ®­êng dµi nh­ vËy.",
						   "§a t¹ tiÒn bèi chØ gi¸o!"}

local str3 = { "<color=green>Tr¸c Thiªn Hµnh<color>:…",
							 "ë ®©y cßn cã <color=yellow>Ph¸o hoa truyÒn tin<color>……",
							 "Ph¸o hoa truyÒn tin?",
							 "§©y lµ vËt phÈm mµ NhÊt PhÈm §­êng S¸t Thñ hay sö dông, chØ cÇn ra ngoµi thµnh ®èt lªn th× sÏ cã S¸t thñ ®Çu môc ®Õn tiÕp øng. Ng­¬i nh©n c¬ héi nµy trõ h¹i cho ®¹i Tèng.",
							 "§a t¹ tiÒn bèi chØ gi¸o!"}

--	if Pay(5000) == 1 then
		local nDelItem = DelItem(2,1,195,1,1);
			if nDelItem == 1 then

				n = random(1,100);

				if n <= 67 then --67£¥µÃµ½Ò»ÕÅ²Ø±¦Í¼
					TalkEx("",str2);
					local nRow = random(3,tonumber(tabPos:getRow()));
					local nParticular = tonumber(tabPos:getCell(nRow,"PosID"));
					AddItem(2,14,nParticular,1,1);
				else --33£¥»ñÈ¡Ò»¸ö¶¥¼¶É±ÊÖ´«ĞÅÑÌ»ğ
					AddItem(2,1,203,1,1);
					TalkEx("",str3);
				end;
			end;
--	else
--
--		Say("<color=green>×¿ÌìĞĞ<color>£ºÄãµÄÇ®ÔÚÄÄÀï°¡£¿ÎÒÔõÃ´ËµÒ²ÊÇÒ»´ú´óÏÀ£¬ËäÈ»¹ıÆúÁË£¬µ«Ò²²»ÖÁÓÚ±»ÄãÃÇÕâĞ©ºóÉúËæÒâ»£ÎÒ°É£¡",0);
--
--	end;

end;

function bookCompose(bSure)
	if not bSure then
		local tSel = {
			"\nB¾t ®Çu lÜnh ngé bİ kİp/#bookCompose(1)",
			"\nKÕt thóc ®èi tho¹i/nothing",
		}

		Say("<color=green>Tr¸c Thiªn Hµnh<color>: B¹n cã thÓ bá vµo c¸c lo¹i bİ kİp ®Ó cïng lÜnh ngé, tõ ®ã nhËn ®­îc bİ kİp míi, b¹n cã thÓ bá vµo tu vi, [§¹i Nh©n S©m] thêi gian vµ [Nh©n S©m Ngµn N¨m] thêi gian ®Ó n©ng cao tû lÖ lÜnh ngé thµnh c«ng ([Qu¶ Nh©n S©m] cã b¸n trong Ngù C¸c). Vİ dô: L¨ng Ba Di Bé vµ Ngò Hµnh MËt TŞchcïng lÜnh ngé, cã thÓ nhËn ®­îc <color=yellow>Bİ Kİp Tiªu Dao<color>, thªm vİ dô: Hçn §én MËt TŞch, HuyÒn nh MËt TŞch, Kim Cang Phôc Ma Kinh, Thiªn La MËt TŞch, Linh Cæ MËt TŞch cïng nhau lÜnh ngé sÏ ®­îc Ngò Hµnh MËt TŞch! C¸c b¹n cÇn tù t×m hiÓu c¸ch ph­¬ng thøc lÜnh ngé kh¸c.",
			getn(tSel), tSel);
		return
	else
		SendScript2Client('Open([[BookCompose]]);Open([[Items]])');
	end
end

function bookDecompose()
	if 1 == IsBoxLocking() then
		Talk(1, "", "<color=green>Tr¸c Thiªn Hµnh<color>: H·y më khãa r­¬ng tr­íc.");
		return
	end
	SendScript2Client("Open[[EquipRecycle]]");
end

function nothing()
end

--function qby_award()
--	local strtab = {}
--	for i = 1,getn(tQbyAward) do
--		tinsert(strtab,format("¶Ò»»[%s]£¨ĞèÒª[Çó±ØÓ¦ÁîÅÆ]%d¸ö£©/#qby_ask_award(%d)",tQbyAward[i][1],tQbyAward[i][3],i));
--	end
--	for i = 1,getn(tDSwordAward[1]) do
--		tinsert(strtab,format("¶Ò»»[%s]£¨ĞèÒªÌìÒõ·ç¡¢À×¡¢»ğÁîÅÆ¸÷%d¸ö£©/#ask_sword_award(%d,%d)",tDSwordAward[1][i][1],tDSwordAward[1][i][3],1,i));
--	end
--	for i = 1,getn(tDSwordAward[2]) do
--		tinsert(strtab,format("¶Ò»»[%s]£¨ĞèÒªÌìÒõ·ç¡¢À×¡¢»ğÁîÅÆ¸÷%d¸ö£©/#ask_sword_award(%d,%d)",tDSwordAward[2][i][1],tDSwordAward[2][i][3],2,i));
--	end
--	tinsert(strtab,"·µ»Ø/main");
--	--tinsert(strtab,"½áÊø¶Ô»°/nothing");
--	suSay(g_NpcName.."´óÏÀÏëÒª¶Ò»»ÄÄÖÖ½±ÀøÄØ£¿",
--		getn(strtab),
--		strtab)	
--end
--
--double_sword_award = qby_award;
--
--tDSwordAward[1].name = "<color=green>×¿ÌìĞĞ<color>£º";
--tDSwordAward[2].name = "<color=green>×¿ÌìĞĞ<color>£º";

function book_main()
	local szMsg = g_NpcName .. "Tu luyÖn Ch©n Vâ MËt TŞch cã thÓ gióp c¶nh giíi vâ häc cña ®¹i hiÖp t¨ng thªm mét tÇng. §¹i hiÖp cã th¾c m¾c g× vÒ viÖc tu luyÖn Ch©n Vâ MËt TŞch th× cø viÖc hái!";
	local tSel = {
		"Lµm sao më tu luyÖn Ch©n Vâ MËt TŞch/#book_introduce(1)",
		"Tu luyÖn Ch©n Vâ MËt TŞch cÇn g×?/#book_introduce(2)",
		"Lµm sao ph©n biÖt tr×nh ®é tu luyÖn Ch©n Vâ MËt TŞch?/#book_introduce(3)",
		"ChuyÓn hiÖu qu¶ Ch©n Vâ MËt TŞch/#book_introduce(4)",
		"T¸ch ch©n quyÓn/bookDecompose",
		format("%s/#show_equip_shop(3072)", "§æi Ch©n QuyÓn Tinh Hoa"),
		"HÑn gÆp l¹i/nothing",
	};
	Say(szMsg, getn(tSel), tSel);
end

BOOK_INTRO_MSG = {
	"<color=Green>Tr¸c Thiªn Hµnh<color>: Tr­íc tiªn ®¹i hiÖp cÇn chuÈn bŞ mét sè <color=Yellow>S­ M«n Ch©n QuyÓn luyÖn ®Õn cÊp 99<color>, sau khi t¸ch sÏ nhËn ®­îc <color=Yellow>Ch©n QuyÓn Tinh Hoa<color>. Dïng Ch©n QuyÓn Tinh Hoa cã thÓ ®æi <color=Yellow>Qu¸n Th«ng QuyÓn<color> vµ <color=Yellow>Ch©n Vâ Thñ Kı<color>. Dïng vµ tiªu hao 1 Qu¸n Th«ng QuyÓn cã thÓ th¨ng hoa S­ M«n Ch©n QuyÓn ®ang trang bŞ, b¾t ®Çu tu luyÖn Ch©n Vâ MËt TŞch. Tu luyÖn Ch©n Vâ MËt TŞch vÉn cã thÓ dïng Nh©n S©m Ngµn N¨m tiÕn hµnh t¨ng tèc.",
	"<color=Green>Tr¸c Thiªn Hµnh<color>: Tu luyÖn Ch©n Vâ MËt TŞch cÇn tiªu hao lŞch luyÖn. Vµo Ngù C¸c mua <color=Yellow>Ch©n Vâ Hån Th¹ch<color> vµ <color=Yellow>§¹i Ch©n Vâ Hån Th¹ch<color> nhËn ®­îc lŞch luyÖn, còng cã thÓ dïng tu vi ®Ó ®æi víi tû lÖ <color=Yellow>300:1<color>. Giíi h¹n l­u tr÷ lŞch luyÖn lµ 5000 ®iÓm.",
	"<color=Green>Tr¸c Thiªn Hµnh<color>: Sau khi ®¹i hiÖp më tu luyÖn sÏ ph¸t hiÖn, tr­íc hiÖu qu¶ cña mçi tÇng ®Òu cã 1 m¶nh Hoa V¨n Linh Long, m¶nh hoa v¨n nµy c¨n cø vµo møc ®é tu luyÖn cña tÇng ®ang luyÖn sÏ thÓ hiÖn chÊt liÖu kh¸c nhau: HiÓn thŞ lµ ®¸, tÇng nµy ch­a më hoÆc ch­a tu luyÖn; hiÓn thŞ lµ hoµng ®ång, hiÖu qu¶ tÇng nµy n»m trong kho¶ng <color=Yellow>1%-33%<color>; hiÓn thŞ lµ b¹ch ng©n, hiÖu qu¶ tÇng nµy n»m trong kho¶ng <color=Yellow>34%-66%<color>; hiÓn thŞ lµ hoµng kim, hiÖu qu¶ tÇng nµy n»m trong kho¶ng <color=Yellow>67%-99%<color>; hiÓn thŞ lµ xİch hång dung nham, hiÖu qu¶ tÇng nµy trŞ tèi ®a lµ <color=Yellow>100%<color>. HiÖu qu¶ mçi tÇng cña Ch©n Vâ MËt TŞch lµ cè ®Şnh, ®é tu luyÖn chØ kh¸c nhau vÒ mÆt trŞ sè.",
	"<color=Green>Tr¸c Thiªn Hµnh<color>: §¹i hiÖp dïng <color=Yellow>Ch©n QuyÓn Tinh Hoa<color> cã thÓ ®æi <color=Yellow>Ch©n Vâ Thñ Kı<color>. Dïng Ch©n Vâ Thñ Kı, cã thÓ mang hiÖu qu¶ cña Ch©n Vâ MËt TŞch (kh«ng bao gåm thuéc tİnh ban ®Çu cña Ch©n QuyÓn) ®ang trang bŞ viÕt xuèng. Sau khi viÕt, tiªu hao 1 Ch©n Vâ Thñ Kı sÏ nhËn ®­îc kû yÕu cña l­u ph¸i t­¬ng øng, nh­ng thao t¸c nµy sÏ <color=Yellow>xãa bá hoµn toµn<color> hiÖu qu¶ cña Ch©n Vâ MËt TŞch (kh«ng bao gåm thuéc tİnh ban ®Çu cña Ch©n QuyÓn) ®ang trang bŞ trªn ng­êi ®¹i hiÖp; tiÕp tôc dïng kû yÕu, cã thÓ tiªu hao kû yÕu nµy ®Ó ghi chĞp hiÖu qu¶ cña Ch©n Vâ MËt TŞch tr¶ vÒ cho Ch©n QuyÓn <color=Yellow>®· th¨ng hoa<color> hiÖn ®ang trang bŞ (L­u ph¸i cña ch©n quyÓn ph¶i t­¬ng øng víi kû yÕu).",
}

function book_introduce(nType)
	if not BOOK_INTRO_MSG[nType] then return end
	local szMsg = BOOK_INTRO_MSG[nType];
	local tSel = {
		"Ta cßn muèn t×m hiÓu thªm/book_main",
		"Ta biÕt råi/nothing",
	};
	Say(szMsg, getn(tSel), tSel);
end