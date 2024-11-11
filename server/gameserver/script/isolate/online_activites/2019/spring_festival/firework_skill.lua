Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\nian_monster.lua")
Import("\\script\\lib\\npccmdhead.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_task.lua")
Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\nyf\\head.lua")
local tMonsterInfo = {
    [6300] = {
        waypoint = {{1304,3389}, {1294, 3420}, {1274, 3410}, {1281,3373}},
        mapName = "Th�t L�c Nhai",
        taskbit = 1,
    },
    [302] = {
        waypoint = {{1449,2932}, {1472, 2945}, {1467, 2979}, {1446,2962}},
        mapName = "Thanh Th�nh s�n",
        taskbit = 2,
    },
    [406] = {
        waypoint = {{1397,3085}, {1418, 3077}, {1416,3126}, {1392,3129}},
        mapName = "V� L�ng s�n",
        taskbit = 3,
    },
    [151] = {
        waypoint = {{1529,2809}, {1536, 2863}, {1498,2843}, {1508,2810}},
        mapName = "V�n M�ng Tr�ch",
        taskbit = 4,
    },
}


function OnHitMonster(nNpcIndex)
    local sNpcName = GetNpcName(nNpcIndex);
    if sNpcName ~= NM2019_tBigMonster[2] then
		return 0;
    end
    local npcMapId, npcX, npcY = GetNpcWorldPos(nNpcIndex);
    local tInfo = %tMonsterInfo[npcMapId]
    if tInfo == nil then
        return 0;
    end

    local used = gf_GetTaskBit(2823, tInfo.taskbit)
    if used == 1 then
        Talk(1,"","<color=yellow>Ni�n Th� l�c l� c�i ��u to, tr� m�t nh�n ng��i!<color>")
        return 0;
    end
    local szAward = "chunjie_danianshou"
    if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
        Msg2Player(1,"","Nh�n th��ng th�t b�i, h�y ki�m tra ch� tr�ng trong t�i.")
        return 0
    end

    gf_SetTaskBit(2823, tInfo.taskbit, 1)
    local tWayPoint = {}
    local randP = random(1, getn(tInfo.waypoint))
    tWayPoint = tInfo.waypoint[randP]
    g_NpcAI:setWayPoint(nNpcIndex, {tWayPoint});
    local szTalk = {
        "�! ��ng ��nh ta!",
        "L�m ta h�t h�n!",
        "Ha ha! Nh�t qu�!",
        "C�i g� v�y??",
        "Gr�o! Hu hu hu!!"
    }
    Msg2Player(format("��i Ni�n Th� � %s s� h�i, r�i ra %s.", tInfo.mapName, "M�t �t B�u V�t"))
    NpcChat(nNpcIndex, szTalk[random(1,getn(szTalk))])
    SetCurrentNpcSFX(nNpcIndex, 936, 0, 0, 3*18);
    CustomAwardGiveGroup(szAward, 0)
end

function DoFirework(nNpcIndex)
    local nSubWorldTmpId = GetMapTemplate(SubWorld)
    if nSubWorldTmpId ~= tbMission.realMapID then
        Msg2Player("K� n�ng ch� c� hi�u l�c trong ph� b�n C�m ��u N�m.")
        return 0;
    end
    local used = GetTask(2827)
    if used >= 10 then
        Msg2Player("�� d�ng h�t l��t.")
        return
    end
    SetTask(2827, used + 1)
    local szAward = "chunjie_kainianfan"
    if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
        Talk(1,"","S� d�ng th�t b�i")
        return 0
    end
    CustomAwardGiveGroup(szAward, 0)
    SetCurrentNpcSFX(nNpcIndex, 936, 0, 0, 3*18);
end

function OnSkill(nNpcIndex, nSkillID, nSkillLV)
    if sf2019_check_main_date() ~= 1 then
        Talk(1,"",format("<color=yellow>%s<color> �� qu� h�n, kh�ng th� d�ng k� n�ng n�y n�a.", SF2019_ACT_NAME))
        return
    end

    if nSkillID == 2737 then
        OnHitMonster(nNpcIndex)
        return
    end
    if nSkillID == 2738 then
        DoFirework(nNpcIndex)
    end

end