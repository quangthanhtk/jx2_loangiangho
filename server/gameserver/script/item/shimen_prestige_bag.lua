Import("\\script\\lib\\globalfunctions.lua")

--gdp：

TASKID_DAILY_SPB_USE_COUNT 		= 3606	--日清：记录每日使用次数

N_SPB_DAILY_USE_COUNT_LIMIT 	= 16	--每日使用上限
N_SPB_FACTION_PRESTIGE_PER_BAG 	= 3400	--每包师门威望


function OnUse(nItemIdx)
	if GetTask(TASKID_NFT_FACTION_PRESTIGE) + N_SPB_FACTION_PRESTIGE_PER_BAG > G_N_FACTION_PRESTIGE_MAX then
		Talk(1,"","Danh V鋘g S� M玭  ho芻 s緋 t m鴆 t鑙 產, kh玭g th� i n鱝.")
		return
	end

	if GetTask(TASKID_DAILY_SPB_USE_COUNT) >= N_SPB_DAILY_USE_COUNT_LIMIT then
		Talk(1,"","Х h誸 lt i h玬 nay, ng祔 mai th� l筰 sau.")
		return
	end

	gf_SetLogCaption("OPEN_PRESTIGE_BAG")

	if gf_DelItemByIndex(nItemIdx, 1) ~= 1 then
		Talk(1,"",format("Чo c� b� l鏸"))
		return
	end

	gf_ModifyTask(TASKID_DAILY_SPB_USE_COUNT, 1)
	gf_Modify("ShiMenWeiWang", N_SPB_FACTION_PRESTIGE_PER_BAG)
	gf_SetLogCaption("")
end

function nothing()
end