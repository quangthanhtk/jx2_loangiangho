Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\cangjianshanzhuang\\head.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

T_TongBoxScript = {
	"\\script\\missions\\cangjianshanzhuang\\npc\\box_tong1.lua",
	"\\script\\missions\\cangjianshanzhuang\\npc\\box_tong2.lua",
	"\\script\\missions\\cangjianshanzhuang\\npc\\box_tong3.lua",
	nil,
}

T_TONG_BOX_IDX = {}
function remove_tong_box()
	for i,v in T_TONG_BOX_IDX do
		if GetNpcName(i) == "Rng уng" then
			SetNpcLifeTime(i, 0);
		end
	end
	T_TONG_BOX_IDX = {}
end

function create_box_tong(m,x,y, nBoxId)
	if g_WCFG_VANKIEMTRUNG.bDisableDropBox == WEnv.TRUE then
		return WEnv.RETCODE_NOTOPEN;
	end
	if not T_TongBoxScript[nBoxId] then
		return
	end
	--local m, x, y = GetNpcWorldPos(nNpcIdx);
	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
	local npc = CreateNpc("tongbaoxiang", "Rng уng", m, x2, y2);
	if npc and npc > 0 then
		T_TONG_BOX_IDX[npc] = 1
		--SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, T_TongBoxScript[nBoxId]);
	else
		print("create ls tongbaoxiang fail")
	end
end
        
tClause1 = {
    --{{"小传功丹",{2,1,30312,1,4}},30000},
    -- {{"修真要诀残页",{2,1,30315,1,4}},10},
    {{"Thi誸 Tinh c蕄 1",{2,1,30533,1}},20},
    {{"Thi誸 Tinh c蕄 2",{2,1,30534,1}},10},
	{{"Thi誸 Tinh c蕄 3",{2,1,30535,1}},5},
	{{"Nh﹏ S﹎ V筺 N╩",{2,1,30071,1}},53},
	{{"T骾 Ц Qu� C蕄 1",{2,1,30998,1}},7},
	{{"Kinh M筩h уng Nh﹏",{2,1,30730,1}},5},
}
tClause2 = {
    {{"T� Linh Quy Nguy猲 Кn",{2,1,30352,1}},5},
    {{"B錳 Nguy猲 Кn",{2,1,30351,1}},5},
    --{{"传功丹",{2,1,30313,1,4}},10000},
    -- {{"修真要诀残页",{2,1,30315,1,4}},5},
    {{"Thi誸 Tinh c蕄 1",{2,1,30533,1}},8},
    {{"Thi誸 Tinh c蕄 2",{2,1,30534,1}},50},
    {{"Thi誸 Tinh c蕄 3",{2,1,30535,1}},2},
    {{"Gi祔 V秈 Th�",{0,154,1,1}},10},
	{{"Tinh Tr� B� H礽",{0,154,2,1}},10},
	{{"B� Ch� Cao уng Ngoa",{0,154,3,1}},10},
	{{"Nh﹏ S﹎ V筺 N╩",{2,1,30071,1}},31},
	{{"T骾 Ц Qu� C蕄 1",{2,1,30998,1}},7},
	{{"T骾 Ц Qu� C蕄 2",{2,1,30999,1}},2},
	{{"Kinh M筩h уng Nh﹏",{2,1,30730,1}},5},
}
tClause3 = {
    {{"T� Linh Quy Nguy猲 Кn",{2,1,30352,1}},50},
    {{"B錳 Nguy猲 Кn",{2,1,30351,1}},50},
    -- {{"修真要诀残页",{2,1,30315,1,4}},5100},
    -- {{"1级铁晶",{2,1,30533,1,4}},15000},
    -- {{"2级铁晶",{2,1,30534,1,4}},15000},
    -- {{"3级铁晶",{2,1,30535,1,4}},9000},
    {{"Gi祔 V秈 Th�",{0,154,1,1}},100},
    {{"Tinh Tr� B� H礽",{0,154,2,1}},100},
	{{"B� Ch� Cao уng Ngoa",{0,154,3,1}},100},
	{{"Chi課 H礽 Kim Ch� ng� h祅h",{0,154,4,1}},20},
	{{"Chi課 H礽 M閏 Ch� ng� h祅h",{0,154,5,1}},20},
	{{"Chi課 H礽 Th駓 Ch� ng� h祅h",{0,154,6,1}},20},
	{{"Chi課 H礽 H醓 Ch� ng� h祅h",{0,154,7,1}},20},
	{{"Chi課 H礽 Th� Ch� ng� h祅h",{0,154,8,1}},20},
	{{"Chi課 H礽  Ch� ng� h祅h",{0,154,9,1}},20},

	{{"Trng H礽 Du Hi謕",{0,154,26,1}},5},
	{{"Chi課 H礽 Thi誸 Huy誸",{0,154,27,1}},5},
--	{{"云游道靴",{0,154,28,1},msg},5},
	{{"Чo H礽 V﹏ Du",{0,154,28,1},},5},
	{{"Nh﹏ S﹎ V筺 N╩",{2,1,30071,1}},325},
	{{"T骾 Ц Qu� C蕄 1",{2,1,30998,1}},60},
	{{"T骾 Ц Qu� C蕄 2",{2,1,30999,1}},20},
	{{"T骾 Ц Qu� C蕄 3",{2,1,31000,1}},10},
	
	{{"Kinh M筩h уng Nh﹏",{2,1,30730,1}},50},

}

tClause = {
	tClause1,
	tClause2,
	tClause3,
	nil,
}

function on_open(nStage)
	if get_open_type() == tbJZMY.open_type_hard then
		local nRetIndex = CustomAwardSelectOne("TZWJ_free");
		if nRetIndex > 0 then
			local ntype, tItem = CustomAwardGetAwardInfo2(nRetIndex);
			gf_ThrowDice(tItem, nil, nil, nil, nil, GetTargetNpc());
		end
	else
		local tItem = gf_RandRate(tClause[nStage], nil, 2)[1];
		gf_ThrowDice(tItem[2], nil, nil, nil, nil, GetTargetNpc());
	end
	SetNpcLifeTime(GetTargetNpc(), 0);
	SetNpcScript(GetTargetNpc(), "");
	gf_TeamOperateEX(vaf_award_api, "tWjzTongBox")
	FireEvent("event_mission_box_award", "wanjianzhong", "copper", nStage)
end

