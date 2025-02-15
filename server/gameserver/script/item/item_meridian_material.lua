Import("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\lib\\normal_exchange.lua")

t_exchange =	{
	free = gtNormalExchange:new(), --1经脉铜人+ 1小银块->fail
	ib = gtNormalExchange:new(), --3经脉铜人+ 1银锭
}
t_exchange.free.tConsume = {
	{"Kinh M筩h уng Nh﹏",2,1,30730,1},
	{"Kh鑙 ng﹏ nh�",2,1,31012,1},
}
t_exchange.free.nRate = 33
t_exchange.free.tAward = {
	{"Kinh M筩h Ng﹏ Nh﹏",2,1,30731,1},
}
t_exchange.free.tAward2 = {}

t_exchange.ib.tConsume = {
	{"Kinh M筩h уng Nh﹏",2,1,30730,3},
	{"Ng﹏ кnh",2,1,31013,1},
}
t_exchange.ib.tAward = t_exchange.free.tAward
function exchangeYinRen(szType, szName)
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("H� th鑞g kinh m筩h v蒼 ch璦 khai th玭g"))
		return 0
	end
	if not szType then
		local tbSay = {}
		local szTitle = format("%s:%s", szName, "D飊g c竎h n祇  gh衟 Kinh M筩h Ng﹏ Nh﹏?")
		tinsert(tbSay, format("%s/#exchangeYinRen('free', '%s')", "D飊g kh鑙 ng﹏ nh�  gh衟", szName))
		tinsert(tbSay, format("%s/#exchangeYinRen('ib', '%s')", "D飊g Ng﹏ кnh  gh衟", szName))
		tinsert(tbSay, "Ta ch� gh� ch琲/no")
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