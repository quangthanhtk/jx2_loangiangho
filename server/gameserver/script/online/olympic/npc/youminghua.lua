--Import("\\script\\tmp_task_id_def.lua")
Include("\\settings\\static_script\\online\\olympic\\oly_define.lua")
Include("\\script\\online\\olympic\\oly_head.lua")

function main()
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		return 0;
	end
	--if GetTaskTemp(TMP_TASK_ID_OLY_YMH_TEMP_INDEX) == GetTargetNpc() then
		SetNpcLifeTime(GetTargetNpc(),0);
		AddItem(Flame_Table[2][1],Flame_Table[2][2],Flame_Table[2][3],1);
		Msg2Player(format("B�n nh�n ���c %s", Flame_Table[2][5]))
		--SetTaskTemp(TMP_TASK_ID_OLY_YMH_TEMP_INDEX,0);
	--end	
end