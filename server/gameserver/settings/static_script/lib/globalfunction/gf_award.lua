--°ÑÒ»¸öÁĞ±íÖĞµÄËùÓĞÎïÆ·¸øÍæ¼Ò
--±í½á¹¹ = {
--      {ÀàĞÍ=1(ÎïÆ·), Ãû×Ö, {id1,id2,id3,count}, ´æÔÚÊ±¼ä(ÎŞÏŞÖÆÌî0), ÊÇ·ñMsg2Player},
--      {ÀàĞÍ=2(¾­Ñé), ÊıÁ¿, 1=ÒªMsg2Player£¬0»ò²»Ìî±íÊ¾²»Ğè},
--}
--{ÀàĞÍ=3(½ğÇ®), ÊıÁ¿£¨µ¥ÊÇÍ­£©}
--{ÀàĞÍ=4(ÉùÍû), ÊıÁ¿, 1=ÒªMsg2Player£¬0²»ĞèÒª}
--{ÀàĞÍ=5(Ê¦ÃÅ¹±Ï×¶È), ÊıÁ¿, 1=ÒªMsg2Player£¬0»ò²»Ìî±íÊ¾²»ĞèÒª}
--...²Î¼ûgf_EventGiveCustomAwardÖĞµÄË÷ÒıÖµ£¬´Ë´¦Ë÷Òı±ÈÆäË÷ÒıÖµ´ó1
--{ÀàĞÍ=31(×Ô¶¨ÒåÃüÁî), "×Ô¶¨µÄÃüÁî£¨ĞèÒªdostringµÄ´úÂë£©", "×Ô¶¨ÒåµÄMsg2Player£¬Èç¹û²»Ìî±íÊ¾²»ĞèÒª"}
--²ÎÊı£ºszLogTitle ÈÕÖ¾¼ÇÂ¼±êÌâ
--²ÎÊı£ºszLogAction ÈÕ¼ÇÖĞ¼ÇÂ¼µÄĞĞÎª
function gf_EventGiveAllAward(AllAwardList, szLogTitle, szLogAction,tAddRate)
    for i = 1, getn(AllAwardList) do
        local tbSubAward = AllAwardList[i];
        local nType = tbSubAward[1];
        if nType == 1 then--ÎïÆ·
            gf_AddItemEx2(tbSubAward[3], tbSubAward[2], szLogTitle, szLogAction, tbSubAward[4], tbSubAward[5]);
        else
            gf_EventGiveCustomAward(nType - 1, tbSubAward[2], tbSubAward[3], szLogTitle, szLogAction, 0, tAddRate);
        end
    end
end


