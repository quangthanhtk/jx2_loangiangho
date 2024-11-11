Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\missions\\kuafu_boss\\kfb_data.lua")
Import("\\script\\missions\\kuafu_boss\\kfb_functions.lua")

--Import�˶�Ӧ��mission.lua��ֱ�ӷ��ʺ͵������ڲ����ݺͷ���
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

	--�����ͬmissionID���е�ͼ���boss
	local  tMaps = kfb_GetDynamicMapIds(nRealMapId)
	if tMaps then
		for i=1, getn(tMaps) do
			kfb_RemoveNpcByMV(tMaps[i], MV_BOSS_IDX)
		end
	end

	local szGlobalMsg = format("Chi�n b�o: %s%s t�i %s ti�u di�t %s", gf_GetRealmTongName(), GetName(), GetMapName(nRealMapId), GetNpcName(nNpcIndx))
	Msg2Global(szGlobalMsg)
	--Msg2MSAll(this.missionID, szGlobalMsg));

	--��¼��boss����һ��
	if nRealMapId == kfb_DataGetRealBossRealMapId() then
		kfb_DataSetKillerPlayer(GetName())
		kfb_DataSetKillerTong(gf_GetRealmTongName())
		kfb_DataSaveLastHit2SDB() --����һ��������ɫ�浵
		local szTime = date("%Y/%m/%d/%H:%M")
		WriteLog(format("[KfbLog][RealBossKiller][%s] MapID:%d, MapName:%s, PlayerName:%s, TongName:%s",
			szTime, nRealMapId, GetMapName(nRealMapId), GetName(), gf_GetRealmTongName() ))
	end

	--���ؿ��Ƿ���� ����boss������ɱ
	if kfb_CheckAllMissionBossDead() == 1 then
		kfb_SetAllMSPhase2Next() --���Խ�������׶�
		szGlobalMsg = format("Th�nh vi�n bang %s ��ng t�m hi�p l�c, ti�u di�t %s T� H� Ph�p Thi�n �m Gi�o Ti�u Nhi�m Nguy�t, ch�n ��ng h�nh ��ng x�m nh�p c�a Li�u Qu�c! C�c bang h�i c� th� v� server m�nh g�p Qu�n Gia Bang H�i nh�n th��ng.",
			kfb_DataGetKillerTong() or "", GetMapName(kfb_DataGetRealBossRealMapId()) or "")
		Msg2Global(szGlobalMsg)
		AddGlobalCountNews(szGlobalMsg,1)
		
		Msg2Global(format(KFB_SZ_MSG_PUBLISH_REAL_BOSS, 
			GetMapName(kfb_DataGetRealBossRealMapId()) or "", 
			kfb_DataGetKillerTong() or "Ch�a") )
	end
end