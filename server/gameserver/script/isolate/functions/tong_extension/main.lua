--ÕâÊÇÄ£¿é»¯µÄÒ»¸ö±ê×¼Ö÷ÎÄ¼þ£¬¸÷Ä£¿éÖ»ÐèÒªÊµÏÖ¶ÔÓ¦µÄ±ê×¼ÊÂ¼þ´¦Àíº¯Êý£¬²»ÐèÒª¹ØÐÄÕâÐ©º¯ÊýÊ²Ã´Ê±ºò±»µ÷ÓÃ
--Ä£¿é¸úÄ£¿éÖ®¼ä²»ÄÜÓÐIncludeºÍµ÷ÓÃ¹ØÏµ
--ËùÒÔÃ¿¸öÄ£¿éÊÇ¶ÀÁ¢µÄ
--²»ÐèÒªµÄhandlerÇë×¢ÊÍµ÷£¬ÒÔÃâ¿Õ»Øµ÷Ó°ÏìÐ§ÂÊ

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\biwudahui\\tournament\\tournament_head.lua")
t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= 1,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ð§ >0:Ä£¿éÓÐÐ§£¬ÊýÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "tong_extension",
    szViewName 			= "Më réng tÝnh n¨ng bang héi",
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}
 TongExt_szThisFile = "\\script\\isolate\\functions\\tong_extension\\main.lua"
-----------------------Tong Extension Config-----------------------
 TongExt_TONG_MAX_CASH             = 12000

 TongExt_TSKID_SELF_LIVENESS       = 3472
 TongExt_TSKID_LIVENESSPERWEEK     = 3474
 TongExt_TSKID_ROB_LIMIT           = 3479 -- Ã¿ÌìµÚÒ»´ÎÇÀÉ±±ð°ïboss¿É»ñµÃ»îÔ¾¶È
 TongExt_TSKACCESSCODE_LIVENESS    = 0
 TongExt_LIVENESSPERWEEK_LIMIT     = 84 -- Íæ¼ÒÃ¿ÖÜ¿ÉÒÔ»ñµÃµÄÓÐÉÏÏÞ»îÔ¾¶È
 TongExt_MAX_SELF_LIVENESS         = 18000
 TongExt_TONG_DEFAULT_CASH         = 100

 TongExt_Activity_1v1_times = 3487
 TongExt_Activity_3v3_times = 3488
-----------------------Tong Extension Devotion-----------------------
-- ¾èÔùÎïÆ·£¬ÓÉÓÚÄ¿Ç°Ö»ÓÃÒ»¸öÈÎÎñ±äÁ¿±£´æÐÅÏ¢£¬ÎïÆ·ÖÖÀà×î¶à¿ÉÒÔÖ§³Ö9ÖÖ¡£Ã¿ÖÖÃ¿Ìì×î¶à¿ÉÒÔ¾èÔù9´Î¡£
 TongExt_TSKID_DEVOTION_LIMIT      = 3473

 TongExt_DEVOTION_CONFIG = {
    -- ±í¸ñ¸ñÊ½ £º {ÎïÆ·Ãû, {ÎïÆ· g d p n}, »ñµÃ»îÔ¾¶È, »ñµÃ°ï»á×Ê½ð, Ã¿ÖÜ´ÎÊý }
    { "Thiªn Cang LÖnh", { 2,95,204,1 },  350,  350,  9 },
    { "Thiªn M«n Kim LÖnh", { 2,1,30370,1 },  350,  350,  9 },
    { "Thiªn Kiªu LÖnh", { 2,97,236,1 },  10,  10,  9 },
}

-----------------------Tong Extension Totem-----------------------
 TongExt_BOSS_LIVE_TIME = 60*60
 TongExt_BOSS_SUMMON_TICKET_IDX = {
    PackItemId(2,1,31211),
    PackItemId(2,1,31212),
    PackItemId(2,1,31213),
    PackItemId(2,1,31214),
    PackItemId(2,1,31215),
    PackItemId(2,1,31216),
    PackItemId(2,1,31217),
    PackItemId(2,1,31218),
    PackItemId(2,1,31219),
    PackItemId(2,1,31220),
 }
 TongExt_BOSS_SUMMON_TICKET = {
    [PackItemId(2,1,31211)] = { "§å §»ng TriÖu Gäi Phï CÊp 1","tong_juxiang","Cù T­îng",1 },
    [PackItemId(2,1,31212)] = { "§å §»ng TriÖu Gäi Phï CÊp 2","tong_tongbiyuan","Th«ng TÝ Viªn",2 },
    [PackItemId(2,1,31213)] = { "§å §»ng TriÖu Gäi Phï CÊp 3","tong_zhujian","Gia KiÒn",3 },
    [PackItemId(2,1,31214)] = { "§å §»ng TriÖu Gäi Phï CÊp 4","tong_lingjiu","Linh Tùu",4 },
    [PackItemId(2,1,31215)] = { "§å §»ng TriÖu Gäi Phï CÊp 5","tong_huxian","Hå Tiªn",5 },
    [PackItemId(2,1,31216)] = { "§å §»ng TriÖu Gäi Phï CÊp 6","tong_zhujiuyin","Chóc Cöu ¢m",6 },
    [PackItemId(2,1,31217)] = { "§å §»ng TriÖu Gäi Phï CÊp 7","tong_jialouluo","Phông Hoµng",7 },
    [PackItemId(2,1,31218)] = { "§å §»ng TriÖu Gäi Phï CÊp 8","tong_fengxi","Phong Hi",8 },
    [PackItemId(2,1,31219)] = { "§å §»ng TriÖu Gäi Phï CÊp 9","tong_baize","B¹ch Tr¹ch",9 },
    [PackItemId(2,1,31220)] = { "§å §»ng TriÖu Gäi Phï CÊp 10","tong_wushen","Vâ Th¸nh",10 },
}
 TongExt_TOTEM_INFO = {
    -- { Í¼ÌÚÊÞÃû£¬ ÊÞ»êÎïÆ·id£¬ Éý¼¶Ê±ÏûÏ¢ÌáÊ¾£¬ Éý¼¶ºóÖÜ×Ê½ðÏûºÄ£¬¸£ÀûÉÌµêid, ¿ªÆôÊ±ÏûºÄ×Ê½ð,¿ªÆôºó·¢ËÍÀñ°üµÈ¼¶ }
    {"Cù T­îng",   PackItemId(2,1,31221),"Cù T­îng trë thµnh Thñ Hé §å §»ng míi cña bang, më TiÖm Phóc Lîi cÊp 1.", 350, 1 ,700, 0},
    {"Th«ng TÝ Viªn", PackItemId(2,1,31222),"Th«ng TÝ Viªn trë thµnh Thñ Hé §å §»ng míi cña bang.", 700, 1, 1400, 0},
    {"Gia KiÒn",   PackItemId(2,1,31223),"Gia KiÒn trë thµnh Thñ Hé §å §»ng míi cña bang, më ho¹t ®éng bang-Kinh ThÕ ThiÕt TÆc", 1100, 1, 2200, 0},
    {"Linh Tùu",   PackItemId(2,1,31224),"Linh Tùu trë thµnh Thñ Hé §å §»ng míi cña bang, më TiÖm Phóc Lîi cÊp 2. Bang chñ vµ tr­ëng l·o cã thÓ ph¸t phóc lîi ë chç Qu¶n Gia Bang.", 1450, 2, 2900, 1},
    {"Hå Tiªn",   PackItemId(2,1,31225),"Hå Tiªn trë thµnh Thñ Hé §å §»ng míi cña bang.", 1890, 2, 3780, 1},
    {"Chóc Cöu ¢m", PackItemId(2,1,31226),"Chóc Cöu ¢m trë thµnh Thñ Hé §å §»ng míi cña bang.", 2470, 2, 4940, 1},
    {"Phông Hoµng", PackItemId(2,1,31227),"Phông Hoµng trë thµnh Thñ Hé §å §»ng míi cña bang, më TiÖm Phóc Lîi cÊp 3. Phóc lîi bang t¨ng cÊp.", 2750, 3, 5500, 2},
    {"Phong Hi",   PackItemId(2,1,31228),"Phong Hi trë thµnh Thñ Hé §å §»ng míi cña bang.", 3500, 3, 7000, 2},
    {"B¹ch Tr¹ch",   PackItemId(2,1,31229),"B¹ch Tr¹ch trë thµnh Thñ Hé §å §»ng míi cña bang.", 4500, 3, 9000, 2},
    {"Vâ Th¸nh",   PackItemId(2,1,31230),"Vâ Th¸nh trë thµnh Thñ Hé §å §»ng míi cña bang, phóc lîi bang héi t¨ng.", 6000, 3, 12000, 3},
}

 TongExt_SHOP_INFO = {
     [1] = {3097,"TiÖm Phóc Lîi Bang CÊp 1"},
     [2] = {3098,"TiÖm Phóc Lîi Bang CÊp 2"},
     [3] = {3099,"TiÖm Phóc Lîi Bang CÊp 3"},
 }

 TongExt_TOTEM_BOSS_SOUL = {
    {"tong_juxiangzhihun","Cù T­îng Chi Hån",{ 301,304,308 }},
    {"tong_tongbiyuanzhihun","Th«ng TÝ Viªn Chi Hån",{201,203,205}},
    {"tong_zhujianzhihun","Gia KiÒn Chi Hån",{105,108}},
    {"tong_lingjiuzhihun","Linh Tùu Chi Hån",{401}},
    {"tong_hunxianzhihun","Hå Tiªn Chi Hån",{218}},
    {"tong_zhujiuyinzhihun","Chóc Cöu ¢m Chi Hån",{406}},
    {"tong_jialouluozhihun","Phông Hoµng Chi Hån",{106}},
    {"tong_fengxizhihun","Phong Hi Chi Hån",{504}},
    {"tong_baizezhihun","B¹ch Tr¹ch Chi Hån",{402}},
    {"tong_wushenzhihun","Vâ Th¸nh Chi Hån",{507}},
}