--¿ªÏä×Ó¸øËæ»ú½±Àø,µ÷ÓÃ´Ëº¯ÊıÇ°ÇëÏÈÅĞ¶Ï±³°üºÍ¸ºÖØ
--²ÎÊı£ºRandAwardList =
--{ÀàĞÍ=1(ÎïÆ·), ¸ÅÂÊ, Ãû×Ö, {id1,id2,id3,count}, ´æÔÚÊ±¼ä(ÎŞÏŞÖÆÌî0), £¨ÌØÊâ´¦Àí0ÎªÎŞÌØÊâ´¦Àí1Îª°´ÌåĞÍ¸ø2Îª°´Á÷ÅÉ¸ø£©}
--µ±µÚÁù¸ö²ÎÊıÊÇ1Ê±£¬ÊÇ°´ÌåĞÍ¸ø£¬ËùÒÔ²ÎÊı4µÄÊÇ¸ötable£¬ÆäÄÚÈİÊÇ
--                                                     {
--                                                      {"ÎïÆ·Ãû×Ö", {id1,id2,id3,count}}, --ÌåĞÍ1
--                                                      {"ÎïÆ·Ãû×Ö", {id1,id2,id3,count}}, --ÌåĞÍ2
--                                                      {"ÎïÆ·Ãû×Ö", {id1,id2,id3,count}}, --ÌåĞÍ3
--                                                      {"ÎïÆ·Ãû×Ö", {id1,id2,id3,count}}, --ÌåĞÍ4
--                                                     }
--µ±µÚÁù¸ö²ÎÊıÊÇ2Ê±£¬ÊÇ°´Á÷ÅÉ¸ø£¬ËùÒÔ²ÎÊı4Ò²ÊÇ¸ötable£¬µ«ÊÇ´ËÊ±ÒªÉèÒ»ÏÂµÚ7¸ö²ÎÊı£¬ÓÃÀ´±íÊ¾Èç¹ûÍæ¼ÒÃ»ÓĞÈëÁ÷ÅÉ¸øÒ»¸ö±ğµÄÎïÆ·µÄË÷Òı£¬ÆäÄÚÈİÊÇ
--                                                     {
--                                                      --Á÷ÅÉ¶ÔÓ¦ÎïÆ·µÄÁĞ±í
--                                                        [1] = {
--                                                        {"Ãû×Ö"£¬ ¸ÅÂÊ, {id1,id2,id3,ÊıÁ¿...}},--ÓÉÓÚÄ³Ğ©Á÷ÅÉÓĞ¶àÖÖ¶«Î÷£¬ËùÒÔÕâÀï»¹ÊÇÒªËæ»úÒ»ÏÂ
--                                                        {"Ãû×Ö"£¬ ¸ÅÂÊ, {id1,id2,id3,ÊıÁ¿...}},
--                                                        {"Ãû×Ö"£¬ ¸ÅÂÊ, {id1,id2,id3,ÊıÁ¿...}},
--                                                      },
--                                                      {--Èç¹ûÖ»ÓĞÒ»¸öÎïÆ·£¬¸ÅÂÊ¾ÍÌî100
--                                                        [2] = {"Ãû×Ö", 100¸ÅÂÊ, {id1,id2,id3,ÊıÁ¿...}},
--                                                      },
--                                                     }
-- ËÄÖÖÌåĞÍµÄÎïÆ·¼¯ºÏÁĞ±í
--{ÀàĞÍ=2(¾­Ñé), ¸ÅÂÊ, ÊıÁ¿, 1=ÒªMsg2Player£¬0»ò²»Ìî±íÊ¾²»Ğè}
--{ÀàĞÍ=3(½ğÇ®), ¸ÅÂÊ, ÊıÁ¿£¨µ¥ÊÇÍ­£©}
--{ÀàĞÍ=4(ÉùÍû), ¸ÅÂÊ, ÊıÁ¿, 1=ÒªMsg2Player£¬0²»ĞèÒª}
--{ÀàĞÍ=5(Ê¦ÃÅ¹±Ï×¶È), ¸ÅÂÊ, ÊıÁ¿, Èç¹ûÍæ¼ÒÃ»ÈëÃÅÅÉÑ¡Ôñ´úÌæµÄË÷Òı, 1=ÒªMsg2Player£¬0»ò²»Ìî±íÊ¾²»ĞèÒª}
--...²Î¼ûgf_EventGiveCustomAwardÖĞµÄË÷ÒıÖµ£¬´Ë´¦Ë÷Òı±ÈÆäË÷ÒıÖµ´ó1
--{ÀàĞÍ=31(×Ô¶¨ÒåÃüÁî), ¸ÅÂÊ, "×Ô¶¨µÄÃüÁî£¨ĞèÒªdostringµÄ´úÂë£©", "×Ô¶¨ÒåµÄMsg2Player£¬Èç¹û²»Ìî±íÊ¾²»ĞèÒª"}
--²ÎÊı£ºnMaxPE ÊÇ¸ÅÂÊµÄ×î´óÖµ
--²ÎÊı£ºnDefault Èç¹ûÃ»ÓĞËæ»úµ½£¬ÔòÊ¹ÓÃ´ËÄ¬ÈÏÖµ
--²ÎÊı£ºszLogTitle ÈÕÖ¾¼ÇÂ¼±êÌâ
--²ÎÊı£ºszLogAction ÈÕ¼ÇÖĞ¼ÇÂ¼µÄĞĞÎª
function gf_EventGiveRandAward(RandAwardList, nMaxPE, nDefault, szLogTitle, szLogAction, nRand, bZhenQiTag)
	if RandAwardList == nil or getn(RandAwardList) == 0 or nMaxPE ==0 or nMaxPE == nil then
		return 0;
	end
	if nRand == nil or nRand < 1 then
  	nRand = gf_GetRandItemByTable(RandAwardList, nMaxPE, nDefault);
  end
  local nPlayerRoute = GetPlayerRoute();
  local tbSelected = RandAwardList[nRand];
  if tbSelected[1] == 5 and nPlayerRoute == 0 then
    nRand = tbSelected[4];
    tbSelected = RandAwardList[nRand];--Èç¹ûËæ»úµ½µÄÊÇ¸øÊ¦ÃÅ¹±Ï×¶ÈÇÒÍæ¼ÒÃ»ÈëÃÅÅÉ£¬Ôò»»Ò»¸öÔ¤¶¨ºÃµÄÑ¡Ïî
  end
  if tbSelected[1] == 1 and (tbSelected[7] ~= 0 and tbSelected[7] ~= nil) then
    if gf_CheckPlayerRoute(nPlayerRoute) == 0 then--Ã»ÈëÁ÷ÅÉ
      nRand = tbSelected[7];
      tbSelected = RandAwardList[nRand];--Èç¹ûËæ»úµ½°´Á÷ÅÉ¸ø¶«Î÷µ«ÊÇÍæ¼ÒÃ»ÈëÁ÷ÅÉ£¬Ôò»»Ò»¸öÔ¤¶¨ºÃµÄÑ¡Ïî
    end
  end
  --È«·ş¹ã²¥
  if tbSelected[8] ~= nil and tbSelected[8] == 1 then
  	Msg2Global(format("Chóc mõng ng­êi ch¬i %s trong %s nhËn ®­îc %s*%d",GetName(),szLogAction,tbSelected[3],tbSelected[4][4]));
  end
  local nType = tbSelected[1];
  if nType == 1 then
   	 local nSpecial = tbSelected[6];
  	 if not nSpecial or nSpecial == 0 then --¸øÎïÆ·²»ĞèÌØÊâ´¦Àí
    	 	gf_AddItemEx2(tbSelected[4], tbSelected[3], szLogTitle, szLogAction, tbSelected[5], 1);
    	 	return nRand;
 	   elseif nSpecial == 1 then --°´ÌåĞÍ¸øµÄ
				local nBody = GetBody();
				local sItem = tbSelected[4]; -- ÌåĞÍ¼¯ºÏµÄÁĞ±í
				local nSize = getn(sItem) or 1
				for i = 1, nSize do
					gf_AddItemEx2(sItem[i][nBody][2], sItem[i][nBody][1], szLogAction, szLogAction, tbSelected[5], 1)
				end
				return nRand;
     elseif nSpecial == 2 then --°´Á÷ÅÉ¸øµÄ
				local sItem = tbSelected[4][nPlayerRoute];
				local tbRandRouteTable = {
				      [1] = {2, 3, 4},
				      [5] = {6},
				      [7] = {8, 9},
				      [10] = {11, 12},
				      [13] = {14, 15},
				      [16] = {17, 18},
				      [19] = {20, 21},
				      [22] = {23},
				      [28] = {29, 30},
				  };
				local tbRouteTable = {2, 3, 4, 6, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21, 23, 29, 30};
				--Èç¹ûÍæ¼ÒÃ»ÈëÁ÷ÅÉ£¬ÒªÓĞÒ»¸öËã·¨£¬Èç¹ûÈëÁËÃÅÅÉ£¬¾ÍÔÚÃÅÅÉÀïÃæËæ»ú£¬Èç¹ûÃÅÅÉ¶¼Ã»Èë£¬¾ÍËùÓĞµÄËæ»úÒ»¸ö
				if nPlayerRoute == 0 then
				  local nRandRoute = tbRouteTable[random(1, getn(tbRouteTable))];
				  sItem = tbSelected[4][nRandRoute];
				else
				  if tbRandRouteTable[nPlayerRoute] ~= nil then --ÈëÁËÃÅÅÉÃ»ÈëÁ÷ÅÉ
				      local nRandRoute = tbRandRouteTable[nPlayerRoute][random(1, getn(tbRandRouteTable[nPlayerRoute]))];
				      sItem = tbSelected[4][nRandRoute];
				  end
				end
				local nMaxRoutePE = 0;   --¸ÅÂÊ»ùÊı
				local nRouteDefault = 0; --Ä¬ÈÏË÷Òı
				for i = 1, getn(sItem) do
				  nMaxRoutePE = nMaxRoutePE + sItem[i][2];
				  if sItem[i][2] > nRouteDefault then
				      nRouteDefault = sItem[i][2];
				  end
				end
				local nRouteRand = gf_GetRandItemByTable(sItem, nMaxRoutePE, nMaxRoutePE);
				--È«¶¼´¦ÀíÍêÁË£¬¿ÉÒÔ¸ø¶«Î÷ÁË
				gf_AddItemEx2(sItem[nRouteRand][3], sItem[nRouteRand][1], szLogAction, szLogAction, tbSelected[5], 1);
				return nRand;
      end
  else
    gf_EventGiveCustomAward(nType - 1, tbSelected[3], tbSelected[4] or 1, szLogTitle, szLogAction, bZhenQiTag);
    return nRand;
  end
