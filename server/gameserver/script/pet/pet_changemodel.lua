
ATTR_ID_START = 9941

function CastSkillState(nSkillLv)
	if nSkillLv == 0 then return end
	local nLiveAddPrecent 	= nSkillLv;	-- 加生命比例
	local nAddPAttack 		= nSkillLv;	-- 加外功比例
	local nAddMAttack 		= nSkillLv;	-- 加内功比例
	local nAddDamagePoint 	= 105 + ( nSkillLv - 1 ) * 10;
	CastState("state_life_max_percent_add", nLiveAddPrecent,	-1, 1, ATTR_ID_START + 0)
	CastState("state_p_attack_percent_add", nAddPAttack,		-1, 1, ATTR_ID_START + 1)
	CastState("state_m_attack_percent_add", nAddMAttack,		-1, 1, ATTR_ID_START + 2)
	CastState("state_damage_point",		nAddDamagePoint,	-1, 1, ATTR_ID_START + 3)
	SyncCustomState(1, 9941, 1, "Cng h鉧 Gi竛g Linh Thu藅");
end

function ClearSkillState(nSkillLv)
	RemoveState(ATTR_ID_START + 0)
	RemoveState(ATTR_ID_START + 1)
	RemoveState(ATTR_ID_START + 2)
	RemoveState(ATTR_ID_START + 3)
end