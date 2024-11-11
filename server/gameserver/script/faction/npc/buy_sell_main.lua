--�ű����ܣ�ʦ��NPC����-����
--���ܿ������峤
--����ʱ�䣺2011-4-2
--�޸ļ�¼��
--�һ�ѡ������Ի�����
Include("\\script\\faction\\faction_head.lua")
Import("\\settings\\static_script\\lib\\item_define.lua")

function faction_buysell_main(nFactionId)
	local tSay = {
		"Ta mu�n mua m�t s� v�t d�ng./#normal_buy("..nFactionId..")",
		"Ta nghe n�i s� m�n c� 1 th�n binh b�o gi�p th�ch h�p v�i giang h� t�n th�? Ta mu�n xem xem nh� th� n�o./#faction_buy("..nFactionId..",2)",
		"Ta nghe n�i s� m�n c� 1 b� th�n binh b�o gi�p gi�nh cho v� l�m cao th�? H�y cho ta xem!/#faction_buy("..nFactionId..",3)",
		"Ta nghe n�i s� m�n c� 1 b� th�n binh b�o gi�p gi�nh cho tuy�t th� cao th�? H�y cho ta xem!/#faction_buy("..nFactionId..",4)",
		"L�m th� n�o �� nh�n ���c �� c�ng hi�n s� m�n./#contribution_get("..nFactionId..")",
	}
	if FT_RELEASE_WORK == 1 then
		tinsert(tSay, format("��i Trang B� S�t Tinh/#fp_buy_equip(%d)", nFactionId) )
--		tinsert(tSay, format("��Ҫ�һ�3���̰�/#fp_buy_armory(%d)", nFactionId) )
		tinsert(tSay, format("��i Danh V�ng S� M�n/#fp_buy_fp(%d)", nFactionId) )
	end

	tinsert(tSay, "R�i kh�i./cancel")

	return 
	format("<color=green>%s<color>:".."V� %s n�y, t�m ta c� vi�c g� kh�ng?",GetTargetNpcName(),TPLAYER_SEX_NAME[GetSex()]),
	tSay
end
--��ͨ����
function normal_buy(nFactionId)
	Sale(TFACTION_INFO[nFactionId].tShopId[1])
end
--ʦ��װ������
function faction_buy(nFactionId,nShopStep)
	if GetPlayerFaction() ~= nFactionId then
		Say(format("<color=green>%s<color>#Ng��i kh�ng ph�i �� t� %s ta, sao c� th� mua m�t t�ch c�a b� m�n ���c?",GetTargetNpcName(),TFACTION_INFO[nFactionId].sFactionName),0)
		return
	else
		Sale(TFACTION_INFO[nFactionId].tShopId[nShopStep])
	end
end
--ʦ�Ź��׶�����
function contribution_get(nFactionId)
	local sDiaHead = format("<color=green>%s<color>#%s n�n quay v� t�m ch��ng m�n qu� ph�i �� nh�n nhi�m v� s� m�n, ho�n th�nh c� th� nh�n ���c <color=red>�i�m c�ng hi�n s� m�n<color>.",GetTargetNpcName(),TPLAYER_SEX_NAME[GetSex()])
	if GetPlayerFaction() == nFactionId then
		sDiaHead = format("<color=green>%s<color>#��n t�m ch��ng m�n b�n ph�i �� nh�n nhi�m v� s� m�n, ho�n th�nh c� th� nh�n ���c <color=red>�i�m c�ng hi�n s� m�n<color>#",GetTargetNpcName(),TPLAYER_SEX_NAME[GetSex()])
	end
	Say(sDiaHead,
		2,
		"Tr� l�i./main",
		"R�i kh�i./cancel"
	)
end
--�����Ի�
function cancel()
end

T_PRESTIGE_EXCHANGE_EQUIP_CONFIG ={
	-- ԭʼװ��						   --�һ�����{g,d,p,name,nBind,ʦ����������},
	-- [gf_PackItemGDP(0, 7, 30896)] = {2, 1, 31313, "ɱ�����ƣ�ͷ��", 1, 3500000},
}
T_PRESTIGE_EXCHANGE_ARMORY_CONFIG ={
	-- ԭʼװ��						   --�һ�����{g,d,p,name,nBind,ʦ����������,����Ʒ��Ҫ��},
	-- [gf_PackItemGDP(0, 116, 20)] = {2, 1, 31261, "3���任ͷ���̰�", 1, 540000, 3},
}

