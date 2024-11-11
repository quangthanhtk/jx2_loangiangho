Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>H�c tr� th� r�n L�u: <color>"
tbUyHo_DoiPhe = { --Uy H� T��ng
	
}
tbUyHo_nD = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14}
tbUyHo_nP = {32329,32330,32331,32332,32333,32334,32335,32336,32337,32338,32339,32340,32341,32342,32343,32344,32345,32346,32347,32348,32349,32350,
			 32461,32462,32463,32464,32465,32466,32467,32468,32469,32470,32471,32472,32473,32474,32475,32476,32477,32478,32479,32480,32471,32472}


function OnPutinCheck(param, idx, genre, detail, particular)
	local nCheck_nD = 0
	local nCheck_nP = 0
	for i = 1 , getn(tbUyHo_nD) do
		if tbUyHo_nD[i] == detail then
			nCheck_nD = 1
			break
		end	
	end
	for i = 1 , getn(tbUyHo_nP) do
		if tbUyHo_nP[i] == particular then
			nCheck_nP = 1
			break
		end	
	end
	if genre ~= 0 then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� V� Kh� Uy H� Nguy�n So�i.")
		return 0
	end
	if nCheck_nD == 0 then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� V� Kh� Uy H� Nguy�n So�i.")
		return 0
	end
	if nCheck_nP == 0 then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� V� Kh� Uy H� Nguy�n So�i.")
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
	local nG, nD, nP = tbUpgradeList[1][2], tbUpgradeList[1][3], tbUpgradeList[1][4]
--	if tbUyHo_DoiPhe[nG][nD][nP] == nil then
--		return 0
--	end
	if nP <= 32350 then
		nP = nP + 132
	else
		nP = nP - 132
	end
	
	-------------------- Check material ----------------------------
	local tbMaterial = {
		[1] = {item={{gdp={2,1,30370,15}}, {gdp={2,95,204,15}}}},	--, task={{707, 30000, "T�ch l�y chi�n tr��ng"}}
--		[2] = {item={{gdp={2,1,30370,15}}, {gdp={2,95,204,15}}}},	
	}
--	local nIndex = tbUyHo_DoiPhe[nG][nD][nP][1]
	--=====================
	local nTMKL = 15
	local nTCL = 15

	local nCount1 = GetItemCount(2,1,30370)
	local nCount2 = GetItemCount(2,95,204)
	
	if nCount1 < nTMKL then
		Talk(1, "", szNpcName .. "B�n kh�ng c� �� "..nTMKL.." Thi�n M�n Kim L�nh �� chuy�n ��i trang b� Uy H�.")
		return 0
	end						
	if nCount2 < nTCL then
		Talk(1, "", szNpcName .. "B�n kh�ng c� �� "..nTCL.."Thi�n Cang L�nh �� chuy�n ��i trang b� Uy H�.")
		return 0
	end			
	--=======================
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[1])
	if nCheck == 0 then
		return 0
	end
	
	local nLevel = 0

	if DelItem(2,1,30370,nTMKL) == 1 and DelItem(2,95,204,nTCL) == 1 then
		local szItemName = GetItemName(nG,nD,nP)
		LIB_Award.szLogTitle = "CHUYEN DOI PHE TRANG BI UY HO NGUYEN SOAI"
		LIB_Award.szLogAction = "th�nh c�ng"
		local tbNewItem = {item={{gdp={nG, nD, nP, 1,1, -1, -1, -1, -1, -1, -1, -1, nLevel}}}}
	--	LIB_Award:PayMaterial(tbMaterial[nIndex])
		DelItemByIndex(tbUpgradeList[1][1],-1)
		LIB_Award:Award(tbNewItem)
		Talk(1,"",szNpcName.."N�ng c�p th�nh c�ng, h�y nh�n l�y <color=yellow>" .. szItemName .. "<color> c�a ng��i.")
		return 1
	end
end
