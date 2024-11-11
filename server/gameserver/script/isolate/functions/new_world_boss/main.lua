
Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
Import("\\script\\lib\\globalfunctions.lua")

t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= 1,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ð§ >0:Ä£¿éÓÐÐ§£¬ÊýÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "newWorldBoss",
    szViewName 			= "BOSS ThÕ Giíi", -- ÐÂÊÀ½çBOSS
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}

nwb_tWorldBoss = {
    [1305] = {
        {
            "HuyÒn Vâ Th­ong","Th­¬ng ThÇn Doanh Thiªn",503,1493,3055, 
            "Nghe nãi thÞ vÖ th©n tÝn cña TÇn Thñy Hoµng lµ Th­¬ng ThÇn Doanh Thiªn ®· xuÊt hiÖn t¹i ".."TÇn L¨ng".." vâ l©m s¾p cã mét trËn hµo kiÕp!",
            "\\script\\isolate\\functions\\new_world_boss\\npc\\qsyt_death.lua"
        },
    },
    [2105] = {
        {
            "WorldBoss_rwx", "NhËm Ng· Hµnh", 211,1792,3172, 
            "Nghe nãi n¨m x­a NhËm Ng· Hµnh bÞ giam ë".."D­¬ng Trung ®éng-2"..",ChuyÖn nµy ¾t cã khuÊt tÊt!",
            "\\script\\isolate\\functions\\new_world_boss\\npc\\rwx_death.lua"
        },
        {
            "NghiÖt Hån","L·nh H­¬ng L¨ng",307,1519,2967,
            "Nghe nãi hån ma L·nh H­¬ng L¨ng 10 n¨m tr­íc tõng lµ hoa kh«i Giang T©n Th«n nay xuÊt hiÖn t¹i".."Phong §«".."mau ®Õn ®ã xem thö dung nhan kiÒu diÔm cña nµng!",
            "\\script\\isolate\\functions\\new_world_boss\\npc\\lxl_death.lua"
        },
    },
    [2305] = {
        {
            "S¬n TÆc §Çu Môc","B¾c Lôc L©m Minh Chñ",311,1561,2700,
            "Nghe nãi minh chñ lôc l©m x­ng b¸ s¬n tr¹i phÝa b¾c ®ang ë ".."Phôc Ng­u s¬n".." hiÖn th©n, ch¾c ®ang cã ©m m­u!",
            "\\script\\isolate\\functions\\new_world_boss\\npc\\llmz_death.lua"
        },
    },
}
nwb_topaward = {
    -- name  {item}, msg, time, rate
    {"R­¬ng Manh Manh",{2,1,31323,1,1},0,2592000,500,},
    {"R­¬ng Thó C­ìi Manh Manh",{2,1,31324,1,1},1,-1,5,},
    {"BÝch Tóy",{2,1,30922,2,1},0,-1,500,},
    {"L­u Kim",{2,1,31096,2,1},0,-1,500,},
    {"Thiªn V¨n Th¹ch",{2,201,13,2,1},0,-1,500,},
    {"VÐ §æi Trang Søc Ngo¹i Trang",{2,1,31320,4,1},0,-1,1200,},
    {"Thiªn Cang LÖnh",{2,95,204,1,1},1,-1,20,},
    {"Thiªn M«n Kim LÖnh",{2,1,30370,1,1},1,-1,20,},
    {"Tói ChÝ D­¬ng Hoµn (Nhá)",{2,1,31322,5,1},0,-1,200,},
    {"PhiÕu §æi Ngo¹i Trang",{2,1,31233,4,1},0,-1,500,},
    {"C©y B¸t Nh·",{2,0,398,1,1},0,-1,2040,},
    {"TÜnh M¹ch Ng©n Nh©n",{2,1,30731,1,1},0,-1,1000,},
    {"Thiªn Th¹ch Tinh Th¹ch",{2,1,1009,1,1},0,-1,1000,},
    {"TÈy T©m Th¹ch cÊp 6",{2,1,30526,1,1},0,-1,1000,},
    {"LuyÖn L« ThiÕt cÊp 6",{2,1,30532,1,1},0,-1,1000,},
    {"§iÓm Tinh Ngäc-Nhá",{2,201,16,1,1},1,-1,10,},
    {"Chiªu Yªu Kú",{2,1,31307,1,1},1,-1,5,},
}


