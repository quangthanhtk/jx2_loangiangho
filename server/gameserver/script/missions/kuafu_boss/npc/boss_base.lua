Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\missions\\kuafu_boss\\kfb_data.lua")
Import("\\script\\missions\\kuafu_boss\\kfb_functions.lua")

--ImportÁË¶ÔÓ¦µÄmission.lua¿ÉÖ±½Ó·ÃÎÊºÍµ÷ÓÃÆäÄÚ²¿Êý¾ÝºÍ·½·¨
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

	--ÇåµôÏàÍ¬missionIDËùÓÐµØÍ¼ÀïµÄboss
	local  tMaps = kfb_GetDynamicMapIds(nRealMapId)
	if tMaps then
		for i=1, getn(tMaps) do
			kfb_RemoveNpcByMV(tMaps[i], MV_BOSS_IDX)
		end
	end

	local szGlobalMsg = format("ChiÕn b¸o: %s%s t¹i %s tiªu diÖt %s", gf_GetRealmTongName(), GetName(), GetMapName(nRealMapId), GetNpcName(nNpcIndx))
	Msg2Global(szGlobalMsg)
	--Msg2MSAll(this.missionID, szGlobalMsg));

	--¼ÇÂ¼Õæboss×îÖÕÒ»»÷
	if nRealMapId == kfb_DataGetRealBossRealMapId() then
		kfb_DataSetKillerPlayer(GetName())
		kfb_DataSetKillerTong(gf_GetRealmTongName())
		kfb_DataSaveLastHit2SDB() --×îÖÕÒ»»÷°ï»áÓë½ÇÉ«´æµµ
		local szTime = date("%Y/%m/%d/%H:%M")
		WriteLog(format("[KfbLog][RealBossKiller][%s] MapID:%d, MapName:%s, PlayerName:%s, TongName:%s",
			szTime, nRealMapId, GetMapName(nRealMapId), GetName(), gf_GetRealmTongName() ))
	end

	--¼ì²â¹Ø¿¨ÊÇ·ñ½áÊø ËùÓÐboss¶¼±»»÷É±
	if kfb_CheckAllMissionBossDead() == 1 then
		kfb_SetAllMSPhase2Next() --³¢ÊÔ½øÈë½áÊø½×¶Î
		szGlobalMsg = format("Thµnh viªn bang %s ®ång t©m hiÖp lùc, tiªu diÖt %s T¶ Hé Ph¸p Thiªn ¢m Gi¸o Tiªu NhiÔm NguyÖt, chÆn ®øng hµnh ®éng x©m nhËp cña Liªu Quèc! C¸c bang héi cã thÓ vÒ server m×nh gÆp Qu¶n Gia Bang Héi nhËn th­ëng.",
			kfb_DataGetKillerTong() or "", GetMapName(kfb_DataGetRealBossRealMapId()) or "")
		Msg2Global(szGlobalMsg)
		AddGlobalCountNews(szGlobalMsg,1)
		
		Msg2Global(format(KFB_SZ_MSG_PUBLISH_REAL_BOSS, 
			GetMapName(kfb_DataGetRealBossRealMapId()) or "", 
			kfb_DataGetKillerTong() or "Ch­a") )
	end
end