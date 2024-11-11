Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\warlord\\preload.lua");
--thanhdz
--5/12/2019

function OnDeath(nNpcIndex)
	--local nValue= GetUnitCurStates(nNpcIndex, 1) or 1;
	local nMapID,nX,nY = GetNpcWorldPos(nNpcIndex)

	local tbAward = {
		{ szName = "Exp", nExp=100000000 },
		{ szName = "Linh Ph¸ch §¬n", tbProp = { 2, 1, 31239 }, nStack = 3, nStatus = 1 },-- Linh Ph¸ch §¬n
		{ szName = " Tói §¸ Quý CÊp 8", tbProp = { 2, 1, 40030 }, nStack = 1, nStatus = 1 }, -- Tói §¸ Quý CÊp 8
		{ szName = " M¶nh HuyÒn Thoai", tbProp = { 2, 1, 40143 }, nStack = 40, nStatus = 1 }, -- Tói §¸ Quý CÊp 8
	};

		WAward:Give(tbAward, "NLBossEvent");



	--for i=1,10 do
	--	DropItem(2,1,50214,nMapID,nX+random(1,3),nY);
	--end
	-----------------------Drop Ruong--------------------
	for i = 1, 20 do
		local nSmallBoxIdx = CreateNpc("tongbaoxiang", "R­¬ng Quý HiÕm", nMapID, nX + random(1, 5), nY + random(1, 5));
		if nSmallBoxIdx ~= 0 then
			SetNpcScript(nSmallBoxIdx, "\\script\\warlord\\online_activities\\tetnguyendan2024\\eventboss\\small_box.lua");
			SetNpcLifeTime(nSmallBoxIdx, 600);
			WLib:SetUnitCurStates(nSmallBoxIdx, 6, GetTime());
		end
	end

	SetNpcRemoveScript(nNpcIndex,"")
	local nHour = tonumber(date("%H%M"))
	if nHour <1245 or (nHour >2200 and nHour <2345)  then
		npcIndex = CreateNpc("Ng­êi V« h×nh"," ",nMapID, nX+6, nY+6)
		SetNpcScript(npcIndex, "")
		SetNpcLifeTime(npcIndex,1200);
		SetNpcRemoveScript(npcIndex,  "\\script\\warlord\\online_activities\\tetnguyendan2024\\eventboss\\nguoivohinh.lua")

		SetNpcLifeTime(nNpcIndex, 0)
		SetNpcScript(nNpcIndex,"");
	end
end