TongExt_ROB_TOTEM_BOSS_GET_CASH = {  -- ÇÀ±ðµÄ°ï»áµÄÍ¼ÌÚÊÞ¿ÉÒÔÎª×Ô¼º°ï»áÌá¹©×Ê½ð
    12,
    25,
    37,
    75,
    150,
    300,
    600,
    600,
    600,
    1000,
}

 TongExt_BOSS_SOUL_LIFETIME = 60*30
-----------------------Tong Extension Gift-----------------------
 TongExt_TONG_GIFT = {
    { "Ph¸t tÆng Phóc Lîi cÊp 1 (Tiªu hao 1000 ng©n quü bang héi)", 1000, 4 ,"Tói Quµ Phóc Lîi Bang CÊp 1" ,"tong_free1", {2, 1, 31208} },
    { "Ph¸t tÆng Phóc Lîi cÊp 2 (Tiªu hao 2000 ng©n quü bang héi)", 2000, 7 ,"Tói Quµ Phóc Lîi Bang CÊp 2" ,"tong_free2", {2, 1, 31209} },
    { "Ph¸t tÆng Phóc Lîi cÊp 3 (Tiªu hao 3500 ng©n quü bang héi)", 3500, 10,"Tói Quµ Phóc Lîi Bang CÊp 3" ,"tong_free3", {2, 1, 31210} },
}

 TongExt_TONG_AWARD = {
     [PackItemId(2, 1, 31208)] = {"tong_free1"},
     [PackItemId(2, 1, 31209)] = {"tong_free2"},
     [PackItemId(2, 1, 31210)] = {"tong_free3"},
     [PackItemId(2, 1, 31231)] = {"4xingjinshe"},
 }
-- ¼ÇÂ¼ { npcidx ={ tongidx, endtime, nType, szTongName }  }
 TongExt_BOSS_BUFF = {}

-- ¼ÇÂ¼ { npcidx ={ tongid }  }
 TongExt_BOSS_SOUL_BUFF = {}


TongExt_BOSS_MATERIAL = {
	[PackItemId(2,0,737)] = {1, "Tö Quang Kim ThiÒn Ti",3481, 50},
	[PackItemId(2,0,736)] = {2, "Tö Quang Kú L©n Vò",3482, 50},
	[PackItemId(2,0,739)] = {3, "Th­îng Cæ Kú L©n HuyÕt",3483, 50},
	[PackItemId(2,0,738)] = {4, "M¶nh TiÖt Hoµnh Thó",3484, 50},
	[PackItemId(2,0,735)] = {5, "Tö Quang LiÖt DiÖm CÈm",3485, 50},
}
TongExt_BOSS_MATERIAL_IDX = {
    PackItemId(2,0,737),
    PackItemId(2,0,736),
    PackItemId(2,0,739),
    PackItemId(2,0,738),
    PackItemId(2,0,735),
}

TongExt_BOSS_TICKET_COST = {
    { 5,5,5,5,5 },
    { 10,10,10,10,10 },
    { 15,15,15,15,15 },
    { 30,30,30,30,30 },
    { 60,60,60,60,60 },
    { 120,120,120,120,120 },
    { 240,240,240,240,240 },
    { 480,480,480,480,480 },
    { 960,960,960,960,960 },
    { 1920,1920,1920,1920,1920 },
}

 
function handle_count_time()
    for k,v in TongExt_BOSS_BUFF do
        local nTongID  = v[1]
        local nResTime = v[2] - GetTime();
        local nType    = v[3]
        local szName   = TongExt_TOTEM_INFO[nType][1]
        local nOffset  = 60; -- ÅÐ¶ÏÊ±¼äµÄÎó²îÖµ
        if      nResTime <= 0   then  TongExt_BossOverTime(k)
        elseif  nResTime - 60 < nOffset and  nResTime - 60 >= 0  then  SendTongMessageByTongID(nTongID, format("%s muèn ch¹y trèn, h·y tranh thñ thêi gian trõ khö h¾n. (Cßn 1 phót )",szName))
        elseif  nResTime - 5*60 < nOffset and nResTime - 5*60 >= 0 then  SendTongMessageByTongID(nTongID, format("%s muèn ch¹y trèn, h·y tranh thñ thêi gian trõ khö h¾n. (Cßn 5 phót )",szName))
        elseif  nResTime - 10*60 < nOffset and nResTime - 10*60 >= 0  then  SendTongMessageByTongID(nTongID, format("%s muèn ch¹y trèn, h·y tranh thñ thêi gian trõ khö h¾n. (Cßn 10 phót )",szName))
        end
    end
