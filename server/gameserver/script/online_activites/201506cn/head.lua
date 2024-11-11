Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\activity_head.lua")

g_debug = 0
g_t201506cn = {
	nStartDate=20150615,
	nEndDate=20150630,
	TASK_GROUP = TaskManager:Create(2, 21),
	tBossPos = {
    	[401] = {
    		"�i�m Th��ng s�n",
    		{401,1695,2985},
            {401,1507,2947},
            {401,1599,2862},
            {401,1586,2950},
            {401,1596,3068},
            {401,1610,3182},
    	},
    	[302] = {
    		"Thanh Th�nh s�n",
    		{302,1532,3045},
            {302,1562,2893},
            {302,1457,2850},
            {302,1372,2989},
            {302,1335,3119},
            {302,1440,3132},
    	},
    	[505] = {
    		"D��c V��ng c�c",
            {505,1360,3102},
            {505,1437,3024},
            {505,1542,3017},
            {505,1525,2869},
            {505,1402,2873},
            {505,1402,2805},
    	},
    },
    tKillNpc = {
		[401] = {--���ɽ
			["Xi H�a �ao Kh�ch"] = 1,
			["Xi H�a s� gi�"] = 1,
		},
		[302] = {--���ɽ
			["Ki�m T�"] = 1,
		},
		[505] = {--ҩ����
			["T�y H� V� S�"] = 1,
			["T�y H� D�ng S�"] = 1,
		},
	},
	tMainAward = {
		[1] = {
			tAll = {
    			{1,"M�t Th� T�y V�c",{2,1,30870,1},0},
    			{1,"C�ng Ph�m T�y V�c",{2,1,30871,50},0},
			},
			tRand = {
                { 1, 800, "H��ng Li�u T�y V�c", {2,1,30874, 2}, 0, },
                { 1, 800, "Huy�t Tr�ch Th�ch C�p 1", {2,22,101, 3}, 0, },
                { 1, 800, "Nguy�t B�ch Th�ch C�p 1", {2,22,201, 3}, 0, },
                { 1, 800, "H� Ph�ch Th�ch C�p 1", {2,22,301, 3}, 0, },
                { 1, 800, "H�c Di�u Th�ch C�p 1", {2,22,401, 3}, 0, },
                { 1, 250, "Huy�t Tr�ch Th�ch C�p 2", {2,22,102, 1}, 0, },
                { 1, 250, "Nguy�t B�ch Th�ch C�p 2", {2,22,202, 1}, 0, },
                { 1, 250, "H� Ph�ch Th�ch C�p 2", {2,22,302, 1}, 0, },
                { 1, 250, "H�c Di�u Th�ch C�p 2", {2,22,402, 1}, 0, },
                { 1, 50, "Huy�t Tr�ch Th�ch C�p 3", {2,22, 103, 1}, 0, },
                { 1, 50, "Nguy�t B�ch Th�ch C�p 3", {2,22,203, 1}, 0, },
                { 1, 50, "H� Ph�ch Th�ch C�p 3", {2,22,303, 1}, 0, },
                { 1, 50, "H�c Di�u Th�ch C�p 3", {2,22,403, 1}, 0, },
                { 1, 450, "C�u Chuy�n Ho�n H�n �an", {1,0,32, 1}, 0, },
                { 1, 50, "Thi�n Ki�u L�nh", {2,97,236, 1}, 0, },
                { 1, 100, "Tu Ch�n Y�u Quy�t", {2,0,554, 1}, 3600*24*7, },
                { 1, 400, "Ti�u Nh�n s�m qu�", {2,0,552, 1}, 0, },
                { 1, 900, "Thi�t Tinh c�p 1", {2,1,30533, 2}, 0, },
                { 1, 500, "Thi�t Tinh c�p 2", {2,1,30534, 1}, 0, },
                { 1, 600, "H�c Ng�c �o�n T�c Cao", {1,0,6, 3}, 0, },
                { 1, 600, "Sinh Sinh H�a T�n", {1,0,16, 3}, 0, },
                { 1, 600, "V�n V�t Quy Nguy�n ��n", {1,0,11, 3}, 0, },
                { 1, 600, "Ti�u Ki�p t�n", {2,0,141, 1}, 3600*24*7, },
        	},
		},
		[2] = {
			nMaxCnt = 100,
			tAll = {
				--{2,100000},--exp
			},
			tRand = {
                { 1, 1500, "H�c Ng�c �o�n T�c Cao", {1,0,6, 1, 4}, 0, },
                {2, 1500, 500000},--exp
                {2, 1100, 1000000},--exp
                {2, 800, 1500000},--exp
                {2, 600, 2000000},--exp
                {2, 400, 4000000},--exp
                { 1, 300, "V� Ti�u Y ��ng", {2,1,30493, 1, 4}, 0, },
                { 1, 100, "V� Ti�u Y B�c", {2,1,30492, 1, 4}, 0, },
                { 1, 100, "Thi�t Tinh c�p 1", {2,1,30533, 1, 4}, 0, },
                { 1, 80, "Thi�t Tinh c�p 2", {2,1,30534, 1, 4}, 0, },
                { 1, 20, "Thi�t Tinh c�p 3", {2,1,30535, 1, 4}, 0, },
                { 1, 109, "C�u Chuy�n Ho�n H�n �an", {1,0,32, 1, 4}, 0, },
                { 1, 1, "H��ng Li�u T�y V�c", {2,1,30874, 1}, 0, },
                { 1, 20, "Hu�n ch��ng anh h�ng", {2,1,30499, 1, 4}, 0, },
                { 1, 20, "M�nh Thi�n Cang", {2,1,30390, 1, 4}, 0, },
                { 1, 20, "M�nh Thi�n M�n", {2,1,30410, 1, 4}, 0, },
                { 1, 29, "C�y B�t Nh�", {2, 0,398, 1, 4}, 0, },
                { 1, 50, "Ti�u Nh�n s�m qu�", {2,0,552, 1, 4}, 0, },
                { 1, 10, "��u h�n", {2,1,1157, 1, 4}, 3600*24*7, },
                { 1, 10, "Huy�t Tr�ch Th�ch C�p 1", {2,22,101, 1}, 0, },
                { 1, 10, "Nguy�t B�ch Th�ch C�p 1", {2,22,201, 1}, 0, },
                { 1, 10, "H� Ph�ch Th�ch C�p 1", {2,22,301, 1}, 0, },
                { 1, 10, "H�c Di�u Th�ch C�p 1", {2,22,401, 1}, 0, },
                { 1, 1500, "Sinh Sinh H�a T�n", {1,0,16, 1, 4}, 0, },
                { 1, 1500, "V�n V�t Quy Nguy�n ��n", {1,0,11, 1, 4}, 0, },
                { 1, 100, "B�ng th�ch", {2,1,149, 1, 4}, 0, },
                { 1, 1, "Thi�n Ki�u L�nh", {2,97,236, 1, 4}, 0, },
                { 1, 100, "Ti�u Ki�p t�n", {2,0,141, 1, 4}, 3600*24*7, },
			},
		},
		[3] = {
			nMaxCnt = 1000,
			tAll = {
				--{2,100000},--exp
				{1,"M�nh Thi�n Cang",{2,1,30390,5},0},
			},
			tRand = {
			 	{ 1, 400, "H�c Ng�c �o�n T�c Cao", {1,0,6, 3}, 0, },
                { 1, 400, "Sinh Sinh H�a T�n", {1,0,16, 3}, 0, },
                { 1, 400, "V�n V�t Quy Nguy�n ��n", {1,0,11, 3}, 0, },
                { 1, 5, "H�a Ph�ng Linh", {2,1,30769, 1}, 0, 0, 0,  1 },
                { 1, 150, "M�nh Thi�n Cang", {2,1,30390, 5}, 0, },
                { 1, 50, "Thi�n M�n Kim L�nh", {2,1,30370, 1}, 0, },
                { 1, 140, "M�nh Thi�n M�n", {2,1,30410, 5}, 0, },
                { 1, 200, "Th�i Nh�t L�nh", {2,1,30687, 1}, 0, },
                { 1, 550, "Huy�t Tr�ch Th�ch C�p 1", {2,22,101, 1}, 0, },
                { 1, 550, "Nguy�t B�ch Th�ch C�p 1", {2,22,201, 1}, 0, },
                { 1, 550, "H� Ph�ch Th�ch C�p 1", {2,22,301, 1}, 0, },
                { 1, 550, "H�c Di�u Th�ch C�p 1", {2,22,401, 1}, 0, },
                { 1, 400, "Huy�t Tr�ch Th�ch C�p 2", {2,22,102, 1}, 0, },
                { 1, 400, "Nguy�t B�ch Th�ch C�p 2", {2,22,202, 1}, 0, },
                { 1, 400, "H� Ph�ch Th�ch C�p 2", {2,22,302, 1}, 0, },
                { 1, 400, "H�c Di�u Th�ch C�p 2", {2,22,402, 1}, 0, },
                { 1, 100, "Huy�t Tr�ch Th�ch C�p 3", {2,22, 103, 1}, 0, },
                { 1, 100, "Nguy�t B�ch Th�ch C�p 3", {2,22,203, 1}, 0, },
                { 1, 100, "H� Ph�ch Th�ch C�p 3", {2,22,303, 1}, 0, },
                { 1, 100, "H�c Di�u Th�ch C�p 3", {2,22,403, 1}, 0, },
                { 1, 50, "Huy�t Tr�ch Th�ch C�p 4", {2,22,104, 1}, 0, },
                { 1, 50, "Nguy�t B�ch Th�ch C�p 4", {2,22,204, 1}, 0, },
                { 1, 50, "H� Ph�ch Th�ch C�p 4", {2,22,304, 1}, 0, },
                { 1, 50, "H�c Di�u Th�ch C�p 4", {2,22,404, 1}, 0, },
                { 1, 350, "Luy�n L� Thi�t C�p 3", {2,1,30529, 1}, 0, },
                { 1, 350, "T�y T�m Th�ch C�p 3", {2,1,30523, 1}, 0, },
                { 1, 190, "Luy�n L� Thi�t C�p 4", {2,1,30530, 1}, 0, },
                { 1, 190, "T�y T�m Th�ch C�p 4", {2,1,30524, 1}, 0, },
                { 1, 600, "Thi�t Tinh c�p 1", {2,1,30533, 1}, 0, },
                { 1, 400, "Thi�t Tinh c�p 2", {2,1,30534, 1}, 0, },
                { 1, 225, "Thi�t Tinh c�p 3", {2,1,30535, 1}, 0, },
                { 1, 200, "Ti�u Ki�p t�n", {2,0,141, 1}, 3600*24*7, },
                { 1, 500, "B�ng th�ch", {2,1,149, 1}, 0, },
                { 1, 50, "Tu Ch�n Y�u Quy�t", {2,0,554, 1}, 3600*24*7, },
                { 1, 800, "C�u Chuy�n Ho�n H�n �an", {1,0,32, 1}, 0, },
			},
		},
	},
}

function is_in_activity_date()
	if g_debug==1 then
		return 1
	end
	local today = tonumber(date("%Y%m%d"));
	if today >= g_t201506cn.nStartDate and today <= g_t201506cn.nEndDate then
		return 1
	end
	return 0
end

function check_player_condition()
	if is_in_activity_date() ~= 1 then
		return 0
	end
	if get_trans_level() < 90 or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",format("C�p %d tr� l�n, �� h�c 1 b� k� n�ng c�p 55 m�i ���c tham gia ho�t ��ng.", 90))
		return 0;
	end
	return 1
end

function get_trans_level()
	return gf_GetPlayerRebornCount()*100+GetLevel()
end

function get_task(nIndex)
	local TASK_GROUP = g_t201506cn.TASK_GROUP
	return TASK_GROUP:GetTask(nIndex)
end

function set_task(nIndex,nValue)
	local TASK_GROUP = g_t201506cn.TASK_GROUP
	return TASK_GROUP:SetTask(nIndex,nValue)
end

function add_task(nIndex)
	set_task(nIndex, get_task(nIndex)+1)
end

function pack_item_id(g,d,p)
	return p+d*100000+g*10*100000
end