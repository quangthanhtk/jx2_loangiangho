
Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
Import("\\script\\lib\\globalfunctions.lua")

t_isolate_base_cfg = { --����һ������������
    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "newWorldBoss",
    szViewName 			= "BOSS Th� Gi�i", -- ������BOSS
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}

nwb_tWorldBoss = {
    [1305] = {
        {
            "Huy�n V� Th�ong","Th��ng Th�n Doanh Thi�n",503,1493,3055, 
            "Nghe n�i th� v� th�n t�n c�a T�n Th�y Ho�ng l� Th��ng Th�n Doanh Thi�n �� xu�t hi�n t�i ".."T�n L�ng".." v� l�m s�p c� m�t tr�n h�o ki�p!",
            "\\script\\isolate\\functions\\new_world_boss\\npc\\qsyt_death.lua"
        },
    },
    [2105] = {
        {
            "WorldBoss_rwx", "Nh�m Ng� H�nh", 211,1792,3172, 
            "Nghe n�i n�m x�a Nh�m Ng� H�nh b� giam �".."D��ng Trung ��ng-2"..",Chuy�n n�y �t c� khu�t t�t!",
            "\\script\\isolate\\functions\\new_world_boss\\npc\\rwx_death.lua"
        },
        {
            "Nghi�t H�n","L�nh H��ng L�ng",307,1519,2967,
            "Nghe n�i h�n ma L�nh H��ng L�ng 10 n�m tr��c t�ng l� hoa kh�i Giang T�n Th�n nay xu�t hi�n t�i".."Phong ��".."mau ��n �� xem th� dung nhan ki�u di�m c�a n�ng!",
            "\\script\\isolate\\functions\\new_world_boss\\npc\\lxl_death.lua"
        },
    },
    [2305] = {
        {
            "S�n T�c ��u M�c","B�c L�c L�m Minh Ch�",311,1561,2700,
            "Nghe n�i minh ch� l�c l�m x�ng b� s�n tr�i ph�a b�c �ang � ".."Ph�c Ng�u s�n".." hi�n th�n, ch�c �ang c� �m m�u!",
            "\\script\\isolate\\functions\\new_world_boss\\npc\\llmz_death.lua"
        },
    },
}
nwb_topaward = {
    -- name  {item}, msg, time, rate
    {"R��ng Manh Manh",{2,1,31323,1,1},0,2592000,500,},
    {"R��ng Th� C��i Manh Manh",{2,1,31324,1,1},1,-1,5,},
    {"B�ch T�y",{2,1,30922,2,1},0,-1,500,},
    {"L�u Kim",{2,1,31096,2,1},0,-1,500,},
    {"Thi�n V�n Th�ch",{2,201,13,2,1},0,-1,500,},
    {"V� ��i Trang S�c Ngo�i Trang",{2,1,31320,4,1},0,-1,1200,},
    {"Thi�n Cang L�nh",{2,95,204,1,1},1,-1,20,},
    {"Thi�n M�n Kim L�nh",{2,1,30370,1,1},1,-1,20,},
    {"T�i Ch� D��ng Ho�n (Nh�)",{2,1,31322,5,1},0,-1,200,},
    {"Phi�u ��i Ngo�i Trang",{2,1,31233,4,1},0,-1,500,},
    {"C�y B�t Nh�",{2,0,398,1,1},0,-1,2040,},
    {"T�nh M�ch Ng�n Nh�n",{2,1,30731,1,1},0,-1,1000,},
    {"Thi�n Th�ch Tinh Th�ch",{2,1,1009,1,1},0,-1,1000,},
    {"T�y T�m Th�ch c�p 6",{2,1,30526,1,1},0,-1,1000,},
    {"Luy�n L� Thi�t c�p 6",{2,1,30532,1,1},0,-1,1000,},
    {"�i�m Tinh Ng�c-Nh�",{2,201,16,1,1},1,-1,10,},
    {"Chi�u Y�u K�",{2,1,31307,1,1},1,-1,5,},
}


