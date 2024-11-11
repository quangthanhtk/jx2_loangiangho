Import("\\script\\lib\\sdb.lua")

--¿ç·þbossÊý¾Ý¶ÁÈ¡
--¿ç·þ»ý·Ö¼ÇÂ¼
g_KFBOSS_RANK_SZKEY 			= "KFBOSS_TM_RANK"
g_KFBOSS_RANK_KEY1				= 0
g_KFBOSS_RANK_KEY2				= 0
--sdb[szTongName] = {"d", nDamage}

--Ô­·þÁì½±¼ÇÂ¼
g_KFBOSS_RANK_SOUR_SZKEY	= "KFBOSS_TM_SOURCE_RANK"
g_KFBOSS_RANK_SOUR_KEY1 	= 0
g_KFBOSS_RANK_SOUR_KEY2 	= 0
--sdb[szTongName] = {"dd", isAward, nRank, nScore, GetName()}

--×îºóÒ»»÷¼ÇÂ¼
g_KFBOSS_LH_SZKEY1 				= "KFBOSS_TM_LASTHIT"
g_KFBOSS_LH_KEY1					= 0
g_KFBOSS_LH_KEY2					= 0
--sdb[1] = {"ss", szName, isAward, szTongName, isAward, getname}


g_tTongRankBagCount = {50, 40, 30, 25, 20, 15, 13, 12, 11, 10, 9, 8, 7, 6, 5} --°ï»áÅÅÃû½±Àø
g_nTongJoinBagCount = 2		--°ï»á²ÎÓë½±Àø
g_TongAwardRecord 	= {}  --°ï»áÁì½±±¾µØ»º´æ
g_LastHit						= nil

function SetBattleData2Sdb(tData)
	if not tData then
		print("Sè liÖu ChiÕn BOSS bÞ lçi, tData:nil")
		return
	end
	local nTongCount = 0
	local sdb 		= SDB(g_KFBOSS_RANK_SZKEY, g_KFBOSS_RANK_KEY1, g_KFBOSS_RANK_KEY2)
	sdb.sortType 	= 2
	sdb:delete()
	for k, v in tData do
		sdb[k] = {"f", v[1]}
		nTongCount = nTongCount + 1
	end
--	AddRuntimeStat(101, 1, 0, nTongCount); --Âñµã
end

function SetLastHitData2Sdb()
	local RealmTongName = gf_GetRealmTongName()
	local RealmName			= GetName()
	local sdb 		= SDB(g_KFBOSS_LH_SZKEY1, g_KFBOSS_LH_KEY1, g_KFBOSS_LH_KEY2, 3)
	sdb["LastHit"] = {"sdsds", RealmName, 0, RealmTongName, 0, ""}
end

function SdbClear()
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		local sdb = SDB(g_KFBOSS_RANK_SZKEY, g_KFBOSS_RANK_KEY1, g_KFBOSS_RANK_KEY2)
		sdb:reflash()
		sdb:delete()
	elseif nCurGs == 0 then
		local sdb1 = SDB(g_KFBOSS_RANK_SOUR_SZKEY, g_KFBOSS_RANK_SOUR_KEY1, g_KFBOSS_RANK_SOUR_KEY2)
		sdb1:reflash()
		sdb1:delete()
		local sdb2 = SDB(g_KFBOSS_LH_SZKEY1, g_KFBOSS_LH_KEY1, g_KFBOSS_LH_KEY2)
		sdb2:reflash()
		sdb2:delete()
	end
end
