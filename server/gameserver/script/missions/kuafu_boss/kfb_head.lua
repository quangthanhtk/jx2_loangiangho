Import("\\settings\\static_script\\missions\\base\\mission_head.lua")


---------------------所有副本的配置中相同的部分-----------------------
----------------！！！严禁外部Import后进行覆盖！！！------------------
----------------！！！严禁外部Import后进行覆盖！！！------------------
----------------！！！严禁外部Import后进行覆盖！！！------------------

g_kfbDebug = 0

--副本通用限制
KFB_NEED_REBORN = 9                 --转生限制 9转
KFB_NEED_LEVEL  = 90                --等级限制 90级
--开启时间在relay的task中设置
KFB_RANK_TONG_COUNT = 15			--排名显示、日志记录积分前n名的帮会

--副本通用任务变量
KFB_TSKID_ACTIVE_POINT 				= 3593 --个人活跃度
KFB_TSKID_ACTIVE_POINT_TYPE_LIMIT	= 3594 --各途径已获取的活跃度，用于上限判断
KFB_TSKID_ACTIVE_POINT_ADD_CD		= 3595 --记录自动加活跃的时间，用于cd判断


--副本通用设定
T_KFB_COMMON_PHASE_TIME = {
	--[阶段] = 持续时间(秒)
	[1] = 1, 		--初始化阶段
	[2] = 5 * 60, 	--等待阶段
	[3] = 55 * 60,	--战斗阶段
	[4] = 5 * 60, 	--结束阶段
}
if g_kfbDebug == 1 then
	T_KFB_COMMON_PHASE_TIME = {
		--[阶段] = 持续时间(秒)
		[1] = 2, 		--初始化阶段
		[2] = 10, 		--等待阶段
		[3] = 11 * 60,	--战斗阶段
		[4] = 2 * 60, 	--结束阶段
	}
end
g_TotalPhaseTime = 0
for i=1, getn(T_KFB_COMMON_PHASE_TIME) do
	g_TotalPhaseTime = g_TotalPhaseTime + tonumber(T_KFB_COMMON_PHASE_TIME[i])
end

KFB_COMMON_PHASE_CREATE_BOSS_TIME		= 5*60 --战斗阶段创建boss的时间
if g_kfbDebug == 1 then
	KFB_COMMON_PHASE_CREATE_BOSS_TIME 	= 10
end
KFB_COMMON_PHASE_COUNT_DOWN_START_TIME	= T_KFB_COMMON_PHASE_TIME[3] - 10*60 --战斗阶段结束倒计时开始时间

KFB_COMMON_PLAYER_CAMP 		= 0		-- 玩家默认阵营
KFB_ADD_ACTIVE_POINT_ADD_CD = 30	-- boss附近加活跃时间间隔
if g_kfbDebug == 1 then
	KFB_ADD_ACTIVE_POINT_ADD_CD = 3	-- 调试模式 boss附近加活跃时间间隔
end
KFB_ADD_ACTIVE_POINT_RADIUS = 360	-- boss附近加活跃的范围半径

KFB_MAX_KICK_PlAYER_COUNT   = 10	-- 结束后自动踢人每次踢的人数

KFB_ACTIVITY_TYPE_KILLPLAYER = 1    -- 击杀玩家
KFB_ACTIVITY_TYPE_PLAYERDEAD = 2    -- 自身死亡
KFB_ACTIVITY_TYPE_CLOSE_BOSS = 3    -- boss或马车附近定时加活跃
T_KFB_ACTIVITYINFO = {
    --                              { 单次获得, 该途径最大值, 保存当前通过该途径获取得值， 变量存储位[l-r] }
    [KFB_ACTIVITY_TYPE_KILLPLAYER] = {value = 2, max = 20,  taskid = KFB_TSKID_ACTIVE_POINT_TYPE_LIMIT,  lbit = 1,   rbit = 8,   msg="Ng礽  nh b筰 k� ch"},
    [KFB_ACTIVITY_TYPE_PLAYERDEAD] = {value = 1, max = 10,  taskid = KFB_TSKID_ACTIVE_POINT_TYPE_LIMIT,  lbit = 9,   rbit = 16,  msg="Ng礽 chi課 u h誸 m譶h, ki謙 s鴆 n籱 ngh�"},
    [KFB_ACTIVITY_TYPE_CLOSE_BOSS] = {value = 1, max = nil, taskid = nil,   lbit = nil, rbit = nil, msg="T輈h c鵦 tham d� chi課 u"},
}
T_KFB_ACTIVITY_ROUTE_MULTIPLE = {
	[8]	 = 2, --峨眉佛家
	[21] = 2, --五毒蛊师
} 

