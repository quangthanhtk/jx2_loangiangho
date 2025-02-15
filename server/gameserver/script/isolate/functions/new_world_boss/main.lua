
Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
Import("\\script\\lib\\globalfunctions.lua")

t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 1,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 			= "newWorldBoss",
    szViewName 			= "BOSS Th� Gi韎", -- 新世界BOSS
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}

nwb_tWorldBoss = {
    [1305] = {
        {
            "Huy襫 V� Th璷ng","Thng Th莕 Doanh Thi猲",503,1493,3055, 
            "Nghe n鉯 th� v� th﹏ t輓 c馻 T莕 Th駓 Ho祅g l� Thng Th莕 Doanh Thi猲  xu蕋 hi謓 t筰 ".."T莕 L╪g".." v� l﹎ s緋 c� m閠 tr薾 h祇 ki誴!",
            "\\script\\isolate\\functions\\new_world_boss\\npc\\qsyt_death.lua"
        },
    },
    [2105] = {
        {
            "WorldBoss_rwx", "Nh薽 Ng� H祅h", 211,1792,3172, 
            "Nghe n鉯 n╩ x璦 Nh薽 Ng� H祅h b� giam �".."Dng Trung ng-2"..",Chuy謓 n祔 総 c� khu蕋 t蕋!",
            "\\script\\isolate\\functions\\new_world_boss\\npc\\rwx_death.lua"
        },
        {
            "Nghi謙 H錸","L穘h Hng L╪g",307,1519,2967,
            "Nghe n鉯 h錸 ma L穘h Hng L╪g 10 n╩ trc t鮪g l� hoa kh玦 Giang T﹏ Th玭 nay xu蕋 hi謓 t筰".."Phong Й".."mau n  xem th� dung nhan ki襲 di詍 c馻 n祅g!",
            "\\script\\isolate\\functions\\new_world_boss\\npc\\lxl_death.lua"
        },
    },
    [2305] = {
        {
            "S琻 T芻 u M鬰","B綾 L鬰 L﹎ Minh Ch�",311,1561,2700,
            "Nghe n鉯 minh ch� l鬰 l﹎ x璶g b� s琻 tr筰 ph輆 b綾 產ng � ".."Ph鬰 Ng璾 s琻".." hi謓 th﹏, ch綾 產ng c� ﹎ m璾!",
            "\\script\\isolate\\functions\\new_world_boss\\npc\\llmz_death.lua"
        },
    },
}
nwb_topaward = {
    -- name  {item}, msg, time, rate
    {"Rng Manh Manh",{2,1,31323,1,1},0,2592000,500,},
    {"Rng Th� Ci Manh Manh",{2,1,31324,1,1},1,-1,5,},
    {"B輈h T髖",{2,1,30922,2,1},0,-1,500,},
    {"L璾 Kim",{2,1,31096,2,1},0,-1,500,},
    {"Thi猲 V╪ Th筩h",{2,201,13,2,1},0,-1,500,},
    {"V� фi Trang S鴆 Ngo筰 Trang",{2,1,31320,4,1},0,-1,1200,},
    {"Thi猲 Cang L謓h",{2,95,204,1,1},1,-1,20,},
    {"Thi猲 M玭 Kim L謓h",{2,1,30370,1,1},1,-1,20,},
    {"T骾 Ch� Dng Ho祅 (Nh�)",{2,1,31322,5,1},0,-1,200,},
    {"Phi誹 фi Ngo筰 Trang",{2,1,31233,4,1},0,-1,500,},
    {"C﹜ B竧 Nh�",{2,0,398,1,1},0,-1,2040,},
    {"T躰h M筩h Ng﹏ Nh﹏",{2,1,30731,1,1},0,-1,1000,},
    {"Thi猲 Th筩h Tinh Th筩h",{2,1,1009,1,1},0,-1,1000,},
    {"T葃 T﹎ Th筩h c蕄 6",{2,1,30526,1,1},0,-1,1000,},
    {"Luy謓 L� Thi誸 c蕄 6",{2,1,30532,1,1},0,-1,1000,},
    {"觤 Tinh Ng鋍-Nh�",{2,201,16,1,1},1,-1,10,},
    {"Chi猽 Y猽 K�",{2,1,31307,1,1},1,-1,5,},
}


