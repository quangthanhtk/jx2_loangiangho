--����Կ��
Import("\\script\\lib\\define.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\lib\\globalfunctions.lua")

nItemId1 = 2;
nItemId2 = 96;
tItem = {
	[137] = {5077,1797,3211,"��ng b�c",1},
	[140] = {5077,1687,3545,"T�y nam",2},
	[138] = {5077,1626,3177,"T�y b�c",3},
	[139] = {5077,1876,3563,"��ng nam",4},
	}
tInfo ={
	{936,TASKID_SW_USE_KEY,},
	{1012,TASKID_SW_USE_KEY},
	}
tNpcInfo = {
		["Thi�n �m C� Quan Tr�n Ph�p (T�y)"]=1,
		["Thi�n �m C� Quan Tr�n Ph�p (Nam)"]=2,
		["Thi�n �m C� Quan Tr�n Ph�p (B�c)"]=3,
		["Thi�n �m C� Quan Tr�n Ph�p (��ng)"]=4,
	}
function OnUse(nItemIdx)
	local g,d,p = GetItemInfoByIndex(nItemIdx)
	if g ~= nItemId1 or d ~= nItemId2  or not tItem[p] then
		return 0;
	end
	local nTask = 0;
	for i = 1,getn(tInfo) do
		if tGtTask:check_cur_task(tInfo[i][1]) == 1 then
			nTask = tInfo[i][2];
			break;
		end
	end
	if nTask == 0 then
		return 0;
	end
	local nMapId,nX,nY = GetWorldPos();
	if nMapId ~= tItem[p][1] or abs(nX - tItem[p][2]) >= 40 or abs(nY - tItem[p][3]) >= 40 then
		Talk(1,"",tItem[p][4] .. "Ch�a Kh�a C� Quan: H�y ��n C� Quan Tr�n Ph�p t��ng �ng �� d�ng ch�a kh�a.");
		return 0;
	end	
	if abs(nX - tItem[p][2]) <= 5 and abs(nY - tItem[p][3]) <= 5 then
		Talk(1,"",tItem[p][4] .. "Ch�a Kh�a C� Quan: Ng��i �� ��ng th�nh c�ng tr�n ph�p ph�ng th� ph�a t�y c�a Thi�n �m Gi�o.");
	else
		Talk(1,"",tItem[p][4].. "C� Quan Tr�n Ph�p: H�y ��n g�n c� quan h�n n�a.");
		return 0;
	end
	gf_SetTaskBit(nTask,tItem[p][5],1);
end


function OnDeath(nNpcIdx)
	local sName = GetNpcName(nNpcIdx);
	if tNpcInfo[sName] == nil then return 0; end
	local nTask = 0;
	for i = 1,getn(tInfo) do
		if tGtTask:check_cur_task(tInfo[i][1]) == 1 then
			nTask = tInfo[i][2];
			break;
		end
	end
	if nTask == 0 then
		return 0;
	end
	local nBit = tNpcInfo[sName];
	gf_SetTaskBit(nTask,nBit,1);
end
