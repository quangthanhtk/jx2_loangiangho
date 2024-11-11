Include("\\script\\missions\\yp\\slymg\\head.lua")

function OnDeath(id, f, x)
	local m = GetWorldPos();
	local tTempRev = nil;
	local nIndex = nil;
	if m == 7111 then
		local tTempRev = SLYMG_TEMP_REV1;
		local nIndex = GetTask(TASK_FIELD_PVP_CAMP);
		if nIndex == 0 then nIndex = 5; end
		SetTempRevPos(tTempRev[nIndex][1], tTempRev[nIndex][2] * 32, tTempRev[nIndex][3] * 32);
	else
		SetTempRevPos(7111, 1708 * 32, 3407 *32);
		SetTempRevScript("\\script\\missions\\yp\\slymg\\player_death.lua");
	end
	local szKiller = nil;
	local szName = GetName();
	local nDeathIndex = PlayerIndex;
	local nKillerIndex = NpcIdx2PIdx(Launcher);
	if nKillerIndex > 0 and nKillerIndex ~= nDeathIndex then
		PlayerIndex = nKillerIndex;
		szKiller = GetName();
		Msg2Player(format("B�n ti�u di�t [%s]!", szName));
		PlayerIndex = nDeathIndex;
		Msg2Player(format("B�n b� [%s] ti�u di�t r�i!", szKiller));
		Msg2Map(m, format("Ng��i ch�i %s ��nh �p ng��i ch�i %s, ng��i ch�i %s b� th��ng r�i kh�i", szKiller, szName, szName));
	end	
end

function OnRevive()
	SetPlayerScript("\\script\\missions\\yp\\slymg\\mission.lua");
	SendScript2VM("\\script\\missions\\yp\\slymg\\mission.lua", "tbSLYMG:onLogin()");	
end