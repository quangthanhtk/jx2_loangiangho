Include("\\script\\online_activites\\201506cn\\head.lua")

tItemCfg = {
	[pack_item_id(2,1,30872)] = 2,--���������
	[pack_item_id(2,1,30873)] = 3,--Բ�������
}

function OnUse(nItemIndex)
	local g,d,p = GetItemInfoByIndex(nItemIndex)
	local nAwardIndex = tItemCfg[pack_item_id(g,d,p)]
	if not nAwardIndex then
		return 0;
	end
	if check_player_condition()~= 1 then
		return
	end
	if gf_Judge_Room_Weight(2,100,"") ~= 1 then 
		return 0;
	end
	
	local tAward = g_t201506cn.tMainAward[nAwardIndex]
	if get_task(nAwardIndex-1) >= tAward.nMaxCnt then
		Talk(1, "", "S� l�n s� d�ng �� ��t gi�i h�n")
		return
	end
	if DelItemByIndex(nItemIndex, 1) ~= 1 then
		return 0
	end
	gf_EventGiveAllAward(tAward.tAll, "Ho�t ��ng �oan Ng�", "1506cn")
	gf_EventGiveRandAward(tAward.tRand, 10000, 1, "Ho�t ��ng �oan Ng�", "1506cn")

	add_task(nAwardIndex-1)
end