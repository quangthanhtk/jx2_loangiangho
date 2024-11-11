--½Å±¾¹¦ÄÜ£ºÊ¦ÃÅNPCÕûºÏ-ÊÛÂô
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2011-4-2
--ÐÞ¸Ä¼ÇÂ¼£º
--¶Ò»»Ñ¡ÏîºÍÖ÷¶Ô»°·µ»Ø
Include("\\script\\faction\\faction_head.lua")
Import("\\settings\\static_script\\lib\\item_define.lua")

function faction_buysell_main(nFactionId)
	local tSay = {
		"Ta muèn mua mét sè vËt dông./#normal_buy("..nFactionId..")",
		"Ta nghe nãi s­ m«n cã 1 thÇn binh b¶o gi¸p thÝch hîp víi giang hå t©n thñ? Ta muèn xem xem nh­ thÕ nµo./#faction_buy("..nFactionId..",2)",
		"Ta nghe nãi s­ m«n cã 1 bé thÇn binh b¶o gi¸p giµnh cho vâ l©m cao thñ? H·y cho ta xem!/#faction_buy("..nFactionId..",3)",
		"Ta nghe nãi s­ m«n cã 1 bé thÇn binh b¶o gi¸p giµnh cho tuyÖt thÕ cao thñ? H·y cho ta xem!/#faction_buy("..nFactionId..",4)",
		"Lµm thÕ nµo ®Ó nhËn ®­îc ®é cèng hiÕn s­ m«n./#contribution_get("..nFactionId..")",
	}
	if FT_RELEASE_WORK == 1 then
		tinsert(tSay, format("§æi Trang BÞ S¸t Tinh/#fp_buy_equip(%d)", nFactionId) )
--		tinsert(tSay, format("ÎÒÒª¶Ò»»3¼¶¿Ì°å/#fp_buy_armory(%d)", nFactionId) )
		tinsert(tSay, format("§æi Danh Väng S­ M«n/#fp_buy_fp(%d)", nFactionId) )
	end

	tinsert(tSay, "Rêi khái./cancel")

	return 
	format("<color=green>%s<color>:".."VÞ %s nµy, t×m ta cã viÖc g× kh«ng?",GetTargetNpcName(),TPLAYER_SEX_NAME[GetSex()]),
	tSay
end
--ÆÕÍ¨¹ºÂò
function normal_buy(nFactionId)
	Sale(TFACTION_INFO[nFactionId].tShopId[1])
end
--Ê¦ÃÅ×°±¸¹ºÂò
function faction_buy(nFactionId,nShopStep)
	if GetPlayerFaction() ~= nFactionId then
		Say(format("<color=green>%s<color>#Ng­¬i kh«ng ph¶i ®Ö tö %s ta, sao cã thÓ mua mËt tÞch cña bæ m«n ®­îc?",GetTargetNpcName(),TFACTION_INFO[nFactionId].sFactionName),0)
		return
	else
		Sale(TFACTION_INFO[nFactionId].tShopId[nShopStep])
	end
end
--Ê¦ÃÅ¹±Ï×¶ÈÌáÐÑ
function contribution_get(nFactionId)
	local sDiaHead = format("<color=green>%s<color>#%s nªn quay vÒ t×m ch­ëng m«n quý ph¸i ®Ó nhËn nhiÖm vô s­ m«n, hoµn thµnh cã thÓ nhËn ®­îc <color=red>§iÓm cèng hiÕn s­ m«n<color>.",GetTargetNpcName(),TPLAYER_SEX_NAME[GetSex()])
	if GetPlayerFaction() == nFactionId then
		sDiaHead = format("<color=green>%s<color>#®Õn t×m ch­ëng m«n bæn ph¸i ®Ó nhËn nhiÖm vô s­ m«n, hoµn thµnh cã thÓ nhËn ®­îc <color=red>§iÓm cèng hiÕn s­ m«n<color>#",GetTargetNpcName(),TPLAYER_SEX_NAME[GetSex()])
	end
	Say(sDiaHead,
		2,
		"Trë l¹i./main",
		"Rêi khái./cancel"
	)
end
--½áÊø¶Ô»°
function cancel()
end

