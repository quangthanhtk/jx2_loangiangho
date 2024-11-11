Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>Gi�o S�: <color>"

tbHHVH_nD = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14}
tbHHVH_nP = {30744,30745,30746,30747,30748,30749,30750,30751,30752,30753,30754,30755,30756,30757,30758,30759,30760,30761,30762,30763,32163,32191}


function OnPutinCheck(param, idx, genre, detail, particular)
	local nCheck_nD = 0
	local nCheck_nP = 0
	for i = 1 , getn(tbHHVH_nD) do
		if tbHHVH_nD[i] == detail then
			nCheck_nD = 1
			break
		end	
	end
	for i = 1 , getn(tbHHVH_nP) do
		if tbHHVH_nP[i] == particular then
			nCheck_nP = 1
			break
		end	
	end
	if genre ~= 0 then
		Talk(1,"",szNpcName .. "Ta ch� nh�n n�ng c�p V� Kh� H�o Hi�p V� H�.")
		return 0
	end
	if nCheck_nD == 0 then
		Talk(1,"",szNpcName .. "Ta ch� nh�n n�ng c�p V� Kh� H�o Hi�p V� H�.")
		return 0
	end
	if nCheck_nP == 0 then
		Talk(1,"",szNpcName .. "Ta ch� nh�n n�ng c�p V� Kh� H�o Hi�p V� H�.")
		return 0
	end
	
	return 1
end


function OnPutinComplete(param)
	local tVuKhi = {
				[2] = {0,3,30884, 1},
				[3] = {0,8,30885, 1},
				[4] = {0,0,30886, 1},
				[6] = {0,1,30887, 1},
				[8] = {0,2,30888, 1},
				[9] = {0,10,30889, 1},
				[11] = {0,0,30890, 1},
				[12] = {0,5,30891, 1},
				[14] = {0,2,30892, 1},
				[15] = {0,9,30893, 1},
				[17] = {0,6,30894, 1},
				[18] = {0,4,30895, 1},
				[20] = {0,7,30896, 1},
				[21] = {0,11,30897, 1},
				[23] = {0,2,30898, 1},
				[25] = {0,3,30899, 1},
				[26] = {0,9,30900, 1},
				[27] = {0,11,30901, 1},
				[29] = {0,13,30902, 1},
				[30] = {0,12,30903, 1},
				[31] = {0,14,32164, 1},
				[32] = {0,2,32192, 1},
			}
	local nRoute = GetPlayerRoute()	
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	local tbUpgradeList = GetPutinItem();
	local nG, nD, nP = tbUpgradeList[1][2], tbUpgradeList[1][3], tbUpgradeList[1][4]
--	if tbUyHo_DoiPhe[nG][nD][nP] == nil then
--		return 0
--	end
	if nP <= 32284 then
		nP = nP + 132
	else
		nP = nP - 132
	end
	
	-------------------- Check material ----------------------------
	local tbMaterial = {
		[1] = {item={{gdp={2,1,30370,10}}, {gdp={2,95,204,10}}}},	--, task={{707, 30000, "T�ch l�y chi�n tr��ng"}}
--		[2] = {item={{gdp={2,1,30370,15}}, {gdp={2,95,204,15}}}},	
	}
--	local nIndex = tbUyHo_DoiPhe[nG][nD][nP][1]
	--=====================
	local nTMKL = 10
	local nTCL = 10

	local nCount1 = GetItemCount(2,1,30370)
	local nCount2 = GetItemCount(2,95,204)
	
	if nCount1 < nTMKL then
		Talk(1, "", szNpcName .. "B�n kh�ng c� �� "..nTMKL.." Thi�n M�n Kim L�nh �� n�ng c�p trang b� �m Huy�t.")
		return 0
	end						
	if nCount2 < nTCL then
		Talk(1, "", szNpcName .. "B�n kh�ng c� �� "..nTCL.."Thi�n Cang L�nh �� n�ng c�p trang b� �m Huy�t.")
		return 0
	end			
	--=======================
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[1])
	if nCheck == 0 then
		return 0
	end
	
	local nLevel = 0

	if DelItem(2,1,30370,nTMKL) == 1 and DelItem(2,95,204,nTCL) == 1 then
		local szItemName = GetItemName(tVuKhi[nRoute][1],tVuKhi[nRoute][2],tVuKhi[nRoute][3])
		LIB_Award.szLogTitle = "TIEN CAP AM HUYET BK"
		LIB_Award.szLogAction = "th�nh c�ng"
--		local tbNewItem = {item={{gdp={nG, nD, nP, 1,1, -1, -1, -1, -1, -1, -1, -1, nLevel}}}}
--		LIB_Award:PayMaterial(tbMaterial[nIndex])
		DelItemByIndex(tbUpgradeList[1][1],-1)
--		LIB_Award:Award(tbNewItem)
		gf_AddItemEx2(tVuKhi[nRoute], "v� kh� �m huy�t 2020", "TIEN CAP AM HUYET", "v� kh� �m huy�t");

		Talk(1,"",szNpcName.."N�ng c�p th�nh c�ng, h�y nh�n l�y <color=yellow>" .. szItemName .. "<color> c�a ng��i.")
		return 1
	end
end
