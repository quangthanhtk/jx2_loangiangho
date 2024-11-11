--����ģ�黯��һ����׼���ļ�����ģ��ֻ��Ҫʵ�ֶ�Ӧ�ı�׼�¼�������������Ҫ������Щ����ʲôʱ�򱻵���
--ģ���ģ��֮�䲻����Include�͵��ù�ϵ
--����ÿ��ģ���Ƕ�����
--����Ҫ��handler��ע�͵�������ջص�Ӱ��Ч��

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")

Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\handler.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\head.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\award.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\act1.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\act2.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\act3.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\act4.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2017_01\\act5.lua")

t_isolate_base_cfg = { --����һ������������
    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "SpringFestival",
    szViewName 			= "Ho�t ��ng xu�n m�i 2017",
    nTalkBeginDate		= 20170118,
    nBeginDate 			= 20170118,
    nEndDate 			= 20170208,
    nTaskGroup 			= 2,
    nTaskGroupVersion	= 25,
}

t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskGroupIdx},
   {id={"id_dc_byte", 1,}, clear="daily" }, -- �ֽڴ��������
   {id={"id_byte", 2,},  },                 -- �ֽڴ治�����
   {id={"id_get_box", 3,},  },              -- ��¼ʰȡ�´������ʱ��
   {id={"id_get_box_fromDS", 4,}, clear="daily" },       -- ��¼�ӻ��ʹ����ȡ����Ĵ������ͻ�ɱ���޵Ĵ����й�
   {id={"id_last_fushen", 5,},  },          -- ��¼������ҵ������hashֵ
   {id={"id_mission", 6,}, clear="daily" },              -- ��¼���ÿ����������
   {id={"id_toahuaCD", 7,},  },              -- ��¼��Ҳ��һ���CD
   {id={"id_wushi", 8,},  },                -- ��¼�Ƿ���һ�����ʨ
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
    	Msg2Global(format("Ph�c Th�n �� xu�t hi�n � %s, c�c v� ��i hi�p h�y ��n �� t�m Ph�c Th�n, nh�n th��ng phong ph�!",tPos[nPos][4]))
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

    isolate_watch_npc_talk("A Th�nh", 300, "sf2017_finish_mission")
    isolate_watch_npc_talk("Chu Thi�n Nh�n", 300, "sf2017_finish_mission")
    isolate_watch_npc_talk("Th�y b�i", 300, "sf2017_finish_mission")
    isolate_watch_npc_talk("T�o ��i L�c", 200, "sf2017_finish_mission")
    isolate_watch_npc_talk("V� N��ng", 200, "sf2017_finish_mission")
    isolate_watch_npc_talk("H�n Ngh�a", 350, "sf2017_finish_mission")
    isolate_watch_npc_talk("Tr��ng �nh", 350, "sf2017_finish_mission")
    isolate_watch_npc_talk("L�c Tr�c �ng", 350, "sf2017_finish_mission")
    isolate_watch_npc_talk("H� H�u Anh", 150, "sf2017_finish_mission")
    isolate_watch_npc_talk("M�nh Nham ", 150, "sf2017_finish_mission")
    isolate_watch_npc_talk("H� Ki�t", 100, "sf2017_finish_mission")
    isolate_watch_npc_talk("Chung Ph�ng", 100, "sf2017_finish_mission")
end

function sf2017_talk2hdds()
    if sf2017_finish_mission() == 1 then return end
    local nSex = GetSex()
    local szSex = "��i hi�p"
    if nSex == 2 then szSex = "N� hi�p " end
    local szTitle = format("<color=green>%s<color>: Xu�n m�i vui v�!",SF2017_HDDS.szName)
    if sf2017_indate(SF2017_DATE_ACT4_2) == 1 then 
        szTitle = format("<color=green>%s<color>: Xu�n m�i s�p ��n, %s c� th� thu th�p m�t s� H�a D��c �� ch� th�nh Ph�o trong th�i gian t�t, chu�n b� �u�i Ni�n Th�.",SF2017_HDDS.szName,szSex)
    elseif sf2017_indate(SF2017_DATE_ACT5) == 1 then
        szTitle = format("<color=green>%s<color>: G�n ��y, Ni�n Th� th��ng xu�t hi�n � v�ng bi�n Tuy�n Ch�u, mu�n v�o th�nh ph� ho�i kh�ng cho d�n ch�ng m�ng t�t. Nh� %s ��n v�ng bi�n Tuy�n Ch�u d�ng Ph�o �u�i Ni�n Th� �i.",SF2017_HDDS.szName,szSex)
    end
    local tbSay  = {}
    local bGotClothes = get_task_byte("id_byte",SF2017_BYTE_TSK.get_clothes)
    if sf2017_indate(SF2017_DATE_ACT3) == 1 then 
        if bGotClothes == 0 then tinsert(tbSay,"Nh�n 1 b� ngo�i trang X�ch Vi�n L�ng H�c c� th�i h�n/sf2017_on_getclothes") end
        if bGotClothes == 1 then tinsert(tbSay,"D�ng 40 Thi�n Ki�u L�nh v� 500 V�ng �� ��i 1 ngo�i trang X�ch Vi�n L�ng H�c c� th�i h�n th�nh 1 ngo�i trang v�nh vi�n/sf2017_excclothes") end
    end
    if sf2017_indate(SF2017_DATE_ACT5) == 1 then
        tinsert(tbSay,"S� d�ng 1 H�a D��c S� Ch� v� 2 V�ng ch� t�o 1 Ph�o S� Ch�/sf2017_make_normalfirecrackers")
        tinsert(tbSay,"S� d�ng 1 H�a D��c Tinh Ch� v� 5 V�ng ch� t�o 1 Ph�o Tinh Ch�/sf2017_make_delicatefirecrackers")
        tinsert(tbSay,"Nh�n t�t c� ph�n th��ng �u�i Ni�n Th�/sf2017_get_box_fromDS")
        tinsert(tbSay,"�em th� c��i [L�n S�] c� th�i h�n ��i th�nh v�nh vi�n/sf2017_exc_wushi")
        tinsert(tbSay,"Gi�i th�ch ho�t ��ng/sf2017_monster_description")
    end
    if sf2017_indate(SF2017_DATE_ACT4_2) == 1 then
        tinsert(tbSay,"Tham gia nhi�m v� Thu th�p H�a D��c/sf2017_mission")
        tinsert(tbSay,"Gi�i thi�u nhi�m v�/sf2017_mission_description")
    end
    if sf2017_indate(SF2017_SHOP_DATE1) == 1 and sf2017_intime(SF2017_SHOP_TIME1) == 1 then
        tinsert(tbSay,"C�a h�ng Xu�n M�i-Giai �o�n 1/#sf2017_openshop(1)")
    end
    if sf2017_indate(SF2017_SHOP_DATE2) == 1 and sf2017_intime(SF2017_SHOP_TIME2) == 1 then
        tinsert(tbSay,"C�a h�ng Xu�n M�i-Giai �o�n 2/#sf2017_openshop(2)")
    end
    tinsert(tbSay,"H�y b�/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function sf2017_openshop(nType)
    if nType == 1 then
        if sf2017_indate(SF2017_SHOP_DATE1) == 1 and sf2017_intime(SF2017_SHOP_TIME1) == 1 then
            SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3082, "C�a h�ng Xu�n M�i"))
        end
    else
        if sf2017_indate(SF2017_SHOP_DATE2) == 1 and sf2017_intime(SF2017_SHOP_TIME2) == 1 then
            SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3083, "C�a h�ng Xu�n M�i"))
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