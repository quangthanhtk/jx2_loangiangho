--�Ѿ����򿪵ĺ���(2,96,112)\ ���ʵ�����
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\define.lua")

nItemId1 = 2;
nItemId2 = 96;
tInfo = {
	[112] = {{2,96,113,1,4},"Th� t�n do h�c y nh�n �� l�i","Chi�c h�p �� b� m� ra"},
	[129] = {{2,96,130,1,4},"Qu� ��o","Qu� ��o t��i"};
	}
function OnUse(nItemIdx)
	if GetTask(TASKID_SW_USE_ANTIDOTE) == 1 then return 0;end;
	local g,d,p = GetItemInfoByIndex(nItemIdx);
	if g ~= nItemId1 or d ~= nItemId2 or not tInfo[p] then
		return 0;
	end
	if gf_Judge_Room_Weight(1,10,tInfo[p][3]) ~= 1 then
		return 0;
	end
	gf_AddItemEx(tInfo[p][1],tInfo[p][2]);
	SetTask(TASKID_SW_USE_ANTIDOTE,1);
end

