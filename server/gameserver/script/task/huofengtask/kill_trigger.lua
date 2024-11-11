Import("\\script\\online_activites\\task_values.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\missions\\taiyi\\head.lua")

function clear_battle_kill_task()
	SetTask(VEIT_BATTLE_KILL_BOSS_COUNTER, 0)
	SetTask(VEIT_BATTLE_KILL_PLAYER_COUNTER, 0)
end

function battle_kill_player_callback(nDeathIndex)
	local nWeaponLevel = get_weapon_level()
	local nNeed = 0
	local nType = 0
	local szCap = "Ng��i ch�i"
	if tGtTask:check_cur_task(265)==1 then
		nNeed = 40
		nType = 1
	elseif tGtTask:check_cur_task(269)==1 then
		nNeed = 100
		nType = 2
	end
	if nType > 0 and GetTask(VEIT_BATTLE_KILL_PLAYER_COUNTER) < nNeed and nWeaponLevel==2 then
		SetTask(VEIT_BATTLE_KILL_PLAYER_COUNTER,GetTask(VEIT_BATTLE_KILL_PLAYER_COUNTER) + 1)
		if GetTask(VEIT_BATTLE_KILL_PLAYER_COUNTER) == nNeed then
			Msg2Player(format("Huy�t t� %d-Ti�u di�t %d/%d %s phe ��ch (Ho�n th�nh)",nType, GetTask(VEIT_BATTLE_KILL_PLAYER_COUNTER), nNeed, szCap))
		else
			Msg2Player(format("Huy�t t� %d-Ti�u di�t %d/%d %s phe ��ch",nType, GetTask(VEIT_BATTLE_KILL_PLAYER_COUNTER), nNeed, szCap))
		end
	end
end

function get_weapon_type(nP)
	local t_weapon ={
		--min,max,camp,cap,level
		{30288, 30307, 1, 1, 1},
		{30308, 30327, 1, 1, 2},
		{30328, 30391, 1, 1, 3},
		{30392, 30411, 1, 2, 1},
		{30412, 30431, 1, 2, 2},
		{30432, 30495, 1, 2, 3},
		{30496, 30515, 2, 1, 1},
		{30516, 30535, 2, 1, 2},
		{30536, 30599, 2, 1, 3},
		{30600, 30619, 2, 2, 1},
		{30620, 30639, 2, 2, 2},
		{30640, 30703, 2, 2, 3},
	}
	local t_ret = nil
	if nP and nP > 0 then
		for i = 1, getn(t_weapon) do
    		local t = t_weapon[i]
    		if nP >= t[1] and nP <= t[2] then
    			t_ret = t
    			break
    		end
    	end
	end
	return t_ret
end

function get_weapon_level()
	if 1 then
		return 2;
	end
--	local itempart_weapon = 2
--	local nEquipIDX = GetPlayerEquipIndex(itempart_weapon)
--	local nG,nD, nP = GetItemInfoByIndex(nEquipIDX)
--	local t = get_weapon_type(nP)
--	if not t then
--		return 0
--	end
--	local nLevel = t[5] or 0
--	return nLevel
end

function battle_kill_npc_callback(npcIndex)
	local nWeaponLevel = get_weapon_level()
	local szNpcName = GetNpcName(npcIndex)
	local nNeed = 0
	local nType = 0
	local szCap = ""
	if tGtTask:check_cur_task(265)==1 and (szNpcName == "T��ng qu�n (T�ng)" or szNpcName == "T��ng qu�n (Li�u) ") then
		nNeed = 1
		nType = 1
		szCap = "T��ng qu�n"
	elseif tGtTask:check_cur_task(269)==1 and (szNpcName == "T�ng nguy�n so�i" or szNpcName == "Li�u nguy�n so�i") then
		nNeed = 1
		nType = 2
		szCap = "Nguy�n So�i"
	end
	if nType > 0 and GetTask(VEIT_BATTLE_KILL_BOSS_COUNTER) < nNeed and nWeaponLevel==2 then
		SetTask(VEIT_BATTLE_KILL_BOSS_COUNTER,GetTask(VEIT_BATTLE_KILL_BOSS_COUNTER) + 1)
		if GetTask(VEIT_BATTLE_KILL_BOSS_COUNTER) == nNeed then
			Msg2Player(format("Huy�t t� %d-Ti�u di�t %d/%d %s phe ��ch (Ho�n th�nh)",nType, GetTask(VEIT_BATTLE_KILL_BOSS_COUNTER), nNeed, szCap))
		else
			Msg2Player(format("Huy�t t� %d-Ti�u di�t %d/%d %s phe ��ch",nType, GetTask(VEIT_BATTLE_KILL_BOSS_COUNTER), nNeed, szCap))
		end
	end
end

--̫һ�������
function rand_drop_huangguoliujin()
--	local nMapId,nX,nY = GetWorldPos();
--	if nMapId ~= 328 and nMapId ~= 329 then
--		return 0;
--	end
	--local nNpcIdx,sMoban,sName = GetTriggeringUnit();
	--if "�Ļ��̽�" == sName then
		if random(1,10000) <= 100 then --1%���ʵ���
			AddItem(2,0,30072,1) --�Ļ��̽�
		end
	--end
end

function kill_fenghuoliujin_call_back()
	local nWeaponLevel = get_weapon_level()
	--print("kill_fenghuoliujin_call_back", nWeaponLevel)
	if nWeaponLevel==2 and tGtTask:check_cur_task(268)==1 then
		--print("kill_fenghuoliujin_call_back", eDifType.HARD, tTY.mv_02, GetMissionV(tTY.mv_02))
		if eDifType.HARD == GetMissionV(tTY.mv_02) then
			--print("kill_fenghuoliujin_call_back finish")
			--gt_trigger_callback()
			local nNeed = 1
			if GetTask(VEIT_BATTLE_KILL_BOSS_COUNTER) < nNeed then
    		SetTask(VEIT_BATTLE_KILL_BOSS_COUNTER,GetTask(VEIT_BATTLE_KILL_BOSS_COUNTER) + 1)
    		if GetTask(VEIT_BATTLE_KILL_BOSS_COUNTER) == nNeed then
    			Msg2Player(format("Ti�u di�t %d/%d Hoang H�a L�u Kim (Ho�n th�nh)", GetTask(VEIT_BATTLE_KILL_BOSS_COUNTER), nNeed))
    		end
	end
		end
	end
end