end

function TongExt_ActionAward(nLiveness,nCash,szType)
    if nLiveness == 0 or nCash == 0 then 
        return
    end
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        return
    end
    local nCurLivenessPerWeek = GetTask(TongExt_TSKID_LIVENESSPERWEEK);
    local nPVPLiveness = floor(mod(nCurLivenessPerWeek , 10000))
    local nPVELiveness = floor(nCurLivenessPerWeek / 10000)
    local nTargetLiveness = nPVELiveness
    if szType == "PVP" then 
        nTargetLiveness = nPVPLiveness
    end
    local nLivenessAdd = nLiveness;
    if nTargetLiveness + nLiveness > TongExt_LIVENESSPERWEEK_LIMIT then
        nLivenessAdd = TongExt_LIVENESSPERWEEK_LIMIT - nTargetLiveness;
        if nLivenessAdd < 0 then
            nLivenessAdd = 0;
        end
    end
    if nLivenessAdd ~= nLiveness then
        Msg2Player(format("Do tuÇn nµy ®é tÝch cùc c¸ nh©n cña ho¹t ®éng %s ®· ®¹t giíi h¹n, ho¹t ®éng lÇn nµy nhËn ®­îc %d ®é tÝch cùc vµ t¨ng ng©n quü bang héi cïng møc cho bang héi. Còng cã thÓ ®Õn BiÖn Kinh [Qu¶n Gia Bang] nhËn thªm tÝch cùc c¸ nh©n vµ ng©n quü bang héi khi quyªn gãp.",szType,nLivenessAdd));
    else
        Msg2Player(format("Ho¹t ®éng lÇn nµy nhËn ®­îc %d ®é tÝch cùc vµ t¨ng ng©n quü bang héi cïng møc cho bang héi.",nLivenessAdd));
    end

    if szType == "PVP" then 
        nPVPLiveness = nPVPLiveness + nLivenessAdd
    else
        nPVELiveness = nPVELiveness + nLivenessAdd
    end
    local AfterLiveness = nPVELiveness * 10000 + nPVPLiveness
    SetTask(TongExt_TSKID_LIVENESSPERWEEK, AfterLiveness)

    TongExt_AddTongCash( nLivenessAdd,true )
    TongExt_AddLiveness( nLivenessAdd,true )
end

function TongExt_ActionCompleted(tEvent, data, para)
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        return
    end
    local nLiveness,nCash,szType = unpack(tEvent[4])
    TongExt_ActionAward(nLiveness, nCash, szType)
end

function TongExt_CreateTong()
    AddTongCash(TongExt_TONG_DEFAULT_CASH)            -- ÐÂ´´½¨µÄ°ï»áÖ±½Ó¸ø¼Ó100¿é
end

function TongExt_LeaveTong()
    --  ÍË°ïµÄÊ±ºò£¬É¾¹âÕÙ»½È¯ºÍÊÞ»ê
    for i = 1 ,getn(TongExt_BOSS_SUMMON_TICKET_IDX) do
        local nItem = TongExt_BOSS_SUMMON_TICKET_IDX[i];
        local g,d,p = UnPackItemId(nItem);
        local nCnt = BigGetItemCount(g,d,p);
        BigDelItem(g,d,p,nCnt);
    end
    for i = 1 ,getn(TongExt_TOTEM_INFO) do
        local nItem = TongExt_TOTEM_INFO[i][2];
        local g,d,p = UnPackItemId(nItem);
        local nCnt = BigGetItemCount(g,d,p);
        BigDelItem(g,d,p,nCnt);
    end
end

function TongExt_1v1_Award()
    local nCurBiwudahui = GetTask(TSK_CURWEEKMATCH)
    local nTimes = GetTask(TongExt_Activity_1v1_times) -- ÁìÈ¡µÄÊ¤³¡´ÎÊý
    TongExt_ActionAward(nCurBiwudahui - nTimes, nCurBiwudahui - nTimes, "PVP")
    SetTask(TongExt_Activity_1v1_times, nCurBiwudahui)
end

function TongExt_3v3_Award()
    local nCur3V3   = GetTask(TASKID_3V3_TOTAL_ROUND_DAILY)
    local nTimes = GetTask(TongExt_Activity_3v3_times) -- ÁìÈ¡µÄÊ¤³¡´ÎÊý
    SetTask(TongExt_Activity_3v3_times, nCur3V3)
    TongExt_ActionAward(nCur3V3 - nTimes, nCur3V3 - nTimes, "PVP")
end


t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskId, nAcessCode = 0},
   {id={"id_self_liveness", TongExt_TSKID_SELF_LIVENESS, TSKACCESSCODE_LIVENESS} }, 
   {id={"id_devotion_limit", TongExt_TSKID_DEVOTION_LIMIT, 0}, clear = "weekly" }, 
   {id={"id_liveness_per_week", TongExt_TSKID_LIVENESSPERWEEK, 0}, clear = "weekly" }, 
   {id={"id_rob_limit", TongExt_TSKID_ROB_LIMIT, 0}, clear = "daily" }, 
   {id={"id_handin_mat_limit_week1", 3481, 0}, clear = "weekly" }, 
   {id={"id_handin_mat_limit_week2", 3482, 0}, clear = "weekly" }, 
   {id={"id_handin_mat_limit_week3", 3483, 0}, clear = "weekly" }, 
   {id={"id_handin_mat_limit_week4", 3484, 0}, clear = "weekly" }, 
   {id={"id_handin_mat_limit_week5", 3485, 0}, clear = "weekly" }, 
   {id={"TongExt_Activity_1v1_times", TongExt_Activity_1v1_times, 0}, clear = "weekly" }, 
   {id={"TongExt_Activity_3v3_times", TongExt_Activity_3v3_times, 0}, clear = "daily" }, 
   
}

t_isolate_user_batch_watch_list = { 
    {"event_server_tick_minute",{1},handle_count_time,{ }},
    -- {"event_mission_affairs", {"3v3", "finished", 0}, TongExt_ActionCompleted,{ 1, 1, "PVP" }  },
    {"event_mission_affairs", {"newbattle", "resourcefinished", 0}, TongExt_ActionCompleted,{ 5, 5, "PVP" }  },
    -- {"event_mission_award", {"biwudahui", -1, -1, 0}, TongExt_ActionCompleted,{ 1, 1, "PVP" }  },
    {"event_mission_award", {"tianmenzhen", -1, -1, 0}, TongExt_ActionCompleted,{ 5, 5, "PVP" }  },
	{"event_mission_award", {"kfbattle", -1, -1, 0}, TongExt_ActionCompleted,{ 5, 5, "PVP" }  },
    
	{"event_mission_stage_finish", {"dixuangong", 3}, TongExt_ActionCompleted,{ 1, 1, "PVE" }  },
	{"event_mission_stage_finish", {"wanjianzhong", 4}, TongExt_ActionCompleted,{ 1, 1, "PVE" }  },
	{"event_mission_stage_finish", {"taiyi", 6}, TongExt_ActionCompleted,{ 2, 2, "PVE" }  },
    {"event_mission_stage_finish", {"taiyihero", 6}, TongExt_ActionCompleted,{ 4, 4, "PVE" } },	---Ó¢ÐÛÌ«Ò»ËþÍ¨¹ý×îºóÒ»¹Ø 200 ²ÄÁÏ3
	{"event_mission_stage_finish", {"liangshan", 4}, TongExt_ActionCompleted,{ 1, 1, "PVE" }  },
	{"event_mission_stage_finish", {"jiandangyanyun", 5}, TongExt_ActionCompleted,{ 2, 2, "PVE" }  },
	{"event_mission_stage_finish", {"jiandangyanyun", 6}, TongExt_ActionCompleted,{ 2, 2, "PVE" }  },


    {"event_player_tong_operation", {"create",-1,-1}, TongExt_CreateTong, },
    {"event_player_tong_operation", {"leave",-1,-1}, TongExt_LeaveTong, },
    
}