T_PRESTIGE_EXCHANGE_EQUIP_CONFIG ={
	-- Ô­Ê¼×°±¸						   --¶Ò»»µÀ¾ß{g,d,p,name,nBind,Ê¦ÃÅÍþÍûÏûºÄ},
	-- [gf_PackItemGDP(0, 7, 30896)] = {2, 1, 31313, "É±ÐÇÁîÅÆ£¨Í·£©", 1, 3500000},
}
T_PRESTIGE_EXCHANGE_ARMORY_CONFIG ={
	-- Ô­Ê¼×°±¸						   --¶Ò»»µÀ¾ß{g,d,p,name,nBind,Ê¦ÃÅÍþÍûÏûºÄ,ÎÆÊÎÆ·¼¶ÒªÇó},
	-- [gf_PackItemGDP(0, 116, 20)] = {2, 1, 31261, "3¼¶±ä»»Í·²¿¿Ì°å", 1, 540000, 3},
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
		Say(format("<color=green>%s<color>#Ng­¬i kh«ng ph¶i ®Ö tö %s ta, sao cã thÓ mua mËt tÞch cña bæ m«n ®­îc?",GetTargetNpcName(),TFACTION_INFO[nFactionId].sFactionName),0)
		return
	end
	local tSay = {
		format("§æi S¸t Tinh LÖnh Bµi (Vò KhÝ)/#_fp_buy_equip(%d)", itempart_weapon),
		format("§æi S¸t Tinh LÖnh Bµi (§Çu)/#_fp_buy_equip(%d)", itempart_head),
		format("§æi S¸t Tinh LÖnh Bµi (¸o)/#_fp_buy_equip(%d)", itempart_body),
		format("§æi S¸t Tinh LÖnh Bµi (QuÇn)/#_fp_buy_equip(%d)", itempart_foot),
		format("§æi S¸t Tinh LÖnh Bµi (Trang Søc)/#_fp_buy_equip(%d)", itempart_ring),
		"Rêi khái./cancel"
	}
	Say(format("<color=green>%s<color>: H·y n©ng cÊp hoÆc ®æi %s cÇn thiÕt vµ mÆc lªn ng­êi (Trang søc cÇn ®eo vµo vÞ trÝ sè 1)", 
		GetTargetNpcName(),
		"<color=yellow>Trang BÞ Âm HuyÕt<color>"),
	getn(tSay),
	tSay);
end

function fp_buy_armory(nFactionId)
	if GetPlayerFaction() ~= nFactionId then
		Say(format("<color=green>%s<color>#Ng­¬i kh«ng ph¶i ®Ö tö %s ta, sao cã thÓ mua mËt tÞch cña bæ m«n ®­îc?",GetTargetNpcName(),TFACTION_INFO[nFactionId].sFactionName),0)
		return
	end
	local tSay = {
		format("§æi Kh¾c B¶n Hoµn Mü CÊp 3 (§Çu)/#_fp_buy_equip(%d)", itempart_armory_head),
		format("§æi Kh¾c B¶n Hoµn Mü CÊp 3 (¸o)/#_fp_buy_equip(%d)", itempart_armory_body),
		format("§æi Kh¾c B¶n Hoµn Mü CÊp 3 (QuÇn)/#_fp_buy_equip(%d)", itempart_armory_foot),
		format("§æi Kh¾c B¶n Hoµn Mü CÊp 3 (NhÉn)/#_fp_buy_equip(%d)", itempart_armory_ring1),
		format("§æi Kh¾c B¶n Hoµn Mü CÊp 3 (Ngäc Béi)/#_fp_buy_equip(%d)", itempart_armory_ring2),
		"Rêi khái./cancel"
	}
	Say(format("<color=green>%s<color>: H·y n©ng cÊp hoÆc ®æi %s cÇn thiÕt vµ mÆc lªn ng­êi (Trang søc cÇn ®eo vµo vÞ trÝ sè 1)", 
		GetTargetNpcName(),
		"<color=yellow>Hoa V¨n Hoµn Mü CÊp 2<color>"),
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
		--ÎÆÊÎ
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
		Talk(1,"",format("<color=green>%s<color>: H·y n©ng cÊp hoÆc ®æi %s cÇn thiÕt vµ mÆc lªn ng­êi (Trang søc cÇn ®eo vµo vÞ trÝ sè 1)",
			GetTargetNpcName(),
			"Trang bÞ"));
		return
	end

	local g, d, p = GetItemInfoByIndex(nItemIdx);
	local nGDP = gf_PackItemGDP(g, d, p);
	local tExchange = tConfig[nGDP] or nil

	if not tExchange then
		Talk(1,"",format("<color=green>%s<color>: H·y n©ng cÊp hoÆc ®æi %s cÇn thiÕt vµ mÆc lªn ng­êi (Trang søc cÇn ®eo vµo vÞ trÝ sè 1)",
			GetTargetNpcName(),
			"Trang bÞ"));
		return
	end

	local nFpCost = tExchange[6]
	local nG, nD, nP = tExchange[1], tExchange[2], tExchange[3]
	local nBind = tExchange[5]
	if GetTask(TASKID_NFT_FACTION_PRESTIGE) < nFpCost then
		Talk(1,"",format("Danh Väng S­ M«n ch­a ®ñ %d",nFpCost));
		return
	end

	if bIsArmory == 1 and GetArmoryQuality(nItemIdx) ~= tExchange[7] then
		Talk(1,"",format("Hoa V¨n ®ang dïng ch­a ®¹t phÈm chÊt yªu cÇu")); 
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
			format("§ång ý/#_fp_buy_equip(%d,%d)", nEquipPart, 1),
			format("Ph¶n håi/%s", szBack)
		}
		Say(format("<color=green>%s<color>: Dïng <color=red>%s x%d + %s x%d<color> ®æi <color=yellow>%s x%d<color>".."(Chó ý: <color=red>Kh«ng gi÷ l¹i cÊp c­êng hãa vµ cÊp b¶o th¹ch cña trang bÞ gèc<color>)", 
				GetTargetNpcName(),
				GetItemName(g,d,p),
				1,
				"Danh Väng S­ M«n",
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
		Talk(1,"",format("§¹o cô bÞ lçi"));
		return
	end

	if gf_Modify("ShiMenWeiWang", -nFpCost) ~= 1 then
		Talk(1,"",format("Danh Väng S­ M«n ch­a ®ñ %d",nFpCost));
		return
	end

	gf_AddItemEx({nG,nD,nP,1, nBind>0 and 4 or nil})
	gf_SetLogCaption("")
end

TASKID_FP_DAILY_EXCHANGE_FP_BYTE 	= 3605	--ÈÕÇå£º·ÖbyteÓÃ ¼ÇÂ¼Ã¿ÈÕµÀ¾ß¶Ò»»Ê¦ÃÅÍþÍû´ÎÊý

T_EXCHANGE_PRESTIGE_CONFIG = {
	--[]={{gdpn}, 		Ê¦ÃÅÍþÍû, Ã¿ÈÕÏÞÖÆ´ÎÊý(<=255), Ã¿ÈÕÒÑ¶Ò»»´ÎÊýtaskid, byteÎ»(<=4)}
	[1] = {{2,95,204, 1}, 60000, 1, TASKID_FP_DAILY_EXCHANGE_FP_BYTE, 1},
	[2] = {{2,1,30370,1}, 60000, 1, TASKID_FP_DAILY_EXCHANGE_FP_BYTE, 2},
}

function fp_buy_fp(nFactionId)
	if GetPlayerFaction() ~= nFactionId then
		Say(format("<color=green>%s<color>#Ng­¬i kh«ng ph¶i ®Ö tö %s ta, sao cã thÓ mua mËt tÞch cña bæ m«n ®­îc?",GetTargetNpcName(),TFACTION_INFO[nFactionId].sFactionName),0)
		return
	end
	local tSay = {
		--format("%sx%d¶Ò»»%dÊ¦ÃÅÍþÍû(Ã¿ÈÕ%d/%d)/#_fp_buy_fp(%d)", ...),
	}
	local tInfo = nil
	for i=1,getn(T_EXCHANGE_PRESTIGE_CONFIG) do
		tInfo = T_EXCHANGE_PRESTIGE_CONFIG[i]
		tinsert(tSay, format("%s x%d ®æi %d Danh Väng S­ M«n (Mçi ngµy: %d/%d)/#_fp_buy_fp(%d)",
			GetItemName(tInfo[1][1],tInfo[1][2],tInfo[1][3]),
			tInfo[1][4],
			tInfo[2],
			gf_SafeGetTaskByte(tInfo[4], tInfo[5]),
			tInfo[3],
			i)
		)
	end
	tinsert(tSay, "Rêi khái./cancel")

	Say(format("<color=green>%s<color>: H·y lùa chän ph­¬ng thøc ®æi:", 
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
		Talk(1,"","§· hÕt l­ît ®æi h«m nay, ngµy mai thö l¹i sau.")
		return
	end

	if GetTask(TASKID_NFT_FACTION_PRESTIGE) + tInfo[2] > G_N_FACTION_PRESTIGE_MAX then
		Talk(1,"","Danh Väng S­ M«n ®· hoÆc s¾p ®¹t møc tèi ®a, kh«ng thÓ ®æi n÷a.")
		return
	end

	if not bConfirm or bConfirm ~= 1 then
		local tSay = {
			format("§ång ý/#_fp_buy_fp(%d,%d)", nType, 1),
			format("trë l¹i/#fp_buy_fp(%d)", GetPlayerFaction())
		}

		Say(format("<color=green>%s<color>: Dïng <color=red>%s x%d<color> ®æi <color=yellow>%s x%d<color>", 
				GetTargetNpcName(),
				GetItemName(tInfo[1][1],tInfo[1][2],tInfo[1][3]),
				tInfo[1][4],
				"Danh Väng S­ M«n",
				tInfo[2]),
			getn(tSay),
			tSay);
		return
	end

	gf_SetLogCaption("PAY_ITEM_BUY_FACTION_PRESTIGE")

	if gf_DelItem(tInfo[1][1],tInfo[1][2],tInfo[1][3],tInfo[1][4]) ~= 1 then
		Talk(1,"","Kh«ng ®ñ vËt phÈm")
		return
	end

	gf_SafeSetTaskByte(tInfo[4], tInfo[5], nCurCount + 1)
	gf_Modify("ShiMenWeiWang", tInfo[2])
	gf_SetLogCaption("")

	fp_buy_fp(GetPlayerFaction())
end