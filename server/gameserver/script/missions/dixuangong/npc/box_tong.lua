Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")

T_BoxScript = {
	"\\script\\missions\\dixuangong\\npc\\box_tong1.lua",
	"\\script\\missions\\dixuangong\\npc\\box_tong2.lua",
	nil,
	"\\script\\missions\\dixuangong\\npc\\box_tong4.lua",
	"\\script\\missions\\dixuangong\\npc\\box_tong5.lua",
	"\\script\\missions\\dixuangong\\npc\\box_tong6.lua",
	nil,
}

T_TONG_BOX_IDX = {}
function remove_tong_box()
	for i,v in T_TONG_BOX_IDX do
		if GetNpcName(i) == "R��ng ��ng" then
			SetNpcLifeTime(i, 0);
		end
	end
	T_TONG_BOX_IDX = {}
end

function create_box_tong(nNpcIdx, nBoxId)
    if g_WCFG_DIAHUYENCUNG.bDisableDropBox == WEnv.TRUE then
        return WEnv.RETCODE_NOTOPEN;
    end

	if not T_BoxScript[nBoxId] then
		return
	end
	local m, x, y = GetNpcWorldPos(nNpcIdx);
	--��������1��
	local x2, y2 = x + random(-5, 5), y + random(-5, 5);
	local npc = CreateNpc("tongbaoxiang", "R��ng ��ng", m, x2, y2);
	if npc and npc > 0 then
		T_TONG_BOX_IDX[npc]  = 1
		--SetNpcLifeTime(npc, 180);
		SetNpcScript(npc, T_BoxScript[nBoxId]);
	else
		print("create tongbaoxiang fail")
	end
end
        
tClause1 = {
    {{"Thi�t Tinh c�p 1",{2,1,30533,1,1}},20},
    {{"Thi�t Tinh c�p 2",{2,1,30534,1,1}},10},
    {{"Thi�t Tinh c�p 3",{2,1,30535,1,1}},10},
    {{"�o Cho�ng T�o B�",{0,152,1,1}},10},
    {{"Nh�n S�m V�n N�m",{2,1,30071,1,1}},38},
    {{"T�i �� Qu� C�p 1",{2,1,30998,1,1}},7},
    {{"Kinh M�ch ��ng Nh�n",{2,1,30730,1,1}},5},
}
tClause2 = {
    {{"Thi�t Tinh c�p 1",{2,1,30533,1,1}},10},
    {{"Thi�t Tinh c�p 2",{2,1,30534,1,1}},10},
    {{"Thi�t Tinh c�p 3",{2,1,30535,1,1}},5},
    {{"�o Cho�ng C�m �o�n",{0,152,2,1}},15},
    {{"�o Cho�ng T�o B�",{0,152,1,1}},15},
    {{"Nh�n S�m V�n N�m",{2,1,30071,1,1}},33},
    {{"T�i �� Qu� C�p 1",{2,1,30998,1,1}},7},
    {{"Kinh M�ch ��ng Nh�n",{2,1,30730,1,1}},5},

}

tClause3 = {
    {{"T� Linh Quy Nguy�n ��n",{2,1,30352,1,1}},5},
    {{"B�i Nguy�n ��n",{2,1,30351,1,1}},5},

    {{"�o Cho�ng T�o B�",{0,152,1,1}},10},
    {{"�o Cho�ng C�m �o�n",{0,152,2,1}},10},
    {{"�o Cho�ng H�a V�n",{0,152,3,1}},10},

    {{"Nh�n S�m V�n N�m",{2,1,30071,1,1}},40},
    {{"T�i �� Qu� C�p 1",{2,1,30998,1,1}},12},
    {{"T�i �� Qu� C�p 2",{2,1,30999,1,1}},3},
    {{"Kinh M�ch ��ng Nh�n",{2,1,30730,1,1}},5},
} 

tClause4 = {
    {{"T� Linh Quy Nguy�n ��n",{2,1,30352,1,1}},50},
    {{"B�i Nguy�n ��n",{2,1,30351,1,1}},50},

    {{"�o Cho�ng Du Hi�p",{0,152,26,1}},5},
    {{"�o Cho�ng Thi�t Huy�t",{0,152,27,1}},5},
    {{"�o Cho�ng V�n Du",{0,152,28,1}},5},

    {{"�o Cho�ng T�o B�",{0,152,1,1}},150},
    {{"�o Cho�ng C�m �o�n",{0,152,2,1}},70},
    {{"�o Cho�ng H�a V�n",{0,152,3,1}},141},

    {{"Nh�n S�m V�n N�m",{2,1,30071,1,1}},350},
    {{"T�i �� Qu� C�p 1",{2,1,30998,1,1}},100},
    {{"T�i �� Qu� C�p 2",{2,1,30999,1,1}},24},
    {{"Kinh M�ch ��ng Nh�n",{2,1,30730,1,7*24*3600}},50},
} 

tClause5 = {
    {{"�o Cho�ng Du Hi�p",{0,152,26,1}},5},
    {{"�o Cho�ng Thi�t Huy�t",{0,152,27,1}},5},
    {{"�o Cho�ng V�n Du",{0,152,28,1}},5},

    {{"�o Cho�ng T�o B�",{0,152,1,1}},150},
    {{"�o Cho�ng C�m �o�n",{0,152,2,1}},70},
    {{"�o Cho�ng H�a V�n",{0,152,3,1}},141},

    {{"Nh�n S�m V�n N�m",{2,1,30071,1,1}},400},
    {{"T�i �� Qu� C�p 1",{2,1,30998,1,1}},150},
    {{"T�i �� Qu� C�p 2",{2,1,30999,1,1}},24},
    {{"Kinh M�ch ��ng Nh�n",{2,1,30730,1,7*24*3600}},50}
}

tClause6 = {
    {{"�o Cho�ng Du Hi�p",{0,152,26,1}},5},
    {{"�o Cho�ng Thi�t Huy�t",{0,152,27,1}},5},
    {{"�o Cho�ng V�n Du",{0,152,28,1}},5},

    {{"�o Cho�ng T�o B�",{0,152,1,1}},150},
    {{"�o Cho�ng C�m �o�n",{0,152,2,1}},60},
    {{"�o Cho�ng H�a V�n",{0,152,3,1}},141},

    {{"Nh�n S�m V�n N�m",{2,1,30071,1,1}},400},
    {{"T�i �� Qu� C�p 1",{2,1,30998,1,4}},150},
    {{"T�i �� Qu� C�p 2",{2,1,30999,1,4}},24},
    {{"T�i �� Qu� C�p 3",{2,1,31000,1,4}},10},
    {{"Kinh M�ch ��ng Nh�n",{2,1,30730,1,7*24*3600}},50},
}                              

tClause = {
	tClause1,
	tClause2,
    nil,-- tClause3,
	tClause4,
	tClause5,
	tClause6,
	nil,--tClause7,
}

function on_open(nStage)
	local tItem = gf_RandRate(tClause[nStage], nil, 2)[1];
	gf_ThrowDice(tItem[2], nil, nil, nil, nil, GetTargetNpc());
	SetNpcLifeTime(GetTargetNpc(), 0);
	SetNpcScript(GetTargetNpc(), "");
	gf_TeamOperateEX(vaf_award_api, "tDXGTongBox")
	FireEvent("event_mission_box_award", "dixuangong", "copper", nStage)
end

