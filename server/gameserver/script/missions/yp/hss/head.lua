Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")

thisFile = "\\script\\missions\\yp\\hss\\mission.lua";

tbTBHSS = { 
	name = "Th� Ph�n H�a Sinh T�",
--	timerID = 79,
	missionID = 80,
	realMapID = 6100,
	dynamicMap = 0,
	
	timerTriggerID = 1542,
	costomerID = 1542*2,
	tMapTrigger = {3014,3015,3016,3017},
	--����ΪmissionV����
	mv1 = 1, --1-10�ر�ͼ���λ��
	mv2 = 2,
	mv3 = 3,
	mv4 = 4,
	mv5 = 5,
	mv6 = 6,
	mv7 = 7,
	mv8 = 8,
	mv9 = 9,
	mv10 = 10,
	mv11 = 11, --������������
	mv12 = 12,   --����ʱ���
	mv13 = 13,   --����ʱ������
}
tbTBHSS = gf_CopyInherit(missionHead, tbTBHSS)

firePhases = {
	timerID = 114,
	frequency = 18*2,
	maxsecond = 14*24*3600, --7�죿
};
firePhases = gf_CopyInherit(phaseBase,firePhases)