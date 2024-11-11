Import("\\settings\\static_script\\missions\\base\\mission_head.lua")


---------------------ËùÓÐ¸±±¾µÄÅäÖÃÖÐÏàÍ¬µÄ²¿·Ö-----------------------
----------------£¡£¡£¡ÑÏ½ûÍâ²¿Importºó½øÐÐ¸²¸Ç£¡£¡£¡------------------
----------------£¡£¡£¡ÑÏ½ûÍâ²¿Importºó½øÐÐ¸²¸Ç£¡£¡£¡------------------
----------------£¡£¡£¡ÑÏ½ûÍâ²¿Importºó½øÐÐ¸²¸Ç£¡£¡£¡------------------

g_kfbDebug = 0

--¸±±¾Í¨ÓÃÏÞÖÆ
KFB_NEED_REBORN = 9                 --×ªÉúÏÞÖÆ 9×ª
KFB_NEED_LEVEL  = 90                --µÈ¼¶ÏÞÖÆ 90¼¶
--¿ªÆôÊ±¼äÔÚrelayµÄtaskÖÐÉèÖÃ
KFB_RANK_TONG_COUNT = 15			--ÅÅÃûÏÔÊ¾¡¢ÈÕÖ¾¼ÇÂ¼»ý·ÖÇ°nÃûµÄ°ï»á

--¸±±¾Í¨ÓÃÈÎÎñ±äÁ¿
KFB_TSKID_ACTIVE_POINT 				= 3593 --¸öÈË»îÔ¾¶È
KFB_TSKID_ACTIVE_POINT_TYPE_LIMIT	= 3594 --¸÷Í¾¾¶ÒÑ»ñÈ¡µÄ»îÔ¾¶È£¬ÓÃÓÚÉÏÏÞÅÐ¶Ï
KFB_TSKID_ACTIVE_POINT_ADD_CD		= 3595 --¼ÇÂ¼×Ô¶¯¼Ó»îÔ¾µÄÊ±¼ä£¬ÓÃÓÚcdÅÐ¶Ï


--¸±±¾Í¨ÓÃÉè¶¨
T_KFB_COMMON_PHASE_TIME = {
	--[½×¶Î] = ³ÖÐøÊ±¼ä(Ãë)
	[1] = 1, 		--³õÊ¼»¯½×¶Î
	[2] = 5 * 60, 	--µÈ´ý½×¶Î
	[3] = 55 * 60,	--Õ½¶·½×¶Î
	[4] = 5 * 60, 	--½áÊø½×¶Î
}
if g_kfbDebug == 1 then
	T_KFB_COMMON_PHASE_TIME = {
		--[½×¶Î] = ³ÖÐøÊ±¼ä(Ãë)
		[1] = 2, 		--³õÊ¼»¯½×¶Î
		[2] = 10, 		--µÈ´ý½×¶Î
		[3] = 11 * 60,	--Õ½¶·½×¶Î
		[4] = 2 * 60, 	--½áÊø½×¶Î
	}
end
g_TotalPhaseTime = 0
for i=1, getn(T_KFB_COMMON_PHASE_TIME) do
	g_TotalPhaseTime = g_TotalPhaseTime + tonumber(T_KFB_COMMON_PHASE_TIME[i])
end

KFB_COMMON_PHASE_CREATE_BOSS_TIME		= 5*60 --Õ½¶·½×¶Î´´½¨bossµÄÊ±¼ä
if g_kfbDebug == 1 then
	KFB_COMMON_PHASE_CREATE_BOSS_TIME 	= 10
end
KFB_COMMON_PHASE_COUNT_DOWN_START_TIME	= T_KFB_COMMON_PHASE_TIME[3] - 10*60 --Õ½¶·½×¶Î½áÊøµ¹¼ÆÊ±¿ªÊ¼Ê±¼ä

KFB_COMMON_PLAYER_CAMP 		= 0		-- Íæ¼ÒÄ¬ÈÏÕóÓª
KFB_ADD_ACTIVE_POINT_ADD_CD = 30	-- boss¸½½ü¼Ó»îÔ¾Ê±¼ä¼ä¸ô
if g_kfbDebug == 1 then
	KFB_ADD_ACTIVE_POINT_ADD_CD = 3	-- µ÷ÊÔÄ£Ê½ boss¸½½ü¼Ó»îÔ¾Ê±¼ä¼ä¸ô
end
KFB_ADD_ACTIVE_POINT_RADIUS = 360	-- boss¸½½ü¼Ó»îÔ¾µÄ·¶Î§°ë¾¶

