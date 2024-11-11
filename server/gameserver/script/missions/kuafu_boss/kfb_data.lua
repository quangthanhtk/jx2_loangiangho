Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\missions\\kuafu_boss\\kfb_head.lua")
Import("\\script\\missions\\kuafu_boss\\bossfight_head.lua")
-------------------------
--公用动态数据临时存储
--Import此脚本以实现数据同步读写
--!!! Include不行 !!!
-------------------------

g_tKfbDynamicTongScores = {
	-- [帮会名] = {
	-- 		[1]=总积分, 
	-- 		[2]=是否最后一击帮会(0/1)
	-- }
}

g_tkfbRealBossKiller = {
	--[1]=角色的帮会名,
	--[2]=角色名,
	--[3]=真boss所在原地图id
}

KFB_MS_UNOPEN	= 0
KFB_MS_PREPARE	= 1
KFB_MS_FIGHTING	= 2
KFB_MS_CLOSE	= 3

g_tkfbCurMSState = {
	[1] = KFB_MS_UNOPEN, --记录所有副本总控制状态
}

g_tkfbTongMemberCountInMS = {
	-- [MisisonType] = {
	-- 	[TongName1] = Count1,
	-- 	[TongName2] = Count2,
	-- }
}

--各副本刷新到真boss的概率 只有1个真boss
T_KFB_REAL_BOSS_PROBABILITY = {
	--[1] = {mission配置索引, 概率系数},
	[1] = {KFB_MISSION_DATA_IDX_DCY2, 1000}, 
	[2] = {KFB_MISSION_DATA_IDX_DCY1, 4000}, 
	[3] = {KFB_MISSION_DATA_IDX_WQBL, 5000}, 
}

function kfb_DataSave2SDB()
	if g_kfbDebug == 1 then
		print("\n=====kfb_DataSave2SDB()=====")
		gf_PrintTable(g_tKfbDynamicTongScores)
	end
	 --帮会积分存档
	SetBattleData2Sdb(g_tKfbDynamicTongScores)
end

function kfb_DataSaveLastHit2SDB()
	SetLastHitData2Sdb() --最终一击帮会与角色存档
end

function kfb_DataAddRuntimeState()
	local nTongCount = 0
	for k, v in g_tKfbDynamicTongScores do
		nTongCount = nTongCount + 1
	end
	
	AddRuntimeStat(101, 1, 0, nTongCount); --埋点
end

function kfb_DataCheckTongMemberFull(nMSType, szTongName)
	if not T_KFB_MISSION_CONFIG[nMSType] then
		return 0
	end

	local nMax = T_KFB_MISSION_CONFIG[nMSType][9]
	if not nMax then
		return 0
	end

	local nCur = kfb_DataGetTongMemberCountInMs(nMSType, szTongName)
	
	return nCur >= nMax and 1 or 0
end

function kfb_DataGetTongMemberCountInMs(nMSType, szTongName)
	if not szTongName or szTongName == "" then
		return 0
	end
	if not g_tkfbTongMemberCountInMS then
		g_tkfbTongMemberCountInMS = {}
	end
	if not g_tkfbTongMemberCountInMS[nMSType] then
		g_tkfbTongMemberCountInMS[nMSType] = {}
	end

	return g_tkfbTongMemberCountInMS[nMSType][szTongName] or 0
end

function kfb_DataModifyTongMemberCountInMs(nMSType, szTongName, nAdd)
	if not szTongName or szTongName == "" then
		return 0
	end
	if not g_tkfbTongMemberCountInMS then
		g_tkfbTongMemberCountInMS = {}
	end
	if not g_tkfbTongMemberCountInMS[nMSType] then
		g_tkfbTongMemberCountInMS[nMSType] = {}
	end

	g_tkfbTongMemberCountInMS[nMSType][szTongName] = (g_tkfbTongMemberCountInMS[nMSType][szTongName] or 0) + nAdd
	return 1
end

function kfb_DataGetCurMSState()
	if g_kfbDebug == 1 then
		print(format("=====kfb_DataGetCurMSState() nRet=%d =====", g_tkfbCurMSState and g_tkfbCurMSState[1] or KFB_MS_UNOPEN or 0))
	end
	return g_tkfbCurMSState and g_tkfbCurMSState[1] or KFB_MS_UNOPEN
end

