--����ģ�黯��һ����׼���ļ�,��ģ��ֻ��Ҫʵ�ֶ�Ӧ�ı�׼�¼�������,����Ҫ������Щ����ʲôʱ�򱻵���
--ģ���ģ��֮�䲻����Include�͵��ù�ϵ
--����ÿ��ģ���Ƕ�����
--����Ҫ��handler��ע�͵�,����ջص�Ӱ��Ч��

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Import("\\settings\\static_script\\lib\\item_define.lua")
Import("\\script\\lib\\globalfunctions.lua")
t_isolate_base_cfg = { --����һ������������
    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч,��ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "NewYearActivity",
    szViewName 			= "Ho�t ��ng l� nguy�n ��n",
    nTalkBeginDate		= 20161226,
    nBeginDate 			= 20161226,
    nEndDate 			= 20170103,
    nTaskGroup 			= 4,
    nTaskGroupVersion	= 14,
}

NY2016_POS = {
    {207,1364,3044,"Nh� Long s�n"},{207,1505,3129,"Nh� Long s�n"},{207,1490,2996,"Nh� Long s�n"},
    {114,1551,3450,"V��ng M�u ��ng_1"},{114,1558,3575,"V��ng M�u ��ng_1"},{408,1453,2967,"Mi�u L�nh"},
    {408,1317,3075,"Mi�u L�nh"},{403,1443,3110,"T�y Song B�n N�p nam"},{403,1380,3068,"T�y Song B�n N�p nam"},
    {112,1695,2835,"L��ng Th�y ��ng_1"},{112,1716,3036,"L��ng Th�y ��ng_1"},{210,1486,3123,"D��ng Trung ��ng"},
    {210,1411,2904,"D��ng Trung ��ng"},{327,1395,2857,"� M�ng B�"},{327,1495,3022,"� M�ng B�"},
    {503,1420,3078,"T�n L�ng"},{503,1508,2852,"T�n L�ng"},{508,1613,3222,"Quang Minh ��nh"},
    {508,1643,3095,"Quang Minh ��nh"},{508,1754,3111,"Quang Minh ��nh"},
}
NY2016_CARD = {
    {2,1,31183,"Th� [Nguy�n]"},
    {2,1,31184,"Th� [��n]"},
    {2,1,31185,"Th� [Vui]"},
    {2,1,31186,"Th� [V�]"},
    {2,1,31187,"Th� [Nguy�n ��n Vui V�]"},
}
NY2016_CLOTHES = {
    {
        {0,108,833,1,"Ch� Th�y Quan"},
        {0,108,834,1,"Ch� Th�y Quan"},
        {0,108,835,1,"Ch� Th�y Tr�m"},
        {0,108,836,1,"Ch� Th�y Tr�m"},
    },
    {
        {0,109,833,1,"Ch� Th�y y"},
        {0,109,834,1,"Ch� Th�y y"},
        {0,109,835,1,"Ch� Th�y y"},
        {0,109,836,1,"Ch� Th�y y"},
    },
    {
        {0,110,833,1,"Ch� Th�y Trang"},
        {0,110,834,1,"Ch� Th�y Trang"},
        {0,110,835,1,"Ch� Th�y Qu�n"},
        {0,110,836,1,"Ch� Th�y Qu�n"},
    },
}
NY2016_HAPPY_CARD_LIMIT = 5
NY2016_EX_NEED = 3
NY2016_MAP_TIMES_LIMIT = 20
NY2016_MAP = {2,1,31182,"T�ng B�o ��"}
NY2016_DATE = 20170101


t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskGroupIdx},
   {id={"tskid_get_map_times", 1,}, clear="daily" }, -- ÿ����ȡ�ر�ͼ�Ĵ���
   {id={"tskid_cur_pos", 2,} },
   {id={"tskid_use_happy_card", 3,},clear="daily" }, -- ʹ��Ԫ�����ֿ�����
   {id={"tskid_get_clothes", 4,} }, -- ��ȡ��ʱ��װ
   {id={"tskid_exchange_clothes", 5,} }, -- �һ�������װ
}

function NY2016_reset_tskid()
    set_task("tskid_get_map_times",0)
    set_task("tskid_use_happy_card",0)
end

