--������ʿ
Include("\\script\\task\\global_task\\gtask_head.lua");
Import("\\script\\lib\\define.lua")
tInfo ={
{"�� T� V� �ang",	"Danh v�ng V� �ang ��o Gia Th� T�a",},
{"�� t� Thi�u L�m",		"Giam C�m ��a1",},
{"�� t� Minh Gi�o",		"Danh v�ng Minh Gi�o Th�nh Chi�n Th� T�a",},
}
sDeathScript = "\\script\\pop\\2012\\liaoguo_cike_npc.lua";

function main()
	if tGtTask:check_cur_task(940) ~= 1 then
			return 0;
	end
	if GetTime() - GetTask(TASKID_SW_ITEM_WXZYH_CD) < 120 then
		Talk(1,"","H�y ngh� ng�i r�i m�i quay l�i t�m ta! (Th�i gian gi�n c�ch: 2 ph�t)");
		return 0;
	end
	local nMapId,nX,nY = GetWorldPos();
	for i = 1,getn(tInfo) do
		if tInfo[i] then
			local nIdx = CreateNpc(tInfo[i][2],tInfo[i][1],nMapId,nX,nY,-1,1,1,40);
			SetNpcLifeTime(nIdx,60*3);
			SetNpcDeathScript(nIdx,sDeathScript);
		end
	end
	if GetFollower() ~= 0 then
--		KillFollower();
	end
	SummonNpc("Thi�u n� h�n m�","Thi�u n� h�n m�");
	SetTask(TASKID_SW_ITEM_WXZYH_CD,GetTime());
end

--�������̻�
function OnUse(nItemIdx)
	if tGtTask:check_cur_task(1011) ~= 1 then
			return 0;
	end
	local nMapId1,nX1,nY1 = GetWorldPos();
	local nMapZXC = 5079; --��ѩ��
	if nMapId1 ~=  nMapZXC then
		Talk(1,"","V� T��ng T�ng Y�n H�a: H�y ��n T�ng Tuy�t Th�nh �� s� d�ng.")
		return 0;
	end
	if GetTime() - GetTask(TASKID_SW_ITEM_WXZYH_CD) < 120 then
		Talk(1,"","H�y s� d�ng sau (Gi�n c�ch s� d�ng: 2 ph�t).")
		return 0;
	end
	local g,d,p = GetItemInfoByIndex(nItemIdx);
	if g ~= 2 or d ~= 96 or p ~= 136 then
		return 0;
	end 
	for i = 1,getn(tInfo) do
		if tInfo[i] then
			local nIdx = CreateNpc(tInfo[i][2],tInfo[i][1],nMapId1,nX1,nY1,-1,1,1,40);
			SetNpcLifeTime(nIdx,60*5);
			SetNpcDeathScript(nIdx,sDeathScript);
		end
	end
	SetTask(TASKID_SW_ITEM_WXZYH_CD,GetTime());
end

	