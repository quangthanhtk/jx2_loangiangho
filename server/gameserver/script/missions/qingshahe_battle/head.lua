Include("\\settings\\static_script\\missions\\base\\phasebase.lua");
Include("\\settings\\static_script\\missions\\base\\mission_head.lua");
Include("\\settings\\static_script\\missions\\base\\missionbase.lua");
Include("\\settings\\static_script\\missions\\base\\mission_settings.lua");
Include("\\settings\\static_script\\misc\\data_state\\state.lua")
Import("\\script\\lib\\define.lua");

QSH_headFile = "\\script\\missions\\qingshahe_battle\\head.lua";
thisFile = "\\script\\missions\\qingshahe_battle\\mission.lua";

QSH_MAX_MATCH = 20

QSH_MISSION_ID = 88

QSH_CAMP_NUM = 5

QSH_TSK_PLAYER_CAMP = 3499

tQSH = {
    mv_dynamicMapid = 1,
    mv_playerNumber = 2,
}

tMatchData = {
    matchNumber = 0,
}

tQSH_Camp = {
    "camp_player",
    "camp_enemy",
    "camp_evil",
}

this = msSettings:LoadHead(QSH_MISSION_ID);
this = inherit(tQSH, this);

function InitMatch()
    -- ÒÑ¾­¿ªÆô±ÈÈü£¬³õÊ¼»¯±ÈÈüÊý¾Ý
    local dynamicMapid = this.msPosition:getMapID()
    print("dynamicMapid:",dynamicMapid)
    tMatchData[dynamicMapid] = {
        camp1 = {
            towerNumber = 3,
            tower2Idx = {
                {},{},{}
            },
        },
        camp2 = {
            towerNumber = 3,
            tower2Idx = {
                {},{},{}
            },
        },
        playerCamp = {},
    }
    
    tMatchData[dynamicMapid].camp1.towerNumber = 3;
    tMatchData[dynamicMapid].camp2.towerNumber = 3;
    
    CreateTower(dynamicMapid)
    CreateMonster(dynamicMapid)
    CreateStaticNpc(dynamicMapid)
end

