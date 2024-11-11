Import("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\lib\\normal_exchange.lua")

t_exchange =	{
	free = gtNormalExchange:new(), --1����ͭ��+ 1С����->fail
	ib = gtNormalExchange:new(), --3����ͭ��+ 1����
}
t_exchange.free.tConsume = {
	{"Kinh M�ch ��ng Nh�n",2,1,30730,1},
	{"Kh�i ng�n nh�",2,1,31012,1},
}
t_exchange.free.nRate = 33
t_exchange.free.tAward = {
	{"Kinh M�ch Ng�n Nh�n",2,1,30731,1},
}
t_exchange.free.tAward2 = {}

t_exchange.ib.tConsume = {
	{"Kinh M�ch ��ng Nh�n",2,1,30730,3},
	{"Ng�n ��nh",2,1,31013,1},
}
t_exchange.ib.tAward = t_exchange.free.tAward
function exchangeYinRen(szType, szName)
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("H� th�ng kinh m�ch v�n ch�a khai th�ng"))
		return 0
	end
	if not szType then
		local tbSay = {}
		local szTitle = format("%s:%s", szName, "D�ng c�ch n�o �� gh�p Kinh M�ch Ng�n Nh�n?")
		tinsert(tbSay, format("%s/#exchangeYinRen('free', '%s')", "D�ng kh�i ng�n nh� �� gh�p", szName))
		tinsert(tbSay, format("%s/#exchangeYinRen('ib', '%s')", "D�ng Ng�n ��nh �� gh�p", szName))
		tinsert(tbSay, "Ta ch� gh� ch�i/no")
		Say(szTitle, getn(tbSay), tbSay)
		return
	end
	local tExchg = t_exchange[szType]
	if tExchg then
		tExchg:npc_talk_main(szName, 1)
	end
end

function OnUse(nIndex)
	local szName = GetItemName(nIndex)
	exchangeYinRen(nil, szName)
end