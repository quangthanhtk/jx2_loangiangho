Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>H�c tr� th� r�n L�u: <color>"
tbLoiHoTuongQuan = {
	[0] = {
		[100] = {
			[30033] = {1,30215},	-- {Material, nP}
			[30034] = {1,30216},
			[30035] = {1,30217},
			[30036] = {1,30218},
			[30045] = {1,30227},
			[30046] = {1,30228},
			[30047] = {1,30229},
			[30048] = {1,30230},
		},
		[101] = {
			[30033] = {1,30215},
			[30034] = {1,30216},
			[30035] = {1,30217},
			[30036] = {1,30218},
			[30045] = {1,30227},
			[30046] = {1,30228},
			[30047] = {1,30229},
			[30048] = {1,30230},
		},
		[103] = {
			[30033] = {1,30215},
			[30034] = {1,30216},
			[30035] = {1,30217},
			[30036] = {1,30218},
			[30045] = {1,30227},
			[30046] = {1,30228},
			[30047] = {1,30229},
			[30048] = {1,30230},
		},
		[102] = {
			[30052] = {1,30157},
			[30053] = {1,30158},
			[30054] = {1,30159},
			[30055] = {1,30160},
			[30056] = {1,30161},
			[30057] = {1,30162},
			[30058] = {1,30163},
			[30059] = {1,30164},
			[30060] = {1,30165},
			[30061] = {1,30166},
			[30062] = {1,30167},
			[30063] = {1,30168},
			------------ Lieu
			[30088] = {1,30193},
			[30089] = {1,30194},
			[30090] = {1,30195},
			[30091] = {1,30196},
			[30092] = {1,30197},
			[30093] = {1,30198},
			[30094] = {1,30199},
			[30095] = {1,30200},
			[30096] = {1,30201},
			[30097] = {1,30202},
			[30098] = {1,30203},
			[30099] = {1,30204},
		},
	},
}

function OnPutinCheck(param, idx, genre, detail, particular)
	if tbLoiHoTuongQuan[genre] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� Th��ng �ng T��ng Qu�n.")
		return 0
	end
	if tbLoiHoTuongQuan[genre][detail] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� Th��ng �ng T��ng Qu�n.")
		return 0
	end
	if tbLoiHoTuongQuan[genre][detail][particular] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� Th��ng �ng T��ng Qu�n.")
		return 0
	end
	
	if detail ~= 102 then
		if GetEquipAttr(idx,2) < 7 then
			Talk(1,"",szNpcName .. "Trang b� ph�i ���c c��ng h�a 7 tr� l�n.")
			return 0
		end
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
	if tbLoiHoTuongQuan[nG][nD][nP] == nil then
		return 0
	end
	
	-------------------- Check material ----------------------------
	local tbMaterial = {
		[1] = {item={{gdp={2,1,1005,7}}, {gdp={2,1,504,3}}}, task={{707, 15000, "T�ch l�y chi�n tr��ng"}}}
	}
	local nIndex = tbLoiHoTuongQuan[nG][nD][nP][1]
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[nIndex])
	if nCheck == 0 then
		return 0
	end
	
	local nLevel = 0
	if GetEquipAttr(tbUpgradeList[1][1],2) >= 7  and GetEquipAttr(tbUpgradeList[1][1],2) < 10 then
		nLevel = 7;	
	end
	
	if GetEquipAttr(tbUpgradeList[1][1],2) >= 10 then
		nLevel = 10;	
	end

	local szItemName = GetItemName(nG,nD,tbLoiHoTuongQuan[nG][nD][nP][2])
	LIB_Award.szLogTitle = "NANG CAP THUONG UNG TUONG QUAN - LOI HO TUONG QUAN"
	LIB_Award.szLogAction = "th�nh c�ng"
	local tbNewItem = {item={{gdp={nG, nD, tbLoiHoTuongQuan[nG][nD][nP][2], 1,1, -1, -1, -1, -1, -1, -1, -1, nLevel}}}}
	LIB_Award:PayMaterial(tbMaterial[nIndex])
	DelItemByIndex(tbUpgradeList[1][1],-1)
	LIB_Award:Award(tbNewItem)
	Talk(1,"",szNpcName.."N�ng c�p th�nh c�ng, h�y nh�n l�y <color=yellow>" .. szItemName .. "<color> c�a ng��i.")
	return 1
end