function _fp_init_prestige_exchange_config()
	local szConfigPath = "\\settings\\item\\exchange\\faction_prestige_equip.txt"
	local tConfig = ff_GetTabFileTableEx(szConfigPath,2)
	local tConfig = gf_TableNumberElementToNumber(tConfig)

	for i=1, getn(tConfig) do
		tinsert(
			T_PRESTIGE_EXCHANGE_EQUIP_CONFIG, 
			gf_PackItemGDP(tConfig[i]["G"], tConfig[i]["D"], tConfig[i]["P"]),
			{
				tConfig[i]["tG"],
				tConfig[i]["tD"],
				tConfig[i]["tP"],
				GetItemName(tConfig[i]["tG"], tConfig[i]["tD"], tConfig[i]["tP"]),
				tConfig[i]["tBind"],
				tConfig[i]["CostPrestige"],
			}
		)
	end
	T_PRESTIGE_EXCHANGE_EQUIP_CONFIG.n = nil

	szConfigPath = "\\settings\\item\\exchange\\faction_prestige_armory.txt"
	tConfig = ff_GetTabFileTableEx(szConfigPath,2)
	tConfig = gf_TableNumberElementToNumber(tConfig)

	for i=1, getn(tConfig) do
		tinsert(
			T_PRESTIGE_EXCHANGE_ARMORY_CONFIG, 
			gf_PackItemGDP(tConfig[i]["G"], tConfig[i]["D"], tConfig[i]["P"]),
			{
				tConfig[i]["tG"],
				tConfig[i]["tD"],
				tConfig[i]["tP"],
				GetItemName(tConfig[i]["tG"], tConfig[i]["tD"], tConfig[i]["tP"]),
				tConfig[i]["tBind"],
				tConfig[i]["CostPrestige"],
				tConfig[i]["Quality"],
			}
		)
	end
	T_PRESTIGE_EXCHANGE_ARMORY_CONFIG.n = nil
end

_fp_init_prestige_exchange_config()

function fp_buy_equip(nFactionId)
	if GetPlayerFaction() ~= nFactionId then
		Say(format("<color=green>%s<color>#Ng��i kh�ng ph�i �� t� %s ta, sao c� th� mua m�t t�ch c�a b� m�n ���c?",GetTargetNpcName(),TFACTION_INFO[nFactionId].sFactionName),0)
		return
	end
	local tSay = {
		format("��i S�t Tinh L�nh B�i (V� Kh�)/#_fp_buy_equip(%d)", itempart_weapon),
		format("��i S�t Tinh L�nh B�i (��u)/#_fp_buy_equip(%d)", itempart_head),
		format("��i S�t Tinh L�nh B�i (�o)/#_fp_buy_equip(%d)", itempart_body),
		format("��i S�t Tinh L�nh B�i (Qu�n)/#_fp_buy_equip(%d)", itempart_foot),
		format("��i S�t Tinh L�nh B�i (Trang S�c)/#_fp_buy_equip(%d)", itempart_ring),
		"R�i kh�i./cancel"
	}
	Say(format("<color=green>%s<color>: H�y n�ng c�p ho�c ��i %s c�n thi�t v� m�c l�n ng��i (Trang s�c c�n �eo v�o v� tr� s� 1)", 
		GetTargetNpcName(),
		"<color=yellow>Trang B� �m Huy�t<color>"),
	getn(tSay),
	tSay);
end

function fp_buy_armory(nFactionId)
	if GetPlayerFaction() ~= nFactionId then
		Say(format("<color=green>%s<color>#Ng��i kh�ng ph�i �� t� %s ta, sao c� th� mua m�t t�ch c�a b� m�n ���c?",GetTargetNpcName(),TFACTION_INFO[nFactionId].sFactionName),0)
		return
	end
	local tSay = {
		format("��i Kh�c B�n Ho�n M� C�p 3 (��u)/#_fp_buy_equip(%d)", itempart_armory_head),
		format("��i Kh�c B�n Ho�n M� C�p 3 (�o)/#_fp_buy_equip(%d)", itempart_armory_body),
		format("��i Kh�c B�n Ho�n M� C�p 3 (Qu�n)/#_fp_buy_equip(%d)", itempart_armory_foot),
		format("��i Kh�c B�n Ho�n M� C�p 3 (Nh�n)/#_fp_buy_equip(%d)", itempart_armory_ring1),
		format("��i Kh�c B�n Ho�n M� C�p 3 (Ng�c B�i)/#_fp_buy_equip(%d)", itempart_armory_ring2),
		"R�i kh�i./cancel"
	}
	Say(format("<color=green>%s<color>: H�y n�ng c�p ho�c ��i %s c�n thi�t v� m�c l�n ng��i (Trang s�c c�n �eo v�o v� tr� s� 1)", 
		GetTargetNpcName(),
		"<color=yellow>Hoa V�n Ho�n M� C�p 2<color>"),
	getn(tSay),
	tSay);
