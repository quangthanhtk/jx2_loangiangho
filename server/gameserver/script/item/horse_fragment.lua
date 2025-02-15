Include("\\script\\lib\\talktmp.lua")
Import("\\script\\lib\\globalfunctions.lua")

--2, 1, 31386
itempart_horse	= 10; --坐骑
eCOLLECTION_T_HORSE = 3; --坐骑的收藏类型

T_HORSE_IMPROVE_CONFIG ={
	--原始马						  	--合成马{g,d,p,name,马碎片消耗数量},
	-- [gf_PackItemGDP(0, 105, 181)] = {0,105,30205,"华丽的白露霜华剑",1000},
	-- [gf_PackItemGDP(0, 105, 117)] = {0,105,30204,"漂亮的鎏光",1000},
}

function hf_init_config()
	local szConfigPath = "\\settings\\item\\collect\\horse_upgrade.txt"
	local tConfig = ff_GetTabFileTableEx(szConfigPath,2)
	tConfig = gf_TableNumberElementToNumber(tConfig)

	for i=1, getn(tConfig) do
		tinsert(
			T_HORSE_IMPROVE_CONFIG, 
			gf_PackItemGDP(tConfig[i]["G"], tConfig[i]["D"], tConfig[i]["P"]),
			{
				tConfig[i]["tG"],
				tConfig[i]["tD"],
				tConfig[i]["tP"],
				GetItemName(tConfig[i]["tG"], tConfig[i]["tD"], tConfig[i]["tP"]),
				tConfig[i]["CostPiece"],
			}
		)
	end
	T_HORSE_IMPROVE_CONFIG.n = nil
end

hf_init_config()

function OnUse(nItemIdx)
	--2,1,31386
	local nItemIdx = tonumber(nItemIdx);
	local nHorseIdx = GetPlayerEquipIndex(itempart_horse);

	if not nHorseIdx or nHorseIdx <= 0 then
		Talk(1,"","H穣 mang th� ci mu鑞 n﹏g c蕄 th祅h t鑓  140% l猲 ngi");
		return 0;
	end

	local nHG, nHD, nHP = GetItemInfoByIndex(nHorseIdx);
	local nGDP = gf_PackItemGDP(nHG, nHD, nHP);

	if not T_HORSE_IMPROVE_CONFIG or not T_HORSE_IMPROVE_CONFIG[nGDP] then
		Talk(1,"","Th� ci 產ng d飊g kh玭g th� n﹏g c蕄");
		return 0;
	end

	if hf_check_is_collected(eCOLLECTION_T_HORSE, nHG, nHD, nHP) <= 0 then
		Talk(1,"","Ch� th� ci  t鮪g 頲 a v祇 L璾 tr� trong t� 竜 bi課 thi猲 m韎 c� th� n﹏g c蕄");
		return 0;
	end

	local tTargetHorseInfo = T_HORSE_IMPROVE_CONFIG[nGDP];
	local nTG, nTD, nTP = tTargetHorseInfo[1], tTargetHorseInfo[2], tTargetHorseInfo[3];
	local bIsCollected = hf_check_is_collected(eCOLLECTION_T_HORSE, nTG, nTD, nTP);

	if bIsCollected > 0 then
		Talk(1,"","Trong L璾 tr� trong t� 竜 bi課 thi猲  c� th� ci 頲 n﹏g c蕄, kh玭g th� t╪g n鱝");
		return 0;
	elseif bIsCollected < 0 then
		Talk(1,"","Th� ci n祔 b� l鏸 d� li謚, xin li猲 h� CSKH  x� l�");
		return 0;
	end

	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
	local szItemName = GetItemName(nItemIdx);
	local nExchangeNeedNum = tTargetHorseInfo[5] or -1;

	if nExchangeNeedNum <= 0 then
		Talk(1,"",format("S� <color=yellow>%d<color> c莕 thi誸 b� l鏸, xin li猲 h� CSKH  x� l�", szItemName) );
		return 0;
	end

	if  GetItemCount(nGenre, nDetail, nParticular) < nExchangeNeedNum then
		Talk(1,"",format("<color=yellow>%d<color> kh玭g  <color=red>%d<color>", szItemName, nExchangeNeedNum) );
		return 0;
	end

	Say(format("D飊g <color=yellow>%d<color> %s n﹏g c蕄 th� ci n祔 th祅h <color=gold>%s<color>? (Th� ci hi謓 c� <color=green>kh玭g bi課 m蕋<color>, th� ci 頲 n﹏g c蕄 xong s� <color=green>t� a v祇 L璾 tr� trong t� 竜 bi課 thi猲 <color>)",
				nExchangeNeedNum, szItemName, GetItemName(nTG, nTD, nTP) ), 2,
		format("уng �/#improve_horse_sure(%d, %d, %d, %d, %d, %d, %d)", nTG, nTD, nTP, nGenre, nDetail, nParticular, nExchangeNeedNum), "H駓 b�/nothing");

end

function improve_horse_sure(nTG, nTD, nTP, nG, nD, nP, nNeedNum)
	if not nNeedNum or nNeedNum <= 0 then
		return 0;
	end

	local nCoIndex = GetCollectionIndex(eCOLLECTION_T_HORSE, nTG, nTD, nTP);
	if not nCoIndex or nCoIndex <= 0 then
		return 0;
	end

	if DelItem(nG, nD, nP, nNeedNum) ~= 1 then
		return 0;
	end

	local nRet = SetPlayerCollectionData(eCOLLECTION_T_HORSE, nCoIndex, 1);
	local szLog = format("[Role:%s (acc:%s)] [ImproveHorse]", GetName(), GetAccount() );
	if nRet > 0 then
		Talk(1,"",format("N﹏g c蕄 th� ci th祅h c玭g! Ng礽  a <color=gold>%s<color> v祇 chu錸g, nh薾 頲 <color=green>甶觤 Quy課 R�<color>, c� th� <color=green>v祇 chu錸g<color> xem", GetItemName(nTG,nTD,nTP) ) );
		AddRuntimeStat(94, 1, 0, 1);
		WriteLog(format("%s [AddHorseCollection: success]", szLog));
	elseif nRet == 0 then
		WriteLog(format("%s [AddHorseCollection: faild] [HasOwned]", szLog ));
	else
		WriteLog(format("%s [AddHorseCollection: faild] [Error]", szLog ));
	end
end

function hf_check_is_collected(nType, nG, nD, nP)
	local nCoIndex = GetCollectionIndex(nType, nG, nD, nP);
	if not nCoIndex or nCoIndex <= 0 then
		return -1;
	end

	return GetPlayerCollectionData(nType, nCoIndex) or -1;
end