function on_server_start()
	Add_Channel()
	Add_PopNpc()
	AddPVPNpc()
	SendScript2VM("\\script\\missions\\yp\\ywz\\head.lua", "ywz_CreateNpc()")
end

function CreateNpcList(tNpcList)
	for _, tNpc in tNpcList do
		local npc = CreateNpc(tNpc[1], tNpc[2], tNpc[3], tNpc[4], tNpc[5]);
		if npc > 0 then
			SetNpcScript(npc, tNpc[6] or "");
		else
			local idx = SubWorldID2Idx(tNpc[3])
			if idx and idx > 0 then
				local szMsg = format("Create[%s] Npc[%s][%s] fail", tNpc[1], tNpc[2], tNpc[6] or "")
				WriteLog(szMsg)
				print(szMsg)
			end
		end		
	end
end

function Add_Channel()
	local tChannel =
	{	--ÆµµÀÃû×ÖÓëID
		[1] = {"ThÕ Lùc §¹i Lý", 42},
		[2] = {"ThÕ Lùc Thæ Phån", 43},
		[3] = {"ThÕ Lùc T©y H¹", 44},
	}
	for i=1, getn(tChannel) do
		CreateChannel(tChannel[i][1], tChannel[i][2], 0, 10000);
	end;
end

function Add_PopNpc()		--ÉíÍûnpc
	CreateNpcList({
		{"men6_fengyun_tayun", "§¹p v©n-Lôc PhiÕn M«n", 6300, 1413, 3252},
		{"zongbiaotou_yuntianqi", "Thiªn Kh¶i-Tiªu §Çu", 6300, 1349, 3258},
		--{"linjiacheng", "ÉÌ»á¸»ºÀÁÖ¼Î³Ï", 6300, 1386, 3296},
		{"TriÒu ®×nh mËt th¸m ThÈm Trung", "TriÒu ®×nh mËt th¸m ThÈm Trung", 6400, 1722, 3275},
		--{"qianfuwren", "Íò¼ÒÇ®×¯ÀÏ°åÇ®·òÈË", 6300, 1372, 3297},
		{"§oµn Tö KiÖt", "Danh Väng Th­¬ng Nh©n-§oµn Tö KiÖt", 6000, 1604, 2776},
		{"Lý Ng¹o Thiªn", "Danh Väng Th­¬ng Nh©n-Lý Ng¹o Thiªn", 6200, 1443, 2597},
		{"T¸t Giµ Minh Phñ", "Danh Väng Th­¬ng Nh©n-T¸t Giµ Minh Phñ", 6100, 1594, 3683},
		{"TXBJ_TYET", "Thiªn ¢m ¸c §å", 6400, 1831, 3392},
		{"FENGXINZI", "Phong TÝn Tö në ré", 6300, 1407, 3128, "\\script\\task\\npc\\Ê¢¿ªµÄ·çÐÅ×Ó.lua"},
		--{"Zhuxiaobai", "ÖíÐ¡°×", 6400, 1860, 3509},
		{"tongmaguan", "§ång M· Qu¸n", 6400, 1632, 3180},
		{"guojingan", "Qu¸ch TÜnh An", 6400, 1840, 3212},
		{"yuantongdashi", "Viªn Th«ng §¹i S­", 6400, 1640, 3518},
	});

	local nNpcIdx = CreateNpc("Linh TÒ KiÕm DiÖc Kh¶ L¨ng","Linh TÒ KiÕm DiÖc Kh¶ L¨ng",6300,1475,3228)
	SetNpcScript(nNpcIdx,"\\script\\pop\\npc_yikelin.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6)

	nNpcIdx = CreateNpc("Ph¸ Hån §ao L©m Phong", "Ph¸ Hån §ao L©m Phong", 6300, 1358, 3385)
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_linfeng.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6)

	nNpcIdx = CreateNpc("Quû ¶nh Bót Lý ChÝ KiÖt", "Quû ¶nh Bót Lý ChÝ KiÖt", 6300, 1283, 3236)
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_lizhijie.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6)

	nNpcIdx = CreateNpc("V« T×nh Tr¶o Tiªu Thanh", "V« T×nh Tr¶o Tiªu Thanh", 6300, 1462, 3382)
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_xiaoqin.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6)

	nNpcIdx = CreateNpc("Tiªu côc gian tÕ Lý TrÇn Phong", "Tiªu côc gian tÕ Lý TrÇn Phong", 6400, 1780, 3173)
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_lichenfeng.lua")
	ChangeNpcToFight(nNpcIdx, 0, 6);
	
	local tPos = {
		{1860,3493}, {1865,6496}, {1865,3504}, {1859,3508}, {1851,3501},
		{1851,3488}, {1845,3481}, {1840,3485}, {1841,3473}, {1850,3482},
	}
	for _,v in tPos do
		nNpcIdx = CreateNpc("BIANLEI", "BiÓn L«i", 6400, v[1], v[2]);
		SetNpcScript(nNpcIdx, "\\script\\task\\npc\\ÈqÀÙ.lua");
	end
end

function AddPVPNpc()
	CreateNpcList({
		{"§o¹n Hßa HuyÒn", "§o¹n Hßa HuyÒn", 425,1762,3205, "\\script\\missions\\yp\\dhx_npc.lua"},
		{"C¸t Kh©m XÝch Ba", "C¸t Kh©m XÝch Ba", 425,1740,3175, "\\script\\missions\\yp\\dhx_npc.lua"},
		{"Lý KÕ Tinh", "Lý KÕ Tinh", 425,1763,3184, "\\script\\missions\\yp\\dhx_npc.lua"},
		{"Xa phu", "Xa Phu T©y Vùc", 425, 1744, 3204, "\\script\\missions\\yp\\cf_npc.lua"},
		{"Xa phu Trung Nguyªn","Xa Phu Vâ L©m Minh",425,1741,3232,"\\script\\tong\\npc_chehu.lua"},
		{"Xa phu Trung Nguyªn","Xa phu",429,1667,2872,"\\script\\Î÷ÄÏÇø\\Ëª·çÑÂ\\npc\\npc_chefu.lua"},
		{"Ch©n Tö §¬n hµo hoa", "TËp kÝch hµnh ®éng ", 6300, 1353, 3276, "\\script\\missions\\yp\\slymg\\npc_award.lua"},
	});
	SendScript2VM("\\script\\missions\\yp\\tls\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\hss\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\mm\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\qmy\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\tysd\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\slymg\\entrynpc.lua","gameStart()");
end
