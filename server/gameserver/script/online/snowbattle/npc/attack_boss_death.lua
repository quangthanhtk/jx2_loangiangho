Include("\\script\\online\\snowbattle\\head.lua");
--��ɽѩ��
function OnDeath(npcIdx)
	ModifyExp(SB_T_KILL_EXP["boss"]);
	-- AwardGenuineQi(0);
	-- gf_AddItemEx2({2,1,30747,100}, "ʥ��װ��Ʒ", "��ѩ��", "��ɽѩ��", 0, 1)
	-- gf_AddItemEx2({2,1,30683,50}, "����ʯ", "��ѩ��", "Сѩ��", 0, 1)
	local szAward = "sb_boss";
	if CustomAwardCheckCondition(szAward, 0, 1)~=1 then return 0 end
	if CustomAwardGiveGroup(szAward, 0) > 0 then   --���Ų���Ϊ�Ƿ����ȫ������
        return 1
	end
	SetNpcLifeTime(npcIdx, 0);
	SB_OnBossDied();
end