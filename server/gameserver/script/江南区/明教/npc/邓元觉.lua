--½Å±¾¹¦ÄÜ£ºÃ÷½ÌÕÆÃÅ¶Ô»°º¯Êı
--¹¦ÄÜÉè¼Æ£ºÔøÇìÏé
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2009-3-13
Include("\\script\\task\\global_task\\gtask_head.lua");

NPC_NAME = "<color=green>§Æng Nguyªn Gi¸c<color>:"

function main()
	if tGtTask:check_cur_task(135) == 1 then
		tGtNpcMain:npc_main();
		return 0;
	end
	if	GetTask(1018) == 6 then
		if	GetItemCount(2,0,781) > 0 and GetItemCount(2,0,782) > 0 and GetItemCount(2,0,783) > 0 and GetItemCount(2,0,784) > 0  then
			Talk(1,"",NPC_NAME.."m, lµm tèt l¾m, ®· thu thËp ®ñ 4 Háa Chñng råi, th¸nh háa sÏ cã thÓ ch¸y m·i kh«ng ngít. Ng­¬i lµm tèt l¾m, ta sÏ ph¸i ng­êi ®i bÈm b¸o gi¸o chñ (182/188), ng­¬i h·y quay vÒ phôc mÖnh víi «ng Êy.")
			for i = 781,784 do
				DelItem(2,0,i,1)
			end
			SetTask(1018,7)
			TaskTip("T×m Ph­¬ng L¹p (182/188) gia nhËp Minh Gi¸o")
			Msg2Player("T×m Ph­¬ng L¹p (182/188) gia nhËp Minh Gi¸o")
		else
			Talk(1,"",NPC_NAME.."Duy tr× th¸nh háa cÇn 4 Háa Chñng: Thanh TŞnh, Quang Minh, §¹i Lùc, Trİ TuÖ, sau khi thu thËp ®ñ h·y ®Õn t×m ta!")
		end
	elseif	GetTask(1018) == 7 then
		Talk(1,"",NPC_NAME.."Gi¸o chñ vÉn ®ang ®îi ng­¬i ®Êy, mau ®i t×m ®Ó gia nhËp.")
	else
		if random(1000) < 500 then
			Talk(1,"",NPC_NAME.."Minh Gi¸o x­a nay lu«n t«n sïng ¸nh s¸ng vµ th¸nh háa, th©n lµ Th¸nh Háa §µn Hé Ph¸p, tr¸ch nhiÖm b¶o vÖ th¸nh háa rÊt nÆng nÒ.")
		else
			Talk(1,"",NPC_NAME.."Th¸nh háa hõng hùc, thiªu ®èt th©n ta, sèng cã g× vui, chÕt cã g× buån.")
		end
	end
	
end
