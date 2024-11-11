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
		if GetNpcName(i) == "R­¬ng §ång" then
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
	local npc = CreateNpc("tongbaoxiang", "R­¬ng §ång", m, x2, y2);
	if npc and npc > 0 then
		T_TONG_BOX_IDX[npc] = 1
		--SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, T_TongBoxScript[nBoxId]);
	else
		print("create ls tongbaoxiang fail")
	end
end
        
tClause1 = {
    --{{"Ð¡´«¹¦µ¤",{2,1,30312,1,4}},30000},
    -- {{"ÐÞÕæÒª¾÷²ÐÒ³",{2,1,30315,1,4}},10},
    {{"ThiÕt Tinh cÊp 1",{2,1,30533,1}},20},
    {{"ThiÕt Tinh cÊp 2",{2,1,30534,1}},10},
	{{"ThiÕt Tinh cÊp 3",{2,1,30535,1}},5},
	{{"Nh©n S©m V¹n N¨m",{2,1,30071,1}},53},
	{{"Tói §¸ Quý CÊp 1",{2,1,30998,1}},7},
	{{"Kinh M¹ch §ång Nh©n",{2,1,30730,1}},5},
}
tClause2 = {
    {{"Tø Linh Quy Nguyªn §¬n",{2,1,30352,1}},5},
    {{"Båi Nguyªn §¬n",{2,1,30351,1}},5},
    --{{"´«¹¦µ¤",{2,1,30313,1,4}},10000},
    -- {{"ÐÞÕæÒª¾÷²ÐÒ³",{2,1,30315,1,4}},5},
    {{"ThiÕt Tinh cÊp 1",{2,1,30533,1}},8},
    {{"ThiÕt Tinh cÊp 2",{2,1,30534,1}},50},
    {{"ThiÕt Tinh cÊp 3",{2,1,30535,1}},2},
    {{"Giµy V¶i Th«",{0,154,1,1}},10},
	{{"Tinh TrÝ Bè Hµi",{0,154,2,1}},10},
	{{"Bè ChÕ Cao §ång Ngoa",{0,154,3,1}},10},
	{{"Nh©n S©m V¹n N¨m",{2,1,30071,1}},31},
	{{"Tói §¸ Quý CÊp 1",{2,1,30998,1}},7},
	{{"Tói §¸ Quý CÊp 2",{2,1,30999,1}},2},
	{{"Kinh M¹ch §ång Nh©n",{2,1,30730,1}},5},
}
tClause3 = {
    {{"Tø Linh Quy Nguyªn §¬n",{2,1,30352,1}},50},
    {{"Båi Nguyªn §¬n",{2,1,30351,1}},50},
    -- {{"ÐÞÕæÒª¾÷²ÐÒ³",{2,1,30315,1,4}},5100},
    -- {{"1¼¶Ìú¾§",{2,1,30533,1,4}},15000},
    -- {{"2¼¶Ìú¾§",{2,1,30534,1,4}},15000},
    -- {{"3¼¶Ìú¾§",{2,1,30535,1,4}},9000},
    {{"Giµy V¶i Th«",{0,154,1,1}},100},
    {{"Tinh TrÝ Bè Hµi",{0,154,2,1}},100},
	{{"Bè ChÕ Cao §ång Ngoa",{0,154,3,1}},100},
	{{"ChiÕn Hµi Kim ChÕ ngò hµnh",{0,154,4,1}},20},
	{{"ChiÕn Hµi Méc ChÕ ngò hµnh",{0,154,5,1}},20},
	{{"ChiÕn Hµi Thñy ChÕ ngò hµnh",{0,154,6,1}},20},
	{{"ChiÕn Hµi Háa ChÕ ngò hµnh",{0,154,7,1}},20},
	{{"ChiÕn Hµi Thæ ChÕ ngò hµnh",{0,154,8,1}},20},
	{{"ChiÕn Hµi ¢m ChÕ ngò hµnh",{0,154,9,1}},20},

	{{"Tr­êng Hµi Du HiÖp",{0,154,26,1}},5},
	{{"ChiÕn Hµi ThiÕt HuyÕt",{0,154,27,1}},5},
--	{{"ÔÆÓÎµÀÑ¥",{0,154,28,1},msg},5},
	{{"§¹o Hµi V©n Du",{0,154,28,1},},5},
	{{"Nh©n S©m V¹n N¨m",{2,1,30071,1}},325},
	{{"Tói §¸ Quý CÊp 1",{2,1,30998,1}},60},
	{{"Tói §¸ Quý CÊp 2",{2,1,30999,1}},20},
	{{"Tói §¸ Quý CÊp 3",{2,1,31000,1}},10},
	
	{{"Kinh M¹ch §ång Nh©n",{2,1,30730,1}},50},

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

