--Í¨ÓÃ¶Ò»»ÎïÉèÖÃ
Import("\\script\\lib\\globalfunctions.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
Include("\\script\\function\\ornament\\ornament.lua")

--±ê×¼µÄ½±Àø¶Ò»»¸ñÊ½
gtNormalExchange = {
	tConsume = {--ÏûºÄÎï
		--{name,g,d,p,n}
--		{"item",g,d,p,n},
--		{"½ð",-1, 0, 0, n},
--		{"·ç»ª»ý·Ö",-8, 0, 0, n},
--		{"name",-1000, func, tInfo, n}--func
	},
	tAward = {--½±Àø
--		{name,g,d,p,n,bind,expiredays}
--		{"item",g,d,p,n,bind,expiredays},
--		{"½ð",-1, 0, 0, n},
--		{"ÐÞÎª",-2, 0, 0, n},
--		{"¾­Ñé",-3, 0, 0, n},
--		{"ÕæÆø",-4, 0, 0, n},
--		{"ÉùÍû",-5, 0, 0, n},
--		{"Ê¦ÃÅ¹±Ï×¶È",-6, 0, 0, n},
--		{"¾ü¹¦",-7, 0, 0, n},
--		{"·ç»ª»ý·Ö",-8, 0, 0, n},
	},
	nRate = 0,
	tAward2 = {},--Ê§°ÜµÄ½±Àø
	tRoomWeight = {1,100},
	nBatchExchange = 100, --Ò»´Î×î¶à¶Ò»»¶àÉÙ¸ö 
}

--¶Ò»»³É¹¦»Øµ÷º¯Êý£¬ÓÉ¾ßÌåµÄÒµÎñÈ¥ÊµÏÖ
--function gtNormalExchange:do_exchange_callback()
--end

tNpcTalkTemp = {}--npc talkÓÃÀ´´æ´¢award indexµÄ

function gtNormalExchange:new()
	local t=gf_Inherit(self)
	return t
end

function exchg_nothing()
	tNpcTalkTemp[PlayerIndex] = nil
end

function gtNormalExchange:npc_talk_main(szNpcName)
	--nTempIndex = nTempIndex or 1
	--tNpcTalkTemp[nTempIndex] = self--ÏÈ°Ñself±£´æÆðÀ´£¬·ñÔòºóÃæµÄ»Øµ÷»á±¨´íµÄ
	tNpcTalkTemp[PlayerIndex] = self
	
	local szConsume = self:get_consume_desc()
	local szAward = self:get_award_desc()
	local szMsg = ""
	if szConsume ~= "" then
		szMsg = format("§æi [%s] cÇn tiªu hao [%s], ®ång ý kh«ng??", szAward, szConsume)
	else
		szMsg = format("§ång ý ®æi [%s] kh«ng??", szAward)
	end
	local szTitle = format("%s:%s", szNpcName, szMsg)
	local tbSay = {}
	tinsert(tbSay, format("%s/npc_talk_ask_num", "X¸c ®Þnh ®æi"))
	tinsert(tbSay, format("%s/exchg_nothing", "Ra khái"))
	Say(szTitle, getn(tbSay), tbSay)
end

function gtNormalExchange:get_consume_desc()
	return get_list_content(self.tConsume)
end

function gtNormalExchange:get_award_desc()
	local szAward = get_list_content(self.tAward)
	if self.nRate > 0 then
		local szAward2 = get_list_content(self.tAward2)
		szAward = format("Cã x¾c xuÊt nhÊt ®Þnh thµnh c«ng nhËn ®­îc {%s}", szAward)
		if szAward2 and szAward2~= "" then
			szAward = format("%s nÕu kh«ng sÏ nhËn ®­îc {%s}", szAward, szAward2)
		end
	end
	return szAward
end

function gtNormalExchange:get_max_exchange_cnt()
	local tConsume = self.tConsume
	local nMaxExchangeCnt = 100
	for i = 1, getn(tConsume) do
		local nCurMax = 0
		local ti = tConsume[i]
		if ti[2] >= 0 then
			nCurMax = floor(GetItemCount(ti[2], ti[3], ti[4]) / ti[5])
		elseif ti[2] == -1 then
			nCurMax = floor(GetCash() / (ti[5]*10000))
		else
			error(format("unsupport consume %d", ti[2]))
		end
		nMaxExchangeCnt = min(nMaxExchangeCnt, nCurMax)
	end
	nMaxExchangeCnt = min(nMaxExchangeCnt, self.nBatchExchange or 100)--×î¶àÒ»´Î»»100¸ö
	return nMaxExchangeCnt
end

function gtNormalExchange:do_exchange(bDelete, bNotify)
	if gf_Judge_Room_Weight(self.tRoomWeight[1], self.tRoomWeight[2], "") ~= 1 then
		return 0
	end

	if check_and_consume_list(self.tConsume, bDelete, bNotify) ~= 1 then
		return 0
	end

	if 1 == bDelete then --ËùÓÐ¶¼¼ì²éÍ¨¹ýÁË£¬Ö´ÐÐÉ¾³ý
		local tAward = self.tAward
		local nAwardType = 1
		if self.nRate > 0 and random(1,100) > self.nRate then --Ëæ»úÊ§°Ü ¸øµÚ¶þÌ×½±Àø
			tAward = self.tAward2
			nAwardType = 2
		end
		check_award_by_list(tAward, 1)
		award_by_list(tAward, bDelete, bNotify)
		if self.do_exchange_callback then--¶Ò»»³É¹¦»Øµ÷
			self:do_exchange_callback(nAwardType)
		end
	end
	return 1
end

function npc_talk_ask_num()
	local t = tNpcTalkTemp[PlayerIndex]
	if t.nBatchExchange > 1 then
		local nMax = t:get_max_exchange_cnt()
    	if nMax > 0 then
    		local szFunc = format("_npc_talk_ask_num_cb")
    		AskClientForNumber(szFunc, 1, nMax, "H·y nhËp sè l­îng vµo")
    	else
    		Talk(1, "", "Kh«ng ®æi ®­îc g× c¶.")
    		exchg_nothing()
    	end
	else
		_npc_talk_ask_num_cb(1)
	end
	
end

function _npc_talk_ask_num_cb(nNum)
	local t = tNpcTalkTemp[PlayerIndex]
	if nNum <= 0 or not t then
		exchg_nothing()
		return
	end
	for i=1,nNum do
		if 1 ~= t:do_exchange(1,1) then
			break
		end
	end
	exchg_nothing()
end

function _get_expire_days(tItem)
	local szMsg = ""
	if tItem and tItem[7] then
		szMsg = format("(HiÖu lùc %d ngµy)", tItem[7])
	end
	return szMsg
end

--gtListCfg = {
--	--
--	[-1] = {"½ð×Ó", GetCash, Pay, Earn, 10000},
--	[-2] = {"ÐÞÎª", nil, nil, ModifyPopur},
--	[-3] = {"¾­Ñé", nil, nil, ModifyExp},
--	[-4] = {"ÕæÆø", nil, nil, AwardGenuineQi},
--	[-8] = {"·ç»ª»ý·Ö", ornament_get_score, ornament_add_score, ornament_add_score}
--	[-1000] = {"name",-1000, func, tInfo, n}
--}

function check_and_consume_list(tConsume, bDelete, bNotify)
	for i = 1, getn(tConsume) do
    	local ti = tConsume[i]
    	if ti[2] >= 0 then
        	if GetItemCount(ti[2], ti[3], ti[4]) < ti[5] then
        		if 1 == bNotify then
        			Talk(1,"",format("%sx%d kh«ng ®ñ", ti[1], ti[5]))
        		end
        		return 0
        	end
    	elseif ti[2] == -1 then --Gold
    		if GetCash() < ti[5]*10000 then
    			if 1 == bNotify then
        			Talk(1,"",format("Kh«ng cã %d%s",  ti[5], ti[1]))
        		end
        		return 0
    		end
    	elseif ti[2] == -8 then --ornament_score
    		if ornament_get_score() < ti[5] then
    			if 1 == bNotify then
        			Talk(1,"",format("Kh«ng cã %d%s",  ti[5], ti[1]))
        		end
        		return 0
    		end
    	elseif ti[2] == -1000 then --function
    		if ti[3](ti, 0, 1) ~= 1 then
    			return 0
    		end
    	else
    		error(format("unsupport consume %d", ti[2]))
    	end
	end
	if 1 == bDelete then --ËùÓÐ¶¼¼ì²éÍ¨¹ýÁË£¬Ö´ÐÐÉ¾³ý
		for i = 1, getn(tConsume) do
            local ti = tConsume[i]
        	if ti[2] >= 0 then
        		local nDelResult = DelItem(ti[2], ti[3], ti[4], ti[5])
        		if not nDelResult or nDelResult ~= 1  then
        			return 0
        		end
        	elseif ti[2] == -1 then
        		if 1 ~= Pay(ti[5]*10000) then
        			return 0
        		end
        	elseif ti[2] == -8 then
        		ornament_add_score(ti[5]*-1)
        	elseif ti[2] == -1000 then --function
    			if ti[3](ti, 1, 1) ~= 1 then
    				return 0
    			end
        	else
        		error(format("unsupport consume %d", ti[2]))
        	end
    	end
    end
	return 1
end

function check_award_by_list(tAward, bNotify)
	local ret = 1
	local szMsg = ""
	for i = 1, getn(tAward) do
		local ti = tAward[i]
		if ti[2] == -3 then--¾­Ñé
			if CanModifyExp(ti[5]) ~= 1 then
				local msg = format("HiÖn t¹i kh«ng thÓ nhËn %d EXP", ti[5])
				szMsg = format("%s\n%s", szMsg, msg)
				ret = 0;
			end
		elseif ti[2] == -4 then--ÕæÆø
			if MeridianGetLevel() < 1 or MeridianGetLeftGenuineQiCapcity() < ti[5] then
				local msg = format("HiÖn t¹i kh«ng thÓ nhËn %d ch©n khÝ", ti[5])
				szMsg = format("%s\n%s", szMsg, msg)
				ret = 0;
			end
		elseif ti[2] == -1000 then --function
    		if ti[3](ti, 0, 1) ~= 1 then
    			return 0
    		end
		end
	end
	if 1 == bNotify and ret ~= 1 then
		Msg2Player(szMsg)
	end
	return ret,szMsg
end

function award_by_list(tAward, bDelete, bNotify, nTaskId, nBitIdx)
	if 1 ~= bDelete then
		return 0
	end
	
	for i = 1, getn(tAward) do
        local ti = tAward[i]
        if type(ti[2]) == "function" then --º¯Êý
        	local tPara = {}
        	local t = ti[3]
        	for i = 1,getn(t) do
        		tPara[i] = t[i]
        	end
        	tPara[getn(tPara)+1] = nTaskId
        	tPara[getn(tPara)+1] = nBitIdx
        	ti[2](unpack(tPara))
        elseif ti[2] >= 0 then
        	local nBind = 100 * (ti[7] or 0) * 24 * 3600 + (ti[6] or 1)
			local nResult,nIndex = 0, 0
			if ti[2] == 0 then
				nResult,nIndex = AddItem(ti[2], ti[3], ti[4], ti[5], nBind, -1, -1, -1, -1, -1, -1)
			else
				nResult,nIndex = AddItem(ti[2], ti[3], ti[4], ti[5], nBind)
			end
			local szMsg2Player = format("B¹n ®· nhËn ®­îc %d %s", ti[5], ti[1])
    		Msg2Player(szMsg2Player)
		elseif ti[2] == -1 then--½ð×Ó
			Earn(ti[5]*10000)
    		local szMsg2Player = format("NhËn ®­îc %d Vµng", ti[5])
    		Msg2Player(szMsg2Player)
		elseif ti[2] == -2 then--ÐÞÎª
			ModifyPopur(ti[5])
    		szMsg2Player = format("C¸c h¹ ®· nhËn ®­îc %d ®iÓm tu luyÖn", ti[5])
    		Msg2Player(szMsg2Player)
    	elseif ti[2] == -3 then--¾­Ñé
			local r = ModifyExp(ti[5])
			if r == 1 then
				local szMsg2Player = format("Thu ®­îc %d ®iÓm kinh nghiÖm", ti[5])
    			Msg2Player(szMsg2Player)
			end
    	elseif ti[2] == -4 then--ÕæÆø
			AwardGenuineQi(ti[5])
			--szMsg2Player = format("Äã»ñµÃÁË%dµãÕæÆø", ti[5])
    		--Msg2Player(szMsg2Player)
    	elseif ti[2] == -5 then--ÉùÍû
			ModifyReputation(ti[5], 0)
    		local szMsg2Player = format("Thu ®­îc %d ®iÓm danh väng", ti[5])
    		Msg2Player(szMsg2Player)
    	elseif ti[2] == -6 then--Ê¦ÃÅ¹±Ï×¶È
    		SetTask(336, GetTask(336) + ti[5])
    		local szMsg2Player = format("Thu ®­îc %d ®iÓm cèng hiÕn s­ m«n", ti[5])
    		Msg2Player(szMsg2Player)
    	elseif ti[2] == -7 then--¾ü¹¦
    		if GetTask(701) >= 0 then
				SetTask(701, GetTask(701) + ti[5]);
			else
				SetTask(701, GetTask(701) - ti[5]);
			end
    		local szMsg2Player = format("C¸c h¹ nhËn ®­îc %d ®iÓm qu©n c«ng", ti[5])
    		Msg2Player(szMsg2Player)
    	elseif ti[2] == -8 then--·ç»ª»ý·Ö
    		ornament_add_score(ti[5])
    		local szMsg2Player = format("b¹n ®· nhËn ®­îc %d ®iÓm Phong Hoa", ti[5])
    		Msg2Player(szMsg2Player)
    	elseif ti[2] == -1000 then --function
    		if ti[3](ti, 1, 1) ~= 1 then
    			return 0
    		end
		else
			return error(format("unsupport award %d", ti[2]))
        end
	end
	return 1
end

function get_list_content(tItems)
	local szDesc = ""
	if tItems and getn(tItems) >= 1 then
    	szDesc = _get_elem_desc(tItems[1])
    	for i = 2, getn(tItems) do
    		szDesc = format("%s, %s", szDesc, _get_elem_desc(tItems[i]))
    	end
    end
	return szDesc
end

function _get_elem_desc(tElem)
	local szDesc = ""
	if type(tElem[2]) == "function" then
		szDesc = tElem[1]
	else
		szDesc = format("%d %s%s", tElem[5], tElem[1], _get_expire_days(tElem))
	end
	return szDesc
end

--Éý¼¶ÉíÉÏµÄ×°±¸
--tListEelm={"name",-1000, func, tInfo, n}
--tInfo={nEquipPos, {g, d, p, timing}}
function exchg_op_update_equip(tListEelm, delete, bNotify)
	local szItemName, nOp, func, tInfo, n = unpack(tListEelm)
	local nEquipPos, tPara = unpack(tInfo)
	local g,d,p,timing = unpack(tPara)
	local nEquipIDX = GetPlayerEquipIndex(nEquipPos)
	local nTiming = GetItemStatus(nEquipIDX, 4)
	local nG, nD, nP = GetPlayerEquipInfo(nEquipPos);
	local nRet = 0
	if nEquipIDX > 0 and nG==g and nD==d and nP==p and nTiming==timing then
		nRet = 1
	else
		nRet = 0
		if 1 == bNotify then
			Talk(1, "", format("H·y mang [%s] trªn ng­êi. NÕu lµ vËt trang søc h·y ®Æt t¹i « trang søc thø nhÊt.", szItemName))
		end
	end
	if 1 == nRet and 1 == delete then
		nRet = DelItemByIndex(nEquipIDX, -1)
	end
	return nRet
end
