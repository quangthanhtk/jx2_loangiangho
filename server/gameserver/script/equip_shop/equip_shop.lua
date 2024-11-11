--�ű����ƣ�
--�ű����ܣ�
--���ܲ߻����ܶ�
--���ܿ���������
--����ʱ�䣺2011-05-27
--�����޸ļ�¼

Import("\\script\\lib\\define.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\huofengtask\\equip_shop_call_back.lua")
Include("\\script\\equip_shop\\update_qinglong_equip.lua")
Include("\\script\\equip_shop\\update_yinxue_equip.lua")
Include("\\script\\equip_shop\\update_huwei_equip.lua")
Include("\\script\\ksgvn\\callback\\equip_shop_callback.lua")

----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\callbacks\\callback_equip_shop.lua");
----------------------------------------------------------------------------------------------------

Import("\\script\\ksgvn\\define\\define_shop.lua"); -- import �� s� d�ng define shop id

-------------------------Check EquipShop Date-------------------------
-- shop will be checked if shopid can be found in tEquipShopDate
-- items can only be exchanged when date is in [beginDate, endDate]
-- if you dont want date limit with a shop, just ignore this table
tEquipShopDate = {
	[3022] = {beginDate = 20160423, endDate = 20170430},  -- Exampel 180423 means 2018/04/23
	[3024] = {beginDate = 20210125, endDate = 20210215},	-- Shop Thi�n T�m Th�p
	[3069] = {beginDate = 20160423, endDate = 20170430},
	[3036] = {beginDate = 20190101, endDate = 20190101},	-- ��ng shop l�nh b�i bang h�i
	[EQUIP_SHOP_EXCHANGE_SATTINH] = {beginDate = 20190101, endDate = 20290101}, --LongDaiKa: ��ng n�ng c�p S�t Tinh
	[EQUIP_SHOP_EXCHANGE_PHAHON] = {beginDate = 20190101, endDate = 20290101}, --LongDaiKa: ��ng n�ng c�p Ph� H�n
	[EQUIP_SHOP_EXCHANGE_TONG_UHT] = {beginDate = 20190101, endDate = 20290101}, --LongDaiKa: ��ng n�ng c�p Uy H� T��ng
	[EQUIP_SHOP_EXCHANGE_LIEU_UHT] = {beginDate = 20190101, endDate = 20290101},	--LongDaiKa: ��ng n�ng c�p Uy H� T��ng
	[EQUIP_SHOP_EXCHANGE_TONG_CTT] = {beginDate = 20190101, endDate = 20290101}, --LongDaiKa: ��ng n�ng c�p Chu T��c T��ng
	[EQUIP_SHOP_EXCHANGE_LIEU_CTT] = {beginDate = 20190101, endDate = 20290101},	--LongDaiKa: ��ng n�ng c�p Chu T��c T��ng
	--[EQUIP_SHOP_EXCHANGE_KIMXA7] = {beginDate = 20190101, endDate = 20190101},	--LongDaiKa: ��ng n�ng c�p Kim X� 7
	[EQUIP_SHOP_EXCHANGE_KIMXA8] = {beginDate = 20190101, endDate = 20290101},	--LongDaiKa: ��ng n�ng c�p Kim X� 8
	[EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV4] = {beginDate = 20190101, endDate = 20290101}, --LongDaiKa: ��ng n�ng c�p V�n S�c 4
	[EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV5] = {beginDate = 20190101, endDate = 20290101}, --LongDaiKa: ��ng n�ng c�p V�n S�c 5
	[EQUIP_SHOP_EXCHANGE_DAQUY] = {beginDate = 20190101, endDate = 20190101}, --LongDaiKa: ��ng gh�p �� qu�
};
-------------------------Check Goods Date-------------------------
-- shop will be checked if GoodID can be found in m_tbGoodsDate
-- items can only be exchanged when date is in [beginDate, endDate]
-- if you dont want date limit with a shop, just ignore this table
m_tbGoodsDate = {
	--[53468] = {beginDate = 20190101, endDate = 20190101}, --LongDaiKa: ��ng Th��ng H�i Ch�u C�p 7
	[53469] = {beginDate = 20190101, endDate = 20290101}, --LongDaiKa: ��ng Th��ng H�i Ch�u C�p 8
	[53454] = {beginDate = 20190101, endDate = 20290101}, --LongDaiKa: T�y T�m Th�ch C�p 7
	[53455] = {beginDate = 20190101, endDate = 20290101}, --LongDaiKa: T�y T�m Th�ch C�p 8
	[53460] = {beginDate = 20190101, endDate = 20290101}, --LongDaiKa: Luy�n L� Thi�t C�p 7
	[53461] = {beginDate = 20190101, endDate = 20290101}, --LongDaiKa: Luy�n L� Thi�t C�p 8
	[53475] = {beginDate = 20190101, endDate = 20290101}, --LongDaiKa: T�i �� Qu� C�p 7
	[53476] = {beginDate = 20190101, endDate = 20290101}, --LongDaiKa: T�i �� Qu� C�p 8
};
----------------------------------------------------------------------
g_tItemDetail2EquipPos = {
	[100]	= 1,
	[101]	= 3,
	[102]	= 4,
	[103]	= 0,
	[105]	= 10,
	[107]	= 11,
	[108]	= 6,
	[109]	= 7,
	[110]	= 8,
	[112]	= 9,
	[113]	= 25,
	[114]	= 26,
	[115]	= 27,
	[116]	= 24,
	[117]	= 28,
--	[118]	= 23,
--	[119]	= 24,
--	[120]	= 25,
--	[121]	= 26,
	--������
	[152]	= 17,--����
	[153]	= 18,--����
	[154]	= 19,--Ь
	[155]	= 20,--����
};

function get_gdp_id(nG, nD, nP)
	if not nG or 0 > nG or nG > 255		then return	0;	end
	if not nD or 0 > nD or nD > 255		then return	0;	end
	if not nP or 0 > nP or nP > 65535	then return	0;	end

	-- 65536	2^16
	-- 16777216	2^24
	return nG * 16777216 + nD * 65536 + nP;
end

