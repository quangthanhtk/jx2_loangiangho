CFG_NhiemVuLamGiau = 0		-- 0/1: BËt t¾t nhiÖm vô lµm giµu
CFG_NhiemVuThuongHoi = 1	-- 0/1: BËt t¾t nhiÖm vô th­¬ng héi
CFG_NhiemVuDongHanh = 0		-- 0/1: BËt t¾t nhiÖm vô ®ång hµnh
CFG_VipCare = 0						-- 0/1: BËt t¾t ch­¬ng tr×nh VipCare
--EXT_VIPCARE = 0						-- EXT point dïng cho VipCare
--EXT_QUAYSOINGAME = 1		-- EXT point dïng cho quay sè ingame
--EXT_VBONUS = 2						-- EXT point dïng cho VBonus
--EXT_HoTroMaMoi = 6			--EXT Point dïng ®Ó hç trî user nhËn th­ëng ho¹t ®éng m· mêi (28/11/2014 kÕt thóc)
--EXT_QUAYSOTET = 2			--EXT Point dïng ®Ó quay sè tÕt (11/2/2015 kÕt thóc)
EXT_PLUS123PAY = 1
EXT_VIPCARE = 2						-- EXT point dïng cho VipCare
EXT_CDKEY = 3							-- EXT	point dïng cho CD Key
--EXT_BIGPRO_THANG7 = 6		--EXT Point dïng cho ch­¬ng tr×nh big promotion th¸ng 7 cña PG1 (22/7/2015 - 22/9/2015)
--EXT_BIGPRO_PG1 = 6		--EXT Point dïng cho ch­¬ng tr×nh big promotion ®¹i héi th¸ng 12 cña PG1 (15/12/2015 - 30/12/2015)
EXT_SURVEY2016 = 6		--EXT Point dïng cho ch­¬ng tr×nh promotion th¸ng 6/2016 (17/06/2016 - 24/06/2016)

function CheckVbonus()	-- Check tr¹ng th¸i ch­¬ng tr×nh VBonus
	local nVBONUS_STARTDATE = 14071010
	local nVBONUS_ENDDATE = 14090300
	local nDate = tonumber(date("%y%m%d%H"))
	if nDate >= nVBONUS_STARTDATE and nDate < nVBONUS_ENDDATE then
		local nVB = GetExtPoint(EXT_VBONUS)
		if GetBit(nVB,1) == 1 and GetBit(nVB,2) == 0 then
			return 1
		else
			return 0
		end
	else
		return 0
	end
end
function CheckBigPromotionThang7()	-- Check tr¹ng th¸i ch­¬ng tr×nh Big Promotion ®¹i héi th¸ng 12/2015--Check tr¹ng th¸i ch­¬ng tr×nh Big Promotion th¸ng 7/2015
	local nSTARTDATE = 15121000
	local nENDDATE = 16010500
	local nDate = tonumber(date("%y%m%d%H"))
	if nDate >= nSTARTDATE and nDate < nENDDATE then
		return 1
	end
	return 0
end