function CreateTower(dynamicMapid)
    local camp1_top1 = CreateNpc("qsh_songjianta","Tèng TrËn Ph¸p C¬ Quan",dynamicMapid,1531,3178) SetCampToNpc(camp1_top1,"camp_player")
    local camp1_mid1 = CreateNpc("qsh_songjianta","Tèng TrËn Ph¸p C¬ Quan",dynamicMapid,1609,3257) SetCampToNpc(camp1_mid1,"camp_player")
    local camp1_bot1 = CreateNpc("qsh_songjianta","Tèng TrËn Ph¸p C¬ Quan",dynamicMapid,1689,3380) SetCampToNpc(camp1_bot1,"camp_player")

    local camp1_top2 = CreateNpc("qsh_songjianta1","Tèng TrËn Ph¸p C¬ Quan",dynamicMapid,1527,3233) SetCampToNpc(camp1_top2,"camp_player")
    local camp1_mid2 = CreateNpc("qsh_songjianta1","Tèng TrËn Ph¸p C¬ Quan",dynamicMapid,1590,3288) SetCampToNpc(camp1_mid2,"camp_player")
    local camp1_bot2 = CreateNpc("qsh_songjianta1","Tèng TrËn Ph¸p C¬ Quan",dynamicMapid,1620,3393) SetCampToNpc(camp1_bot2,"camp_player")
    tinsert(tMatchData[dynamicMapid].camp1.tower2Idx[2],camp1_top2)
    tinsert(tMatchData[dynamicMapid].camp1.tower2Idx[2],camp1_mid2)
    tinsert(tMatchData[dynamicMapid].camp1.tower2Idx[2],camp1_bot2)
    local camp1_top3 = CreateNpc("qsh_songjianta1","Tèng TrËn Ph¸p C¬ Quan",dynamicMapid,1529,3316) SetCampToNpc(camp1_top3,"camp_player")
    local camp1_mid3 = CreateNpc("qsh_songjianta1","Tèng TrËn Ph¸p C¬ Quan",dynamicMapid,1561,3327) SetCampToNpc(camp1_mid3,"camp_player")
    local camp1_bot3 = CreateNpc("qsh_songjianta1","Tèng TrËn Ph¸p C¬ Quan",dynamicMapid,1572,3391) SetCampToNpc(camp1_bot3,"camp_player")
    tinsert(tMatchData[dynamicMapid].camp1.tower2Idx[3],camp1_top3)
    tinsert(tMatchData[dynamicMapid].camp1.tower2Idx[3],camp1_mid3)
    tinsert(tMatchData[dynamicMapid].camp1.tower2Idx[3],camp1_bot3)


    local camp2_top1 = CreateNpc("qsh_liaojianta","Liªu-TiÔn Th¸p",dynamicMapid,1569,3129) SetCampToNpc(camp2_top1,"camp_enemy")
    local camp2_mid1 = CreateNpc("qsh_liaojianta","Liªu-TiÔn Th¸p",dynamicMapid,1656,3230) SetCampToNpc(camp2_mid1,"camp_enemy")
    local camp2_bot1 = CreateNpc("qsh_liaojianta","Liªu-TiÔn Th¸p",dynamicMapid,1734,3319) SetCampToNpc(camp2_bot1,"camp_enemy")

    local camp2_top2 = CreateNpc("qsh_liaojianta1","Liªu-TiÔn Th¸p",dynamicMapid,1624,3114) SetCampToNpc(camp2_top2,"camp_enemy")
    local camp2_mid2 = CreateNpc("qsh_liaojianta1","Liªu-TiÔn Th¸p",dynamicMapid,1676,3201) SetCampToNpc(camp2_mid2,"camp_enemy")
    local camp2_bot2 = CreateNpc("qsh_liaojianta1","Liªu-TiÔn Th¸p",dynamicMapid,1739,3250) SetCampToNpc(camp2_bot2,"camp_enemy")
    tinsert(tMatchData[dynamicMapid].camp2.tower2Idx[2],camp2_top2)
    tinsert(tMatchData[dynamicMapid].camp2.tower2Idx[2],camp2_mid2)
    tinsert(tMatchData[dynamicMapid].camp2.tower2Idx[2],camp2_bot2)
    local camp2_top3 = CreateNpc("qsh_liaojianta1","Liªu-TiÔn Th¸p",dynamicMapid,1690,3111) SetCampToNpc(camp2_top3,"camp_enemy")
    local camp2_mid3 = CreateNpc("qsh_liaojianta1","Liªu-TiÔn Th¸p",dynamicMapid,1701,3163) SetCampToNpc(camp2_mid3,"camp_enemy")
    local camp2_bot3 = CreateNpc("qsh_liaojianta1","Liªu-TiÔn Th¸p",dynamicMapid,1731,3182) SetCampToNpc(camp2_bot3,"camp_enemy")
    tinsert(tMatchData[dynamicMapid].camp2.tower2Idx[3],camp2_top3)
    tinsert(tMatchData[dynamicMapid].camp2.tower2Idx[3],camp2_mid3)
    tinsert(tMatchData[dynamicMapid].camp2.tower2Idx[3],camp2_bot3)
end