end

--Ô½ÄÏ°æ³£ÓÃµ½µÄÌí¼Ó¾­Ñé¡¢½ğÇ®¡¢Ê¦ÃÅ¹±Ï×¶È¡¢ÉùÍûµÄ²Ù×÷·â×°£¬×¢Òâµ±Ìí¼ÓÊ¦ÃÅ¹±Ï×¶ÈÖ®Ç°±ØĞëÔÚÍâ²¿±£Ö¤Íæ¼ÒÒÑ¾­ÈëÃÅÅÉ
--²ÎÊı nType = 1¾­Ñé¡¢2½ğÇ®¡¢3ÉùÍû¡¢4Ê¦ÃÅ¹±Ï×¶È¡¢5Ğ¡°×¾ÔÍè¡¢6´ó°×¾ÔÍè¡¢7°×¾ÔÏÉµ¤¡¢8ÉñÅ©µ¤¡¢9ÁùÉñÍè¡¢10Ç¿Ğ§ÁùÉñÍè¡¢11ÁùÉñÏÉµ¤¡¢12ÈıÇåÍè¡¢13Ç¿Ğ§ÈıÇåÍè¡¢14ÈıÇåÏÉµ¤¡¢15ÅîÀ³ÏÉË®¡¢16ÅîÀ³ÏÉÂ¶¡¢17ÅîÀ³ÏÉµ¤¡¢18ÅîÀ³Â¶Ë®¡¢19-25 1¼¶ÁéÊ¯£­7¼¶ÁéÊ¯
--30×Ô¶¨ÒåÃüÁî, nValueÊÇÒªÖ´ĞĞÃüÁîµÄ×Ö·û´®¡¢nMsg2PlayerÊÇÒªÌáÊ¾¸øÍæ¼ÒµÄ×Ö·û´®£¬Èç¹ûÎª¿Õ£¬Ôò²»ÌáÊ¾
--²ÎÊı nValue Ìí¼ÓµÄÖµ£¨½ğÇ®µ¥Î»ÊÇÍ­¡£°×¾ÔÍè£¬ÉñÅ©µ¤£¬ÁùÉñÍè£¬Ê±¼äÊÇ·ÖÖÓ£©
--²ÎÊı nMsgPlayer »ñµÃÊ¦ÃÅ¹±Ï×¶ÈºÍÉùÍûÊÇ·ñĞèÒªÍ¨ĞĞÍæ¼Ò
--²ÎÊıszLogTitle ¼ÇÂ¼logµÄ±êÌâ
--²ÎÊıszLogAction ¼ÇÂ¼logÖĞµÄaction²ÎÊı£¬Èç¹û²»Ìî»òÌînil£¬ÔòÓÃº¯ÊıÖĞ¶¨ºÃµÄÀ´Ìæ»»
--tAddRate = {nExpAddRate=1.5, nJunGongAddRate = 1.2,}
function gf_EventGiveCustomAward(nType, nValue, nMsg2Player, szLogTitle, szLogAction, bZhenQiTag,tAddRate)
    nMsg2Player = nMsg2Player or 0;
    --szLogAction = szLogAction or "";
    local szMsg2Player = "";
    local szItemName = "";
    local szLogDefAction = "";
    if nType == 1 then
    	local nExp = nValue
    	if tAddRate and tAddRate.nExpAddRate and type(tAddRate.nExpAddRate) == "number" then
    		nExp = nExp * tAddRate.nExpAddRate
    	end
        ModifyExp(nExp);
        szMsg2Player = format("Thu ®­îc %d ®iÓm kinh nghiÖm", nExp);
        szItemName = "Kinh nghiÖm";
        szLogDefAction = "NhËn ®iÓm";
    elseif nType == 2 then
        Earn(nValue);
        --szMsg2Player = format("Äã»ñµÃÁË%d¸öÍ­Ç®", nValue);
        szMsg2Player = "";
        szItemName = " Kim ";
        szLogDefAction = "NhËn ®­îc tiÒn";
    elseif nType == 3 then
        ModifyReputation(nValue, 1);
        szMsg2Player = format("Thu ®­îc %d ®iÓm danh väng", nValue);
        szItemName = "Danh väng";
        szLogDefAction = "Thu ®­îc danh väng";
        nMsg2Player = 0;--Ôö¼ÓÉùÍûµÄÖ¸Áî±¾ÉíµÄÌáÊ¾ÏûÏ¢£¬ËùÒÔÕâÀï²»ÌáÊ¾
    elseif nType == 4 then
        SetTask(336, GetTask(336) + nValue);
        szMsg2Player = format("Thu ®­îc %d ®iÓm cèng hiÕn s­ m«n", nValue);
        szItemName = "§iÓm s­ m«n";
        szLogDefAction = "Thu ®­îc ®iÓm cèng hiÕn s­ m«n";
    elseif nType == 5 then
        SetTask(GLB_TASK_BAIJUWAN_SMALL, GetTask(GLB_TASK_BAIJUWAN_SMALL) + nValue);
        szMsg2Player = format("NhËn ®­îc %d phót b¹ch c©u hoµn", nValue);
        szItemName = "Thêi gian ñy th¸c b¹ch c©u hoµn";
        szLogDefAction = "NhËn ®­îc thêi gian ñy th¸c b¹ch c©u hoµn";
    elseif nType == 6 then
        SetTask(GLB_TASK_BAIJUWAN_LARGE, GetTask(GLB_TASK_BAIJUWAN_LARGE) + nValue);
        szMsg2Player = format("NhËn ®­îc %d phót ®¹i b¹ch c©u hoµn", nValue);
        szItemName = "Thêi gian ñy th¸c ®¹i b¹ch c©u hoµn";
        szLogDefAction = "NhËn ®­îc thêi gian ñy th¸c ®¹i b¹ch c©u hoµn";
    elseif nType == 7 then
        SetTask(GLB_TASK_BAIJUXIANDAN, GetTask(GLB_TASK_BAIJUXIANDAN) + nValue);
        szMsg2Player = format("NhËn ®­îc %d phót b¹ch c©u tiªn ®¬n", nValue);
        szItemName = "Thêi gian ñy th¸c b¹ch c©u tiªn ®¬n";
        szLogDefAction = "NhËn ®­îc thêi gian ñy th¸c b¹ch c©u tiªn ®¬n";
    elseif nType == 8 then
        SetTask(GLB_TASK_SHENGNONGDAN, GetTask(GLB_TASK_SHENGNONGDAN) + nValue);
        szMsg2Player = format("NhËn ®­îc %d phót thÇn n«ng ®¬n", nValue);
        szItemName = "Thêi gian ñy th¸c thÇn n«ng ®¬n";
        szLogDefAction = "NhËn ®­îc thêi gian ñy th¸c thÇn n«ng ®¬n";
    elseif nType == 9 then
        EatLiushen(1, nValue);
        szMsg2Player = format("NhËn ®­îc %d phót lôc thÇn hoµn", nValue);
        szItemName = "Thêi gian ñy th¸c lôc thÇn hoµn";
        szLogDefAction = "NhËn ®­îc thêi gian lôc thÇn hoµn";
    elseif nType == 10 then
        EatLiushen(2, nValue);
        szMsg2Player = format("NhËn ®­îc %d phót c­êng lôc thÇn hoµn", nValue);
        szItemName = "Thêi gian ñy th¸c c­êng lôc thÇn hoµn";
        szLogDefAction = "NhËn ®­îc thêi gian ñy th¸c c­êng lôc thÇn hoµn";
    elseif nType == 11 then
        EatLiushen(3, nValue);
        szMsg2Player = format("NhËn ®­îc %d phót lôc thÇn tiªn ®¬n", nValue);
        szItemName = "Thêi gian ñy th¸c lôc thÇn tiªn ®¬n";
        szLogDefAction = "NhËn ®­îc thêi gian ñy th¸c lôc thÇn tiªn ®¬n";
    elseif nType == 12 then
        EatSanqin(1, nValue);
        szMsg2Player = format("NhËn ®­îc %d phót tam thanh hoµn", nValue);
        szItemName = "Thêi gian ñy th¸c tam thanh hoµn";
        szLogDefAction = "NhËn ®­îc thêi gian ñy th¸c tam thanh hoµn";
    elseif nType == 13 then
        EatSanqin(2, nValue);
        szMsg2Player = format("NhËn ®­îc %d phót c­êng tam thanh hoµn", nValue);
        szItemName = "Thêi gian c­êng tam thanh hoµn";
        szLogDefAction = "NhËn ®­îc thêi gian ñy th¸c c­êng tam thanh hoµn";
    elseif nType == 14 then
        EatSanqin(3, nValue);
        szMsg2Player = format("NhËn ®­îc %d phót tam thanh tiªn ®¬n", nValue);
        szItemName = "Thêi gian ñy th¸c tam thanh tiªn ®¬n";
        szLogDefAction = "NhËn ®­îc thêi gian ñy th¸c tam thanh tiªn ®¬n";
    elseif nType == 15 then
        EatXcl(1, nValue);
        szMsg2Player = format("§¹i hiÖp ®· nhËn ®­îc %d phót Bång Lai Tiªn Thñy", nValue/60);
        szItemName = "Thêi gian Bång Lai Tiªn Thñy";
        szLogDefAction = "NhËn ®­îc thêi gian Bång Lai Tiªn Thñy";
    elseif nType == 16 then
        EatXcl(2, nValue);
        szMsg2Player = format("§¹i hiÖp ®· nhËn ®­îc %d phót Bång Lai Tiªn Lé", nValue/60);
        szItemName = "Thêi gian Bång Lai Tiªn Lé";
        szLogDefAction = "NhËn ®­îc thêi gian Bång Lai Tiªn Lé";
    elseif nType == 17 then
        EatXcl(3, nValue);
        szMsg2Player = format("§¹i hiÖp ®· nhËn ®­îc %d phót Bång Lai Tiªn §¬n", nValue/60);
        szItemName = "Thêi gian Bång Lai Tiªn §¬n";
        szLogDefAction = "NhËn ®­îc thêi gian Bång Lai Tiªn §¬n";
    elseif nType == 18 then
        EatXcl(4, nValue);
        szMsg2Player = format("§¹i hiÖp ®· nhËn ®­îc %d phót Bång Lai Lé Thñy", nValue/60);
        szItemName = "Thêi gian Bång Lai Lé Thñy";
        szLogDefAction = "NhËn ®­îc thêi gian Bång Lai Lé Thñy";
    elseif nType >= 19 and nType <= 25 then
        lspf_AddLingShiInBottle(nType-18,nValue)
        szMsg2Player = format("Chóc mõng b¹n ®· nhËn ®­îc %d linh th¹ch cÊp %d, linh th¹ch nµy ®­îc ch­a trong tô linh ®Ønh", nType-18, nValue);
        szItemName = format("Linh th¹ch cÊp %d",nType-18);
        szLogDefAction = format("NhËn ®­îc linh th¹ch cÊp %d",nType-18);
		elseif nType == 26 then
        ModifyPopur(nValue)
        szMsg2Player = format("C¸c h¹ ®· nhËn ®­îc %d ®iÓm tu luyÖn", nValue);
        szItemName = "LuyÖn";
        szLogDefAction = "NhËn ®­îc tu luyÖn";
    elseif nType == 27 then
    		nMsg2Player = 0;
    		if bZhenQiTag == 1 then
    			AwardGenuineQi(nValue);
    		else
	    		if ActivityAwardGenuineQiDaily(nValue) ~= 0 then
	        	szMsg2Player = format("C¸c h¹ nhËn ®­îc %d ®iÓm ch©n khİ", nValue);
	        	szItemName = "Ch©n khİ";
	        	szLogDefAction = "NhËn ch©n khİ";
	        	nMsg2Player = 0; 
	        end
	      end   
    elseif nType == 30 then
        dostring(nValue);
        nMsg2Player = 0;
    elseif nType == 31 then
    	    local nJunGong = nValue
    		if tAddRate and tAddRate.nJunGongAddRate and type(tAddRate.nJunGongAddRate) == "number" then
    			nJunGong = nJunGong * tAddRate.nJunGongAddRate
    		end
    	
    	  if GetTask(701) >= 0 then
    	  	SetTask(701, GetTask(701) + nJunGong)
    	  else
    	  	SetTask(701, GetTask(701) - nJunGong)
    	  end
    	  szMsg2Player = format("C¸c h¹ nhËn ®­îc %d ®iÓm qu©n c«ng", nJunGong)
        szItemName = "C«ng tr¹ng"
        szLogDefAction = "NhËn ®­îc qu©n c«ng"
    elseif nType == 32 then
    	  SetTask(707, GetTask(707) + nValue)
    	  szMsg2Player = format("C¸c h¹ nhËn ®­îc %d tİch lòy chiÕn tr­êng", nValue)
        szItemName = " ®iÓm tİch lòy chiÕn tr­êng"
        szLogDefAction = "NhËn ®­îc ®iÓm tİch lòy chiÕn tr­êng"
    elseif nType == 33 then
    		SetTask(3105, GetTask(3105) + nValue, TASK_ACCESS_CODE_OFFLINELIVE);
    		szMsg2Player = format("C¸c h¹ ®· nhËn ®­îc %d phót Tô Linh Hoµn", nValue)
        szItemName = "Thêi gian Tô Linh Hoµn"
        szLogDefAction = "NhËn ®­îc thêi gian Tô Linh Hoµn"   
    elseif nType == 34 then
    		SetTask(3106, GetTask(3106) + nValue, TASK_ACCESS_CODE_OFFLINELIVE);
    		szMsg2Player = format("C¸c h¹ nhËn ®­îc %d phót §¹i Tô Linh Hoµn", nValue)
        szItemName = "Thêi gian §¹i Tô Linh Hoµn"
        szLogDefAction = "NhËn ®­îc thêi gian §¹i Tô Linh Hoµn"  
    elseif nType == 35 then
    		SetTask(3107, GetTask(3107) + nValue, TASK_ACCESS_CODE_OFFLINELIVE);
    		szMsg2Player = format("C¸c h¹ nhËn ®­îc %d phót Tô Linh Tiªn §¬n", nValue)
        szItemName = "Thêi gian Tô Linh Tiªn §¬n"
        szLogDefAction = "NhËn ®­îc thêi gian Tô Linh Tiªn §¬n"   		
    elseif nType == 36 then
    		ModifyJinJuan(nValue, 1);
    		nMsg2Player = 0;
        szItemName = "PhiÕu Vµng";
        szLogDefAction = "NhËn ®­îc PhiÕu Vµng";
    elseif nType == 37 then
    		local nCurr, nMax = ModifyEnergy(0, 1);
    		local nLast = nMax - nCurr;
    		if nLast < 0 then
    			return
    		end
    		if nValue > nLast then
    			nValue = nLast
    		end
    		ModifyEnergy(nValue, 1);
        nMsg2Player = 0;
        szItemName = "Tinh Lùc";
        szLogDefAction = "NhËn ®­îc Tinh lùc";    
    end

    if nMsg2Player ~= 0 then
        Msg2Player(szMsg2Player);
    end
    if szLogTitle then
        szLogAction = szLogAction or szLogDefAction;
        gf_WriteLogEx(szLogTitle, szLogAction, nValue, szItemName, nil, GetTongName())
    end
