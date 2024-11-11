--��ϯ
Include("\\script\\online_activites\\201505feedpet\\head.lua")
Include("\\script\\online_activites\\201505feedpet\\timer.lua")

m_szNpcName ="M�m c�"
function main()
	if check_player_condition()~= 1 then
		return
	end
	local nTime = tonumber(date("%H%M"))
	if g_debug~=1 and (not (1900 <= nTime and nTime < 2100)) then
		Talk(1,"","Th�i gian c�a ho�t ��ng y�n ti�c b�t ��u v�o 19:00-21:00 h�ng ng�y")
		return 0
	end
	
	local szTitle = format("%s:%s", m_szNpcName, "Y�n ti�c �� b�t ��u r�i, m�i nh�p ti�c")
	local tbSay = {}
	tinsert(tbSay, format("%s/#do_eat(%d)", "Ta mu�n u�ng r��u", 1))
	tinsert(tbSay, format("%s/#do_eat(%d)", "Ta kh�ng u�ng r��u", 0))
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function do_eat(bDrink)
	local nMulti = get_task(g_tFeedPet.nTaskIdx_ExpGetMulti)
	if nMulti > 0 then
		Talk(1,"","H�m nay c�c h� �� �n ti�c r�i, ng�y mai h�y quay l�i")
		return
	end
	local nExpLeftCnt = get_task(g_tFeedPet.nTaskIdx_ExpGetCnt)
	if nExpLeftCnt > 0 then
		return
	end
	local t = g_tFeedPet.tDrink
	local tt = t[2]
	if bDrink == 1 then
		local nItemCnt = GetItemCount(tt[1],tt[2], tt[3])
		local nMax = min(nItemCnt, g_tFeedPet.nMaxUseDrinkOneDay)
		if nMax > 0 then
			AskClientForNumber("_start_extra_eat", 1, nMax, "H�y nh�p s� l��ng v�o")
		else
			Talk(1,"","H�nh nh� c�c h� qu�n mang theo r��u r�i, h�y ki�m tra l�i n�o")
		end
	else
		_start_extra_eat(0)
	end
end

function _start_extra_eat(nDrink)
	nDrink = min(nDrink,g_tFeedPet.nMaxUseDrinkOneDay)
	_start_eat(nDrink+1)
end

function _start_eat(nDrink)
	local t = g_tFeedPet.tDrink
	local tt = t[2]
	---Test---
	if nDrink <= 1 then
		Talk(1,"","H�nh nh� c�c h� qu�n mang theo r��u r�i, h�y ki�m tra l�i n�o")
		return
	end
	---------
	if nDrink > 1 and DelItem(tt[1],tt[2], tt[3], nDrink-1) ~= 1 then
		Talk(1,"","H�nh nh� c�c h� qu�n mang theo r��u r�i, h�y ki�m tra l�i n�o")
		return
	end
	set_task(g_tFeedPet.nTaskIdx_ExpGetCnt, g_tFeedPet.nMaxGetExpOneDay)
	set_task(g_tFeedPet.nTaskIdx_ExpGetMulti, nDrink)
	create_timer()
	local szMsg = "C�c h� b�t ��u nh�p ti�c n�o, nh� r�ng ��ng r�i kh�i b�n ti�c qu� xa nh�!"
	Talk(1,"",szMsg)
	Msg2Player(szMsg)
end