nwb_midaward = {
    {" Manh Manh",{2,1,31323,1,1},0,-1,500,},
    {"Qu� Ng� Gia Ng�o",{2,1,31321,2,1},0,-1,500,},
    {"Thi�n Cang l�nh",{2,95,204,2,1},0,-1,100000,},
    {"Thi�n M�n Kim L�nh",{2,1,30370,2,1},0,-1,100000,},
    --{"V� ��i Trang S�c Ngo�i Trang",{2,1,31320,4,1},0,-1,1200,},
    --{"Thi�n Cang L�nh",{2,95,204,1,1},1,-1,10,},
    --{"Thi�n M�n Kim L�nh",{2,1,30370,1,1},1,-1,10,},
    --{"T�i Ch� D��ng Ho�n (Nh�)",{2,1,31322,5,1},0,-1,500,},
    --{"Phi�u ��i Ngo�i Trang",{2,1,31233,4,1},0,-1,1200,},
    --{"C�y B�t Nh�",{2,0,398,1,1},0,-1,2178,},
    --{"Thi�n Th�ch Tinh Th�ch",{2,1,1009,1,1},0,-1,1000,},
    --{"T�nh M�ch Ng�n Nh�n",{2,1,30731,1,1},0,-1,500,},
    --{"Chi�u Y�u K�",{2,1,31307,1,1},1,-1,2,},
}
nwb_bagaward = {
    --{"EXP",{0,0,0,5000000,1},0,-1,2500,},
    --{"EXP",{0,0,0,10000000,1},0,-1,1500,},
    --{"EXP",{0,0,0,20000000,1},0,-1,1000,},
    --{"EXP",{0,0,0,50000000,1},0,-1,1000,},
    --{"V� ��i Trang S�c Ngo�i Trang",{2,1,31320,1,1},0,-1,500,},
    --{"L�u Kim",{2,1,31096,1,4},0,-1,100,},
    --{"Thi�n V�n Th�ch",{2,201,13,1,4},0,-1,100,},
    --{"��ng T� Chi Nguy�n",{2,1,30913,1,4},0,-1,200,},
    --{"Phi�u ��i Ngo�i Trang",{2,1,31233,1,1},0,-1,200,},
    --{"Ch� D��ng Ho�n",{2,1,31255,5,4},0,-1,600,},
    --{"T�i Ch� D��ng Ho�n (Nh�)",{2,1,31322,1,4},0,-1,300,},
    --{"T�i Ch� D��ng Ho�n (Nh�)",{2,1,31322,2,4},0,-1,100,},
    --{"S� Tay C� T�",{2,1,31246,1,4},0,-1,50,},
    --{"B�ch T�y",{2,1,30922,1,4},0,-1,50,},
    --{"Thi�n Ki�u L�nh",{2,97,236,1,4},0,-1,10,},
    --{"Thi�n th�ch",{2,2,8,5,4},0,-1,350,},
    {"H�i Ti�n ��n",{2,1,30847,10,4},0,-1,-1,},
    {"B�a c��ng h�a 14",{2,1,30426,2,4},0,-1,-1,},
    {"Thanh Long h�n",{2,1,31194,1,4},0,-1,-1,},
    {"Linh Kh� r�c r�",{2,1,31122,1,4},1,-1,-1,},
}
nwb_BoxBuffer = {
    --[mapId] = {boxid = 12345, rest = 10, tong = "tongname", playerlist = {}}
}
function nwb_ItemStat(tAward)
    local g,d,p,l,time = tAward[2][1],tAward[2][2],tAward[2][3],tAward[2][4],tAward[3]
    if g == 2 and d == 95 and p == 204 then
        AddRuntimeStat(78, 1, 0, 1)     -- �����
    elseif g == 2 and d == 1 and p == 30370 then
        AddRuntimeStat(78, 2, 0, 1)     -- ���Ž���
    elseif g == 2 and d == 1 and p == 31307 then
        AddRuntimeStat(78, 4, 0, 1)     -- ������
    elseif g == 2 and d == 1 and p == 31324 and time == -1 then
        AddRuntimeStat(78, 3, 0, 1)     -- ������è��������
    end
