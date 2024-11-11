Include("\\script\\missions\\yp\\tysd\\head.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\script\\missions\\yp\\yp_head.lua")
Import("\\script\\lib\\npccmdhead.lua")

---------------------------------------------------------
stageFight = {
	name = "tbTYSD",
	frequency = 18*2,
	maxsecond = firePhases.maxsecond,
	actionsType = "second",
}

function stageFight:createSomeNpc()
	
end

function stageFight.init()
	self = stageFight;
--	this:Msg2MSAll("��ʼ����ͼNPC...");
	self:createSomeNpc();
end

function stageFight.checkPlayer()
	if yp_checkRewardTime() == 0 then
		return 0;
	end
	this.msCamp:turnPlayer(0,function ()
		if BigGetItemCount(tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4]) == 0 then
			Msg2Player("Tr�n ng��i ��i hi�p kh�ng c� Huy Hi�u V� L�m Minh, n�u � l�i s� g�p nguy hi�m, h�y �i t�m Kh� M�c ��i S� �� xin ch� gi�o!");
--			local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
			SetPlayerScript("\\script\\missions\\yp\\qmy\\entrynpc.lua");
			SendScript2VM("\\script\\missions\\yp\\qmy\\entrynpc.lua","enter()");
			SetFightState(1);
			UseMask(0,0); --������
		end	
	end
	);
end

function stageFight:onPlayerDeath(event, data)
--	print("stageFight:onPlayerDeath2222222222222")
	self = stageFight;
	if yp_checkRewardTime() == 0 then
		return 0;
	end	
--	print("stageFight:onPlayerDeath",event, data)
	local nOldPlayerIDX = PlayerIndex;
	local nCount = BigGetItemCount(tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4]);
	nCount = ceil(nCount/2);
	if nCount > 16 then
		nCount = 16;
	end
	SetTask(TASK_FIELD_PVP_REWARD_DEADNUM,GetTask(TASK_FIELD_PVP_REWARD_DEADNUM)+1);
	BigDelItem(tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4],nCount);
	PlayerIndex = data;
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		PlayerIndex = nOldPlayerIDX;
		return 0;
	end
	AddItem(tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4],nCount);
	PlayerIndex = nOldPlayerIDX;
	self:reborn();
end

function stageFight:onNpcDeath(event, data)
	self = stageFight;
--	if yp_checkRewardTime() == 0 then
--		return 0;
--	end
--	print("stageFight:onNpcDeath",event, data)	
	local sNpcName = GetNpcName(data[1]); --������npc������
	--�ж�ɱ���ǲ��ǵ�����
	local nBoxIdx = 0;
	for i = 1,getn(tRewardBox) do
		if sNpcName == tRewardBox[i][2] then
			nBoxIdx = i;
			break;
		end
	end
	if nBoxIdx ~= 0 then
		SetNpcLifeTime(data[1],0);
		if yp_checkRewardTime() ~= 0 then
			CastState(tRewardBox[nBoxIdx][7],tRewardBox[nBoxIdx][8],tRewardBox[nBoxIdx][9]*18);
			if tRewardBox[nBoxIdx][10] ~= nil then
				CastState(tRewardBox[nBoxIdx][10],tRewardBox[nBoxIdx][11],tRewardBox[nBoxIdx][12]*18);
			end
			Msg2Player("B�n nh�n ���c "..tRewardBox[nBoxIdx][5].."Hi�u qu�: "..tRewardBox[nBoxIdx][6]);
			return 0;
		end
	end
end

function stageFight:reborn()
	local m = this.msPosition:getMapID();
	local nRand = 0;
	if tBzPos[m] then
		nRand = random(1,getn(tBzPos[m]));
	end
	SetPos(tBzPos[m][nRand][1],tBzPos[m][nRand][2]);
	Restore();
	RestoreNeili();
	ClearColdDown();	--��ҩЧ
	CastState("imme_clear_skill_interval",-1,0);	--�������м��ܵ���ȴʱ��
--	CastState("state_dispear",0,5*18);            --�޵�5��
end;

function stageFight.createBuffItem()
	self = stageFight;
	if yp_checkRewardTime() == 0 then
		return 0;
	end
	local m = this.msPosition:getMapID();
	if tBzPos[m] == nil then
		return 0;
	end
	local tCopy = new(tBzPos[m]);
	local tBuffItem = floyd_rm4n(getn(tCopy),10);
	local nBuffIDX = 0;
	for i = 1,getn(tBuffItem) do
		local n = tBuffItem[i];
		local nRand = random(1,getn(tRewardBox));
		nBuffIDX = CreateNpc(tRewardBox[nRand][1],tRewardBox[nRand][2],m,tCopy[n][1],tCopy[n][2]);
		if nBuffIDX ~= 0 then
			SetNpcLifeTime(nBuffIDX,60);
			SetNpcDeathScript(nBuffIDX,thisFile);
		end
	end
end

function stageFight.createRewardNpc()
	self = stageFight;
	if yp_checkRewardTime() == 0 then
		return 0;
	end
	local m = this.msPosition:getMapID();
	yp_CreateMonster({"V� L�m Minh-�� T� Kh� M�c","V� L�m Minh-�� T� Kh� M�c",thisFile,120,CampNeutral,0},{{1838,3214},{1766,3419},{1659,3553}});
	this:Msg2MSAll("V� L�m Minh-�� T� Kh� M�c �� xu�t hi�n, c� th� ��n [229,200], [220,213], [207,221] �� n�p Huy Hi�u V� L�m Minh, h�y nhanh ch�n l�n!");
end

