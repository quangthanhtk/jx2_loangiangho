Include("\\script\\online\\plant\\tree_head.lua");
Import("\\script\\lib\\globalfunctions.lua");

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

function OnDeath(Launcher)
	if GetTime() - GetTask(TASK_PLANTTIME) > TREELIFETIME then
		SetDeathScript("");	--���������ű�Ϊ��
		SetTask(TASK_TREEINDEX,0);	--
		SetTask(TASK_TREEGROW,0);	--
		SetTask(TASK_PLANTTIME,0);		
		return 0;
	end;
	local nTreeGrow = GetTask(TASK_TREEGROW);
	KillerIndex = NpcIdx2PIdx(Launcher);
	OldPlayerIndex = PlayerIndex;
	local sName = GetName();
	SetDeathScript("");	--���������ű�Ϊ��
	SetNpcLifeTime(GetTask(TASK_TREEINDEX),0);	--����ʧ��
	SetNpcScript(GetTask(TASK_TREEINDEX),"");
	SetTask(TASK_TREEINDEX,0);	--
	SetTask(TASK_TREEGROW,0);	--
	SetTask(TASK_PLANTTIME,0);
	WriteLogEx("Trong cay Bat Nha", "Mat cay");
	PlayerIndex = KillerIndex;
	if PlayerIndex > 0 then
		--LongDaiKa: fix l�i t� v� l�y c�y
		local nPkFlag1, nPkFlag2 = GetPKFlag();
		local nPKEnmityState = GetPKEnmityState();
		if GetReputation() >= g_WCFG_BATNHALON.nRobReputationMinReq and GetLevel() >= g_WCFG_BATNHALON.nRobLevelMinReq and nPkFlag1 ~= 0 and nPKEnmityState == 0 then
			if AddItem(2,0,398,1) == 1 then
				WriteLogEx("Trong cay Bat Nha", "Cuop cay");
				--goc Msg2Player(TREETYPE[nTreeGrow][2].."Linh kh� ��t nhi�n m�t �i v� bi�n l�i th�nh h�t gi�ng, b�n mau nh�t l�y h�t gi�ng.");
				WPlayer:Msg(format("%sLinh kh� ��t nhi�n m�t �i v� bi�n l�i th�nh h�t gi�ng, b�n mau nh�t l�y h�t gi�ng.", TREETYPE[nTreeGrow][2]));
			end
			sName = GetName();
			PlayerIndex = OldPlayerIndex;
			--goc Msg2Player(TREETYPE[nTreeGrow][2].."Linh kh� ��t nhi�n m�t �i v� bi�n l�i th�nh h�t gi�ng, b�n mau nh�t l�y h�t gi�ng, h�t gi�ng c�ng b� t�n c��p �o�t m�t.");
			WPlayer:Msg(format("%sLinh kh� ��t nhi�n m�t �i v� bi�n l�i th�nh h�t gi�ng v� b� [%s] �o�t m�t.", TREETYPE[nTreeGrow][2], sName));
		else
			sName = GetName();
			PlayerIndex = OldPlayerIndex;
			AddItem(2,0,398,1);
			WPlayer:Msg(format("B�n v�a b� [%s] h� g�c, %s bi�n m�t v� tr� l�i th�nh h�t gi�ng, b�n �� nhanh tay nh�t l�i.", sName, TREETYPE[nTreeGrow][2]));
		end
	end
end