end

function _fp_buy_equip(nEquipPart, bConfirm)
	if not nEquipPart or nEquipPart < 0 then
		return
	end

	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end

	local tConfig = nil
	local bIsArmory = 0
	if itempart_armory_head <= nEquipPart and nEquipPart <= itempart_armory_ring2 then
		--����
		tConfig = T_PRESTIGE_EXCHANGE_ARMORY_CONFIG
		bIsArmory = 1
	else
		tConfig = T_PRESTIGE_EXCHANGE_EQUIP_CONFIG
	end
	-- print("======tConfig = ")
	-- gf_PrintTable(tConfig)

	local nItemIdx = GetPlayerEquipIndex(nEquipPart)
	-- print("======nItemIdx =", nItemIdx)
	if not nItemIdx or nItemIdx == 0 then
		Talk(1,"",format("<color=green>%s<color>: H�y n�ng c�p ho�c ��i %s c�n thi�t v� m�c l�n ng��i (Trang s�c c�n �eo v�o v� tr� s� 1)",
			GetTargetNpcName(),
			"Trang b�"));
		return
	end

	local g, d, p = GetItemInfoByIndex(nItemIdx);
	local nGDP = gf_PackItemGDP(g, d, p);
	local tExchange = tConfig[nGDP] or nil

	if not tExchange then
		Talk(1,"",format("<color=green>%s<color>: H�y n�ng c�p ho�c ��i %s c�n thi�t v� m�c l�n ng��i (Trang s�c c�n �eo v�o v� tr� s� 1)",
			GetTargetNpcName(),
			"Trang b�"));
		return
	end

	local nFpCost = tExchange[6]
	local nG, nD, nP = tExchange[1], tExchange[2], tExchange[3]
	local nBind = tExchange[5]
	if GetTask(TASKID_NFT_FACTION_PRESTIGE) < nFpCost then
		Talk(1,"",format("Danh V�ng S� M�n ch�a �� %d",nFpCost));
		return
	end

	if bIsArmory == 1 and GetArmoryQuality(nItemIdx) ~= tExchange[7] then
		Talk(1,"",format("Hoa V�n �ang d�ng ch�a ��t ph�m ch�t y�u c�u")); 
		return
	end

	if not bConfirm or bConfirm ~= 1 then
		local szBack = "cancel"
		if bIsArmory == 1 then
			szBack = format("#fp_buy_armory(%d)", GetPlayerFaction())
		else
			szBack = format("#fp_buy_equip(%d)", GetPlayerFaction())
		end

		local tSay = {
			format("��ng �/#_fp_buy_equip(%d,%d)", nEquipPart, 1),
			format("Ph�n h�i/%s", szBack)
		}
		Say(format("<color=green>%s<color>: D�ng <color=red>%s x%d + %s x%d<color> ��i <color=yellow>%s x%d<color>".."(Ch� �: <color=red>Kh�ng gi� l�i c�p c��ng h�a v� c�p b�o th�ch c�a trang b� g�c<color>)", 
				GetTargetNpcName(),
				GetItemName(g,d,p),
				1,
				"Danh V�ng S� M�n",
				nFpCost,
				GetItemName(nG,nD,nP),
				1
				),
			getn(tSay),
			tSay);
		return
	end

	gf_SetLogCaption("FACTION_PRESTIGE_BUY_EQUIP")

	if gf_DelItemByIndex(nItemIdx, -1) ~= 1 then
		Talk(1,"",format("��o c� b� l�i"));
		return
	end

	if gf_Modify("ShiMenWeiWang", -nFpCost) ~= 1 then
		Talk(1,"",format("Danh V�ng S� M�n ch�a �� %d",nFpCost));
		return
	end

	gf_AddItemEx({nG,nD,nP,1, nBind>0 and 4 or nil})
	gf_SetLogCaption("")
