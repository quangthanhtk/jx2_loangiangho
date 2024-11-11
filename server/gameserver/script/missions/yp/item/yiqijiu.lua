Include("\\script\\missions\\yp\\yp_head.lua")

function OnUse()
	Say("D�ng s� t�ng <color=yellow>50 �i�m<color> th�n thi�n v�i ��i tr��ng, tr��c khi d�ng h�y k�t h�o h�u v�i ��i tr��ng tr��c, b�ng kh�ng khi d�ng s� kh�ng nh�n ���c hi�u qu�. ��ng � d�ng?",
		2,
		"\n��ng/confirm_use",
		"\nK�t th�c ��i tho�i/nothing")
end

function confirm_use()
	local nSize = GetTeamSize();
	if nSize < 2 then
		Talk(1,"","H�y t� ��i r�i s� d�ng v�t ph�m n�y!");
		return 0;
	end
	if PlayerIndex == GetTeamMember(0) then
		Talk(1,"","Ng��i l� ��i tr��ng, kh�ng th� s� d�ng v�t ph�m n�y!");
		return 0;
	end
	local nCount = GetItemCount(tPVPItemInfo[16][2],tPVPItemInfo[16][3],tPVPItemInfo[16][4]);
	AskClientForNumber("confirm_use_final",1,nCount,"S� d�ng bao nhi�u?")
end

function confirm_use_final(nCount)
	local nNum = GetItemCount(tPVPItemInfo[16][2],tPVPItemInfo[16][3],tPVPItemInfo[16][4]);
	if nNum < nCount then
		Talk(1,"","V�t ph�m tr�n ng��i kh�ng ��!");
		return 0;
	end
	local nSize = GetTeamSize();
	if nSize < 2 then
		Talk(1,"","H�y t� ��i r�i s� d�ng v�t ph�m n�y!");
		return 0;
	end
	if PlayerIndex == GetTeamMember(0) then
		Talk(1,"","Ng��i l� ��i tr��ng, kh�ng th� s� d�ng v�t ph�m n�y!");
		return 0;
	end	
	if DelItem(tPVPItemInfo[16][2],tPVPItemInfo[16][3],tPVPItemInfo[16][4],nCount) == 1 then
		ModifyFriendliness(GetName(GetTeamMember(0)),50*nCount);
	end
end