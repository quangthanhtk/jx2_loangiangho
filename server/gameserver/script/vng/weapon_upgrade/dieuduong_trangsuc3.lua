Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\weapon_upgrade\\chiencuong_head.lua");

szNpcName = "<color=green>H�c tr� th� r�n L�u: <color>"
tbDieuDuong = {

		}


function OnPutinCheck(param, idx, genre, detail, particular)
	--local tbCheckList = GetPutinItem();
	if genre ~= 0 or detail ~= 102 then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang s�c Di�u D��ng c�p 2.")
		return 0
	end
	if particular < 3185 or particular > 3189 then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang s�c Di�u D��ng c�p 2.")
		return 0
	end

	return 1
end


function OnPutinComplete(param)
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	local tbUpgradeList = GetPutinItem();
	local nItemIndex, nG, nD, nP = tbUpgradeList[1][1], tbUpgradeList[1][2], tbUpgradeList[1][3], tbUpgradeList[1][4]
--	if tbDieuDuong[nG][nD][nP] == nil then
--		return 0
--	end
	-------------------- Check material ----------------------------
	local tbMaterial = {
		[1] = {item={{gdp={2,95,204,1}, name="Thi�n Cang L�nh"}, {gdp={2,97,236,50}, name="Thi�n Ki�u L�nh"},{gdp={2,1,1005,3}, name="Chi�n Th�n Ho�n"}}},
	}
	local nNguyenlieu = 1
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[nNguyenlieu])
	if nCheck == 0 then
		return 0
	end
	LIB_Award:PayMaterial(tbMaterial[nNguyenlieu])
	DelItemByIndex(nItemIndex,-1)
	gf_AddItemEx2({0,102,nP+5,1,1,-1,-1,-1,-1,-1,-1}, "N�ng c�p trang s�c Di�u D��ng", "NANG CAP DIEU DUONG  - TRANG SUC CAP 3 bk", "nh�n")
	gf_WriteLogEx("NANG CAP DIEU DUONG  - TRANG SUC CAP 3", "th�nh c�ng ", 1, "N�ng c�p trang s�c Di�u D��ng")
	Talk(1,"",szNpcName.."N�ng c�p th�nh c�ng, h�y nh�n l�y trang s�c Di�u D��ng c�p 3 c�a ng��i.")
	return 1
end