nwb_midaward = {
    {" Manh Manh",{2,1,31323,1,1},0,-1,500,},
    {"Qu� Ng� Gia Ng筼",{2,1,31321,2,1},0,-1,500,},
    {"Thi猲 Cang l謓h",{2,95,204,2,1},0,-1,100000,},
    {"Thi猲 M玭 Kim L謓h",{2,1,30370,2,1},0,-1,100000,},
    --{"V� фi Trang S鴆 Ngo筰 Trang",{2,1,31320,4,1},0,-1,1200,},
    --{"Thi猲 Cang L謓h",{2,95,204,1,1},1,-1,10,},
    --{"Thi猲 M玭 Kim L謓h",{2,1,30370,1,1},1,-1,10,},
    --{"T骾 Ch� Dng Ho祅 (Nh�)",{2,1,31322,5,1},0,-1,500,},
    --{"Phi誹 фi Ngo筰 Trang",{2,1,31233,4,1},0,-1,1200,},
    --{"C﹜ B竧 Nh�",{2,0,398,1,1},0,-1,2178,},
    --{"Thi猲 Th筩h Tinh Th筩h",{2,1,1009,1,1},0,-1,1000,},
    --{"T躰h M筩h Ng﹏ Nh﹏",{2,1,30731,1,1},0,-1,500,},
    --{"Chi猽 Y猽 K�",{2,1,31307,1,1},1,-1,2,},
}
nwb_bagaward = {
    --{"EXP",{0,0,0,5000000,1},0,-1,2500,},
    --{"EXP",{0,0,0,10000000,1},0,-1,1500,},
    --{"EXP",{0,0,0,20000000,1},0,-1,1000,},
    --{"EXP",{0,0,0,50000000,1},0,-1,1000,},
    --{"V� фi Trang S鴆 Ngo筰 Trang",{2,1,31320,1,1},0,-1,500,},
    --{"L璾 Kim",{2,1,31096,1,4},0,-1,100,},
    --{"Thi猲 V╪ Th筩h",{2,201,13,1,4},0,-1,100,},
    --{"уng T� Chi Nguy謓",{2,1,30913,1,4},0,-1,200,},
    --{"Phi誹 фi Ngo筰 Trang",{2,1,31233,1,1},0,-1,200,},
    --{"Ch� Dng Ho祅",{2,1,31255,5,4},0,-1,600,},
    --{"T骾 Ch� Dng Ho祅 (Nh�)",{2,1,31322,1,4},0,-1,300,},
    --{"T骾 Ch� Dng Ho祅 (Nh�)",{2,1,31322,2,4},0,-1,100,},
    --{"S� Tay C� T�",{2,1,31246,1,4},0,-1,50,},
    --{"B輈h T髖",{2,1,30922,1,4},0,-1,50,},
    --{"Thi猲 Ki猽 L謓h",{2,97,236,1,4},0,-1,10,},
    --{"Thi猲 th筩h",{2,2,8,5,4},0,-1,350,},
    {"H錳 Ti猲 Кn",{2,1,30847,10,4},0,-1,-1,},
    {"B颽 cng h鉧 14",{2,1,30426,2,4},0,-1,-1,},
    {"Thanh Long h錸",{2,1,31194,1,4},0,-1,-1,},
    {"Linh Kh� r鵦 r�",{2,1,31122,1,4},1,-1,-1,},
}
nwb_BoxBuffer = {
    --[mapId] = {boxid = 12345, rest = 10, tong = "tongname", playerlist = {}}
}
function nwb_ItemStat(tAward)
    local g,d,p,l,time = tAward[2][1],tAward[2][2],tAward[2][3],tAward[2][4],tAward[3]
    if g == 2 and d == 95 and p == 204 then
        AddRuntimeStat(78, 1, 0, 1)     -- 天罡令
    elseif g == 2 and d == 1 and p == 30370 then
        AddRuntimeStat(78, 2, 0, 1)     -- 天门金令
    elseif g == 2 and d == 1 and p == 31307 then
        AddRuntimeStat(78, 4, 0, 1)     -- 招妖旗
    elseif g == 2 and d == 1 and p == 31324 and time == -1 then
        AddRuntimeStat(78, 3, 0, 1)     -- 永久熊猫萌萌箱子
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
            SetNpcLifeTime(boss, 3600) -- 30分钟
            Msg2Global(tBoss[6])
            Msg2Global(tBoss[6])
            Msg2Global(tBoss[6])
            SetNpcDeathScript(boss, tBoss[7])
        end
    end
end
function WorldBoss_CreateBoss1300() WorldBoss_CreateBoss(1305) end -- 延后5分钟
function WorldBoss_CreateBoss2100() WorldBoss_CreateBoss(2105) end -- 延后5分钟
function WorldBoss_CreateBoss2300() WorldBoss_CreateBoss(2305) end -- 延后5分钟

t_isolate_user_batch_watch_list = {--{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), {nMaterialType, nNum}}
    --LongDaiKa: ng c竎 lo筰 boss th� gi韎 m韎
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
                    -- 掉落时发公告
                    local szMsg = format("%s  b� nh b筰, r琲 ra %s x%d", bossName, tAward[j][1], tAward[j][2][4])
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
    local boxIdx = CreateNpc("T骾 cao th�",packName,m,x,y)
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
    local szMsg = format("Ch骳 m鮪g [%s]  nh b筰 %s!",GetName(), szBossName)    
    AddGlobalNews(szMsg, 1)
    Msg2Global(szMsg)
    local nTongId = GetTongID()
    if nTongId ~= 0 and nTongId ~= nil then
        SendTongMessage(szMsg)
    end
end

tFailReason = {
    " th祅h c玭g ",
    "Bang c馻 thi誹 hi謕 kh玭g s� h鱱 rng n祔!",
    "V祇 bang ch璦  1 gi�, kh玭g th� nh薾",
    "Rng n祔 kh玭g thu閏 v� i hi謕!",
    "Ngi ch琲 t n chuy觧 sinh 5 tr� l猲 m韎 頲 m�",
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
        --  有帮会
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
    if szNpcName == "T骾 c馻 Thng Th莕 Doanh Thi猲" 
        or szNpcName == "T骾 C馻 Nh薽 Ng� H祅h"
            or szNpcName == "T骾 c馻 L穘h Hng L╪g"
                or szNpcName == "T骾 c馻 B綾 L鬰 L﹎ Minh Ch�" then
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

    local szTitle = format("<color=green>%s<color>: Ch骳 m鮪g nh b筰 k� ch, c� th� nh薾 thng trong rng.", GetTargetNpcName())
    local tbSay = {}
    local nTongId = GetTongID()
    if nTongId ~= 0 and nTongId ~= nil then
        szTitle = format("<color=green>%s<color>: Ch骳 m鮪g nh b筰 k� ch, c竎 h� v� th祅h vi猲 trong bang c� th� nh薾 thng trong rng. S� l莕 頲 nh薾: <color=yellow>%d<color>\n", GetTargetNpcName(), box.rest)
    end
    local got = nwb_isBoxAwarded(box)
    if got == 1 then
        szTitle = szTitle .. "  <color=red>Х nh薾 r錳, kh玭g th� nh薾 n鱝<color>"
    else
        tinsert(tbSay, "Nh薾 l蕐 ph莕 thng./nwb_box_award")
    end
    tinsert(tbSay, "сng/nothing")
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
        Talk(1,"","H祅h trang kh玭g  ch�, kh玭g th� nh薾 thng!")
        return 
    end
    if nwb_isBoxAwarded(box) == 1 then
        Talk(1,"","Х nh薾 r錳, kh玭g th� nh薾 l筰")
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
    if szNpcName == "T骾 C馻 Nh薽 Ng� H祅h" then
        AddRuntimeStat(77, 1, 0, 1);
    elseif szNpcName == "T骾 c馻 Thng Th莕 Doanh Thi猲" then
        AddRuntimeStat(77, 2, 0, 1);
    elseif szNpcName == "T骾 c馻 L穘h Hng L╪g" then
        AddRuntimeStat(77, 3, 0, 1);
    elseif szNpcName == "T骾 c馻 B綾 L鬰 L﹎ Minh Ch�" then
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
            if nwb_bagaward[j][3] == 1 then -- 发送消息
                local szMsg = format("[%s]  tham gia %s, m� 頲 %s x%d",GetName(),szNpcName,nwb_bagaward[j][1],nwb_bagaward[j][2][4])
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
        Talk(1,"","H祅h trang kh玭g  ch�, kh玭g th� m�!")
        return 
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        gf_AddItemEx({2,1,31255,10,1},"Ch� Dng Ho祅")
    end
end

function on_add_watches()
    isolate_watch_npc_talk("T骾 c馻 Thng Th莕 Doanh Thi猲", 503, "nwb_box")
    isolate_watch_npc_talk("T骾 C馻 Nh薽 Ng� H祅h", 211, "nwb_box")
    isolate_watch_npc_talk("T骾 c馻 L穘h Hng L╪g", 307, "nwb_box")
    isolate_watch_npc_talk("T骾 c馻 B綾 L鬰 L﹎ Minh Ch�", 311, "nwb_box")
    isolate_watch_item_talk(2, 1, 31322, "lm_ringbag")
end