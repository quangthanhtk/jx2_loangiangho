Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")

thisFile = "\\script\\missions\\yp\\tls\\mission.lua";

tbDLTLS = { 
	name = "��i L� Thi�n Long T�",
--	timerID = 79,
	missionID = 78,
	realMapID = 6000,
	dynamicMap = 0,
	
	timerTriggerID = 1540,
	costomerID = 1540*2,
	tMapTrigger = {3018,3019,3020,3021,3022,3023},
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
tbDLTLS = gf_CopyInherit(missionHead, tbDLTLS)

firePhases = {
	timerID = 112,
	frequency = 18*2,
	maxsecond = 14*24*3600, --7�죿
};
firePhases = gf_CopyInherit(phaseBase,firePhases)
