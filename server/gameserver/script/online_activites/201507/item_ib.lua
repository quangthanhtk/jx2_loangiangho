Include("\\script\\online_activites\\201507\\main_head.lua")

function OnUse(nItemIndex)
	if gf_CheckEventDateEx(VET_201507_ID) ~= 1 then
		Talk(1,"","V�t ph�m �� h�t h�n!");
		return 0;
	end
	if VET_201507_Item1UseTime()<VET_201507_GetItem1MaxUseTime() then
		Talk(1,"",format("S� d�ng �� %d %s v� %d %s m�i ���c d�ng!", 2000, "Qu�n L�nh Trung C�p", 2000, "Qu�n L�nh Cao C�p"));
		return 0
	end
	if VET_201507_Item2UseTime()<VET_201507_GetItem2MaxUseTime() then
		Talk(1,"",format("S� d�ng �� %d %s v� %d %s m�i ���c d�ng!", 2000, "Qu�n L�nh Trung C�p", 2000, "Qu�n L�nh Cao C�p"));
		return 0
	end
	
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	if tbActivity then
		tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
	end
end