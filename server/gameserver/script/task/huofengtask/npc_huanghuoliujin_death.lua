Include("\\settings\\static_script\\global\\regular_clear_task.lua")
NPC_TEMP_HUANGHUOZHIXIN_DAYE_IDX = 1
function OnDeath(id, f, x)
	local OldPlayerIndex = PlayerIndex
--	if GetTeamSize()>1 then
--		PlayerIndex = GetTeamMember(0)
--	end
	
	local daye = GetNpcTempData(id, NPC_TEMP_HUANGHUOZHIXIN_DAYE_IDX)
	PlayerIndex = daye
	local nMap = GetWorldPos()
	if nMap ~= 8011 then --��ү�Ѿ���������̨��
		return
	end
	rc_SetWeeklyTask(WEEKLY_TASK_CALL_HUANGHUOLIUJIN, rc_GetWeeklyTask(WEEKLY_TASK_CALL_HUANGHUOLIUJIN)+1)
	
	if random(1,10000) <= 10000 then --100%���ʵ���
		AddItem(2,0,30082,1) --�Ļ��̽�֮��
	end

	--ɾ��ʬ��
	SetNpcTempData(id, NPC_TEMP_HUANGHUOZHIXIN_DAYE_IDX, 0)
	SetNpcRemoveScript(id, "");
	SetNpcLifeTime(id, 0);
end