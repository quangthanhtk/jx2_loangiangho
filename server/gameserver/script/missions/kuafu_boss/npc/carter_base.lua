Import("\\script\\missions\\kuafu_boss\\kfb_functions.lua")
Import("\\script\\missions\\kuafu_boss\\kfb_head.lua")

g_tDestinationIdx = {
	-- [1] = KFB_MISSION_DATA_IDX_DCY2,
	-- [2] = KFB_MISSION_DATA_IDX_YMG,
}

function main()
	local nNpcIdx = GetTargetNpc();
	local szNpcName = GetTargetNpcName();
	
	local szMsg = format("<color=green>%s<color>: Ng��i mu�n �i ��u? Ta c� th� h� t�ng ng��i �i.", szNpcName);
	local tSel = {
		-- "\nǰ��".."���Ź�".."/goto_destination",
		-- "\nû��/nothing",
	};
	for i=1, getn(g_tDestinationIdx) do
		local nTargetMapId = T_KFB_MISSION_CONFIG[g_tDestinationIdx[i]][2]
		local szTemp = "\n".."��n "..format("%s/#goto_destination(%d)", GetMapName(nTargetMapId), g_tDestinationIdx[i])
		tinsert(tSel, szTemp);
	end
	tinsert(tSel, "\n kh�ng c� g�/nothing");

	Say(szMsg, getn(tSel), tSel);
end

function goto_destination(nDestinationIdx)
	kfb_EnterMSByType(nDestinationIdx, KFB_COMMON_PLAYER_CAMP);
end

function nothing()
end