function stageFight.OnTalk()
	local strName = GetTargetNpcName();
	if strName == "V� L�m Minh-�� T� Kh� M�c" then
		local strtab = {
				"\n�y th�c b�o qu�n huy hi�u/talk_1",
				"\nK�t th�c ��i tho�i/nothing",
			}
		Say("Ha ha, t�i h� ph�ng l�nh c�a s� ph� ��n t� h�p v�i thi�u hi�p.",
			getn(strtab),
			strtab)
	end
end

function talk_1()
	local nCount = BigGetItemCount(tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4]);
	if nCount <= 8 then
		Talk(1,"","Thi�u hi�p h�y gi� l�i m�t �t huy hi�u.");
		return 0;
	end
	local nNum = nCount-8;
	if BigDelItem(tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4],nNum) == 1 then
		SetTask(TASK_FIELD_PVP_REWARD_HANDED,GetTask(TASK_FIELD_PVP_REWARD_HANDED)+nNum);
		Msg2Player("Ng��i �� n�p "..nNum.."c�i"..tPVPItemInfo[15][1]);
		Talk(1,"","Nhi�u h�n 8 huy hi�u s� do t�i h� b�o qu�n gi�p.");
	end
end
----------------------------------------------------------------------
stageFight = inherit(cycPhase, stageFight);

stageFight.actions = {
	[2] = stageFight.init,
--	[50] = stageFight.warn,
}
stageFight.cycActions = {
	[2] = { --2����һ��
		[0] = stageFight.checkPlayer,
	},
	[60] = {
		[0] = stageFight.createBuffItem,
	},
	[600] = {--10����
		[0] = stageFight.createRewardNpc,
	},	
}

stageFight.triggers = {
--	PlayerDeath = { 
--		{action = stageFight.onPlayerDeath,},
--	},
	NpcDeath = { 
		{action = stageFight.onNpcDeath,},
	},
	Talk = {
		{action = stageFight.OnTalk,},
	},
}

----------------------------------------------------------------------
firePhases.phases = {stageFight};

function firePhases:onTimeout()
	Msg2MSAll(this.missionID, "K�t th�c �i!");
	CloseMission(this.missionID);
end

----------------------------------------------------------------------
tbTYSD = gf_CopyInherit(missionBase, tbTYSD);

tbTYSD.msOption.bForbitTeam = 0; --�������
--tbTYSD.msOption.nInitFightState = nil; --ս��״̬
tbTYSD.msOption.nRestoreFightState = nil; --ս��״̬
tbTYSD.msOption.bRestoreTempEffect = 0; --�Ƿ������ʱ״̬
tbTYSD.msCamp.campType = tAllCamp;
--tbTYSD.msCamp.szInitDeahScript = thisFile;

tbTYSD.msPhases[1] = firePhases;

tbTYSD.msPosition.entryPos = {
	{1620,3256},
};
tbTYSD.msPosition.exitPos = {200,1381,2845};

function tbTYSD:onInit()
--	print("tbTYSD:onInit")
	firePhases:onInit();
	missionBase.onInit(self);
end

function tbTYSD:onLeave()
--	print("tbTYSD:onLeave")
	SetMissionV(MV_MISSION_STATUS,1); --���뿪����
	SetLogoutRV(0);	--���õ�½��Ϊ��������
	self.msOption:restoreState();
end

function tbTYSD:onLogin(nCamp)
--	print("tbTYSD:onLogin")
	nCamp = nCamp or GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then
		nCamp = 5;
	end	
	this.msOption:setState(nCamp);
	this.msCamp:addPlayer(this.missionID, nCamp);	
	SetFightState(1);	
end

tbTYSD.msCamp.addPlayer = function(self, missionID, nCamp) --�ع�
--	print("msCamp:addPlayer")
	AddMSPlayer(missionID, nCamp);
	this.msOption:OnPlayerJoin(nCamp)
	if yp_checkRewardTime() == 0 then
		SetCampToPlayer(self.campType[nCamp]);
	else
		SetCampToPlayer("");
	end
end

tbTYSD.msOption.OnPlayerJoin = function(self, nCamp)
	nCamp = nCamp or GetTask(TASK_FIELD_PVP_CAMP);
	if yp_checkRewardTime() == 0 then
		ForbidChangePK(0);
		SetPKFlag(1,nCamp-1);
		ForbidChangePK(1);
		local m = GetWorldPos();
		SetTempRevPos(tTempRev[nCamp][m][1],tTempRev[nCamp][m][2]*32,tTempRev[nCamp][m][3]*32); --��ʱ������		
	else
		ForbidChangePK(0);
		SetPKFlag(2,0);
		ForbidChangePK(1);
		UseMask(1,0); --������
		SetDeathScript("\\script\\missions\\yp\\tysd\\player_death.lua");
		local nRand = 0;
		if tBzPos[6400] then
			nRand = random(1,getn(tBzPos[6400]));
		end
		SetPos(tBzPos[6400][nRand][1],tBzPos[6400][nRand][2]);		
	end
	if GetTrigger(g_nLoginCostomerID) == 0 then
		CreateTrigger(3,g_nLoginTriggerID,g_nLoginCostomerID);
	end
	if GetTrigger(g_nRectCostomerID) == 0 then
		CreateTrigger(2,g_nRectTriggerID,g_nRectCostomerID);
	end			
end
--
tbTYSD.msOption.OnPlayerLeave = function(self, nCamp)
--	SetDeathScript("");
	local nMaskState = GetMaskStatus();
	if nMaskState == 1 then
		UseMask(0,0);
	end	
end

this = tbTYSD;
