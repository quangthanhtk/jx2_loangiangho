Include([[\script\missions\one_road_battle\mission_head.lua]])
Import("\\script\\lib\\globalfunctions.lua")

function main()
	local nNpcIdx = GetTargetNpc();
	local szNpcCamp = GetNpcCamp(nNpcIdx);
	local szPlayerCamp = GetPlayerCamp();
	if szNpcCamp ~= szPlayerCamp then
		return 0;
	end
	
	local nCamp = CAMPSTR2IDX[szNpcCamp];
	local nBucketCount = GetMissionV(MV_BUCKET_SONG + nCamp - 1);
	if nBucketCount <= 0 then
		Talk(1, "", "Th�ng �� h�t d�u.");
		return 0;
	end
	
	if GetFightState() == 1 then
		Talk(1, "", "Tr�ng th�i chi�n ��u kh�ng th� nh�n d�u.");
		return 0;
	end
	
	if GetItemCount(BUCKET_GDP[1], BUCKET_GDP[2], BUCKET_GDP[3]) >= 1 then
		Talk(1, "", "Kh�ng th� nh�n th�m d�u.");
		return 0;
	end
	
	if gf_Judge_Room_Weight(1, 10, "") ~= 1 then return 0; end
	Orb_AddRuntimeStat(RUNTIMEID_UseOilBomb, 0, 1)
	SetMissionV(MV_BUCKET_SONG + nCamp - 1, nBucketCount - 1);
	local nRet, nItemIdx = gf_AddItemEx({BUCKET_GDP[1], BUCKET_GDP[2], BUCKET_GDP[3], 1}, "D�u");
	gf_SetItemExpireTime(nItemIdx, 300);
end