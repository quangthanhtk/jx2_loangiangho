--ʥ��
Include("\\script\\missions\\yp\\award.lua")

function main()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local m = GetWorldPos();
	if tMainMapID[nCamp] == nil or tMainMapID[nCamp][1] ~= m then
		Talk(1,"","Ch� c� ng��i ch�i thu�c th� l�c m�i c� th� nh�t th�nh v�t n�y!");
		return 0;
	end 
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	SetTask(TASK_FIELD_PVP_FIREBOX_NUM,GetTask(TASK_FIELD_PVP_FIREBOX_NUM)+1);
	local nNum = GetTask(TASK_FIELD_PVP_FIREBOX_NUM);
	if nNum >= 250 then
		WriteLog(format("[Nh�t k�] [Type: Th�nh v�t pvp d� ngo�i] [Role:%s (acc:%s)] [event: S� l�n nh�t %d l�n.]", GetName(),GetAccount(),nNum));
	end
	if nNum > 810 then
		Talk(1,"","��i m�t c�a ki�m ��ng A L��ng �ang nh�n ch�m ch� v�o ng��i, l�m nhi�u vi�c b�t ngh�a t�c l� t� s�t!");
		return 0;
	end
	local nNpcIdx = GetTargetNpc();
	SetNpcLifeTime(nNpcIdx,0);
	SetNpcScript(nNpcIdx,"");
	yp_aw_giveAward_1();
end