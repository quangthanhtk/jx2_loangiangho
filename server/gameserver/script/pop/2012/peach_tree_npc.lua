--���� �� ������
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

tInfo = {--��NPC name��={{taskid,},[{item info}],"item name",[sTalkMsg]} 
	["Thu�n theo t� nhi�n"] = {{927},			{2,96,122,1,4},	"Thu�n theo t� nhi�n",	"Nh�n ph�p ��a, ��a ph�p thi�n, thi�n ph�p ��o, ��o ph�p t� nhi�n. V�n v�t ��u c� ��o, ch�ng ta n�n thu�n theo t� nhi�n, m�i th� ��u c� nh�n qu�, kh�ng n�n ngh�ch theo � tr�i. <color=yellow>Ng��i ch�n ��ng r�i, ��y ch�nh l� gi�o l� c�a ��o Gia<color>.",},
	["Ki�m t� thi�n h�"] = {{927},			nil,						"",					"Xem ra ng��i v�n ch�a hi�u r� gi�o l� c�a ch�ng ta, <color=red>��y kh�ng ph�i l� gi�o l� c�a ��o Gia<color>.",},
	["T� bi l�m ��u"] = {{927},			nil,						"",					"Xem ra ng��i v�n ch�a hi�u r� gi�o l� c�a ch�ng ta, <color=red>��y kh�ng ph�i l� gi�o l� c�a ��o Gia<color>.",},
	["Tr��ng sinh b�t l�o"] = {{927},			{2,96,125,1,4},	"Tr��ng sinh b�t l�o",	"Tr��ng sinh b�t l�o chi ��o, c� tr� gi� d��ng sinh d�. Th�n th� l� v�n c�a t�m linh, qu�n t� d��ng sinh, k�o d�i tu�i th�.<color=yellow>Ng��i ch�n ��ng r�i, ��y ch�nh l� gi�o l� c�a ��o Gia<color>.",},
	["Thanh t�nh v� vi"] = {{927},			{2,96,126,1,4},	"Thanh t�nh v� vi",	"T� c� vu v� tri, nhi d� ch�ng nh�n chi s� tri vi tri; t� x� vu v� n�ng, nhi d� ch�ng nh�n chi s� n�ng vi n�ng; t� an vu v� vi, nhi d� ch�ng nh�n chi s� vi vi vi. Ph�m s�t s�t d� vi minh, t�a t�a d� vi n�ng, �� b�t th� ch� minh chi ��o. <color=yellow>Ng��i ch�n ��ng r�i, ��y ch�nh l� gi�o l� c�a ��o Gia<color>.",},
	["Tr� h� th� t�nh"] = {{927},			{2,96,127,1,4},	"Tr� h� th� t�nh",	"V�n v�t t�nh t�c, ng� d� quan ph�c. Phu v�t v�n v�n, c�c ph�c quy t� c�n. Quy c�n vi�t t�nh, th� vi�t ph�c m�nh. Ph�c m�nh vi�t th��ng, tri th��ng vi�t minh. <color=yellow>Ng��i ch�n ��ng r�i, ��y ch�nh l� gi�o l� c�a ��o Gia<color>.",},
	["Ni�t b�n tr�ng sinh"] = {{927},			nil,						"",					"Xem ra ng��i v�n ch�a hi�u r� gi�o l� c�a ch�ng ta, <color=red>��y kh�ng ph�i l� gi�o l� c�a ��o Gia<color>.",},
	}
function main()
	local nNpcIdx = GetTargetNpc();
	local sNpcName = GetNpcName(nNpcIdx);
	if not tInfo or not tInfo[sNpcName] then
		return 0;
	end
	local tTask = tInfo[sNpcName][1];
	local nHasTask = 0;
	if type(tTask) ~= "table" then
		nHasTask = 1;
	end
	for i = 1,getn(tTask) do
		if 1 == tGtTask:check_cur_task(tTask[i])  then
			nHasTask = 1
			break;
		end
	end
	if nHasTask ~= 1 then
		return 0;
	end  

	if type(tInfo[sNpcName][2]) == "table" then 
		if gf_Judge_Room_Weight(1,10,sNpcName) ~= 1 then
			return 0;
		end
		gf_AddItemEx(tInfo[sNpcName][2],tInfo[sNpcName][3]);
	end
	
	if type(tInfo[sNpcName][4]) == "string" then
		Talk(1,"",tInfo[sNpcName][4]);
	end

end
