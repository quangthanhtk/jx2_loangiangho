Include("\\script\\missions\\yp\\yp_head.lua")

function OnDeath(nKillIDX)
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then
		nCamp = 5;
	end
	local m = GetWorldPos();
	SetTempRevPos(tTempRev[nCamp][m][1],tTempRev[nCamp][m][2]*32,tTempRev[nCamp][m][3]*32); --临时重生点
	

	local KillerIndex = NpcIdx2PIdx(nKillIDX);
	if KillerIndex > 0 then--
		local nOldPlayerIndex = PlayerIndex
		PlayerIndex = KillerIndex;
		
		--cdkey活动
		gf_TeamOperateEX(function () 
			--SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_PVP_Set(4)");	
			SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "ck_global_set_task_finish(1304)");
		end);
		
		PlayerIndex = nOldPlayerIndex;
	end
end