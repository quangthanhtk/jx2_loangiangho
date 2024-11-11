Include("\\script\\vng\\lib\\vnglib_award.lua");
Import("\\script\\lib\\globalfunctions.lua")


function Equipment_ThanhLong()
	local nDate = tonumber(date("%Y%m%d"));
--	if nDate > 20190401 then
--		Talk(1, "", "HiÖn t¹i ta ®· hÕt hµng, ®¹i hiÖp h·y quay l¹i sau nha.")
--		return 0 
--	end
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"","C¸c h¹ ch­a gia nhËp hÖ ph¸i!")
		return
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local msg = "Thanh Long Tö: N©ng cÊp trang bÞ Thanh Long T­íng Qu©n thµnh c«ng 100%, cÇn tiªu hao: 1 trang bÞ Háa Phông t­¬ng øng, Thiªn M«n Kim LÖnh, Thiªn Cang LÖnh, Cöu Thiªn V« Cùc §¬n"
	
	tinsert(tbSayDialog,"N©ng cÊp Nãn Thanh Long T­íng Qu©n(tiªu hao 20 TMKL, 20 TCL, 10 CTVCD) /#updateThanhLong_choose(1)")
	tinsert(tbSayDialog,"N©ng cÊp ¸o Thanh Long T­íng Qu©n (tiªu hao 20 TMKL, 20 TCL, 10 CTVCD) /#updateThanhLong_choose(2)")
	tinsert(tbSayDialog,"N©ng cÊp QuÇn Thanh Long T­íng Qu©n (tiªu hao 20 TMKL, 20 TCL, 10 CTVCD) /#updateThanhLong_choose(3)")
	tinsert(tbSayDialog,"N©ng cÊp Trang Søc Thanh Long T­íng Qu©n (tiªu hao 40 TMKL, 40 TCL, 15 CTVCD) /TrangSuc_ThanhLong")
--	tinsert(tbSayDialog,"N©ng cÊp Vò KhÝ cao cÊp Thanh Long T­íng Qu©n (tiªu hao 30 TMKL, 30 TCL, 2 CTVCD) /#updateVanSuc_choose(4)")
	tinsert(tbSayDialog,"T«i chØ xem xem th«i/nothing")
	nSaySize = getn(tbSayDialog);
	Say(msg, nSaySize, tbSayDialog);
end
function TrangSuc_ThanhLong()

	local tbSayDialog = {};
	local nSaySize = 0;
	local msg = "Thanh Long Tö: N©ng cÊp Trang Søc Thanh Long cÇn tiªu hao: 1 trang bÞ Háa Phông t­¬ng øng, 40 Thiªn M«n Kim LÖnh, 40 Thiªn Cang LÖnh, 1 Cöu Thiªn V« Cùc §¬n"
	
	tinsert(tbSayDialog,"N©ng cÊp Trang Søc Thanh Long Phï (tiªu hao 40 TMKL, 40 TCL, 15 CTVCD) /#updateThanhLong_choose(5)")
	tinsert(tbSayDialog,"N©ng cÊp Trang Søc Thanh Long Kú (tiªu hao 40 TMKL, 40 TCL, 15 CTVCD) /#updateThanhLong_choose(6)")
	tinsert(tbSayDialog,"N©ng cÊp Trang Søc Thanh Long Bµi (tiªu hao 40 TMKL, 40 TCL, 15 CTVCD) /#updateThanhLong_choose(7)")
	tinsert(tbSayDialog,"T«i chØ xem xem th«i/nothing")
	nSaySize = getn(tbSayDialog);
	Say(msg, nSaySize, tbSayDialog);