g_tBaguaItem = {
	get_gdp_id(0, 103, 85),
	get_gdp_id(0, 103, 86),
	get_gdp_id(0, 103, 87),
	get_gdp_id(0, 103, 88),
	get_gdp_id(0, 100, 85),
	get_gdp_id(0, 100, 86),
	get_gdp_id(0, 100, 87),
	get_gdp_id(0, 100, 88),
	get_gdp_id(0, 101, 85),
	get_gdp_id(0, 101, 86),
	get_gdp_id(0, 101, 87),
	get_gdp_id(0, 101, 88),
	get_gdp_id(0, 0,   17),
	get_gdp_id(0, 2,   39),
	get_gdp_id(0, 5,   43),
	get_gdp_id(0, 1,   56),
	get_gdp_id(0, 3,   67),
	get_gdp_id(0, 10,  78),
	get_gdp_id(0, 9,   89),
	get_gdp_id(0, 8,   100),
	get_gdp_id(0, 6,   111),
	get_gdp_id(0, 4,   122),
	get_gdp_id(0, 11,  15),
	get_gdp_id(0, 7,   15),
	get_gdp_id(0, 12,  15),
	get_gdp_id(0, 13,  15),
	get_gdp_id(0, 3,   125),
	get_gdp_id(0, 0,   125),
	get_gdp_id(0, 8,   125),
	get_gdp_id(0, 1,   125),
	get_gdp_id(0, 2,   125),
	get_gdp_id(0, 10,  125),
	get_gdp_id(0, 0,   126),
	get_gdp_id(0, 5,   125),
	get_gdp_id(0, 2,   126),
	get_gdp_id(0, 9,   125),
	get_gdp_id(0, 6,   125),
	get_gdp_id(0, 4,   125),
	get_gdp_id(0, 7,   125),
	get_gdp_id(0, 11,  125),
	get_gdp_id(0, 2,   127),
	get_gdp_id(0, 3,   126),
	get_gdp_id(0, 9,   126),
	get_gdp_id(0, 11,  126),
	get_gdp_id(0, 13,  125),
	get_gdp_id(0, 12,  125),
}

function get_equip_pos(nD)
	if not nD				then return		end
	if 0 <= nD and 15 >= nD	then return 2;	end
	return g_tItemDetail2EquipPos[nD];
end

--���õ�ʱ�䵥λת��Ϊ��
function config_time_to_sec(nTime)
	local nRet = nTime or 0;
	nRet = nRet * 60 * 60;--���õ�ʱ����СʱΪ��λ��ת������
	return nRet;
end