nwb_midaward = {
    {" Manh Manh",{2,1,31323,1,1},0,-1,500,},
    {"Qu¸ Ng­ Gia Ng¹o",{2,1,31321,2,1},0,-1,500,},
    {"Thiªn Cang lÖnh",{2,95,204,2,1},0,-1,100000,},
    {"Thiªn M«n Kim LÖnh",{2,1,30370,2,1},0,-1,100000,},
    --{"VÐ §æi Trang Søc Ngo¹i Trang",{2,1,31320,4,1},0,-1,1200,},
    --{"Thiªn Cang LÖnh",{2,95,204,1,1},1,-1,10,},
    --{"Thiªn M«n Kim LÖnh",{2,1,30370,1,1},1,-1,10,},
    --{"Tói ChÝ D­¬ng Hoµn (Nhá)",{2,1,31322,5,1},0,-1,500,},
    --{"PhiÕu §æi Ngo¹i Trang",{2,1,31233,4,1},0,-1,1200,},
    --{"C©y B¸t Nh·",{2,0,398,1,1},0,-1,2178,},
    --{"Thiªn Th¹ch Tinh Th¹ch",{2,1,1009,1,1},0,-1,1000,},
    --{"TÜnh M¹ch Ng©n Nh©n",{2,1,30731,1,1},0,-1,500,},
    --{"Chiªu Yªu Kú",{2,1,31307,1,1},1,-1,2,},
}
nwb_bagaward = {
    --{"EXP",{0,0,0,5000000,1},0,-1,2500,},
    --{"EXP",{0,0,0,10000000,1},0,-1,1500,},
    --{"EXP",{0,0,0,20000000,1},0,-1,1000,},
    --{"EXP",{0,0,0,50000000,1},0,-1,1000,},
    --{"VÐ §æi Trang Søc Ngo¹i Trang",{2,1,31320,1,1},0,-1,500,},
    --{"L­u Kim",{2,1,31096,1,4},0,-1,100,},
    --{"Thiªn V¨n Th¹ch",{2,201,13,1,4},0,-1,100,},
    --{"§ång TÕ Chi NguyÖn",{2,1,30913,1,4},0,-1,200,},
    --{"PhiÕu §æi Ngo¹i Trang",{2,1,31233,1,1},0,-1,200,},
    --{"ChÝ D­¬ng Hoµn",{2,1,31255,5,4},0,-1,600,},
    --{"Tói ChÝ D­¬ng Hoµn (Nhá)",{2,1,31322,1,4},0,-1,300,},
    --{"Tói ChÝ D­¬ng Hoµn (Nhá)",{2,1,31322,2,4},0,-1,100,},
    --{"Sæ Tay Cù Tö",{2,1,31246,1,4},0,-1,50,},
    --{"BÝch Tóy",{2,1,30922,1,4},0,-1,50,},
    --{"Thiªn Kiªu LÖnh",{2,97,236,1,4},0,-1,10,},
    --{"Thiªn th¹ch",{2,2,8,5,4},0,-1,350,},
    {"Håi Tiªn §¬n",{2,1,30847,10,4},0,-1,-1,},
    {"Bïa c­êng hãa 14",{2,1,30426,2,4},0,-1,-1,},
    {"Thanh Long hån",{2,1,31194,1,4},0,-1,-1,},
    {"Linh KhÝ rùc rì",{2,1,31122,1,4},1,-1,-1,},
}
nwb_BoxBuffer = {
    --[mapId] = {boxid = 12345, rest = 10, tong = "tongname", playerlist = {}}
}
function nwb_ItemStat(tAward)
    local g,d,p,l,time = tAward[2][1],tAward[2][2],tAward[2][3],tAward[2][4],tAward[3]
    if g == 2 and d == 95 and p == 204 then
        AddRuntimeStat(78, 1, 0, 1)     -- Ììî¸Áî
    elseif g == 2 and d == 1 and p == 30370 then
        AddRuntimeStat(78, 2, 0, 1)     -- ÌìÃÅ½ðÁî
    elseif g == 2 and d == 1 and p == 31307 then
        AddRuntimeStat(78, 4, 0, 1)     -- ÕÐÑýÆì
    elseif g == 2 and d == 1 and p == 31324 and time == -1 then
        AddRuntimeStat(78, 3, 0, 1)     -- ÓÀ¾ÃÐÜÃ¨ÃÈÃÈÏä×Ó
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
            SetNpcLifeTime(boss, 3600) -- 30·ÖÖÓ
            Msg2Global(tBoss[6])
            Msg2Global(tBoss[6])
            Msg2Global(tBoss[6])
            SetNpcDeathScript(boss, tBoss[7])
        end
    end
end
function WorldBoss_CreateBoss1300() WorldBoss_CreateBoss(1305) end -- ÑÓºó5·ÖÖÓ
function WorldBoss_CreateBoss2100() WorldBoss_CreateBoss(2105) end -- ÑÓºó5·ÖÖÓ
function WorldBoss_CreateBoss2300() WorldBoss_CreateBoss(2305) end -- ÑÓºó5·ÖÖÓ

