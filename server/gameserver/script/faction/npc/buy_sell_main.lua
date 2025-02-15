--脚本功能：师门NPC整合-售卖
--功能开发：村长
--开发时间：2011-4-2
--修改记录：
--兑换选项和主对话返回
Include("\\script\\faction\\faction_head.lua")
Import("\\settings\\static_script\\lib\\item_define.lua")

function faction_buysell_main(nFactionId)
	local tSay = {
		"Ta mu鑞 mua m閠 s� v藅 d鬾g./#normal_buy("..nFactionId..")",
		"Ta nghe n鉯 s� m玭 c� 1 th莕 binh b秓 gi竝 th輈h h頿 v韎 giang h� t﹏ th�? Ta mu鑞 xem xem nh� th� n祇./#faction_buy("..nFactionId..",2)",
		"Ta nghe n鉯 s� m玭 c� 1 b� th莕 binh b秓 gi竝 gi祅h cho v� l﹎ cao th�? H穣 cho ta xem!/#faction_buy("..nFactionId..",3)",
		"Ta nghe n鉯 s� m玭 c� 1 b� th莕 binh b秓 gi竝 gi祅h cho tuy謙 th� cao th�? H穣 cho ta xem!/#faction_buy("..nFactionId..",4)",
		"L祄 th� n祇  nh薾 頲  c鑞g hi課 s� m玭./#contribution_get("..nFactionId..")",
	}
	if FT_RELEASE_WORK == 1 then
		tinsert(tSay, format("фi Trang B� S竧 Tinh/#fp_buy_equip(%d)", nFactionId) )
--		tinsert(tSay, format("我要兑换3级刻板/#fp_buy_armory(%d)", nFactionId) )
		tinsert(tSay, format("фi Danh V鋘g S� M玭/#fp_buy_fp(%d)", nFactionId) )
	end

	tinsert(tSay, "R阨 kh醝./cancel")

	return 
	format("<color=green>%s<color>:".."V� %s n祔, t譵 ta c� vi謈 g� kh玭g?",GetTargetNpcName(),TPLAYER_SEX_NAME[GetSex()]),
	tSay
end
--普通购买
function normal_buy(nFactionId)
	Sale(TFACTION_INFO[nFactionId].tShopId[1])
end
--师门装备购买
function faction_buy(nFactionId,nShopStep)
	if GetPlayerFaction() ~= nFactionId then
		Say(format("<color=green>%s<color>#Ngi kh玭g ph秈  t� %s ta, sao c� th� mua m藅 t辌h c馻 b� m玭 頲?",GetTargetNpcName(),TFACTION_INFO[nFactionId].sFactionName),0)
		return
	else
		Sale(TFACTION_INFO[nFactionId].tShopId[nShopStep])
	end
end
--师门贡献度提醒
function contribution_get(nFactionId)
	local sDiaHead = format("<color=green>%s<color>#%s n猲 quay v� t譵 chng m玭 qu� ph竔  nh薾 nhi謒 v� s� m玭, ho祅 th祅h c� th� nh薾 頲 <color=red>觤 c鑞g hi課 s� m玭<color>.",GetTargetNpcName(),TPLAYER_SEX_NAME[GetSex()])
	if GetPlayerFaction() == nFactionId then
		sDiaHead = format("<color=green>%s<color>#n t譵 chng m玭 b鎛 ph竔  nh薾 nhi謒 v� s� m玭, ho祅 th祅h c� th� nh薾 頲 <color=red>觤 c鑞g hi課 s� m玭<color>#",GetTargetNpcName(),TPLAYER_SEX_NAME[GetSex()])
	end
	Say(sDiaHead,
		2,
		"Tr� l筰./main",
		"R阨 kh醝./cancel"
	)
end
--结束对话
function cancel()
end

T_PRESTIGE_EXCHANGE_EQUIP_CONFIG ={
	-- 原始装备						   --兑换道具{g,d,p,name,nBind,师门威望消耗},
	-- [gf_PackItemGDP(0, 7, 30896)] = {2, 1, 31313, "杀星令牌（头）", 1, 3500000},
}
T_PRESTIGE_EXCHANGE_ARMORY_CONFIG ={
	-- 原始装备						   --兑换道具{g,d,p,name,nBind,师门威望消耗,纹饰品级要求},
	-- [gf_PackItemGDP(0, 116, 20)] = {2, 1, 31261, "3级变换头部刻板", 1, 540000, 3},
}

