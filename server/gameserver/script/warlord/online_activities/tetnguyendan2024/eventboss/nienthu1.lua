Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\warlord\\preload.lua");
--thanhdz
--5/12/2019

function OnDeath(nNpcIndex)
	--local nValue= GetUnitCurStates(nNpcIndex, 1) or 1;
	--local nMapID,nX,nY = GetNpcWorldPos(nNpcIndex)
	local tbAward={
		{ tbProp = { 2, 1, 31194 }, nStack = 1, nStatus = ITEMSTATUS_TRADE }, -- Thanh Long hån
		{ tbProp = { 2, 1, 31681 }, nStack = 5,nStatus = ITEMSTATUS_TRADE }, -- M¶nh ®¸ 9
		{ tbProp = { 2, 1, 31248 }, nStack = 1, nStatus = ITEMSTATUS_TRADE }, -- Tô Linh QUyÕt
		{ tbProp = { 2, 1, 31615 }, nStack = 10,nStatus = ITEMSTATUS_TRADE }, --  LuyÖn L« ThiÕt Lv8
		{ tbProp = { 2, 1, 31614 }, nStack = 10,nStatus = ITEMSTATUS_TRADE }, --TÈy T©m Th¹ch Lv8
		{ tbProp = { 2, 1, 40137 }, nStack = 500,nStatus = ITEMSTATUS_TRADE}, -- Bot Tran Chau Tinh Anh
		{ tbProp = { 2, 1, 40046 }, nStack = 10, nStatus = ITEMSTATUS_TRADE }, -- M¶nh Tïy BiÕn Ch©u 7
		{ tbProp = { 2, 102, 225 }, nStack = 1, nStatus = ITEMSTATUS_TRADE }, -- Th­¬ng h¶i Di ch©u 7
		{ tbProp = { 2, 1, 31239 }, nStack = 1, nStatus = ITEMSTATUS_TRADE }, -- Linh Ph¸ch §¬n

		{ tbProp = { 2, 95, 204 }, nStack = 1, nStatus = ITEMSTATUS_TRADE }, -- Thiªn Cang lÖnh
		{ tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = ITEMSTATUS_TRADE }, -- Thiªn m«n Kim LÖnh
		{
			{ tbProp = { 2, 1, 31761 }, nStack = 1, nRate = 25, nStatus = ITEMSTATUS_TRADE }, -- TÈy t©m 9
			{ tbProp = { 2, 1, 31762 }, nStack = 1, nRate = 25, nStatus = ITEMSTATUS_TRADE }, -- LuyÖn l« 9
			{ tbProp = { 2, 1, 31675 }, nStack = 1, nRate = 50,nStatus = ITEMSTATUS_TRADE }, -- ThÇn ¦ng Hån
		},
	}
	WAward:Give(tbAward, format("%s_%d", "boss2024", 1));

end