--这是模块化的一个标准主文件，各模块只需要实现对应的标准事件处理函数，不需要关心这些函数什么时候被调用
--模块跟模块之间不能有Include和调用关系
--所以每个模块是独立的
--不需要的handler请注释调，以免空回调影响效率

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")

Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\handler.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\head.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\award.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\act1.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\act2.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\act3.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\act4.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\act5.lua")

t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 1,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 			= "SpringFestival",
    szViewName 			= "Ho箃 ng xu﹏ m韎 2017",
    nTalkBeginDate		= 20170118,
    nBeginDate 			= 20170118,
    nEndDate 			= 20170208,
    nTaskGroup 			= 2,
    nTaskGroupVersion	= 25,
}

t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskGroupIdx},
   {id={"id_dc_byte", 1,}, clear="daily" }, -- 字节存日清变量
   {id={"id_byte", 2,},  },                 -- 字节存不清变量
   {id={"id_get_box", 3,},  },              -- 记录拾取新春宝箱的时间
   {id={"id_get_box_fromDS", 4,}, clear="daily" },       -- 记录从活动大使处领取宝箱的次数，和击杀年兽的次数有关
   {id={"id_last_fushen", 5,},  },          -- 记录玩家已找到福神的hash值
   {id={"id_mission", 6,}, clear="daily" },              -- 记录玩家每天做的任务
   {id={"id_toahuaCD", 7,},  },              -- 记录玩家采桃花的CD
   {id={"id_wushi", 8,},  },                -- 记录是否领兑换过舞狮
}

function _refresh_fushen(nPara) 
    if sf2017_indate(SF2017_DATE_ACT1) ~= 1 then return end
    local tPos = SF2017_FUSHEN.tPos[nPara[4][1]];
    if tPos == nil then return end
    local nPos = random(1,getn(tPos))
    SF2017_FUSHEN.nCnt =0 ;
    SF2017_FUSHEN.nHash = GetTime()
    local npcidx = CreateNpc(SF2017_FUSHEN.szTemp,SF2017_FUSHEN.szName,tPos[nPos][1],tPos[nPos][2],tPos[nPos][3])
    SetNpcLifeTime(npcidx,SF2017_FUSHEN.nLifeTime)
    if SF2017_DEBUG == 1 then
        print("\nFushen Pos:",tPos[nPos][1],tPos[nPos][2],tPos[nPos][3])
    end
    if npcidx ~= 0 then
    	Msg2Global(format("Ph骳 Th莕  xu蕋 hi謓 � %s, c竎 v� i hi謕 h穣 n  t譵 Ph骳 Th莕, nh薾 thng phong ph�!",tPos[nPos][4]))
    end
end

function _refresh_monster()
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then return end
    if SF2017_MONSTER.isLife == 1 then return end
    local tnpc = SF2017_MONSTER
    SF2017_MONSTER:Init()
end

function _refresh_both(nPara)
    _refresh_fushen(nPara)
    _refresh_monster()
end

function handle_count_time()
    if sf2017_indate(SF2017_DATE_ACT5) ~= 1 then return end
    if SF2017_MONSTER.isLife == 1 then return end
    if SF2017_MONSTER.nDeadTime == -1 then return end
    local nTime = GetTime()
    if nTime - SF2017_MONSTER.nDeadTime >= SF2017_MONSTER.nRefreshTime then
        SF2017_MONSTER:Init()
    end
end

t_isolate_user_batch_watch_list = { 
    {"event_server_tick_minute",{1},handle_count_time,{ }},
	{"event_server_time", {12, 00}, _refresh_both,{ 1 }  },
    {"event_server_time", {14, 00}, _refresh_fushen,{ 2 }  },
    {"event_server_time", {16, 00}, _refresh_fushen,{ 3 }  },
    {"event_server_time", {18, 00}, _refresh_fushen,{ 1 }  },
    {"event_server_time", {19, 00}, _refresh_monster,{  }  },
    {"event_server_time", {20, 00}, _refresh_fushen,{ 2 }  },
    {"event_server_time", {21, 00}, _refresh_fushen,{ 3 }  },
    {"event_server_time", {22, 00}, _refresh_fushen,{ 3 }  },
    {"event_server_time", {23, 00}, _refresh_fushen,{ 2 }  },
}

