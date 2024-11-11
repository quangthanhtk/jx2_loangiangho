--�����̻�
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\task\\global_task\\gtask_spcl_task.lua");

function OnUse(nItemIndex)
	if tGtCondition:check_taskid(483, 2) ~= nil then
		Talk(1, "", "Nghe n�i tr�n th� c� ��c, hay l� mang th� giao cho ��p V�n xem tr��c, sau �� m�i �i t�m Ng� Ti�u Ti�u.");
		return
	end

	if tGtCondition:check_taskid(484, 2) ~= nil and BigGetItemCount(2, 96, 31) == 0 then
		Talk(1, "", "Thi�u hi�p kh�ng c� <color=yellow>m�t th� ch�n b�t ���c<color>!");
		return
	end

	if tGtCondition:check_taskid(484, 2) ~= nil or tGtCondition:check_taskid(851, 2) ~= nil then
		local mapID, mapX, mapY = GetWorldPos();

		--�ǽ���������
		local tMap = {6300};
		local bFound = 0;

		for i = 1, getn(tMap) do
			if tMap[i] == mapID then
				bFound = 1;
				break;
			end
		end

		if bFound == 1 then
			if GetFightState() ~= 1 then
				Talk(1,"","Kh�ng th� � khu v�c h�a b�nh d�ng Ph�o Hoa Th�n B�!");
				return nil;
			end
			local tTalk = {
				"<color=green>Ng� Ti�u Ti�u<color>: Ng��i l� ai? Sao d�m d�ng ��c �� h�i ta?",
				"<color=green>Ng��i ch�i<color>: Ta ���c Nh� s� L�c T�n M�n ��p V�n �y th�c, ��n l�y B�ch H�i Lam v�!",
				"<color=green>Ng� Ti�u Ti�u<color>: Ng��i bi�t h�t c� r�i? Xem ra kh�ng th� �� ng��i s�ng s�t tr� v� r�i!",
			};

			TalkEx("ChangeWXX", tTalk);
			return
		else
			Talk(1, "", "Ch� ���c � Th�t L�c Nhai d�ng Ph�o Hoa Th�n B�!");
			return nil;
		end
	end

	Talk(1, "", "H� th�ng b� l�i.");
	return
end

function ChangeWXX()
		local nRet = 2;

		local nGtask = 484;
		local nTimeTaskID = TASK_WXX_TIME;

		if tGtCondition:check_taskid(484, 2) == nil then
			nGtask = 851
			nTimeTaskID = TASK_WXX_DAILY_TIME;
		end

		local tNpc = {
			"men6_pt_wuxiaoxiao",
			"L�c Phi�n M�n-Ph�n �� Ng� Ti�u Ti�u",
			1,
			"\\script\\pop\\npc_wuxiaoxiao.lua",
			2,
			5 * 60,
		};
		nRet = UseItemToCallNpc(nItemIndex, nGtask, nTimeTaskID, tNpc);

		if nRet == 2 then
			Talk(1, "", "K� l�, ng��i ch�a nh�n nhi�m v�, sao l�i c� ��o c� n�y?");
		elseif nRet == 3 then
			Talk(1, "", "Ph�i m�t l�c sau m�i d�ng ti�p ���c. (Gi�n c�ch s� d�ng: 2 ph�t)");
		elseif nRet == 4 then
			Talk(1, "", "Ch�c m�ng �� ho�n th�nh h�y �i giao nhi�m v�.");
		end
end
