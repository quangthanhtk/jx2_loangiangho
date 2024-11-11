--����ģ�黯��һ����׼���ļ�����ģ��ֻ��Ҫʵ�ֶ�Ӧ�ı�׼�¼�������������Ҫ������Щ����ʲôʱ�򱻵���
--ģ���ģ��֮�䲻����Include�͵��ù�ϵ
--����ÿ��ģ���Ƕ�����
--����Ҫ��handler��ע�͵�������ջص�Ӱ��Ч��

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\biwudahui\\tournament\\tournament_head.lua")
t_isolate_base_cfg = { --����һ������������
    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "tong_extension",
    szViewName 			= "M� r�ng t�nh n�ng bang h�i",
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}
 TongExt_szThisFile = "\\script\\isolate\\functions\\tong_extension\\main.lua"
-----------------------Tong Extension Config-----------------------
 TongExt_TONG_MAX_CASH             = 12000

 TongExt_TSKID_SELF_LIVENESS       = 3472
 TongExt_TSKID_LIVENESSPERWEEK     = 3474
 TongExt_TSKID_ROB_LIMIT           = 3479 -- ÿ���һ����ɱ���boss�ɻ�û�Ծ��
 TongExt_TSKACCESSCODE_LIVENESS    = 0
 TongExt_LIVENESSPERWEEK_LIMIT     = 84 -- ���ÿ�ܿ��Ի�õ������޻�Ծ��
 TongExt_MAX_SELF_LIVENESS         = 18000
 TongExt_TONG_DEFAULT_CASH         = 100

 TongExt_Activity_1v1_times = 3487
 TongExt_Activity_3v3_times = 3488