end

--¸ù¾İÌí¼ÓÎïÆ·ĞÂ·â×°£¬ÔÚµ÷ÓÃÇ°ÇëÅĞ¶ÏÍæ¼Ò±³°üºÍ¸ºÖØ
--²ÎÊı£ºtbItemIdsÌí¼ÓÎïÆ·µÄIDtable£¬strNameÎïÆ·Ãû×Ö,szLogTitleÈÕ¼ÇÍ·,nExpireTime´æÔÚÊ±¼ä
--      szNpcName½»»¥µÄNPCµÄÃû×Ö£¬nNoticeMsgÊÇ·ñÌáÊ¾Íæ¼Ò¿Õ¼ä»ò¸ºÖØ²»×ã
--      nMsg2Player ÊÇ·ñÌáÊ¾Íæ¼ÒÒÑ¾­»ñµÃÁËÎïÆ·
--·µ»ØÖµ£º0´íÎóµ÷ÓÃ,1³É¹¦,-1¿Õ¼ä»ò¸ºÖØ²»¹»
function gf_AddItemEx2(tbItemIds, strName, szLogTitle, szLogAction, nExpireTime, nMsg2Player)
	nExpireTime = nExpireTime or 0;
	szLogTitle = szLogTitle or "";
	nMsg2Player = nMsg2Player or 0;
	
	if type(tbItemIds) ~= "table" or getn(tbItemIds) < 4 then
		WriteLog("["..szLogTitle.."]\tgf_AddItemEx2:\t tham sè lçi!");
		return 0;
	end
	
	local nCount = tbItemIds[4];
	if nCount == 0 then
		return
	end
	local nRet = 0;
	local nItemIdx = 0;
	local nFailedCount = 0;
	local nOkCount = 0;
	local nDropCount = 0;
	
	--Ä¬ÈÏÖµÓ¦¸ÃÎª1(ÒÑ¼ø¶¨)
	local nStatus = tbItemIds[5] or 1
	if nStatus < 0 then
		nStatus = 99
	end
	nStatus = nExpireTime * 100 + nStatus
	
	if tbItemIds[5] ~= nil then
		nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3],nCount,nStatus,tbItemIds[6],tbItemIds[7],tbItemIds[8],tbItemIds[9],tbItemIds[10],tbItemIds[11],tbItemIds[12],tbItemIds[13], tbItemIds[14]);
	else
		nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3],nCount,nStatus);
	end
	
	if nRet == 0 then
		nFailedCount = nFailedCount + nCount;
	elseif nRet == 2 then
		nDropCount = nDropCount + nCount;
	else
		nOkCount = nOkCount + nCount;
	end
	