function _fp_init_prestige_exchange_config()
	local szConfigPath = "\\settings\\item\\exchange\\faction_prestige_equip.txt"
	local tConfig = ff_GetTabFileTableEx(szConfigPath,2)
	local tConfig = gf_TableNumberElementToNumber(tConfig)

	for i=1, getn(tConfig) do
		tinsert(
			T_PRESTIGE_EXCHANGE_EQUIP_CONFIG, 
			gf_PackItemGDP(tConfig[i]["G"], tConfig[i]["D"], tConfig[i]["P"]),
			{
				tConfig[i]["tG"],
				tConfig[i]["tD"],
				tConfig[i]["tP"],
				GetItemName(tConfig[i]["tG"], tConfig[i]["tD"], tConfig[i]["tP"]),
				tConfig[i]["tBind"],
				tConfig[i]["CostPrestige"],
			}
		)
	end
	T_PRESTIGE_EXCHANGE_EQUIP_CONFIG.n = nil

	szConfigPath = "\\settings\\item\\exchange\\faction_prestige_armory.txt"
	tConfig = ff_GetTabFileTableEx(szConfigPath,2)
	tConfig = gf_TableNumberElementToNumber(tConfig)

	for i=1, getn(tConfig) do
		tinsert(
			T_PRESTIGE_EXCHANGE_ARMORY_CONFIG, 
			gf_PackItemGDP(tConfig[i]["G"], tConfig[i]["D"], tConfig[i]["P"]),
			{
				tConfig[i]["tG"],
				tConfig[i]["tD"],
				tConfig[i]["tP"],
				GetItemName(tConfig[i]["tG"], tConfig[i]["tD"], tConfig[i]["tP"]),
				tConfig[i]["tBind"],
				tConfig[i]["CostPrestige"],
				tConfig[i]["Quality"],
			}
		)
	end
	T_PRESTIGE_EXCHANGE_ARMORY_CONFIG.n = nil
end

_fp_init_prestige_exchange_config()

function fp_buy_equip(nFactionId)
	if GetPlayerFaction() ~= nFactionId then
		Say(format("<color=green>%s<color>#Ngi kh玭g ph秈  t� %s ta, sao c� th� mua m藅 t辌h c馻 b� m玭 頲?",GetTargetNpcName(),TFACTION_INFO[nFactionId].sFactionName),0)
		return
	end
	local tSay = {
		format("фi S竧 Tinh L謓h B礽 (V� Kh�)/#_fp_buy_equip(%d)", itempart_weapon),
		format("фi S竧 Tinh L謓h B礽 (u)/#_fp_buy_equip(%d)", itempart_head),
		format("фi S竧 Tinh L謓h B礽 (竜)/#_fp_buy_equip(%d)", itempart_body),
		format("фi S竧 Tinh L謓h B礽 (Qu莕)/#_fp_buy_equip(%d)", itempart_foot),
		format("фi S竧 Tinh L謓h B礽 (Trang S鴆)/#_fp_buy_equip(%d)", itempart_ring),
		"R阨 kh醝./cancel"
	}
	Say(format("<color=green>%s<color>: H穣 n﹏g c蕄 ho芻 i %s c莕 thi誸 v� m芻 l猲 ngi (Trang s鴆 c莕 甧o v祇 v� tr� s� 1)", 
		GetTargetNpcName(),
		"<color=yellow>Trang B� 耺 Huy誸<color>"),
	getn(tSay),
	tSay);
end

function fp_buy_armory(nFactionId)
	if GetPlayerFaction() ~= nFactionId then
		Say(format("<color=green>%s<color>#Ngi kh玭g ph秈  t� %s ta, sao c� th� mua m藅 t辌h c馻 b� m玭 頲?",GetTargetNpcName(),TFACTION_INFO[nFactionId].sFactionName),0)
		return
	end
	local tSay = {
		format("фi Kh綾 B秐 Ho祅 M� C蕄 3 (u)/#_fp_buy_equip(%d)", itempart_armory_head),
		format("фi Kh綾 B秐 Ho祅 M� C蕄 3 (竜)/#_fp_buy_equip(%d)", itempart_armory_body),
		format("фi Kh綾 B秐 Ho祅 M� C蕄 3 (Qu莕)/#_fp_buy_equip(%d)", itempart_armory_foot),
		format("фi Kh綾 B秐 Ho祅 M� C蕄 3 (Nh蒼)/#_fp_buy_equip(%d)", itempart_armory_ring1),
		format("фi Kh綾 B秐 Ho祅 M� C蕄 3 (Ng鋍 B閕)/#_fp_buy_equip(%d)", itempart_armory_ring2),
		"R阨 kh醝./cancel"
	}
	Say(format("<color=green>%s<color>: H穣 n﹏g c蕄 ho芻 i %s c莕 thi誸 v� m芻 l猲 ngi (Trang s鴆 c莕 甧o v祇 v� tr� s� 1)", 
		GetTargetNpcName(),
		"<color=yellow>Hoa V╪ Ho祅 M� C蕄 2<color>"),
	getn(tSay),
	tSay);
