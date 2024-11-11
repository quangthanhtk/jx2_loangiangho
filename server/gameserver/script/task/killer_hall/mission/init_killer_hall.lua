--date:2007-3-7
--author:yanjun
--describe:this file open the "killer hall" mission
Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua"); --LongDaiKa: thªm vµo ®Ó dïng g_WCFG
----------------------------------------------------------------------------------------------------

function main()
	if g_WCFG_SATTHUDUONG:IsDateOpen() ~= WEnv.TRUE then
		return WEnv.RETCODE_NOTOPEN;
	end

	if tonumber(date("%H")) == 9 then
		return 0;
	end

	if GetGlbValue(GLB_KILLER_HALL_FORBIDEN) == 0 then
		gf_ShowDebugInfor("current mission state:"..tostring(mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,MAP_ID)));
		if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,MAP_ID) == MS_STATE_IDEL then
			if mf_OpenMission(MISSION_ID,MAP_ID) == 1 then
				Msg2Global("S¸t thñ §­êng chiªu mé s¸t thñ, c¸c anh hïng kú n÷ nhanh chãng n¾m b¾t c¬ h«i.");
			end
		end
	end
end
