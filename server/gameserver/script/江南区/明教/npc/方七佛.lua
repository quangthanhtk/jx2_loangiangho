--½Å±¾¹¦ÄÜ£ºÃ÷½ÌÕÆÃÅ¶Ô»°º¯Êı
--¹¦ÄÜÉè¼Æ£ºÔøÇìÏé
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2009-3-13
NPC_NAME = "<color=green>Ph­¬ng ThÊt PhËt<color>:"
PLAYER_NAME = "<color=green>Ng­êi ch¬i<color>: §­îc, ta ®i ngay!"
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\task\\faction\\faction_head.lua")
Import("\\script\\faction\\npc\\buy_sell_main.lua")


function main()
	if GetTask(1018) ==1 then
		if GetFreeItemRoom() > 3 then
			local n_fire_num = BigGetItemCount(2,0,780,1) 
			if n_fire_num < 4 then
				AddItem(2,0,780,(4 - n_fire_num))
			end
			if BigGetItemCount(2,0,785,1) == 0 then
				AddItem(2,0,785,1)
			end
			if BigGetItemCount(2,0,786,1) == 0 then
				AddItem(2,0,786,1)
			end
			Talk(3,"",
				NPC_NAME.."§©y lµ 4 Háa Chung, 1 R­îu M¹nh vµ 1 Gµ Quay, h·y cÇm lÊy.",
				PLAYER_NAME.."Sao l¹i cã thªm 2 thø?",
				NPC_NAME.."Muèn lÊy Háa Chñng ®­¬ng nhiªn ph¶i hiÓu râ tİnh t×nh cña c¸c vŞ Ph¸p V­¬ng, gi¸o chñ cã thÓ ch­a nãi víi ng­¬i, §¹i V©n Ph¸p V­¬ng <color=green>V­¬ng DÇn<color> rÊt thİch uèng r­îu, cßn Xİch DiÖm Ph¸p V­¬ng <color=green>T­ Hµnh Ph­¬ng<color> l¹i rÊt thİch ¨n, ng­¬i mang nh÷ng thø nµy ®i lÊy Háa Chñng sÏ dÔ dµng h¬n nhiÒu. H·y mau t×m Quang Minh H÷u Sø <color=green>HÇu §«n<color> (189/185) lÊy Thanh TŞnh Háa Chñng tr­íc."
			)
			SetTask(1018,2)
			TaskTip("T×m Quang Minh H÷u Sø HÇu §«n lÊy Thanh TŞnh Háa Chñng")
			Msg2Player("T×m Quang Minh H÷u Sø HÇu §«n (189/185) lÊy Thanh TŞnh Háa Chñng")
		else
			Talk(1,"",NPC_NAME.."Tr­íc khi lÊy Háa Chung h·y s¾p xÕp l¹i tói! (CÇn <color=yellow>4<color> «!)")
			return
		end
	
	elseif GetTask(1018)==2 then
		Talk(1,"",NPC_NAME.."Quang Minh H÷u Sø <color=green>HÇu §«n<color> (189/185) ë c¸ch ®©y kh«ng xa, h·y ®i gÆp «ng Êy ®Ó lÊy Thanh TŞnh Háa Chñng.")
	else
		local sDiaHead,tDiaSel = faction_buysell_main(9)
		Say(sDiaHead,getn(tDiaSel),tDiaSel)
		--sale_main(9)
	end
end
