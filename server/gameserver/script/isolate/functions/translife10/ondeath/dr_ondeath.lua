Import("\\script\\isolate\\functions\\translife10\\npcs\\mzjg_npc.lua")
Import("\\script\\lib\\globalfunctions.lua");
-- ��������
function OnDeath(idx)
	if tGtTask:check_cur_task(534) ~= 1 then
		SendScript2VM("\\script\\isolate\\functions\\translife10\\npcs\\mzjg_npc.lua","NpcDeath()")
		SetNpcLifeTime(idx,3)
		return
	end
    local nOldIndex = PlayerIndex;
	if GetTeamSize() == 0 then
		if gf_JudgeRoomWeight(1, 100, "") == 1 then
            AddItem(2,0,31002,1);
        else
            Msg2Player("T�i �� ��y, nh�n v�t ph�m th�t b�i.")
	    end
		SendScript2VM("\\script\\isolate\\functions\\translife10\\npcs\\mzjg_npc.lua","NpcDeath()")
		SetNpcLifeTime(idx,3)
		return
	end
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if gf_JudgeRoomWeight(1, 100, "") == 1 then
            AddItem(2,0,31002,1);
	    else
            Msg2Player("T�i �� ��y, nh�n v�t ph�m th�t b�i.")
	    end
	end
	PlayerIndex = nOldIndex;
    SendScript2VM("\\script\\isolate\\functions\\translife10\\npcs\\mzjg_npc.lua","NpcDeath()")
	SetNpcLifeTime(idx,3)
end