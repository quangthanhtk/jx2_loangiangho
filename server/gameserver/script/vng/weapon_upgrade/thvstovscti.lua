Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>H�c tr� th� r�n L�u: <color>"

tbTHVStoVSCT = { --Change thi�n h� v� song to v� song chi�n th�n   
	[0] = {
		[100] = {
			[30207] = {1,30651},	-- {Material, nP}
			[30208] = {1,30652},
			[30209] = {1,30653},
			[30210] = {1,30654},
		},
		[101] = {
			[30207] = {1,30651},	-- {Material, nP}
			[30208] = {1,30652},
			[30209] = {1,30653},
			[30210] = {1,30654},
		},
		[103] = {
			[30207] = {1,30651},	-- {Material, nP}
			[30208] = {1,30652},
			[30209] = {1,30653},
			[30210] = {1,30654},
		},		
	},
}

function OnPutinCheck(param, idx, genre, detail, particular)
	if tbTHVStoVSCT[genre][detail][particular] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� Thi�n H� V� Song.")
		return 0
	end
	
--	if detail ~= 102 then
		if GetEquipAttr(idx,2) < 10 then
			Talk(1,"",szNpcName .. "Trang b� ph�i ���c c��ng h�a 10 tr� l�n.")
			return 0
		end
--	end
	return 1
end


function OnPutinComplete(param)
	if gf_JudgeRoomWeight(5,500) == 0 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	local tbUpgradeList = GetPutinItem();
	local nG, nD, nP = tbUpgradeList[1][2], tbUpgradeList[1][3], tbUpgradeList[1][4]
	if tbTHVStoVSCT[nG][nD][nP] == nil then
		return 0
	end
	
	-------------------- Check material ----------------------------
	local tbMaterial = {
		[1] = {item={{gdp={2,1,30370,100}},{gdp={2,95,204,100}},{gdp={2,1,31122,4}}, {gdp={2,1,1006,10}}}},
	}
	local nIndex = tbTHVStoVSCT[nG][nD][nP][1]
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[nIndex])
	if nCheck == 0 then
		return 0
	end
	
	local szItemName = GetItemName(nG,nD,tbTHVStoVSCT[nG][nD][nP][2])
	LIB_Award.szLogTitle = "NANG CAP THIEN HA VO SONG - VO SONG CHIEN THAN"
	LIB_Award.szLogAction = "th�nh c�ng"
	local tbNewItem = {item={{gdp={nG, nD, tbTHVStoVSCT[nG][nD][nP][2], 1, 1, -1, -1, -1, -1, -1, -1, -1}}}}
	LIB_Award:PayMaterial(tbMaterial[nIndex])
	DelItemByIndex(tbUpgradeList[1][1],-1)
	LIB_Award:Award(tbNewItem)
	Talk(1,"",szNpcName.."N�ng c�p th�nh c�ng, h�y nh�n l�y <color=yellow>" .. szItemName .. "<color> c�a ng��i.")
	return 1
end