end
function nwb_getmaxrate(tAward)
    local ret = 0
    for i=1, getn(tAward) do
        ret = ret + tAward[i][5]
    end
    return ret
end
nwb_bagaward_maxrate = nwb_getmaxrate(nwb_bagaward)

nwb_bossaward = {
    rwx = {nwb_topaward, 5, nwb_getmaxrate(nwb_topaward)},
    yt = {nwb_midaward, 5, nwb_getmaxrate(nwb_midaward)},
    lxl = {nwb_midaward, 5, nwb_getmaxrate(nwb_midaward)},
    llmz = {nwb_midaward, 5, nwb_getmaxrate(nwb_midaward)},
}

function WorldBoss_CreateBoss(nCallTime)
    local tBosses = nwb_tWorldBoss[nCallTime]
    for i = 1, getn(tBosses) do
        local tBoss = tBosses[i]
        if SubWorldID2Idx(tBoss[3]) >= 0 then
            local boss = CreateNpc(tBoss[1],tBoss[2],tBoss[3],tBoss[4],tBoss[5])
            SetNpcLifeTime(boss, 3600) -- 30����
            Msg2Global(tBoss[6])
            Msg2Global(tBoss[6])
            Msg2Global(tBoss[6])
            SetNpcDeathScript(boss, tBoss[7])
        end
    end
end
function WorldBoss_CreateBoss1300() WorldBoss_CreateBoss(1305) end -- �Ӻ�5����
function WorldBoss_CreateBoss2100() WorldBoss_CreateBoss(2105) end -- �Ӻ�5����
function WorldBoss_CreateBoss2300() WorldBoss_CreateBoss(2305) end -- �Ӻ�5����

t_isolate_user_batch_watch_list = {--{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), {nMaterialType, nNum}}
    --LongDaiKa: ��ng c�c lo�i boss th� gi�i m�i
    --{"event_server_time", {13, 5}, 	WorldBoss_CreateBoss1300,	{}  },
    --{"event_server_time", {21, 5}, 	WorldBoss_CreateBoss2100,	{}  },
    --{"event_server_time", {23, 5}, 	WorldBoss_CreateBoss2300,	{}  },
}

function nwb_dropaward(tAward, nTimes, m,x,y, maxrate, bossName)
    for i = 1, nTimes do
        local rand = random(1,maxrate)
        for j = 1, getn(tAward) do  
            if tAward[j][5] >= rand then
                local time = tAward[j][4]
                nwb_ItemStat(tAward[j])
                DropItemWithParam(tAward[j][2][1],tAward[j][2][2],tAward[j][2][3],m,x,y,0,300,tAward[j][2][4], tAward[j][4])
                if tAward[j][3] == 1 then
                    -- ����ʱ������
                    local szMsg = format("%s �� b� ��nh b�i, r�i ra %s x%d", bossName, tAward[j][1], tAward[j][2][4])
                    AddGlobalNews(szMsg, 1)
                    local nTongId = GetTongID()
                    if nTongId ~= 0 and nTongId ~= nil then
                        SendTongMessage(szMsg)
                    end
                    
                end
                break
            else
                rand = rand - tAward[j][5]
            end
        end
    end
end
function nwb_CreateBox(packName,m,x,y,nTimes)
    local m,_,_ = GetWorldPos()
    local boxIdx = CreateNpc("T�i cao th�",packName,m,x,y)
    local nTongId = GetTongID()
    local szTongName = GetTongName()
    if nTongId == 0 or nTongId == nil then
        szTongName = ""
    end
    SetNpcLifeTime(boxIdx, 600)
    local nTeamSize = GetTeamSize();
    local tOwner = {}
    local OldPlayerIndex = PlayerIndex
    if nTeamSize > 0 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
            tinsert(tOwner, GetName())
        end
    else
        tinsert(tOwner, GetName())
	end
    PlayerIndex = OldPlayerIndex
    nwb_BoxBuffer[m] = {
        boxid = boxIdx,
        rest = nTimes,
        endtime = GetTime()+600,
        tong = szTongName,
        owner = tOwner,
        playerlist = {},
    }
end