function kfb_DataSetCurMSState(nState)
	if g_kfbDebug == 1 then
		print(format("=======kfb_DataSetCurMSState(nState=%d)========", nState))
	end
	if not g_tkfbCurMSState then
		g_tkfbCurMSState = {}
	end
	g_tkfbCurMSState[1] = nState
	
	return 1
end

function kfb_DataAddTongScore(szTongName, nScore)
	-- if g_kfbDebug == 1 then
	-- 	print(format("====kfb_DataAddTongScore(szTongName=%s, nScore=%f)====",szTongName, nScore))
	-- end

	if not szTongName or szTongName == "" or not nScore then
		return
	end

	if not g_tKfbDynamicTongScores then
		g_tKfbDynamicTongScores = {}
	end

	if not g_tKfbDynamicTongScores[szTongName] then
		g_tKfbDynamicTongScores[szTongName] = {}
	end

	g_tKfbDynamicTongScores[szTongName][1] = tonumber(format("%0.3f",
			(g_tKfbDynamicTongScores[szTongName][1] or 0) + nScore ))

	--print(format("======kfb_DataAddTongScore() szTongName=%s, nScore=%0.3f, nTotal=%0.3f =======",
	--		szTongName, nScore, g_tKfbDynamicTongScores[szTongName][1]) )

	return 1
end

function kfb_DataGetTongScore(szTongName)
	if not szTongName or szTongName == "" then
		return 0
	end
	if not g_tKfbDynamicTongScores[szTongName] then
		return 0
	end

	return g_tKfbDynamicTongScores[szTongName][1] or 0
end

function kfb_DataClear()
	for k,v in g_tKfbDynamicTongScores do
		g_tKfbDynamicTongScores[k] = nil
	end

	for k,v in g_tkfbRealBossKiller do
		g_tkfbRealBossKiller[k] = nil
	end

	for k,v in g_tkfbTongMemberCountInMS do
		g_tkfbTongMemberCountInMS[k] = nil
	end

	g_tkfbCurMSState[1] = KFB_MS_UNOPEN --记录所有副本总控制状态

	SdbClear() --清跨服帮会积分sdb存档
end

function kfb_DataSetKillerPlayer(szPlayerName)
	if not szPlayerName then
		return
	end

	if not g_tkfbRealBossKiller then
		g_tkfbRealBossKiller = {}
	end

	g_tkfbRealBossKiller[2] = szPlayerName
	return 1
end

function kfb_DataSetKillerTong(szTongName)
	if not szTongName or szTongName =="" then
		return
	end

	if not g_tkfbRealBossKiller then
		g_tkfbRealBossKiller = {}
	end

	g_tkfbRealBossKiller[1] = szTongName

	if not g_tKfbDynamicTongScores[szTongName] then
		g_tKfbDynamicTongScores[szTongName] = {}
	end
	g_tKfbDynamicTongScores[szTongName][2] = 1

	return 1
end

function kfb_DataGetKillerTong()
	if not g_tkfbRealBossKiller then
		return
	end

	return g_tkfbRealBossKiller[1]
end

function kfb_DataGetKillerPlayer()
	if not g_tkfbRealBossKiller then
		return
	end

	return g_tkfbRealBossKiller[2]
end

function kfb_DataGetRealBossRealMapId()
	if not g_tkfbRealBossKiller then
		g_tkfbRealBossKiller = {}
	end
	if not g_tkfbRealBossKiller[3] or g_tkfbRealBossKiller[3] == 0 then
		local nIdx = gf_RandomSelected(T_KFB_REAL_BOSS_PROBABILITY, 2)
		if not nIdx or nIdx <= 0 then
			return 0
		end
		local nConfigIdx = T_KFB_REAL_BOSS_PROBABILITY[nIdx][1]
		g_tkfbRealBossKiller[3] = T_KFB_MISSION_CONFIG[nConfigIdx][2]
		local szTime = date("%Y/%m/%d/%H:%M")
		WriteLog(format("[KfbLog][RealBossMap][%s]  MapID:%d  MapName:%s",szTime, g_tkfbRealBossKiller[3] or 0, GetMapName(g_tkfbRealBossKiller[3]) or "") )
	end

	if g_kfbDebug == 1 then
		print(format("=== RealBoss Map is %s nMapId=%d ===",
			GetMapName(g_tkfbRealBossKiller[3]), g_tkfbRealBossKiller[3] ))
	end
	return g_tkfbRealBossKiller[3]
end