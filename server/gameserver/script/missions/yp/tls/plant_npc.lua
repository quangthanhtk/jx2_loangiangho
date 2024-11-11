--��ҵ�̫�����

Include("\\script\\missions\\yp\\award.lua");

function main() --npc���ĶԻ�
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	local nCurStep = GetUnitCurStates(nNpcIDX,0);
	local nFinish = GetUnitCurStates(nNpcIDX,5);
	local nPlantTime = GetTask(TASK_FIELD_PVP_TREE_TIME);
	if GetNpcTempData(nNpcIDX, 1) == PlayerIndex then
		if nFinish == 0 then
			Talk(1,"","Ng��i �� nh�n ph�n th��ng c�a c�y n�y!");
			return 0;
		end
		if nCurStep ~= 3 then
			Talk(1,"",format("C�y n�y v�n ch�a ch�n, c�ch th�i gian ch�n c�n <color=yellow>%s<color>.",Get_Time_String(120*60 - (GetTime()-nPlantTime),"hms")));
		else
			Say("Ch�c m�ng, Th�i H� C� Th� �� ch�n.",
				2,
				"\n Nh�n ph�n th��ng/#pl_getAward(1,"..nNpcIDX..")",
				"\nK�t th�c ��i tho�i/nothing")
		end
	else
		if nCurStep ~= 3 then
			Talk(1,"","Ta l� m�t m�m c�y nh�, mau mau tr��ng th�nh!");
		else
			Say("M�u xanh c�a c�nh l� d��i �nh n�ng m�t tr�i, b�n nh� nh�ng ng�i m�i h��ng trong kh�ng kh�. V� s� k� �c l�i tr�n v� trong ��u, h�nh d�ng quen thu�c �� l�i hi�n ra tr��c m�t.",
				2,
				"\n Nh�n ph�n th��ng/#pl_getAward(2,"..nNpcIDX..")",
				"\nK�t th�c ��i tho�i/nothing")			
		end
	end
end

function pl_getAward(nType,nNpcIDX)
	if nType == 1 then
		if gf_Judge_Room_Weight(2,10,"") == 1 then
--			SetNpcLifeTime(nNpcIDX,0);
			SetTask(TASK_FIELD_PVP_TREE_IDX,0);
			SetTask(TASK_FIELD_PVP_TREE_TIME,0);
			SetTask(TASK_FIELD_PVP_TREE_SHOWTIME,0);
			AddUnitStates(nNpcIDX,5,-GetUnitCurStates(nNpcIDX,5));
--			Talk(1,"","����δ�ӣ�");
			yp_aw_giveAward_11();
			local nNum = GetUnitCurStates(nNpcIDX,6);
			local nFinish = GetUnitCurStates(nNpcIDX,5); 			
			if nNum == 0 and nFinish == 0 then
				SetNpcLifeTime(nNpcIDX,0)
			end			
		end
	elseif nType == 2 then
		local nNum = GetUnitCurStates(nNpcIDX,6);
		local nFinish = GetUnitCurStates(nNpcIDX,5); 
		if nNum <= 0 then
			Talk(1,"","�� nh�n ph�n th��ng c�a c�y n�y r�i!");
			return 0;
		end
		local nLsatTime = GetTask(TASK_FIELD_PVP_TREE_AWARD_CD)
		if nLsatTime ~= 0 and GetTime() - nLsatTime < 60 then
			Talk(1,"","Gi�n c�ch nh�n th��ng l� 1 ph�t!");
			return 0;
		end
		if gf_Judge_Room_Weight(1,10,"") == 1 then
			SetTask(TASK_FIELD_PVP_TREE_AWARD_CD,GetTime());
			AddUnitStates(nNpcIDX,6,-1);
			if nNum == 1 and nFinish == 0 then
				SetNpcLifeTime(nNpcIDX,0)
			end
--			Talk(1,"","����δ�ӣ�");
			yp_aw_giveAward_12();
		end
	end
end
