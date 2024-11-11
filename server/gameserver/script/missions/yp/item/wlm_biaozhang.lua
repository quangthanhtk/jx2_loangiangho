Include("\\script\\missions\\yp\\yp_head.lua")

function OnUse()
	Say("S� d�ng nh�n ���c<color=yellow>10 �i�m<color>danh v�ng th� l�c#c� s� d�ng kh�ng#",
		2,
		"\n��ng/confirm_use",
		"\nK�t th�c ��i tho�i/nothing")
end

function confirm_use()
	local nCount = GetItemCount(tPVPItemInfo[26][2],tPVPItemInfo[26][3],tPVPItemInfo[26][4]);
	AskClientForNumber("confirm_use_final",1,nCount,"S� d�ng bao nhi�u?")
end

function confirm_use_final(nCount)
	local nNum = GetItemCount(tPVPItemInfo[26][2],tPVPItemInfo[26][3],tPVPItemInfo[26][4]);
	if nNum < nCount then
		Talk(1,"","V�t ph�m tr�n ng��i kh�ng ��!");
		return 0;
	end
	if DelItem(tPVPItemInfo[26][2],tPVPItemInfo[26][3],tPVPItemInfo[26][4],nCount) == 1 then
		yp_setValue(5,10*nCount);
	end
end