-----------------------Tong Extension Devotion-----------------------
-- ������Ʒ������Ŀǰֻ��һ���������������Ϣ����Ʒ����������֧��9�֡�ÿ��ÿ�������Ծ���9�Ρ�
 TongExt_TSKID_DEVOTION_LIMIT      = 3473

 TongExt_DEVOTION_CONFIG = {
    -- ����ʽ �� {��Ʒ��, {��Ʒ g d p n}, ��û�Ծ��, ��ð���ʽ�, ÿ�ܴ��� }
    { "Thi�n Cang L�nh", { 2,95,204,1 },  350,  350,  9 },
    { "Thi�n M�n Kim L�nh", { 2,1,30370,1 },  350,  350,  9 },
    { "Thi�n Ki�u L�nh", { 2,97,236,1 },  10,  10,  9 },
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
    [PackItemId(2,1,31211)] = { "�� ��ng Tri�u G�i Ph� C�p 1","tong_juxiang","C� T��ng",1 },
    [PackItemId(2,1,31212)] = { "�� ��ng Tri�u G�i Ph� C�p 2","tong_tongbiyuan","Th�ng T� Vi�n",2 },
    [PackItemId(2,1,31213)] = { "�� ��ng Tri�u G�i Ph� C�p 3","tong_zhujian","Gia Ki�n",3 },
    [PackItemId(2,1,31214)] = { "�� ��ng Tri�u G�i Ph� C�p 4","tong_lingjiu","Linh T�u",4 },
    [PackItemId(2,1,31215)] = { "�� ��ng Tri�u G�i Ph� C�p 5","tong_huxian","H� Ti�n",5 },
    [PackItemId(2,1,31216)] = { "�� ��ng Tri�u G�i Ph� C�p 6","tong_zhujiuyin","Ch�c C�u �m",6 },
    [PackItemId(2,1,31217)] = { "�� ��ng Tri�u G�i Ph� C�p 7","tong_jialouluo","Ph�ng Ho�ng",7 },
    [PackItemId(2,1,31218)] = { "�� ��ng Tri�u G�i Ph� C�p 8","tong_fengxi","Phong Hi",8 },
    [PackItemId(2,1,31219)] = { "�� ��ng Tri�u G�i Ph� C�p 9","tong_baize","B�ch Tr�ch",9 },
    [PackItemId(2,1,31220)] = { "�� ��ng Tri�u G�i Ph� C�p 10","tong_wushen","V� Th�nh",10 },
}
 TongExt_TOTEM_INFO = {
    -- { ͼ�������� �޻���Ʒid�� ����ʱ��Ϣ��ʾ�� ���������ʽ����ģ������̵�id, ����ʱ�����ʽ�,������������ȼ� }
    {"C� T��ng",   PackItemId(2,1,31221),"C� T��ng tr� th�nh Th� H� �� ��ng m�i c�a bang, m� Ti�m Ph�c L�i c�p 1.", 350, 1 ,700, 0},
    {"Th�ng T� Vi�n", PackItemId(2,1,31222),"Th�ng T� Vi�n tr� th�nh Th� H� �� ��ng m�i c�a bang.", 700, 1, 1400, 0},
    {"Gia Ki�n",   PackItemId(2,1,31223),"Gia Ki�n tr� th�nh Th� H� �� ��ng m�i c�a bang, m� ho�t ��ng bang-Kinh Th� Thi�t T�c", 1100, 1, 2200, 0},
    {"Linh T�u",   PackItemId(2,1,31224),"Linh T�u tr� th�nh Th� H� �� ��ng m�i c�a bang, m� Ti�m Ph�c L�i c�p 2. Bang ch� v� tr��ng l�o c� th� ph�t ph�c l�i � ch� Qu�n Gia Bang.", 1450, 2, 2900, 1},
    {"H� Ti�n",   PackItemId(2,1,31225),"H� Ti�n tr� th�nh Th� H� �� ��ng m�i c�a bang.", 1890, 2, 3780, 1},
    {"Ch�c C�u �m", PackItemId(2,1,31226),"Ch�c C�u �m tr� th�nh Th� H� �� ��ng m�i c�a bang.", 2470, 2, 4940, 1},
    {"Ph�ng Ho�ng", PackItemId(2,1,31227),"Ph�ng Ho�ng tr� th�nh Th� H� �� ��ng m�i c�a bang, m� Ti�m Ph�c L�i c�p 3. Ph�c l�i bang t�ng c�p.", 2750, 3, 5500, 2},
    {"Phong Hi",   PackItemId(2,1,31228),"Phong Hi tr� th�nh Th� H� �� ��ng m�i c�a bang.", 3500, 3, 7000, 2},
    {"B�ch Tr�ch",   PackItemId(2,1,31229),"B�ch Tr�ch tr� th�nh Th� H� �� ��ng m�i c�a bang.", 4500, 3, 9000, 2},
    {"V� Th�nh",   PackItemId(2,1,31230),"V� Th�nh tr� th�nh Th� H� �� ��ng m�i c�a bang, ph�c l�i bang h�i t�ng.", 6000, 3, 12000, 3},
}

 TongExt_SHOP_INFO = {
     [1] = {3097,"Ti�m Ph�c L�i Bang C�p 1"},
     [2] = {3098,"Ti�m Ph�c L�i Bang C�p 2"},
     [3] = {3099,"Ti�m Ph�c L�i Bang C�p 3"},
 }

 TongExt_TOTEM_BOSS_SOUL = {
    {"tong_juxiangzhihun","C� T��ng Chi H�n",{ 301,304,308 }},
    {"tong_tongbiyuanzhihun","Th�ng T� Vi�n Chi H�n",{201,203,205}},
    {"tong_zhujianzhihun","Gia Ki�n Chi H�n",{105,108}},
    {"tong_lingjiuzhihun","Linh T�u Chi H�n",{401}},
    {"tong_hunxianzhihun","H� Ti�n Chi H�n",{218}},
    {"tong_zhujiuyinzhihun","Ch�c C�u �m Chi H�n",{406}},
    {"tong_jialouluozhihun","Ph�ng Ho�ng Chi H�n",{106}},
    {"tong_fengxizhihun","Phong Hi Chi H�n",{504}},
    {"tong_baizezhihun","B�ch Tr�ch Chi H�n",{402}},
    {"tong_wushenzhihun","V� Th�nh Chi H�n",{507}},
}

TongExt_ROB_TOTEM_BOSS_GET_CASH = {  -- ����İ���ͼ���޿���Ϊ�Լ�����ṩ�ʽ�
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
    { "Ph�t t�ng Ph�c L�i c�p 1 (Ti�u hao 1000 ng�n qu� bang h�i)", 1000, 4 ,"T�i Qu� Ph�c L�i Bang C�p 1" ,"tong_free1", {2, 1, 31208} },
    { "Ph�t t�ng Ph�c L�i c�p 2 (Ti�u hao 2000 ng�n qu� bang h�i)", 2000, 7 ,"T�i Qu� Ph�c L�i Bang C�p 2" ,"tong_free2", {2, 1, 31209} },
    { "Ph�t t�ng Ph�c L�i c�p 3 (Ti�u hao 3500 ng�n qu� bang h�i)", 3500, 10,"T�i Qu� Ph�c L�i Bang C�p 3" ,"tong_free3", {2, 1, 31210} },
}

 TongExt_TONG_AWARD = {
     [PackItemId(2, 1, 31208)] = {"tong_free1"},
     [PackItemId(2, 1, 31209)] = {"tong_free2"},
     [PackItemId(2, 1, 31210)] = {"tong_free3"},
     [PackItemId(2, 1, 31231)] = {"4xingjinshe"},
 }
