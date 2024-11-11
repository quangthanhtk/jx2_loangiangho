Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\lib\\define.lua");
Include("\\script\\lib\\sdb.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\lib\\date.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Import("\\script\\task\\global_task\\gtask_data.lua");
Include("\\script\\online_activites\\award.lua")

--Ìõ¼ş¼ì²é----------------------------------------
function scCheckLevel()
	-- if GetLevel() < 80 then
	-- 	return 0
	-- end
	-- return 1
	Talk(1,"","<color=red>Tİnh n¨ng ®· ®ãng, h·y quı träng tµi kho¶n cña m×nh ,®õng lµm nh÷ng viÖc vi ph¹m!<color>")
	return 0
end

function scCheckTask()
	-- if tGtTask:check_task() ~= 1 then
	-- 	return 0
	-- end
	-- if tGtTask:_CheckRoomWeight("3;50") ~= 1 then
	-- 	return 0
	-- end
	-- return 1
	Talk(1,"","<color=red>Tİnh n¨ng ®· ®ãng, h·y quı träng tµi kho¶n cña m×nh ,®õng lµm nh÷ng viÖc vi ph¹m!<color>")
	return 0
end

--Ã¿´ÎÍ¶Èû×ÓĞèÒªÏûºÄ-----------------------------
--³É¹¦·µ»Ø1
--Ê§°Ü·µ»Ø0
function scCostResources()
	local nRet, nMax = ModifyEnergy(-4, 1);
	if nRet == -1 then
		return 0;
	end
	return 1;
end

--ÈÎÎñ------------------------------------------
function scAcceptTask(nTaskID)
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 1 then
		return 1
	end
	return OpenGTask(nTaskID)
end

function scFinishTask(nTaskID)
	-- if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
	-- 	return 1
	-- end
	
	-- if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
	-- 	return 6
	-- end
	
	-- --Ìõ¼ş¼ì²â
	-- local nCanOver = tGtTask:IsTaskCanOver(nTaskID)
	-- if nCanOver ~= 1 then
	-- 	return 2
	-- end
	
	-- --½áÊøÇ°¶¯×÷£º²ß»®Éè¶¨£¬É¾³ı
	-- if tGtCondition:del_item_confirm(tGtNpcInfo[nTaskID]["data"][10]) == nil then
	-- 	return 4;
	-- end
	
	-- --´ÓmanageÖĞÒÆ³ı
	-- tGtTaskManage:DeleteTask(nTaskID, 1)
	
	-- --½áÊø¶¯×÷
	-- --ÌØĞ§
	-- SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 907, 2, 0);
	
	-- Msg2Player(format("ÄúÒÑÍê³ÉÈÎÎñ:%s", tGtNpcInfo[nTaskID].name))
	
	-- --¸øÓë½±Àø
	-- tGtTask:DoPrize(nTaskID)
	-- tGtNpcMain:ShowAward(nTaskID)
	
	-- --»î¶¯
	-- vaf_get_prize_item_30709(2, 1);
	Talk(1,"","<color=red>Tİnh n¨ng ®· ®ãng, h·y quı träng tµi kho¶n cña m×nh ,®õng lµm nh÷ng viÖc vi ph¹m!<color>")
	return 1
end

function scConfirmPassTask(nTaskID)
--manageÖĞÊÇ·ñ½ÓÁË,Ã»½ÓµÄ»°Ö±½Ó·µ»ØPass³É¹¦
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 1
	end
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 6
	end
	local strTab = {
		format("\n§ång ı tiªu hao %s nh¶y qua nhiÖm vô nµy/StateChessPassTask", "Hu©n ch­¬ng anh hïng"),
		"\nKh«ng, muèn tù tay hoµn thµnh nhiÖm vô/nothing",
	};
	Say(format("Nh¶y qua nhiÖm vô (NhËn ®­îc phÇn th­ëng nhiÖm vô), cÇn tiªu hao <color=red>%d<color> %s", 2, "Hu©n ch­¬ng anh hïng"), getn(strTab), strTab);
	return 1;