function on_add_watches() 
	isolate_watch_npc_talk(SF2017_TREES.szName, 100, "sf2017_talk2tree")
    isolate_watch_npc_talk(SF2017_TREES.szName, 200, "sf2017_talk2tree")
    isolate_watch_npc_talk(SF2017_TREES.szName, 300, "sf2017_talk2tree")
    isolate_watch_npc_talk(SF2017_TREES.szName, 350, "sf2017_talk2tree")
    isolate_watch_item_talk(SF2017_FLOWER[1],SF2017_FLOWER[2],SF2017_FLOWER[3], "NY2016_usetaohua")

    isolate_watch_npc_talk(SF2017_FUSHEN.szName, 100, "sf2017_talk2fushen")
    isolate_watch_npc_talk(SF2017_FUSHEN.szName, 200, "sf2017_talk2fushen")
    isolate_watch_npc_talk(SF2017_FUSHEN.szName, 300, "sf2017_talk2fushen")

    isolate_watch_npc_talk(SF2017_HDDS.szName, 100, "sf2017_talk2hdds")
    isolate_watch_npc_talk(SF2017_HDDS.szName, 200, "sf2017_talk2hdds")
    isolate_watch_npc_talk(SF2017_HDDS.szName, 300, "sf2017_talk2hdds")
    isolate_watch_item_talk(SF2017_FIRECRACKERS.normal[1],SF2017_FIRECRACKERS.normal[2],SF2017_FIRECRACKERS.normal[3], "sf2017_use_firecrackers")
    isolate_watch_item_talk(SF2017_FIRECRACKERS.delicate[1],SF2017_FIRECRACKERS.delicate[2],SF2017_FIRECRACKERS.delicate[3], "sf2017_ask_number")
    isolate_watch_item_talk(SF2017_BOX.tItem[1],SF2017_BOX.tItem[2],SF2017_BOX.tItem[3], "sf2017_use_box_award")
    
    isolate_watch_npc_talk(SF2017_MONSTER.szName, 100, "MonsterTalk")
    
    isolate_watch_item_talk(SF2017_FIRE.normal[1],SF2017_FIRE.normal[2],SF2017_FIRE.normal[3], "sf2017_Debug")
    isolate_watch_npc_talk(SF2017_BOX.szName, SF2017_BOX.tPos[1], "sf2017_talk2xcbox")
    isolate_watch_event("event_kill_npc", "sf2017_killnpc", "", 102)
    isolate_watch_event("event_kill_npc", "sf2017_killnpc", "", 103)
    isolate_watch_event("event_kill_npc", "sf2017_killnpc", "", 104)

    isolate_watch_npc_talk("A Th辬h", 300, "sf2017_finish_mission")
    isolate_watch_npc_talk("Chu Thi謓 Nh﹏", 300, "sf2017_finish_mission")
    isolate_watch_npc_talk("Th莥 b鉯", 300, "sf2017_finish_mission")
    isolate_watch_npc_talk("T祇 Чi L鵦", 200, "sf2017_finish_mission")
    isolate_watch_npc_talk("V� Nng", 200, "sf2017_finish_mission")
    isolate_watch_npc_talk("H祅 Ngh躠", 350, "sf2017_finish_mission")
    isolate_watch_npc_talk("Trng 秐h", 350, "sf2017_finish_mission")
    isolate_watch_npc_talk("L鬰 Tr骳 g", 350, "sf2017_finish_mission")
    isolate_watch_npc_talk("H� H莡 Anh", 150, "sf2017_finish_mission")
    isolate_watch_npc_talk("M穘h Nham ", 150, "sf2017_finish_mission")
    isolate_watch_npc_talk("H� Ki謙", 100, "sf2017_finish_mission")
    isolate_watch_npc_talk("Chung Ph鉵g", 100, "sf2017_finish_mission")
end

