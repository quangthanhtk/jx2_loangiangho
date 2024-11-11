Include("\\script\\online\\plant\\tree_head.lua");
Import("\\script\\lib\\globalfunctions.lua");

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

function OnDeath(Launcher)
	if GetTime() - GetTask(TASK_PLANTTIME) > TREELIFETIME then
		SetDeathScript("");	--ÉèÖÃËÀÍö½Å±¾Îª¿Õ
		SetTask(TASK_TREEINDEX,0);	--
		SetTask(TASK_TREEGROW,0);	--
		SetTask(TASK_PLANTTIME,0);		
		return 0;
	end;
	local nTreeGrow = GetTask(TASK_TREEGROW);
	KillerIndex = NpcIdx2PIdx(Launcher);
	OldPlayerIndex = PlayerIndex;
	local sName = GetName();
	SetDeathScript("");	--ÉèÖÃËÀÍö½Å±¾Îª¿Õ
	SetNpcLifeTime(GetTask(TASK_TREEINDEX),0);	--Ê÷ÏûÊ§µô
	SetNpcScript(GetTask(TASK_TREEINDEX),"");
	SetTask(TASK_TREEINDEX,0);	--
	SetTask(TASK_TREEGROW,0);	--
	SetTask(TASK_PLANTTIME,0);
	WriteLogEx("Trong cay Bat Nha", "Mat cay");
	PlayerIndex = KillerIndex;
	if PlayerIndex > 0 then
		--LongDaiKa: fix lçi tû vâ lÊy c©y
		local nPkFlag1, nPkFlag2 = GetPKFlag();
		local nPKEnmityState = GetPKEnmityState();
		if GetReputation() >= g_WCFG_BATNHALON.nRobReputationMinReq and GetLevel() >= g_WCFG_BATNHALON.nRobLevelMinReq and nPkFlag1 ~= 0 and nPKEnmityState == 0 then
			if AddItem(2,0,398,1) == 1 then
				WriteLogEx("Trong cay Bat Nha", "Cuop cay");
				--goc Msg2Player(TREETYPE[nTreeGrow][2].."Linh khİ ®ét nhiªn mÊt ®i vµ biÕn l¹i thµnh h¹t gièng, b¹n mau nhÆt lÊy h¹t gièng.");
				WPlayer:Msg(format("%sLinh khİ ®ét nhiªn mÊt ®i vµ biÕn l¹i thµnh h¹t gièng, b¹n mau nhÆt lÊy h¹t gièng.", TREETYPE[nTreeGrow][2]));
			end
			sName = GetName();
			PlayerIndex = OldPlayerIndex;
			--goc Msg2Player(TREETYPE[nTreeGrow][2].."Linh khİ ®ét nhiªn mÊt ®i vµ biÕn l¹i thµnh h¹t gièng, b¹n mau nhÆt lÊy h¹t gièng, h¹t gièng còng bŞ tªn c­íp ®o¹t mÊt.");
			WPlayer:Msg(format("%sLinh khİ ®ét nhiªn mÊt ®i vµ biÕn l¹i thµnh h¹t gièng vµ bŞ [%s] ®o¹t mÊt.", TREETYPE[nTreeGrow][2], sName));
		else
			sName = GetName();
			PlayerIndex = OldPlayerIndex;
			AddItem(2,0,398,1);
			WPlayer:Msg(format("B¹n võa bŞ [%s] h¹ gôc, %s biÕn mÊt vµ trë l¹i thµnh h¹t gièng, b¹n ®· nhanh tay nhÆt l¹i.", sName, TREETYPE[nTreeGrow][2]));
		end
	end
end