end

function scPassTask(nTaskID)
	-- --manageÖĞÊÇ·ñ½ÓÁË,Ã»½ÓµÄ»°Ö±½Ó·µ»ØPass³É¹¦
	-- if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
	-- 	return 1
	-- end
	
	-- if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
	-- 	return 6
	-- end
	
	-- --Ìõ¼ş¼ì²â
	-- local nCanOver = tGtTask:IsTaskCanOver(nTaskID)
	-- if nCanOver == 1 then
	-- 	Talk(1,"","ÈÎÎñÒÑÍê³É£¬²»ÄÜÌø¹ı£¡")
	-- 	return 2
	-- end
	
	-- if GetItemCount(2, 1, 30499) < 2 then
	-- 	Talk(1,"",format("[%s]ÊıÁ¿²»×ã<color=red>%d<color>¸ö", "Ó¢ĞÛÑ«ÕÂ", 2))
	-- 	return 3;
	-- end
	-- if DelItem(2, 1, 30499, 2) ~= 1 then
	-- 	return 4;
	-- end
	-- Msg2Player(format("ÄãÏûºÄÁË%s*%d", "Ó¢ĞÛÑ«ÕÂ", 2));
	
	-- --½áÊøÇ°¶¯×÷£º²ß»®Éè¶¨£¬É¾³ı
	-- tGtCondition:del_item_confirm(tGtNpcInfo[nTaskID]["data"][10])

	-- --É¾³ı´¥·¢Æ÷
	-- tGtTask:remove_trigger(nTaskID);
	
	-- --½áÊø¶¯×÷
	-- --ÌØĞ§
	-- SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 907, 2, 0);
	
	-- --´ÓmanageÖĞÒÆ³ı
	-- tGtTaskManage:DeleteTask(nTaskID, 1)
	
	-- --¸øÓë½±Àø
	-- tGtTask:DoPrize(nTaskID)
	-- tGtNpcMain:ShowAward(nTaskID)
	
	-- --»î¶¯
	-- vaf_get_prize_item_30709(2, 1);
	Talk(1,"","<color=red>Tİnh n¨ng ®· ®ãng, h·y quı träng tµi kho¶n cña m×nh ,®õng lµm nh÷ng viÖc vi ph¹m!<color>")
	return 1
end

function scDeleteTask(nTaskID)
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 1
	end
	return tGtTaskManage:DeleteTask(nTaskID)
end

--ÈÕÖ¾--------------------------------------------------
function scDailyLogDataModify(nRound, nCell, nValue)
	WriteLog(format("[Tr­îng KiÕm Thiªn Nhai] [NhiÖm vô biÕn hãa] [Nh©n vËt: %s, tµi kho¶n: %s] [Sè vßng: %d, vŞ trİ: %d, biÕn l­îng: %d]", GetName(), GetAccount(), nRound, nCell, nValue))
end

--½øÈëÏÂÒ»È¦ÏûºÄ-----------------------------------------
function scConfirmRoundOver(nRound)
	local strTab = {
		format("\n§ång ı tiªu hao %s ®Ó b­íc vµo vßng tiÕp theo/StateChessRoundOver", "Hu©n ch­¬ng anh hïng"),
		"\nT¹m thêi kh«ng cÇn/nothing",
	};
	Say(format("Chóc mõng, ®· hoµn thµnh vßng <color=green>%d<color>, b­íc vµo vßng tiÕp theo cÇn tiªu hao <color=red>%d<color> %s", nRound, 4 + (nRound - 1) * 4, "Hu©n ch­¬ng anh hïng"), getn(strTab), strTab);
	return 1;
end

