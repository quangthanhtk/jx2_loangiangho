Include("\\script\\online_activites\\201506\\main_head.lua")

function OnUse(nItemIndex)
	if gf_CheckEventDateEx(VET_201506_ID) ~= 1 then
		Talk(1,"","V�t ph�m �� h�t h�n!");
		return 0;
	end
	
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	if tbActivity then
		tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
	end
end