function _DoOneExchange(tGoodInfo, tExchangeInfo, uShopId, uGoodID, uExchangeID)
	-- ���һ�����
	if 0 < tGoodInfo.AwardTimes[1] then
		local nTaskValue	= GetTask(tGoodInfo.AwardTimes[1]);
		if nTaskValue >= tGoodInfo.AwardTimes[2] then
			Talk(1, "", format("S� l�n quy ��i c�a c�c h� �� ��t gi�i h�n %d l�n, kh�ng th� ��i [%s].", tGoodInfo.AwardTimes[2], tGoodInfo.Name));
			return 0
		end
	end

	-- ����������
	local bCheckLimitVaild	= 1;
	for _, tLimitTask in tExchangeInfo.LimitTask do
		if 1 ~= bCheckLimitVaild then
			break;
		end

		if 0 < tLimitTask[1] then
			local nTaskValue	= GetTask(tLimitTask[1]);
			local bNeedProcess	= 1;

			------------------
			-- ���⴦��
			if 704 == tLimitTask[1] then
				if 0 < tLimitTask[2] and tLimitTask[2] > nTaskValue then
					bCheckLimitVaild = 0;
					break;
				end
				if 0 > tLimitTask[2] and tLimitTask[2] < nTaskValue then
					bCheckLimitVaild = 0;
					break;
				end
				bNeedProcess	= 0;
			end
			-- ���⴦��
			------------------

			if 1 == bNeedProcess then
				if 0 < tLimitTask[2] and tLimitTask[2] > nTaskValue then -- ��Сֵ
					bCheckLimitVaild = 0;
					break;
				end
				if 0 < tLimitTask[3] and tLimitTask[3] < nTaskValue then -- ���ֵ
					bCheckLimitVaild = 0;
					break;
				end
			end
		end
	end

	for _, tCostTask in tExchangeInfo.CostTask do
		if 1 ~= bCheckLimitVaild then
			break;
		end
		if 0 < tCostTask[1] then
			local nTaskValue	= GetTask(tCostTask[1]);
			if tCostTask[2] > nTaskValue then
				bCheckLimitVaild = 0;
				break;
			end
		end
	end

	if 1 ~= bCheckLimitVaild then
		Talk(1, "", format("C�c h� kh�ng th�a �%s�, kh�ng th� ��i [%s].", tExchangeInfo.LimitDesc, tGoodInfo.Name));
		return 0
	end

	-- ���Ǯ
	for _, tCostMoney in tExchangeInfo.CostMoney do
    	if tCostMoney[1] ~= 0 then
    		local nCoin = GetVMoney(tCostMoney[1]);
    		if tCostMoney[2] > nCoin then
    			Talk(1, "", format("Ng��i kh�ng mang �� ti�n, kh�ng th� ��i [%s].", tGoodInfo.Name));
				return 0
    		end
    	end
    end

	-- �����Ʒ����
	local tEquipInfo		= {};
	local nEquipPos			= 0;
	local nEquipIDX			= 0;
	local nEquipEnhance		= 0;
	local nEquipEnhanceFail = 0;
	local nEquipLingqi		= 0;
	local nEquipDing5		= 0;
	local nEquipDing7		= 0;
	local nEquipDing10		= 0;
	local tItemTemplate		= GetItemTemplateInfo(tGoodInfo.AwardItem[1], tGoodInfo.AwardItem[2], tGoodInfo.AwardItem[3]);
	local nFreeRoom			= GetFreeItemRoom();
	local nFreeWeight		= GetMaxItemWeight() - GetCurItemWeight();
	local nNeedRoom			= ((0 == tGoodInfo.AwardItem[1] or 0 >= tItemTemplate.StackCount) and tGoodInfo.AwardItem[4]) or ceil(tGoodInfo.AwardItem[4] / tItemTemplate.StackCount);
	local nNeedWeight		= ((nil and (1 == _JX2WZ)) and 0) or (((0 == tGoodInfo.AwardItem[1]) and tItemTemplate.Weight) or tItemTemplate.Weight * tGoodInfo.AwardItem[4]);
	nNeedWeight = nNeedWeight + tItemTemplate.Weight --���һ�����ߵĸ��أ���Ȼadditem����ʧ��
	-- ����
	if nFreeWeight < nNeedWeight then
		Talk(1, "", format("C�c h� mang theo v�t ph�m qu� n�ng, kh�ng th� ��i [%s]. Mang n�ng c�n %d .", tGoodInfo.Name, nNeedWeight));
		return 0
	end

	-- �ռ�
	if nFreeRoom < nNeedRoom then -- װ��
		Talk(1, "", format("H�nh trang c�a c�c h� kh�ng �� � tr�ng, kh�ng th� ��i [%s]. C�n tr�ng %d � h�nh trang.", tGoodInfo.Name, nNeedRoom));
		return 0
	end

	local tAttrSave = nil
	local szSpecialOpStr =  tExchangeInfo.ExchangeFlag.SpecialOpStr or ""
	if 1 == tExchangeInfo.Type then -- ����
		tEquipInfo						= tExchangeInfo.CostItem[1];
		nEquipPos						= get_equip_pos(tEquipInfo[2]);
		nEquipIDX						= GetPlayerEquipIndex(nEquipPos);
		local szItemName				= GetItemName(tEquipInfo[1], tEquipInfo[2], tEquipInfo[3]);
		local nEquipG, nEquipD, nEquipP	= GetPlayerEquipInfo(nEquipPos);
		if nEquipG ~= tEquipInfo[1] or nEquipD ~= tEquipInfo[2] or nEquipP ~= tEquipInfo[3] then
			Talk(1, "", format("H�y mang [%s] tr�n ng��i. N�u l� v�t trang s�c h�y ��t t�i � trang s�c th� nh�t.", szItemName));
			return 0
		end
		if tEquipInfo[5] and tEquipInfo[5] > 0 and  GetItemLevel(nEquipIDX) < tEquipInfo[5] then
			Talk(1, "", format("N�ng c�p c�n %d c�p [%s]", tEquipInfo[5], szItemName));
			return 0
		end
		
		
		if szSpecialOpStr ~= "" then
			if SpecialOp_AttrCheck(szSpecialOpStr, nEquipIDX) ~= 1 then
				return 0
			end
		end
		
		if szSpecialOpStr ~= "" then
			tAttrSave = SpecialOp_AttrSave(szSpecialOpStr, nEquipIDX)
			if not tAttrSave then
				VET_WriteEquipShopLog("[EquipShop:%d,%d,%d][Account:%s RoleName:%s SpecialOpStr:%s] attrsave fail",
					uShopId, uGoodID, uExchangeID,GetAccount(), GetName(), szSpecialOpStr);
				return 0
			end
		end
		if 1 == tExchangeInfo.ExchangeFlag.Bagua then
			nEquipLingqi				= GetItemMaxLingQi(nEquipIDX);
			if 0 >= nEquipLingqi then
				Talk(1, "", format("[%s] kh�ng ph�i l� trang b� B�t Qu�i.", szItemName));
				return 0
			end
			local nAttribute, _			= GetItemAttr(nEquipIDX, 1);
			if 0 ~= nAttribute then
				Talk(1, "", format("H�y r�t Linh Th�ch trong [%s] mang tr�n ng��i.", szItemName));
				return
			end
		end

		if 1 == GetItemSpecialAttr(nIndex, "LOCK") then
			Talk(1, "", format("�� ��m b�o t�i s�n c�a c�c h�, h�y m� kh�a [%s].", szItemName));
			return 0
		end

		tremove(tExchangeInfo.CostItem, 1);
		tExchangeInfo.CostItem.n = nil;
	end

	

	for _, tCostItem in tExchangeInfo.CostItem do
		if 0 < tCostItem[4] then
			local nTotalCount 		= GetItemCount(tCostItem[1], tCostItem[2], tCostItem[3], tCostItem[5] or 0);  -- �����Ƿ�����ĵ���������
			local nUnlockedCount	= GetUnlockedItemCount(tCostItem[1], tCostItem[2], tCostItem[3], tCostItem[5] or 0); -- δ�����ĵ�������
			if tCostItem[4] > nUnlockedCount then
				local szItemName = GetItemName(tCostItem[1], tCostItem[2], tCostItem[3]);
				local szTalk = format("C�c h� mang theo [%s] kh�ng �� %u, kh�ng th� ��i [%s].", szItemName, tCostItem[4], tGoodInfo.Name)
				if nTotalCount ~= nUnlockedCount then
					szTalk = szTalk .. "<color=yellow>(�� ��m b�o an to�n t�i s�n, ��o c� �� kh�a s� kh�ng th� ��i)<color>"
				end
				Talk(1, "", szTalk);
				return 0
			end
		end
	end

	-- �۳����� -----------------------------------------------
	-- �۳���Ʒ
	if 0 ~= nEquipIDX then
		local nRet 				= DelItemByIndex(nEquipIDX, -1);
		local tExchangeInfo2	= GetEquipShopExchangeData(uExchangeID);
		local tEquipInfo2		= tExchangeInfo2.CostItem[1];
		local szItemName2		= GetItemName(tEquipInfo2[1], tEquipInfo2[2], tEquipInfo2[3]);
		VET_WriteEquipShopLog(format("[EquipShop:%d,%d,%d][CostEquip:%d %s(%d,%d,%d,%d)][Ret:%d][Enhance:%d][Ding7:%d]",uShopId , uGoodID, uExchangeID
			, nEquipPos, szItemName2, tEquipInfo2[1], tEquipInfo2[2], tEquipInfo2[3], tEquipInfo2[4]
			, nRet, nEquipEnhance, nEquipDing7));
		if 1 ~= nRet then return 0 end
	end

	for _, tCostItem in tExchangeInfo.CostItem do
		if 0 < tCostItem[4] then
			local nRet = DelUnlockedItem(tCostItem[1], tCostItem[2], tCostItem[3], tCostItem[4], tCostItem[5] or 0);
			local szItemName = GetItemName(tCostItem[1], tCostItem[2], tCostItem[3]);
			VET_WriteEquipShopLog(format("[EquipShop:%d,%d,%d][CostItem:%s(%d,%d,%d,%d,%d)][Ret:%d]", uShopId, uGoodID, uExchangeID, szItemName, tCostItem[1], tCostItem[2], tCostItem[3], tCostItem[4], tCostItem[5] or 0, nRet));
			if 1 ~= nRet then return 0 end
			
			local szCode = format("runtime_stat_equip_shop_consumme_item(%d, %d, %d, %d, %d)", PackItemId(tCostItem[1], tCostItem[2], tCostItem[3]), tCostItem[4], uShopId, uGoodID, uExchangeID)
			SendScript2VM("\\settings\\static_script\\runtime_data_stat\\runtime_game_data_stat.lua", szCode)
			
		end
	end

	-- �۳���Ǯ
	for _, tCostMoney in tExchangeInfo.CostMoney do
    	if tCostMoney[1] ~= 0 then
    		local nRet = PayVMoney(tCostMoney[1], tCostMoney[2])
    		--local nRet = Pay(tExchangeInfo.CostCoin);
    		VET_WriteEquipShopLog(format("[EquipShop:%d,%d,%d][CostMoney:%d %d][Ret:%d]", uShopId, uGoodID, uExchangeID, tCostMoney[1], tCostMoney[2], nRet));
    		if 1 ~= nRet then return 0 end
    	end
	end

	-- �۳�����
	for _, tCostTask in tExchangeInfo.CostTask do
		if 0 < tCostTask[1] then
			local nTaskValue	= GetTask(tCostTask[1]);
			if tCostTask[1] == TASKID_CHARM_CAN_USED_POINT then  --����ֵ
				AddCharmUsedPoint(tCostTask[2]);
			else
				SetTask(tCostTask[1], nTaskValue - tCostTask[2]);
			end
			local nNewTaskValue	= GetTask(tCostTask[1]);
			VET_WriteEquipShopLog(format("[EquipShop:%d,%d,%d][CostTask:%d,%d,%d][Ret:%d]", uShopId, uGoodID, uExchangeID, tCostTask[1], nTaskValue, nNewTaskValue, 1));
		end
	end

	--------------------------------
	-- ����װ������
	local nEquipG	= 0;
	if nEquipG == tGoodInfo.AwardItem[1] and 0 >= nEquipLingqi then
		local nID	= get_gdp_id(tGoodInfo.AwardItem[1], tGoodInfo.AwardItem[2], tGoodInfo.AwardItem[3]);
		for _, id in g_tBaguaItem do
			if id == nID then
				nEquipLingqi						= 120;
				tExchangeInfo.ExchangeFlag.Bagua	= 1;
				break;
			end
		end
	end
	-- ����װ������
	--------------------------------

	-- ������ -----------------------------------------------
	local nParam		= ((1 == tExchangeInfo.ExchangeFlag.Bangding)	and 4) or 1;
	local nAttribute	= ((1 == tExchangeInfo.ExchangeFlag.Bagua)		and 0) or -1;
	local nItemIDX		= 0;
	local bIBFlag		= 0;

	--------------------------------
	-- ��װ���� �� ���;öȵĴ�ȵ��ߡ�200��
	local nCoatG		= 0;
	local tCoatD		= {
		[108] = 1,
		[109] = 1,
		[110] = 1,
		[111] = 1,
		[200] = 1,
		[119] = 1,--��װ�Ҽ�
		[120] = 1,
		[121] = 1,
	};
	if nCoatG == tGoodInfo.AwardItem[1] then
		if tCoatD[tGoodInfo.AwardItem[2]] then
			bIBFlag		= 1;	-- IB��ʶ
			nAttribute	= 0;	-- ������
		end
	end
	-- ��װ���� �� ���;öȵĴ�ȵ��ߡ�200��
	--------------------------------
	-- bugfixed: 	������Ʒ�Ĺ���ʱ��,������additem֮ǰ����
	--				���������ұ��������һ�����õ��ߣ���ô�����������޵��߻�ֱ�ӱ����ӵ�֮ǰ�����õ����ϡ�
	--				�Ӷ������µ��ߵ���Ч�ڱ�����ޡ�
	local nExpireTime = tGoodInfo.TimeLimitSec or 0;
	if nExpireTime < 0 then nExpireTime = 0 end
	nParam = nExpireTime * 100 + nParam
	--------------------------------
	for i = 1, tGoodInfo.AwardItem[4] do
		if 0 == tGoodInfo.AwardItem[1] then
    		_, nItemIDX = AddItem(tGoodInfo.AwardItem[1], tGoodInfo.AwardItem[2], tGoodInfo.AwardItem[3], 1, nParam, nAttribute, nAttribute, nAttribute, nAttribute, nAttribute, nAttribute);
		else
    		_, nItemIDX = AddItem(tGoodInfo.AwardItem[1], tGoodInfo.AwardItem[2], tGoodInfo.AwardItem[3], 1, nParam);
    	end
    	if 0 >= nItemIDX then return 0 end

    	local szItemName = GetItemName(nItemIDX);
    	VET_WriteEquipShopLog(format("[EquipShop:%d,%d,%d][AwardItem:%s(%d,%d,%d,%d/%d,%d)][ItemIDX:%d][Enhance:%d][Ding7:%d][Lingqi:%d][ItemExpireTimeSecond:%d]",
    	uShopId, uGoodID, uExchangeID,
    	szItemName,tGoodInfo.AwardItem[1], tGoodInfo.AwardItem[2], tGoodInfo.AwardItem[3], i, tGoodInfo.AwardItem[4], nParam,
    	nItemIDX, nEquipEnhance, nEquipDing7, nEquipLingqi, nExpireTime));

		if szSpecialOpStr ~= "" then
			local nR = SpecialOp_AttrRestore(szSpecialOpStr, nItemIDX, tAttrSave)
			if nR ~= 1 then
				VET_WriteEquipShopLog("[EquipShop:%d,%d,%d][Account:%s RoleName:%s SpecialOpStr:%s] attrrestore fail",
					uShopId, uGoodID, uExchangeID,GetAccount(), GetName(), szSpecialOpStr);
				return 0
			end
		end
    	if 1 == tExchangeInfo.ExchangeFlag.Bagua then
    		if 0 < nEquipLingqi			then
    			SetItemMaxLingQi(nItemIDX, nEquipLingqi);
    		end
    	end
    
    	if 1 == bIBFlag then
    		SetItemStatus(nItemIDX, 2, 1);
    	end
    
    	SyncItem2Client(nItemIDX);
  
	end
	
    if 0 < tGoodInfo.AwardTimes[1] then
		local nTaskValue	= GetTask(tGoodInfo.AwardTimes[1]);
		SetTask(tGoodInfo.AwardTimes[1], nTaskValue + 1);
		local nNewTaskValue	= GetTask(tGoodInfo.AwardTimes[1]);
		VET_WriteEquipShopLog(format("[EquipShop:%d,%d][AwardTimes:%d,%d,%d][Ret:%d]", uGoodID, uExchangeID, tGoodInfo.AwardTimes[1], nTaskValue, nNewTaskValue, 1));
	end
	
	return 1
