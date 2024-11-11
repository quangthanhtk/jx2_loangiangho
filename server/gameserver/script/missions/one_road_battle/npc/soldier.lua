Include([[\script\missions\one_road_battle\mission_head.lua]])
function main()
	local nNpcIdx = GetTargetNpc();
	local szNpcCamp = GetNpcCamp(nNpcIdx);
	local szPlayerCamp = GetPlayerCamp();
	local szNpcName = GetTargetNpcName();
	if szNpcCamp ~= szPlayerCamp then
		Talk(1, "",  "<color=green>" .. szNpcName .. "<color>: Ng��i ��u, b�t gian t� n�y.");
		return 0;
	end
	
	local szMsg = format("<color=green>%s<color>: Nh� ti�ng th�i, mu�n s�ng th� theo ta.", szNpcName);
	local tSel = {
		"\nR�i kh�i chi�n tr��ng/leave_battle",
		"\nTa tuy�t ��i kh�ng l�m ��o Binh!/nothing",
	};
	Say(szMsg, getn(tSel), tSel);
end

function leave_battle()
	local nCamp = GetTask(TASKID_ORB_CAMP);
	DelMSPlayer(Mission_OneRoadBattle.missionID, nCamp);
	Msg2MSAll(Mission_OneRoadBattle.missionID, GetName().."R�i kh�i chi�n tr��ng.");
end

function nothing()
end