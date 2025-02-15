--这是模块化的一个标准主文件,各模块只需要实现对应的标准事件处理函数,不需要关心这些函数什么时候被调用
--模块跟模块之间不能有Include和调用关系
--所以每个模块是独立的
--不需要的handler请注释调,以免空回调影响效率

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Import("\\settings\\static_script\\lib\\item_define.lua")
Import("\\script\\lib\\globalfunctions.lua")
t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 1,        --加载优先级 <=0:模块失效 >0:模块有效,数值越大越先加载 1 default
    szEngName 			= "NewYearActivity",
    szViewName 			= "Ho箃 ng l� nguy猲 n",
    nTalkBeginDate		= 20161226,
    nBeginDate 			= 20161226,
    nEndDate 			= 20170103,
    nTaskGroup 			= 4,
    nTaskGroupVersion	= 14,
}

NY2016_POS = {
    {207,1364,3044,"Nh� Long s琻"},{207,1505,3129,"Nh� Long s琻"},{207,1490,2996,"Nh� Long s琻"},
    {114,1551,3450,"Vng M蓇 ng_1"},{114,1558,3575,"Vng M蓇 ng_1"},{408,1453,2967,"Mi猽 L躰h"},
    {408,1317,3075,"Mi猽 L躰h"},{403,1443,3110,"T﹜ Song B秐 N筽 nam"},{403,1380,3068,"T﹜ Song B秐 N筽 nam"},
    {112,1695,2835,"Lng Th駓 ng_1"},{112,1716,3036,"Lng Th駓 ng_1"},{210,1486,3123,"Dng Trung ng"},
    {210,1411,2904,"Dng Trung ng"},{327,1395,2857,"� M玭g B�"},{327,1495,3022,"� M玭g B�"},
    {503,1420,3078,"T莕 L╪g"},{503,1508,2852,"T莕 L╪g"},{508,1613,3222,"Quang Minh nh"},
    {508,1643,3095,"Quang Minh nh"},{508,1754,3111,"Quang Minh nh"},
}
NY2016_CARD = {
    {2,1,31183,"Th� [Nguy猲]"},
    {2,1,31184,"Th� [Цn]"},
    {2,1,31185,"Th� [Vui]"},
    {2,1,31186,"Th� [V蝅"},
    {2,1,31187,"Th� [Nguy猲 Цn Vui V蝅"},
}
NY2016_CLOTHES = {
    {
        {0,108,833,1,"Ch� Th駓 Quan"},
        {0,108,834,1,"Ch� Th駓 Quan"},
        {0,108,835,1,"Ch� Th駓 Tr﹎"},
        {0,108,836,1,"Ch� Th駓 Tr﹎"},
    },
    {
        {0,109,833,1,"Ch� Th駓 y"},
        {0,109,834,1,"Ch� Th駓 y"},
        {0,109,835,1,"Ch� Th駓 y"},
        {0,109,836,1,"Ch� Th駓 y"},
    },
    {
        {0,110,833,1,"Ch� Th駓 Trang"},
        {0,110,834,1,"Ch� Th駓 Trang"},
        {0,110,835,1,"Ch� Th駓 Qu莕"},
        {0,110,836,1,"Ch� Th駓 Qu莕"},
    },
}
NY2016_HAPPY_CARD_LIMIT = 5
NY2016_EX_NEED = 3
NY2016_MAP_TIMES_LIMIT = 20
NY2016_MAP = {2,1,31182,"T祅g B秓 у"}
NY2016_DATE = 20170101


t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskGroupIdx},
   {id={"tskid_get_map_times", 1,}, clear="daily" }, -- 每日领取藏宝图的次数
   {id={"tskid_cur_pos", 2,} },
   {id={"tskid_use_happy_card", 3,},clear="daily" }, -- 使用元旦快乐卡数量
   {id={"tskid_get_clothes", 4,} }, -- 领取限时外装
   {id={"tskid_exchange_clothes", 5,} }, -- 兑换永久外装
}

function NY2016_reset_tskid()
    set_task("tskid_get_map_times",0)
    set_task("tskid_use_happy_card",0)
end

