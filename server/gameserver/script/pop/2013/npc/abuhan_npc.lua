--Ů���ʿ������
Include("\\script\\task\\global_task\\gtask_head.lua");
Import("\\script\\lib\\globalfunctions.lua");

--��һЩ�����ϵĶ������������� �������
g_tGTaskId = {1321,1337};  --�漰��������id �鿴gtask_main
g_szNpcName = "Qu�n S� N� Ch�n-A B�t H�n: ";

function kill_him()
	local nNpcIdx = GetTargetNpc();
	if nNpcIdx == nil then return 0; end
	ChangeNpcToFight(nNpcIdx);
	--SetNpcDeathScript(nIdx,"\\script\\pop\\2012\\hl_robber_npc.lua");
	NpcChat(nNpcIdx, "N�u �� b� ng��i nh�n th�u th� ��nh gi�t ng��i di�t kh�u v�y.");
end

function main()
	local nNpcIdx = GetTargetNpc();
	local szNpcName = GetNpcName(nNpcIdx);
	
	local nHasTask = 0;
	for i = 1,getn(g_tGTaskId) do
		if 1 == tGtTask:check_cur_task(g_tGTaskId[i])  then
			nHasTask = 1
			break;
		end
	end
	if nHasTask ~= 1 then
		Talk(1, "", "<color=green>" .. szNpcName .. "<color>: D�o n�y lo ��nh tr�n, kh�ng bi�t h�m nay t��ng qu�n �� gi�o hu�n ch�a?");
		return 0;
	end
	
	local szPlayerName = GetName();
	local szMsg = format("<color=green>%s<color>: Nghe n�i t�i h�m qua �� th� ra 1 con H�i ��ng Thanh, ng��i c� bi�t kh�ng?\\p<color=green>%s<color>: H�m qua ta u�ng r��u v�i Ba �� L� n�n kh�ng �� �.\\p<color=green>%s<color>: (ta s� l�a h�n)\\p<color=green>%s<color>: Kh�ng c�n, t�i h�m qua Ba �� L� lu�n � trong l�u c�a ta, tr�i s�ng m�i r�i kh�i.\\p<color=green>%s<color>: V�y... ta... n�p m�ng n�o.",szPlayerName,szNpcName, szPlayerName, szPlayerName, szNpcName);

	suTalk("kill_him", szMsg, 1);
end

function OnDeath(nNpcIdx)
	--RemoveNpc(nNpcIdx);
end