Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")

thisFile = "\\script\\missions\\yp\\tysd\\mission.lua";

tbTYSD = { 
	name = "Thi�n �m Th�nh ��a",
	missionID = 82,
	realMapID = 6400,
	dynamicMap = 0,
	
	--����ΪmissionV����
}
tbTYSD = gf_CopyInherit(missionHead, tbTYSD)

firePhases = {
	timerID = 116,
	frequency = 18*2,
	maxsecond = 14*24*3600, --7�죿
};
firePhases = gf_CopyInherit(phaseBase,firePhases)