end
function updateThanhLong_choose(nChoose)
	local tCondition = { --Thiªn m«n kim lÖnh, Thiªn cang lÖnh, Th¸i NhÊt LÖnh
				[1] = {10, {2,1,30370}, 10, {2,95,204}, 500, {2,1,30687},"Nãn Thanh Long"},
				[2] = {10, {2,1,30370}, 10, {2,95,204}, 500, {2,1,30687},"¸o Thanh Long"},
				[3] = {10, {2,1,30370}, 10, {2,95,204}, 500, {2,1,30687},"QuÇn Thanh Long"},
				[4] = {20, {2,1,30370}, 20, {2,95,204}, 1000, {2,1,30687},"Vò KhÝ Thanh Long"},
				[5] = {15, {2,1,30370}, 15, {2,95,204}, 750, {2,1,30687},"Trang Søc Thanh Long"},
				[6] = {15, {2,1,30370}, 15, {2,95,204}, 750, {2,1,30687},"Trang Søc Thanh Long"},
				[7] = {15, {2,1,30370}, 15, {2,95,204}, 750, {2,1,30687},"Trang Søc Thanh Long"},
			}
			
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,1,30370) < tCondition[nChoose][1] then
		Talk(1, "","§¹i hiÖp kh«ng mang ®ñ "..tCondition[nChoose][1].." Thiªn M«n Kim LÖnh.")
		return 0
	end
	if GetItemCount(2,95,204) < tCondition[nChoose][3] then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ "..tCondition[nChoose][3].." Thiªn Cang LÖnh.")
		return 0
	end
	if GetItemCount(2,1,1006) < tCondition[nChoose][5] then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ "..tCondition[nChoose][5].." Cöu Thiªn V« Cùc §¬n.")
		return 0
	end
	local nCheck = check_HoaPhung(nChoose)
	if nCheck <= 0 then
		Talk(1,"", "§¹i hiÖp kh«ng mang theo trang bÞ Háa Phông ®Ó n©ng cÊp trang bÞ Thanh Long T­íng Qu©n.")
		return 0
	end
	local nDelHoaPhung = dell_HoaPhung(nChoose)
	if nDelHoaPhung ~= 1 then
		Talk(1,"", "Xãa kh«ng thµnh c«ng trang bÞ háa phông")
		gf_WriteLogEx("NANG CAP THANH LONG", "xoa", 1, "xãa trang bÞ háa phông")
		return 0
	end	
	if DelItem(2,1,30370,tCondition[nChoose][1]) ~= 1 then
		Talk(1,"", "Xãa kh«ng thµnh c«ng vËt phÈm 1")
		gf_WriteLogEx("NANG CAP THANH LONG", "xoa", 1, "xãa vËt phÈm TMKL")
		return 0
	end
	if DelItem(2,95,204,tCondition[nChoose][3]) ~= 1 then
		Talk(1,"", "Xãa kh«ng thµnh c«ng vËt phÈm 2")
		gf_WriteLogEx("NANG CAP THANH LONG", "xoa", 1, "xãa vËt phÈm TCL")
		return 0
	end
	if DelItem(2,1,1006,tCondition[nChoose][5]) ~= 1 then
		Talk(1,"", "Xãa kh«ng thµnh c«ng vËt phÈm 3")
		gf_WriteLogEx("NANG CAP THANH LONG", "xoa", 1, "xãa vËt phÈm CTVCD")
		return 0
	end	
	Equipment_ThanhLongTuongQuan(0,nChoose)
--	gf_AddItemEx2(tCondition[nChoose][7], tCondition[nChoose][7], "TIEN CAP THANH LONG", "Trang bÞ Thanh Long");
	Talk(1, "", "Chóc mõng ®¹i hiÖp ®· n©ng cÊp thµnh c«ng trang bÞ "..tCondition[nChoose][7])	
	gf_WriteLogEx("NANG CAP THANH LONG TUONG", "nhan", 1, "N©ng cÊp thµnh c«ng")
end
function check_HoaPhung(nType)
	local tTrangBi = {--Nãn, ¸o, quÇn, vk, phï, kú bµi
				[1] = {103, 30311, 30374, 30439, 30502, {32153, 32161, 32155, 32163}}, 	--30311 ®Õn 30374, 30439 ®Õn 30502, thªm vµi sè hÖ ph¸i sau nµy
				[2] = {100, 30311, 30374, 30439, 30502, {32153, 32161, 32155, 32163}}, 	--30311 ®Õn 30374, 30439 ®Õn 30502, thªm vµi sè hÖ ph¸i sau nµy
				[3] = {101, 30311, 30374, 30439, 30502, {32153, 32161, 32155, 32163}}, 	--30311 ®Õn 30374, 30439 ®Õn 30502, thªm vµi sè hÖ ph¸i sau nµy
				[4] = {},
				[5] = {102, 30356, 30419, 30804, 30867, {31488, 31516, 31502, 31530}},
				[6] = {102, 30292, 30355, 30740, 30803, {31487, 31515, 31501, 31529}},
				[7] = {102, 30228, 30291, 30676, 30739, {31486, 31514, 31500, 31528}},
			}
	local nCountT = 0
	local nCountL = 0
	local nCount = 0
	for i = 1, 4 do
		nCount = GetItemCount(0,tTrangBi[nType][1],tTrangBi[nType][6][i])	
		if nCount > 0 then
			break
		end
	end
	for i = 1, 64 do
		nCountT = GetItemCount(0,tTrangBi[nType][1],tTrangBi[nType][2] + i - 1)	
		if nCountT > 0 then
			break
		end
	end
	for i = 1, 64 do
		nCountL = GetItemCount(0,tTrangBi[nType][1],tTrangBi[nType][4] + i - 1)	
		if nCountL > 0 then
			break
		end
	end
	nCount = nCount + nCountT + nCountL		
	return nCount
