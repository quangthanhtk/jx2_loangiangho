--����

Include("\\script\\missions\\yp\\qmy\\head.lua")
Import("\\script\\lib\\globalfunctions.lua")

function OnUse(nItemIndex)
	local nMapID,nPosX,nPosY = GetWorldPos();
	if nMapID ~= 6300 then
		Talk(1,"","H�y ��n b�n �� Th�t L�c Nhai m�i ���c s� d�ng X�ng n�y!");
		return 0;
	end
--	local m = this.msPosition:getMapID();
	local tTreasurePos = {};
	for i = 1,10 do
		local n = GetMissionV(i);
		if n ~= 0 then
			tinsert(tTreasurePos,i);
		end
	end
	if getn(tTreasurePos) == 0 then
		if  GetMissionV(tbSLY.mv12) >= 2 then
			Talk(1,"","B�n �� n�y kh�ng c� kho b�u r�i, h�y ��i l�n t�o m�i ti�p theo!");
			return 0;
		else
			SetMissionV(tbSLY.mv12,GetMissionV(tbSLY.mv12)+1);
			local tCopy = new(tBzPos[nMapID]);
			local tCurTreasure = floyd_rm4n(getn(tCopy),10);
			for i = 1,10 do
--				print("tCurTreasure[i]",tCurTreasure[i]);
				SetMissionV(i,tCurTreasure[i]);
			end
			for j = 1,10 do
				local n = GetMissionV(j);
				if n ~= 0 then
					tinsert(tTreasurePos,j);
				end
			end			
		end
	end
	local nDistance = -1;
	local nMv = 0;
	for i = 1,getn(tTreasurePos) do
		local n = GetMissionV(tTreasurePos[i]);
		local k = floor(sqrt((nPosX-tBzPos[nMapID][n][1])^2+(nPosY-tBzPos[nMapID][n][2])^2));
		if nDistance == -1 or nDistance > k then
			nDistance = k;
			nMv = tTreasurePos[i];
		end
	end
	if nDistance >= 0 and nDistance <= 3 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		if DelItem(2,95,927,1) == 1 then
			gf_SetTaskByte(TASK_FIELD_PVP_TIEQIAO_NUM,1, 0);
			SetMissionV(nMv,0);
			local nRand = random(1,100);
			local nType = 0;
			local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
			SetCurrentNpcSFX(nPidxNpc,972,1,0); --��Ч
			if nRand <= 30 then
				gf_AddItemEx({tPVPItemInfo[27][2],tPVPItemInfo[27][3],tPVPItemInfo[27][4],1},tPVPItemInfo[27][1]);
				nType = 27;
			elseif nRand <= 60 then
				gf_AddItemEx({tPVPItemInfo[28][2],tPVPItemInfo[28][3],tPVPItemInfo[28][4],1},tPVPItemInfo[28][1]);
				nType = 28;
			elseif nRand <= 90 then
				gf_AddItemEx({tPVPItemInfo[29][2],tPVPItemInfo[29][3],tPVPItemInfo[29][4],1},tPVPItemInfo[29][1]);
				nType = 29;
			else
				gf_AddItemEx({tPVPItemInfo[25][2],tPVPItemInfo[25][3],tPVPItemInfo[25][4],1},tPVPItemInfo[25][1]);
				nType = 25;
				Msg2Global(GetName().."Khi ��o kho b�u, nh�n ���c ["..tPVPItemInfo[25][1].."]x1!")
			end
			--Observer:onEvent(OE_FILED_PVP_DATA,{6,tPVPItemInfo[nType][1]});
		end
	else
		SetItemUseLapse(nItemIndex,5*18);	--��ȴʱ�䣺5��
		Talk(1,"","Kho�ng c�ch g�n nh�t ��n kho b�u c�n <color=yellow>"..nDistance.." b��c<color>!");
		local nNewTimes = gf_GetTaskByte(TASK_FIELD_PVP_TIEQIAO_NUM,1) + 1
		gf_SetTaskByte(TASK_FIELD_PVP_TIEQIAO_NUM,1,nNewTimes);
		Msg2Player(format("X�ng �� s� d�ng %d l�n, tu�i th�: 30 l�n!",nNewTimes));
		if nNewTimes >= 30 then
			if DelItem(2,95,927,1) == 1 then
				gf_SetTaskByte(TASK_FIELD_PVP_TIEQIAO_NUM,1, 0);
				Talk(1,"","X�ng �� d�ng qu� 30 l�n, �� b� h� h�i!");
			end
		end
	end
end
