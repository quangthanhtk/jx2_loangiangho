Import("\\settings\\static_script\\missions\\base\\mission_head.lua")


---------------------���и�������������ͬ�Ĳ���-----------------------
----------------�������Ͻ��ⲿImport����и��ǣ�����------------------
----------------�������Ͻ��ⲿImport����и��ǣ�����------------------
----------------�������Ͻ��ⲿImport����и��ǣ�����------------------

g_kfbDebug = 0

--����ͨ������
KFB_NEED_REBORN = 9                 --ת������ 9ת
KFB_NEED_LEVEL  = 90                --�ȼ����� 90��
--����ʱ����relay��task������
KFB_RANK_TONG_COUNT = 15			--������ʾ����־��¼����ǰn���İ��

--����ͨ���������
KFB_TSKID_ACTIVE_POINT 				= 3593 --���˻�Ծ��
KFB_TSKID_ACTIVE_POINT_TYPE_LIMIT	= 3594 --��;���ѻ�ȡ�Ļ�Ծ�ȣ����������ж�
KFB_TSKID_ACTIVE_POINT_ADD_CD		= 3595 --��¼�Զ��ӻ�Ծ��ʱ�䣬����cd�ж�


--����ͨ���趨
T_KFB_COMMON_PHASE_TIME = {
	--[�׶�] = ����ʱ��(��)
	[1] = 1, 		--��ʼ���׶�
	[2] = 5 * 60, 	--�ȴ��׶�
	[3] = 55 * 60,	--ս���׶�
	[4] = 5 * 60, 	--�����׶�
}
if g_kfbDebug == 1 then
	T_KFB_COMMON_PHASE_TIME = {
		--[�׶�] = ����ʱ��(��)
		[1] = 2, 		--��ʼ���׶�
		[2] = 10, 		--�ȴ��׶�
		[3] = 11 * 60,	--ս���׶�
		[4] = 2 * 60, 	--�����׶�
	}
end
g_TotalPhaseTime = 0
for i=1, getn(T_KFB_COMMON_PHASE_TIME) do
	g_TotalPhaseTime = g_TotalPhaseTime + tonumber(T_KFB_COMMON_PHASE_TIME[i])
end

KFB_COMMON_PHASE_CREATE_BOSS_TIME		= 5*60 --ս���׶δ���boss��ʱ��
if g_kfbDebug == 1 then
	KFB_COMMON_PHASE_CREATE_BOSS_TIME 	= 10
end
KFB_COMMON_PHASE_COUNT_DOWN_START_TIME	= T_KFB_COMMON_PHASE_TIME[3] - 10*60 --ս���׶ν�������ʱ��ʼʱ��

KFB_COMMON_PLAYER_CAMP 		= 0		-- ���Ĭ����Ӫ
KFB_ADD_ACTIVE_POINT_ADD_CD = 30	-- boss�����ӻ�Ծʱ����
if g_kfbDebug == 1 then
	KFB_ADD_ACTIVE_POINT_ADD_CD = 3	-- ����ģʽ boss�����ӻ�Ծʱ����
end
KFB_ADD_ACTIVE_POINT_RADIUS = 360	-- boss�����ӻ�Ծ�ķ�Χ�뾶

KFB_MAX_KICK_PlAYER_COUNT   = 10	-- �������Զ�����ÿ���ߵ�����

KFB_ACTIVITY_TYPE_KILLPLAYER = 1    -- ��ɱ���
KFB_ACTIVITY_TYPE_PLAYERDEAD = 2    -- ��������
KFB_ACTIVITY_TYPE_CLOSE_BOSS = 3    -- boss����������ʱ�ӻ�Ծ
T_KFB_ACTIVITYINFO = {
    --                              { ���λ��, ��;�����ֵ, ���浱ǰͨ����;����ȡ��ֵ�� �����洢λ[l-r] }
    [KFB_ACTIVITY_TYPE_KILLPLAYER] = {value = 2, max = 20,  taskid = KFB_TSKID_ACTIVE_POINT_TYPE_LIMIT,  lbit = 1,   rbit = 8,   msg="Ng�i �� ��nh b�i k� ��ch"},
    [KFB_ACTIVITY_TYPE_PLAYERDEAD] = {value = 1, max = 10,  taskid = KFB_TSKID_ACTIVE_POINT_TYPE_LIMIT,  lbit = 9,   rbit = 16,  msg="Ng�i chi�n ��u h�t m�nh, ki�t s�c n�m ngh�"},
    [KFB_ACTIVITY_TYPE_CLOSE_BOSS] = {value = 1, max = nil, taskid = nil,   lbit = nil, rbit = nil, msg="T�ch c�c tham d� chi�n ��u"},
}
T_KFB_ACTIVITY_ROUTE_MULTIPLE = {
	[8]	 = 2, --��ü���
	[21] = 2, --�嶾��ʦ
} 