function sf2017_talk2hdds()
    if sf2017_finish_mission() == 1 then return end
    local nSex = GetSex()
    local szSex = "Чi hi謕"
    if nSex == 2 then szSex = "N� hi謕 " end
    local szTitle = format("<color=green>%s<color>: Xu﹏ m韎 vui v�!",SF2017_HDDS.szName)
    if sf2017_indate(SF2017_DATE_ACT4_2) == 1 then 
        szTitle = format("<color=green>%s<color>: Xu﹏ m韎 s緋 n, %s c� th� thu th藀 m閠 s� H醓 Dc  ch� th祅h Ph竜 trong th阨 gian t誸, chu萵 b� 畊鎖 Ni猲 Th�.",SF2017_HDDS.szName,szSex)
    elseif sf2017_indate(SF2017_DATE_ACT5) == 1 then
        szTitle = format("<color=green>%s<color>: G莕 y, Ni猲 Th� thng xu蕋 hi謓 � v飊g bi觧 Tuy襫 Ch﹗, mu鑞 v祇 th祅h ph� ho筰 kh玭g cho d﹏ ch髇g m鮪g t誸. Nh� %s n v飊g bi觧 Tuy襫 Ch﹗ d飊g Ph竜 畊鎖 Ni猲 Th� 甶.",SF2017_HDDS.szName,szSex)
    end
    local tbSay  = {}
    local bGotClothes = get_task_byte("id_byte",SF2017_BYTE_TSK.get_clothes)
    if sf2017_indate(SF2017_DATE_ACT3) == 1 then 
        if bGotClothes == 0 then tinsert(tbSay,"Nh薾 1 b� ngo筰 trang X輈h Vi猲 L閚g H筩 c� th阨 h筺/sf2017_on_getclothes") end
        if bGotClothes == 1 then tinsert(tbSay,"D飊g 40 Thi猲 Ki猽 L謓h v� 500 V祅g  i 1 ngo筰 trang X輈h Vi猲 L閚g H筩 c� th阨 h筺 th祅h 1 ngo筰 trang v躰h vi詎/sf2017_excclothes") end
    end
    if sf2017_indate(SF2017_DATE_ACT5) == 1 then
        tinsert(tbSay,"S� d鬾g 1 H醓 Dc S� Ch� v� 2 V祅g ch� t筼 1 Ph竜 S� Ch�/sf2017_make_normalfirecrackers")
        tinsert(tbSay,"S� d鬾g 1 H醓 Dc Tinh Ch� v� 5 V祅g ch� t筼 1 Ph竜 Tinh Ch�/sf2017_make_delicatefirecrackers")
        tinsert(tbSay,"Nh薾 t蕋 c� ph莕 thng 畊鎖 Ni猲 Th�/sf2017_get_box_fromDS")
        tinsert(tbSay,"m th� ci [L﹏ S璢 c� th阨 h筺 i th祅h v躰h vi詎/sf2017_exc_wushi")
        tinsert(tbSay,"Gi秈 th輈h ho箃 ng/sf2017_monster_description")
    end
    if sf2017_indate(SF2017_DATE_ACT4_2) == 1 then
        tinsert(tbSay,"Tham gia nhi謒 v� Thu th藀 H醓 Dc/sf2017_mission")
        tinsert(tbSay,"Gi韎 thi謚 nhi謒 v�/sf2017_mission_description")
    end
    if sf2017_indate(SF2017_SHOP_DATE1) == 1 and sf2017_intime(SF2017_SHOP_TIME1) == 1 then
        tinsert(tbSay,"C鯽 h祅g Xu﹏ M韎-Giai 畂筺 1/#sf2017_openshop(1)")
    end
    if sf2017_indate(SF2017_SHOP_DATE2) == 1 and sf2017_intime(SF2017_SHOP_TIME2) == 1 then
        tinsert(tbSay,"C鯽 h祅g Xu﹏ M韎-Giai 畂筺 2/#sf2017_openshop(2)")
    end
    tinsert(tbSay,"H駓 b�/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function sf2017_openshop(nType)
    if nType == 1 then
        if sf2017_indate(SF2017_SHOP_DATE1) == 1 and sf2017_intime(SF2017_SHOP_TIME1) == 1 then
            SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3082, "C鯽 h祅g Xu﹏ M韎"))
        end
    else
        if sf2017_indate(SF2017_SHOP_DATE2) == 1 and sf2017_intime(SF2017_SHOP_TIME2) == 1 then
            SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3083, "C鯽 h祅g Xu﹏ M韎"))
        end
    end
end

function on_event_server_start() 
    for i = 1, getn(SF2017_TREES.tPos) do
        CreateNpc(SF2017_TREES.szTemp,SF2017_TREES.szName,SF2017_TREES.tPos[i][1],SF2017_TREES.tPos[i][2],SF2017_TREES.tPos[i][3])
    end
    for i = 1, getn(SF2017_HDDS.tPos) do
        CreateNpc(SF2017_HDDS.szTemp,SF2017_HDDS.szName,SF2017_HDDS.tPos[i][1],SF2017_HDDS.tPos[i][2],SF2017_HDDS.tPos[i][3])
    end
    for i = 1, getn(SF2017_BOSS) do
        CreateNpc(SF2017_BOSS[i][1],SF2017_BOSS[i][2],SF2017_BOSS[i][3],SF2017_BOSS[i][4],SF2017_BOSS[i][5])
    end
end

function on_new_day(nToday) 
    SF2017_MONSTER.nDeadCnt = 0;
end