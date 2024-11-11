Include([[\script\missions\one_road_battle\mission_head.lua]])
function main()
	local nNpcIdx = GetTargetNpc();
	local szNpcCamp = GetNpcCamp(nNpcIdx);
	local szPlayerCamp = GetPlayerCamp();
	local szNpcName = GetTargetNpcName();
	if szNpcCamp ~= szPlayerCamp then
		Talk(1, "",  "<color=green>" .. szNpcName .. "<color>: Ng­êi ®©u, b¾t gian tÕ nµy.");
		return 0;
	end
	
	local szMsg = format("<color=green>%s<color>: Nhá tiÕng th«i, muèn sèng th× theo ta.", szNpcName);
	local tSel = {
		"\nRêi khái chiÕn tr­êng/leave_battle",
		"\nTa tuyÖt ®èi kh«ng lµm §µo Binh!/nothing",
	};
	Say(szMsg, getn(tSel), tSel);
end

function leave_battle()
	local nCamp = GetTask(TASKID_ORB_CAMP);
	DelMSPlayer(Mission_OneRoadBattle.missionID, nCamp);
	Msg2MSAll(Mission_OneRoadBattle.missionID, GetName().."Rêi khái chiÕn tr­êng.");
end

function nothing()
end