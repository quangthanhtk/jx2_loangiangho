Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>H�c tr� th� r�n L�u: <color>"

 tbVKHaoHiepThuong = {
		[2] = {{0,3,30724,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 2"},
		[3] = {{0,8,30725,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 4"},
		[4] = {{0,0,30726,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 3"},
		[6] = {{0,1,30727,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 6"},
		[8] = {{0,2,30728,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 8"},
		[9] = {{0,10,30729,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 9"},
		[11] = {{0,0,30730,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 11"},
		[12] = {{0,5,30731,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 12"},
		[14] = {{0,2,30732,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 14"},
		[15] = {{0,9,30733,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 15"},
		[17] = {{0,6,30734,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 17"},
		[18] = {{0,4,30735,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 18"},
		[20] = {{0,7,30736,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 20"},
		[21] = {{0,11,30737,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 21"},
		[23] = {{0,2,30738,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 23"},
		[25] = {{0,3,30739,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 25"},
		[26] = {{0,9,30740,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 26"},
		[27] = {{0,11,30741,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 27"},
		[29] = {{0,13,30742,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 29"},
		[30] = {{0,12,30743,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 30"},
		[31] = {{0,14,32162,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 31"},
		[32] = {{0,2,32190,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 32"},
	}
	
function OnPutinCheck(param, idx, genre, detail, particular)
	local nRoute = GetPlayerRoute()
	if tbVKHaoHiepThuong[nRoute][1][1] ~= genre and tbVKHaoHiepThuong[nRoute][1][2] ~= detail and tbVKHaoHiepThuong[nRoute][1][3] ~= particular then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i v� kh� theo ��ng h� ph�i c�a ��i hi�p.")
		return 0
	end
	return 1
end


function OnPutinComplete(param)
	local nRoute = GetPlayerRoute()
	if gf_JudgeRoomWeight(2,200) == 0 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	local tbUpgradeList = GetPutinItem();
	local nG, nD, nP = tbUpgradeList[1][2], tbUpgradeList[1][3], tbUpgradeList[1][4]
	if tbVKHaoHiepThuong[nRoute][1][3] ~= nP then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i v� kh� theo ��ng h� ph�i c�a ��i hi�p.")
		return 0
	end
	
	-------------------- Check material ----------------------------
	local tbMaterial = {
		[1] = {item={{gdp={2,1,30370,5}},{gdp={2,95,204,5}}}},	--,{gdp={2,1,1006,0}}
	}
	
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[1])
	if nCheck == 0 then
		return 0
	end
	
	local szItemName = "V� H� H�o Hi�p L�nh V� Kh�"
	LIB_Award.szLogTitle = "NANG CAP VK HAO HIEP VO HA"
	LIB_Award.szLogAction = "th�nh c�ng"
	local tbNewItem = {item={{gdp={2,1,30973, 1,1}}}}
	LIB_Award:PayMaterial(tbMaterial[1])
	DelItemByIndex(tbUpgradeList[1][1],-1)
	LIB_Award:Award(tbNewItem)
	Talk(1,"",szNpcName.."N�ng c�p th�nh c�ng, h�y nh�n l�y <color=yellow>" .. szItemName .. "<color> c�a ng��i.")
	return 1
end
