Include("\\script\\newbattles\\emplacementbattle\\mission\\mission_head.lua");
Include("\\script\\newbattles\\emplacementbattle\\position.lua");

BATTLE_TYPE = EMPLACEMENT_ID;	--Õ½³¡ÀàÐÍ

ENTRANCE_POINT = 	--½øÈëµã
{
	[SONG_ID] = {MAPID_SONG,1617,3360},
	[LIAO_ID] = {MAPID_LIAO,1839,3365},
};

T_EMPLACEMENT_CAMP2NAME = {
	[ALL_ID]	= "Ph¸o ®µi",
	[SONG_ID]	= "Ph¸o ®µi: Tèng",
	[LIAO_ID]	= "Ph¸o ®µi: Liªu",
};

EMPLACEMENT_POS = {1725,2904};	--ÅÚÌ¨×ø±ê

tKillPlayerBonus = --É±ËÀ²»Í¬¾üÏÎÍæ¼ÒËù¶ÔÓ¦µÄÊÂ¼þID
{
	[1] = BP_EMPLACEMENT_KILL_SOLDIER,	--É±ËÀÊ¿±ø
	[2] = BP_EMPLACEMENT_KILL_LOOEY,	--É±ËÀÐ£Î¾
	[3] = BP_EMPLACEMENT_KILL_CAPTAIN,	--É±ËÀ¶¼Í³
	[4] = BP_EMPLACEMENT_KILL_PIONEER,	--É±ËÀÏÈ·æ
	[5] = BP_EMPLACEMENT_KILL_GENERAL,	--É±ËÀ´ó½«
	[6] = BP_EMPLACEMENT_KILL_MARSHAL,	--É±ËÀÔªË§
};	

EMPLACEMENT_HURT_RANGE = 40;	--ÅÚÌ¨Õ¨ÌÅÉËº¦·¶Î§
EMPLACEMENT_HURT_PROBABILITY = 5;	--ÅÚÌ¨Õ¨ÌÅ¸ÅÂÊ£¬£µ£¥

DEATH_SCRIPT = "\\script\\newbattles\\emplacementbattle\\playerdeath.lua";

--¸ù¾ÝNPCµÄÃû×ÖÀ´´´½¨NPC
function Create_Npc(sNpcName,nNum)
	if nNum <= 0 then
		return 0;
	end;
	local tPos = {};
	local npcIndex = 0;
	local sModelName = "";
	if sNpcName == "Thæ d©n" then
		tPos = tNative_Pos;
		sModelName = "Thæ d©n";
	elseif sNpcName == "VÖ binh Ph¸o ®µi" then
		tPos = tGuard_Pos;
		sModelName = "VÖ binh Ph¸o ®µi";
	end;
	local nNpcCount = getn(tPos);
	local nPosIndex = 0;
	for i=1,nNum do
		nPosIndex = mod(i,nNpcCount+1);
		npcIndex = CreateNpc(sModelName,sNpcName,MAPID,tPos[nPosIndex][1],tPos[nPosIndex][2]);
		SetNpcDeathScript(npcIndex,"\\script\\newbattles\\emplacementbattle\\npc_death.lua");
	end;	
end;
--´´½¨ÅÚÌ¨
function Create_Emplacement(nCamp)
	local tbNpcName = T_EMPLACEMENT_CAMP2NAME;
	local npcIndex = CreateNpc("Háa ph¸o h­ h¹i",tbNpcName[nCamp],MAPID,EMPLACEMENT_POS[1],EMPLACEMENT_POS[2]);
	SetMissionV(MV_EMPLACEMENT_NPCIDX, npcIndex);
	SetCampToNpc(npcIndex,tCampNameP[nCamp]);
	SetNpcDeathScript(npcIndex,"\\script\\newbattles\\emplacementbattle\\emplacement_death.lua");	
	SetNpcReviveScript(npcIndex,"\\script\\newbattles\\emplacementbattle\\emplacement_death.lua");	
	SetNpcReviveTime(nNpcIndex, 0);--ËÀºóÁ¢¼´¸´»î
	WriteLog(format("[%s] [%s] %s",
				"NewBattles",
				"EmplacementBattle",
				format("Create_Emplacement(nCamp), nCamp=%d, npcIndex=%d",
					nCamp, npcIndex) ) )
end;

function Change_Emplacement_Camp(nCamp)
	local nNpcIndex = GetMissionV(MV_EMPLACEMENT_NPCIDX)
	if nNpcIndex <= 0 then
		return
	end

	local szNpcName = T_EMPLACEMENT_CAMP2NAME[nCamp]
	if not szNpcName then
		WriteLog(format("[ERROR] [%s] [%s] [Role:%s (acc:%s)] %s",
				"NewBattles",
				"EmplacementBattle",
				GetName(),
				GetAccount(), 
				format("Change_Emplacement_Camp(nCamp), Invalid nCamp=%d",nCamp) ) )
		nCamp = ALL_ID;
	end

	SetCampToNpc(nNpcIndex, tCampNameP[nCamp])
	SetNpcName(nNpcIndex, szNpcName)
	SetNpcReviveTime(nNpcIndex, 0);--ËÀºóÁ¢¼´¸´»î

	WriteLog(format("[%s] [%s] [Role:%s (acc:%s)] %s",
				"NewBattles",
				"EmplacementBattle",
				GetName(),
				GetAccount(), 
				format("Change_Emplacement_Camp(nCamp), nCamp=%d, npcName=%s, campName=%s",
					nCamp, szNpcName, tCampNameP[nCamp]) ) )

	return 1
end

function On_Emplacement_Revive(nNpcIndex)
	WriteLog(format("[%s] [%s] %s",
				"NewBattles",
				"EmplacementBattle",
				format("On_Emplacement_Revive(), npcName=%s, campName=%s",
					GetNpcName(nNpcIndex),GetNpcCampName(nNpcIndex)) ) )
end

function Create_Box()
	for i=1,getn(tBoxPos) do 
		local nNpcIndex = CreateNpc("B¶o r­¬ng chiÕn tr­êng","B¶o r­¬ng",MAPID,tBoxPos[i][1],tBoxPos[i][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\emplacementbattle\\box_death.lua");
	end;
end;
--ÔÚËæ»úÎ»ÖÃ´´½¨N¸ö±¦Ïä
function Create_Random_Pos_Box(nNum)
	for i=1,nNum do
		local nRanPos = random(1,getn(tBoxPos));
		local nNpcIndex = CreateNpc("B¶o r­¬ng chiÕn tr­êng","B¶o r­¬ng",MAPID,tBoxPos[nRanPos][1],tBoxPos[nRanPos][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\emplacementbattle\\box_death.lua");
	end;
	SetMissionV(MV_KILL_BOX_COUNT,0);
end;
function nothing()

end;