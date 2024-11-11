
ATTR_ID_START = 9941

function CastSkillState(nSkillLv)
	if nSkillLv == 0 then return end
	local nLiveAddPrecent 	= nSkillLv;	-- ����������
	local nAddPAttack 		= nSkillLv;	-- ���⹦����
	local nAddMAttack 		= nSkillLv;	-- ���ڹ�����
	local nAddDamagePoint 	= 105 + ( nSkillLv - 1 ) * 10;
	CastState("state_life_max_percent_add", nLiveAddPrecent,	-1, 1, ATTR_ID_START + 0)
	CastState("state_p_attack_percent_add", nAddPAttack,		-1, 1, ATTR_ID_START + 1)
	CastState("state_m_attack_percent_add", nAddMAttack,		-1, 1, ATTR_ID_START + 2)
	CastState("state_damage_point",		nAddDamagePoint,	-1, 1, ATTR_ID_START + 3)
	SyncCustomState(1, 9941, 1, "C��ng h�a Gi�ng Linh Thu�t");
end

function ClearSkillState(nSkillLv)
	RemoveState(ATTR_ID_START + 0)
	RemoveState(ATTR_ID_START + 1)
	RemoveState(ATTR_ID_START + 2)
	RemoveState(ATTR_ID_START + 3)
end