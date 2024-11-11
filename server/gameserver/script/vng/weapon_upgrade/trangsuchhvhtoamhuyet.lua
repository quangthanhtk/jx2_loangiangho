Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>Gi�o S�: <color>"


tbTS_HHVH_nP = {31128, 31129}


function OnPutinCheck(param, idx, genre, detail, particular)
	local nCheck_nP = 0
	for i = 1 , getn(tbTS_HHVH_nP) do
		if tbTS_HHVH_nP[i] == particular then
			nCheck_nP = 1
			break
		end	
	end
	if genre ~= 0 then
		Talk(1,"",szNpcName .. "Ta ch� nh�n n�ng c�p trang s�c H�o Hi�p V� H� Gi�i ho�c H�o Hi�p V� H� B�i.")
		return 0
	end
	if detail ~= 102 then
		Talk(1,"",szNpcName .. "Ta ch� nh�n n�ng c�p trang s�c H�o Hi�p V� H� Gi�i ho�c H�o Hi�p V� H� B�i.")
		return 0
	end
	if nCheck_nP == 0 then
		Talk(1,"",szNpcName .. "Ta ch� nh�n n�ng c�p trang s�c H�o Hi�p V� H� Gi�i ho�c H�o Hi�p V� H� B�i.")
		return 0
	end
	
	return 1
end


function OnPutinComplete(param)
	local tCondition = { 
				[2] = {{0, 102, 31272, 1},"t� gi�i �m huy�t"},
				[3] = {{0, 102, 31273, 1},"h�u gi�i �m huy�t"},
				[4] = {{0, 102, 31415, 1},"tr�y �m huy�t"},
				[5] = {{0, 102, 31414, 1},"b�i �m huy�t"},
				
			}
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	local tbUpgradeList = GetPutinItem();
	local nG, nD, nP = tbUpgradeList[1][2], tbUpgradeList[1][3], tbUpgradeList[1][4]
	
	-------------------- Check material ----------------------------
	local tbMaterial = {
		[1] = {item={{gdp={2,1,30370,8}}, {gdp={2,95,204,8}}}},	--, task={{707, 30000, "T�ch l�y chi�n tr��ng"}}
--		[2] = {item={{gdp={2,1,30370,15}}, {gdp={2,95,204,15}}}},	
	}
--	local nIndex = tbUyHo_DoiPhe[nG][nD][nP][1]
	--=====================
	local nTMKL = 8
	local nTCL = 8

	local nCount1 = GetItemCount(2,1,30370)
	local nCount2 = GetItemCount(2,95,204)
	
	if nCount1 < nTMKL then
		Talk(1, "", szNpcName .. "B�n kh�ng c� �� "..nTMKL.." Thi�n M�n Kim L�nh �� n�ng c�p trang s�c �m Huy�t.")
		return 0
	end						
	if nCount2 < nTCL then
		Talk(1, "", szNpcName .. "B�n kh�ng c� �� "..nTCL.."Thi�n Cang L�nh �� n�ng c�p trang s�c �m Huy�t.")
		return 0
	end			
	--=======================
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[1])
	if nCheck == 0 then
		return 0
	end
	
	local nLevel = 0
	local nTypeChoose = VNG_GetTaskPos(TSK_Type_HHVHtoAMHUYET,6,6)
	if nTypeChoose ~= 2 and nTypeChoose ~= 3 and nTypeChoose ~= 4 and nTypeChoose ~= 5 then
		Talk(1,"", "Haizzzz, ta m�t r�i.")
		return 0
	end
	if DelItem(2,1,30370,nTMKL) == 1 and DelItem(2,95,204,nTCL) == 1 then
		local szItemName = GetItemName(tCondition[nTypeChoose][1][1],tCondition[nTypeChoose][1][2],tCondition[nTypeChoose][1][3])
		LIB_Award.szLogTitle = "TIEN CAP AM HUYET BK"
		LIB_Award.szLogAction = "th�nh c�ng"
--		local tbNewItem = {item={{gdp={nG, nD, nP, 1,1, -1, -1, -1, -1, -1, -1, -1, nLevel}}}}
--		LIB_Award:PayMaterial(tbMaterial[nIndex])
		DelItemByIndex(tbUpgradeList[1][1],-1)
--		LIB_Award:Award(tbNewItem)
		gf_AddItemEx2(tCondition[nTypeChoose][1], "trang s�c �m huy�t 2020", "TIEN CAP AM HUYET", "trang s�c �m huy�t");

		Talk(1,"",szNpcName.."N�ng c�p th�nh c�ng, h�y nh�n l�y <color=yellow>" .. szItemName .. "<color> c�a ng��i.")
		return 1
	end
end
