CFG_NhiemVuLamGiau = 0		-- 0/1: B�t t�t nhi�m v� l�m gi�u
CFG_NhiemVuThuongHoi = 1	-- 0/1: B�t t�t nhi�m v� th��ng h�i
CFG_NhiemVuDongHanh = 0		-- 0/1: B�t t�t nhi�m v� ��ng h�nh
CFG_VipCare = 0						-- 0/1: B�t t�t ch��ng tr�nh VipCare
--EXT_VIPCARE = 0						-- EXT point d�ng cho VipCare
--EXT_QUAYSOINGAME = 1		-- EXT point d�ng cho quay s� ingame
--EXT_VBONUS = 2						-- EXT point d�ng cho VBonus
--EXT_HoTroMaMoi = 6			--EXT Point d�ng �� h� tr� user nh�n th��ng ho�t ��ng m� m�i (28/11/2014 k�t th�c)
--EXT_QUAYSOTET = 2			--EXT Point d�ng �� quay s� t�t (11/2/2015 k�t th�c)
EXT_PLUS123PAY = 1
EXT_VIPCARE = 2						-- EXT point d�ng cho VipCare
EXT_CDKEY = 3							-- EXT	point d�ng cho CD Key
--EXT_BIGPRO_THANG7 = 6		--EXT Point d�ng cho ch��ng tr�nh big promotion th�ng 7 c�a PG1 (22/7/2015 - 22/9/2015)
--EXT_BIGPRO_PG1 = 6		--EXT Point d�ng cho ch��ng tr�nh big promotion ��i h�i th�ng 12 c�a PG1 (15/12/2015 - 30/12/2015)
EXT_SURVEY2016 = 6		--EXT Point d�ng cho ch��ng tr�nh promotion th�ng 6/2016 (17/06/2016 - 24/06/2016)

function CheckVbonus()	-- Check tr�ng th�i ch��ng tr�nh VBonus
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
function CheckBigPromotionThang7()	-- Check tr�ng th�i ch��ng tr�nh Big Promotion ��i h�i th�ng 12/2015--Check tr�ng th�i ch��ng tr�nh Big Promotion th�ng 7/2015
	local nSTARTDATE = 15121000
	local nENDDATE = 16010500
	local nDate = tonumber(date("%y%m%d%H"))
	if nDate >= nSTARTDATE and nDate < nENDDATE then
		return 1
	end
	return 0
end