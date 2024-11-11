--�����˸��Ľ�ҩ�����������µ��ż���
--E:\Kingsoft\��Ϸ������Դ\�������⴫\����������ļ�\GameSvr\script\lib\define.lua
Import("\\script\\lib\\define.lua")

--TASKID_SW_USE_ANTIDOTE  = 3476;
--TASKID_SW_READ_LETTER   = 3477      

tItemInfo = {
	[111] = {"Thu�c gi�i c�a h�c y nh�n",TASKID_SW_USE_ANTIDOTE,"Sau khi d�ng thu�c gi�i do h�c y nh�n �� l�i, xem ra ch�t ��c �� b� ng�n ch�n r�i.",1,1},  --{"",taskid,"msg",stateID,ifDelete}
	[113] = {"Th� t�n do h�c y nh�n �� l�i",TASKID_SW_USE_ANTIDOTE,"Thi�u hi�p hi�n t�i tuy �� tr�ng k�ch ��c, nh�ng ch�ng ta �o�n r�ng thi�u hi�p nh�t ��nh s� quay l�i �� t�m v�t ph�m n�y. �a t� thi�u hi�p �� gi�p ch�ng t�i m� c� quan n�n m�i tr�ng ��c, thu�c gi�i n�y tuy kh�ng th� ph�c h�i c�ng l�c, nh�ng c�ng c� th� gi� ���c m�ng s�ng. V� �i�u tra chuy�n c�ng ph�m, v�t ph�m trong h�p ch�ng t�i s� l�y �i, �� v�n l� l�nh b�i c�a <color=green>Li�u Qu�c Ti�u Thi�n H�u<color>, n�u thi�u hi�p v�n mu�n ti�p t�c �i�u tra, th� nh� h�y c�n th�n!",},	
	}

tItemID1 = 2;
tItemID2 = 96;
function OnUse(nItemIdx)

	local g,d,p = GetItemInfoByIndex(nItemIdx);
	if g ~= tItemID1 or d ~= tItemID2 or not tItemInfo[p] then
		return 0;
	end          
	local tItem =  tItemInfo[p];
	if  tItemInfo[p][5] and  tItemInfo[p][5] == 1  then
		if DelItem(g,d,p,1) ~= 1 then return 0;end;
	end
	if tItem[3] and tItem[1] and tItem[3] ~= "" then
		Talk(1,"",tItem[3])
	end
	if tItem[2] then
		SetTask(tItem[2],1);
	end
	if type(tItem[4]) == "number" then
		RemoveState(tItem[4]);
	end

end