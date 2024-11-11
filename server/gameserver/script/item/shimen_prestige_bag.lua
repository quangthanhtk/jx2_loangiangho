Import("\\script\\lib\\globalfunctions.lua")

--gdp��

TASKID_DAILY_SPB_USE_COUNT 		= 3606	--���壺��¼ÿ��ʹ�ô���

N_SPB_DAILY_USE_COUNT_LIMIT 	= 16	--ÿ��ʹ������
N_SPB_FACTION_PRESTIGE_PER_BAG 	= 3400	--ÿ��ʦ������


function OnUse(nItemIdx)
	if GetTask(TASKID_NFT_FACTION_PRESTIGE) + N_SPB_FACTION_PRESTIGE_PER_BAG > G_N_FACTION_PRESTIGE_MAX then
		Talk(1,"","Danh V�ng S� M�n �� ho�c s�p ��t m�c t�i �a, kh�ng th� ��i n�a.")
		return
	end

	if GetTask(TASKID_DAILY_SPB_USE_COUNT) >= N_SPB_DAILY_USE_COUNT_LIMIT then
		Talk(1,"","�� h�t l��t ��i h�m nay, ng�y mai th� l�i sau.")
		return
	end

	gf_SetLogCaption("OPEN_PRESTIGE_BAG")

	if gf_DelItemByIndex(nItemIdx, 1) ~= 1 then
		Talk(1,"",format("��o c� b� l�i"))
		return
	end

	gf_ModifyTask(TASKID_DAILY_SPB_USE_COUNT, 1)
	gf_Modify("ShiMenWeiWang", N_SPB_FACTION_PRESTIGE_PER_BAG)
	gf_SetLogCaption("")
end

function nothing()
end