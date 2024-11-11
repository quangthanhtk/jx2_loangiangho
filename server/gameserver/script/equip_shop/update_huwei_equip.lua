--Import("\\script\\online_activites\\task_values.lua")

function _specialop_attrcheck_update_huwei_lv2(nOldItemIdx)
	if _specialop_attrcheck_reduce_enhance7(nOldItemIdx) ~= 1 then --ǿ7���ϲ�������
		return 0
	end
	return 1
end

function _specialop_attrsave_update_huwei_lv2(nOldItemIdx)
	local t = {}
	--t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	return t
end
function _specialop_attrrestore_update_huwei_lv2(nNewItemIdx, tSave)
--	local nNum = GetItemCount(t_need[2], t_need[3], t_need[4])
--	if nNum > 0 then
--		DelItem(t_need[2], t_need[3], t_need[4], GetItemCount(t_need[2], t_need[3], t_need[4]))
--	end
    return 1
end


-------------------------------------------------------------------------------------------------

function _specialop_attrcheck_update_huwei_lv3(nOldItemIdx)
	if _specialop_attrcheck_reduce_enhance7(nOldItemIdx) ~= 1 then --ǿ7���ϲ�������
		return 0
	end
	return 1
end

function _specialop_attrsave_update_huwei_lv3(nOldItemIdx)
	local t = {}
	--t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	return t
end
function _specialop_attrrestore_update_huwei_lv3(nNewItemIdx, tSave)
--	local nEnhance = tSave.nEquipEnhance
--	local nNewEnhance = 0
--	if nEnhance > 0 then
--		if nEnhance >= 1 and nEnhance <=13 then
--			nNewEnhance = 0
--		elseif nEnhance >= 14 and nEnhance <=15 then
--			nNewEnhance = 7
--		end
--		if nNewEnhance > 0 then
--			SetItemEnhance(nNewItemIdx, nNewEnhance);
--		end
--    end
    return 1
end

-------------------------------------------------------------------------------------------------

function _specialop_attrcheck_update_huwei_equip(nOldItemIdx)
	local nD = GetItemDetail(nOldItemIdx)
	--local nG, nD, nP = GetItemInfoByIndex(nOldItemIdx)
	if nD ~= 102 then--��������Ҫ+7����
    	if _specialop_attrcheck_reduce_enhance7(nOldItemIdx) ~= 1 then --ǿ7���ϲ�������
    		return 0
    	end
	end
	if GetFreeItemRoom() < 2 then
		return 0
	end
	return 1
end

function _specialop_attrsave_update_huwei_equip(nOldItemIdx)
	local t = {}
	t.tInfo = GetItemInfoByIndex(nOldItemIdx, 1)
	t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	t.nEquipDing10			= GetItemSpecialAttr(nOldItemIdx, "DING10");
	t.nEquipDing7			= GetItemSpecialAttr(nOldItemIdx, "DING7");
	t.nBind = 1
	if GetItemSpecialAttr(nOldItemIdx, "BIND") == 1 then
		t.nBind = 4
	end
	--t.nRandSeed				= GetItemRandSeed(nOldItemIdx)
	t.tGem 					= GetItemGemInfo(nOldItemIdx)
	--t.tFeed 				= GetItemFeedUpAttrs(nOldItemIdx)
	return t
end
function _specialop_attrrestore_update_huwei_equip(nNewItemIdx, tSave)
--	local nEnhance = tSave.nEquipEnhance
--	local nNewEnhance = 0
--	if nEnhance > 0 then
--		if nEnhance >= 1 and nEnhance <=13 then
--			nNewEnhance = 0
--		elseif nEnhance >= 14 and nEnhance <=15 then
--			nNewEnhance = 7
--		end
--		if nNewEnhance > 0 then
--			SetItemEnhance(nNewItemIdx, nNewEnhance);
--		end
--    end
	local nRate = 1000 --Ĭ��10%����
	local _,nD,_= GetItemInfoByIndex(nNewItemIdx)
	if nD == 102 then --����5%����
		nRate = 500
	end
	local szItemName = GetItemName(nNewItemIdx)
	if random(1,10000) <= nRate then 
		local szMsg = format("Ch�c m�ng %s n�ng c�p th�nh c�ng %s", GetName(), szItemName)
		Msg2Global(szMsg)
	else--ʧ��
		DelItemByIndex(nNewItemIdx, -1)--ɾ��������װ��
		local tInfo = tSave.tInfo
		local ok, nIndex =  AddItem(tInfo.genre, tInfo.detail, tInfo.particular,1,tSave.nBind,-1,-1,-1,-1,-1,-1,
			0 ,tSave.nEquipEnhance, 0, tInfo.randseed)
		if 0 < tSave.nEquipDing10 then
    		SetItemSpecialAttr(nIndex, "DING10", 1);
        end
        if 0 < tSave.nEquipDing7 then
        	SetItemSpecialAttr(nIndex, "DING7", 1);
        end
        if tSave.tGem then
        	for i,v in tSave.tGem do
        		SetItemGemInfo(nIndex, i, v)
        	end
        end
		AddItem(2,1,31295,1)--��һ����������
		local szMsg = format("T�ng %s th�t b�i, ���c 1 %s Tinh Hoa an �i", szItemName, "Uy H�")
		Talk(1, "", szMsg)
		Msg2Player(szMsg)
		return 0
	end
    return 1
