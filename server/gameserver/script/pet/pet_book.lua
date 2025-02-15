--Include("\\script\\pet\\pet_book_exchange.lua")
--Include("\\script\\pet\\pet_update.lua")
--Include("\\script\\pet\\forget_pet_skill.lua")
--ENABLE_PET_NPC_TEST=1

--通过宠物技能书学习宠物技能
--MONEY_NEED_RATE = 50000
MONTE_TO_GOLD_RATE = 10000

-- 技能id互斥组：{[skillid] = group}
tPetSkillMutexGroup = {
	[30180] = 1, [30221] = 1,
	[30178] = 2, [30222] = 2,
}

function CheckMutexGroup(nOldIndex, nNewIndex)
	if nNewIndex == nOldIndex then
		return 1
	end
	if tPetSkillMutexGroup[nNewIndex] == nil or tPetSkillMutexGroup[nNewIndex] == nil then
		return 0
	end
	if tPetSkillMutexGroup[nOldIndex] == tPetSkillMutexGroup[nNewIndex] then
		return 1
	end
	return 0
end

function OnUse(id)
	local tbSay = {}
	local nPetCount,tbPetList = GetPetList()
	local szBookName = GetItemName(id)
	local nP = GetItemParticular(id)
	if nPetCount > 0 then
		local nLevel = GetItemLevel(id)
		local nNeedMoney = _get_need_money(nLevel)
		local nNeedGold = floor(nNeedMoney / MONTE_TO_GOLD_RATE)
		local szTitle = format("H穣 ch鋘 k� n╪g c莕 luy謓 <color=yellow>[%s]<color> cho b筺 ng h祅h (luy謓 k� n╪g c莕 ti猽 hao %d v祅g). цi v韎 nh鱪g k� n╪g  c� v韎 c蕄  th蕄 h琻 頲 n﹏g c蕄 th祅h c玭g s� 頲 nh薾 l筰 t� ch蕋  chi誱 d鬾g. <enter><color=red>Ch� �, k� n╪g luy謓 th祅h c玭g c� t� l� nh蕋 nh thay th� k� n╪g h� tr� hi謓 c�.<color>", szBookName, nNeedGold);
		for i = 1, getn(tbPetList) do
			local szItem = format("%s(T� ch蕋 c遪 l筰:%d/%d)/#_OnLearnOnPet(%d, %d, %d)", tbPetList[i].szName, tbPetList[i].nCurTianZi, tbPetList[i].nMaxTianZi, id, tbPetList[i].nIndex, nP)
			tinsert(tbSay, szItem)
		end
--		if ENABLE_PET_NPC_TEST then
--			tinsert(tbSay, "我要升级伙伴/PetUpdateMain")
--			tinsert(tbSay, "我要兑换伙伴技能书/PetBookExchangeMain")
--			tinsert(tbSay, "我要遗忘伙伴技能/ForgetPetSkillMain")
--		end
		tinsert(tbSay, "Th玦 甶, ta kh玭g mu鑞 h鋍/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		Talk(1,"","C竎 h� ch璦 c� b筺 ng h祅h, kh玭g th� s� d鬾g s竎h k� n╪g n祔!")
	end
end

function _OnLearnOnPet(nBookId, nPetIndex, nP)
	local nBookSkill, szSkillName, nBookSkillLv = GetPetBookInfo(nBookId)
	local tPetSkills = GetPetSkillByIndex(nPetIndex)
	for k,v in tPetSkills do
		if CheckMutexGroup(v["nSkillID"], nBookSkill) == 1 then
			Say(format("<color=red2>Xin ch� �<color>,h鋍 s竎h k� n╪g n祔 s� thay th� k� n╪g th� nu鑙 hi謓 nay<color=yellow>[%s]<color>,c� ng � kh玭g?", v["szSkillName"]), 2, 
				{format("уng �/#Comfirm_Learn(%d,%d,%d)", nBookId, nPetIndex, nP), "H駓 b�/nothing"})
				return
		end
	end
	Comfirm_Learn(nBookId, nPetIndex, nP)
end
function Comfirm_Learn(nBookId, nPetIndex, nP)

	local nLevel = GetItemLevel(nBookId)
	local nNeedMoney = _get_need_money(nLevel)
	local nCash = GetCash()
	if nCash < nNeedMoney then
		Msg2Player(format("S� v祅g hi謓 c� c馻 c竎 h� kh玭g  %d v祅g", floor(nNeedMoney/MONTE_TO_GOLD_RATE)))
		return
	end
	
	local nRet = LearnPetSkill(nBookId, nPetIndex)
	if nRet > 0 then
		AddRuntimeStat(47, 2, 0, 1)
		if nP >= 87 and nP <= 106 then
			AddRuntimeStat(79, nP - 87 + 1, 0, 1)
		end
		DelItemByIndex(nBookId, -1)--先删除技能书
		Pay(nNeedMoney)
		if nRet > 1 then
			Msg2Player("Luy謓 k� n╪g b筺 ng h祅h th祅h c玭g!")
		else
			Msg2Player("Luy謓 k� n╪g b筺 ng h祅h th蕋 b筰!")
		end
		WriteLog(format("[Account:%s Role:%s]Use pet skill book %s(%d,%d,%d) ItemIdx=%d, PayMoney=%d, RetValue=%d(2=success)"
			, GetAccount(), GetName(), GetItemName(nBookId), GetItemGenre(nBookId), GetItemDetail(nBookId), GetItemParticular(nBookId)
			, nBookId, nNeedMoney, nRet
			))
	end
end

function _get_need_money(nLevel)
	local tMoney = {
		2*10000,
		4*10000,
		10*10000,
		50*10000,
		200*10000,
		200*10000,
		200*10000,
	}
	if nLevel>=1 and nLevel<=getn(tMoney) then
		return tMoney[nLevel]
	else
		return 999999*10000
	end
end

function no()
end