function on_add_watches() 
	isolate_watch_npc_talk("T� M� T蕁 Nguy猲", 350, "NY2016_handle_talk2simajinyuan");
    isolate_watch_npc_talk("Minh Ch� Kim S琻", 350, "NY2016_handle_talk2jszmr");
    isolate_watch_item_talk(2,1,31182, "handle_on_use_map")
    isolate_watch_item_talk(NY2016_CARD[1][1],NY2016_CARD[1][2],NY2016_CARD[1][3], "NY2016_exchange_card")
    isolate_watch_item_talk(NY2016_CARD[2][1],NY2016_CARD[2][2],NY2016_CARD[2][3], "NY2016_exchange_card")
    isolate_watch_item_talk(NY2016_CARD[3][1],NY2016_CARD[3][2],NY2016_CARD[3][3], "NY2016_exchange_card")
    isolate_watch_item_talk(NY2016_CARD[4][1],NY2016_CARD[4][2],NY2016_CARD[4][3], "NY2016_exchange_card")
    isolate_watch_item_talk(NY2016_CARD[5][1],NY2016_CARD[5][2],NY2016_CARD[5][3], "NY2016_use_happy_card")
end

function NY2016_handle_talk2jszmr()
    local nDate = tonumber(date("%Y%m%d"))
    local nClothes = get_task("tskid_get_clothes")
    local nExchange = get_task("tskid_exchange_clothes")
    local szTitle   = "<color=green>Minh Ch� Kim S琻<color>: C竎 v� i hi謕, ch骳 c竎 v� nguy猲 n vui v�! C竎 v� c� th� nh薾 ngo筰 trang p � y nh�.";
    if nDate ~= NY2016_DATE then 
        Talk(1,"","<color=green>Minh Ch� Kim S琻<color>: C竎 v� i hi謕, ch骳 c竎 v� nguy猲 n vui v�! V祇 ng祔 u c馻 n╩ m韎 (<color=red>1/1/2017<color>), ta s� t苙g c竎 v� c竎 m鉵 qu� ngo筰 trang p m総, m鋓 ngi nh� n nh薾!")
        return 
    end
    local tbSay     = {};
    local nDate     = tonumber(date("%Y%m%d")) 
    if nClothes == 0 then tinsert(tbSay,"Nh薾 ngo筰 trang c� th阨 h筺/NY2016_get_clothes") end
    if nClothes == 1 and nExchange == 0 then tinsert(tbSay,"D飊g ngo筰 trang c� th阨 gian i l蕐 ngo筰 trang v躰h vi詎/NY2016_exchange_clothes") end
    tinsert(tbSay,"T� b�/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end

function NY2016_get_clothes()
    local bGot = get_task("tskid_get_clothes")
    if bGot == 1 then Talk(1,"","M鏸 ngi ch� 頲 nh薾 1 l莕") return end
    local nBody = GetBody()
    if gf_Judge_Room_Weight(3, 0) ~= 1 then
        Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
        return
    end
    for i = 1, getn(NY2016_CLOTHES) do
        local tGive = NY2016_CLOTHES[i][nBody]
        local _,nIdx = gf_AddItemEx({tGive[1],tGive[2],tGive[3],tGive[4],4},tGive[5])
        SetItemExpireTime(nIdx, 30*24*3600)
    end
    set_task("tskid_get_clothes",1)
end

function NY2016_exchange_clothes()
    local nBody = GetBody()
    local clothes1 = GetItemCount(NY2016_CLOTHES[1][nBody][1],NY2016_CLOTHES[1][nBody][2],NY2016_CLOTHES[1][nBody][3]);
    local clothes2 = GetItemCount(NY2016_CLOTHES[2][nBody][1],NY2016_CLOTHES[2][nBody][2],NY2016_CLOTHES[2][nBody][3]);
    local clothes3 = GetItemCount(NY2016_CLOTHES[3][nBody][1],NY2016_CLOTHES[3][nBody][2],NY2016_CLOTHES[3][nBody][3]);
    if clothes1 < 1 or clothes2 < 1 or clothes3 < 1 then
        Talk(1,"","H穣 c蕋 3 m鉵 ngo筰 trang c� th阨 h筺  nh薾 trc y v祇 h祅h trang.")
        return
    end 
    local nTianJ = GetItemCount(2, 97, 236)
    local nCash  = GetCash()
    if nTianJ < 30 or nCash < 3000000 then
        Talk(1,"","фi c莕 30 Thi猲 Ki猽 L謓h v� 300 V祅g, trong h祅h trang hi謓 kh玭g c� .")
        return
    end 
    if DelItem(2, 97, 236, 30) ~= 1 then return end;
    Pay(3000000)
    if DelItem(NY2016_CLOTHES[1][nBody][1],NY2016_CLOTHES[1][nBody][2],NY2016_CLOTHES[1][nBody][3],1) ~= 1 then return end;
    if DelItem(NY2016_CLOTHES[2][nBody][1],NY2016_CLOTHES[2][nBody][2],NY2016_CLOTHES[2][nBody][3],1) ~= 1 then return end;
    if DelItem(NY2016_CLOTHES[3][nBody][1],NY2016_CLOTHES[3][nBody][2],NY2016_CLOTHES[3][nBody][3],1) ~= 1 then return end;
    for i = 1, getn(NY2016_CLOTHES) do
        local tGive = NY2016_CLOTHES[i][nBody]
        local _,nIdx = gf_AddItemEx({tGive[1],tGive[2],tGive[3],tGive[4],5},tGive[5])
    end
    set_task("tskid_exchange_clothes",1)
end

function NY2016_use_happy_card()
    local nCnt = get_task("tskid_use_happy_card")
    if nCnt >= NY2016_HAPPY_CARD_LIMIT then
        Talk(1,"",format("M閠 ng祔 ch� 頲 d飊g %d l莕 Th� [Nguy猲 Цn Vui V蝅",NY2016_HAPPY_CARD_LIMIT))
        return 0
    end
    
    local szAward = "sdhd_ydklk"
    if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
		return 0
	end
    if DelItem(NY2016_CARD[5][1],NY2016_CARD[5][2],NY2016_CARD[5][3],1) ~= 1 then
        Msg2Player("L鏸 khi s� d鬾g")
        return 0
    end
	if CustomAwardGiveGroup(szAward, 0) > 0 then     --二号参数为是否给予全部奖励,如果是则1
        set_task("tskid_use_happy_card",nCnt + 1)
		return 1
	end
	return 0
end

function NY2016_handle_talk2simajinyuan()
    local szTitle   = "<color=green>T� M� T蕁 Nguy猲<color>:".."C竎 hi謕 s� nguy猲 n vui v�! V� L﹎ Minh  t s� lng l韓 Thi謕 Gi竛g Sinh, 甧m ch髇g gi蕌 � kh緋 n琲. Ta y c� manh m鑙 hng d蒼. V祇 ng祔 26/12 - 03/1, m鏸 ng祔 c竎 hi謕 s�  頲 nh薾 20 l莕. L莕 theo manh m鑙  thu th藀 c竎 th� [Nguy猲], [Цn], [Vui], [V蝅 v� gh衟 ch髇g th祅h th� [Nguy猲 Цn Vui V蝅 th� s� nh薾 頲 ph莕 thng nguy猲 n. N誹 t譵 頲 qu� nhi襲 1 lo筰 th� n祇 , c� th� d飊g 3 th� gi鑞g nhau i l蕐 1 th� 頲 quy nh. M鏸 ng祔 頲 nh薾 thng t鑙 產 5 l莕 t� th� [Nguy猲 Цn Vui V蝅.";
    local tbSay     = {};
    local nDate     = tonumber(date("%Y%m%d")) 
    tinsert(tbSay,"Nhi謒 v� T祅g B秓 у/NY2016_mission")
    tinsert(tbSay,"T� b�/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end

function NY2016_mission()
    local szNpc   = "<color=green>T� M� T蕁 Nguy猲<color>:";
    local nCnt = get_task("tskid_get_map_times")
    if nCnt >= NY2016_MAP_TIMES_LIMIT then
        Talk(1,"",format("%s, h玬 nay b筺  nh薾 %d l莕 T祅g B秓 у, kh玭g th� nh薾 th猰.",szNpc,NY2016_MAP_TIMES_LIMIT))
        return
    end
    local hasMap = BigGetItemCount(NY2016_MAP[1],NY2016_MAP[2],NY2016_MAP[3])
    if hasMap > 0 then Talk(1,"",format("%s, tr猲 ngi  c� %s, kh玭g th� nh薾 l筰",szNpc,NY2016_MAP[4])); return end;
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"","Kh玭g gian h祅h trang kh玭g ") return end
    local nIdx = gf_AddItemEx({NY2016_MAP[1], NY2016_MAP[2], NY2016_MAP[3], 1, 4}, NY2016_MAP[4]);
    local nRand = random(1,getn(NY2016_POS));
    set_task("tskid_cur_pos",nRand);
    set_task("tskid_get_map_times",nCnt+1)
end

function NY2016_found_tresure()
    local szAward = "sdhd_kp"
	if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
		return 0
	end
	if CustomAwardGiveGroup(szAward, 0) > 0 then     --二号参数为是否给予全部奖励,如果是则1
        ModifyExp(100000)
        Msg2Player("B筺  nh薾 頲 100000 kinh nghi謒!")
        gf_Modify('Popur2', 1)
		return 1
	end
	return 0
end

function liyu_map_cd(nCnt,nIndex)
    SetItemUseLapse(nIndex,nCnt*18);
end


function handle_on_use_map(nIndex)
    local m,x,y = GetWorldPos()
    local tTarget = NY2016_POS[ get_task("tskid_cur_pos") ]
    local posx = tTarget[2];
    local posy = tTarget[3];
    if m ~= tTarget[1] then
        Talk(1,"",format("T祅g B秓 у hi觧 th� kh� b竨 � <color=red>%s<color>",tTarget[4]))
        return
    end

    local k = floor(sqrt((x-posx)^2+(y-posy)^2));
    if k<=3 and k>=0 then
        if DelItemByIndex(nIndex,1) == 1 then
            NY2016_found_tresure()
        else
            error("S� d鬾g T祅g B秓 у b� l鏸.")
        end
    else
        liyu_map_cd(5,nIndex) -- cd 5s
        Talk(1,"","C竎h v� tr� kho b竨 c遪 <color=yellow>".. floor(k/2).." bc<color>!");
    end
end


function NY2016_exchange_1()
    local nYuan = GetItemCount(NY2016_CARD[1][1],NY2016_CARD[1][2],NY2016_CARD[1][3])
    local nDan  = GetItemCount(NY2016_CARD[2][1],NY2016_CARD[2][2],NY2016_CARD[2][3])
    local nKuai = GetItemCount(NY2016_CARD[3][1],NY2016_CARD[3][2],NY2016_CARD[3][3])
    local nLe   = GetItemCount(NY2016_CARD[4][1],NY2016_CARD[4][2],NY2016_CARD[4][3])
    if nYuan < NY2016_EX_NEED and nDan < NY2016_EX_NEED and nKuai < NY2016_EX_NEED and nLe < NY2016_EX_NEED then
        Talk(1,"",format("Tr猲 ngi kh玭g c� lo筰 thi謕 n祇 vt qu� %d.",NY2016_EX_NEED))
        return
    end
    local szTitle = ""
    local tbSay = {}
    if nYuan >= NY2016_EX_NEED then tinsert(tbSay,format("D飊g %d th� [Nguy猲] (hi謓 c� %d) i 1 th� quy nh/#NY2016_exchange_1_1(1)",NY2016_EX_NEED,nYuan))end
    if nDan >=NY2016_EX_NEED then   tinsert(tbSay,format("D飊g %d th� [Цn] (hi謓 c� %d) i 1 th� quy nh/#NY2016_exchange_1_1(2)",NY2016_EX_NEED,nDan))end
    if nKuai >=NY2016_EX_NEED then  tinsert(tbSay,format("D飊g %d th� [Vui] (hi謓 c� %d) i 1 th� quy nh/#NY2016_exchange_1_1(3)",NY2016_EX_NEED,nKuai))end
    if nLe >=NY2016_EX_NEED then    tinsert(tbSay,format("D飊g %d th� [V蝅 (hi謓 c� %d) i 1 th� quy nh/#NY2016_exchange_1_1(4)",NY2016_EX_NEED,nLe))end
    tinsert(tbSay,"H駓 b�/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function NY2016_exchange_1_1(nType)
    local szTitle = ""
    local tbSay = {}
    tinsert(tbSay,format("фi 1 th� [Nguy猲]/#NY2016_exchange_1_2(%d,1)",nType,NY2016_EX_NEED))
    tinsert(tbSay,format("фi 1 th� [Цn]/#NY2016_exchange_1_2(%d,2)",nType,NY2016_EX_NEED))
    tinsert(tbSay,format("фi 1 th� [Vui]/#NY2016_exchange_1_2(%d,3)",nType,NY2016_EX_NEED))
    tinsert(tbSay,format("фi 1 th� [V蝅/#NY2016_exchange_1_2(%d,4)",nType,NY2016_EX_NEED))
    tinsert(tbSay,"H駓 b�/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function NY2016_exchange_1_2(nType,nWant)
    local nCnt = GetItemCount(NY2016_CARD[nType][1],NY2016_CARD[nType][2],NY2016_CARD[nType][3])
    if nCnt < NY2016_EX_NEED then
        Msg2Player("L鏸 khi i");
        return 
    end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"","Kh玭g gian h祅h trang kh玭g ") return end
    if DelItem(NY2016_CARD[nType][1],NY2016_CARD[nType][2],NY2016_CARD[nType][3],NY2016_EX_NEED) == 1 then
        gf_AddItemEx({NY2016_CARD[nWant][1],NY2016_CARD[nWant][2],NY2016_CARD[nWant][3],1,4},NY2016_CARD[nWant][4])
    end
end

function NY2016_exchange_2()
    local nYuan = GetItemCount(NY2016_CARD[1][1],NY2016_CARD[1][2],NY2016_CARD[1][3])
    local nDan  = GetItemCount(NY2016_CARD[2][1],NY2016_CARD[2][2],NY2016_CARD[2][3])
    local nKuai = GetItemCount(NY2016_CARD[3][1],NY2016_CARD[3][2],NY2016_CARD[3][3])
    local nLe   = GetItemCount(NY2016_CARD[4][1],NY2016_CARD[4][2],NY2016_CARD[4][3])
    if nYuan < 1 or nDan < 1 or nKuai < 1 or nLe < 1 then
        Talk(1,"NY2016_exchange_card","Tr猲 ngi ph秈 c� t鑙 thi觰 m鏸 lo筰 1 th� [Nguy猲], [Цn], [Vui], [V蝅.")
        return
    end
    local nCash = GetCash()
    if nCash < 100000 then
        Talk(1,"NY2016_exchange_card","Ti襫 tr猲 ngi kh玭g  10 V祅g.")
        return
    end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"","Kh玭g gian h祅h trang kh玭g ") return end
    if DelItem(NY2016_CARD[1][1],NY2016_CARD[1][2],NY2016_CARD[1][3],1) ~= 1 then return end;
    if DelItem(NY2016_CARD[2][1],NY2016_CARD[2][2],NY2016_CARD[2][3],1) ~= 1 then return end;
    if DelItem(NY2016_CARD[3][1],NY2016_CARD[3][2],NY2016_CARD[3][3],1) ~= 1 then return end;
    if DelItem(NY2016_CARD[4][1],NY2016_CARD[4][2],NY2016_CARD[4][3],1) ~= 1 then return end;
    Pay(100000)
    gf_AddItemEx({NY2016_CARD[5][1],NY2016_CARD[5][2],NY2016_CARD[5][3],1,4},NY2016_CARD[5][4])
end

function NY2016_exchange_card()
    local szTitle   = "";
    local tbSay     = {};
    tinsert(tbSay,"D飊g 3 th� gi鑞g nhau i 1 th� ch� nh/NY2016_exchange_1")
    tinsert(tbSay,"D飊g 4 lo筰 th�, m鏸 lo筰 1 c竔 v� 10 V祅g  gh衟 th祅h 1 th� [Nguy猲 Цn Vui V蝅/NY2016_exchange_2");
    -- tinsert(tbSay,"NY2016_reset_tskid/NY2016_reset_tskid");
    tinsert(tbSay,"H駓 b�/nothing")
    Say(szTitle,getn(tbSay),tbSay);
end
--以下为应用模块的可选配置,只要定义了这些变量和函数,系统就会自动注册和回调
--t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskGroupIdx},
--    {id={"id_score", 1,}, clear="daily"|"weekly"|"monthly", byte_score=1, byte_award=2, }, 
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
--function on_first_login_clear() end --isolate上线后第一次登录时的清理





