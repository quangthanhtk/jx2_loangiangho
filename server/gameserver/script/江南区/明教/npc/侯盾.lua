--½Å±¾¹¦ÄÜ£ºÃ÷½ÌÕÆÃÅ¶Ô»°º¯Êı
--¹¦ÄÜÉè¼Æ£ºÔøÇìÏé
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2009-3-13
NPC_NAME = "<color=green>HÇu §«n<color>:"
function main()
	if GetTask(1018) ==2 and BigGetItemCount(2,0,781) == 0 then
		if GetItemCount(2,0,780) == 0 then
			Talk(1,"",NPC_NAME.."Kh«ng cã Háa Chung lµm sao lÊy Háa Chñng, h·y t×m <color=green>Ph­¬ng ThÊt PhËt<color> (185/189) lÊy Háa Chung!")
		else
			Talk(1,"",NPC_NAME.."§©y lµ <color=yellow>Thanh TŞnh Háa Chung<color>, h·y cÇm lÊy. TiÕp theo h·y ®i t×m <color=green>V­¬ng DÇn<color> (195/189).")
			DelItem(2,0,780,1)
			AddItem(2,0,781,1)
			SetTask(1018,3)
			TaskTip("T×m §¹i V©n Ph¸p V­¬ng-V­¬ng DÇn lÊy Quang Minh Háa Chñng")
			Msg2Player("T×m §¹i V©n Ph¸p V­¬ng-V­¬ng DÇn (195/189) lÊy Quang Minh Háa Chñng")
		end
	elseif GetTask(1018) ==3 then
		Talk(1,"",NPC_NAME.."V­¬ng DÇn (195/189) ë phİa tr­íc.")
	else
		if random(1000) == 137 then
			Talk(1,"",NPC_NAME.."T×m ta cã viÖc g×?")
		else
			Talk(1,"",NPC_NAME.."Thanh TŞnh, Quang Minh, §¹i Lùc, Trİ TuÖ' lµ gi¸o nghÜa cña bæn gi¸o, Th¸nh Háa Háa Chñng do ta vµ 3 Ph¸p V­¬ng qu¶n lı.")
		end
	end
end