function on_add_watches()
    for k,v in TongExt_BOSS_SUMMON_TICKET do
        local g,d,p = UnPackItemId(k)
        isolate_watch_item_talk(g,d,p, "TongExt_OnUseTicket")
    end
    for k,v in TongExt_TOTEM_BOSS_SOUL do
        local tMaps = v[3];
        for i = 1,getn(tMaps) do
            isolate_watch_npc_talk(v[2], tMaps[i], "TongExt_Talk2BossSoul");
        end
    end
    for k,v in TongExt_TONG_AWARD do
        local g,d,p = UnPackItemId(k)
        isolate_watch_item_talk(g,d,p, "TongExt_OnUseGift")
    end
end

function TongExt_OnUseGift(nIndex)
    local g,d,p = GetItemInfoByIndex(nIndex)
    local nId = PackItemId(g,d,p)
    local t = TongExt_TONG_AWARD[nId]
    if t then
       local szAward = t[1]
       if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
           return 0
       end
       if DelItemByIndex(nIndex, 1) == 1 then
           if CustomAwardGiveGroup(szAward, 0) > 0 then   --¶þºÅ²ÎÊýÎªÊÇ·ñ¸øÓèÈ«²¿½±Àø
              return 1
           else
              AddItem(g,d,p, 1,4)
           end
       end
    end
end



function TongExt_Talk2BossSoul(nPara)
    local nBossSoul = GetTargetNpc();
    local szNpcName = GetTargetNpcName();
    local tongId = TongExt_BOSS_SOUL_BUFF[tostring(nBossSoul)][1];
    local nType = TongExt_BOSS_SOUL_BUFF[tostring(nBossSoul)][2];
    if GetTongID() ~= tongId then
        Talk(1,"","Thó Hån nµy trë nªn b×nh tÜnh vui vÎ, kh«ng cßn hung ¸c nh­ tr­íc. H×nh nh­ nã ®ang nãi g× ®ã, nh­ng tiÕc lµ ng­¬i kh«ng thÓ hiÓu ®­îc.")
        return 
    end
    local nDuty = GetTongDuty();
    if nDuty > 3 or nDuty < 0 then
		Talk(1,"",format("<color=gold>%s:<color>%s", GetTargetNpcName(), "C¸m ¬n mäi ng­êi ®· gióp ta tho¸t khái sù thï hËn, ta cã mãn quµ muèn tÆng, h·y nãi bang chñ hoÆc tr­ëng l·o ®Õn ®©y, h×nh th¸i cña ta kh«ng thÓ duy tr× qu¸ l©u."))
		return
	end
    local szTitle = format("<color=gold>%s:<color>%s", GetTargetNpcName(), "C¸m ¬n c¸c ng­¬i ®· gióp ta tho¸t khái sù thï hËn, ta sÏ tÆng Thó Hån cho c¸c ng­¬i, hy väng søc m¹nh cña nã gióp Ých cho bang cña ng­¬i.");
    local tbSay = {}
    tinsert(tbSay,format("NhËn Thó Hån/#TongExt_GetBossSoul(%d)",nType))
    tinsert(tbSay,"Hñy bá/nothing")
    Say(szTitle,getn(tbSay),tbSay);
end

function TongExt_GetBossSoul( nType )
    local nBossSoul = GetTargetNpc();
    if nBossSoul == nil or nBossSoul <= 0 or TongExt_BOSS_SOUL_BUFF[tostring(nBossSoul)] == nil then
        Talk(1,"","Thó Hån ®· biÕn mÊt......")
        return
    end
    if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
		return 
	end
    local g,d,p = UnPackItemId(TongExt_TOTEM_INFO[nType][2]);
    SetNpcLifeTime(nBossSoul,0);
    AddItem(g,d,p,1);
    SendTongMessage(format("%s ®· nhËn Thó Hån cÊp %d.",GetName(),nType));
    TongExt_BOSS_SOUL_BUFF[tostring(nBossSoul)] = nil;
end

function TongExt_GetTaskByDecimal(nTskID, nPos)
    if nPos <= 0 or nPos > 9 then
        print("[error] TongExt_SetTaskByDecimal can not call by param nPos = %d\n",nPos);
        return 
    end
    local nTskVar = GetTask(nTskID)
    local nFlag = 10^(nPos - 1)
    local nRes = mod(floor(nTskVar / nFlag), 10);
    return nRes;
end

function TongExt_SetTaskByDecimal(nTskID, nPos, nVar)
    if nPos <= 0 or nPos > 9 then
        print("[error] TongExt_SetTaskByDecimal can not call by param nPos = "..nPos);
        return 
    end
    if nVar < 0 or nVar > 9 then
        print("[error] TongExt_SetTaskByDecimal can not call by param nVar = "..nVar);
        return 
    end
    local nTskVar = GetTask(nTskID)
    local nFlag = 10^(nPos - 1)
    local nCurRes = mod(floor(nTskVar / nFlag), 10);
    nTskVar = nTskVar + (nVar - nCurRes) * nFlag;
    SetTask(nTskID, nTskVar)
end

