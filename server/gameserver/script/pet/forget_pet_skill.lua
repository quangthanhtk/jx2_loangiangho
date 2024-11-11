--�������＼��
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

NEED_GOLD = 10 --����

local COST = {
	NAME = "Thi�n Ki�u L�nh",
	CNT  = 1,
	ID	 = {2, 97, 236}
}

MONTE_TO_GOLD_RATE = 10000;

m_nCostGold = 200; -- ��n v� v�ng

t_player_pet_list = {}

function ForgetPetSkillMain()
	_ChoosePet()
end

function _ChoosePet()
	local tbSay = {}
	local nPetCount,tbPetList = GetPetList()
	t_player_pet_list[PlayerIndex] = tbPetList--���³����б�
	if nPetCount > 0 then
		local szTitle = format("B�n ��ng h�nh c�a ��i hi�p c� h�c k� n�ng v� d�ng, y�n t�m, ��i hi�p c� th� x�a nh�ng k� n�ng �� t�i ��y. M�i l�n qu�n m�t k� n�ng ph�i tr� %d * %s. <color=red> K� n�ng �� x�a kh�ng th� kh�i ph�c l�i, ch� c� th� h�c l�i m�t l�n n�a. <color> Gi�, m�i b�n ch�n b�n ��ng h�nh  mu�n x�a k� n�ng.:",%COST.CNT, %COST.NAME);
		for i = 1, getn(tbPetList) do
			if SafeGetBit(tbPetList[i].nStatus, 2) == 0 then --if not lock
				local szItem = format("%s(T� ch�t c�n l�i:%d/%d)/#_ChooseSkill(%d)", tbPetList[i].szName, tbPetList[i].nCurTianZi, tbPetList[i].nMaxTianZi, i)
				tinsert(tbSay, szItem)
			end
		end
		tinsert(tbSay, "Ra kh�i/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		t_player_pet_list[PlayerIndex] = nil
		Talk(1,"","C�c h� ch�a c� b�n ��ng h�nh kh�ng th� x�a k� n�ng!")
	end
end

function _ChooseSkill(nPetListIndex)
	local tbSay = {}
	local tbPetInfo = t_player_pet_list[PlayerIndex][nPetListIndex] or {}
	local tbPetSkill = tbPetInfo.tbDynamicSkill or {}
	if getn(tbPetSkill) > 0 then
		local szTitle = format("B�n x�c ��nh x�a k� n�ng b�n ��ng h�nh <color=yellow>%s(t� ch�t c�n l�i:%d/%d)<color> kh�ng?<color=red>k� n�ng b� x�a s� kh�ng th� kh�i ph�c l�i, ch� c� th� luy�n l�i t� ��u<color>H�y ch�n k� n�ng c�n x�a (x�a k� n�ng c�n ti�u hao %d * %s):"
			, tbPetInfo.szName, tbPetInfo.nCurTianZi, tbPetInfo.nMaxTianZi, %COST.CNT, %COST.NAME);
		for i = 1, getn(tbPetSkill) do
			local szItem = format("D�y %d: %s%d c�p (Chi�m t� ch�t: %d)/#_ConfirmDelPetSkill(%d, %d)"
				, tbPetSkill[i].nSkillIndex + 1, tbPetSkill[i].szSkillName, tbPetSkill[i].nSkillLv, tbPetSkill[i].nNeedTianZi
				, nPetListIndex, i)
			tinsert(tbSay, szItem)
		end
		tinsert(tbSay, "tr� l�i/_ChoosePet")
		tinsert(tbSay, "Ra kh�i/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		t_player_pet_list[PlayerIndex] = nil
		local szMsg = format("B�n ��ng h�nh <color=yellow>%s<color> v�n ch�a c� k� n�ng h� tr�, kh�ng th� x�a", tbPetInfo.szName)
		Talk(1,"",szMsg)
	end
end

function _ConfirmDelPetSkill(nPetListIndex, nSkillListIndex)
	local tbSay = {}
	local tbPetInfo = t_player_pet_list[PlayerIndex][nPetListIndex] or {}
	local tbPetSkill = tbPetInfo.tbDynamicSkill or {}
	if getn(tbPetSkill) > 0 and getn(tbPetSkill) >= nSkillListIndex then
		--local szTitle = format("X�c ��nh cho b�n ��ng h�nh <color=yellow>%s (T� ch�t c�n l�i: %d/%d)<color>x�a k� n�ng<color=yellow>d�y th� %d: %s%d c�p (chi�m t� ch�t %d)<color> kh�ng? Th�nh c�ng x�a b� <color=yellow>���c nh�n l�i �i�m t� ch�t: %d<color>. <color=red>K� n�ng b� x�a �i s� kh�ng th� kh�i ph�c l�i, ch� c� th� luy�n l�i t� ��u.<color>H�y x�c ��nh l�n cu�i (x�a k� n�ng c�n ti�u hao %d * %s):"
		--	, tbPetInfo.szName, tbPetInfo.nCurTianZi, tbPetInfo.nMaxTianZi
		--	, tbPetSkill[nSkillListIndex].nSkillIndex + 1, tbPetSkill[nSkillListIndex].szSkillName, tbPetSkill[nSkillListIndex].nSkillLv, tbPetSkill[nSkillListIndex].nNeedTianZi
		--	, tbPetSkill[nSkillListIndex].nNeedTianZi , %COST.CNT, %COST.NAME);
		local szTitle = format("X�c ��nh cho b�n ��ng h�nh <color=yellow>%s (T� ch�t c�n l�i: %d/%d)<color>x�a k� n�ng<color=yellow>d�y th� %d: %s%d c�p (chi�m t� ch�t %d)<color> kh�ng? Th�nh c�ng x�a b� <color=yellow>���c nh�n l�i �i�m t� ch�t: %d<color>. <color=red>K� n�ng b� x�a �i s� kh�ng th� kh�i ph�c l�i, ch� c� th� luy�n l�i t� ��u.<color>H�y x�c ��nh l�n cu�i (x�a k� n�ng c�n ti�u hao %d v�ng):"
			, tbPetInfo.szName, tbPetInfo.nCurTianZi, tbPetInfo.nMaxTianZi
			, tbPetSkill[nSkillListIndex].nSkillIndex + 1, tbPetSkill[nSkillListIndex].szSkillName, tbPetSkill[nSkillListIndex].nSkillLv, tbPetSkill[nSkillListIndex].nNeedTianZi
			, tbPetSkill[nSkillListIndex].nNeedTianZi , m_nCostGold);
		local szItem = format("X�c ��nh x�a/#_OnDelPetSkill(%d, %d)", nPetListIndex, nSkillListIndex)
		tinsert(tbSay, szItem)
		szItem = format("tr� l�i/#_ChooseSkill(%d)", nPetListIndex)
		tinsert(tbSay, szItem)
		tinsert(tbSay, "Ra kh�i/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		t_player_pet_list[PlayerIndex] = nil
	end
end

function _OnDelPetSkill(nPetListIndex, nSkillListIndex)
	--if DelItem(%COST.ID[1],%COST.ID[2],%COST.ID[3],%COST.CNT) == 0 then		-- ��ɾ���콾��
	--	Talk(1,"",format("B�n kh�ng �� %s",%COST.NAME))
	--	return 0;
	--end

	if WPlayer:PayGold(m_nCostGold) ~= WEnv.RETCODE_SUCCESS then
		WNpc:Talk(format("B�n kh�ng �� <color=red>%d v�ng<color> �� thao t�c!", m_nCostGold), WEnv.TRUE);
		return 0;
	end

	local tbPetInfo =t_player_pet_list[PlayerIndex][nPetListIndex] or {}
	local tbPetSkill = tbPetInfo.tbDynamicSkill or {}
	if getn(tbPetSkill) >= nSkillListIndex then
		local nResult = ForgetPetSkill(tbPetInfo.nIndex, tbPetSkill[nSkillListIndex].nSkillIndex, tbPetSkill[nSkillListIndex].nSkillId, tbPetSkill[nSkillListIndex].nSkillLv)
		if nResult == tbPetSkill[nSkillListIndex].nSkillIndex and nSkillListIndex >= 0 then
			AddRuntimeStat(47, 1, 0, 1)
			local szMsg = format("B�n ��ng h�nh %s �� x�a k� n�ng %s th�nh c�ng", tbPetInfo.szName, tbPetSkill[nSkillListIndex].szSkillName)
			Msg2Player(szMsg)
		else
			--AddItem(%COST.ID[1],%COST.ID[2],%COST.ID[3],%COST.CNT)			-- �������ʧ�ܣ����콾��ӻ���
			local szMsg = format("B�n ��ng h�nh x�a k� n�ng th�t b�i", tbPetInfo.szName, tbPetSkill[nSkillListIndex].szSkillName)
			Msg2Player(szMsg)
		end
	end
	
	t_player_pet_list[PlayerIndex] = nil
end

function no()
	t_player_pet_list[PlayerIndex] = nil
end