end

function checkShopDate(uShopId)
	if tEquipShopDate[uShopId] == nil then
		return 1
	end
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < tEquipShopDate[uShopId].beginDate or nDate > tEquipShopDate[uShopId].endDate then
		return 0
	end
	return 1
end

function checkGoodsDate(uGoodID)
	if m_tbGoodsDate[uGoodID] == nil then
		return 1;
	end
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < m_tbGoodsDate[uGoodID].beginDate or nDate > m_tbGoodsDate[uGoodID].endDate then
		return 0;
	end
	return 1;
end

function OnExchange(uShopId, uGoodID, uExchangeID, uBatchNum)
	-- �̵���ڼ�� -------------------------------------------
	if checkShopDate(uShopId) == 0 then
		Talk(1,"","C�a h�ng �� qu� h�n, h�y c�n th�n, ��ng th�c hi�n thao t�c kh�ng h�p l�!")
		VET_WriteEquipShopLog("[EquipShop:%d,%d,%d][Account:%s RoleName:%s] visit invalid shop!",
			uShopId, uGoodID, uExchangeID,GetAccount(), GetName());
		return
	end
	--LongDaiKa: ki�m tra th�i gian m� b�n item  -------------------------------------------
	if checkGoodsDate(uGoodID) == 0 then
		Talk(1,"","V�t ph�m �� qu� h�n, h�y c�n th�n, ��ng th�c hi�n thao t�c kh�ng h�p l�!")
		VET_WriteEquipShopLog("[EquipShop:%d,%d,%d][Account:%s RoleName:%s] visit invalid good!",
				uShopId, uGoodID, uExchangeID,GetAccount(), GetName());
		return
	end
	-- ��ȡ���� -----------------------------------------------
	if not uGoodID			or 0 >= uGoodID		then return end
	if not uExchangeID		or 0 >= uExchangeID	then return end

	local tGoodInfo		= GetEquipShopGoodData(uGoodID);
	local tExchangeInfo	= GetEquipShopExchangeData(uExchangeID);
	if not tGoodInfo		or 'table' ~= type(tGoodInfo)		or uGoodID		~= tGoodInfo.ID		then return end
	if not tExchangeInfo	or 'table' ~= type(tExchangeInfo)	or uExchangeID	~= tExchangeInfo.ID	then return end

	local bCheckExchangeIDVaild		= 0;
	for _, uID in tGoodInfo.ExchangeData do
		if uID == uExchangeID then
			bCheckExchangeIDVaild	= 1;
			break;
		end
	end
	if 1 ~= bCheckExchangeIDVaild then return end

	-- ������� -----------------------------------------------

	-- �������
	if 1 == IsBoxLocking() then
		Talk(1, "", format("�� ��m b�o t�i s�n c�a c�c h�, h�y m� kh�a kho tr��c �i."));
		return
	end
	
	local nRealExchgCnt = 0;
	local bBreak = 0
	
	VET_WriteEquipShopLog("[EquipShop:%d,%d,%d][Account:%s RoleName:%s] log begin",
		uShopId, uGoodID, uExchangeID,GetAccount(), GetName());
	for i = 1, uBatchNum do
		local suc = _DoOneExchange(tGoodInfo, tExchangeInfo, uShopId, uGoodID, uExchangeID)
		if suc and 1 == suc  then
			nRealExchgCnt = nRealExchgCnt + 1
			
			--ͳ��
			VET_EquipShopStatic(uShopId, uGoodID, uExchangeID);
		--	tGoodInfo.StatKey		= tGoodInfo.StatKey 	or "";
		--	tExchangeInfo.StatKey	= tExchangeInfo.StatKey	or "";
		--	if "" ~= tGoodInfo.StatKey or "" ~= tExchangeInfo.StatKey then
		--		--AddStatValue(format("%s%s", tGoodInfo.StatKey, tExchangeInfo.StatKey), 1);
		--	end
		else
			break
		end
	end --for nRealExchgCnt=0,uBatchNum
	
	if nRealExchgCnt >= 1 then
		if uBatchNum > 1 then
			Msg2Player(format("Ng��i th�nh c�ng ho�n th�nh [%d/%d] l�n ��i nh�n ���c [%s]x%d", nRealExchgCnt, uBatchNum, tGoodInfo.Name, nRealExchgCnt*tGoodInfo.AwardItem[4]));
		else
			Msg2Player(format("C�c h� nh�n ���c [%s]x%d", tGoodInfo.Name, tGoodInfo.AwardItem[4]));
		end
		
		local szCode = format("runtime_stat_equip_shop_exchange(%d, %d, %d, %d)", uShopId, uGoodID, uExchangeID, nRealExchgCnt)
		SendScript2VM("\\settings\\static_script\\runtime_data_stat\\runtime_game_data_stat.lua", szCode)

		if 1 == tGoodInfo.GlobalMsg then
			Msg2Global(format("Ch�c m�ng [%s] �� nh�n ���c [%s]x%d ", GetName(), tGoodInfo.Name, nRealExchgCnt*tGoodInfo.AwardItem[4]));
		end
	end
