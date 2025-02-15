Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Import("\\script\\lib\\missionfunctions.lua")
Import("\\script\\lib\\define.lua")
Import("\\script\\missions\\kuafu_boss\\kfb_head.lua")
Import("\\script\\missions\\kuafu_boss\\kfb_data.lua")

-- BOSS_SCRIPT = "\\script\\missions\\kuafu_boss\\wangqibuluo\\npc\\boss.lua"


-- --入场位置
-- ENTER_POS = { {{1458,3176},{1411,3047},{1362,3002},}} --随机

--默认离场位置
--跨服
EXIT_POS  = {
	{8899, 1310, 2693},
	{8899, 1405, 2800},
	{8899, 1490, 2743},
	{8899, 1366, 2608},
}
-- g_nVersion, g_nCurGs = GetRealmType()
-- if g_nCurGs == 0 then
-- 	--原服
-- 	EXIT_POS  = {{300,1744,3554},}
-- end


-- --虚拟临时复活点，是个不可到达的点，用于强行进入onPlayerRevive
-- VIRTUAL_REVIVE_POS = {1594, 3117}

-- KFB_MS_TYPE = KFB_MISSION_DATA_IDX_WQBL
-- KFB_MS_TIMER_ID = T_KFB_MISSION_CONFIG[KFB_MS_TYPE][8] --计时器ID

-- thisFile = T_KFB_MISSION_CONFIG[KFB_MS_TYPE][7]	--thisFile

-- KFB_PK_FLAG = 3 --PK状态

---------------------------！！！已在公共头kfb_head.lua中定义！！！--------------------------------------
-----------------------------！！！严禁外部Import后进行覆盖！！！----------------------------------------
----大草原1、大草原2、王旗部落这3个副本的这些配置须保持一致
-- MV_MISSION_STATE			= MV_CUSTOM_BEGIN + 1; --0=初始化 1=等待 2=战斗 3=结束
-- MV_BOSS_IDX     			= MV_CUSTOM_BEGIN + 2; --boss npcIdx
------------------------------------------------------------------------------------------------------


--用kfb_head.lua中的通用配置初始化
Mission_Kfb = {
	-- missionID 	= T_KFB_MISSION_CONFIG[KFB_MS_TYPE][1],
	-- realMapID 	= T_KFB_MISSION_CONFIG[KFB_MS_TYPE][2],
	-- dynamicMap 	= T_KFB_MISSION_CONFIG[KFB_MS_TYPE][5],
	-- name 		= T_KFB_MISSION_CONFIG[KFB_MS_TYPE][6],
}

--Mission_Kfb = inherit(missionHead, Mission_Kfb)

function kfb_createMission()
	local nMapID, nMapIdx = Mission_Kfb:Create()
	SetDynamicMapFreeTime(nMapID, g_TotalPhaseTime); --设置动态地图自动回收时间
	return nMapID, nMapIdx
end

function kfb_enterMission(nMapID, nCamp)
	Mission_Kfb:Enter(nMapID, nCamp)
	return 1;
end

--动态地图传nMap
function kfb_createNpc(nMap)
	if not nMap or nMap <= 0 then
		return
	end

--	_createMultiNpc(T_KFB_NPC_INFO_BOSS, nMap) --移到phase里创建了
	_createMultiNpc(T_KFB_NPC_INFO_HORSE_CAR, nMap)
	_createMultiNpc(T_KFB_NPC_INFO_CARTER, nMap)
end

function _createMultiNpc(tNpcInfos, nMap)
	if not tNpcInfos or getn(tNpcInfos) < 1 then
		return
	end
	for i=1, getn(tNpcInfos) do
		local tInfo = tNpcInfos[i]
		local tPos = tInfo[3]
		if type(tInfo[3][1]) == "table" then
			--随机位置
			tPos = tInfo[3][random(1, getn(tInfo[3]))]
		end
		local nNpcIdx = CreateNpc(tInfo[2], tInfo[1], nMap, tPos[1], tPos[2])
		if tInfo[4] then
			SetMissionV(tInfo[4], nNpcIdx)
			--mf_SetMissionV(Mission_Kfb.missionID, tInfo[4], nNpcIdx, nMap)
		end
		if tInfo[5] then
			SetNpcScript(nNpcIdx, tInfo[5])
			SetNpcHurtScript(nNpcIdx, tInfo[5])
		end

		if g_kfbDebug == 1 then
			if tNpcInfos == T_KFB_NPC_INFO_BOSS then
				local nRealMapId = GetMapTemplate(SubWorldID2Idx(nMap) )
				print(format("Th竚 t� b竜 tin ph竧 hi謓 %s v� th� th﹏ xu蕋 hi謓 t筰 %s, c竎 v� hi謕 s� h穣 n ti猽 di謙!",
					tInfo[1], GetMapName(nRealMapId)))
			end
		end
	end
end
--动态地图传nMap
function kfb_removeNpc(nMap)
	if not nMap or nMap <= 0 then
		return
	end
	_removeMultiNpc(T_KFB_NPC_INFO_BOSS, nMap)
	_removeMultiNpc(T_KFB_NPC_INFO_HORSE_CAR, nMap)
end

function _removeMultiNpc(tNpcInfos, nMap)
	if not tNpcInfos or getn(tNpcInfos) < 1 then
		return
	end
	for i=1, getn(tNpcInfos) do
		local tInfo = tNpcInfos[i]
		if tInfo[4] then
			 local nNpcIdx = GetMissionV(tInfo[4])
			 if nNpcIdx and nNpcIdx > 0 then
			 	RemoveNpc(nNpcIdx)
				SetMissionV(tInfo[4], 0)
			 end
		end
	end
end

T_KFB_BOSS_POS = {
	-- {1390,2907},
	-- {1542,2906},
	-- {1547,3026},
	-- {1499,3137},
}

T_KFB_NPC_INFO_BOSS = {
--	{"萧冉月",	"kfboss_xiaoranyue", T_KFB_BOSS_POS, MV_BOSS_IDX, BOSS_SCRIPT},
}

T_KFB_NPC_INFO_HORSE_CAR = {
--
}

T_KFB_NPC_INFO_CARTER = {
--	{"传送NPC",	"kfboss_chefu", {1353,3197}, nil, "\\script\\missions\\kuafu_boss\\wangqibuluo\\npc\\carter1.lua"},
}	

if g_kfbDebug == 1 then
	T_KFB_NPC_INFO_BOSS = {
--		{"萧冉月",	"黑长老萧冉月", T_KFB_BOSS_POS, MV_BOSS_IDX, BOSS_SCRIPT},
	}

	T_KFB_NPC_INFO_HORSE_CAR = {
--	
	}
	
end