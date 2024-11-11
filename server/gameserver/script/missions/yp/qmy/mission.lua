Import("\\script\\lib\\globalvalue.lua")
Include("\\script\\missions\\yp\\qmy\\head.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Import("\\script\\tmp_task_id_def.lua")
Import("\\script\\lib\\globalfunctions.lua")

---------------------------------------------------------
stageFight = {
	name = "tbSLY",
	frequency = 18*2,
	maxsecond = firePhases.maxsecond,
	actionsType = "second",
}

function stageFight:createSomeNpc()
--	print("stageFight:createSomeNpc()")
	local m = this.msPosition:getMapID();
	yp_CreateMonster(tNpcs[m].kmds,tPos[m].kmds);
	yp_CreateMonster(tNpcs[m].qhys,tPos[m].qhys);	
	yp_CreateMonster(tNpcs[m].cf,tPos[m].cf);
	yp_CreateMonster(tNpcs[m].xbr,tPos[m].xbr);
end

function stageFight.init()
	self = stageFight;
--	this:Msg2MSAll("��ʼ����ͼNPC...");
	self:createSomeNpc();
end

function stageFight.Biaoche2Move()
	if GetTask(TASK_FIELD_PVP_CAR_START) ~= 1 then
		return 0;
	end
	local nNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nNpcID = GetTask(TASK_FIELD_PVP_CAR_ID);
	local nCurNpcID = GetNpcID(nNpcIdx);
--	print("nNpcID,nCurNpcID",nNpcID,nCurNpcID);
	if nNpcIdx == 0 or nNpcID ~= nCurNpcID then
		Msg2Player("Ti�u Xa c�a ng��i b� ph� h�y ho�c qu� th�i gian v�n ti�u v�n ch�a ��n ��ch, v�n ti�u th�t b�i!");
		Talk(1,"","Ti�u Xa c�a ng��i b� ph� h�y ho�c qu� th�i gian v�n ti�u v�n ch�a ��n ��ch, v�n ti�u th�t b�i!");
		SetTask(TASK_FIELD_PVP_CAR_START,0);
		SetTask(TASK_FIELD_PVP_CAR_IDX,0);
		SetTask(TASK_FIELD_PVP_CAR_ID,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFE,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFETIME,0);
		SetTask(TASK_FIELD_PVP_CAR_RAND,0)
		return 0;
	end
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nNpcIdx);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
--	print("nDistance",nDistance);
	if nDistance <= 30 then
		g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
		g_NpcAI:setWayPoint(nNpcIdx,{{nPosX,nPosY}});
	end
	local nMaxLife,nCurLife = GetUnitCurStates(nNpcIdx,1);
	local nMarkLife = GetTask(TASK_FIELD_PVP_CAR_LIFE);
	if nCurLife < nMarkLife then
		Msg2Player("Ti�u Xa c�a ng��i �ang b� t�n c�ng, h�y nhanh ch�ng �i h� ti�u n�o!");
		SetTask(TASK_FIELD_PVP_CAR_LIFE,nCurLife);
	end
end

function stageFight.Biaoche2Msg()
	if GetTask(TASK_FIELD_PVP_CAR_START) ~= 1 then
		return 0;
	end
	local nNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nNpcIdx);
	local sMapName = GetMapName(nNpcMapID);
	if nMapID ~= nNpcMapID then --����ͬһ��ͼ
		if sMapName then
			Msg2Player(format("Ti�u Xa c�a ng��i �ang d�ng � (%s[%d,%d]), h�y nhanh ch�ng �i t�m Ti�u Xa!",sMapName,floor(nNpcPosX/8),floor(nNpcPosY/16)));
		else
			Msg2Player("Ng��i c�ch Ti�u Xa qu� xa, h�y nhanh ch�ng �i t�m Ti�u Xa n�o!");
		end		
		return 0;
	end
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
--	print("nDistance",nDistance);
	if nDistance > 30 then
		if sMapName then
			Msg2Player(format("Ti�u Xa c�a ng��i �ang d�ng � (%s[%d,%d]), h�y nhanh ch�ng �i t�m Ti�u Xa!",sMapName,floor(nNpcPosX/8),floor(nNpcPosY/16)));
		else
			Msg2Player("Ng��i c�ch Ti�u Xa qu� xa, h�y nhanh ch�ng �i t�m Ti�u Xa n�o!");
		end
	end
