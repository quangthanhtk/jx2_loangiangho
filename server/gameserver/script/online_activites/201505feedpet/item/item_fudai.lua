--����
Include("\\script\\online_activites\\201505feedpet\\head.lua")

tFuDaiCfg = {
	{1,15, "Th�t C� T��i", {2,1,30837,1},0},
	{1,15, "��i Heo Th�m Ngon", {2,1,30838,1},0},
	{1,40, "T� C�u", {2,1,30839,1},0},
	{1,30, "Th�c �n H�t H�n", {2,1,30840,1},0},
}
function OnUse(nItemIdx)
	if check_player_condition()~= 1 then
		return
	end
	if gf_Judge_Room_Weight(2,100,"") ~= 1 then 
		return 0;
	end
	local nUsedCnt = get_task(g_tFeedPet.nTaskIdx_FuDaiCount)
	if  nUsedCnt >= g_tFeedPet.nMaxUseFuDaiOneDay then
		Talk(1,"",format("S� l�n s� d�ng c�a h�m nay �� ��t gi�i h�n!"))
		return
	end
	if DelItemByIndex(nItemIdx, 1)==1 then
		gf_EventGiveRandAward(tFuDaiCfg,100,1, "feedpet201505", "feedpet201505")
		set_task(g_tFeedPet.nTaskIdx_FuDaiCount, nUsedCnt+1)
	end
end