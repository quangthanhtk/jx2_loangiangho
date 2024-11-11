Include("\\script\\missions\\yp\\yp_head.lua")
Import("\\script\\tmp_task_id_def.lua")

tItemInfo = 
{
	[1] = {2, 95, 929,"T� L�a ��i L�"},
	[2] = {2,	95,	930,"Da L�ng Th� Ph�n"},
	[3] = {2, 95, 928,"Ch�u B�u T�y H�"},
}

function get_type(nItemIdx)
	local genre,detail,particular = GetItemInfoByIndex(nItemIdx);
	for i=1,getn(tItemInfo) do
		if genre == tItemInfo[i][1] and detail == tItemInfo[i][2] and particular == tItemInfo[i][3] then
			return i;
		end;
	end;
	return 0;
end;

function OnUse(nItemIdx)
	local nType = get_type(nItemIdx);
	if nType == 0 then
		return 0;
	end;
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= nType then
		Talk(1,"","��i hi�p kh�ng thu�c th� l�c n�y, kh�ng th� d�ng v�t ph�m n�y!");
		return 0;
	end
	local selTab = {
				"\nX�c nh�n/#confirm_use_final("..nItemIdx..")",
				"\n h�y b�/nothing",
				}
	Say(tItemInfo[nType][4]..": Sau khi d�ng s� nh�n ���c �i�m c�ng hi�n th� l�c <color=yellow>10 �i�m<color>.\n��ng � d�ng??", getn(selTab), selTab);	
end

function confirm_use_final(nItemIdx)
	SetTaskTemp(TEMP_FIELD_PVP_CHOOSE_GXD,nItemIdx);
	local nType = get_type(nItemIdx);
	if nType == 0 then
		return 0;
	end;
	local nCount = GetItemCount(tItemInfo[nType][1],tItemInfo[nType][2],tItemInfo[nType][3]);	
	AskClientForNumber("confirm_use_final_ag",1,nCount,"S� d�ng bao nhi�u?")
end

function confirm_use_final_ag(nCount)
	local nItemIdx = GetTaskTemp(TEMP_FIELD_PVP_CHOOSE_GXD);
	local nType = get_type(nItemIdx);
	if nType == 0 then
		return 0;
	end;
	local nNum = GetItemCount(tItemInfo[nType][1],tItemInfo[nType][2],tItemInfo[nType][3]);	
	if nNum < nCount then
		Talk(1,"","V�t ph�m tr�n ng��i ��i hi�p kh�ng ��!");
		return 0;
	end 
	if DelItem(tItemInfo[nType][1],tItemInfo[nType][2],tItemInfo[nType][3],nCount) == 1 then
		yp_setValue(1,nCount*10);
	end
end