--½øÈëÏÂÒ»È¦ÏûºÄ
--³É¹¦·µ»Ø1
--Ê§°Ü·µ»Ø0
function scRoundOver(nRound)
	local nValue = 4 + (nRound - 1) * 4;
	if GetItemCount(2, 1, 30499) < nValue then
		Talk(1,"",format("Sè l­îng [%s] kh«ng ®ñ <color=red>%d<color> c¸i", "Hu©n ch­¬ng anh hïng", nValue))
		return 0;
	end
	if DelItem(2, 1, 30499, nValue) ~= 1 then
		return 0;
	end
	Msg2Player(format("§· tiªu hao %s*%d", "Hu©n ch­¬ng anh hïng", nValue));
	return 1;
end

--ÊÇ·ñÏûºÄÒø„»»ñÈ¡ºÃÔËµØÍ¼½±Àø--------------------------
function scConfirmFinishGl(nType)
	local strTab = {
		format("\n§ång ı tiªu hao %s nhËn phÇn th­ëng/StateChessFinishGl", "Hu©n ch­¬ng anh hïng"),
		"\nT¹m thêi kh«ng cÇn/nothing",
	};
	Say(format("Chµo mõng ®Õn víi <color=green>b¶n ®å may m¾n<color>, tham gia cÇn tiªu hao <color=red>%d<color> %s", 2, "Hu©n ch­¬ng anh hïng"), getn(strTab), strTab);
	return 1;
end

--³É¹¦·µ»Ø1
--Ê§°Ü·µ»Ø0
function scFinishGl(nType)
	if GetItemCount(2, 1, 30499) < 2 then
		Talk(1,"",format("Sè l­îng [%s] kh«ng ®ñ <color=red>%d<color> c¸i", "Hu©n ch­¬ng anh hïng", 2))
		return 0;
	end
	if DelItem(2, 1, 30499, 2) ~= 1 then
		return 0;
	end
	Msg2Player(format("§· tiªu hao %s*%d", "Hu©n ch­¬ng anh hïng", 2));
	return 1;
end

--ÊÇ·ñÏûºÄÒø„»»ñÈ¡Ëæ»úµØÍ¼½±Àø--------------------------
function scConfirmFinishEv(nType)
	local strTab = {
		format("\n§ång ı tiªu hao %s nhËn phÇn th­ëng/StateChessFinishEv", "Hu©n ch­¬ng anh hïng"),
		"\nT¹m thêi kh«ng cÇn/nothing",
	};
	Say(format("Chµo mõng ®Õn víi <color=green>b¶n ®å sù kiÖn ngÉu nhiªn<color>, tham gia cÇn tiªu hao <color=red>%d<color> %s", 2, "Hu©n ch­¬ng anh hïng"), getn(strTab), strTab);
	return 1;
end

--³É¹¦·µ»Ø1
--Ê§°Ü·µ»Ø0
function scFinishEv(nType)
	if GetItemCount(2, 1, 30499) < 2 then
		Talk(1,"",format("Sè l­îng [%s] kh«ng ®ñ <color=red>%d<color> c¸i", "Hu©n ch­¬ng anh hïng", 2))
		return 0;
	end
	if DelItem(2, 1, 30499, 2) ~= 1 then
		return 0;
	end
	Msg2Player(format("§· tiªu hao %s*%d", "Hu©n ch­¬ng anh hïng", 2));
	return 1;
end