end
function dell_HoaPhung(nType)
	local tTrangBi = {--Nãn, ¸o, quÇn, vk, phï, kú bµi
				[1] = {103, 30311, 30374, 30439, 30502, {32153, 32161, 32155, 32163}}, 	--30311 ®Õn 30374, 30439 ®Õn 30502, thªm vµi sè hÖ ph¸i sau nµy
				[2] = {100, 30311, 30374, 30439, 30502, {32153, 32161, 32155, 32163}}, 	--30311 ®Õn 30374, 30439 ®Õn 30502, thªm vµi sè hÖ ph¸i sau nµy
				[3] = {101, 30311, 30374, 30439, 30502, {32153, 32161, 32155, 32163}}, 	--30311 ®Õn 30374, 30439 ®Õn 30502, thªm vµi sè hÖ ph¸i sau nµy
				[4] = {},
				[5] = {102, 30356, 30419, 30804, 30867, {31488, 31516, 31502, 31530}},
				[6] = {102, 30292, 30355, 30740, 30803, {31487, 31515, 31501, 31529}},
				[7] = {102, 30228, 30291, 30676, 30739, {31486, 31514, 31500, 31528}},
			}
	local nDelHoaPhungT = 0
	local nDelHoaPhungL = 0
	local nDelHoaPhung = 0
	for i = 1, 4 do
		nDelHoaPhung = DelItem(0,tTrangBi[nType][1],tTrangBi[nType][6][i],1)	
		if nDelHoaPhung > 0 then
			break
		end
	end
	for i = 1, 64 do
		nDelHoaPhungT = DelItem(0,tTrangBi[nType][1],tTrangBi[nType][2] + i - 1,1)	
		if nDelHoaPhungT > 0 then
			break
		end
	end
	for i = 1, 64 do
		nDelHoaPhungL = DelItem(0,tTrangBi[nType][1],tTrangBi[nType][4] + i - 1,1)	
		if nDelHoaPhungL > 0 then
			break
		end
	end
	nDelHoaPhung = nDelHoaPhung + nDelHoaPhungT + nDelHoaPhungL		
	return nDelHoaPhung
end
function Equipment_ThanhLongTuongQuan(nLevel,nChoose)

