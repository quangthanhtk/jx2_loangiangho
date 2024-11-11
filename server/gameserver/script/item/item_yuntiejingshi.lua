-- 1������ʯ+1С��ʯ = 1�ƾ�ʯ
Include("\\settings\\static_script\\lib\\normal_exchange.lua")

T_ExchangePojingshi = gtNormalExchange:new()
T_ExchangePojingshi.tConsume = {
	{"Ti�u Tinh Th�ch", 2	, 1, 30949, 1},
	{"Thi�n Th�ch Tinh Th�ch", 2	, 1, 1009, 1},
}
T_ExchangePojingshi.tAward = {
	{"Ph� Tinh Th�ch", 2	, 1, 30950, 1},
}
T_ExchangePojingshi.nBatchExchange = 10

function OnUse(nIndex)
	talk_compose_pojingshi(GetItemName(nIndex))
end

function talk_compose_pojingshi(szNpcName, bConfirm)
	if not bConfirm or bConfirm ~= 1 then
		local szTitle = format("<color=gold>%s<color>:%s",szNpcName, "Mu�n gh�p Ph� Tinh Th�ch sao? Ph� Tinh Th�ch l� nguy�n li�u c�n �� c��ng h�a c�p 16-20")
    	local tbSay = {}
    	tinsert(tbSay, format("%s/#talk_compose_pojingshi('%s', 1)", "Gh�p Ph� Tinh Th�ch", szNpcName))
    	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
    	Say(szTitle, getn(tbSay), tbSay)
	else
		T_ExchangePojingshi:npc_talk_main(szNpcName, 1)
	end
end