Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\viet_event\\platinum_card\\platinum_head.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\warlord\\preload.lua");

startevent_tet_2023_Date = 20240115
endevent_tet_2023_Date = 20240310
maxEvent2023Total = 1000
-------------------------------------------------------
tbNguyenLieu = {
	{2,1,40157, "CÇu", 10},-- NL Boss
	{2,1,40158, "Xoµi", 10}, -- Nl c©y Kim PhiÕu
	{2,1,40159, "§ñ", 10},-- Trong Cay Vang
	{2,1,40141, "D­a HÊu", 10},
	{2,1,40142, "Sung", 10},
	{2,1,30230, "Xu", 5},
}
tbVPEvent = {
	{2,1,40131, "Mam Ngu Qua"},
}

-------------------------------------------------------------------------
tbNoel2023_AccumulateAward = {
	{
		nRequireNum = 1000,
		szName = "Mèc th­ëng 1000",
		tbAward = {
			{ tbProp = { 2, 1, 50085 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, --- Kinh Nghiem Chau
			---nFunc = "WItem:AddSuit_ThienHaVoSong(15, 4, 'Tô B¶o Trai')" },
			---nFunc = "KsgAward:SetDieuDuong(0, 4)
		},
	},
	{
		nRequireNum = 2000,
		szName = "Mèc th­ëng 2000",
		tbAward = {
			{ tbProp = { 2, 1, 30752 }, nStack = 5, nStatus = ITEMSTATUS_TRADE }, -- bïa CH7
			{ tbProp = { 2, 1, 30753 }, nStack = 3, nStatus = ITEMSTATUS_TRADE },-- Bïa C­êng hãa 8
			{ szFunc ="noel2023_give_tichLuy()" },-- §iÓm TÝch Lòy CT

		},
	},
	{
		nRequireNum = 3000,
		szName = "Mèc th­ëng 3000",
		tbAward = {
			{ szFunc ="AddItem(0,148,200,3,1,3,726,0,0,0,0)" },-- KTC15
			{ tbProp = { 2, 1, 50085 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, --- Kinh Nghiem Chau
		},
	},
	{
		nRequireNum = 5000,
		szName = "Mèc th­ëng 5000",
		tbAward = {
			{ tbProp = { 2, 1, 30754 }, nStack = 5, nStatus = ITEMSTATUS_TRADE }, -- c­êng hãa 9
			{ tbProp = { 2, 1, 30429 }, nStack = 2, nStatus = ITEMSTATUS_TRADE }, -- ma ®ao th¹ch
			{ tbProp = { 2, 1, 50033 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- R­¬ng m¶nh thiªn chi
			--{ tbProp = { 2, 1, 50220 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Ph¸o Hoa
		},
	},
};
--------------------------------------------------------------------------------
function noel2023_give_tichLuy()
	SetTask(707,GetTask(707)+30000)
	Msg2Player("§iÓm TÝch Lòy t¨ng 30000");
end
----------------------------------------------------------------------------------------------------------------------

function checkEventDate()
	if KsgPlayer:GetBigLevel() < 1099 then
		Talk(1,"","B¹n cÇn gia nhËp hÖ ph¸i vµ up cÊp tr­íc khi tham gia sù kiÖn nµy!")
		return 0;
	end

	local nDate = tonumber(date("%Y%m%d"))

	if nDate < startevent_tet_2023_Date or nDate > endevent_tet_2023_Date then
		Talk(1,"","Sù kiÖn ®· khÐp l¹i, c¶m ¬n quý ®ång ®¹o ®· tham gia.")
		return 0;
	end
	return 1;
end
----------------------------------------§æi th­ëng t¹i NPC--------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
function DoiEvent()
	if checkEventDate() ~= 1 then
		return 0;
	end

	if gf_Judge_Room_Weight(5, 50, "") ~= 1 then
		Talk(1,"","Hµnh trang kh«ng ®ñ chç trèng, vui lßng s¾p xÕp l¹i.")
		return 0;
	end
	AskClientForNumber("ExeDoiEvent", 1, 1000, "Sè l­îng");
end

function ExeDoiEvent(nVar)
	if checkEventDate() ~= 1 or nVar <= 0 then
		return 0;
	end

	local notNL = 0;
	--Check
	for i=1, getn(tbNguyenLieu) do
		if GetItemCount(tbNguyenLieu[i][1], tbNguyenLieu[i][2], tbNguyenLieu[i][3]) < nVar * tbNguyenLieu[i][5] then
			notNL = notNL + 1;
		end
	end
	if notNL ~= 0 then
		Talk(1, "", "Trªn hµnh trang kh«ng ®ñ nguyªn liÖu xin kiÓm tra l¹i!");
		return 0;
	end

	--Pay
	for i=1, getn(tbNguyenLieu) do
		DelItem(tbNguyenLieu[i][1], tbNguyenLieu[i][2], tbNguyenLieu[i][3], nVar * tbNguyenLieu[i][5])
	end

	--Add Item
	local tItem = {}
	tItem = tbVPEvent[1]
	gf_AddItemEx2({tItem[1],tItem[2],tItem[3],nVar}, tItem[4], "event_tet2023", "exchange_item: "..nVar, 0, 1)

	Talk(1, "", format("B¹n võa ®æi thµnh c«ng %d M©m Ngò Qu¶. KiÓm tra ë r­¬ng hµnh trang!", nVar))
	Msg2Player(format("B¹n võa ®æi thµnh c«ng %d M©m Ngò Qu¶. KiÓm tra ë r­¬ng hµnh trang!", nVar))
end
-----------------------------------------------------------------------------------------------------------------------------------------------
---
function DoiEvent2024(nChose)
	if checkEventDate() ~= 1 then
		return 0;
	end
	local nCheck = nChose or 1;
	if gf_Judge_Room_Weight(5, 50, "") ~= 1 then
		Talk(1,"","Hµnh trang kh«ng ®ñ chç trèng, vui lßng s¾p xÕp l¹i.")
		return 0;
	end
	if nCheck==1 then
		AskClientForNumber("ExeDoiEvent2024_TienXu", 1, 1000, "Sè l­îng");
	elseif nCheck==2 then
		AskClientForNumber("ExeDoiEvent2024_TheGoiBoss", 1, 1000, "Sè l­îng");
	else
		AskClientForNumber("ExeDoiEvent2024_ChucPhucNamMoi", 1, 1000, "Sè l­îng");
	end
end

function ExeDoiEvent2024_TienXu(nVar)
	if checkEventDate() ~= 1 or nVar <= 0 then
		return 0;
	end
	local nCount = nVar or 1;

	if nCount <= 0 or nCount > 1000 then
		return 0;
	end

	local nPayment = nCount * 10;

	local tbAward = {
		{ szName = "C©y §µo", tbProp = { 2, 1, 40132 }, nStack = nCount, nStatus = 1 },
	};
	local tbConsume = {
		tbItems = {
			{ tbProp = { 2, 1, 40135 }, nCount = nPayment }, -- Canh Dao
			{ tbProp = { 2, 1, 40136 }, nCount = nPayment }, -- Canh mai
			{ tbProp = { 2, 1, 30230 }, nCount = nPayment }, -- Xu Vat Pham
		}
	};

	if WLib:PayMaterial(tbConsume) == WEnv.TRUE then
		WAward:Give(tbAward, "cay_Dao");
	else
		return WEnv.RETCODE_CONSUMEERROR;
	end
end
---
function ExeDoiEvent2024_ChucPhucNamMoi(nVar)
	if checkEventDate() ~= 1 or nVar <= 0 then
		return 0;
	end
	local nCount = nVar or 1;

	if nCount <= 0 or nCount > 1000 then
		return 0;
	end

	local nPayment = nCount * 5;

	local tbAward = {
		{ szName = "Thiep Chuc Phuc", tbProp = { 2, 1, 40145 }, nStack = nCount, nStatus = 1 },
	};
	local tbConsume = {
		tbItems = {
			{ tbProp = { 2, 1, 40144 }, nCount = nPayment }, -- Nien Thu Cot
			{ tbProp = { 2, 1, 30230 }, nCount = 2*nPayment }, -- Xu Vat Pham
		}
	};

	if WLib:PayMaterial(tbConsume) == WEnv.TRUE then
		WAward:Give(tbAward, "ThiepChucPhuc");
	else
		return WEnv.RETCODE_CONSUMEERROR;
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function ExeDoiEvent2024_TheGoiBoss(nVar)
	if checkEventDate() ~= 1 or nVar <= 0 then
		return 0;
	end
	local nCount = nVar or 1;

	if nCount <= 0 or nCount > 1000 then
		return 0;
	end

	local nPayment = nCount * 20;

	local tbAward = {
		{ szName = "The Goi Boss", tbProp = { 2, 1, 40146 }, nStack = nCount, nStatus = 1 },
	};
	local tbConsume = {
		tbItems = {
			{ tbProp = { 2, 1, 30230 }, nCount = nPayment }, -- Xu Vat Pham
		}
	};

	if WLib:PayMaterial(tbConsume) == WEnv.TRUE then
		WAward:Give(tbAward, "ThiepChucPhuc");
	else
		return WEnv.RETCODE_CONSUMEERROR;
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function DoiHatGiongEvent(nChose)
	if checkEventDate() ~= 1 then
		return 0;
	end
	local nCheck = nChose or 1;
	if gf_Judge_Room_Weight(5, 50, "") ~= 1 then
		Talk(1,"","Hµnh trang kh«ng ®ñ chç trèng, vui lßng s¾p xÕp l¹i.")
		return 0;
	end
	if nCheck==1 then
		AskClientForNumber("ExeDoiCayDao", 1, 1000, "Sè l­îng");
	else
		AskClientForNumber("ExeDoiCayMai", 1, 1000, "Sè l­îng");
	end
end

---------------------------------------
---
function ExeDoiCayDao(nVar)
	if checkEventDate() ~= 1 or nVar <= 0 then
		return 0;
	end

	local nCount = nVar or 1;

	if nCount <= 0 or nCount > 1000 then
		return 0;
	end

	local nPayment = nCount * 5;

	local tbAward = {
		{ szName = "C©y §µo", tbProp = { 2, 1, 40133 }, nStack = nCount, nStatus = 1 },
	};
	local tbConsume = {
		tbItems = {
			{ tbProp = { 2, 1, 30230 }, nCount = nPayment }, -- Xu Vat Pham
		}
	};

	if WLib:PayMaterial(tbConsume) == WEnv.TRUE then
		WAward:Give(tbAward, "cay_Dao");
	else
		return WEnv.RETCODE_CONSUMEERROR;
	end


end

function ExeDoiCayMai(nVar)
	if checkEventDate() ~= 1 or nVar <= 0 then
		return 0;
	end

	local nCount = nVar or 1;

	if nCount <= 0 or nCount > 1000 then
		return 0;
	end

	local nPayment = nCount * 5;

	local tbAward = {
		{ szName = "C©y Mai", tbProp = { 2, 1, 40134 }, nStack = nCount, nStatus = 1 },
	};
	local tbConsume = {
		tbItems = {
			{ tbProp = { 2, 1, 30230 }, nCount = nPayment }, -- Xu Vat Pham
		}
	};

	if WLib:PayMaterial(tbConsume) == WEnv.TRUE then
		WAward:Give(tbAward, "cay_lMai");
	else
		return WEnv.RETCODE_CONSUMEERROR;
	end

end
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------

function CreateBossEvent2024()
	--if WDate:Today() > 20240216 then
	--	return
	--end
	local szMsg = "Ngäc S¬n Chi Linh xuÊt hiÖn trong Linh B¶o S¬n!! OKla  !";

	--[218] = {nMinX = 204, nMinY = 204, nMaxX = 233, nMaxY = 227}, --Linh B¶o S¬n
	local nBossIdx = CreateNpc("WorldBoss_TJ", "Ngäc S¬n Chi Linh", 218,random(204,233)*8, random(204,227)*16);
	if nBossIdx ~= 0 then
		SetNpcScript(nBossIdx,"\\script\\warlord\\online_activities\\tetnguyendan2024\\eventboss\\nienthu.lua")
		SetNpcRemoveScript(nBossIdx,  "\\script\\warlord\\online_activities\\tetnguyendan2024\\eventboss\\nguoivohinh.lua")
		WriteLog("[WBOSS_TNC:CreateBossEvent2024] success!");
		SetNpcLifeTime(nBossIdx, 600);
		Msg2Global(szMsg);
		AddGlobalNews(szMsg);
	else
		WriteLog("[WBOSS_TNC:CreateBossEvent2024] error!");
	end
end

function bosstet2024_give()
	if WLib:CheckInv(10, 100) ~= WEnv.TRUE then
		return WEnv.RETCODE_NEEDROOM;
	end
	local tbConsume = {
		tbItems = {
			{ tbProp = { 2, 1, 30230 }, nCount = 5 }, -- Xu Vat Pham
		}
	};
	local tbRandomAward = {
		--{nExp = 300000000, nRate = 20.00 }, --  -exp
		{ tbProp = { 2, 1, 40030 }, nStack = 1, nRate = 2.00,nStatus = ITEMSTATUS_TRADE }, -- Tói §¸ Quý CÊp 8
		{ tbProp = { 2, 1, 31615 }, nStack = 10, nRate = 10,nStatus = ITEMSTATUS_TRADE }, --  LuyÖn L« ThiÕt Lv8
		{ tbProp = { 2, 1, 31614 }, nStack = 10, nRate = 15,nStatus = ITEMSTATUS_TRADE }, --TÈy T©m Th¹ch Lv8
		{ tbProp = { 2, 102, 225 }, nStack = 1, nRate = 15.00,nStatus = ITEMSTATUS_TRADE }, -- Thuong hai 7
		{ tbProp = { 2, 1, 31239 }, nStack = 1, nRate = 2, nStatus = ITEMSTATUS_TRADE }, -- Linh Ph¸ch §¬n
		{ tbProp = { 2, 114, 143 }, nStack = 1, nRate = 15,nStatus = ITEMSTATUS_TRADE }, -- Ch©n Vâ Hån Th¹ch
		{ tbProp = { 2, 1, 30424 }, nStack = 1, nRate = 5,nStatus = ITEMSTATUS_TRADE }, -- C­êng hãa quyÓn 12
		{ tbProp = { 2, 1, 30425 }, nStack = 1, nRate = 5,nStatus = ITEMSTATUS_TRADE }, -- C­êng hãa quyÓn 13
		{ tbProp = { 2, 1, 30426 }, nStack = 1, nRate = 5,nStatus = ITEMSTATUS_TRADE }, -- C­êng hãa quyÓn 14
		{ tbProp = { 2, 1, 30427 }, nStack = 1, nRate = 5,nStatus = ITEMSTATUS_TRADE }, -- C­êng hãa quyÓn 15
		{ tbProp = { 2, 1, 1001 }, nStack = 1, nRate = 2,nStatus = ITEMSTATUS_TRADE }, -- Hßa ThÞ BÝch
		{ tbProp = { 2, 1, 40137 }, nStack = 1000, nRate = 5.00,nStatus = ITEMSTATUS_TRADE}, -- Bot Tran Chau Tinh Anh
		{ tbProp = { 2, 1, 40143 }, nStack = 5, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- M¶nh HuyÒn Thoai
		--{ tbProp = { 2, 1, 50257 }, nStack = 1, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, -- ThÎ më r­¬ng
		{ tbProp = { 2, 1, 30191 }, nStack = 1, nRate = 5,nStatus = ITEMSTATUS_TRADE }, -- Ng«i Sao May M¾n
		{ tbProp = { 2, 1, 30847 }, nStack = 1, nRate = 2, nStatus = ITEMSTATUS_TRADE }, -- Håi Tiªn §¬n
		{ tbProp = { 2, 1, 30390 }, nStack = 100, nRate = 2.00,nStatus = ITEMSTATUS_TRADE }, --Ma¶nh Thien cang Lenh
		{ tbProp = { 2, 1, 30410 }, nStack = 20, nRate = 2.00,nStatus = ITEMSTATUS_TRADE }, --M¶nh Thien Mon Kim Lenh
		{ tbProp = { 2, 1, 31324 }, nStack = 1, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --Ruong Thu Cuoi Manh Manh

	};
	if WLib:PayMaterial(tbConsume) == WEnv.TRUE then
		local szKey = "boss2024"
		local nOpenType=1;
		WAward:GiveByRandom(tbRandomAward, format("%s_%d", szKey, nOpenType));
		ModifyExp(300000000);
	else
		return WEnv.RETCODE_CONSUMEERROR;
	end

end