-- ��¼ { npcidx ={ tongidx, endtime, nType, szTongName }  }
 TongExt_BOSS_BUFF = {}

-- ��¼ { npcidx ={ tongid }  }
 TongExt_BOSS_SOUL_BUFF = {}


TongExt_BOSS_MATERIAL = {
	[PackItemId(2,0,737)] = {1, "T� Quang Kim Thi�n Ti",3481, 50},
	[PackItemId(2,0,736)] = {2, "T� Quang K� L�n V�",3482, 50},
	[PackItemId(2,0,739)] = {3, "Th��ng C� K� L�n Huy�t",3483, 50},
	[PackItemId(2,0,738)] = {4, "M�nh Ti�t Ho�nh Th�",3484, 50},
	[PackItemId(2,0,735)] = {5, "T� Quang Li�t Di�m C�m",3485, 50},
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
        local nOffset  = 60; -- �ж�ʱ������ֵ
        if      nResTime <= 0   then  TongExt_BossOverTime(k)
        elseif  nResTime - 60 < nOffset and  nResTime - 60 >= 0  then  SendTongMessageByTongID(nTongID, format("%s mu�n ch�y tr�n, h�y tranh th� th�i gian tr� kh� h�n. (C�n 1 ph�t )",szName))
        elseif  nResTime - 5*60 < nOffset and nResTime - 5*60 >= 0 then  SendTongMessageByTongID(nTongID, format("%s mu�n ch�y tr�n, h�y tranh th� th�i gian tr� kh� h�n. (C�n 5 ph�t )",szName))
        elseif  nResTime - 10*60 < nOffset and nResTime - 10*60 >= 0  then  SendTongMessageByTongID(nTongID, format("%s mu�n ch�y tr�n, h�y tranh th� th�i gian tr� kh� h�n. (C�n 10 ph�t )",szName))
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
        Msg2Player(format("Do tu�n n�y �� t�ch c�c c� nh�n c�a ho�t ��ng %s �� ��t gi�i h�n, ho�t ��ng l�n n�y nh�n ���c %d �� t�ch c�c v� t�ng ng�n qu� bang h�i c�ng m�c cho bang h�i. C�ng c� th� ��n Bi�n Kinh [Qu�n Gia Bang] nh�n th�m t�ch c�c c� nh�n v� ng�n qu� bang h�i khi quy�n g�p.",szType,nLivenessAdd));
    else
        Msg2Player(format("Ho�t ��ng l�n n�y nh�n ���c %d �� t�ch c�c v� t�ng ng�n qu� bang h�i c�ng m�c cho bang h�i.",nLivenessAdd));
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
    AddTongCash(TongExt_TONG_DEFAULT_CASH)            -- �´����İ��ֱ�Ӹ���100��
end

function TongExt_LeaveTong()
    --  �˰��ʱ��ɾ���ٻ�ȯ���޻�
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
    local nTimes = GetTask(TongExt_Activity_1v1_times) -- ��ȡ��ʤ������
    TongExt_ActionAward(nCurBiwudahui - nTimes, nCurBiwudahui - nTimes, "PVP")
    SetTask(TongExt_Activity_1v1_times, nCurBiwudahui)
end

function TongExt_3v3_Award()
    local nCur3V3   = GetTask(TASKID_3V3_TOTAL_ROUND_DAILY)
    local nTimes = GetTask(TongExt_Activity_3v3_times) -- ��ȡ��ʤ������
    SetTask(TongExt_Activity_3v3_times, nCur3V3)
    TongExt_ActionAward(nCur3V3 - nTimes, nCur3V3 - nTimes, "PVP")
end


t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskId, nAcessCode = 0},
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
    {"event_mission_stage_finish", {"taiyihero", 6}, TongExt_ActionCompleted,{ 4, 4, "PVE" } },	---Ӣ��̫һ��ͨ�����һ�� 200 ����3
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
           if CustomAwardGiveGroup(szAward, 0) > 0 then   --���Ų���Ϊ�Ƿ����ȫ������
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
        Talk(1,"","Th� H�n n�y tr� n�n b�nh t�nh vui v�, kh�ng c�n hung �c nh� tr��c. H�nh nh� n� �ang n�i g� ��, nh�ng ti�c l� ng��i kh�ng th� hi�u ���c.")
        return 
    end
    local nDuty = GetTongDuty();
    if nDuty > 3 or nDuty < 0 then
		Talk(1,"",format("<color=gold>%s:<color>%s", GetTargetNpcName(), "C�m �n m�i ng��i �� gi�p ta tho�t kh�i s� th� h�n, ta c� m�n qu� mu�n t�ng, h�y n�i bang ch� ho�c tr��ng l�o ��n ��y, h�nh th�i c�a ta kh�ng th� duy tr� qu� l�u."))
		return
	end
    local szTitle = format("<color=gold>%s:<color>%s", GetTargetNpcName(), "C�m �n c�c ng��i �� gi�p ta tho�t kh�i s� th� h�n, ta s� t�ng Th� H�n cho c�c ng��i, hy v�ng s�c m�nh c�a n� gi�p �ch cho bang c�a ng��i.");
    local tbSay = {}
    tinsert(tbSay,format("Nh�n Th� H�n/#TongExt_GetBossSoul(%d)",nType))
    tinsert(tbSay,"H�y b�/nothing")
    Say(szTitle,getn(tbSay),tbSay);