function CreateMonster(dynamicMapid)
    -- local monster1 = CreateNpc("qsh_yeguai1","ÉÏ¹Å»ú¹ØÊÞ",dynamicMapid,1600,3197)
    -- local monster2 = CreateNpc("qsh_yeguai2","ÉîÔ¨Ä§Íõ",dynamicMapid,1661,3301)
    -- local monster3 = CreateNpc("qsh_yeguai3","±äÒì»ÒÐÜ",dynamicMapid,1631,3315)
    -- local monster4 = CreateNpc("qsh_yeguai3","±äÒì»ÒÐÜ",dynamicMapid,1630,3182)
    -- local monster5 = CreateNpc("qsh_yeguai4","±äÒìÒøºü",dynamicMapid,1690,3267)
    -- local monster6 = CreateNpc("qsh_yeguai4","±äÒìÒøºü",dynamicMapid,1584,3237)

    -- local monster7 = CreateNpc("qsh_yeguai5","±äÒì½ð¼×",dynamicMapid,1638,3355)
    -- local monster8 = CreateNpc("qsh_yeguai5","±äÒì½ð¼×",dynamicMapid,1624,3285)
    -- local monster9 = CreateNpc("qsh_yeguai5","±äÒì½ð¼×",dynamicMapid,1690,3232)
    -- local monster10 = CreateNpc("qsh_yeguai5","±äÒì½ð¼×",dynamicMapid,1643,3201)
    -- local monster11 = CreateNpc("qsh_yeguai5","±äÒì½ð¼×",dynamicMapid,1615,3156)
    -- local monster12 = CreateNpc("qsh_yeguai5","±äÒì½ð¼×",dynamicMapid,1562,3216)

    -- SetCampToNpc(monster1,"camp_evil") SetCampToNpc(monster5,"camp_evil") SetCampToNpc(monster9,"camp_evil") 
    -- SetCampToNpc(monster2,"camp_evil") SetCampToNpc(monster6,"camp_evil") SetCampToNpc(monster10,"camp_evil") 
    -- SetCampToNpc(monster3,"camp_evil") SetCampToNpc(monster7,"camp_evil") SetCampToNpc(monster11,"camp_evil") 
    -- SetCampToNpc(monster4,"camp_evil") SetCampToNpc(monster8,"camp_evil") SetCampToNpc(monster12,"camp_evil") 
end

tMinionsPath = {
    {
        {
            {1536,3376}, {1530, 3308}, {1532, 3220}, {1544,3148}, {1612, 3114}, {1717,3134},
        },
        {
            {1536,3376}, {1566, 3324}, {1631,3244}, {1717,3134},
        },
        {
            {1536,3376}, {1580, 3390}, {1653,3385}, {1719,3346}, {1734, 3261}, {1717,3134},
        }
    },
    {
        {
            {1721,3129}, {1679, 3112}, {1612, 3114}, {1544,3148}, {1532, 3220}, {1545,3364},
        },
        {
            {1721,3129}, {1698, 3175}, {1631,3244}, {1545,3364},
        },
        {
            {1724,3142}, {1733, 3195}, {1729, 3260}, {1719,3346}, {1653,3385}, {1545,3364},
        },
    },
}
QSH_DeathScript = {
    "\\script\\missions\\qingshahe_battle\\NpcDeathScript\\camp1.lua",
    "\\script\\missions\\qingshahe_battle\\NpcDeathScript\\camp2.lua",
}   



function CreateMinions(nCamp,nLine,templete,name,dynamicMapid)
    local tPath = tMinionsPath[nCamp][nLine]
    local Minions = CreateNpc(templete,name,dynamicMapid,tPath[1][1],tPath[1][2])
    SetCampToNpc(Minions, tQSH_Camp[nCamp])
    SetNpcDeathScript(Minions,QSH_DeathScript[nCamp])
    -- tPath[1] ±íÊ¾NPC³öÉúµÄÎ»ÖÃ
    for i = 2,getn(tPath) do
        SetNpcNextPatrolPoint(Minions, tPath[i][1], tPath[i][2])
    end
end

function CreateStaticNpc(dynamicMapid)
    local boss1 = CreateNpc("qsh_songyuanshuai","Tèng nguyªn so¸i",dynamicMapid,1550,3358) SetCampToNpc(boss1, tQSH_Camp[1])
    local boss2 = CreateNpc("qsh_liaoyuanshuai","Liªu nguyªn so¸i",dynamicMapid,1713,3139) SetCampToNpc(boss2, tQSH_Camp[2])

    local shop1 = CreateNpc("qsh_songjunxuguan","Tèng Qu©n Nhu Quan",dynamicMapid,1540,3407) SetCampToNpc(boss1, tQSH_Camp[1])
    local shop2 = CreateNpc("qsh_liaojunxuguan","Liªu Qu©n Nhu Quan",dynamicMapid,1724,3104) SetCampToNpc(boss2, tQSH_Camp[2])
    SetNpcDeathScript(boss1,QSH_DeathScript[1])
    SetNpcDeathScript(boss2,QSH_DeathScript[2])
end

function GetReviveTime()
    return 10
end
-- tMatch = {
--     [dynamicMapid] = {
        
--     }
-- }