end

function _fp_buy_equip(nEquipPart, bConfirm)
	if not nEquipPart or nEquipPart < 0 then
		return
	end

	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end

	local tConfig = nil
	local bIsArmory = 0
	if itempart_armory_head <= nEquipPart and nEquipPart <= itempart_armory_ring2 then
		--纹饰
		tConfig = T_PRESTIGE_EXCHANGE_ARMORY_CONFIG
		bIsArmory = 1
	else
		tConfig = T_PRESTIGE_EXCHANGE_EQUIP_CONFIG
	end
	-- print("======tConfig = ")
	-- gf_PrintTable(tConfig)

	local nItemIdx = GetPlayerEquipIndex(nEquipPart)
	-- print("======nItemIdx =", nItemIdx)
	if not nItemIdx or nItemIdx == 0 then
		Talk(1,"",format("<color=green>%s<color>: H穣 n﹏g c蕄 ho芻 i %s c莕 thi誸 v� m芻 l猲 ngi (Trang s鴆 c莕 甧o v祇 v� tr� s� 1)",
			GetTargetNpcName(),
			"Trang b�"));
		return
	end

	local g, d, p = GetItemInfoByIndex(nItemIdx);
	local nGDP = gf_PackItemGDP(g, d, p);
	local tExchange = tConfig[nGDP] or nil

	if not tExchange then
		Talk(1,"",format("<color=green>%s<color>: H穣 n﹏g c蕄 ho芻 i %s c莕 thi誸 v� m芻 l猲 ngi (Trang s鴆 c莕 甧o v祇 v� tr� s� 1)",
			GetTargetNpcName(),
			"Trang b�"));
		return
	end

	local nFpCost = tExchange[6]
	local nG, nD, nP = tExchange[1], tExchange[2], tExchange[3]
	local nBind = tExchange[5]
	if GetTask(TASKID_NFT_FACTION_PRESTIGE) < nFpCost then
		Talk(1,"",format("Danh V鋘g S� M玭 ch璦  %d",nFpCost));
		return
	end

	if bIsArmory == 1 and GetArmoryQuality(nItemIdx) ~= tExchange[7] then
		Talk(1,"",format("Hoa V╪ 產ng d飊g ch璦 t ph萴 ch蕋 y猽 c莡")); 
		return
	end

	if not bConfirm or bConfirm ~= 1 then
		local szBack = "cancel"
		if bIsArmory == 1 then
			szBack = format("#fp_buy_armory(%d)", GetPlayerFaction())
		else
			szBack = format("#fp_buy_equip(%d)", GetPlayerFaction())
		end

		local tSay = {
			format("уng �/#_fp_buy_equip(%d,%d)", nEquipPart, 1),
			format("Ph秐 h錳/%s", szBack)
		}
		Say(format("<color=green>%s<color>: D飊g <color=red>%s x%d + %s x%d<color> i <color=yellow>%s x%d<color>".."(Ch� �: <color=red>Kh玭g gi� l筰 c蕄 cng h鉧 v� c蕄 b秓 th筩h c馻 trang b� g鑓<color>)", 
				GetTargetNpcName(),
				GetItemName(g,d,p),
				1,
				"Danh V鋘g S� M玭",
				nFpCost,
				GetItemName(nG,nD,nP),
				1
				),
			getn(tSay),
			tSay);
		return
	end

	gf_SetLogCaption("FACTION_PRESTIGE_BUY_EQUIP")

	if gf_DelItemByIndex(nItemIdx, -1) ~= 1 then
		Talk(1,"",format("Чo c� b� l鏸"));
		return
	end

	if gf_Modify("ShiMenWeiWang", -nFpCost) ~= 1 then
		Talk(1,"",format("Danh V鋘g S� M玭 ch璦  %d",nFpCost));
		return
	end

	gf_AddItemEx({nG,nD,nP,1, nBind>0 and 4 or nil})
	gf_SetLogCaption("")