end

TASKID_FP_DAILY_EXCHANGE_FP_BYTE 	= 3605	--���壺��byte�� ��¼ÿ�յ��߶һ�ʦ����������

T_EXCHANGE_PRESTIGE_CONFIG = {
	--[]={{gdpn}, 		ʦ������, ÿ�����ƴ���(<=255), ÿ���Ѷһ�����taskid, byteλ(<=4)}
	[1] = {{2,95,204, 1}, 60000, 1, TASKID_FP_DAILY_EXCHANGE_FP_BYTE, 1},
	[2] = {{2,1,30370,1}, 60000, 1, TASKID_FP_DAILY_EXCHANGE_FP_BYTE, 2},
}

function fp_buy_fp(nFactionId)
	if GetPlayerFaction() ~= nFactionId then
		Say(format("<color=green>%s<color>#Ng��i kh�ng ph�i �� t� %s ta, sao c� th� mua m�t t�ch c�a b� m�n ���c?",GetTargetNpcName(),TFACTION_INFO[nFactionId].sFactionName),0)
		return
	end
	local tSay = {
		--format("%sx%d�һ�%dʦ������(ÿ��%d/%d)/#_fp_buy_fp(%d)", ...),
	}
	local tInfo = nil
	for i=1,getn(T_EXCHANGE_PRESTIGE_CONFIG) do
		tInfo = T_EXCHANGE_PRESTIGE_CONFIG[i]
		tinsert(tSay, format("%s x%d ��i %d Danh V�ng S� M�n (M�i ng�y: %d/%d)/#_fp_buy_fp(%d)",
			GetItemName(tInfo[1][1],tInfo[1][2],tInfo[1][3]),
			tInfo[1][4],
			tInfo[2],
			gf_SafeGetTaskByte(tInfo[4], tInfo[5]),
			tInfo[3],
			i)
		)
	end
	tinsert(tSay, "R�i kh�i./cancel")

	Say(format("<color=green>%s<color>: H�y l�a ch�n ph��ng th�c ��i:", 
			GetTargetNpcName()),
		getn(tSay),
		tSay);
end

function _fp_buy_fp(nType, bConfirm)
	local tInfo = T_EXCHANGE_PRESTIGE_CONFIG[nType]

	if not tInfo then
		return
	end

	local nCurCount = gf_SafeGetTaskByte(tInfo[4], tInfo[5])
	if nCurCount >= tInfo[3] then
		Talk(1,"","�� h�t l��t ��i h�m nay, ng�y mai th� l�i sau.")
		return
	end

	if GetTask(TASKID_NFT_FACTION_PRESTIGE) + tInfo[2] > G_N_FACTION_PRESTIGE_MAX then
		Talk(1,"","Danh V�ng S� M�n �� ho�c s�p ��t m�c t�i �a, kh�ng th� ��i n�a.")
		return
	end

	if not bConfirm or bConfirm ~= 1 then
		local tSay = {
			format("��ng �/#_fp_buy_fp(%d,%d)", nType, 1),
			format("tr� l�i/#fp_buy_fp(%d)", GetPlayerFaction())
		}

		Say(format("<color=green>%s<color>: D�ng <color=red>%s x%d<color> ��i <color=yellow>%s x%d<color>", 
				GetTargetNpcName(),
				GetItemName(tInfo[1][1],tInfo[1][2],tInfo[1][3]),
				tInfo[1][4],
				"Danh V�ng S� M�n",
				tInfo[2]),
			getn(tSay),
			tSay);
		return
	end

	gf_SetLogCaption("PAY_ITEM_BUY_FACTION_PRESTIGE")

	if gf_DelItem(tInfo[1][1],tInfo[1][2],tInfo[1][3],tInfo[1][4]) ~= 1 then
		Talk(1,"","Kh�ng �� v�t ph�m")
		return
	end

	gf_SafeSetTaskByte(tInfo[4], tInfo[5], nCurCount + 1)
	gf_Modify("ShiMenWeiWang", tInfo[2])
	gf_SetLogCaption("")

	fp_buy_fp(GetPlayerFaction())
end