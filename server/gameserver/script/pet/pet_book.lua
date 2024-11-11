--Include("\\script\\pet\\pet_book_exchange.lua")
--Include("\\script\\pet\\pet_update.lua")
--Include("\\script\\pet\\forget_pet_skill.lua")
--ENABLE_PET_NPC_TEST=1

--ͨ�����＼����ѧϰ���＼��
--MONEY_NEED_RATE = 50000
MONTE_TO_GOLD_RATE = 10000

-- ����id�����飺{[skillid] = group}
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
		local szTitle = format("H�y ch�n k� n�ng c�n luy�n <color=yellow>[%s]<color> cho b�n ��ng h�nh (luy�n k� n�ng c�n ti�u hao %d v�ng). ��i v�i nh�ng k� n�ng �� c� v�i c�p �� th�p h�n ���c n�ng c�p th�nh c�ng s� ���c nh�n l�i t� ch�t �� chi�m d�ng. <enter><color=red>Ch� �, k� n�ng luy�n th�nh c�ng c� t� l� nh�t ��nh thay th� k� n�ng h� tr� hi�n c�.<color>", szBookName, nNeedGold);
		for i = 1, getn(tbPetList) do
			local szItem = format("%s(T� ch�t c�n l�i:%d/%d)/#_OnLearnOnPet(%d, %d, %d)", tbPetList[i].szName, tbPetList[i].nCurTianZi, tbPetList[i].nMaxTianZi, id, tbPetList[i].nIndex, nP)
			tinsert(tbSay, szItem)
		end
--		if ENABLE_PET_NPC_TEST then
--			tinsert(tbSay, "��Ҫ�������/PetUpdateMain")
--			tinsert(tbSay, "��Ҫ�һ���鼼����/PetBookExchangeMain")
--			tinsert(tbSay, "��Ҫ������鼼��/ForgetPetSkillMain")
--		end
		tinsert(tbSay, "Th�i �i, ta kh�ng mu�n h�c/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		Talk(1,"","C�c h� ch�a c� b�n ��ng h�nh, kh�ng th� s� d�ng s�ch k� n�ng n�y!")
	end
end

function _OnLearnOnPet(nBookId, nPetIndex, nP)
	local nBookSkill, szSkillName, nBookSkillLv = GetPetBookInfo(nBookId)
	local tPetSkills = GetPetSkillByIndex(nPetIndex)
	for k,v in tPetSkills do
		if CheckMutexGroup(v["nSkillID"], nBookSkill) == 1 then
			Say(format("<color=red2>Xin ch� �<color>,h�c s�ch k� n�ng n�y s� thay th� k� n�ng th� nu�i hi�n nay<color=yellow>[%s]<color>,c� ��ng � kh�ng?", v["szSkillName"]), 2, 
				{format("��ng �/#Comfirm_Learn(%d,%d,%d)", nBookId, nPetIndex, nP), "H�y b�/nothing"})
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
		Msg2Player(format("S� v�ng hi�n c� c�a c�c h� kh�ng �� %d v�ng", floor(nNeedMoney/MONTE_TO_GOLD_RATE)))
		return
	end
	
	local nRet = LearnPetSkill(nBookId, nPetIndex)
	if nRet > 0 then
		AddRuntimeStat(47, 2, 0, 1)
		if nP >= 87 and nP <= 106 then
			AddRuntimeStat(79, nP - 87 + 1, 0, 1)
		end
		DelItemByIndex(nBookId, -1)--��ɾ��������
		Pay(nNeedMoney)
		if nRet > 1 then
			Msg2Player("Luy�n k� n�ng b�n ��ng h�nh th�nh c�ng!")
		else
			Msg2Player("Luy�n k� n�ng b�n ��ng h�nh th�t b�i!")
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