--	if tbItemIds[5] ~= nil then
--		for i = 1, nCount do
--			nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3],1,tbItemIds[5],tbItemIds[6],tbItemIds[7],tbItemIds[8],tbItemIds[9],tbItemIds[10],tbItemIds[11],tbItemIds[12],tbItemIds[13], tbItemIds[14]);
--			if nRet == 0 then
--				nFailedCount = nFailedCount + 1;
--			elseif nRet == 2 then
--				nDropCount = nDropCount + 1;
--			else
--				nOkCount = nOkCount + 1;
--				if nExpireTime > 0 then
--					SetItemExpireTime(nItemIdx, nExpireTime);
--				end
--			end
--		end
--	else
--		for i = 1, nCount do
--			nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3], 1);
--			if nRet == 0 then
--				nFailedCount = nFailedCount + 1;
--			elseif nRet == 2 then
--				nDropCount = nDropCount + 1;
--			else
--				nOkCount = nOkCount + 1;
--				if nExpireTime > 0 then
--				SetItemExpireTime(nItemIdx, nExpireTime);
--				end
--			end
--		end
--	end
	
	local szMsg1 = format("Thªm thµnh c«ng %d c¸i, thªm thÊt b¹i %d c¸i, r¬i ®Êt %d c¸i", nOkCount, nFailedCount, nDropCount);--±¸×¢Ò»
	local szMsg2 = "Thêi gian tån t¹i vËt phÈm ®­îc ®Æt thµnh %d gi©y";--±¸×¢¶ş
	if nExpireTime <= 0 then
		szMsg2 = "";
	else
		szMsg2 = format(szMsg2, nExpireTime);
	end
	local szMsg3 = "";--±¸×¢Èı
	local szTongName = GetTongName() or "";
	
	if nMsg2Player ~= 0 then
		Msg2Player("B¹n nhËn ®­îc "..strName.."x"..nOkCount);
	end
	
	--²ÉÓÃĞÂÈÕÖ¾¼ÇÂ¼¸ñÊ½
	gf_WriteLogEx(szLogTitle, szLogAction, nCount, strName, nil, szTongName, nil, szMsg1, szMsg2, szMsg3);
	if nCount > 1 then
		return 1;
	else
		return nRet, nItemIdx
	end
end