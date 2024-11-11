--ÒÅÍü³èÎï¼¼ÄÜ
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

NEED_GOLD = 10 --·ÏÆú

local COST = {
	NAME = "Thiªn Kiªu LÖnh",
	CNT  = 1,
	ID	 = {2, 97, 236}
}

MONTE_TO_GOLD_RATE = 10000;

m_nCostGold = 200; -- ®¬n vÞ vµng

t_player_pet_list = {}

function ForgetPetSkillMain()
	_ChoosePet()
end

function _ChoosePet()
	local tbSay = {}
	local nPetCount,tbPetList = GetPetList()
	t_player_pet_list[PlayerIndex] = tbPetList--¸üÐÂ³èÎïÁÐ±í
	if nPetCount > 0 then
		local szTitle = format("B¹n ®ång hµnh cña ®¹i hiÖp cã häc kü n¨ng v« dông, yªn t©m, ®¹i hiÖp cã thÓ xãa nh÷ng kü n¨ng ®ã t¹i ®©y. Mçi lÇn quªn mÊt kü n¨ng ph¶i tr¶ %d * %s. <color=red> Kü n¨ng ®· xãa kh«ng thÓ kh«i phôc l¹i, chØ cã thÓ häc l¹i mét lÇn n÷a. <color> Giê, mêi b¹n chän b¹n ®ång hµnh  muèn xãa kü n¨ng.:",%COST.CNT, %COST.NAME);
		for i = 1, getn(tbPetList) do
			if SafeGetBit(tbPetList[i].nStatus, 2) == 0 then --if not lock
				local szItem = format("%s(T­ chÊt cßn l¹i:%d/%d)/#_ChooseSkill(%d)", tbPetList[i].szName, tbPetList[i].nCurTianZi, tbPetList[i].nMaxTianZi, i)
				tinsert(tbSay, szItem)
			end
		end
		tinsert(tbSay, "Ra khái/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		t_player_pet_list[PlayerIndex] = nil
		Talk(1,"","C¸c h¹ ch­a cã b¹n ®ång hµnh kh«ng thÓ xãa kü n¨ng!")
	end
end

function _ChooseSkill(nPetListIndex)
	local tbSay = {}
	local tbPetInfo = t_player_pet_list[PlayerIndex][nPetListIndex] or {}
	local tbPetSkill = tbPetInfo.tbDynamicSkill or {}
	if getn(tbPetSkill) > 0 then
		local szTitle = format("B¹n x¸c ®Þnh xãa kü n¨ng b¹n ®ång hµnh <color=yellow>%s(t­ chÊt cßn l¹i:%d/%d)<color> kh«ng?<color=red>kü n¨ng bÞ xãa sÏ kh«ng thÓ kh«i phôc l¹i, chØ cã thÓ luyÖn l¹i tõ ®Çu<color>H·y chän kü n¨ng cÇn xãa (xãa kü n¨ng cÇn tiªu hao %d * %s):"
			, tbPetInfo.szName, tbPetInfo.nCurTianZi, tbPetInfo.nMaxTianZi, %COST.CNT, %COST.NAME);
		for i = 1, getn(tbPetSkill) do
			local szItem = format("D·y %d: %s%d cÊp (ChiÕm t­ chÊt: %d)/#_ConfirmDelPetSkill(%d, %d)"
				, tbPetSkill[i].nSkillIndex + 1, tbPetSkill[i].szSkillName, tbPetSkill[i].nSkillLv, tbPetSkill[i].nNeedTianZi
				, nPetListIndex, i)
			tinsert(tbSay, szItem)
		end
		tinsert(tbSay, "trë l¹i/_ChoosePet")
		tinsert(tbSay, "Ra khái/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		t_player_pet_list[PlayerIndex] = nil
		local szMsg = format("B¹n ®ång hµnh <color=yellow>%s<color> vÉn ch­a cã kü n¨ng hç trî, kh«ng thÓ xãa", tbPetInfo.szName)
		Talk(1,"",szMsg)
	end
end

function _ConfirmDelPetSkill(nPetListIndex, nSkillListIndex)
	local tbSay = {}
	local tbPetInfo = t_player_pet_list[PlayerIndex][nPetListIndex] or {}
	local tbPetSkill = tbPetInfo.tbDynamicSkill or {}
	if getn(tbPetSkill) > 0 and getn(tbPetSkill) >= nSkillListIndex then
		--local szTitle = format("X¸c ®Þnh cho b¹n ®ång hµnh <color=yellow>%s (T­ chÊt cßn l¹i: %d/%d)<color>xãa kü n¨ng<color=yellow>d·y thø %d: %s%d cÊp (chiÕm t­ chÊt %d)<color> kh«ng? Thµnh c«ng xãa bá <color=yellow>®­îc nhËn l¹i ®iÓm t­ chÊt: %d<color>. <color=red>Kü n¨ng bÞ xãa ®i sÏ kh«ng thÓ kh«i phôc l¹i, chØ cã thÓ luyÖn l¹i tõ ®Çu.<color>H·y x¸c ®Þnh lÇn cuèi (xãa kü n¨ng cÇn tiªu hao %d * %s):"
		--	, tbPetInfo.szName, tbPetInfo.nCurTianZi, tbPetInfo.nMaxTianZi
		--	, tbPetSkill[nSkillListIndex].nSkillIndex + 1, tbPetSkill[nSkillListIndex].szSkillName, tbPetSkill[nSkillListIndex].nSkillLv, tbPetSkill[nSkillListIndex].nNeedTianZi
		--	, tbPetSkill[nSkillListIndex].nNeedTianZi , %COST.CNT, %COST.NAME);
		local szTitle = format("X¸c ®Þnh cho b¹n ®ång hµnh <color=yellow>%s (T­ chÊt cßn l¹i: %d/%d)<color>xãa kü n¨ng<color=yellow>d·y thø %d: %s%d cÊp (chiÕm t­ chÊt %d)<color> kh«ng? Thµnh c«ng xãa bá <color=yellow>®­îc nhËn l¹i ®iÓm t­ chÊt: %d<color>. <color=red>Kü n¨ng bÞ xãa ®i sÏ kh«ng thÓ kh«i phôc l¹i, chØ cã thÓ luyÖn l¹i tõ ®Çu.<color>H·y x¸c ®Þnh lÇn cuèi (xãa kü n¨ng cÇn tiªu hao %d vµng):"
			, tbPetInfo.szName, tbPetInfo.nCurTianZi, tbPetInfo.nMaxTianZi
			, tbPetSkill[nSkillListIndex].nSkillIndex + 1, tbPetSkill[nSkillListIndex].szSkillName, tbPetSkill[nSkillListIndex].nSkillLv, tbPetSkill[nSkillListIndex].nNeedTianZi
			, tbPetSkill[nSkillListIndex].nNeedTianZi , m_nCostGold);
		local szItem = format("X¸c ®Þnh xãa/#_OnDelPetSkill(%d, %d)", nPetListIndex, nSkillListIndex)
		tinsert(tbSay, szItem)
		szItem = format("trë l¹i/#_ChooseSkill(%d)", nPetListIndex)
		tinsert(tbSay, szItem)
		tinsert(tbSay, "Ra khái/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		t_player_pet_list[PlayerIndex] = nil
	end
end

function _OnDelPetSkill(nPetListIndex, nSkillListIndex)
	--if DelItem(%COST.ID[1],%COST.ID[2],%COST.ID[3],%COST.CNT) == 0 then		-- ÏÈÉ¾µôÌì½¾Áî
	--	Talk(1,"",format("B¹n kh«ng ®ñ %s",%COST.NAME))
	--	return 0;
	--end

	if WPlayer:PayGold(m_nCostGold) ~= WEnv.RETCODE_SUCCESS then
		WNpc:Talk(format("B¹n kh«ng ®ñ <color=red>%d vµng<color> ®Ó thao t¸c!", m_nCostGold), WEnv.TRUE);
		return 0;
	end

	local tbPetInfo =t_player_pet_list[PlayerIndex][nPetListIndex] or {}
	local tbPetSkill = tbPetInfo.tbDynamicSkill or {}
	if getn(tbPetSkill) >= nSkillListIndex then
		local nResult = ForgetPetSkill(tbPetInfo.nIndex, tbPetSkill[nSkillListIndex].nSkillIndex, tbPetSkill[nSkillListIndex].nSkillId, tbPetSkill[nSkillListIndex].nSkillLv)
		if nResult == tbPetSkill[nSkillListIndex].nSkillIndex and nSkillListIndex >= 0 then
			AddRuntimeStat(47, 1, 0, 1)
			local szMsg = format("B¹n ®ång hµnh %s ®· xãa kü n¨ng %s thµnh c«ng", tbPetInfo.szName, tbPetSkill[nSkillListIndex].szSkillName)
			Msg2Player(szMsg)
		else
			--AddItem(%COST.ID[1],%COST.ID[2],%COST.ID[3],%COST.CNT)			-- Èç¹ûÒÅÍüÊ§°Ü£¬°ÑÌì½¾Áî¼Ó»ØÀ´
			local szMsg = format("B¹n ®ång hµnh xãa kü n¨ng thÊt b¹i", tbPetInfo.szName, tbPetSkill[nSkillListIndex].szSkillName)
			Msg2Player(szMsg)
		end
	end
	
	t_player_pet_list[PlayerIndex] = nil
end

function no()
	t_player_pet_list[PlayerIndex] = nil
end