function nwb_kill_announce(szBossName)
    local szMsg = format("Ch�c m�ng [%s] �� ��nh b�i %s!",GetName(), szBossName)    
    AddGlobalNews(szMsg, 1)
    Msg2Global(szMsg)
    local nTongId = GetTongID()
    if nTongId ~= 0 and nTongId ~= nil then
        SendTongMessage(szMsg)
    end
end

tFailReason = {
    " th�nh c�ng ",
    "Bang c�a thi�u hi�p kh�ng s� h�u r��ng n�y!",
    "V�o bang ch�a �� 1 gi�, kh�ng th� nh�n",
    "R��ng n�y kh�ng thu�c v� ��i hi�p!",
    "Ng��i ch�i ��t ��n chuy�n sinh 5 tr� l�n m�i ���c m�",
}

function nwb_isTongLeader()
    local duty = GetTongDuty()
    if duty >= 1 and duty <= 3 then
        return 1
    end
    return 0
end

function nwb_canBoxAward()
    if gf_GetPlayerRebornCount() < 5 then
        return 5
    end
    local nTongId = GetTongID()
    local m,_,_ = GetWorldPos()
    local box = nwb_BoxBuffer[m]
    if box.tong ~= "" then
        --  �а��
        if box.tong ~= GetTongName() then
            return 2
        end
        local nJoinTime = GetTime() - GetJoinTongTime()
        
        if nJoinTime < 3600 then
            return 3
        end
    else
        local own = 0
        for i = 1,getn(box.owner) do
            if box.owner[i] == GetName() then
                own = 1
            end
        end
        if own == 0 then
            return 4
        end
    end
    return 1
end

function nwb_isBoxAwarded(box)
    local got = 0
    for i = 1,getn(box.playerlist) do
        if box.playerlist[i] == GetName() then
            got = 1
            break
        end
    end
    return got
end

function check_box_npc_valid(nNpcIdx)
    local szNpcName = GetNpcName(nNpcIdx);
    local bIsValid = 0;
    if szNpcName == "T�i c�a Th��ng Th�n Doanh Thi�n" 
        or szNpcName == "T�i C�a Nh�m Ng� H�nh"
            or szNpcName == "T�i c�a L�nh H��ng L�ng"
                or szNpcName == "T�i c�a B�c L�c L�m Minh Ch�" then
        bIsValid = 1;
    end

    return bIsValid
end

function nwb_box()
    local nTargetNpcIdx = GetTargetNpc();
    if check_box_npc_valid(nTargetNpcIdx) ~= 1 then
        WriteLog("[NewWorldBoss][nwb_box]:"..GetName().." NPC is not valid");
        return
    end 

    local m,_,_ = GetWorldPos()
    local box = nwb_BoxBuffer[m]
    if box == nil then
        SetNpcLifeTime(nTargetNpcIdx, 0)
        return
    end
    if box.rest <= 0 then
        SetNpcLifeTime(nTargetNpcIdx, 0)
        return
    end
    
    local res = nwb_canBoxAward()
    if res ~= 1 then
        Talk(1,"",tFailReason[res])
        return
    end

    local szTitle = format("<color=green>%s<color>: Ch�c m�ng ��nh b�i k� ��ch, c� th� nh�n th��ng trong r��ng.", GetTargetNpcName())
    local tbSay = {}
    local nTongId = GetTongID()
    if nTongId ~= 0 and nTongId ~= nil then
        szTitle = format("<color=green>%s<color>: Ch�c m�ng ��nh b�i k� ��ch, c�c h� v� th�nh vi�n trong bang c� th� nh�n th��ng trong r��ng. S� l�n ���c nh�n: <color=yellow>%d<color>\n", GetTargetNpcName(), box.rest)
    end
    local got = nwb_isBoxAwarded(box)
    if got == 1 then
        szTitle = szTitle .. "  <color=red>�� nh�n r�i, kh�ng th� nh�n n�a<color>"
    else
        tinsert(tbSay, "Nh�n l�y ph�n th��ng./nwb_box_award")
    end
    tinsert(tbSay, "��ng/nothing")
    Say(szTitle, getn(tbSay), tbSay)

