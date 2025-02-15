-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII NPC唐弄月Script
-- By StarryNight
-- 2007/08/16 AM 10:27

-- 大智若愚，不智者乃至智矣……

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\faction\\faction_head.lua")
NPC_NAME = "<color=green>Л阯g L閚g Nguy謙<color>:";
--技能列表
SKILLS={
--唐门任侠
--魅影心法 (技能id=1872)
[1872]={
     --{关键点数，前提技能数，前提技能关系（与：1，或：0），前提技能1，前提技能1等级，...}
     levelless={3,0,0,},
     --关键点（技能等级，玩家等级，消耗金钱，门派贡献度}
     [1]={1,0,300,0},
     [2]={2,10,50,0},
     [3]={10,26,0,0},
	 },
--玲珑刺 (技能id=1873)
[1873]={
     levelless={3,1,0,1872,1},
     [1]={1,0,300,0},
     [2]={2,10,50,0},
     [3]={7,20,0,0},
     },
--灵犀追命 (技能id=1874)
[1874]={
     levelless={2,1,0,1876,1},
     [1]={1,10,1000,50},
     [2]={7,22,0,50},
     },
--杀意 (技能id=1875)
[1875]={
     levelless={2,0,0,1872,1},
     [1]={1,20,5000,100},
     [2]={7,32,0,100},
     },
--碧落刃 (技能id=1876)
[1876]={
     levelless={2,1,0,1873,1},
     [1]={1,10,10000,500},
     [2]={7,22,0,500},
     },
--惊鸿断 (技能id=1877)
[1877]={
     levelless={2,1,0,1876,1},
     [1]={1,20,50000,500},
     [2]={7,32,0,500},
     },
--凄锋夺 (技能id=1878)
[1878]={
     levelless={2,1,0,1876,1},
     [1]={1,30,100000,1000},
     [2]={7,42,0,1000},
     },
--混沌斗魄 (技能id=1879)
[1879]={
     levelless={2,1,0,1875,1},
     [1]={1,30,50000,1000},
     [2]={7,42,0,1000},
     },
--碎梦崩 (技能id=1880)
[1880]={
     levelless={2,2,0,1877,1,1878,1},
     [1]={1,40,60000,1500},
     [2]={7,52,0,1500},
     },
--流星赶月 (技能id=1881)
[1881]={
     levelless={2,1,0,1874,1},
     [1]={1,40,500000,2000},
     [2]={7,52,0,2000},
     },
--烟雨迷离 (技能id=1882)
[1882]={
     levelless={2,1,0,1881,1},
     [1]={1,50,500000,3000},
     [2]={7,68,0,3000},
     },
--千影绝杀 (技能id=1883)
[1883]={
     levelless={5,3,1,1879,7,1880,7,1882,1},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}

function main()
    if GetPlayerRoute() == 5 then
        get_in_route(5,31);
        return 0;
    end
	if GetPlayerRoute() == 31 and HaveLearnedSkill(17) ~= 1 then
		LearnSkill(17);
    end
	master_main(5,31)
end;
