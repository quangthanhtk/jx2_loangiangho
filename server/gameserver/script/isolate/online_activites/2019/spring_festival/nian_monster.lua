-- ���֧ �������ޡ� 
Import("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Import("\\script\\lib\\npccmdhead.lua")
Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\head.lua")

tLittleMonsterItem = {2,1,31271,1,1} --"С���ޱ���" ���Խ���
tFireworkItem = {
    {
        item = {2,3,31272,1,1},
        name = "Xu�n L�i",
        skill = 2737,
        skillName = "Xu�n L�i",
    },
    {
        item = {2,3,31287,1,1},
        name = "M�n H�ng",
        skill = 2738,
        skillName = "M�n H�ng",
    },
}
local tLittleMonster = {"Ti�u Ni�n Th� G�y R�i","Ti�u Ni�n Th� G�y R�i"}
NM2019_tBigMonster = {"Ni�n Th� Tu Luy�n","Ni�n Th� Tu Luy�n"}
local MaxDailyOpenLittleBox = 10


local tLittleNianMonsterPos = {
    {106,1529,3129},	{106,1482,3006},	{106,1394,3100},	{106,1424,3016},	{106,1316,3017},	{106,1549,3060},	{106,1335,2902},	{106,1405,2897},	{106,1470,2916},	{106,1531,2962},
    {202,1510,2734},	{202,1514,3002},	{202,1442,2815},	{202,1564,3103},	{202,1356,2720},	{202,1484,3148},	{202,1351,2856},	{202,1376,2943},	{202,1442,2938},	{202,1543,2926},
    {600,1417,3167},	{600,1477,3124},	{600,1539,3168},	{600,1545,3029},	{600,1572,2957},	{600,1493,2876},	{600,1456,3012},	{600,1370,3007},	{600,1360,2892},	{600,1424,2860},
    {507,1857,3218},	{507,1761,3193},	{507,1746,3273},	{507,1814,3319},	{507,1871,3295},	{507,1884,3362},	{507,1845,3427},	{507,1748,3461},	{507,1575,3405},	{507,1565,3294},
    {327,1304,2839},	{327,1295,2936},	{327,1292,3071},	{327,1427,3197},	{327,1516,3162},	{327,1544,3072},	{327,1570,2873},	{327,1537,2767},	{327,1447,2883},	{327,1451,2988},
}

local tBigNianMonsterPos = {
    {6300,1281,3373},
    {302,1455,2951},
    {406,1411,3103},
    {151,1518,2835},
}



local tLittleBossInstances = {} -- С���޵�NPCindex ����������

function NM2019_CreateLittleMonster() 
    if getn(%tLittleBossInstances) ~= 0 then
        return
    end
    local hour = tonumber(date("%H"))
    if hour > 1 and hour < 9 then -- �ںϷ�ʱ��֮��[9:00am, 1:00am]
        return
    end
    for i = 1, getn(%tLittleNianMonsterPos) do
        local tPos = %tLittleNianMonsterPos[i]
        local npcIdx = CreateNpc(%tLittleMonster[1],%tLittleMonster[2],tPos[1],tPos[2],tPos[3])
        tinsert(%tLittleBossInstances, npcIdx)
    end
end

function NM2019_CreateBigMonster()
    for i = 1, getn(%tBigNianMonsterPos) do
        local tPos = %tBigNianMonsterPos[i]
        local npcIdx = CreateNpc(NM2019_tBigMonster[1],NM2019_tBigMonster[2],tPos[1],tPos[2],tPos[3])
        -- �����޵�
        CastState2Npc(npcIdx, "state_specified_skill_effect",	5,  18*3600*48, 0, 2123); 
        CastState2Npc(npcIdx, "state_ignore_poison_damage",	    100,18*3600*48, 0, 2124);
        -- ����AI����
        g_NpcAI:setAI(npcIdx,AT_SM_MOVE)
    end
end

function NM2019_ClearLittleMonster()
    for i = 1, getn(%tLittleBossInstances) do
        SetNpcLifeTime(%tLittleBossInstances[i], 0)
    end
end

function NM2019_OnPlayerKillLittleMonster()
    if gf_Judge_Room_Weight(1, 10, "") ~= 1 then
		return 0;
    end
    local resTime = sf2019_rest_time(SF2019_END_DATE.year, SF2019_END_DATE.month, SF2019_END_DATE.day, 23, 59, 59)
    local ret,itemId = gf_AddItemEx2(tLittleMonsterItem, "R��ng Ti�u Ni�n Th�", SF_LOG_KEY_WORD, "Ti�u Ni�n Th�", resTime)
end

function NM2019_OnKillLittleMonster()
    local m,x,y = GetWorldPos()
    local nTeamSize = GetTeamSize()
    if nTeamSize > 0 then
        local oldPlayerIndex = PlayerIndex
        for i = 1, GetTeamSize() do
            PlayerIndex = GetTeamMember(i)
            local mm,_,_ = GetWorldPos()
            if m == mm then  -- in same map
                NM2019_OnPlayerKillLittleMonster()
            end
        end
        PlayerIndex = oldPlayerIndex
    else
        NM2019_OnPlayerKillLittleMonster()
    end
end

function NM2019_On_open_little_monster_box(nItemIdx)
    local used = get_task("littleBox")
    if used >= %MaxDailyOpenLittleBox then
        Talk(1,"","S� l�n s� d�ng �� ��t gi�i h�n")
        return
    end
    local szAward = "chunjie_xiaonianshou"
    if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
        Talk(1,"","S� d�ng th�t b�i")
        return 0
    end

    if DelItemByIndex(nItemIdx, 1) ~= 1 then
        Talk(1,"","S� d�ng th�t b�i")
        return
    end
    CustomAwardGiveGroup(szAward, 0)
    set_task("littleBox", used+1)
    Msg2Player("�� s� d�ng R��ng Ti�u Ni�n Th�")
end

function NM2019_OnUseFirework(nItemIdx)
    local g, d, p = GetItemInfoByIndex(nItemIdx);
    local id = 1
    for i = 1, getn(tFireworkItem) do
        local item = tFireworkItem[i].item
        if item[1] == g and item[2] == d and item[3] == p then
            id = i
        end
    end
    local skillid = tFireworkItem[id].skill
    local skillName = tFireworkItem[id].skillName
    local szTitle = format("S� d�ng v�t ph�m n�y s� h�c ���c k� n�ng %s.", skillName)
    local tbSay = {}
    if GetSkillLevel(skillid) == 0 then
        tinsert(tbSay, format("H�c/#LearnSkill(%d)", skillid))
        tinsert(tbSay, "H�y b�/nothing")
    else 
        szTitle = format("�� h�c %s r�i, c�c h� mu�n qu�n k� n�ng n�y??", skillName)
        tinsert(tbSay, format("Qu�n/#RemoveSkill(%d)", skillid))
        tinsert(tbSay, "H�y b�/nothing")
    end
    Say(szTitle, getn(tbSay), tbSay)    
end

function NM2019_OnSeverStart()
    NM2019_CreateLittleMonster()
    NM2019_CreateBigMonster()
end