KFB_MAX_KICK_PlAYER_COUNT   = 10	-- ½áÊøºó×Ô¶¯ÌßÈËÃ¿´ÎÌßµÄÈËÊý

KFB_ACTIVITY_TYPE_KILLPLAYER = 1    -- »÷É±Íæ¼Ò
KFB_ACTIVITY_TYPE_PLAYERDEAD = 2    -- ×ÔÉíËÀÍö
KFB_ACTIVITY_TYPE_CLOSE_BOSS = 3    -- boss»òÂí³µ¸½½ü¶¨Ê±¼Ó»îÔ¾
T_KFB_ACTIVITYINFO = {
    --                              { µ¥´Î»ñµÃ, ¸ÃÍ¾¾¶×î´óÖµ, ±£´æµ±Ç°Í¨¹ý¸ÃÍ¾¾¶»ñÈ¡µÃÖµ£¬ ±äÁ¿´æ´¢Î»[l-r] }
    [KFB_ACTIVITY_TYPE_KILLPLAYER] = {value = 2, max = 20,  taskid = KFB_TSKID_ACTIVE_POINT_TYPE_LIMIT,  lbit = 1,   rbit = 8,   msg="Ngµi ®· ®¸nh b¹i kÎ ®Þch"},
    [KFB_ACTIVITY_TYPE_PLAYERDEAD] = {value = 1, max = 10,  taskid = KFB_TSKID_ACTIVE_POINT_TYPE_LIMIT,  lbit = 9,   rbit = 16,  msg="Ngµi chiÕn ®Êu hÕt m×nh, kiÖt søc n»m nghØ"},
    [KFB_ACTIVITY_TYPE_CLOSE_BOSS] = {value = 1, max = nil, taskid = nil,   lbit = nil, rbit = nil, msg="TÝch cùc tham dù chiÕn ®Êu"},
}
T_KFB_ACTIVITY_ROUTE_MULTIPLE = {
	[8]	 = 2, --¶ëÃ¼·ð¼Ò
	[21] = 2, --Îå¶¾¹ÆÊ¦
} 

KFB_MISSION_DATA_IDX_YMG 	= 1
KFB_MISSION_DATA_IDX_DCY2 	= 2
KFB_MISSION_DATA_IDX_DCY1 	= 3
KFB_MISSION_DATA_IDX_WQBL 	= 4
T_KFB_MISSION_CONFIG	= {
--	[KFB_MISSION_DATA_IDX_YMG] = {MSID,RealMapId,MaxMapNum,MaxPlayerNum/map,IsDynamic,MSName,thisfile,	timerID, [9]=MaxTongMemberCount},
	--ÑãÃÅ¹Ø×÷Îª¸´»î³¡µØ,±ØÐëÂú×ã [MaxMapNum]*[MaxPlayerNum/map] ¡Ý ËùÓÐÕ½¶·µØÍ¼ÈËÊýÉÏÏÞÖ®ºÍ
	[KFB_MISSION_DATA_IDX_YMG] 	= {96, 8916, 6, 200, 1, "Nh¹n M«n quan",			"\\script\\missions\\kuafu_boss\\yanmenguan\\mission.lua",	130, nil,},
	[KFB_MISSION_DATA_IDX_DCY2]	= {93, 8923, 2, 200, 1, "ChiÕn BOSS Bang (PVE)",	"\\script\\missions\\kuafu_boss\\dacaoyuan2\\mission.lua",	127, nil,},
	[KFB_MISSION_DATA_IDX_DCY1]	= {94, 8921, 1, 400, 1, "ChiÕn BOSS Bang (PVP 1)",	"\\script\\missions\\kuafu_boss\\dacaoyuan1\\mission.lua",	128, 50, },
	[KFB_MISSION_DATA_IDX_WQBL]	= {95, 8922, 1, 400, 1, "ChiÕn BOSS Bang (PVP 2)",	"\\script\\missions\\kuafu_boss\\wangqibuluo\\mission.lua",	129, 50, },
}
if g_kfbDebug == 1 then
	T_KFB_MISSION_CONFIG	= {
	--	[KFB_MISSION_DATA_IDX_YMG] = {MSID,RealMapId,MaxMapNum,MaxPlayerNum/map,IsDynamic,MSName,thisfile,timerID},
		--ÑãÃÅ¹Ø×÷Îª¸´»î³¡µØ,±ØÐëÂú×ã [MaxMapNum]*[MaxPlayerNum/map] ¡Ý ËùÓÐÕ½¶·µØÍ¼ÈËÊýÉÏÏÞÖ®ºÍ
		[KFB_MISSION_DATA_IDX_YMG] 	= {96, 8916, 2, 1, 1, "Nh¹n M«n quan",			"\\script\\missions\\kuafu_boss\\yanmenguan\\mission.lua",		130, 1},
		[KFB_MISSION_DATA_IDX_DCY2]	= {93, 8923, 2, 1, 1, "ChiÕn BOSS Bang (PVE)",	"\\script\\missions\\kuafu_boss\\dacaoyuan2\\mission.lua",		127, 1},
		[KFB_MISSION_DATA_IDX_DCY1]	= {94, 8921, 1, 2, 1, "ChiÕn BOSS Bang (PVP 1)",	"\\script\\missions\\kuafu_boss\\dacaoyuan1\\mission.lua",	128, 1},
		[KFB_MISSION_DATA_IDX_WQBL]	= {95, 8922, 1, 2, 1, "ChiÕn BOSS Bang (PVP 2)",	"\\script\\missions\\kuafu_boss\\wangqibuluo\\mission.lua",	129, 1},
	}
