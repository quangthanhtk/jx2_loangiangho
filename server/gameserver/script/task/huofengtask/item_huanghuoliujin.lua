Include("\\settings\\static_script\\global\\regular_clear_task.lua")
Include("\\script\\task\\huofengtask\\npc_huanghuoliujin_death.lua")
Include("\\script\\task\\global_task\\gtask_head.lua");


N_MAX_HUANGHUOZHIXIN_BOSS_CALL_CNT=1
function OnUse(id)
	local tbSay = {}
	tinsert(tbSay, format("%s/call_fight_npc", "Chi�u g�i Hoang H�a L�u Kim (Ch�n th�n) "))
	tinsert(tbSay, format("%s/no", "K�t th�c ��i tho�i"))
	local szMsg = format("%s:%s", "<color=green>Hoang H�a Chi T�m<color>", "Ho�n th�nh chu�i nhi�m v� H�a Ph�ng m�i tu�n c� th� khi�u chi�n 1 l�n Hoang H�a L�u Kim (Ch�n th�n) ")
	Say(szMsg,getn(tbSay),tbSay)
end

function call_fight_npc()
	if check_condition(1)~=1 then return end
	
	local nMap,nX,nY = GetWorldPos()
	if nMap ~= 8011 then
		Talk(1, "", format("Ch� ���c chi�u g�i Hoang H�a L�u Kim (Ch�n th�n) t�i V�n Linh ��i"))
		return
	end
	
	if rc_GetWeeklyTask(N_MAX_HUANGHUOZHIXIN_BOSS_CALL_CNT) >= N_MAX_HUANGHUOZHIXIN_BOSS_CALL_CNT then
		Talk(1, "", format("S� l�n tri�u h�i Hoang H�a L�u Kim (Ch�n th�n) c�a tu�n n�y �� ��t gi�i h�n, tu�n sau h�y quay l�i!"))
		return
	end
	
	local t_need = {"Hoang H�a L�u Kim",2, 0, 30072, 1}
	if GetItemCount(t_need[2], t_need[3], t_need[4]) < t_need[5] then
		Talk(1, "", format("%s kh�ng �� %d", t_need[1], t_need[5]))
		return
	end
	if DelItem(t_need[2], t_need[3], t_need[4], t_need[5]) ~= 1 then
		return
	end
	
	nX = nX + random(-5,5)
	nY = nY + random(-5,5)
	local npcIndex = CreateNpc("TYT_HHHLJ", "Hoang H�a L�u Kim (Ch�n th�n)", nMap,nX,nY)
	SetNpcTempData(npcIndex, NPC_TEMP_HUANGHUOZHIXIN_DAYE_IDX, PlayerIndex)--��¼��ү��index
	SetNpcLifeTime(npcIndex, 5*60*18)--5���Ӻ���ʧ
	SetNpcDeathScript(npcIndex, "\\script\\task\\huofengtask\\npc_huanghuoliujin_death.lua")
end

function check_condition(bNotify)
	if tGtTask:check_task_isfinish(270) ~= 1 then
		if bNotify==1 then
			Talk(1, "", "Ho�n th�nh chu�i nhi�m v� H�a Ph�ng m�i ���c khi�u chi�n!")
		end
		return 0
	end
	return 1
end