KFB_MISSION_DATA_IDX_YMG 	= 1
KFB_MISSION_DATA_IDX_DCY2 	= 2
KFB_MISSION_DATA_IDX_DCY1 	= 3
KFB_MISSION_DATA_IDX_WQBL 	= 4
T_KFB_MISSION_CONFIG	= {
--	[KFB_MISSION_DATA_IDX_YMG] = {MSID,RealMapId,MaxMapNum,MaxPlayerNum/map,IsDynamic,MSName,thisfile,	timerID, [9]=MaxTongMemberCount},
	--���Ź���Ϊ�����,�������� [MaxMapNum]*[MaxPlayerNum/map] �� ����ս����ͼ��������֮��
	[KFB_MISSION_DATA_IDX_YMG] 	= {96, 8916, 6, 200, 1, "Nh�n M�n quan",			"\\script\\missions\\kuafu_boss\\yanmenguan\\mission.lua",	130, nil,},
	[KFB_MISSION_DATA_IDX_DCY2]	= {93, 8923, 2, 200, 1, "Chi�n BOSS Bang (PVE)",	"\\script\\missions\\kuafu_boss\\dacaoyuan2\\mission.lua",	127, nil,},
	[KFB_MISSION_DATA_IDX_DCY1]	= {94, 8921, 1, 400, 1, "Chi�n BOSS Bang (PVP 1)",	"\\script\\missions\\kuafu_boss\\dacaoyuan1\\mission.lua",	128, 50, },
	[KFB_MISSION_DATA_IDX_WQBL]	= {95, 8922, 1, 400, 1, "Chi�n BOSS Bang (PVP 2)",	"\\script\\missions\\kuafu_boss\\wangqibuluo\\mission.lua",	129, 50, },
}
if g_kfbDebug == 1 then
	T_KFB_MISSION_CONFIG	= {
	--	[KFB_MISSION_DATA_IDX_YMG] = {MSID,RealMapId,MaxMapNum,MaxPlayerNum/map,IsDynamic,MSName,thisfile,timerID},
		--���Ź���Ϊ�����,�������� [MaxMapNum]*[MaxPlayerNum/map] �� ����ս����ͼ��������֮��
		[KFB_MISSION_DATA_IDX_YMG] 	= {96, 8916, 2, 1, 1, "Nh�n M�n quan",			"\\script\\missions\\kuafu_boss\\yanmenguan\\mission.lua",		130, 1},
		[KFB_MISSION_DATA_IDX_DCY2]	= {93, 8923, 2, 1, 1, "Chi�n BOSS Bang (PVE)",	"\\script\\missions\\kuafu_boss\\dacaoyuan2\\mission.lua",		127, 1},
		[KFB_MISSION_DATA_IDX_DCY1]	= {94, 8921, 1, 2, 1, "Chi�n BOSS Bang (PVP 1)",	"\\script\\missions\\kuafu_boss\\dacaoyuan1\\mission.lua",	128, 1},
		[KFB_MISSION_DATA_IDX_WQBL]	= {95, 8922, 1, 2, 1, "Chi�n BOSS Bang (PVP 2)",	"\\script\\missions\\kuafu_boss\\wangqibuluo\\mission.lua",	129, 1},
	}
end
KFB_ALL_MAPS_MAX_PLAYER		= T_KFB_MISSION_CONFIG[KFB_MISSION_DATA_IDX_YMG][4] * T_KFB_MISSION_CONFIG[KFB_MISSION_DATA_IDX_YMG][3]

T_KFB_JOIN_MISSION_BUFF = {
	--{buff, value, time֡, �Ƿ��滻, ID, ״̬����}
	[KFB_MISSION_DATA_IDX_YMG] 	= {{"state_dispear", 100, 3*18, 1, 8000, 0}, },
	[KFB_MISSION_DATA_IDX_DCY2]	= {{"state_dispear", 100, 3*18, 1, 8000, 0}, },
	[KFB_MISSION_DATA_IDX_DCY1]	= {{"state_dispear", 100, 3*18, 1, 8000, 0}, },
	[KFB_MISSION_DATA_IDX_WQBL]	= {{"state_dispear", 100, 3*18, 1, 8000, 0}, },
}

T_KFB_JOIN_MISSION_DEBUFF = {
	--[idx] = {buff, value, time��, �Ƿ��滻, ID, ״̬����}
	[KFB_MISSION_DATA_IDX_YMG] 	= {},
	[KFB_MISSION_DATA_IDX_DCY2]	= {
--		--���ƶ�ÿ��ٷֱ��������ֵ�˺�
--		{"state_not_move_damage_life_per18",2,60*60*18,1,9000,1},
	},
	[KFB_MISSION_DATA_IDX_DCY1]	= {
		--���ƶ�ÿ��ٷֱ��������ֵ�˺�
--		{"state_not_move_damage_life_per18",2,60*60*18,1,9000,1},
	},
	[KFB_MISSION_DATA_IDX_WQBL]	= {
		--���ƶ�ÿ��ٷֱ��������ֵ�˺�
--		{"state_not_move_damage_life_per18",2,60*60*18,1,9000,1},
	},
}

--����ͨ��MissionV����
-----------------------------�������Ͻ��ⲿImport����и��ǣ�����----------------------------------------
MV_MISSION_STATE	= MV_CUSTOM_BEGIN + 1; --1=�ȴ� 2=ս�� 3=����
MV_BOSS_IDX 		= MV_CUSTOM_BEGIN + 2; --����mission��boss npcIdxͳһ�����IDX��¼

KFB_SZ_MSG_PUBLISH_REAL_BOSS = "V� tr� ch�n th�n Ti�u Nhi�m Nguy�t: %s, bang k�t li�u: %s"
KFB_SZ_MSG_ON_TIME_OUT = "Tuy ch�a di�t ���c T� H� Ph�p Thi�n �m Gi�o, nh�ng c�ng l�m ch�m ti�n tr�nh x�m nh�p c�a Li�u Qu�c. C�c bang h�i c� th� v� server m�nh g�p Qu�n Gia Bang H�i nh�n th��ng."
