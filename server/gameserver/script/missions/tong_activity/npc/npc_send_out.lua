Include("\\script\\lib\\floyd.lua")
Import("\\script\\lib\\npccmdhead.lua")
Include("\\script\\missions\\tong_activity\\head.lua")
Include("\\script\\missions\\tong_activity\\activity_function.lua")
Include("\\script\\missions\\tong_activity\\cfg\\pos_cfg.lua")

function main()
	local tMsg = {
		"Ta mu�n r�i kh�i n�i n�y/leave",
		"Ta mu�n h�i ph�c th� l�c n�i l�c/RestoreAll",
		"Kh�ng c� g�/nothing"
		}
		
	if g_isDebug == 1 then
		tinsert(tMsg, getn(tMsg), "*****Th� nghi�m ri�ng: Ta mu�n v�o b��c ti�p theo*****/next_stage");
	end
			
	Say("<color=green>S� Gi� Ho�t ��ng Bang<color>: Xin h�i ��i hi�p c�n g�?",
		getn(tMsg),
		tMsg)
end

function leave()
	do_leave();	
	NewWorld(tPos_Entrance[1][1], tPos_Entrance[1][2], tPos_Entrance[1][3]);
end

function next_stage()
	SendScript2VM(thisFile, "goto_next_stage()");
end
