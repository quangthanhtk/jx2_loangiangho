Include("\\script\\missions\\one_road_battle\\mission.lua")
Include("\\script\\exchg_server\\one_road_battle_npc.lua")

function _enter(nCamp)
    local nMapId = this:Create()
    this:TeamEnter(nMapId, nCamp);
end

function _leave()
    this:Close()
end

function start()
    this.msPhases[1].msPhases[2]:onFinish()
end

function win()
    this.msPhases[1].phases[2]:onFinish()
end

function KickMyself()
    local nCamp = GetTask(TASKID_ORB_CAMP);
    Talk(1,"","K� th� tr��c m�t v�y m� d�m ng� g�t, ng��i ��u l�i ra cho ta!");
    DelMSPlayer(this.missionID, nCamp);
    Msg2MSAll(this.missionID,GetName().."R�i kh�i chi�n tr��ng.");
end

function ReturnMission()
    local nCamp = GetTask(TASKID_ORB_CAMP);
    this:TeamEnter(nMapId, nCamp);
end

function test_orb_start_battle()
    local nVersion,nCurGs = GetRealmType();
    if nCurGs == 0 then return end -- ԭ��Ŀǰû�и�ս��
    SendScript2VM("\\script\\exchg_server\\one_road_battle_npc.lua","orb_TryBattleStart()")
end

function findmycamp()
    Msg2Player(GetTask(TASKID_ORB_CAMP))
end

function OnUse()
    local tbSay = {}
	local szTitle = format("")
	szTitle = format("battle test function")
    tinsert(tbSay, format("%s/test_orb_start_battle", "start_battle"))
    tinsert(tbSay, format("%s/KickMyself", "KickMyself"))
    tinsert(tbSay, format("%s/findmycamp", "findmycamp"))
    tinsert(tbSay, format("%s/_leave", "Ra kh�i"))
    tinsert(tbSay, format("%s/nothing", "nothing"))
	Say(szTitle, getn(tbSay), tbSay)
end