end

function VET_WriteEquipShopLog(strFormat, ...)
	local strLogPath = "logs/equip_shop/"
	local strLog = format(strFormat, unpack(arg));
	local strDate = date("%Y_%m_%d");
	local strLogFile = format("equipshoplog_%s.log", strDate);
	local strLogFilePath = format("%s%s",strLogPath, strLogFile);

	local hFile = openfile(strLogFilePath, "a+");
	if (hFile == nil) then
		execute(format("mkdir \"%s\"", strLogPath));
		hFile = openfile(strLogFilePath, "a+");
	end
	if (hFile ~= nil) then
		write (hFile, strLog .. "\n");
		closefile (hFile);
	end
end

--some special operation
--function Special_Op_Check(szOpStr, nItemIdx)
--end

--some condition check
function SpecialOp_AttrCheck(szOpStr, nOldItemIdx)
	if not szOpStr or not nOldItemIdx then
		return 1
	end
	
	local t = T_OPSTR_2_FUNC[szOpStr]
	if t then
		if t[1] then
			return t[1](nOldItemIdx)
		else
			return 1
		end
	else
		print("[equipshop] cant find SpecialOp", szOpStr)
	end
	return 0
end

--save some attrs of old item
function SpecialOp_AttrSave(szOpStr, nOldItemIdx)
	if not szOpStr or not nOldItemIdx then
		return 1
	end
	
	local t = T_OPSTR_2_FUNC[szOpStr]
	if t then
		if t[2] then
			return t[2](nOldItemIdx)
		else
			return 1
		end
	end