end


-----------------------------------��ȸ---------------------------------------------

function _specialop_attrcheck_update_zhuque_equip(nOldItemIdx)
	local nD = GetItemDetail(nOldItemIdx)
	--local nG, nD, nP = GetItemInfoByIndex(nOldItemIdx)
	if nD ~= 102 then--��������Ҫ+7����
    	if _specialop_attrcheck_reduce_enhance7(nOldItemIdx) ~= 1 then --ǿ7���ϲ�������
    		return 0
    	end
	end
	if GetFreeItemRoom() < 2 then
		return 0
	end
	return 1
end

function _specialop_attrsave_update_zhuque_equip(nOldItemIdx)
	local t = {}
	t.tInfo = GetItemInfoByIndex(nOldItemIdx, 1)
	t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	t.nEquipDing10			= GetItemSpecialAttr(nOldItemIdx, "DING10");
	t.nEquipDing7			= GetItemSpecialAttr(nOldItemIdx, "DING7");
	t.nBind = 1
	if GetItemSpecialAttr(nOldItemIdx, "BIND") == 1 then
		t.nBind = 4
	end
	--t.nRandSeed				= GetItemRandSeed(nOldItemIdx)
	t.tGem 					= GetItemGemInfo(nOldItemIdx)
	--t.tFeed 				= GetItemFeedUpAttrs(nOldItemIdx)
	return t
end
function _specialop_attrrestore_update_zhuque_equip(nNewItemIdx, tSave)
--	local nEnhance = tSave.nEquipEnhance
--	local nNewEnhance = 0
--	if nEnhance > 0 then
--		if nEnhance >= 1 and nEnhance <=13 then
--			nNewEnhance = 0
--		elseif nEnhance >= 14 and nEnhance <=15 then
--			nNewEnhance = 7
--		end
--		if nNewEnhance > 0 then
--			SetItemEnhance(nNewItemIdx, nNewEnhance);
--		end
--    end
	local nRate = 800 --Ĭ��10%����
	local _,nD,_= GetItemInfoByIndex(nNewItemIdx)
	if nD == 102 then --����5%����
		nRate = 400
	end
	local szItemName = GetItemName(nNewItemIdx)
	if random(1,10000) <= nRate then 
		local szMsg = format("Ch�c m�ng %s n�ng c�p th�nh c�ng %s", GetName(), szItemName)
		Msg2Global(szMsg)
	else--ʧ��
		DelItemByIndex(nNewItemIdx, -1)--ɾ��������װ��
		local tInfo = tSave.tInfo
		local ok, nIndex =  AddItem(tInfo.genre, tInfo.detail, tInfo.particular,1,tSave.nBind,-1,-1,-1,-1,-1,-1,
			0 ,tSave.nEquipEnhance, 0, tInfo.randseed)
		if 0 < tSave.nEquipDing10 then
    		SetItemSpecialAttr(nIndex, "DING10", 1);
        end
        if 0 < tSave.nEquipDing7 then
        	SetItemSpecialAttr(nIndex, "DING7", 1);
        end
        if tSave.tGem then
        	for i,v in tSave.tGem do
        		SetItemGemInfo(nIndex, i, v)
        	end
        end
		AddItem(2,1,31515,1)--��һ����ȸ����
		local szMsg = format("N�ng c�p %s th�t b�i, ���c ��n b� 1 %s", szItemName, GetItemName(2,1,31515))
		Talk(1, "", szMsg)
		Msg2Player(szMsg)
		return 0
	end
    return 1
end

function _specialop_attrcheck_update_zhuque_lv2(nOldItemIdx)
	if _specialop_attrcheck_reduce_enhance7(nOldItemIdx) ~= 1 then --ǿ7���ϲ�������
		return 0
	end
	return 1
end

function _specialop_attrsave_update_zhuque_lv2(nOldItemIdx)
	local t = {}
	--t.nEquipEnhance			= GetEquipAttr(nOldItemIdx, 2);
	return t
end
function _specialop_attrrestore_update_zhuque_lv2(nNewItemIdx, tSave)
--	local nNum = GetItemCount(t_need[2], t_need[3], t_need[4])
--	if nNum > 0 then
--		DelItem(t_need[2], t_need[3], t_need[4], GetItemCount(t_need[2], t_need[3], t_need[4]))
--	end
    return 1
end
------------------------------��ȸ---------------------------------