local VET_THANHLONG_CLOTH = {
	[2] = {
	    {{0, 100, 30570, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30611, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[3] = {
		{{0, 100, 30571, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30612, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[4] = {
		{{0, 100, 30572, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30613, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[6] = {
		{{0, 100, 30573, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30614, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[8] = {
		{{0, 100, 30574, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30615, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[9] = {
		{{0, 100, 30575, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30616, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[11] = {
		{{0, 100, 30576, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30617, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[12] = {
		{{0, 100, 30577, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30618, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[14] = {
		{{0, 100, 30578, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30619, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[15] = {
		{{0, 100, 30579, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30620, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[17] = {
		{{0, 100, 30580, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30621, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[18] = {
		{{0, 100, 30581, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30622, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[20] = {
		{{0, 100, 30582, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30623, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[21] = {
		{{0, 100, 30583, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30624, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[23] = {
		{{0, 100, 30584, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30625, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[25] = {
		{{0, 100, 30585, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30626, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[26] = {
		{{0, 100, 30586, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30627, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[27] = {
		{{0, 100, 30587, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30628, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[29] = {
		{{0, 100, 30588, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30629, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[30] = {
		{{0, 100, 30589, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30630, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[31] = {
		{{0, 100, 32157, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32159, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[32] = {
		{{0, 100, 32165, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32167, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
}

local VET_THANHLONG_CAP = {
	[2] = {
	    {{0, 103, 30570, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30611, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[3] = {
		{{0, 103, 30571, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30612, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[4] = {
		{{0, 103, 30572, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30613, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[6] = {
		{{0, 103, 30573, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30614, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[8] = {
		{{0, 103, 30574, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30615, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[9] = {
		{{0, 103, 30575, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30616, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[11] = {
		{{0, 103, 30576, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30617, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[12] = {
		{{0, 103, 30577, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30618, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[14] = {
		{{0, 103, 30578, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30619, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[15] = {
		{{0, 103, 30579, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30620, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[17] = {
		{{0, 103, 30580, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30621, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[18] = {
		{{0, 103, 30581, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30622, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[20] = {
		{{0, 103, 30582, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30623, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[21] = {
		{{0, 103, 30583, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30624, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[23] = {
		{{0, 103, 30584, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30625, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[25] = {
		{{0, 103, 30585, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30626, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[26] = {
		{{0, 103, 30586, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30627, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[27] = {
		{{0, 103, 30587, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30628, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[29] = {
		{{0, 103, 30588, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30629, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[30] = {
		{{0, 103, 30589, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30630, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[31] = {
		{{0, 103, 32157, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32159, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[32] = {
		{{0, 103, 32165, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32167, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
}  

local VET_THANHLONG_SHOE = {
	[2] = {
	    {{0, 101, 30570, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30611, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[3] = {
		{{0, 101, 30571, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30612, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[4] = {
		{{0, 101, 30572, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30613, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[6] = {
		{{0, 101, 30573, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30614, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[8] = {
		{{0, 101, 30574, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30615, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[9] = {
		{{0, 101, 30575, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30616, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[11] = {
		{{0, 101, 30576, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30617, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[12] = {
		{{0, 101, 30577, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30618, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[14] = {
		{{0, 101, 30578, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30619, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[15] = {
		{{0, 101, 30579, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30620, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[17] = {
		{{0, 101, 30580, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30621, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[18] = {
		{{0, 101, 30581, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30622, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[20] = {
		{{0, 101, 30582, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30623, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[21] = {
		{{0, 101, 30583, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30624, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[23] = {
		{{0, 101, 30584, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30625, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[25] = {
		{{0, 101, 30585, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30626, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[26] = {
		{{0, 101, 30586, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30627, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[27] = {
		{{0, 101, 30587, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30628, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[29] = {
		{{0, 101, 30588, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30629, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[30] = {
		{{0, 101, 30589, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30630, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[31] = {
		{{0, 101, 32157, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32159, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
	[32] = {
		{{0, 101, 32165, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32167, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T­íng Qu©n"},
	},
}

local VET_THANHLONG_PHU = {
	[2] = {
	    {{0, 102, 31172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31314, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[3] = {
		{{0, 102, 31173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31315, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[4] = {
		{{0, 102, 31174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31316, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[6] = {
		{{0, 102, 31175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31317, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[8] = {
		{{0, 102, 31176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31318, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[9] = {
		{{0, 102, 31177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31319, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[11] = {
		{{0, 102, 31178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31320, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[12] = {
		{{0, 102, 31179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31321, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[14] = {
		{{0, 102, 31180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31322, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[15] = {
		{{0, 102, 31181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31323, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[17] = {
		{{0, 102, 31182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31324, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[18] = {
		{{0, 102, 31183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31325, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[20] = {
		{{0, 102, 31184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31326, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[21] = {
		{{0, 102, 31185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31327, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[23] = {
		{{0, 102, 31186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31328, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[25] = {
		{{0, 102, 31187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31329, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[26] = {
		{{0, 102, 31188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31330, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[27] = {
		{{0, 102, 31189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31331, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[29] = {
		{{0, 102, 31190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31332, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[30] = {
		{{0, 102, 31191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31333, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[31] = {
		{{0, 102, 31495, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31509, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[32] = {
		{{0, 102, 31523, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31537, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
}

local VET_THANHLONG_KY = {
	[2] = {
	    {{0, 102, 31152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31294, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[3] = {
		{{0, 102, 31153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31295, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[4] = {
		{{0, 102, 31154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31296, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[6] = {
		{{0, 102, 31155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31297, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[8] = {
		{{0, 102, 31156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31298, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[9] = {
		{{0, 102, 31157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31299, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[11] = {
		{{0, 102, 31158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31300, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[12] = {
		{{0, 102, 31159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31301, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[14] = {
		{{0, 102, 31160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31302, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[15] = {
		{{0, 102, 31161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31303, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[17] = {
		{{0, 102, 31162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31304, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[18] = {
		{{0, 102, 31163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31305, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[20] = {
		{{0, 102, 31164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31306, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[21] = {
		{{0, 102, 31165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31307, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[23] = {
		{{0, 102, 31166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31308, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[25] = {
		{{0, 102, 31167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31309, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[26] = {
		{{0, 102, 31168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31310, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[27] = {
		{{0, 102, 31169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31311, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[29] = {
		{{0, 102, 31170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31312, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[30] = {
		{{0, 102, 31171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31313, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[31] = {
		{{0, 102, 31494, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31508, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[32] = {
		{{0, 102, 31522, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31536, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
}

local VET_THANHLONG_BAI = {
	[2] = {
	    {{0, 102, 31132, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31274, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[3] = {
		{{0, 102, 31133, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31275, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[4] = {
		{{0, 102, 31134, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31276, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[6] = {
		{{0, 102, 31135, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31277, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[8] = {
		{{0, 102, 31136, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31278, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[9] = {
		{{0, 102, 31137, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31279, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[11] = {
		{{0, 102, 31138, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31280, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[12] = {
		{{0, 102, 31139, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31281, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[14] = {
		{{0, 102, 31140, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31282, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[15] = {
		{{0, 102, 31141, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31283, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[17] = {
		{{0, 102, 31142, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31284, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[18] = {
		{{0, 102, 31143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31285, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[20] = {
		{{0, 102, 31144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31286, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[21] = {
		{{0, 102, 31145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31287, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[23] = {
		{{0, 102, 31146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31288, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[25] = {
		{{0, 102, 31147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31289, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[26] = {
		{{0, 102, 31148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31290, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[27] = {
		{{0, 102, 31149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31291, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[29] = {
		{{0, 102, 31150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31292, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[30] = {
		{{0, 102, 31151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31293, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[31] = {
		{{0, 102, 31493, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31507, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
	[32] = {
		{{0, 102, 31521, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31535, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T­íng Qu©n"},
	},
}

	local nRoute = GetPlayerRoute();
	local nBody = GetBody();

	local nQuanHam = GetTask(704)

	if nQuanHam < 0 then
		if nChoose == 1 then
			gf_AddItemEx2(VET_THANHLONG_CAP[nRoute][1][2], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NANG CAP THANH LONG", "NhËn trang bÞ Thanh Long", 0, 1);
		elseif nChoose == 2 then
			gf_AddItemEx2(VET_THANHLONG_CLOTH[nRoute][1][2], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NANG CAP THANH LONG", "NhËn trang bÞ Thanh Long", 0, 1);
		elseif nChoose == 3 then
			gf_AddItemEx2(VET_THANHLONG_SHOE[nRoute][1][2], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NANG CAP THANH LONG", "NhËn trang bÞ Thanh Long", 0, 1);
--		elseif nChoose == 4 then
--			gf_AddItemEx2(VET_THANHLONG_WEAPON[nRoute][1][2], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NANG CAP THANH LONG", "NhËn trang bÞ Thanh Long", 0, 1);
		elseif nChoose == 5 then
			gf_AddItemEx2(VET_THANHLONG_PHU[nRoute][1][2], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NANG CAP THANH LONG", "NhËn trang bÞ Thanh Long", 0, 1);
		elseif nChoose == 6 then
			gf_AddItemEx2(VET_THANHLONG_KY[nRoute][1][2], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NANG CAP THANH LONG", "NhËn trang bÞ Thanh Long", 0, 1);
		elseif nChoose == 7 then	
			gf_AddItemEx2(VET_THANHLONG_BAI[nRoute][1][2], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NANG CAP THANH LONG", "NhËn trang bÞ Thanh Long", 0, 1);
		else
			Talk(1, "", "Kh«ng cã trong danh s¸ch ®æi")
		end
	else
		if nChoose == 1 then
			gf_AddItemEx2(VET_THANHLONG_CAP[nRoute][1][1], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NANG CAP THANH LONG", "NhËn trang bÞ Thanh Long", 0, 1);
		elseif nChoose == 2 then
			gf_AddItemEx2(VET_THANHLONG_CLOTH[nRoute][1][1], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NANG CAP THANH LONG", "NhËn trang bÞ Thanh Long", 0, 1);
		elseif nChoose == 3 then
			gf_AddItemEx2(VET_THANHLONG_SHOE[nRoute][1][1], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NANG CAP THANH LONG", "NhËn trang bÞ Thanh Long", 0, 1);
--		elseif nChoose == 4 then
--			gf_AddItemEx2(VET_THANHLONG_WEAPON[nRoute][1][1], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NANG CAP THANH LONG", "NhËn trang bÞ Thanh Long", 0, 1);
		elseif nChoose == 5 then
			gf_AddItemEx2(VET_THANHLONG_PHU[nRoute][1][1], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NANG CAP THANH LONG", "NhËn trang bÞ Thanh Long", 0, 1);
		elseif nChoose == 6 then
			gf_AddItemEx2(VET_THANHLONG_KY[nRoute][1][1], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NANG CAP THANH LONG", "NhËn trang bÞ Thanh Long", 0, 1);
		elseif nChoose == 7 then	
			gf_AddItemEx2(VET_THANHLONG_BAI[nRoute][1][1], "Bé Trang bÞ Thanh Long T­íng Qu©n", "NANG CAP THANH LONG", "NhËn trang bÞ Thanh Long", 0, 1);
		else
			Talk(1, "", "Kh«ng cã trong danh s¸ch ®æi")
		end
	end
end