end

--set some attrs to new items
function SpecialOp_AttrRestore(szOpStr, nNewItemIdx, tSave)
	if not szOpStr or not nNewItemIdx or not tSave then
		return 1
	end
	
	local t = T_OPSTR_2_FUNC[szOpStr]
	if t then
		if t[3] then
			return t[3](nNewItemIdx, tSave)
		else
			return 1
		end
		
	end
end

function _specialop_attrcheck_reduce_enhance(nOldItemIdx)
	local nEquipEnhance = GetEquipAttr(nOldItemIdx, 2);
	if nEquipEnhance >= 13 then
		return 1
	else
		Msg2Player("C�p c��ng h�a trang b� ch�a ��t +13, kh�ng th� ti�n h�nh n�ng c�p!")
		return 0
	end
end

function _specialop_attrsave_reduce_enhance(nOldItemIdx)
	local t = {}
	t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	return t
end
function _specialop_attrrestore_reduce_enhance(nNewItemIdx, tSave)
	local nEnhance = tSave.nEquipEnhance
	local nNewEnhance = 0
	if nEnhance > 0 then
		if nEnhance >= 1 and nEnhance <=13 then
			nNewEnhance = 0
		elseif nEnhance >= 14 and nEnhance <=15 then
			nNewEnhance = 7
		end
		if nNewEnhance > 0 then
			SetItemEnhance(nNewItemIdx, nNewEnhance);
		end
    end
    return 1
end

function __check_enhance_n(nOldItemIdx,nEnhanceLv)
	local nEquipEnhance = GetEquipAttr(nOldItemIdx, 2);
	if nEquipEnhance >= nEnhanceLv then
		return 1
	else
		Msg2Player(format("�� c��ng h�a c�a trang b� kh�ng �� +%d, kh�ng th� tham gia th�ng c�p!", nEnhanceLv))
		return 0
	end
end
function _specialop_attrcheck_reduce_enhance1(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 1) end
function _specialop_attrcheck_reduce_enhance2(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 2) end
function _specialop_attrcheck_reduce_enhance3(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 3) end
function _specialop_attrcheck_reduce_enhance4(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 4) end
function _specialop_attrcheck_reduce_enhance5(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 5) end
function _specialop_attrcheck_reduce_enhance6(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 6) end
function _specialop_attrcheck_reduce_enhance7(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 7) end
function _specialop_attrcheck_reduce_enhance8(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 8) end
function _specialop_attrcheck_reduce_enhance9(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 9) end
function _specialop_attrcheck_reduce_enhance10(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 10) end
function _specialop_attrcheck_reduce_enhance11(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 11) end
function _specialop_attrcheck_reduce_enhance12(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 12) end
function _specialop_attrcheck_reduce_enhance13(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 13) end
function _specialop_attrcheck_reduce_enhance14(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 14) end
function _specialop_attrcheck_reduce_enhance15(nOldItemIdx)	return __check_enhance_n(nOldItemIdx, 15) end
function _specialop_attrsave_none(nOldItemIdx)	return 1 end
function _specialop_attrrestore_none(nNewItemIdx, tSave)	return 1 end

--function _specialop_attrsave_reduce_enhance14(nOldItemIdx)
--	return _specialop_attrsave_reduce_enhance(nOldItemIdx)
--end
--function _specialop_attrrestore_reduce_enhance14(nNewItemIdx, tSave)
--	--ǿ���ȱ�Ϊ0������������Ч��
--    return 1
--end

function _specialop_attrsave_save_enhance(nOldItemIdx)
	local t = {}
	t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	t.nEquipEnhanceFail		= GetEquipAttr(nOldItemIdx, 3);
	t.nEquipDing10			= GetItemSpecialAttr(nOldItemIdx, "DING10");
	t.nEquipDing7			= GetItemSpecialAttr(nOldItemIdx, "DING7");
	return t
end
function _specialop_attrrestore_save_enhance(nNewItemIdx, tSave)
	if 0 < tSave.nEquipEnhance then
    	SetItemEnhance(nNewItemIdx, tSave.nEquipEnhance);
    end
    if 0 < tSave.nEquipDing10 then
    	SetItemSpecialAttr(nNewItemIdx, "DING10", 1);
    end
    if 0 < tSave.nEquipDing7 then
    	SetItemSpecialAttr(nNewItemIdx, "DING7", 1);
    end
    return 1
end

function _specialop_attrsave_half_enhance(nOldItemIdx)
	local t = {}
	t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	t.nEquipEnhanceFail		= GetEquipAttr(nOldItemIdx, 3);
	t.nEquipDing10			= GetItemSpecialAttr(nOldItemIdx, "DING10");
	t.nEquipDing7			= GetItemSpecialAttr(nOldItemIdx, "DING7");
	return t
end
function _specialop_attrrestore_half_enhance(nNewItemIdx, tSave)
	local nEnhance = floor(tSave.nEquipEnhance / 2)
	if nEnhance > 0 then
		SetItemEnhance(nNewItemIdx, nEnhance);
	end
end
function _specialop_attrsave_enhance_reduce_3(nOldItemIdx)
	local t = {}
	t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	t.nEquipEnhanceFail		= GetEquipAttr(nOldItemIdx, 3);
	t.nEquipDing10			= GetItemSpecialAttr(nOldItemIdx, "DING10");
	t.nEquipDing7			= GetItemSpecialAttr(nOldItemIdx, "DING7");
	return t
end
function _specialop_attrrestore_enhance_reduce_3(nNewItemIdx, tSave)
	local nEnhance = tSave.nEquipEnhance - 3
	if nEnhance > 0 then
		SetItemEnhance(nNewItemIdx, nEnhance);
	end
