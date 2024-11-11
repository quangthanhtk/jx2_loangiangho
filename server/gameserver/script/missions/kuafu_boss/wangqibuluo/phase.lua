Include("\\script\\missions\\kuafu_boss\\common_phase.lua")

Import("\\script\\missions\\kuafu_boss\\wangqibuluo\\mission_head.lua")

-- function phase_kfb_fighting:onTimeout()
-- 	local nMapId = this.msPosition:getMapID()
-- 	if kfb_CheckAllMissionBossDead() ~= 1 then
-- 		Msg2MSAll(this.missionID, format(KFB_SZ_MSG_PUBLISH_REAL_BOSS, 
-- 			GetMapName(kfb_DataGetRealBossRealMapId()) or "", 
-- 			kfb_DataGetKillerTong() or "无") )
-- 		Msg2MSAll(this.missionID, format(KFB_SZ_MSG_ON_TIME_OUT) )
-- 	end
-- 	kfb_removeNpc(nMapId)
-- 	phase_kfb_fighting.sync_rank(1) --战斗阶段结束时必须要同步一次 1:log
-- 	kfb_RemoveJoinMisisonDeBuff(KFB_MS_TYPE)

-- 	kfb_DataSetCurMSState(KFB_MS_CLOSE) --总控制设为关闭
-- 	kfb_DataSave2SDB() --帮会积分存档

--	onFightingTimeout()
-- 	self:onFinish()
-- end

function onFightingTimeout()
	kfb_DataAddRuntimeState()
end