end

function stageFight.checkBiaoche2Move()
	self = stageFight;
	this.msCamp:turnPlayer(0,stageFight.Biaoche2Move);
end

function stageFight.checkBiaoche2Msg()
	self = stageFight;
	this.msCamp:turnPlayer(0,stageFight.Biaoche2Msg);
end

function stageFight.createTreasure()
	self = stageFight;
	local m = this.msPosition:getMapID();
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	if nHour == 17 or nHour == 21 then
		if nMin == 0 then
			if tBzPos[m] == nil then
				return 0;
			end
			local tCopy = new(tBzPos[m]);
			local tCurTreasure = floyd_rm4n(getn(tCopy),10);
			for i = 1,10 do
--				print("tCurTreasure[i]",tCurTreasure[i]);
				SetMissionV(i,tCurTreasure[i]);
			end
			SetMissionV(this.mv12,0);
			SetMissionV(this.mv13,1);
			Msg2Global("R�t nhi�u ng��i t�m kho b�u �� t� b� � ngh� � Th�t L�c Nhai, h�nh nh� h� �ang t�m ng��i thay th�!");
		end
	end
end

function stageFight.createNpcBook()
	self = stageFight;
	local m = this.msPosition:getMapID();
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	if mod(nHour,6) == 0 then 	
		if nMin < 4 then
			if tBzPos[m] == nil then
				return 0;
			end
			local tCopy = new(tBzPos[m]);
			local tCurTreasure = floyd_rm4n(getn(tCopy),6);
			for i = 1,getn(tCurTreasure) do
				local x,y = tBzPos[m][tCurTreasure[i]][1],tBzPos[m][tCurTreasure[i]][2];
				local nNpcIdx = CreateNpc("V� L�m Minh-Truy�n Gi�o S�","V� L�m Minh-Truy�n Gi�o S�",m,x,y);
				if nNpcIdx ~= 0 then
					SetNpcLifeTime(nNpcIdx,30*60);
					SetNpcScript(nNpcIdx,thisFile);
				end
			end
			Msg2Global("Truy�n Gi�o S� c�a V� L�m Minh �ang truy�n ��o th� nghi�p � Th�t L�c Nhai, c�c v� ��i hi�p c� l�ng c� th� ��n vi�ng th�m!")
		end
	end
end

function stageFight.createNpcTree()
	self = stageFight;
	local m = this.msPosition:getMapID();
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	if nHour == 14 or nHour == 20 then 	
		if nMin < 3 then
			if tBzPos[m] == nil then
				return 0;
			end
			local tCopy = new(tBzPos[m]);
			local tCurTreasure = floyd_rm4n(getn(tCopy),30);
			for i = 1,getn(tCurTreasure) do
				local x,y = tBzPos[m][tCurTreasure[i]][1],tBzPos[m][tCurTreasure[i]][2];
				local nNpcIdx = CreateNpc("V� �ang  ch��ng m�n","Th�i H� Ch�n Nh�n",m,x,y);
				if nNpcIdx ~= 0 then
					SetNpcLifeTime(nNpcIdx,30*60);
					SetNpcScript(nNpcIdx,thisFile);
				end
			end
			Msg2Global("T��ng truy�n Th�i H� Ch�n Nh�n �ang d�o ch�i � Th�t L�c Nhai, ng��i c� l�ng h�y ��n �� t�m g�p!")
		end
	end
end

