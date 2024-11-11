-- if _DEF_TONG_ACTIVITY_HEAD then
-- 	return
-- else
-- 	_DEF_TONG_ACTIVITY_HEAD = 1
-- end

Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Import("\\script\\lib\\define.lua")
-- Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Import("\\script\\lib\\globalfunctions.lua")

--g_nBossMaxBlood = 2*10^9;
tbTongActivity={
	name="Ho�t ��ng bang",
	missionID = 87, --�������ļ�������������ļ�/GameSvr/settings/task/missions.txt��Ӧ
	realMapID = 8900,
	dynamicMap = 1, -- ��̬��ͼ
	mv1 = 1, --BOSS IDX
	mv2 = 2, --BOSS�޵е�ʱ��
	mv3 = 3, --BOSS����������
	mv4 = 4, --��¼�Ƿ�ɹ���ɱBOSS
	mv5 = 5, --��������Ƿ��Ѿ�������ı��
	mv6 = 6, --����ĵ�ͼID
	
	ms1 = 1, --��¼�����
	}

DUTY_ID_NONE		= 0;
DUTY_ID_KING		= 1;
DUTY_ID_QUEEN		= 2;
DUTY_ID_GENERAL		= 3;
DUTY_ID_CAPTAIN		= 4;
DUTY_ID_SERGEANT	= 5;
DUTY_ID_MEMBER		= 6;

enumTongValue_Shop1Opend 			= 1--20; --�������̵��Ƿ���
enumTongValue_HorseRentPlayerID 	= 2--21; --��¼���Ψһ������߱��ĸ����������
enumTongValue_ActivityOpenTime		= 3--22; --���������ʱ��(dHHMM,����310820��ʾ31��08:20����)
enumTongValue_ActivityMapId			= 4--23; --�����ͼID
enumTongValue_ActivityOpenWeek		= 5 -- ��Ὺ�������� ���ڿ������
TASKID_TONG_GET_ACTIVITY_AWARD = 3475;
TASKID_TONG_JOIN_ACTIVITY_TIME = 3476;
TASKID_TONG_LUCKDRAW_COUNT	   = 3477;
TASKID_TONG_ACTIVITY_MAP	   = 3486;

TASKID_TONG_ACTIVITY_ENTER = 3478;  -- �ڽ���ʱ��¼һ�£���ʮת����ʹ��

tbTongActivity = gf_CopyInherit(missionHead, tbTongActivity);
tbTongActivity = gf_CopyInherit(missionBase, tbTongActivity);

firePhases = {
	timerID = 121, --��ʱ�� ΨһID,�����ñ�: ����������ļ�/GameSvr/settings/timer_task.txtƥ��
	maxsecond = 60*60 + 5,
};
firePhases = gf_CopyInherit(phaseBase,firePhases);

g_isDebug = 0; --Debug״̬�������������NPC�Ի�ѡ��

thisFile = "\\script\\missions\\tong_activity\\mission.lua";