end

TASKID_FP_DAILY_EXCHANGE_FP_BYTE 	= 3605	--日清：分byte用 记录每日道具兑换师门威望次数

T_EXCHANGE_PRESTIGE_CONFIG = {
	--[]={{gdpn}, 		师门威望, 每日限制次数(<=255), 每日已兑换次数taskid, byte位(<=4)}
	[1] = {{2,95,204, 1}, 60000, 1, TASKID_FP_DAILY_EXCHANGE_FP_BYTE, 1},
	[2] = {{2,1,30370,1}, 60000, 1, TASKID_FP_DAILY_EXCHANGE_FP_BYTE, 2},
}

function fp_buy_fp(nFactionId)
	if GetPlayerFaction() ~= nFactionId then
		Say(format("<color=green>%s<color>#Ngi kh玭g ph秈  t� %s ta, sao c� th� mua m藅 t辌h c馻 b� m玭 頲?",GetTargetNpcName(),TFACTION_INFO[nFactionId].sFactionName),0)
		return
	end
	local tSay = {
		--format("%sx%d兑换%d师门威望(每日%d/%d)/#_fp_buy_fp(%d)", ...),
	}
	local tInfo = nil
	for i=1,getn(T_EXCHANGE_PRESTIGE_CONFIG) do
		tInfo = T_EXCHANGE_PRESTIGE_CONFIG[i]
		tinsert(tSay, format("%s x%d i %d Danh V鋘g S� M玭 (M鏸 ng祔: %d/%d)/#_fp_buy_fp(%d)",
			GetItemName(tInfo[1][1],tInfo[1][2],tInfo[1][3]),
			tInfo[1][4],
			tInfo[2],
			gf_SafeGetTaskByte(tInfo[4], tInfo[5]),
			tInfo[3],
			i)
		)
	end
	tinsert(tSay, "R阨 kh醝./cancel")

	Say(format("<color=green>%s<color>: H穣 l鵤 ch鋘 phng th鴆 i:", 
			GetTargetNpcName()),
		getn(tSay),
		tSay);
end

function _fp_buy_fp(nType, bConfirm)
	local tInfo = T_EXCHANGE_PRESTIGE_CONFIG[nType]

	if not tInfo then
		return
	end

	local nCurCount = gf_SafeGetTaskByte(tInfo[4], tInfo[5])
	if nCurCount >= tInfo[3] then
		Talk(1,"","Х h誸 lt i h玬 nay, ng祔 mai th� l筰 sau.")
		return
	end

	if GetTask(TASKID_NFT_FACTION_PRESTIGE) + tInfo[2] > G_N_FACTION_PRESTIGE_MAX then
		Talk(1,"","Danh V鋘g S� M玭  ho芻 s緋 t m鴆 t鑙 產, kh玭g th� i n鱝.")
		return
	end

	if not bConfirm or bConfirm ~= 1 then
		local tSay = {
			format("уng �/#_fp_buy_fp(%d,%d)", nType, 1),
			format("tr� l筰/#fp_buy_fp(%d)", GetPlayerFaction())
		}

		Say(format("<color=green>%s<color>: D飊g <color=red>%s x%d<color> i <color=yellow>%s x%d<color>", 
				GetTargetNpcName(),
				GetItemName(tInfo[1][1],tInfo[1][2],tInfo[1][3]),
				tInfo[1][4],
				"Danh V鋘g S� M玭",
				tInfo[2]),
			getn(tSay),
			tSay);
		return
	end

	gf_SetLogCaption("PAY_ITEM_BUY_FACTION_PRESTIGE")

	if gf_DelItem(tInfo[1][1],tInfo[1][2],tInfo[1][3],tInfo[1][4]) ~= 1 then
		Talk(1,"","Kh玭g  v藅 ph萴")
		return
	end

	gf_SafeSetTaskByte(tInfo[4], tInfo[5], nCurCount + 1)
	gf_Modify("ShiMenWeiWang", tInfo[2])
	gf_SetLogCaption("")

	fp_buy_fp(GetPlayerFaction())
end