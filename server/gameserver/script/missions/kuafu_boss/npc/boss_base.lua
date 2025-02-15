Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\missions\\kuafu_boss\\kfb_data.lua")
Import("\\script\\missions\\kuafu_boss\\kfb_functions.lua")

--Import了对应的mission.lua可直接访问和调用其内部数据和方法
--Import("\\script\\missions\\kuafu_boss\\dacaoyuan1\\mission.lua")


g_nDamage2ScoreRate = 1000  --nScore = nDamage/g_nDamage2ScoreRate


function OnHurt(nNpcIndx, nDamage, nAttackerIdx)
	nAttackerIdx = tonumber(nAttackerIdx) or 0
	local nPlayerIndex = NpcIdx2PIdx(nAttackerIdx)
	if not nPlayerIndex or nPlayerIndex <= 0 then
		return	
	end

	--print(format("======OnHurt nNpcIndx=%d,nDamage=%d,nPlayerIndex=%d ======= ", nNpcIndx, nDamage, nPlayerIndex))
	local oldPlayerIndex = PlayerIndex
	PlayerIndex = nPlayerIndex
	local szTongName = gf_GetRealmTongName()
	kfb_DataAddTongScore(szTongName, nDamage/g_nDamage2ScoreRate )

	PlayerIndex = oldPlayerIndex
end

function OnDeath(nNpcIndx, nSubWorldIndex, nKiller)
	local nMapID = GetWorldPos();

	-- local nOldSubWorld = SubWorld;
	-- SubWorld = SubWorldID2Idx(nMapID);
	-- SubWorld = nOldSubWorld;

	--local nRealMapId = this.realMapID
	local nRealMapId = GetMapTemplate(SubWorldID2Idx(nMapID) )

	--清掉相同missionID所有地图里的boss
	local  tMaps = kfb_GetDynamicMapIds(nRealMapId)
	if tMaps then
		for i=1, getn(tMaps) do
			kfb_RemoveNpcByMV(tMaps[i], MV_BOSS_IDX)
		end
	end

	local szGlobalMsg = format("Chi課 b竜: %s%s t筰 %s ti猽 di謙 %s", gf_GetRealmTongName(), GetName(), GetMapName(nRealMapId), GetNpcName(nNpcIndx))
	Msg2Global(szGlobalMsg)
	--Msg2MSAll(this.missionID, szGlobalMsg));

	--记录真boss最终一击
	if nRealMapId == kfb_DataGetRealBossRealMapId() then
		kfb_DataSetKillerPlayer(GetName())
		kfb_DataSetKillerTong(gf_GetRealmTongName())
		kfb_DataSaveLastHit2SDB() --最终一击帮会与角色存档
		local szTime = date("%Y/%m/%d/%H:%M")
		WriteLog(format("[KfbLog][RealBossKiller][%s] MapID:%d, MapName:%s, PlayerName:%s, TongName:%s",
			szTime, nRealMapId, GetMapName(nRealMapId), GetName(), gf_GetRealmTongName() ))
	end

	--检测关卡是否结束 所有boss都被击杀
	if kfb_CheckAllMissionBossDead() == 1 then
		kfb_SetAllMSPhase2Next() --尝试进入结束阶段
		szGlobalMsg = format("Th祅h vi猲 bang %s ng t﹎ hi謕 l鵦, ti猽 di謙 %s T� H� Ph竝 Thi猲  Gi竜 Ti猽 Nhi詍 Nguy謙, ch苙 ng h祅h ng x﹎ nh藀 c馻 Li猽 Qu鑓! C竎 bang h閕 c� th� v� server m譶h g苝 Qu秐 Gia Bang H閕 nh薾 thng.",
			kfb_DataGetKillerTong() or "", GetMapName(kfb_DataGetRealBossRealMapId()) or "")
		Msg2Global(szGlobalMsg)
		AddGlobalCountNews(szGlobalMsg,1)
		
		Msg2Global(format(KFB_SZ_MSG_PUBLISH_REAL_BOSS, 
			GetMapName(kfb_DataGetRealBossRealMapId()) or "", 
			kfb_DataGetKillerTong() or "Ch璦") )
	end
end