function on_add_watches() 
	isolate_watch_npc_talk("T� M� T�n Nguy�n", 350, "NY2016_handle_talk2simajinyuan");
    isolate_watch_npc_talk("Minh Ch� Kim S�n", 350, "NY2016_handle_talk2jszmr");
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
    local szTitle   = "<color=green>Minh Ch� Kim S�n<color>: C�c v� ��i hi�p, ch�c c�c v� nguy�n ��n vui v�! C�c v� c� th� nh�n ngo�i trang ��p � ��y nh�.";
    if nDate ~= NY2016_DATE then 
        Talk(1,"","<color=green>Minh Ch� Kim S�n<color>: C�c v� ��i hi�p, ch�c c�c v� nguy�n ��n vui v�! V�o ng�y ��u c�a n�m m�i (<color=red>1/1/2017<color>), ta s� t�ng c�c v� c�c m�n qu� ngo�i trang ��p m�t, m�i ng��i nh� ��n nh�n!")
        return 
    end
    local tbSay     = {};
    local nDate     = tonumber(date("%Y%m%d")) 
    if nClothes == 0 then tinsert(tbSay,"Nh�n ngo�i trang c� th�i h�n/NY2016_get_clothes") end
    if nClothes == 1 and nExchange == 0 then tinsert(tbSay,"D�ng ngo�i trang c� th�i gian ��i l�y ngo�i trang v�nh vi�n/NY2016_exchange_clothes") end
    tinsert(tbSay,"T� b�/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end

function NY2016_get_clothes()
    local bGot = get_task("tskid_get_clothes")
    if bGot == 1 then Talk(1,"","M�i ng��i ch� ���c nh�n 1 l�n") return end
    local nBody = GetBody()
    if gf_Judge_Room_Weight(3, 0) ~= 1 then
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
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
        Talk(1,"","H�y c�t 3 m�n ngo�i trang c� th�i h�n �� nh�n tr��c ��y v�o h�nh trang.")
        return
    end 
    local nTianJ = GetItemCount(2, 97, 236)
    local nCash  = GetCash()
    if nTianJ < 30 or nCash < 3000000 then
        Talk(1,"","��i c�n 30 Thi�n Ki�u L�nh v� 300 V�ng, trong h�nh trang hi�n kh�ng c� ��.")
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
        Talk(1,"",format("M�t ng�y ch� ���c d�ng %d l�n Th� [Nguy�n ��n Vui V�]",NY2016_HAPPY_CARD_LIMIT))
        return 0
    end
    
    local szAward = "sdhd_ydklk"
    if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
		return 0
	end
    if DelItem(NY2016_CARD[5][1],NY2016_CARD[5][2],NY2016_CARD[5][3],1) ~= 1 then
        Msg2Player("L�i khi s� d�ng")
        return 0
    end
	if CustomAwardGiveGroup(szAward, 0) > 0 then     --���Ų���Ϊ�Ƿ����ȫ������,�������1
        set_task("tskid_use_happy_card",nCnt + 1)
		return 1
	end
	return 0
end

function NY2016_handle_talk2simajinyuan()
    local szTitle   = "<color=green>T� M� T�n Nguy�n<color>:".."C�c hi�p s� nguy�n ��n vui v�! V� L�m Minh �� ��t s� l��ng l�n Thi�p Gi�ng Sinh, �em ch�ng gi�u � kh�p n�i. Ta ��y c� manh m�i h��ng d�n. V�o ng�y 26/12 - 03/1, m�i ng�y c�c hi�p s�  ���c nh�n 20 l�n. L�n theo manh m�i �� thu th�p c�c th� [Nguy�n], [��n], [Vui], [V�] v� gh�p ch�ng th�nh th� [Nguy�n ��n Vui V�] th� s� nh�n ���c ph�n th��ng nguy�n ��n. N�u t�m ���c qu� nhi�u 1 lo�i th� n�o ��, c� th� d�ng 3 th� gi�ng nhau ��i l�y 1 th� ���c quy ��nh. M�i ng�y ���c nh�n th��ng t�i �a 5 l�n t� th� [Nguy�n ��n Vui V�].";
    local tbSay     = {};
    local nDate     = tonumber(date("%Y%m%d")) 
    tinsert(tbSay,"Nhi�m v� T�ng B�o ��/NY2016_mission")
    tinsert(tbSay,"T� b�/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end

function NY2016_mission()
    local szNpc   = "<color=green>T� M� T�n Nguy�n<color>:";
    local nCnt = get_task("tskid_get_map_times")
    if nCnt >= NY2016_MAP_TIMES_LIMIT then
        Talk(1,"",format("%s, h�m nay b�n �� nh�n %d l�n T�ng B�o ��, kh�ng th� nh�n th�m.",szNpc,NY2016_MAP_TIMES_LIMIT))
        return
    end
    local hasMap = BigGetItemCount(NY2016_MAP[1],NY2016_MAP[2],NY2016_MAP[3])
    if hasMap > 0 then Talk(1,"",format("%s, tr�n ng��i �� c� %s, kh�ng th� nh�n l�i",szNpc,NY2016_MAP[4])); return end;
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"","Kh�ng gian h�nh trang kh�ng ��") return end
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
	if CustomAwardGiveGroup(szAward, 0) > 0 then     --���Ų���Ϊ�Ƿ����ȫ������,�������1
        ModifyExp(100000)
        Msg2Player("B�n �� nh�n ���c 100000 kinh nghi�m!")
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
        Talk(1,"",format("T�ng B�o �� hi�n th� kh� b�u � <color=red>%s<color>",tTarget[4]))
        return
    end

    local k = floor(sqrt((x-posx)^2+(y-posy)^2));
    if k<=3 and k>=0 then
        if DelItemByIndex(nIndex,1) == 1 then
            NY2016_found_tresure()
        else
            error("S� d�ng T�ng B�o �� b� l�i.")
        end
    else
        liyu_map_cd(5,nIndex) -- cd 5s
        Talk(1,"","C�ch v� tr� kho b�u c�n <color=yellow>".. floor(k/2).." b��c<color>!");
    end
end


function NY2016_exchange_1()
    local nYuan = GetItemCount(NY2016_CARD[1][1],NY2016_CARD[1][2],NY2016_CARD[1][3])
    local nDan  = GetItemCount(NY2016_CARD[2][1],NY2016_CARD[2][2],NY2016_CARD[2][3])
    local nKuai = GetItemCount(NY2016_CARD[3][1],NY2016_CARD[3][2],NY2016_CARD[3][3])
    local nLe   = GetItemCount(NY2016_CARD[4][1],NY2016_CARD[4][2],NY2016_CARD[4][3])
    if nYuan < NY2016_EX_NEED and nDan < NY2016_EX_NEED and nKuai < NY2016_EX_NEED and nLe < NY2016_EX_NEED then
        Talk(1,"",format("Tr�n ng��i kh�ng c� lo�i thi�p n�o v��t qu� %d.",NY2016_EX_NEED))
        return
    end
    local szTitle = ""
    local tbSay = {}
    if nYuan >= NY2016_EX_NEED then tinsert(tbSay,format("D�ng %d th� [Nguy�n] (hi�n c� %d) ��i 1 th� quy ��nh/#NY2016_exchange_1_1(1)",NY2016_EX_NEED,nYuan))end
    if nDan >=NY2016_EX_NEED then   tinsert(tbSay,format("D�ng %d th� [��n] (hi�n c� %d) ��i 1 th� quy ��nh/#NY2016_exchange_1_1(2)",NY2016_EX_NEED,nDan))end
    if nKuai >=NY2016_EX_NEED then  tinsert(tbSay,format("D�ng %d th� [Vui] (hi�n c� %d) ��i 1 th� quy ��nh/#NY2016_exchange_1_1(3)",NY2016_EX_NEED,nKuai))end
    if nLe >=NY2016_EX_NEED then    tinsert(tbSay,format("D�ng %d th� [V�] (hi�n c� %d) ��i 1 th� quy ��nh/#NY2016_exchange_1_1(4)",NY2016_EX_NEED,nLe))end
    tinsert(tbSay,"H�y b�/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function NY2016_exchange_1_1(nType)
    local szTitle = ""
    local tbSay = {}
    tinsert(tbSay,format("��i 1 th� [Nguy�n]/#NY2016_exchange_1_2(%d,1)",nType,NY2016_EX_NEED))
    tinsert(tbSay,format("��i 1 th� [��n]/#NY2016_exchange_1_2(%d,2)",nType,NY2016_EX_NEED))
    tinsert(tbSay,format("��i 1 th� [Vui]/#NY2016_exchange_1_2(%d,3)",nType,NY2016_EX_NEED))
    tinsert(tbSay,format("��i 1 th� [V�]/#NY2016_exchange_1_2(%d,4)",nType,NY2016_EX_NEED))
    tinsert(tbSay,"H�y b�/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function NY2016_exchange_1_2(nType,nWant)
    local nCnt = GetItemCount(NY2016_CARD[nType][1],NY2016_CARD[nType][2],NY2016_CARD[nType][3])
    if nCnt < NY2016_EX_NEED then
        Msg2Player("L�i khi ��i");
        return 
    end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"","Kh�ng gian h�nh trang kh�ng ��") return end
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
        Talk(1,"NY2016_exchange_card","Tr�n ng��i ph�i c� t�i thi�u m�i lo�i 1 th� [Nguy�n], [��n], [Vui], [V�].")
        return
    end
    local nCash = GetCash()
    if nCash < 100000 then
        Talk(1,"NY2016_exchange_card","Ti�n tr�n ng��i kh�ng �� 10 V�ng.")
        return
    end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"","Kh�ng gian h�nh trang kh�ng ��") return end
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
    tinsert(tbSay,"D�ng 3 th� gi�ng nhau ��i 1 th� ch� ��nh/NY2016_exchange_1")
    tinsert(tbSay,"D�ng 4 lo�i th�, m�i lo�i 1 c�i v� 10 V�ng �� gh�p th�nh 1 th� [Nguy�n ��n Vui V�]/NY2016_exchange_2");
    -- tinsert(tbSay,"NY2016_reset_tskid/NY2016_reset_tskid");
    tinsert(tbSay,"H�y b�/nothing")
    Say(szTitle,getn(tbSay),tbSay);
end
--����ΪӦ��ģ��Ŀ�ѡ����,ֻҪ��������Щ�����ͺ���,ϵͳ�ͻ��Զ�ע��ͻص�
--t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskGroupIdx},
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
--function on_first_login_clear() end --isolate���ߺ��һ�ε�¼ʱ������





