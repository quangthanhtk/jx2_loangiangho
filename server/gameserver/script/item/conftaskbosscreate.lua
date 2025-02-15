Include("\\script\\isolate\\functions\\tong_extension\\main.lua")

--***********************************变量定义区*****************************
--------------------------------------------帮会任务随机BOSS使用定义
Zgc_conf_task_boss = {			--第一等级BOSS
	"C玭 L玭 N�",
	"B飅 H祅g",
	"Li評 Ngh�",
	"H錸g Tuy課",
	"H� C秐h Th緉g",
	"Nhi誴 Чi Ch飝",
	"B� Phi Y猲",
}

Zgc_conf_task_box = {
	"Rng c馻 C玭 L玭 N�  l筰",
	"Rng c馻 B飅 H祅g  l筰",
	"Rng c馻 Li評 Ngh�  l筰",
	"Rng c馻 H錸g Tuy課  l筰",
	"Rng s総 c馻 H� C秐h Th緉g",
	"Rng s総 c馻 Nhi誴 Чi Ch飝",
	"B秓 rng c馻 B� Phi Y猲",
}
Zgc_cong_task_usemapid = {
	{302,"Thanh Th祅h s琻"},		
	{327,"� M玭g B�"},
	{401,"觤 Thng s琻"},
	{306,"Giang T﹏ Th玭"},
	{307,"Phong Й"},
	{405,"Ch﹏ n骾 V� L╪g"},
	{406,"V� L╪g s琻"},
	{326,"M� Tuy誸 s琻 trang"},
	{310,"Ki誱 M玭 quan"},
	{311,"Ph鬰 Ng璾 s琻"},
	{218,"Linh B秓 s琻"},
	{202,"H筺h Hoa th玭"},
	{151,"V﹏ M閚g Tr筩h"},			
	{601,"Чi Th秓 Nguy猲 1"},
	{602,"Чi Th秓 Nguy猲 2"},
	{103,"Йng H秈 H秈 T﹏ 1"},
	{104,"Йng H秈 H秈 T﹏ 2"},
	{102,"Уo Hoa o"},
	{207,"Nh� Long s琻"},
	{217,"D� Tr� l﹎"},
	{208,"Lng S琻 B筩"},
	{604,"Nh筺 M玭 quan"},
	{106,"Long Tuy襫 Th玭"},
	{107,"V� Di s琻"},
	{600,"B� l筩 Vng K�"},
}

Zgc_award_lv1 = {
	{"V� фi Trang S鴆 Ngo筰 Trang",{2,1,31320,5,1},0,-1,1000,},
    {"Rng Manh Manh",{2,1,31323,1,1},0,2592000,1000,},
    {"L璾 Kim",{2,1,31096,1,1},0,-1,500,},
    {"Thi猲 V╪ Th筩h",{2,201,13,1,1},0,-1,100,},
    {"уng T� Chi Nguy謓",{2,1,30913,1,1},0,-1,1000,},
    {"Phi誹 фi Ngo筰 Trang",{2,1,31233,1,1},0,-1,1000,},
    {"T骾 Ch� Dng Ho祅 (Nh�)",{2,1,31322,1,1},0,-1,3100,},
    {"T骾 Ch� Dng Ho祅 (Nh�)",{2,1,31322,2,1},0,-1,1000,},
    {"T骾 Ch� Dng Ho祅 (Nh�)",{2,1,31322,5,1},0,-1,500,},
    {"Thi猲 Cang L謓h",{2,95,204,1,1},1,-1,10,},
    {"Thi猲 M玭 Kim L謓h",{2,1,30370,1,1},1,-1,10,},
    {"C﹜ B竧 Nh�",{2,0,398,1,1},0,-1,780,},
}

Zgc_award_lv2 = {
	{"V� фi Trang S鴆 Ngo筰 Trang",{2,1,31320,1,1},0,-1,500,},
	{"Rng Manh Manh",{2,1,31323,1,1},0,2592000,1000,},
	{"L璾 Kim",{2,1,31096,1,1},0,-1,1000,},
	{"Thi猲 V╪ Th筩h",{2,201,13,1,1},0,-1,500,},
	{"уng T� Chi Nguy謓",{2,1,30913,1,1},0,-1,500,},
	{"Phi誹 фi Ngo筰 Trang",{2,1,31233,1,1},0,-1,500,},
	{"T骾 Ch� Dng Ho祅 (Nh�)",{2,1,31322,1,1},0,-1,2800,},
	{"T骾 Ch� Dng Ho祅 (Nh�)",{2,1,31322,2,1},0,-1,2000,},
	{"T骾 Ch� Dng Ho祅 (Nh�)",{2,1,31322,5,1},0,-1,500,},
	{"Thi猲 Cang L謓h",{2,95,204,1,1},1,-1,5,},
	{"Thi猲 M玭 Kim L謓h",{2,1,30370,1,1},1,-1,5,},
	{"C﹜ B竧 Nh�",{2,0,398,1,1},0,-1,690,},
}

Zgc_award_lv3 = {
	{"V� фi Trang S鴆 Ngo筰 Trang",{2,1,31320,1,1},0,-1,500,},
	{"Rng Manh Manh",{2,1,31323,1,1},0,2592000,1000,},
	{"L璾 Kim",{2,1,31096,1,1},0,-1,1000,},
	{"Thi猲 V╪ Th筩h",{2,201,13,1,1},0,-1,500,},
	{"уng T� Chi Nguy謓",{2,1,30913,1,1},0,-1,500,},
	{"Phi誹 фi Ngo筰 Trang",{2,1,31233,1,1},0,-1,500,},
	{"T骾 Ch� Dng Ho祅 (Nh�)",{2,1,31322,1,1},0,-1,3500,},
	{"T骾 Ch� Dng Ho祅 (Nh�)",{2,1,31322,2,1},0,-1,1000,},
	{"T骾 Ch� Dng Ho祅 (Nh�)",{2,1,31322,5,1},0,-1,500,},
	{"C﹜ B竧 Nh�",{2,0,398,1,1},0,-1,1000,},
}

function Zgc_getmaxrate(tAward)
    local ret = 0
    for i=1, getn(tAward) do
        ret = ret + tAward[i][5]
    end
    return ret
end

Zgc_conf_task_boss_award = {
	{Zgc_award_lv3, 2, Zgc_getmaxrate(Zgc_award_lv3), 1000},
	{Zgc_award_lv3, 2, Zgc_getmaxrate(Zgc_award_lv3), 1000},
	{Zgc_award_lv3, 2, Zgc_getmaxrate(Zgc_award_lv3), 1000},
	{Zgc_award_lv3, 2, Zgc_getmaxrate(Zgc_award_lv3), 1000},
	{Zgc_award_lv2, 5, Zgc_getmaxrate(Zgc_award_lv2), 2000},
	{Zgc_award_lv2, 5, Zgc_getmaxrate(Zgc_award_lv2), 2000},
	{Zgc_award_lv1, 10, Zgc_getmaxrate(Zgc_award_lv1),4000},
}
--======================================使用生辰纲召唤BOSS==============================
function OnUse(id)
	SetItemUseLapse(id,90)
	local mapID,X,Y = GetWorldPos()
	local chk_flag = 0
	for i = 1, getn(Zgc_cong_task_usemapid) do				--使用地图判断
		if Zgc_cong_task_usemapid[i][1] == mapID then
			chk_flag = 1
			break
		end
	end
	if chk_flag == 0 then
		Say("N琲 y quan binh canh gi� nghi猰 ng苩, m ngi B� Phi Y猲 to gan c竎h m蕐 c騨g kh玭g d竚 b衝 m穘g t韎, ngi th� n ch� kh竎 xem!",
			2,
			"Ta mu鑞 bi誸 h祅h tung c馻 B� Phi Y猲/Zgc_bfy_actmap_inq",
			"Ta bi誸 r錳/Zgc_end_dialog"
		)		
	else														--创建BOSS	
		local del_flag = DelItemByIndex(id,1)
		if del_flag ~= 1 then
			WriteLog("X鉧 Sinh Th莕 Cang th蕋 b筰, ID th蕋 b筰:"..del_flag)
		else
			local boss_step = random(1,100)
			local npc_index = 0
			local boss_seq = 0
			if boss_step == 37 then
				npc_index = CreateNpc(Zgc_conf_task_boss[7],Zgc_conf_task_boss[7],mapID,X,Y,-1,1,0,0)
				AddRuntimeStat(87, 7, 0, 1)
				SendTongMessage(GetName().."S� d鬾g Sinh Th莕 Cang g鋓 ra B� Phi Y猲!")
				AddGlobalNews(GetTongName().."C� tin b鋘 h� 產ng giao u v韎 B� Phi Y猲!")
			elseif boss_step <= 33 then
				boss_seq = random(5,6)
				AddRuntimeStat(87, boss_seq, 0, 1)
				npc_index = CreateNpc(Zgc_conf_task_boss[boss_seq],Zgc_conf_task_boss[boss_seq],mapID,X,Y,-1,1,0,0)
				SendTongMessage(GetName().."S� d鬾g Sinh Th莕 Cang g鋓 ra:"..Zgc_conf_task_boss[boss_seq].."!")
			else
				boss_seq = random(1,4)
				AddRuntimeStat(87, boss_seq, 0, 1)
				npc_index = CreateNpc(Zgc_conf_task_boss[boss_seq],Zgc_conf_task_boss[boss_seq],mapID,X,Y,-1,1,0,0)
				SendTongMessage(GetName().."S� d鬾g Sinh Th莕 Cang g鋓 ra:"..Zgc_conf_task_boss[boss_seq].."!")
			end
			SetNpcScript(npc_index,"\\script\\item\\conftaskbosscreate.lua")
			WriteLog("Nhi謒 v?B?Phi Y猲: Ngi ch琲 ["..GetName().."] s� d鬾g Sinh Th莕 Cng g鋓 ra "..Zgc_conf_task_boss[boss_seq])
		end
	end