function stageFight:onTalk()
	local nNpcIdx = GetTargetNpc();
	local strNpcName = GetTargetNpcName();
	if strNpcName == "V� L�m Minh-Truy�n Gi�o S�" then
		if GetUnitCurStates(nNpcIdx,0) == 0 or (GetTime() - GetUnitCurStates(nNpcIdx,1)) > 10 then
			AddUnitStates(nNpcIdx,0,1-GetUnitCurStates(nNpcIdx,0));
			AddUnitStates(nNpcIdx,1,GetTime()-GetUnitCurStates(nNpcIdx,1));
			SetTaskTemp(TEMP_FIELD_PVP_WLMCJS_IDX,nNpcIdx);
			DoWait(125,126,10);
		else
			Talk(1,"","<color=green>Nh�c nh�<color>: �ang b� ng��i kh�c nh�p v�o, h�y th� l�i sau!")
			return
		end
	elseif strNpcName == "Th�i H� Ch�n Nh�n" then
		if GetUnitCurStates(nNpcIdx,0) == 0 or (GetTime() - GetUnitCurStates(nNpcIdx,1)) > 10 then
			AddUnitStates(nNpcIdx,0,1-GetUnitCurStates(nNpcIdx,0));
			AddUnitStates(nNpcIdx,1,GetTime()-GetUnitCurStates(nNpcIdx,1));
			SetTaskTemp(TEMP_FIELD_PVP_WLMCJS_IDX,nNpcIdx);
			DoWait(127,128,10);
		else
			Talk(1,"","<color=green>Nh�c nh�<color>: �ang b� ng��i kh�c nh�p v�o, h�y th� l�i sau!")
			return
		end
	elseif strNpcName == "T�m B�o Nh�n" then
		Say("<color=green>T�m B�o Nh�n<color>: Ta nghe n�i Th�t L�c Nhai n�y l� n�i ch�n kho b�u c�a Thi�n �m Gi�o, kh�ng ng� t�m ki�m nhi�u ng�y v�n kh�ng c� thu ho�ch. ��nh b� cu�c v�y!",
			2,
			"C� th� m��n trang b� c�a ta �� d�ng./xbr_give_tq",
			"K�t th�c ��i tho�i/nothing")
	end
end

function xbr_give_tq()
	if BigGetItemCount(tPVPItemInfo[18][2],tPVPItemInfo[18][3],tPVPItemInfo[18][4]) ~= 0 then
		Talk(1,"","<color=green>T�m B�o Nh�n<color>: Ch�ng ph�i c�c h� �� c� ["..tPVPItemInfo[18][1].."] r�i sao?");
		return 0;
	end
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	local nGiveTimes = gf_GetTaskByte(TASK_FIELD_PVP_TIEQIAO_NUM,2)
	if nGiveTimes >= 1 then
		Talk(1,"","<color=green>T�m B�o Nh�n<color>: H�m nay ng��i �� nh�n r�i["..tPVPItemInfo[18][1].."]");
		return 0;
	end
	gf_SetTaskByte(TASK_FIELD_PVP_TIEQIAO_NUM,2,nGiveTimes+1);
	gf_AddItemEx({tPVPItemInfo[18][2],tPVPItemInfo[18][3],tPVPItemInfo[18][4],1, 4+1800*100},tPVPItemInfo[18][1]);
end

function stageFight.NpcBookSuc()
	local nNpcIdx = GetTaskTemp(TEMP_FIELD_PVP_WLMCJS_IDX);
	if nNpcIdx ~= 0 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		SetNpcLifeTime(nNpcIdx,0)
		local nRand = random(1,100);
		if nRand <= 50 then
			gf_AddItemEx({tPVPItemInfo[2][2],tPVPItemInfo[2][3],tPVPItemInfo[2][4],1},tPVPItemInfo[2][1]);
		else
			gf_AddItemEx({tPVPItemInfo[3][2],tPVPItemInfo[3][3],tPVPItemInfo[3][4],1},tPVPItemInfo[3][1]);
		end
	end
end

function stageFight.NpcBookFail()
	local nNpcIdx = GetTaskTemp(TEMP_FIELD_PVP_WLMCJS_IDX);
	if nNpcIdx ~= 0 then
		AddUnitStates(nNpcIdx,0,-GetUnitCurStates(nNpcIdx,0));
	end
end

function stageFight.NpcTreeSuc()
	local nNpcIdx = GetTaskTemp(TEMP_FIELD_PVP_WLMCJS_IDX);
	if nNpcIdx ~= 0 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		SetNpcLifeTime(nNpcIdx,0)
		if random(1,100) <= 9 then
			gf_AddItemEx({tPVPItemInfo[6][2],tPVPItemInfo[6][3],tPVPItemInfo[6][4],1},tPVPItemInfo[6][1]);
		else
			if random(1,100) <= 50 then
				gf_AddItemEx({tPVPItemInfo[30][2],tPVPItemInfo[30][3],tPVPItemInfo[30][4],1},tPVPItemInfo[30][1]);
			else
				gf_ModifyExp(1000000);
			end
		end
	end
