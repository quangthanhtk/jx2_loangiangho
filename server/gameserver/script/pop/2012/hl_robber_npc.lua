--����ǿ��
Include("\\script\\task\\global_task\\gtask_head.lua");
Import("\\script\\lib\\globalfunctions.lua");

function nothing()
end

nLevelLimit = 99;
function give_money()
	if Pay(500) == 1 then
		local nRand = random(1,100);
		if nRand < nLevelLimit then
			Talk(1,"","H�ng Li�n C��ng ��o: Ta �o�n r�ng ng��i c�ng kh�ng ph�i ng��i t�t!")
			local nIdx = CreateNpc("H�ng Li�n C��ng ��o","H�ng Li�n C��ng ��o",GetWorldPos());
			ChangeNpcToFight(nIdx);
			SetNpcDeathScript(nIdx,"\\script\\pop\\2012\\hl_robber_npc.lua");
		else
			Talk(1,"","H�ng Li�n C��ng ��o: Ng��i ��ng l� ng��i t�t! Nh�n ���c 1 Th� Ng��i T�t.")
			gf_AddItemEx({2,96,131,1,4},"Th� Ng��i T�t");
		end
		SetTask(TASKID_SW_TASK948_FINISH,GetTask(TASKID_SW_TASK948_FINISH) + 1);
	end
end
tInfo = {931,948,};
function main()
	local nHasTask = 0;
	for i = 1,getn(tInfo) do
		if 1 == tGtTask:check_cur_task(tInfo[i])  then
			nHasTask = 1
			break;
		end
	end
	if nHasTask ~= 1 then
		return 0;
	end
	
	if GetCash() < 5*10000 then
		Talk(1,"","H�ng Li�n C��ng ��o: ��i hi�p kh�ng �� v�ng, sau khi c� �� v�ng h�y quay l�i!");
		return 0;
	end
	if gf_Judge_Room_Weight(1,10,"H�ng Li�n C��ng ��o") ~= 1 then
		return 0;
	end
	local nNpcIdx = GetTargetNpc();
	local strtab = {
		"Nghe ��n c��ng ��o c�c ng��i r�t th�ch ti�n b�c, nh�ng ng��i ��o gia ch�ng t�i xem nh�ng th� n�y l� v�t ngo�i th�n, n�n th��ng cho ng��i m�t �t v�y!/give_money" ,
		}
	
	Say("H�ng Li�n C��ng ��o:",
		getn(strtab),
		strtab)
end

function OnDeath(nNpcIdx)
	RemoveNpc(nNpcIdx);
end