t_isolate_user_batch_watch_list = {--{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), {nMaterialType, nNum}}
    --LongDaiKa: ®ãng c¸c lo¹i boss thÕ giíi míi
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
                    -- µôÂäÊ±·¢¹«¸æ
                    local szMsg = format("%s ®· bÞ ®¸nh b¹i, r¬i ra %s x%d", bossName, tAward[j][1], tAward[j][2][4])
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
    local boxIdx = CreateNpc("Tói cao thñ",packName,m,x,y)
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
    local szMsg = format("Chóc mõng [%s] ®· ®¸nh b¹i %s!",GetName(), szBossName)    
    AddGlobalNews(szMsg, 1)
    Msg2Global(szMsg)
    local nTongId = GetTongID()
    if nTongId ~= 0 and nTongId ~= nil then
        SendTongMessage(szMsg)
    end
end

tFailReason = {
    " thµnh c«ng ",
    "Bang cña thiÕu hiÖp kh«ng së h÷u r­¬ng nµy!",
    "Vµo bang ch­a ®ñ 1 giê, kh«ng thÓ nhËn",
    "R­¬ng nµy kh«ng thuéc vÒ ®¹i hiÖp!",
    "Ng­êi ch¬i ®¹t ®Õn chuyÓn sinh 5 trë lªn míi ®­îc më",
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
        --  ÓÐ°ï»á
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
    if szNpcName == "Tói cña Th­¬ng ThÇn Doanh Thiªn" 
        or szNpcName == "Tói Cña NhËm Ng· Hµnh"
            or szNpcName == "Tói cña L·nh H­¬ng L¨ng"
                or szNpcName == "Tói cña B¾c Lôc L©m Minh Chñ" then
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

    local szTitle = format("<color=green>%s<color>: Chóc mõng ®¸nh b¹i kÎ ®Þch, cã thÓ nhËn th­ëng trong r­¬ng.", GetTargetNpcName())
    local tbSay = {}
    local nTongId = GetTongID()
    if nTongId ~= 0 and nTongId ~= nil then
        szTitle = format("<color=green>%s<color>: Chóc mõng ®¸nh b¹i kÎ ®Þch, c¸c h¹ vµ thµnh viªn trong bang cã thÓ nhËn th­ëng trong r­¬ng. Sè lÇn ®­îc nhËn: <color=yellow>%d<color>\n", GetTargetNpcName(), box.rest)
    end
    local got = nwb_isBoxAwarded(box)
    if got == 1 then
        szTitle = szTitle .. "  <color=red>§· nhËn råi, kh«ng thÓ nhËn n÷a<color>"
    else
        tinsert(tbSay, "NhËn lÊy phÇn th­ëng./nwb_box_award")
    end
    tinsert(tbSay, "§ãng/nothing")
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
        Talk(1,"","Hµnh trang kh«ng ®ñ chç, kh«ng thÓ nhËn th­ëng!")
        return 
    end
    if nwb_isBoxAwarded(box) == 1 then
        Talk(1,"","§· nhËn råi, kh«ng thÓ nhËn l¹i")
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
    if szNpcName == "Tói Cña NhËm Ng· Hµnh" then
        AddRuntimeStat(77, 1, 0, 1);
    elseif szNpcName == "Tói cña Th­¬ng ThÇn Doanh Thiªn" then
        AddRuntimeStat(77, 2, 0, 1);
    elseif szNpcName == "Tói cña L·nh H­¬ng L¨ng" then
        AddRuntimeStat(77, 3, 0, 1);
    elseif szNpcName == "Tói cña B¾c Lôc L©m Minh Chñ" then
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
            if nwb_bagaward[j][3] == 1 then -- ·¢ËÍÏûÏ¢
                local szMsg = format("[%s] ®· tham gia %s, më ®­îc %s x%d",GetName(),szNpcName,nwb_bagaward[j][1],nwb_bagaward[j][2][4])
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
        Talk(1,"","Hµnh trang kh«ng ®ñ chç, kh«ng thÓ më!")
        return 
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        gf_AddItemEx({2,1,31255,10,1},"ChÝ D­¬ng Hoµn")
    end
end

function on_add_watches()
    isolate_watch_npc_talk("Tói cña Th­¬ng ThÇn Doanh Thiªn", 503, "nwb_box")
    isolate_watch_npc_talk("Tói Cña NhËm Ng· Hµnh", 211, "nwb_box")
    isolate_watch_npc_talk("Tói cña L·nh H­¬ng L¨ng", 307, "nwb_box")
    isolate_watch_npc_talk("Tói cña B¾c Lôc L©m Minh Chñ", 311, "nwb_box")
    isolate_watch_item_talk(2, 1, 31322, "lm_ringbag")
end