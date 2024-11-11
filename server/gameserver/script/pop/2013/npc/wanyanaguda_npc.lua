--���հ��Ǵ�
Include("\\script\\task\\global_task\\gtask_head.lua");
Import("\\script\\lib\\globalfunctions.lua");

--��һЩ�����ϵĶ������������� �������
g_tGTaskId = {1319, 1335};  --�漰��������id �鿴gtask_main
g_szNpcName = "<color=green>Ho�n Nhan A C�t ��<color>: ";

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
		Talk(1, "", szNpcName .. ": D�o n�y lo ��nh tr�n, kh�ng bi�t h�m nay t��ng qu�n �� gi�o hu�n ch�a?");
		return 0;
	end
	
	--�ж���Ʒ
	if GetItemCount(2,111,2) < 1 then
		Talk(1, "", szNpcName .. ": D�o n�y lo ��nh tr�n, kh�ng bi�t h�m nay t��ng qu�n �� gi�o hu�n ch�a?");
		return 0;
	end
	if gf_Judge_Room_Weight(1,10, "") ~= 1 then return 0; end
	
	if DelItem(2,111,2,1) ~= 1 then return 0; end
	
	gf_AddItemEx({2,111,11,1}, "Th� g�i cho Ho�n Nhan T�ng H�n");
	
	local szPlayerName = GetName();
	local szMsg = format("%s �Li�u ch� th�t ��c, trong ngo�i li t�m. Tri�u H�ng S� ta ��i nghi�p s�p th�nh r�i.� Ha Ha, Qu� nhi�n T�ng H�n r�t hi�u l�ng ta, ng��i h�y giao b�c th� n�y cho h�n, h�n s� hi�u t�m � c�a ta.", g_szNpcName);

	Talk(1, "", szMsg);
end

function OnDeath(nNpcIdx)
	--RemoveNpc(nNpcIdx);
end