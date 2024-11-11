--�ر�ͼ
Include("\\script\\missions\\yp\\yp_head.lua")

function OnUse(nItemIndex)
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then
		Talk(1,"","C�n gia nh�p th� l�c m�i ���c d�ng T�ng B�o �� n�y!");
		return 0;
	end
	local tAllowMap = {[1] = {6100,6200},[2] = {6000,6200},[3] = {6000,6100}};
	local nMapID,nPosX,nPosY = GetWorldPos();
	if nMapID ~= tAllowMap[nCamp][1] and nMapID ~= tAllowMap[nCamp][2] then
		Talk(1,"","Ph�i ��n b�n �� th� l�c k� ��ch m�i ���c d�ng T�ng B�o �� n�y!");
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
		Talk(1,"","B�n �� th� l�c n�y �� kh�ng c�n kho b�u r�i, h�y ��i l�n t�o m�i ti�p theo ho�c �i b�n �� th� l�c kh�c xem th�!");
		return 0;
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
		if DelItem(2,95,917,1) == 1 then
			SetMissionV(nMv,0);
			SetTask(TASK_FIELD_PVP_TREASURE,2);
			local nRand = random(1,100);
			local nType = 0;
			local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
			SetCurrentNpcSFX(nPidxNpc,972,1,0); --��Ч
			if nRand <= 50 then
				gf_AddItemEx({tPVPItemInfo[22][2],tPVPItemInfo[22][3],tPVPItemInfo[22][4],1},tPVPItemInfo[22][1]);
				nType = 22;
			elseif nRand <= 80 then
				gf_AddItemEx({tPVPItemInfo[23][2],tPVPItemInfo[23][3],tPVPItemInfo[23][4],1},tPVPItemInfo[23][1]);
				nType = 23;
			else
				gf_AddItemEx({tPVPItemInfo[24][2],tPVPItemInfo[24][3],tPVPItemInfo[24][4],1},tPVPItemInfo[24][1]);
				nType = 24;
			end
			--���񴥷�
			--Include("\\script\\global\\events.lua")
			--EventOnTrigger(7, {name="�ռ���", category=nType-21});
			FireEvent("event_mission_task_award", "pvp", "shiliwabao", nType-21)
		end
	else
		SetItemUseLapse(nItemIndex,5*18);	--��ȴʱ�䣺5��
		Talk(1,"","Kho�ng c�ch g�n nh�t ��n kho b�u c�n <color=yellow>"..nDistance.." b��c<color>!");
	end
end