end
function _specialop_attrsave_enhance_reduce_s(nOldItemIdx)
	local t = {}
	t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	t.nEquipEnhanceFail		= GetEquipAttr(nOldItemIdx, 3);
	t.nEquipDing10			= GetItemSpecialAttr(nOldItemIdx, "DING10");
	t.nEquipDing7			= GetItemSpecialAttr(nOldItemIdx, "DING7");
	return t
end
function _specialop_attrrestore_enhance_reduce_s(nNewItemIdx, tSave)
	local nEnhance = 0;
	if tSave.nEquipEnhance > 12 then
		nEnhance = 7;
	else
		nEnhance = 0;
	end
	if nEnhance > 0 then
		SetItemEnhance(nNewItemIdx, nEnhance);
	end
	return 1;
end


--this table must at end of file
T_OPSTR_2_FUNC = {
	--{check_func, save_func, restore_func}
	["reduce_enhance"] = {_specialop_attrcheck_reduce_enhance, _specialop_attrsave_reduce_enhance, _specialop_attrrestore_reduce_enhance},
	["reduce_enhance1"] = {_specialop_attrcheck_reduce_enhance1, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance2"] = {_specialop_attrcheck_reduce_enhance2, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance3"] = {_specialop_attrcheck_reduce_enhance3, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance4"] = {_specialop_attrcheck_reduce_enhance4, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance5"] = {_specialop_attrcheck_reduce_enhance5, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance6"] = {_specialop_attrcheck_reduce_enhance6, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance7"] = {_specialop_attrcheck_reduce_enhance7, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance8"] = {_specialop_attrcheck_reduce_enhance8, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance9"] = {_specialop_attrcheck_reduce_enhance9, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance10"] = {_specialop_attrcheck_reduce_enhance10, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance11"] = {_specialop_attrcheck_reduce_enhance11, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance12"] = {_specialop_attrcheck_reduce_enhance12, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance13"] = {_specialop_attrcheck_reduce_enhance13, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance14"] = {_specialop_attrcheck_reduce_enhance14, _specialop_attrsave_none, _specialop_attrrestore_none},
	["reduce_enhance15"] = {_specialop_attrcheck_reduce_enhance15, _specialop_attrsave_none, _specialop_attrrestore_none},
	["save_enhance"] = {nil, _specialop_attrsave_save_enhance, _specialop_attrrestore_save_enhance},
	["half_enhance"] = {nil, _specialop_attrsave_half_enhance, _specialop_attrrestore_half_enhance},
	["enhance_reduce_3"] = {nil, _specialop_attrsave_enhance_reduce_3, _specialop_attrrestore_enhance_reduce_3},
	["enhance_reduce_s"] = {nil, _specialop_attrsave_enhance_reduce_s, _specialop_attrrestore_enhance_reduce_s},
	["update_huofeng_lv2"] = {_specialop_attrcheck_update_huofeng_lv2, _specialop_attrsave_update_huofeng_lv2, _specialop_attrrestore_update_huofeng_lv2},
	["update_huofeng_lv3"] = {_specialop_attrcheck_update_huofeng_lv3, _specialop_attrsave_update_huofeng_lv3, _specialop_attrrestore_update_huofeng_lv3},
	["update_huofeng_equip"] = {_specialop_attrcheck_update_huofeng_equip, _specialop_attrsave_update_huofeng_equip, _specialop_attrrestore_update_huofeng_equip},
	["update_qinglong_lv2"] = {_specialop_attrcheck_update_qinglong_lv2, _specialop_attrsave_update_qinglong_lv2, _specialop_attrrestore_update_qinglong_lv2},
	["update_qinglong_lv3"] = {_specialop_attrcheck_update_qinglong_lv3, _specialop_attrsave_update_qinglong_lv3, _specialop_attrrestore_update_qinglong_lv3},
	["update_qinglong_equip"] = {_specialop_attrcheck_update_qinglong_equip, _specialop_attrsave_update_qinglong_equip, _specialop_attrrestore_update_qinglong_equip},
	["update_yinxue_equip"] = {_specialop_attrcheck_update_yinxue_equip, _specialop_attrsave_update_yinxue_equip, _specialop_attrrestore_update_yinxue_equip},
	["update_huwei_equip"] = {_specialop_attrcheck_update_huwei_equip, _specialop_attrsave_update_huwei_equip, _specialop_attrrestore_update_huwei_equip},
	["update_huwei_lv2"] = {_specialop_attrcheck_update_huwei_lv2, _specialop_attrsave_update_huwei_lv2, _specialop_attrrestore_update_huwei_lv2},
	["update_sattinh_equip"] = {_specialop_attrcheck_update_sattinh_equip, _specialop_attrsave_update_sattinh_equip, _specialop_attrrestore_update_sattinh_equip},
	["update_hubaiwusong_equip"] = { _specialop_attrcheck_update_hbvs_equip, _specialop_attrsave_reduce_enhance, _specialop_attrrestore_update_vip_equip },
	["update_hanvu_equip"] = { _specialop_attrcheck_update_hanvu_equip, _specialop_attrsave_update_hanvu_equip, _specialop_attrrestore_update_hanvu_equip },
	["update_zhuque_equip"] = {_specialop_attrcheck_update_zhuque_equip, _specialop_attrsave_update_zhuque_equip, _specialop_attrrestore_update_zhuque_equip},
	["update_zhuque_lv2"] = {_specialop_attrcheck_update_zhuque_lv2, _specialop_attrsave_update_zhuque_lv2, _specialop_attrrestore_update_zhuque_lv2},
	["_w_enhance_req7_reduce7"] = {_specialop_attrcheck_w_enhance_req7_reduce7, _specialop_attrsave_w_enhance_req7_reduce7, _specialop_attrrestore_w_enhance_req7_reduce7},
	["_w_enhance_req10_reduce10"] = {_specialop_attrcheck_w_enhance_req10_reduce10, _specialop_attrsave_w_enhance_req10_reduce10, _specialop_attrrestore_w_enhance_req10_reduce10},
	["_w_enhance_req10_reduce10_rate5"] = {_specialop_attrcheck_w_enhance_req10_reduce10, _specialop_attrsave_w_enhance_req10_reduce10, attrrestore_w_enhance_req10_re,duce10_rate5},
	["_w_enhance_req12_reduce0"] = {_specialop_attrcheck_w_enhance_req12_reduce0, _specialop_attrsave_w_enhance_req12_reduce0, _specialop_attrrestore_w_enhance_req12_reduce0},
	["_w_enhance_req15_save"] = {_specialop_attrcheck_w_enhance_req15_save, _specialop_attrsave_w_enhance_req15_save, _specialop_attrrestore_w_enhance_req15_save},
	["_w_enhance_req7_reduce7_rate10"] = {_specialop_attrcheck_w_enhance_req7_reduce7, _specialop_attrsave_w_enhance_req7_reduce7, _specialop_attrrestore_update_uyho_equip},
	["_w_enhance_req_reduce_rate10ct"] = {_specialop_attrcheck_w_enhance_req7_reduce7, _specialop_attrsave_w_enhance_req7_reduce7, _specialop_attrrestore_update_chutuoc_equip},
	["_w_enhance_req_boi_rate5"] = {_specialop_attrcheck_ngocboi, _specialop_attrsave_ngocboi, _specialop_attrrestore_update_uyho_boi},
	["_w_enhance_req_ctboi_rate5"] = {_specialop_attrcheck_ngocboi, _specialop_attrsave_ngocboi, _specialop_attrrestore_update_chutuoc_boi},
	["_w_enhance_req_tuboi_rate5"] = {_specialop_attrcheck_ngocboi, _specialop_attrsave_ngocboi, _specialop_attrrestore_update_thanung_boi},
	["_w_enhance_req_reduce_rate10tu"] = {_specialop_attrcheck_w_enhance_req7_reduce7, _specialop_attrsave_w_enhance_req7_reduce7, _specialop_attrrestore_update_thanung_equip},
}

--�̶Ӷһ�ͳ��
function VET_EquipShopStatic(uShopId, uGoodID, uExchangeID)
	--�һ�������һ����Ʒ
	if uGoodID == 30735 then
		AddRuntimeStat(7, 34, 0, 1);
	elseif uGoodID == 30736 then
		AddRuntimeStat(7, 35, 0, 1);
	elseif uGoodID == 30737 then
		AddRuntimeStat(7, 36, 0, 1);
	elseif uGoodID == 30738 then
		AddRuntimeStat(7, 37, 0, 1);
	elseif uGoodID == 30739 then
		AddRuntimeStat(7, 38, 0, 1);
	elseif uGoodID == 30740 then
		AddRuntimeStat(7, 39, 0, 1);
	elseif uGoodID == 30741 then
		AddRuntimeStat(7, 40, 0, 1);
	elseif uGoodID == 30742 then
		AddRuntimeStat(7, 41, 0, 1);
	elseif uGoodID == 30743 then
		AddRuntimeStat(7, 42, 0, 1);
	elseif uGoodID == 30744 then
		AddRuntimeStat(7, 43, 0, 1);
	elseif uGoodID >= 30745 and uGoodID <= 30784 then
		AddRuntimeStat(7, 44, 0, 1);
	elseif uGoodID >= 30785 and uGoodID <= 30789 then
		AddRuntimeStat(7, 45, 0, 1);
	elseif uGoodID == 30790 then
		AddRuntimeStat(7, 46, 0, 1);
	elseif uGoodID == 31336 then
		AddRuntimeStat(24, 1, 0, 1);
	elseif uGoodID == 31337 then
 		AddRuntimeStat(24, 2, 0, 1); 
	elseif uGoodID >= 31339 and uGoodID <= 31355 then
		AddRuntimeStat(24, 3, 0, 1);
	elseif uGoodID == 34267 or uGoodID == 34268 or uGoodID == 34272 then
		AddRuntimeStat(36, 6, 0, 2);
	elseif uGoodID >= 34269 and uGoodID <= 34271 then
		AddRuntimeStat(36, 6, 0, 1);
	elseif uGoodID >= 34411 and uGoodID < 34463 then
		AddRuntimeStat(43, 3, 1, 1);
	elseif uGoodID >= 34463 and uGoodID < 34515 then
		AddRuntimeStat(43, 3, 3, 1);
	elseif uGoodID >= 34515 and uGoodID <= 34566 then
		AddRuntimeStat(43, 3, 2, 1);
	elseif uGoodID >= 34568 and uGoodID <= 34619 then
		AddRuntimeStat(43, 4, 0, 1);
	elseif uGoodID >= 37514 and uGoodID <= 37633 then
		AddRuntimeStat(60, uGoodID - 37514 + 1, 0, 1);

	elseif uGoodID >= 40751 and uGoodID <= 40757 then
		AddRuntimeStat(72, 9, uGoodID - 40751 + 1, 1);
	elseif uGoodID == 40782 then
		AddRuntimeStat(72, 9, 8, 1);
	elseif uGoodID >= 40758 and uGoodID <= 40770 then
		AddRuntimeStat(72, 10, uGoodID - 40758 + 1, 1);
	elseif uGoodID == 40783 then
		AddRuntimeStat(72, 10, 14, 1);
	elseif uGoodID >= 40771 and uGoodID <= 40778 then
		AddRuntimeStat(72, 11, uGoodID - 40771 + 1, 1);
	elseif uGoodID >= 40779 and uGoodID <= 40781 then
		AddRuntimeStat(72, 12, uGoodID - 40779 + 1, 1);
	elseif uGoodID >= 40789 and uGoodID <= 40835 then
		AddRuntimeStat(75, uGoodID - 40789 + 1, 0, 1);
	elseif uGoodID >= 40836 and uGoodID <= 40839 then
		AddRuntimeStat(75, 48, 0, 1);
	elseif uGoodID >= 40840 and uGoodID <= 40843 then
		AddRuntimeStat(75, 49, 0, 1);
	elseif uGoodID >= 40844 and uGoodID <= 40847 then
		AddRuntimeStat(75, 50, 0, 1);
	elseif uGoodID == 40848 then
		AddRuntimeStat(75, 51, 0, 1);
	elseif uGoodID >= 40850 and uGoodID <= 40862 then
		AddRuntimeStat(91, uGoodID - 40850 + 1, 0, 1)
	end
end

--ÿ������
function on_weekly_clear()
	for i = 3356,3363 do--�����̵�ÿ�ܶһ���������
		SetTask(i, 0)
	end
	SetTask(3383, 0) --��ȯ�̵�ÿ�ܶһ�����
	SetTask(3384, 0) --��ȯ�̵�ͬ��֮Ըÿ�ܶһ�����
end