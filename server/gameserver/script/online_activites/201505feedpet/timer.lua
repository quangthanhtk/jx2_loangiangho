Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\201505feedpet\\head.lua")

TRIGGER_ID = 1544
function on_timer()
	do return remove_timer() end
	local nExpLeftCnt = get_task(g_tFeedPet.nTaskIdx_ExpGetCnt)
	if nExpLeftCnt <= 0 then
		remove_timer()
		return
	end
	local nMulti = get_task(g_tFeedPet.nTaskIdx_ExpGetMulti)
	if nMulti <= 0 then
		remove_timer()
		return
	end
	local nExp = nMulti * 100000
	local nMap,nX,nY = GetWorldPos()
	local t = g_tFeedPet.tJiuXi
	local bAddExp = 0
	for i=1,getn(t) do
		local tt = t[i]
		if tt[3] == nMap and gf_GetDistance(tt[4], tt[5], nX, nY) <= 18 then
			bAddExp = 1
			gf_ModifyExp(nExp)
			break
		end
	end
	if bAddExp==0 then
		Msg2Player("C�ch b�n ti�c qu� xa, nh�n th��ng l�n n�y th�t b�i")
	end
	nExpLeftCnt = nExpLeftCnt - 1 
	set_task(g_tFeedPet.nTaskIdx_ExpGetCnt, nExpLeftCnt)
	if nExpLeftCnt <= 0 then
		local szMsg = format("%s:%s", "M�m c�","Ch�c m�ng c�c h� �� �n u�ng no n�, ng�y mai h�y quay l�i")
		Talk(1, "", szMsg)
		Msg2Player(szMsg)
		remove_timer()
		return
	end
end

function remove_timer()
	RemoveTrigger(GetTrigger(TRIGGER_ID*2))
end

function create_timer()
	local nTrigger = CreateTrigger(1, TRIGGER_ID, TRIGGER_ID*2)
	ContinueTimer(nTrigger)
end