--ºÃÔËµØÍ¼½±Àø------------------------------------------
function scGoodLuck(nValue)
	--print("nValue =", nValue)
	-- if 1 == nValue then
	-- 	local tAward = {
	-- 		{3, 5, 50000, 1},
	-- 		{3, 30, 100000, 1},
	-- 		{3, 30, 150000, 1},
	-- 		{3, 20, 200000, 1},
	-- 		{3, 5, 250000, 1},
	-- 		{3, 5, 300000, 1},
	-- 		{3, 2, 500000, 1},
	-- 		{3, 1, 600000, 1},
	-- 		{3, 1, 800000, 1},
	-- 		{3, 1, 2000000, 1},
	-- 	}
	-- 	local nRand = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1)
	-- 	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "ÕÌ½£ÌìÑÄ", "²ÆÉñÃí", nRand)
	-- 	Talk(1,"",format("Äã»ñµÃ<color=green>%d%s<color>", tAward[nRand][3]/10000, "½ğ×Ó"))
	-- 	return 1;
	-- elseif 2 == nValue then
	-- 	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
	-- 		return 0;
	-- 	end
	-- 	local tAward = {
	-- 		{1, 20},
	-- 		{2, 20},
	-- 		{3, 20},
	-- 		{4, 15},
	-- 		{5, 15},
	-- 		{6, 5},
	-- 		{8, 2},
	-- 		{10, 1},
	-- 		{12, 1},
	-- 		{16, 1},
	-- 	}
	-- 	local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
	-- 	local tGem = {
	-- 		{2,	22, 101, "1¼¶ÑªµÎÊ¯"},
	-- 		{2,	22, 201, "1¼¶ÔÂ°×Ê¯"},
	-- 		{2,	22, 301, "1¼¶çúçêÊ¯"},
	-- 		{2,	22, 401, "1¼¶ºÚê×Ê¯"},
	-- 	}
	-- 	local nRand = random(getn(tGem));
	-- 	gf_AddItemEx2({tGem[nRand][1], tGem[nRand][2], tGem[nRand][3], tAward[nIndex][1]}, tGem[nRand][4], "ÕÌ½£ÌìÑÄ", "Ç®×¯", 0, 1);
	-- 	Talk(1,"",format("Äã»ñµÃ<color=green>%d¸ö%s<color>", tAward[nIndex][1], tGem[nRand][4]))
	-- 	return 1;
	-- elseif 3 == nValue then
	-- 	local tAward = {
	-- 		{38, 5, 10, 1},
	-- 		{38, 10, 15, 1},
	-- 		{38, 20, 20, 1},
	-- 		{38, 40, 25, 1},
	-- 		{38, 15, 30, 1},
	-- 		{38, 5, 35, 1},
	-- 		{38, 2, 40, 1},
	-- 		{38, 1, 45, 1},
	-- 		{38, 1, 50, 1},
	-- 		{38, 1, 60, 1},
	-- 	}
	-- 	local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
	-- 	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "ÕÌ½£ÌìÑÄ", "Ò½¹İ", nIndex)
	-- 	Talk(1,"",format("Äã»ñµÃ<color=green>%dµã%s<color>", tAward[nIndex][3], "¾«Á¦"))
	-- 	return 1;
	-- end
	Talk(1,"","<color=red>Tİnh n¨ng ®· ®ãng, h·y quı träng tµi kho¶n cña m×nh ,®õng lµm nh÷ng viÖc vi ph¹m!<color>")
	return 0;
end

