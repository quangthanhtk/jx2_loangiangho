Include("\\settings\\static_script\\missions\\base\\callfuture.lua");
Import("\\script\\lib\\npccmdhead.lua");
Include("\\script\\lib\\floyd.lua");
Include("\\script\\missions\\qingshahe_battle\\head.lua")
Include("\\script\\missions\\qingshahe_battle\\stage\\stage1.lua")
Include("\\script\\missions\\qingshahe_battle\\stage\\stage2.lua")
Include("\\script\\missions\\qingshahe_battle\\stage\\stage3.lua")

msSettings:LoadConfig();
this.msOption.szInitDeahScript = thisFile;

tPhaseDriver = {
    timerID = 122,
    maxsecond = 60*60,
};
tPhaseDriver.name = "QSH_Phase";
tPhaseDriver = gf_CopyInherit(phaseBase,tPhaseDriver);
tPhaseDriver.phases = {tStage01, tStage02, tStage03};

this.msPhases[1] = inherit(this.msPhases[1], tPhaseDriver);

this.msPosition.entryPos = {
	[8905] = {{1529, 3397}, {1732, 3105},}
}
this.msPosition.exitPos = {
	{300,1640,3536}
}

this.msPosition.getEntryPos = function(self, nCamp)
	local pos = self.entryPos[self:getTemplateMapID()];
	if type(pos[1]) == "table" then
		pos = pos[nCamp] or pos[1];
	end
	return self:getMapID(), gf_UnPack(pos);
end

this.msOption.OnPlayerJoin = function(self, nCamp)
	SetTask(QSH_TSK_PLAYER_CAMP,nCamp)
end