function TongExt_DevotionTalk()
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        Talk(1,"",format("<color=gold>%s:<color>%s", GetTargetNpcName(), "Kh«ng ph¶i thµnh viªn bang, h·y gia nhËp 1 bang."))
        return
    end
    local szTitle = format("<color=gold>%s:<color>%s", GetTargetNpcName(), "VËt phÈm d­íi ®©y cã thÓ gãp, c¸ nh©n nhËn ®­îc ®é tÝch cùc, bang nhËn ®­îc ng©n quü bang héi")
    local tbSay = {}
    for i = 1, getn(TongExt_DEVOTION_CONFIG) do
        local tbDevotion = TongExt_DEVOTION_CONFIG[i]
        local nTimes = TongExt_GetTaskByDecimal(TongExt_TSKID_DEVOTION_LIMIT, i)
        tinsert( tbSay,format("Gãp %d %s, nhËn ®­îc %d ®é tÝch cùc, t¨ng cho bang héi %d ®iÓm ng©n quü bang héi. (Cßn %d/%d lÇn)/#TongExt_Devote(%d)", tbDevotion[2][4], tbDevotion[1], tbDevotion[3], tbDevotion[4], nTimes, tbDevotion[5], i) )
    end
    tinsert( tbSay,"T¹m biÖt!/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function TongExt_Devote( nType )
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        Talk(1,"",format("<color=gold>%s:<color>%s", GetTargetNpcName(), "Kh«ng ph¶i thµnh viªn bang, h·y gia nhËp 1 bang."))
        return
    end
    local nTimes = TongExt_GetTaskByDecimal(TongExt_TSKID_DEVOTION_LIMIT, nType)
    local tbDevotion = TongExt_DEVOTION_CONFIG[nType]
    if nTimes >= tbDevotion[5] then
        Talk(1,"",format("<color=gold>%s:<color>%s", GetTargetNpcName(), "Sè lÇn gãp tuÇn nµy ®· ®Çy, tuÇn sau h·y gãp tiÕp."))
        return
    end
    local nCount = GetItemCount(tbDevotion[2][1],tbDevotion[2][2],tbDevotion[2][3])
    if nCount < tbDevotion[2][4] then
        Talk(1,"",format("<color=gold>%s:<color> %s kh«ng ®ñ, h·y mang ®ñ %d råi ®Õn.", GetTargetNpcName(), tbDevotion[1], tbDevotion[2][4]))
        return
    end
    if DelItem(tbDevotion[2][1],tbDevotion[2][2],tbDevotion[2][3],tbDevotion[2][4]) ~= 1 then
        Talk(1,"",format("<color=gold>%s:<color> Gãp thÊt b¹i, h·y thö l¹i sau.", GetTargetNpcName()))
        return
    end
    TongExt_SetTaskByDecimal(TongExt_TSKID_DEVOTION_LIMIT, nType, nTimes+1);
    TongExt_AddLiveness( tbDevotion[3] )
    TongExt_AddTongCash( tbDevotion[4] )
    SendTongMessage(format("%s ®· tÆng %d %s, nhËn ®­îc %d ®é tÝch cùc bang héi, t¨ng cho bang héi %d ®iÓm ng©n quü bang héi",GetName(),tbDevotion[2][4],tbDevotion[1],tbDevotion[3],tbDevotion[4]))
    TongExt_DevotionTalk()
end


function TongExt_AddLiveness( nVar, withoutMsg )
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        return
    end
    local nCurSelfLiveness = GetTask(TongExt_TSKID_SELF_LIVENESS);
    local nNewSelfLiveness = nCurSelfLiveness + nVar;
    local nRealAddition    = nVar
    if nNewSelfLiveness < 0 then nVar = 0 end
    if nNewSelfLiveness > TongExt_MAX_SELF_LIVENESS then 
        nNewSelfLiveness = TongExt_MAX_SELF_LIVENESS 
        Msg2Player("TÝch cùc c¸ nh©n ®· ®¹t giíi h¹n.")
    end
    if withoutMsg == nil then 
        Msg2Player(format("B¹n nhËn ®­îc %d ®é tÝch cùc bang héi.",nVar))
    end
    SetSelfLiveness(nNewSelfLiveness);
    AddTongLiveness(nVar);
end

function TongExt_AddTongCash( nVar, withoutMsg )
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        return
    end
    local nCash = GetTongCash();
    local nAddCash = nVar
    if nCash + nVar > TongExt_TONG_MAX_CASH then
        nAddCash = TongExt_TONG_MAX_CASH - nCash;
    end
    AddTongCash(nAddCash);
    if withoutMsg ~= nil then
        return -- ²»ÒªÐÅÏ¢
    end
    if nAddCash == nVar then
        Msg2Player(format("Bang héi cña b¹n nhËn ®­îc %d ®iÓm ng©n quü bang héi.",nVar))
    else
        Msg2Player(format("Bang héi cña b¹n nhËn ®­îc %d ®iÓm ng©n quü bang héi. Ng©n quü bang héi ®· ®¹t giíi h¹n.",nAddCash))
    end
end



function TongExt_OnUseTicket( nIndex )
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        Msg2Player("Kh«ng ph¶i thµnh viªn bang héi, kh«ng thÓ sö dông TriÖu Gäi Phï.")
        return
    end
    local nDuty = GetTongDuty();
    if nDuty > 3 or nDuty < 0 then
		Talk(1,"","ChØ bang chñ, phã bang vµ tr­ëng l·o ®­îc sö dông TriÖu Gäi Phï!");
		return 0;
	end
    local m,x,y = GetWorldPos();
    local g,d,p = GetItemInfoByIndex( nIndex );
    local nPackedId = PackItemId(g,d,p);
    local tBossTicket = TongExt_BOSS_SUMMON_TICKET[nPackedId];
    local nBossType = tBossTicket[4];
    local tlegalMap = TongExt_TOTEM_BOSS_SOUL[nBossType][3]
    local nCurTotemType, _ = GetTongTotem()

    if nCurTotemType + 1 < nBossType then
        Talk(1,"",format("Bang héi cña b¹n cÇn cã %s §å §»ng míi ®­îc sö dông TriÖu Gäi Phï nµy.",TongExt_TOTEM_INFO[nBossType - 1][1]))
        return
    end
    local legalMap = 0;
    for i = 1,getn(tlegalMap) do
        if m == tlegalMap[i] then
            legalMap = 1;
            break
        end
    end
    if legalMap ~= 1 then
        Talk(1,"",format("Kh«ng thÓ gäi %s ë khu vùc nµy!",tBossTicket[3]));
		return 0;
    end
    if DelItemByIndex( nIndex,1 )~= 1 then
        Msg2Player("Gäi bÞ lçi, h·y thö l¹i sau.")
        return
    end
    local nNpcIdx = CreateNpc(tBossTicket[2],tBossTicket[3],m,x,y);
    local nEndTime = GetTime() + TongExt_BOSS_LIVE_TIME;
    local szTongName = GetTongName();
    SetNpcDeathScript(nNpcIdx, TongExt_szThisFile);
    TongExt_BOSS_BUFF[tostring(nNpcIdx)] = {nTongId, nEndTime, tBossTicket[4], szTongName}; -- »º´æ¼ÇÂ¼bossÐÅÏ¢
    local szGlobalMsg = format("Bang %s t¹i %s ®· gäi Thñ Hé Thó %s, h·y mau thu phôc!",szTongName ,GetMapName(m), tBossTicket[3]);
    Msg2Global(szGlobalMsg)
    AddGlobalNews(szGlobalMsg, 1);
    SendTongMessage(format("%s t¹i %s ®· gäi Thñ Hé Thó %s, mäi ng­êi mau thu phôc!",GetName(),GetMapName(m),tBossTicket[3]))
end

function TongExt_BossOverTime( nIndex )
    local nBossTongIdx = TongExt_BOSS_BUFF[tostring(nIndex)][1];
    local nType = TongExt_BOSS_BUFF[tostring(nIndex)][3]
    local szBossName = TongExt_TOTEM_INFO[nType][1]
    local szTongName = TongExt_BOSS_BUFF[tostring(nIndex)][4];
    SetNpcLifeTime(nIndex , 0)
    TongExt_BOSS_BUFF[tostring(nIndex)] = nil;
    -- SendTongMessageByTongID(nBossTongIdx,"Boss Run Awary")
    Msg2Global(format("Bang héi %s ch­a thÓ ®¸nh b¹i %s, nã ®· trèn tho¸t.", szTongName, szBossName))
end

function TongExt_GiveGiftTalk()
    local nTongId = GetTongID()
    local szNpcName = GetTargetNpcName();
    local nTotemType, _ = GetTongTotem();
    local nNeedTotemLv = TongExt_TONG_GIFT[1][3];
    if nTongId == 0 or nTongId == nil then
        Talk(1,"",format("<color=gold>%s:<color>%s", szNpcName, "Kh«ng ph¶i thµnh viªn bang"))
        return
    end
    local nDuty = GetTongDuty();
    if nDuty > 3 or nDuty < 0 then
        Talk(1,"",format("<color=gold>%s:<color>%s", szNpcName, "Muèn phóc lîi bang, h·y nãi tr­ëng l·o hoÆc bang chñ tíi gÆp ta."))
		return
	end
    if nTotemType < nNeedTotemLv then
        Talk(1,"",format("<color=gold>%s:<color>%s", szNpcName, "CÊp §å §»ng Bang qu¸ thÊp, ch­a thÓ ph¸t phóc lîi bang."))
        return 
    end
    local szTitle = format("<color=gold>%s:<color>%s", szNpcName, "Nay bang héi ngµy mét ph¸t triÓn, cã thÓ ph¸t phóc lîi cho bang chóng. Ng­¬i thÊy sao? (Bang nhËn ®­îc Thñ Hé Thó Linh Tùu trë lªn míi cã thÓ ph¸t)")
    local tbSay = {}
    
    for i = 1, getn(TongExt_TONG_GIFT) do
        local tGift = TongExt_TONG_GIFT[i];
        if tGift[3] <= nTotemType then
            tinsert(tbSay, format("%s/#TongExt_GiveGift(%d)",tGift[1],i))
        end
    end
    tinsert(tbSay, "Hñy bá/nothing")
    Say( szTitle, getn(tbSay), tbSay )
end

function TongExt_GiveGift( nType )
    local szNpcName = GetTargetNpcName();
    local tGift = TongExt_TONG_GIFT[nType];
    local nCurCash = GetTongCash();
    local nCashCost = tGift[2];
    local nTotemType, _ = GetTongTotem();
    if nCurCash <  nCashCost + TongExt_TOTEM_INFO[nTotemType][4] then
        Talk(1,"",format("<color=gold>%s:<color> Ng©n quü bang héi kh«ng ®ñ, h·y t¹m g¸c l¹i chuyÖn phóc lîi bang chóng. (Sau khi ph¸t phóc lîi, quü cßn l¹i cã thÓ tiªu hao cho tuÇn sau)", szNpcName ))
        return
    end
    local szFun = format("TongExt_GiveGift_CB%d",nType);
    AddTongCash( -nCashCost, TongExt_szThisFile, szFun);
end
function TongExt_GiveGift_CB1( bSuc,nCash )
    if bSuc == 1 then
        SendGift2TongMember(1);
        AddRuntimeStat(52,1,0,1)
    end
end
function TongExt_GiveGift_CB2( bSuc,nCash )
    if bSuc == 1 then
        SendGift2TongMember(2);
        AddRuntimeStat(52,2,0,1)
    end
end
function TongExt_GiveGift_CB3( bSuc,nCash )
    if bSuc == 1 then
        SendGift2TongMember(3);
        AddRuntimeStat(52,3,0,1)
    end
end

function TongExt_OnChangeTotemBtnClick()
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        Talk(1,"","Kh«ng ph¶i thµnh viªn bang")
        return
    end
    local nDuty = GetTongDuty();
    if nDuty > 3 or nDuty < 0 then
        Talk(1,"","ChØ tr­ëng l·o trë lªn míi ®­îc t¨ng cÊp §å §»ng.")
		return 0;
	end
    local nTotemType = GetTongTotem()
    if nTotemType >= getn(TongExt_TOTEM_INFO) then
        Talk(1,"","§å §»ng ®· ®¹t cÊp cao nhÊt.")
        return 
    end
    local szNextName = TongExt_TOTEM_INFO[nTotemType+1][1]
    local szTitle = format("Bang héi ngµy cµng phån vinh, nÕu lÊy ®­îc hån ph¸ch cña <color=red>%s<color>, bang héi sÏ cµng thÞnh v­îng.", szNextName)
    local g,d,p = UnPackItemId( TongExt_TOTEM_INFO[nTotemType + 1][2] )
    local nSoulCnt = GetItemCount(g,d,p);
    local tbSay = {}
    if nSoulCnt > 0 then
        tinsert(tbSay, format("Ta ®· lÊy hån %s, muèn ®æi Thñ Hé §å §»ng Bang (Tiªu hao %d ng©n quü bang héi)/#TongExt_ChangeTotem(%d)",szNextName,TongExt_TOTEM_INFO[nTotemType+1][6],nTotemType+1))
    end
    tinsert(tbSay, "Ta ®Õn xem Thñ Hé §å §»ng/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function TongExt_ChangeTotem(nType)
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        Talk(1,"","Kh«ng ph¶i thµnh viªn bang")
        return
    end
    local nDuty = GetTongDuty();
    if nDuty > 3 or nDuty < 0 then
        Talk(1,"","ChØ tr­ëng l·o trë lªn míi ®­îc t¨ng cÊp §å §»ng.")
		return 0;
	end
    local nCurCash = GetTongCash()
    if nCurCash < TongExt_TOTEM_INFO[nType][6] then
        Talk(1,"",format("T¨ng Thñ Hé §å §»ng cÇn tèn %d ng©n quü bang héi.",TongExt_TOTEM_INFO[nType][6]))
		return 0;
    end
    local szFun = format("TongExt_ChangeTotemCB%d",nType);
    AddTongCash(-TongExt_TOTEM_INFO[nType][6], TongExt_szThisFile, szFun);
end
function TongExt_ChangeTotemCB( bSuc,nType )
    if bSuc == 0 then
        Talk(1,"","Trõ ng©n quü bang héi thÊt b¹i, h·y thö l¹i")
        return
    end
    local g,d,p = UnPackItemId( TongExt_TOTEM_INFO[nType][2] )
    if DelItem(g,d,p,1) ~= 1 then
        Talk(1,"","T¨ng §å §»ng thÊt b¹i, h·y x¸c nhËn trong tói cã linh hån §å §»ng cÊp nµy.")
        return
    end
    SetTongTotem(nType, nType);
    SendTongMessage(TongExt_TOTEM_INFO[nType][3]);
    PostOneTongEventMsg(TongExt_TOTEM_INFO[nType][3])
    if nType >= 3 then
        Msg2Global(format("Bang %s ®· ®¸nh b¹i %s vµ coi nã lµ Thñ Hé §å §»ng",GetTongName(),TongExt_TOTEM_INFO[nType][1]))
    end
    AddRuntimeStat(51, nType, 0, 1) --¿ªÆôÍ¼ÌÚ´ÎÊýÍ³¼Æ
    local nGiftType = TongExt_TOTEM_INFO[nType][7]
    AddRuntimeStat(52,nGiftType,0,1)
    SendGift2TongMember(nGiftType);                 -- ±ä¸üÍ¼ÌÚºó·¢Àñ°ü
end
function TongExt_ChangeTotemCB1(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,1) end
function TongExt_ChangeTotemCB2(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,2) end
function TongExt_ChangeTotemCB3(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,3) end
function TongExt_ChangeTotemCB4(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,4) end
function TongExt_ChangeTotemCB5(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,5) end
function TongExt_ChangeTotemCB6(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,6) end
function TongExt_ChangeTotemCB7(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,7) end
function TongExt_ChangeTotemCB8(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,8) end
function TongExt_ChangeTotemCB9(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,9) end
function TongExt_ChangeTotemCB10(bSuc,nRes) TongExt_ChangeTotemCB(bSuc,10) end

function OnDeath(index)
    local nBossTongIdx = TongExt_BOSS_BUFF[tostring(index)][1];
    local nType = TongExt_BOSS_BUFF[tostring(index)][3];
    local szBossName = TongExt_TOTEM_INFO[nType][1]
    local m, x, y = GetNpcWorldPos(index);
    local szKillMsg = ""
    if nBossTongIdx == nil then
        WriteLog("[TongExtention] Player:"..GetName().." Killed Boss with tong id = nil")
        return
    end
    local nSlayerTongIdx = GetTongID();
    if nBossTongIdx == nSlayerTongIdx then -- °ï»á³ÉÔ±»÷É±
        szKillMsg = format("Bang %s ®· ®¸nh b¹i %s, dòng sÜ ra ®ßn cuèi lµ %s",GetTongName(),szBossName,GetName());
        PostOneTongEventMsg(format("Bang héi ®· ®¸nh b¹i [%s], dòng sÜ ra ®ßn cuèi lµ [%s]",szBossName,GetName()  ));
        local tSoulInfo = TongExt_TOTEM_BOSS_SOUL[nType];
        local nBossSoul = CreateNpc(tSoulInfo[1],tSoulInfo[2],m,x,y);
        TongExt_BOSS_SOUL_BUFF[tostring(nBossSoul)] = {nSlayerTongIdx,nType};
        SetNpcLifeTime(nBossSoul,TongExt_BOSS_SOUL_LIFETIME);
        Msg2Global(szKillMsg);
        -- SetLastKillTotem(nType); -- ÓÃÎïÆ·ÅÐ¶ÏÍ¼ÌÚÉý¼¶£¬Òò´ËÕâ¸ö²»ÐèÒªÁË
    else                              -- ÍâÈËÇÀ¹Ö
        szKillMsg = format("§¸ng ghÐt! [%s] ®· diÖt [%s], thï nµy ph¶i tr¶!", GetName(), szBossName)
        Msg2Global(format("Gi÷a ®­êng diÖt %s, diÖt bang %s gäi ra-%s!", GetName(), TongExt_BOSS_BUFF[tostring(index)][4], szBossName));
        SendTongMessageByTongID(nBossTongIdx, szKillMsg);
        if nSlayerTongIdx == 0 or nSlayerTongIdx == nil then
            -- ÇÀ¹ÖÕß²¢Ã»ÓÐ°ï»á£¬Ã»ÓÐÇÀ¹Ö½±Àø¡£
            return 
        end
        if GetTask(TongExt_TSKID_ROB_LIMIT) == 0 then
            TongExt_AddLiveness(12);
        end
        SetTask(TongExt_TSKID_ROB_LIMIT,1)
        TongExt_AddTongCash(TongExt_ROB_TOTEM_BOSS_GET_CASH[nType]);
        SendTongMessage(format("[%s] ®· diÖt bang [%s] gäi ra-[%s], bang chóng ®­îc %d ng©n quü bang héi!",
            GetName(),
            TongExt_BOSS_BUFF[tostring(index)][4],
            szBossName,
            TongExt_ROB_TOTEM_BOSS_GET_CASH[nType]))
    end
    TongExt_BOSS_BUFF[tostring(index)] = nil;
    SetNpcLifeTime(index , 3)
end



function TongExt_OnGiftShopBtnClick()
    local nType,_ = GetTongTotem();
    if nType < 1 then
        Talk(1,"","Bang cña b¹n vÉn ch­a cã Thñ Hé §å §»ng, nªn ch­a më TiÖm Phóc Lîi.")
        return 
    end
    local nShop = TongExt_TOTEM_INFO[nType][5];
    local szTitle = "Bang hiÖn t¹i cã thÓ më tiÖm:"
    local tSay = {}
    for i = 1,nShop do
        local tShopinfo = TongExt_SHOP_INFO[i];
        tinsert(tSay,format("%s/#TongExt_OnGiftShopConfirm(%d, \'%s\')",tShopinfo[2],tShopinfo[1],tShopinfo[2]))
    end
    tinsert(tSay,"trë l¹i/nothing");
    Say(szTitle,getn(tSay),tSay);
end

function TongExt_OnGiftShopConfirm(nType, szName)
    SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", nType, szName or ""))
end

function TongExt_OnTongSkillBtnClick()
    print("TODO TongExt_OnTongSkillBtnClick")
end


function TongExt_OnTongHandInBtnClick(nType)
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        Talk(1,"","Kh«ng ph¶i thµnh viªn bang")
        return
    end
    local nItem = TongExt_BOSS_MATERIAL_IDX[nType];
    local g,d,p = UnPackItemId(nItem);
    local nCount = GetItemCount(g,d,p);
    local szItemName = TongExt_BOSS_MATERIAL[nItem][2];
    
    if nCount <= 0 then
        Talk(1,'',format("%s mang theo kh«ng ®ñ.",szItemName))
        return
    end
    local nCurGive = GetTask(TongExt_BOSS_MATERIAL[nItem][3])
    if nCurGive >= TongExt_BOSS_MATERIAL[nItem][4] then
        Talk(1,"",format("Sè l­îng nép trong tuÇn ®· ®¹t giíi h¹n (%d), kh«ng thÓ nép n÷a.",TongExt_BOSS_MATERIAL[nItem][4]))
        return
    end
    local nMax = min(nCount, TongExt_BOSS_MATERIAL[nItem][4]-nCurGive)
    AskClientForNumber(format("TongExt_OnTongHandInBtnClickCB_%d",nType), 1, nMax, "Nép bao nhiªu?",97);
end

function TongExt_OnTongHandInBtnClickCB_1(nNum) TongExt_OnTongHandInBtnClickCB(1,nNum) end
function TongExt_OnTongHandInBtnClickCB_2(nNum) TongExt_OnTongHandInBtnClickCB(2,nNum) end
function TongExt_OnTongHandInBtnClickCB_3(nNum) TongExt_OnTongHandInBtnClickCB(3,nNum) end
function TongExt_OnTongHandInBtnClickCB_4(nNum) TongExt_OnTongHandInBtnClickCB(4,nNum) end
function TongExt_OnTongHandInBtnClickCB_5(nNum) TongExt_OnTongHandInBtnClickCB(5,nNum) end

function TongExt_AddTotemMaterialByType(nType,nNum,szPath,szFun)
    local tAdd = {0,0,0,0,0};
    tAdd[nType] = nNum;
    AddTotemMaterial(tAdd[1],tAdd[2],tAdd[3],tAdd[4],tAdd[5],szPath,szFun);
end

function TongExt_OnTongHandInBtnClickCB(nType,nNum)
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        Talk(1,"","Kh«ng ph¶i thµnh viªn bang")
        return
    end
    local nItem = TongExt_BOSS_MATERIAL_IDX[nType];
    local g,d,p = UnPackItemId(nItem)
    local nCurGive = GetTask(TongExt_BOSS_MATERIAL[nItem][3])
    if nCurGive + nNum > TongExt_BOSS_MATERIAL[nItem][4] then
        Talk(1,"",format("Sè l­îng nép trong tuÇn ®· ®¹t giíi h¹n (%d), kh«ng thÓ nép n÷a.",TongExt_BOSS_MATERIAL[nItem][4]))
        return
    end
    if DelItem(g,d,p,nNum) ~= 1 then
        Talk(1,"","Nép thÊt b¹i, h·y thö l¹i")
        return
    end
    SetTask(TongExt_BOSS_MATERIAL[nItem][3],nCurGive+nNum);
    TongExt_AddLiveness(nNum);
    TongExt_AddTongCash(nNum);
    TongExt_AddTotemMaterialByType(nType,nNum,"","");
end


function TongExt_BuyBossTicket( nVar )
    local nTongId = GetTongID();
    local szNpcName = GetTargetNpcName();
    if nTongId == 0 or nTongId == nil then
        Talk(1,"",format("<color=gold>%s:<color> Kh«ng ph¶i thµnh viªn bang",szNpcName ))
        return
    end
    local nTongDuty = GetTongDuty()
    if nTongDuty < 0 or nTongDuty > 3 then
        Talk(1,"",format("<color=gold>%s:<color> ChØ cã chøc vÞ tr­ëng l·o trë lªn míi ®­îc mua TriÖu Gäi Phï.", szNpcName))
        return
    end
    local nMaxTotem,_ = GetTongTotem()
    if nMaxTotem < getn(TongExt_BOSS_SUMMON_TICKET_IDX) then
        nMaxTotem = nMaxTotem + 1;
    end
    local szTitle = format("<color=gold>%s:<color> Bang hiÖn t¹i cã thÓ mua TriÖu Gäi Phï sau.", szNpcName)
    local tbSay = {}
    for i = 1, nMaxTotem do
        local nTicket = TongExt_BOSS_SUMMON_TICKET_IDX[i];
        local szTicketName = TongExt_BOSS_SUMMON_TICKET[nTicket][1];
        local szBossName = TongExt_BOSS_SUMMON_TICKET[nTicket][3];
        tinsert(tbSay,format("%s(%s)/#TongExt_BuyBoss(%d)",szTicketName,szBossName,i));
    end
    tinsert(tbSay,"Hñy bá/nothing");
    Say( szTitle,getn(tbSay),tbSay )
end

function TongExt_BuyBoss( nType )
    local szNpcName = GetTargetNpcName();
    local nTicket = TongExt_BOSS_SUMMON_TICKET_IDX[nType];
    local szTicketName = TongExt_BOSS_SUMMON_TICKET[nTicket][1];
    local tCost = TongExt_BOSS_TICKET_COST[nType]
    local szTitle = format("<color=gold>%s:<color> Muèn mua %s bang ph¶i cã nguyªn liÖu sau:\n",szNpcName,szTicketName )
    for i = 1,getn(TongExt_BOSS_MATERIAL_IDX) do
        local tMat = TongExt_BOSS_MATERIAL[TongExt_BOSS_MATERIAL_IDX[i]];
        szTitle = format("%s%s", szTitle, format("      <color=yellow>%s<color>:<color=red>%d<color>\n",tMat[2],tCost[i]) )
    end
    local tbSay = {}
    tinsert(tbSay,format("X¸c ®Þnh /#TongExt_BuyBossConfirm(%d)",nType))
    tinsert(tbSay,"Hñy bá/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function TongExt_BuyBossConfirm( nType )
    local nTongId = GetTongID();
    local szNpcName = GetTargetNpcName();
    if nTongId == 0 or nTongId == nil then
        Talk(1,"",format("<color=gold>%s:<color> Kh«ng ph¶i thµnh viªn bang",szNpcName ))
        return
    end
    local nTongDuty = GetTongDuty()
    if nTongDuty < 0 or nTongDuty > 3 then
        Talk(1,"",format("<color=gold>%s:<color> ChØ cã chøc vÞ tr­ëng l·o trë lªn míi ®­îc mua TriÖu Gäi Phï.", szNpcName))
        return
    end
    if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
		return 
	end
    local tAdd = TongExt_BOSS_TICKET_COST[nType];
    AddTotemMaterial(-tAdd[1],-tAdd[2],-tAdd[3],-tAdd[4],-tAdd[5],TongExt_szThisFile,"TongExt_BuyBossConfirmCB",nType);
end

function TongExt_BuyBossConfirmCB(bSuc,nRes1,nRes2,nRes3,nRes4,nRes5,nType)
    local szNpcName = GetTargetNpcName();
    if bSuc ~= 1 then
        Talk(1,"",format("<color=gold>%s:<color> §æi thÊt b¹i, h·y kiÓm tra bang héi xem cã ®ñ nguyªn liÖu ch­a.",szNpcName))
        return
    end
    local nItem = TongExt_BOSS_SUMMON_TICKET_IDX[nType];
    local szItemName = TongExt_BOSS_SUMMON_TICKET[nItem][1];
    local g,d,p = UnPackItemId(nItem)
    AddRuntimeStat(53, nType, 0, 1) --¹ºÂò´ÎÊýÍ³¼Æ
    gf_AddItemEx({g,d,p,1}, szItemName);
end
-- AskClientForNumber("callback", n×îÐ¡ÊäÈë, n×î´óÊäÈë, "ÌáÊ¾×Ö·û´®");

-- Function callback(nNum)  ...... End

--ÒÔÏÂÎªÓ¦ÓÃÄ£¿éµÄ¿ÉÑ¡ÅäÖÃ£¬Ö»Òª¶¨ÒåÁËÕâÐ©±äÁ¿ºÍº¯Êý£¬ÏµÍ³¾Í»á×Ô¶¯×¢²áºÍ»Øµ÷
--t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskId, nAcessCode = 0},
--    {id={"id_score", 3358, 11}, clear="daily"|"weekly"|"monthly", byte_score=1, byte_award=2, }, 
--}
--t_isolate_user_batch_watch_list = { {szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), ...}, }
--t_isolate_batch_export_gdata = { name = data, }
--t_isolate_batch_import_gdata = { name1, name2, }
--function on_init() end
--function on_init_ok() end
--function on_uninit() end
--function on_export_gdata() end
--function on_import_gdata() end
--function on_add_watches() end
--function on_new_day(nToday) end

--function on_event_server_start() end
--function on_event_player_login(nExchangeComing) end
--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
-- function on_first_login_clear(nLastLoginDate)--isolateÉÏÏßºóµÚÒ»´ÎµÇÂ¼Ê±µÄÇåÀí
-- 	t_Fix_201606:fix_up(nLastLoginDate)
-- end 



