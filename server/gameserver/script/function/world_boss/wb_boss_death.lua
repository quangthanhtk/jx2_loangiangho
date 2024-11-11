--����BOSS�����ű�
Include("\\script\\function\\world_boss\\wb_head.lua")
--Include("\\script\\online_activites\\201510\\kill_npc_weekly.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")

function OnDeath(id, f, x)
	local npcName = GetNpcName(id);
	local nMap, nX, nY = GetNpcWorldPos(id);
	local killer = "";
	--˭������
	if f == 0 then
		WAward:WorldBoss_KillBoss(npcName);

		killer = GetName();
		--gf_TeamOperateEX(wb_KillAward); --LongDaiKa: ��ng ph�n th��ng team
		--��������
		--gf_TeamOperateEX(function () tbKillNpcWeekly:TriggerKillNpc(%npcName) end);
		--Observer:onTeamEvent(SYSEVENT_YP_KILLBOSS, 0);
		--FireEvent("event_mission_affairs", "worldboss", "killboss", id) --LongDaiKa: ��ng ph�n th��ng team
	end
	local msg = format("Sau m�t h�i chi�n ��u k�ch li�t, cu�i c�ng BOSS %s �� b� %s ti�u di�t th�nh c�ng.", npcName, killer);
	Msg2Global(msg);
	AddLocalNews(msg);
	--ˢ����
	local bigBox = CreateNpc("WorldBoss_Box", "R��ng V�ng ��i Chi�n", nMap, nX, nY);
	if bigBox > 0 then
		SetNpcScript(bigBox, "\\script\\function\\world_boss\\wb_big_box.lua");
		SetNpcLifeTime(bigBox, 30 * 60);
	end
	local nScriptFile = "";
	local nHour = tonumber(date("%H"));
	if nHour >= 12 and nHour < 18 then --����ˢ��
		nScriptFile = "\\script\\function\\world_boss\\wb_small_box.lua";
	else --����ˢ��
		nScriptFile = "\\script\\function\\world_boss\\wb_small_box1.lua";
	end
	for i = 1, 50 do
		local smallBox = CreateNpc("tongbaoxiang", "��i Chi�n B�o H�p", nMap, nX + random(-i, i), nY + random(-i, i));
		if smallBox > 0 then
			SetNpcScript(smallBox, nScriptFile);
			SetNpcLifeTime(smallBox, 30 * 60);
		end
	end
	--ɾ��ʬ��
	SetNpcRemoveScript(id, "");
	SetNpcLifeTime(id, 0);
	AddRuntimeStat(23, 1, 0, 1);
	
	_w_fix_ClonePk_CloseFreePk(nMap); --Fix clone c�u tkt
end