--Ëæ»úÊÂ¼ş½±Àø------------------------------------------
function scEvent(nValue)
	-- if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
	-- 	return 0;
	-- end
	-- local tAward = {
	-- 	{2, 1500, 10000000,1},
	-- 	{2, 1000, 20000000, 1},
	-- 	{2, 500,  40000000, 1},
	-- 	{3, 500,  100000, 1},
	-- 	{3, 1300, 150000, 1},
	-- 	{3, 1000, 200000, 1},
	-- 	{3, 100,  300000, 1},
	-- 	{31, 1583, "sc_GetEventGemAward(1)", 0},
	-- 	{31, 800, "sc_GetEventGemAward(2)", 0},
	-- 	{31, 200, "sc_GetEventGemAward(4)", 0},
	-- 	{1, 1000, "ĞşÑ×Ìú", {2, 1, 30670, 1}, 0},
	-- 	{1, 300, "ĞşÑ×Ìú", {2, 1, 30670, 2}, 0},
	-- 	{1, 100, "ĞşÑ×Ìú", {2, 1, 30670, 4}, 0},
	-- 	{1, 100, "ĞşÑ×Ìú", {2, 1, 30670, 8}, 0},
	-- 	{1, 1, "ÁéÍ½µ¶", {0, 3 , 30207, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½ÕÈ", {0, 8 , 30208, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½ÊÖ", {0, 0 , 30209, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½Õë", {0, 1 , 30210, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½½£", {0, 2 , 30211, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½ÇÙ", {0, 10, 30212, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½ÊÖ", {0, 0 , 30213, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½¹÷", {0, 5 , 30214, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½½£", {0, 2 , 30215, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½±Ê", {0, 9 , 30216, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½Ç¹", {0, 6 , 30217, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½¹­", {0, 4 , 30218, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½µ¶", {0, 7 , 30219, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½×¦", {0, 11, 30220, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½½£", {0, 2 , 30221, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½ÉÈ", {0, 13, 30222, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½µÑ", {0, 12, 30223, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- }
	-- local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1)
	-- gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "ÕÌ½£ÌìÑÄ", "Ëæ»úµØÍ¼", nIndex);
	-- if tAward[nIndex][1] == 1 then
	-- 	Talk(1,"",format("Äã»ñµÃ<color=green>%d¸ö%s<color>", tAward[nIndex][4][4], tAward[nIndex][3]))
	-- elseif tAward[nIndex][1] == 2 then
	-- 	Talk(1,"",format("Äã»ñµÃ<color=green>%d%s<color>", tAward[nIndex][3], "¾­Ñé"))
	-- elseif tAward[nIndex][1] == 3 then
	-- 	Talk(1,"",format("Äã»ñµÃ<color=green>%d%s<color>", tAward[nIndex][3]/10000, "½ğ×Ó"))
	-- end
	-- return 1;
	Talk(1,"","<color=red>Tİnh n¨ng ®· ®ãng, h·y quı träng tµi kho¶n cña m×nh ,®õng lµm nh÷ng viÖc vi ph¹m!<color>")
	return 0
end

function sc_GetEventGemAward(nNum)
	-- local tGem = {
	-- 	{2,	22, 101, "1¼¶ÑªµÎÊ¯"},
	-- 	{2,	22, 201, "1¼¶ÔÂ°×Ê¯"},
	-- 	{2,	22, 301, "1¼¶çúçêÊ¯"},
	-- 	{2,	22, 401, "1¼¶ºÚê×Ê¯"},
	-- }
	-- local nRand = random(getn(tGem));
	-- gf_AddItemEx2({tGem[nRand][1], tGem[nRand][2], tGem[nRand][3], tonumber(nNum) or 1}, tGem[nRand][4], "ÕÌ½£ÌìÑÄ", "Ëæ»úµØÍ¼", 0, 1);
	-- Talk(1,"",format("Äã»ñµÃ<color=green>%d¸ö%s<color>", nNum, tGem[nRand][4]))
	Talk(1,"","<color=red>Tİnh n¨ng ®· ®ãng, h·y quı träng tµi kho¶n cña m×nh ,®õng lµm nh÷ng viÖc vi ph¹m!<color>")
end

function scCheckFreeRoom()
	-- if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
	-- 	return 0;
	-- end
	-- return 1;
	return 0
end

--Ã¿È¦½±Àø----------------------------------------------
function scDoPrize(nExp, nBagCount, nBagCountEx)
	--print("scDoPrize =", nExp, nBagCount, nBagCountEx)
	-- gf_ModifyExp(nExp);
	-- local nTotal = nBagCount;
	-- gf_AddItemEx2({2, 1, 30703, nBagCount}, "ÕÌ½£ÌìÑÄ°ü", "ÕÌ½£ÌìÑÄ", "Ã¿È¦½±Àø", 0, 1);
	-- if nBagCountEx > 0 then
	-- 	gf_AddItemEx2({2, 1, 30703, nBagCountEx}, "ÕÌ½£ÌìÑÄ°ü", "ÕÌ½£ÌìÑÄ", "Ã¿È¦½±Àø", 0, 1);
	-- 	nTotal = nTotal + nBagCountEx;
	-- end
	-- Say(format("Äã»ñµÃÕÌ½£ÌìÑÄÃ¿È¦½±Àø£º<color=green>EXP£º%d, ÕÌ½£ÌìÑÄ°ü*%d<color>", nExp, nTotal), 0);
	-- WriteLog(format("[ÕÌ½£ÌìÑÄ][Ã¿È¦½±Àø][½ÇÉ«:%s,ÕÊºÅ:%s][¾­Ñé:%d,ÕÌ½£ÌìÑÄ°ü:%d]", GetName(), GetAccount(), nExp, nTotal))
	Talk(1,"","<color=red>Tİnh n¨ng ®· ®ãng, h·y quı träng tµi kho¶n cña m×nh ,®õng lµm nh÷ng viÖc vi ph¹m!<color>")
end

--ÕÌ½£ÌìÑÄ°ü
function OnUse(nItem)
	-- if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
	-- 	return 0;
	-- end
	-- if DelItemByIndex(nItem, 1) ~= 1 then
	-- 	return 0;
	-- end
	-- gf_AddItemEx2({2,1,30670,1}, "Ñ×ĞşÌú", "ÕÌ½£ÌìÑÄ", "ÕÌ½£ÌìÑÄ°ü");
	-- Earn(40000);
	-- local tAward = {
	-- 	{2, 1000, 2000000, 1},
	-- 	{2, 1000, 5000000, 1},
	-- 	{2, 500, 10000000, 1},
	-- 	{3, 1000, 10000, 1},
	-- 	{3, 500, 50000, 1},
	-- 	{3, 400, 100000, 1},
	-- 	{3, 100, 300000, 1},
	-- 	{1, 1500, "Ñ×ĞşÌú", {2, 1, 30670, 1}, 0},
	-- 	{1, 1000, "Ñ×ĞşÌú", {2, 1, 30670, 2}, 0},
	-- 	{1, 500, "Ñ×ĞşÌú", {2, 1, 30670, 4}, 0},
	-- 	{1, 500, "Ñ×ĞşÌú", {2, 1, 30670, 8}, 0},
	-- 	{1, 500, "°ãÈôÊ÷ÖÖ", {2, 0, 398, 1, 4}, 0},
	-- 	{1, 600, "Ğ¡°ãÈôÊ÷ÖÖ", {2, 0, 504, 1, 4}, 0},
	-- 	{1, 500, "ËÄÁéÊ÷", {2, 1, 30269, 1, 4}, 0},
	-- 	{1, 383, "ÖÖ×Ó°ü", {2, 1, 30087, 1, 4}, 0},
	-- 	{1, 1, "ÁéÍ½µ¶", {0, 3 , 30207, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½ÕÈ", {0, 8 , 30208, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½ÊÖ", {0, 0 , 30209, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½Õë", {0, 1 , 30210, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½½£", {0, 2 , 30211, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½ÇÙ", {0, 10, 30212, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½ÊÖ", {0, 0 , 30213, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½¹÷", {0, 5 , 30214, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½½£", {0, 2 , 30215, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½±Ê", {0, 9 , 30216, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½Ç¹", {0, 6 , 30217, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½¹­", {0, 4 , 30218, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½µ¶", {0, 7 , 30219, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½×¦", {0, 11, 30220, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½½£", {0, 2 , 30221, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½ÉÈ", {0, 13, 30222, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- 	{1, 1, "ÁéÍ½µÑ", {0, 12, 30223, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	-- }
	-- gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "ÕÌ½£ÌìÑÄ", "ÕÌ½£ÌìÑÄ°ü")
	Talk(1,"","<color=red>Tİnh n¨ng ®· ®ãng, h·y quı träng tµi kho¶n cña m×nh ,®õng lµm nh÷ng viÖc vi ph¹m!<color>")
	return 0
end
