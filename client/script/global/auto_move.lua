--ÅäÖÃÏî Begin

--²éÑ¯ÏûºÄÄÍ¾Ã
AUTO_MOVE_QUERY_COST = 20;

--ÅäÖÃÏî End


function CanQueryTargetPlayerPos(nMaxDurability)

	if (nMaxDurability < AUTO_MOVE_QUERY_COST) then
		return 0, "B¹n İt nhÊt cÇn "..AUTO_MOVE_QUERY_COST.." ®iÓm ®é bÒn 'ThÇn hµnh bİ phæ' hoÆc 'ThÇn hµnh b¶o ®iÓn' míi cã thÓ t×m ng­êi"
	end

	return 1, ""

end