KFB_MISSION_DATA_IDX_YMG 	= 1
KFB_MISSION_DATA_IDX_DCY2 	= 2
KFB_MISSION_DATA_IDX_DCY1 	= 3
KFB_MISSION_DATA_IDX_WQBL 	= 4
T_KFB_MISSION_CONFIG	= {
--	[KFB_MISSION_DATA_IDX_YMG] = {MSID,RealMapId,MaxMapNum,MaxPlayerNum/map,IsDynamic,MSName,thisfile,	timerID, [9]=MaxTongMemberCount},
	--雁门关作为复活场地,必须满足 [MaxMapNum]*[MaxPlayerNum/map] ≥ 所有战斗地图人数上限之和
	[KFB_MISSION_DATA_IDX_YMG] 	= {96, 8916, 6, 200, 1, "Nh筺 M玭 quan",			"\\script\\missions\\kuafu_boss\\yanmenguan\\mission.lua",	130, nil,},
	[KFB_MISSION_DATA_IDX_DCY2]	= {93, 8923, 2, 200, 1, "Chi課 BOSS Bang (PVE)",	"\\script\\missions\\kuafu_boss\\dacaoyuan2\\mission.lua",	127, nil,},
	[KFB_MISSION_DATA_IDX_DCY1]	= {94, 8921, 1, 400, 1, "Chi課 BOSS Bang (PVP 1)",	"\\script\\missions\\kuafu_boss\\dacaoyuan1\\mission.lua",	128, 50, },
	[KFB_MISSION_DATA_IDX_WQBL]	= {95, 8922, 1, 400, 1, "Chi課 BOSS Bang (PVP 2)",	"\\script\\missions\\kuafu_boss\\wangqibuluo\\mission.lua",	129, 50, },
}
if g_kfbDebug == 1 then
	T_KFB_MISSION_CONFIG	= {
	--	[KFB_MISSION_DATA_IDX_YMG] = {MSID,RealMapId,MaxMapNum,MaxPlayerNum/map,IsDynamic,MSName,thisfile,timerID},
		--雁门关作为复活场地,必须满足 [MaxMapNum]*[MaxPlayerNum/map] ≥ 所有战斗地图人数上限之和
		[KFB_MISSION_DATA_IDX_YMG] 	= {96, 8916, 2, 1, 1, "Nh筺 M玭 quan",			"\\script\\missions\\kuafu_boss\\yanmenguan\\mission.lua",		130, 1},
		[KFB_MISSION_DATA_IDX_DCY2]	= {93, 8923, 2, 1, 1, "Chi課 BOSS Bang (PVE)",	"\\script\\missions\\kuafu_boss\\dacaoyuan2\\mission.lua",		127, 1},
		[KFB_MISSION_DATA_IDX_DCY1]	= {94, 8921, 1, 2, 1, "Chi課 BOSS Bang (PVP 1)",	"\\script\\missions\\kuafu_boss\\dacaoyuan1\\mission.lua",	128, 1},
		[KFB_MISSION_DATA_IDX_WQBL]	= {95, 8922, 1, 2, 1, "Chi課 BOSS Bang (PVP 2)",	"\\script\\missions\\kuafu_boss\\wangqibuluo\\mission.lua",	129, 1},
	}
end
KFB_ALL_MAPS_MAX_PLAYER		= T_KFB_MISSION_CONFIG[KFB_MISSION_DATA_IDX_YMG][4] * T_KFB_MISSION_CONFIG[KFB_MISSION_DATA_IDX_YMG][3]

T_KFB_JOIN_MISSION_BUFF = {
	--{buff, value, time帧, 是否替换, ID, 状态类型}
	[KFB_MISSION_DATA_IDX_YMG] 	= {{"state_dispear", 100, 3*18, 1, 8000, 0}, },
	[KFB_MISSION_DATA_IDX_DCY2]	= {{"state_dispear", 100, 3*18, 1, 8000, 0}, },
	[KFB_MISSION_DATA_IDX_DCY1]	= {{"state_dispear", 100, 3*18, 1, 8000, 0}, },
	[KFB_MISSION_DATA_IDX_WQBL]	= {{"state_dispear", 100, 3*18, 1, 8000, 0}, },
}

T_KFB_JOIN_MISSION_DEBUFF = {
	--[idx] = {buff, value, time秒, 是否替换, ID, 状态类型}
	[KFB_MISSION_DATA_IDX_YMG] 	= {},
	[KFB_MISSION_DATA_IDX_DCY2]	= {
--		--不移动每秒百分比最大生命值伤害
--		{"state_not_move_damage_life_per18",2,60*60*18,1,9000,1},
	},
	[KFB_MISSION_DATA_IDX_DCY1]	= {
		--不移动每秒百分比最大生命值伤害
--		{"state_not_move_damage_life_per18",2,60*60*18,1,9000,1},
	},
	[KFB_MISSION_DATA_IDX_WQBL]	= {
		--不移动每秒百分比最大生命值伤害
--		{"state_not_move_damage_life_per18",2,60*60*18,1,9000,1},
	},
}

--副本通用MissionV配置
-----------------------------！！！严禁外部Import后进行覆盖！！！----------------------------------------
MV_MISSION_STATE	= MV_CUSTOM_BEGIN + 1; --1=等待 2=战斗 3=结束
MV_BOSS_IDX 		= MV_CUSTOM_BEGIN + 2; --所有mission的boss npcIdx统一用这个IDX记录

KFB_SZ_MSG_PUBLISH_REAL_BOSS = "V� tr� ch﹏ th﹏ Ti猽 Nhi詍 Nguy謙: %s, bang k誸 li評: %s"
KFB_SZ_MSG_ON_TIME_OUT = "Tuy ch璦 di謙 頲 T� H� Ph竝 Thi猲  Gi竜, nh璶g c騨g l祄 ch薽 ti課 tr譶h x﹎ nh藀 c馻 Li猽 Qu鑓. C竎 bang h閕 c� th� v� server m譶h g苝 Qu秐 Gia Bang H閕 nh薾 thng."