end

function stageFight.NpcTreeFail()
	local nNpcIdx = GetTaskTemp(TEMP_FIELD_PVP_WLMCJS_IDX);
	if nNpcIdx ~= 0 then
		AddUnitStates(nNpcIdx,0,-GetUnitCurStates(nNpcIdx,0));
	end
end
----------------------------------------------------------------------
stageFight = inherit(cycPhase, stageFight);

stageFight.actions = {
	[2] = stageFight.init,
--	[50] = stageFight.warn,
}
stageFight.cycActions = {
	[2] = { --2����һ���ڳ�
		[0] = {stageFight.checkPlant, stageFight.checkBiaoche2Move},
	},
	[10] = {
		[0] = stageFight.checkBiaoche2Msg,
	},
	[50] = {--50s
		[0] = stageFight.createTreasure,
	},
	[180] = { --3����
		[0] = {stageFight.createNpcBook,stageFight.createNpcTree},
	},
}
stageFight.triggers = {
	Talk = {
		{action = stageFight.onTalk},
	},
};

----------------------------------------------------------------------
firePhases.phases = {stageFight};

function firePhases:onTimeout()
	Msg2MSAll(this.missionID, "K�t th�c �i!");
	CloseMission(this.missionID);
end

----------------------------------------------------------------------
tbSLY = gf_CopyInherit(missionBase, tbSLY);

tbSLY.msOption.bForbitTeam = 0; --�������
tbSLY.msOption.nInitFightState = nil; --ս��״̬
tbSLY.msOption.nRestoreFightState = nil; --ս��״̬
tbSLY.msOption.bRestoreTempEffect = 0; --�Ƿ������ʱ״̬
tbSLY.msOption.szInitDeahScript = "\\script\\missions\\yp\\player_death.lua";
tbSLY.msCamp.campType = tAllCamp;

tbSLY.msPhases[1] = firePhases;

tbSLY.msPosition.entryPos = {
	{1412,3624},
	{1176,3277},
	{1364,2970},
};
tbSLY.msPosition.exitPos = {200,1381,2845};

--function tbSLY:onInit()
----	print("tbSLY:onInit")
--	firePhases:onInit();
--	missionBase.onInit(self);
--end

function tbSLY:onLeave()
--	print("tbSLY:onLeave")
	SetMissionV(MV_MISSION_STATUS,1); --���뿪����
	SetLogoutRV(0);	--���õ�½��Ϊ��������
	self.msOption:restoreState();
end

function tbSLY:onLogin(nCamp)
--	print("tbSLY:onLogin")
	nCamp = nCamp or GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then
		nCamp = 5;
	end	
	this.msOption:setState(nCamp);
	this.msCamp:addPlayer(this.missionID, nCamp);	
--	SetFightState(1,3);	
end

tbSLY.msOption.OnPlayerJoin = function(self, nCamp)
	nCamp = nCamp or GetTask(TASK_FIELD_PVP_CAMP);
	if GetTask(TASK_FIELD_PVP_CAMP) == 0 or nCamp == 5 then
		ForbidChangePK(0);
		SetPKFlag(0,0);
		ForbidChangePK(1);
	else
		ForbidChangePK(0);
		SetPKFlag(1,nCamp-1);
		ForbidChangePK(1);	
	end
	local m = GetWorldPos();
	SetTempRevPos(tTempRev[nCamp][m][1],tTempRev[nCamp][m][2]*32,tTempRev[nCamp][m][3]*32); --��ʱ������
--	if nCamp == 1 then
--		print("tbSLY.msOption.OnPlayerJoin")
--		local n = CreateTrigger(1,this.timerTriggerID,this.costomerID);
--		ContinueTimer(n);
--	end
	if GetTrigger(g_nLoginCostomerID) == 0 then
		CreateTrigger(3,g_nLoginTriggerID,g_nLoginCostomerID);
	end	
	if GetTrigger(g_nRectCostomerID) == 0 then
		CreateTrigger(2,g_nRectTriggerID,g_nRectCostomerID);
	end			
end
--
--tbSLY.msOption.OnPlayerLeave = function(self, nCamp)
--	print("tbSLY.msOption.OnPlayerLeave")
--	RemoveTrigger(GetTrigger(this.costomerID));
--end

this = tbSLY;
