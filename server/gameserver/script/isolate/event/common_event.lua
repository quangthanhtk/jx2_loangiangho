
--���飺ȡ����װ
function OnEnhanceCollectionPop(nPart, nEnchantLevel, nItemLevel )
	FireEvent("event_equip_operation","yunling", nEnchantLevel, nPart, 0)
	return 1
end
--���飺ʹ�õ���
function OnEnhanceEmbroidery(nPart, nEmbroideryLv)
	FireEvent("event_equip_operation","yunling", nEmbroideryLv, nPart, 0)
	return 1
 end 