end

function nwb_box_award()
    local nTargetNpcIdx = GetTargetNpc();
    if check_box_npc_valid(nTargetNpcIdx) ~= 1 then
        WriteLog("[NewWorldBoss][nwb_box_award]:"..GetName().." NPC is not valid");
        return
    end 

    local m,_,_ = GetWorldPos()
    local box = nwb_BoxBuffer[m]
    if box == nil then
        SetNpcLifeTime(nTargetNpcIdx, 0)
        return
    end
    if box.rest <= 0 then
        SetNpcLifeTime(nTargetNpcIdx, 0)
        return
    end
    if gf_JudgeRoomWeight(1, 100) ~= 1 then
        Talk(1,"","H�nh trang kh�ng �� ch�, kh�ng th� nh�n th��ng!")
        return 
    end
    if nwb_isBoxAwarded(box) == 1 then
        Talk(1,"","�� nh�n r�i, kh�ng th� nh�n l�i")
        return 
    end

    local res = nwb_canBoxAward()
    if res ~= 1 then
        Talk(1,"",tFailReason[res])
        return
    end

    tinsert(box.playerlist, GetName())
    box.rest = box.rest - 1
    if box.rest <= 0 then
        SetNpcLifeTime(nTargetNpcIdx, 0)
    end
    local szNpcName = GetTargetNpcName()
    if szNpcName == "T�i C�a Nh�m Ng� H�nh" then
        AddRuntimeStat(77, 1, 0, 1);
    elseif szNpcName == "T�i c�a Th��ng Th�n Doanh Thi�n" then
        AddRuntimeStat(77, 2, 0, 1);
    elseif szNpcName == "T�i c�a L�nh H��ng L�ng" then
        AddRuntimeStat(77, 3, 0, 1);
    elseif szNpcName == "T�i c�a B�c L�c L�m Minh Ch�" then
        AddRuntimeStat(77, 4, 0, 1);
    end
    
    local rand = random(1,nwb_bagaward_maxrate)
    for j = 1, getn(nwb_bagaward) do  
        if nwb_bagaward[j][5] >= rand then
            if nwb_bagaward[j][1] == "EXP" then
                gf_Modify("Exp",nwb_bagaward[j][2][4])
            else
                nwb_ItemStat(nwb_bagaward[j])
                gf_AddItemEx({nwb_bagaward[j][2][1],nwb_bagaward[j][2][2],
                    nwb_bagaward[j][2][3],nwb_bagaward[j][2][4],
                    nwb_bagaward[j][2][5]}, nwb_bagaward[j][1])
                
            end
            if nwb_bagaward[j][3] == 1 then -- ������Ϣ
                local szMsg = format("[%s] �� tham gia %s, m� ���c %s x%d",GetName(),szNpcName,nwb_bagaward[j][1],nwb_bagaward[j][2][4])
                AddGlobalNews(szMsg, 1)
                local nTongId = GetTongID()
                if nTongId ~= 0 and nTongId ~= nil then
                    SendTongMessage(szMsg)
                end
            end
            break
        else
            rand = rand - nwb_bagaward[j][5]
        end
    end
end

function lm_ringbag(nItemIdx)
    if gf_JudgeRoomWeight(1, 100) ~= 1 then
        Talk(1,"","H�nh trang kh�ng �� ch�, kh�ng th� m�!")
        return 
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        gf_AddItemEx({2,1,31255,10,1},"Ch� D��ng Ho�n")
    end
end

function on_add_watches()
    isolate_watch_npc_talk("T�i c�a Th��ng Th�n Doanh Thi�n", 503, "nwb_box")
    isolate_watch_npc_talk("T�i C�a Nh�m Ng� H�nh", 211, "nwb_box")
    isolate_watch_npc_talk("T�i c�a L�nh H��ng L�ng", 307, "nwb_box")
    isolate_watch_npc_talk("T�i c�a B�c L�c L�m Minh Ch�", 311, "nwb_box")
    isolate_watch_item_talk(2, 1, 31322, "lm_ringbag")
end