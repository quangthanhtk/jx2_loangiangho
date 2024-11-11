Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\missions\\kuafu_boss\\kfb_data.lua")
Import("\\script\\missions\\kuafu_boss\\kfb_functions.lua")

Import("\\script\\missions\\kuafu_boss\\dacaoyuan2\\mission.lua")


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
	kfb_DataAddTongScore(szTongName, nDamage/(1000*50))

	PlayerIndex = oldPlayerIndex
end

function OnDeath(nNpcIndx, nSubWorldIndex, nKiller)
	
end

function OnNpcRevive(nNpcIndx, nMapIdx)
	local nOldSubWorld = SubWorld;
	if nMapIdx ~= nil then
		SubWorld = SubWorldID2Idx(nMapIdx);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	Msg2MSAll(this.missionID, "Th¸m tö b¸o tin, ph¸t hiÖn xe ngùa tËp kÕt cña bé l¹c du môc!");
	
	SubWorld = nOldSubWorld;
end