end
--********************************生辰纲可使用地图查询*****************************
function Zgc_bfy_actmap_inq()
	local dialog_string = "  "
	for i = 1, getn(Zgc_cong_task_usemapid) do
		dialog_string = dialog_string .. Zgc_cong_task_usemapid[i][2]
		if floor(i/4)-(i/4) == 0 then
			dialog_string = dialog_string .."\n  "
		else
			for j = 1,(19-strlen(Zgc_cong_task_usemapid[i][2])) do
				dialog_string = dialog_string .." "
			end
		end
	end
	Say("B� Phi Y猲 h祅h tung b蕋 nh, ngi bi誸 tung t輈h h緉 ta ch� c�: \n"..dialog_string,
		1,
		"Ta bi誸 r錳/Zgc_end_dialog"
	)
end
--**********************************BOSS死亡处理***********************************
function Zgc_dropaward(tAward, nTimes, m,x,y, maxrate, bossName)
    for i = 1, nTimes do
        local rand = random(1,maxrate)
        for j = 1, getn(tAward) do  
            if tAward[j][5] >= rand then
                local time = tAward[j][4]
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

function Zgc_kill_announce(szBossName)
    local szMsg = format("Ch骳 m鮪g [%s]  nh b筰 %s!",GetName(), szBossName)    
    AddGlobalNews(szMsg, 1)
    Msg2Global(szMsg)
    local nTongId = GetTongID()
    if nTongId ~= 0 and nTongId ~= nil then
        SendTongMessage(szMsg)
    end
end
function OnDeath(index)
	SetNpcLifeTime(index,0)
	local npc_name = GetNpcName(index)
	local npc_level = 0
	local MapID,X,Y	= GetNpcWorldPos(index)
	---------------------------------判断是哪个BOSS死亡------------------------------
	for i = 1, 7 do
		if Zgc_conf_task_boss[i] == npc_name then
			AddRuntimeStat(88, i, 0, 1)
			local taward = Zgc_conf_task_boss_award[i][1]
			local ntime = Zgc_conf_task_boss_award[i][2]
			local maxrate = Zgc_conf_task_boss_award[i][3]
			local tongCash = Zgc_conf_task_boss_award[i][4]
			Zgc_kill_announce(npc_name)
			Zgc_dropaward(taward, ntime, MapID,X,Y, maxrate, npc_name)
			TongExt_AddTongCash( tongCash )
			FireEvent("event_mission_affairs", "tongboss", "killboss", index)
		end
	end
end

function Zgc_end_dialog()

end