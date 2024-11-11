--��������NPC
Import("\\script\\lib\\define.lua")
Import("\\script\\lib\\globalfunctions.lua")

--TASKID_SW_YWLP_WAIT_TIME
function OnUse(nItemIdx)
	
end

function get_ywlp_fail()
	local nNpcIdx = GetTask(TASKID_SW_YWLP_IDX);
	AddUnitStates(nNpcIdx, 5, -GetUnitCurStates(nNpcIdx,5)); 
end

function get_ywlp_suc()
	local nNpcIdx = GetTask(TASKID_SW_YWLP_IDX);
	local nCurLife = GetLife();
	local nMaxLife = GetMaxLife();
	local nCount = 1;
	local nValue = nCurLife/nMaxLife;
	if nCurLife == nMaxLife  then
		nCount = 5;
	elseif nValue  >= 0.8 then
		nCount = 4;
	elseif nValue >= 0.6 then
		nCount = 3;
	elseif nValue >= 0.4 then
		nCount = 2;
	end
	if gf_Judge_Room_Weight(nCount,10,"Di�n V� L�nh B�i") ~= 1 then
		AddUnitStates(nNpcIdx, 5, -GetUnitCurStates(nNpcIdx,5)); 
		return 0;
	end
	gf_AddItemEx({2,96,121,nCount,4},"Di�n V� L�nh B�i");
	AddUnitStates(nNpcIdx, 5, -GetUnitCurStates(nNpcIdx,5));
	Restore();
	NewWorld(5077,1574,3297);
end

function main()
	local nMap,nX,nY = GetWorldPos();
	local nNpcMap, nNpcX,nNpcY = GetNpcWorldPos(GetTargetNpc());
	if nMap ~= nNpcMap  then return 0;end
--	if  abs(nX - nNpcX) > 4 or abs(nY - nNpcY) > 4 then
--		Talk(1,"","���ƽ�����ߣ���ǰһ������ʰȡ");
--		return 0;
--	end 
	if gf_Judge_Room_Weight(1,10,"Di�n V� L�nh B�i") ~= 1 then
		return 0;
	end
	local nNpcIdx = GetTargetNpc();
	if BigGetItemCount(2,96,121) >=  10 then
		Talk(1,"","Ng��i �� nh�n �� l�nh b�i r�i, mau mang �i cho Tr�i B�c Song �ng Ngu M�c S�n xem th�!");
		return 0;
	end
	if GetTime() - GetUnitCurStates(nNpcIdx, 5) <= 2 then 
		Talk(1,"","Di�n V� L�nh B�i �� b� ng��i kh�c nh�t r�i.");
		return 0;
	end
	SetTask(TASKID_SW_YWLP_IDX,nNpcIdx);
	AddUnitStates(nNpcIdx, 5, GetTime() - GetUnitCurStates(nNpcIdx,5));
	DoWait(43,44,2); -- ������~~
end

function task935_do_wait()
	DoWait(45,46,5);
end


function task935_do_wait_suc()
	SetTask(TASKID_SW_TASK935_FINISH,1);
end

function task935_do_wait_fail()
end

function task929_action()
	local nValue = GetTask(TASKID_SW_PEACH_SEED_NUM);
	if nValue ~= 1 then
		SetTask(TASKID_SW_PEACH_SEED_NUM,GetTime())
	end
end

function task929_condition()
	if GetTask(TASKID_SW_PEACH_SEED_NUM) ~= 1 then
		Talk(1,"","��o Gia tu h�nh, k� nh�t l� l��i bi�ng ho�c l�a d�i, b�ng kh�ng s� l�m h� h�i t�nh c�ch! Ta ni�m t�nh ng��i ph�m l�i l�n ��u, h�y l�m l�i n�o!");
	end
end