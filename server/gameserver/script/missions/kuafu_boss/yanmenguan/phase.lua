Include("\\script\\missions\\kuafu_boss\\common_phase.lua")

Import("\\script\\missions\\kuafu_boss\\yanmenguan\\mission_head.lua")


function phase_kfb_fighting:onPlayerDeath(event, killId)

end

function phase_kfb_fighting:OnRevive(event)
	--SetTempRevScript(thisFile);
	
	RestoreAll();
end