Include("\\script\\lib\\talktmp.lua")
Import("\\script\\lib\\globalfunctions.lua")

--2, 1, 31386
itempart_horse	= 10; --����
eCOLLECTION_T_HORSE = 3; --������ղ�����

T_HORSE_IMPROVE_CONFIG ={
	--ԭʼ��						  	--�ϳ���{g,d,p,name,����Ƭ��������},
	-- [gf_PackItemGDP(0, 105, 181)] = {0,105,30205,"�����İ�¶˪����",1000},
	-- [gf_PackItemGDP(0, 105, 117)] = {0,105,30204,"Ư�����̹�",1000},
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
		Talk(1,"","H�y mang th� c��i mu�n n�ng c�p th�nh t�c �� 140% l�n ng��i");
		return 0;
	end

	local nHG, nHD, nHP = GetItemInfoByIndex(nHorseIdx);
	local nGDP = gf_PackItemGDP(nHG, nHD, nHP);

	if not T_HORSE_IMPROVE_CONFIG or not T_HORSE_IMPROVE_CONFIG[nGDP] then
		Talk(1,"","Th� c��i �ang d�ng kh�ng th� n�ng c�p");
		return 0;
	end

	if hf_check_is_collected(eCOLLECTION_T_HORSE, nHG, nHD, nHP) <= 0 then
		Talk(1,"","Ch� th� c��i �� t�ng ���c ��a v�o L�u tr� trong t� �o bi�n thi�n m�i c� th� n�ng c�p");
		return 0;
	end

	local tTargetHorseInfo = T_HORSE_IMPROVE_CONFIG[nGDP];
	local nTG, nTD, nTP = tTargetHorseInfo[1], tTargetHorseInfo[2], tTargetHorseInfo[3];
	local bIsCollected = hf_check_is_collected(eCOLLECTION_T_HORSE, nTG, nTD, nTP);

	if bIsCollected > 0 then
		Talk(1,"","Trong L�u tr� trong t� �o bi�n thi�n �� c� th� c��i ���c n�ng c�p, kh�ng th� t�ng n�a");
		return 0;
	elseif bIsCollected < 0 then
		Talk(1,"","Th� c��i n�y b� l�i d� li�u, xin li�n h� CSKH �� x� l�");
		return 0;
	end

	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
	local szItemName = GetItemName(nItemIdx);
	local nExchangeNeedNum = tTargetHorseInfo[5] or -1;

	if nExchangeNeedNum <= 0 then
		Talk(1,"",format("S� <color=yellow>%d<color> c�n thi�t b� l�i, xin li�n h� CSKH �� x� l�", szItemName) );
		return 0;
	end

	if  GetItemCount(nGenre, nDetail, nParticular) < nExchangeNeedNum then
		Talk(1,"",format("<color=yellow>%d<color> kh�ng �� <color=red>%d<color>", szItemName, nExchangeNeedNum) );
		return 0;
	end

	Say(format("D�ng <color=yellow>%d<color> %s n�ng c�p th� c��i n�y th�nh <color=gold>%s<color>? (Th� c��i hi�n c� <color=green>kh�ng bi�n m�t<color>, th� c��i ���c n�ng c�p xong s� <color=green>t� ��a v�o L�u tr� trong t� �o bi�n thi�n <color>)",
				nExchangeNeedNum, szItemName, GetItemName(nTG, nTD, nTP) ), 2,
		format("��ng �/#improve_horse_sure(%d, %d, %d, %d, %d, %d, %d)", nTG, nTD, nTP, nGenre, nDetail, nParticular, nExchangeNeedNum), "H�y b�/nothing");

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
		Talk(1,"",format("N�ng c�p th� c��i th�nh c�ng! Ng�i �� ��a <color=gold>%s<color> v�o chu�ng, nh�n ���c <color=green>�i�m Quy�n R�<color>, c� th� <color=green>v�o chu�ng<color> xem", GetItemName(nTG,nTD,nTP) ) );
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