end
KFB_ALL_MAPS_MAX_PLAYER		= T_KFB_MISSION_CONFIG[KFB_MISSION_DATA_IDX_YMG][4] * T_KFB_MISSION_CONFIG[KFB_MISSION_DATA_IDX_YMG][3]

T_KFB_JOIN_MISSION_BUFF = {
	--{buff, value, timeÖ¡, ÊÇ·ñÌæ»», ID, ×´Ì¬ÀàÐÍ}
	[KFB_MISSION_DATA_IDX_YMG] 	= {{"state_dispear", 100, 3*18, 1, 8000, 0}, },
	[KFB_MISSION_DATA_IDX_DCY2]	= {{"state_dispear", 100, 3*18, 1, 8000, 0}, },
	[KFB_MISSION_DATA_IDX_DCY1]	= {{"state_dispear", 100, 3*18, 1, 8000, 0}, },
	[KFB_MISSION_DATA_IDX_WQBL]	= {{"state_dispear", 100, 3*18, 1, 8000, 0}, },
}

T_KFB_JOIN_MISSION_DEBUFF = {
	--[idx] = {buff, value, timeÃë, ÊÇ·ñÌæ»», ID, ×´Ì¬ÀàÐÍ}
	[KFB_MISSION_DATA_IDX_YMG] 	= {},
	[KFB_MISSION_DATA_IDX_DCY2]	= {
--		--²»ÒÆ¶¯Ã¿Ãë°Ù·Ö±È×î´óÉúÃüÖµÉËº¦
--		{"state_not_move_damage_life_per18",2,60*60*18,1,9000,1},
	},
	[KFB_MISSION_DATA_IDX_DCY1]	= {
		--²»ÒÆ¶¯Ã¿Ãë°Ù·Ö±È×î´óÉúÃüÖµÉËº¦
--		{"state_not_move_damage_life_per18",2,60*60*18,1,9000,1},
	},
	[KFB_MISSION_DATA_IDX_WQBL]	= {
		--²»ÒÆ¶¯Ã¿Ãë°Ù·Ö±È×î´óÉúÃüÖµÉËº¦
--		{"state_not_move_damage_life_per18",2,60*60*18,1,9000,1},
	},
}

--¸±±¾Í¨ÓÃMissionVÅäÖÃ
-----------------------------£¡£¡£¡ÑÏ½ûÍâ²¿Importºó½øÐÐ¸²¸Ç£¡£¡£¡----------------------------------------
MV_MISSION_STATE	= MV_CUSTOM_BEGIN + 1; --1=µÈ´ý 2=Õ½¶· 3=½áÊø
MV_BOSS_IDX 		= MV_CUSTOM_BEGIN + 2; --ËùÓÐmissionµÄboss npcIdxÍ³Ò»ÓÃÕâ¸öIDX¼ÇÂ¼

KFB_SZ_MSG_PUBLISH_REAL_BOSS = "VÞ trÝ ch©n th©n Tiªu NhiÔm NguyÖt: %s, bang kÕt liÔu: %s"
KFB_SZ_MSG_ON_TIME_OUT = "Tuy ch­a diÖt ®­îc T¶ Hé Ph¸p Thiªn ¢m Gi¸o, nh­ng còng lµm chËm tiÕn tr×nh x©m nhËp cña Liªu Quèc. C¸c bang héi cã thÓ vÒ server m×nh gÆp Qu¶n Gia Bang Héi nhËn th­ëng."