end

function TongExt_GetBossSoul( nType )
    local nBossSoul = GetTargetNpc();
    if nBossSoul == nil or nBossSoul <= 0 or TongExt_BOSS_SOUL_BUFF[tostring(nBossSoul)] == nil then
        Talk(1,"","Th� H�n �� bi�n m�t......")
        return
    end
    if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
		return 
	end
    local g,d,p = UnPackItemId(TongExt_TOTEM_INFO[nType][2]);
    SetNpcLifeTime(nBossSoul,0);
    AddItem(g,d,p,1);
    SendTongMessage(format("%s �� nh�n Th� H�n c�p %d.",GetName(),nType));
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
        Talk(1,"",format("<color=gold>%s:<color>%s", GetTargetNpcName(), "Kh�ng ph�i th�nh vi�n bang, h�y gia nh�p 1 bang."))
        return
    end
    local szTitle = format("<color=gold>%s:<color>%s", GetTargetNpcName(), "V�t ph�m d��i ��y c� th� g�p, c� nh�n nh�n ���c �� t�ch c�c, bang nh�n ���c ng�n qu� bang h�i")
    local tbSay = {}
    for i = 1, getn(TongExt_DEVOTION_CONFIG) do
        local tbDevotion = TongExt_DEVOTION_CONFIG[i]
        local nTimes = TongExt_GetTaskByDecimal(TongExt_TSKID_DEVOTION_LIMIT, i)
        tinsert( tbSay,format("G�p %d %s, nh�n ���c %d �� t�ch c�c, t�ng cho bang h�i %d �i�m ng�n qu� bang h�i. (C�n %d/%d l�n)/#TongExt_Devote(%d)", tbDevotion[2][4], tbDevotion[1], tbDevotion[3], tbDevotion[4], nTimes, tbDevotion[5], i) )
    end
    tinsert( tbSay,"T�m bi�t!/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function TongExt_Devote( nType )
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        Talk(1,"",format("<color=gold>%s:<color>%s", GetTargetNpcName(), "Kh�ng ph�i th�nh vi�n bang, h�y gia nh�p 1 bang."))
        return
    end
    local nTimes = TongExt_GetTaskByDecimal(TongExt_TSKID_DEVOTION_LIMIT, nType)
    local tbDevotion = TongExt_DEVOTION_CONFIG[nType]
    if nTimes >= tbDevotion[5] then
        Talk(1,"",format("<color=gold>%s:<color>%s", GetTargetNpcName(), "S� l�n g�p tu�n n�y �� ��y, tu�n sau h�y g�p ti�p."))
        return
    end
    local nCount = GetItemCount(tbDevotion[2][1],tbDevotion[2][2],tbDevotion[2][3])
    if nCount < tbDevotion[2][4] then
        Talk(1,"",format("<color=gold>%s:<color> %s kh�ng ��, h�y mang �� %d r�i ��n.", GetTargetNpcName(), tbDevotion[1], tbDevotion[2][4]))
        return
    end
    if DelItem(tbDevotion[2][1],tbDevotion[2][2],tbDevotion[2][3],tbDevotion[2][4]) ~= 1 then
        Talk(1,"",format("<color=gold>%s:<color> G�p th�t b�i, h�y th� l�i sau.", GetTargetNpcName()))
        return
    end
    TongExt_SetTaskByDecimal(TongExt_TSKID_DEVOTION_LIMIT, nType, nTimes+1);
    TongExt_AddLiveness( tbDevotion[3] )
    TongExt_AddTongCash( tbDevotion[4] )
    SendTongMessage(format("%s �� t�ng %d %s, nh�n ���c %d �� t�ch c�c bang h�i, t�ng cho bang h�i %d �i�m ng�n qu� bang h�i",GetName(),tbDevotion[2][4],tbDevotion[1],tbDevotion[3],tbDevotion[4]))
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
        Msg2Player("T�ch c�c c� nh�n �� ��t gi�i h�n.")
    end
    if withoutMsg == nil then 
        Msg2Player(format("B�n nh�n ���c %d �� t�ch c�c bang h�i.",nVar))
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
        return -- ��Ҫ��Ϣ
    end
    if nAddCash == nVar then
        Msg2Player(format("Bang h�i c�a b�n nh�n ���c %d �i�m ng�n qu� bang h�i.",nVar))
    else
        Msg2Player(format("Bang h�i c�a b�n nh�n ���c %d �i�m ng�n qu� bang h�i. Ng�n qu� bang h�i �� ��t gi�i h�n.",nAddCash))
    end
end



function TongExt_OnUseTicket( nIndex )
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        Msg2Player("Kh�ng ph�i th�nh vi�n bang h�i, kh�ng th� s� d�ng Tri�u G�i Ph�.")
        return
    end
    local nDuty = GetTongDuty();
    if nDuty > 3 or nDuty < 0 then
		Talk(1,"","Ch� bang ch�, ph� bang v� tr��ng l�o ���c s� d�ng Tri�u G�i Ph�!");
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
        Talk(1,"",format("Bang h�i c�a b�n c�n c� %s �� ��ng m�i ���c s� d�ng Tri�u G�i Ph� n�y.",TongExt_TOTEM_INFO[nBossType - 1][1]))
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
        Talk(1,"",format("Kh�ng th� g�i %s � khu v�c n�y!",tBossTicket[3]));
		return 0;
    end
    if DelItemByIndex( nIndex,1 )~= 1 then
        Msg2Player("G�i b� l�i, h�y th� l�i sau.")
        return
    end
    local nNpcIdx = CreateNpc(tBossTicket[2],tBossTicket[3],m,x,y);
    local nEndTime = GetTime() + TongExt_BOSS_LIVE_TIME;
    local szTongName = GetTongName();
    SetNpcDeathScript(nNpcIdx, TongExt_szThisFile);
    TongExt_BOSS_BUFF[tostring(nNpcIdx)] = {nTongId, nEndTime, tBossTicket[4], szTongName}; -- �����¼boss��Ϣ
    local szGlobalMsg = format("Bang %s t�i %s �� g�i Th� H� Th� %s, h�y mau thu ph�c!",szTongName ,GetMapName(m), tBossTicket[3]);
    Msg2Global(szGlobalMsg)
    AddGlobalNews(szGlobalMsg, 1);
    SendTongMessage(format("%s t�i %s �� g�i Th� H� Th� %s, m�i ng��i mau thu ph�c!",GetName(),GetMapName(m),tBossTicket[3]))
end

function TongExt_BossOverTime( nIndex )
    local nBossTongIdx = TongExt_BOSS_BUFF[tostring(nIndex)][1];
    local nType = TongExt_BOSS_BUFF[tostring(nIndex)][3]
    local szBossName = TongExt_TOTEM_INFO[nType][1]
    local szTongName = TongExt_BOSS_BUFF[tostring(nIndex)][4];
    SetNpcLifeTime(nIndex , 0)
    TongExt_BOSS_BUFF[tostring(nIndex)] = nil;
    -- SendTongMessageByTongID(nBossTongIdx,"Boss Run Awary")
    Msg2Global(format("Bang h�i %s ch�a th� ��nh b�i %s, n� �� tr�n tho�t.", szTongName, szBossName))
end

function TongExt_GiveGiftTalk()
    local nTongId = GetTongID()
    local szNpcName = GetTargetNpcName();
    local nTotemType, _ = GetTongTotem();
    local nNeedTotemLv = TongExt_TONG_GIFT[1][3];
    if nTongId == 0 or nTongId == nil then
        Talk(1,"",format("<color=gold>%s:<color>%s", szNpcName, "Kh�ng ph�i th�nh vi�n bang"))
        return
    end
    local nDuty = GetTongDuty();
    if nDuty > 3 or nDuty < 0 then
        Talk(1,"",format("<color=gold>%s:<color>%s", szNpcName, "Mu�n ph�c l�i bang, h�y n�i tr��ng l�o ho�c bang ch� t�i g�p ta."))
		return
	end
    if nTotemType < nNeedTotemLv then
        Talk(1,"",format("<color=gold>%s:<color>%s", szNpcName, "C�p �� ��ng Bang qu� th�p, ch�a th� ph�t ph�c l�i bang."))
        return 
    end
    local szTitle = format("<color=gold>%s:<color>%s", szNpcName, "Nay bang h�i ng�y m�t ph�t tri�n, c� th� ph�t ph�c l�i cho bang ch�ng. Ng��i th�y sao? (Bang nh�n ���c Th� H� Th� Linh T�u tr� l�n m�i c� th� ph�t)")
    local tbSay = {}
    
    for i = 1, getn(TongExt_TONG_GIFT) do
        local tGift = TongExt_TONG_GIFT[i];
        if tGift[3] <= nTotemType then
            tinsert(tbSay, format("%s/#TongExt_GiveGift(%d)",tGift[1],i))
        end
    end
    tinsert(tbSay, "H�y b�/nothing")
    Say( szTitle, getn(tbSay), tbSay )
end

function TongExt_GiveGift( nType )
    local szNpcName = GetTargetNpcName();
    local tGift = TongExt_TONG_GIFT[nType];
    local nCurCash = GetTongCash();
    local nCashCost = tGift[2];
    local nTotemType, _ = GetTongTotem();
    if nCurCash <  nCashCost + TongExt_TOTEM_INFO[nTotemType][4] then
        Talk(1,"",format("<color=gold>%s:<color> Ng�n qu� bang h�i kh�ng ��, h�y t�m g�c l�i chuy�n ph�c l�i bang ch�ng. (Sau khi ph�t ph�c l�i, qu� c�n l�i c� th� ti�u hao cho tu�n sau)", szNpcName ))
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
        Talk(1,"","Kh�ng ph�i th�nh vi�n bang")
        return
    end
    local nDuty = GetTongDuty();
    if nDuty > 3 or nDuty < 0 then
        Talk(1,"","Ch� tr��ng l�o tr� l�n m�i ���c t�ng c�p �� ��ng.")
		return 0;
	end
    local nTotemType = GetTongTotem()
    if nTotemType >= getn(TongExt_TOTEM_INFO) then
        Talk(1,"","�� ��ng �� ��t c�p cao nh�t.")
        return 
    end
    local szNextName = TongExt_TOTEM_INFO[nTotemType+1][1]
    local szTitle = format("Bang h�i ng�y c�ng ph�n vinh, n�u l�y ���c h�n ph�ch c�a <color=red>%s<color>, bang h�i s� c�ng th�nh v��ng.", szNextName)
    local g,d,p = UnPackItemId( TongExt_TOTEM_INFO[nTotemType + 1][2] )
    local nSoulCnt = GetItemCount(g,d,p);
    local tbSay = {}
    if nSoulCnt > 0 then
        tinsert(tbSay, format("Ta �� l�y h�n %s, mu�n ��i Th� H� �� ��ng Bang (Ti�u hao %d ng�n qu� bang h�i)/#TongExt_ChangeTotem(%d)",szNextName,TongExt_TOTEM_INFO[nTotemType+1][6],nTotemType+1))
    end
    tinsert(tbSay, "Ta ��n xem Th� H� �� ��ng/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function TongExt_ChangeTotem(nType)
    local nTongId = GetTongID()
    if nTongId == 0 or nTongId == nil then
        Talk(1,"","Kh�ng ph�i th�nh vi�n bang")
        return
    end
    local nDuty = GetTongDuty();
    if nDuty > 3 or nDuty < 0 then
        Talk(1,"","Ch� tr��ng l�o tr� l�n m�i ���c t�ng c�p �� ��ng.")
		return 0;
	end
    local nCurCash = GetTongCash()
    if nCurCash < TongExt_TOTEM_INFO[nType][6] then
        Talk(1,"",format("T�ng Th� H� �� ��ng c�n t�n %d ng�n qu� bang h�i.",TongExt_TOTEM_INFO[nType][6]))
		return 0;
    end
    local szFun = format("TongExt_ChangeTotemCB%d",nType);
    AddTongCash(-TongExt_TOTEM_INFO[nType][6], TongExt_szThisFile, szFun);
end
function TongExt_ChangeTotemCB( bSuc,nType )
    if bSuc == 0 then
        Talk(1,"","Tr� ng�n qu� bang h�i th�t b�i, h�y th� l�i")
        return
    end
    local g,d,p = UnPackItemId( TongExt_TOTEM_INFO[nType][2] )
    if DelItem(g,d,p,1) ~= 1 then
        Talk(1,"","T�ng �� ��ng th�t b�i, h�y x�c nh�n trong t�i c� linh h�n �� ��ng c�p n�y.")
        return
    end
    SetTongTotem(nType, nType);
    SendTongMessage(TongExt_TOTEM_INFO[nType][3]);
    PostOneTongEventMsg(TongExt_TOTEM_INFO[nType][3])
    if nType >= 3 then
        Msg2Global(format("Bang %s �� ��nh b�i %s v� coi n� l� Th� H� �� ��ng",GetTongName(),TongExt_TOTEM_INFO[nType][1]))
    end
    AddRuntimeStat(51, nType, 0, 1) --����ͼ�ڴ���ͳ��
    local nGiftType = TongExt_TOTEM_INFO[nType][7]
    AddRuntimeStat(52,nGiftType,0,1)
    SendGift2TongMember(nGiftType);                 -- ���ͼ�ں����
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
    if nBossTongIdx == nSlayerTongIdx then -- ����Ա��ɱ
        szKillMsg = format("Bang %s �� ��nh b�i %s, d�ng s� ra ��n cu�i l� %s",GetTongName(),szBossName,GetName());
        PostOneTongEventMsg(format("Bang h�i �� ��nh b�i [%s], d�ng s� ra ��n cu�i l� [%s]",szBossName,GetName()  ));
        local tSoulInfo = TongExt_TOTEM_BOSS_SOUL[nType];
        local nBossSoul = CreateNpc(tSoulInfo[1],tSoulInfo[2],m,x,y);
        TongExt_BOSS_SOUL_BUFF[tostring(nBossSoul)] = {nSlayerTongIdx,nType};
        SetNpcLifeTime(nBossSoul,TongExt_BOSS_SOUL_LIFETIME);
        Msg2Global(szKillMsg);
        -- SetLastKillTotem(nType); -- ����Ʒ�ж�ͼ������������������Ҫ��
    else                              -- ��������
        szKillMsg = format("��ng gh�t! [%s] �� di�t [%s], th� n�y ph�i tr�!", GetName(), szBossName)
        Msg2Global(format("Gi�a ���ng di�t %s, di�t bang %s g�i ra-%s!", GetName(), TongExt_BOSS_BUFF[tostring(index)][4], szBossName));
        SendTongMessageByTongID(nBossTongIdx, szKillMsg);
        if nSlayerTongIdx == 0 or nSlayerTongIdx == nil then
            -- �����߲�û�а�ᣬû�����ֽ�����
            return 
        end
        if GetTask(TongExt_TSKID_ROB_LIMIT) == 0 then
            TongExt_AddLiveness(12);
        end
        SetTask(TongExt_TSKID_ROB_LIMIT,1)
        TongExt_AddTongCash(TongExt_ROB_TOTEM_BOSS_GET_CASH[nType]);
        SendTongMessage(format("[%s] �� di�t bang [%s] g�i ra-[%s], bang ch�ng ���c %d ng�n qu� bang h�i!",
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
        Talk(1,"","Bang c�a b�n v�n ch�a c� Th� H� �� ��ng, n�n ch�a m� Ti�m Ph�c L�i.")
        return 
    end
    local nShop = TongExt_TOTEM_INFO[nType][5];
    local szTitle = "Bang hi�n t�i c� th� m� ti�m:"
    local tSay = {}
    for i = 1,nShop do
        local tShopinfo = TongExt_SHOP_INFO[i];
        tinsert(tSay,format("%s/#TongExt_OnGiftShopConfirm(%d, \'%s\')",tShopinfo[2],tShopinfo[1],tShopinfo[2]))
    end
    tinsert(tSay,"tr� l�i/nothing");
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
        Talk(1,"","Kh�ng ph�i th�nh vi�n bang")
        return
    end
    local nItem = TongExt_BOSS_MATERIAL_IDX[nType];
    local g,d,p = UnPackItemId(nItem);
    local nCount = GetItemCount(g,d,p);
    local szItemName = TongExt_BOSS_MATERIAL[nItem][2];
    
    if nCount <= 0 then
        Talk(1,'',format("%s mang theo kh�ng ��.",szItemName))
        return
    end
    local nCurGive = GetTask(TongExt_BOSS_MATERIAL[nItem][3])
    if nCurGive >= TongExt_BOSS_MATERIAL[nItem][4] then
        Talk(1,"",format("S� l��ng n�p trong tu�n �� ��t gi�i h�n (%d), kh�ng th� n�p n�a.",TongExt_BOSS_MATERIAL[nItem][4]))
        return
    end
    local nMax = min(nCount, TongExt_BOSS_MATERIAL[nItem][4]-nCurGive)
    AskClientForNumber(format("TongExt_OnTongHandInBtnClickCB_%d",nType), 1, nMax, "N�p bao nhi�u?",97);
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
        Talk(1,"","Kh�ng ph�i th�nh vi�n bang")
        return
    end
    local nItem = TongExt_BOSS_MATERIAL_IDX[nType];
    local g,d,p = UnPackItemId(nItem)
    local nCurGive = GetTask(TongExt_BOSS_MATERIAL[nItem][3])
    if nCurGive + nNum > TongExt_BOSS_MATERIAL[nItem][4] then
        Talk(1,"",format("S� l��ng n�p trong tu�n �� ��t gi�i h�n (%d), kh�ng th� n�p n�a.",TongExt_BOSS_MATERIAL[nItem][4]))
        return
    end
    if DelItem(g,d,p,nNum) ~= 1 then
        Talk(1,"","N�p th�t b�i, h�y th� l�i")
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
        Talk(1,"",format("<color=gold>%s:<color> Kh�ng ph�i th�nh vi�n bang",szNpcName ))
        return
    end
    local nTongDuty = GetTongDuty()
    if nTongDuty < 0 or nTongDuty > 3 then
        Talk(1,"",format("<color=gold>%s:<color> Ch� c� ch�c v� tr��ng l�o tr� l�n m�i ���c mua Tri�u G�i Ph�.", szNpcName))
        return
    end
    local nMaxTotem,_ = GetTongTotem()
    if nMaxTotem < getn(TongExt_BOSS_SUMMON_TICKET_IDX) then
        nMaxTotem = nMaxTotem + 1;
    end
    local szTitle = format("<color=gold>%s:<color> Bang hi�n t�i c� th� mua Tri�u G�i Ph� sau.", szNpcName)
    local tbSay = {}
    for i = 1, nMaxTotem do
        local nTicket = TongExt_BOSS_SUMMON_TICKET_IDX[i];
        local szTicketName = TongExt_BOSS_SUMMON_TICKET[nTicket][1];
        local szBossName = TongExt_BOSS_SUMMON_TICKET[nTicket][3];
        tinsert(tbSay,format("%s(%s)/#TongExt_BuyBoss(%d)",szTicketName,szBossName,i));
    end
    tinsert(tbSay,"H�y b�/nothing");
    Say( szTitle,getn(tbSay),tbSay )
end

function TongExt_BuyBoss( nType )
    local szNpcName = GetTargetNpcName();
    local nTicket = TongExt_BOSS_SUMMON_TICKET_IDX[nType];
    local szTicketName = TongExt_BOSS_SUMMON_TICKET[nTicket][1];
    local tCost = TongExt_BOSS_TICKET_COST[nType]
    local szTitle = format("<color=gold>%s:<color> Mu�n mua %s bang ph�i c� nguy�n li�u sau:\n",szNpcName,szTicketName )
    for i = 1,getn(TongExt_BOSS_MATERIAL_IDX) do
        local tMat = TongExt_BOSS_MATERIAL[TongExt_BOSS_MATERIAL_IDX[i]];
        szTitle = format("%s%s", szTitle, format("      <color=yellow>%s<color>:<color=red>%d<color>\n",tMat[2],tCost[i]) )
    end
    local tbSay = {}
    tinsert(tbSay,format("X�c ��nh /#TongExt_BuyBossConfirm(%d)",nType))
    tinsert(tbSay,"H�y b�/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function TongExt_BuyBossConfirm( nType )
    local nTongId = GetTongID();
    local szNpcName = GetTargetNpcName();
    if nTongId == 0 or nTongId == nil then
        Talk(1,"",format("<color=gold>%s:<color> Kh�ng ph�i th�nh vi�n bang",szNpcName ))
        return
    end
    local nTongDuty = GetTongDuty()
    if nTongDuty < 0 or nTongDuty > 3 then
        Talk(1,"",format("<color=gold>%s:<color> Ch� c� ch�c v� tr��ng l�o tr� l�n m�i ���c mua Tri�u G�i Ph�.", szNpcName))
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
        Talk(1,"",format("<color=gold>%s:<color> ��i th�t b�i, h�y ki�m tra bang h�i xem c� �� nguy�n li�u ch�a.",szNpcName))
        return
    end
    local nItem = TongExt_BOSS_SUMMON_TICKET_IDX[nType];
    local szItemName = TongExt_BOSS_SUMMON_TICKET[nItem][1];
    local g,d,p = UnPackItemId(nItem)
    AddRuntimeStat(53, nType, 0, 1) --�������ͳ��
    gf_AddItemEx({g,d,p,1}, szItemName);
end
-- AskClientForNumber("callback", n��С����, n�������, "��ʾ�ַ���");

-- Function callback(nNum)  ...... End

--����ΪӦ��ģ��Ŀ�ѡ���ã�ֻҪ��������Щ�����ͺ�����ϵͳ�ͻ��Զ�ע��ͻص�
--t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskId, nAcessCode = 0},
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
-- function on_first_login_clear(nLastLoginDate)--isolate���ߺ��һ�ε�¼ʱ������
-- 	t_Fix_201606:fix_up(nLastLoginDate)
-- end 



