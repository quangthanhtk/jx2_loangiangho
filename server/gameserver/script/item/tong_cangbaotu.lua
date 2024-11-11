Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\tong_activity\\head.lua")
Import("\\script\\missions\\tong_activity\\tong_activity_value.lua")
Include("\\script\\misc\\data_state\\state.lua")

--g_tItemCangbaotu = {
--	{2, 111, 150},
--	{2, 111, 151},
--	{2, 111, 152},
--	{2, 111, 153},
--	{2, 111, 154},
--}
g_nMaxLuckdrawCount = 10;
g_bUseWaitBar = 1;

local tAwardStr = {
	[PackItemId(2, 1, 31234)] = {"tong_dajiangquan"},
	[PackItemId(2, 1, 31235)] = {"tong_xiaojiangquan"},
	[PackItemId(2, 1, 31236)] = {"tong_xiaojiangquan"},
	[PackItemId(2, 1, 31237)] = {"tong_xiaojiangquan"},
	[PackItemId(2, 1, 31238)] = {"tong_xiaojiangquan"},
}

function  do_give_award(nIndex)

	if GetTask(TASKID_TONG_LUCKDRAW_COUNT) >= g_nMaxLuckdrawCount then
		Msg2Player(format("C� h�i r�t th��ng %d l�n T�ng B�o �� tu�n n�y �� d�ng h�t, kh�ng th� r�t th��ng.", g_nMaxLuckdrawCount));
		return
	end
	local g,d,p = GetItemInfoByIndex(nIndex)
    local nId = PackItemId(g,d,p)
    local t = %tAwardStr[nId]
    if t then
       local szAward = t[1]
       if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
           return 0
       end
       if DelItemByIndex(nIndex, 1) == 1 then
           if CustomAwardGiveGroup(szAward, 0) > 0 then   --���Ų���Ϊ�Ƿ����ȫ������
		   	  SetTask(TASKID_TONG_LUCKDRAW_COUNT, GetTask(TASKID_TONG_LUCKDRAW_COUNT) + 1);
			  if szAward == "tong_dajiangquan" then
			  		AddRuntimeStat(55, 1, 0, 1) --ʹ�ô�ȯ����ͳ��
			  elseif szAward == "tong_xiaojiangquan" then
			  		AddRuntimeStat(56, 1, 0, 1) --ʹ��С��ȯ����ͳ��
			  end
              return 1
           else
              AddItem(g,d,p, 1,4)
           end
       end
    end
	
end

function check_item_valid(nG, nD, nP, isPiece)
	local nMinP = 31234;
	local nMaxP = 31238;
	if isPiece == 1 then
		nMinP = 31235;
	end

	if ((nG ~= 2) or (nD ~= 1)) then
		return 0;
	end
	if ((nP < nMinP) or (nP > nMaxP)) then
		return 0;
	end	
	return 1;
end

function merge_pieces(nItemIdx)
	local nG, nD, nP = GetItemInfoByIndex(nItemIdx);
	if check_item_valid(nG, nD, nP, 1) ~= 1 then
		return
	end

	local bCanMerge = 1;
	for i = 31235, 31238 do
		local nCount = GetItemCount(nG, nD, i);
		if (not nCount) or (nCount < 1) then
			bCanMerge = 0;
			break
		end
	end

	if bCanMerge ~= 1 then
		Msg2Player("M�nh kh�ng ��, kh�ng th� h�p th�nh T�ng B�o �� ho�n ch�nh.");
		return
	end

	if gf_JudgeRoomWeight(1, 100, "") ~= 1 then 
		return 
	end
	--��ɾ��һ�����õ���Ƭ
	if DelItemByIndex(nItemIdx, 1) ~= 1 then
		return
	end
	--��ɾ��������֮ƥ�����Ƭ
	for i = 31235, 31238 do
		if i ~= nP then
			if DelItem(nG, nD, i, 1) ~= 1 then
				return
			end
		end
	end
	--�������Ĳر�ͼ
	local tGiveItem = {nG, nD, 31234};
	local szName = GetItemName(nG, nD, 31234);
	if gf_AddItemEx(tGiveItem, szName, 1) == 1 then
		Msg2Player("�� h�p th�nh 1 T�ng B�o �� ho�n ch�nh!");
	end
end

function OnUse(nItemIdx)
	local nG, nD, nP = GetItemInfoByIndex(nItemIdx);
	if check_item_valid(nG, nD, nP, 0) ~= 1 then
		return
	end

	local nMapId = GetWorldPos();
	if nMapId ~= GetTask(TASKID_TONG_ACTIVITY_MAP) then
		Msg2Player("V�t ph�m ch� ���c s� d�ng trong khu v�c ho�t ��ng bang");
		return
	end

	if nP == 31234 then
		--�����ر�ͼ��ֱ�ӳ齱
		do_give_award(nItemIdx);
		return
	end

	--�ر�ͼ��Ƭ����ʾ����Ƿ�ϳ�
	local tMsg = {
		format("D�ng M�nh T�ng B�o �� h�p th�nh T�ng B�o ��/#merge_pieces(%d)", nItemIdx),
		format("Kh�ng, ta mu�n tr�c ti�p ��i th��ng/#do_give_award(%d)", nItemIdx),
	}
	Say("D�ng M�nh T�ng B�o �� h�p th�nh T�ng B�o �� ho�n ch�nh r�i s� d�ng s� c� c� h�i nh�n ���c ph�n th��ng t�t h�n, ��ng � h�p th�nh?",
		getn(tMsg),
		tMsg);
end
