Include("\\script\\isolate\\online_activites\\catch_fish\\head.lua")

function main()
	npc_talk_main()
end

function npc_talk_main()
	if check_player_condition()~= 1 then
		return
	end
	local szTitle = format("Th��ng Nh�n H�i S�n: G�n ��y ��i V��ng Ba T� b� nghi�n m�n h�i s�n, n�n �� d�ng b�u v�t trong cung �� ��i h�i s�n. C�c b�n h�y nhanh ch�ng ��n �� v� kh�u v� c�a ��i V��ng Ba T� thay ��i r�t nhanh.")
	local tbSay = {}
	tinsert(tbSay, format("%s/npc_talk_desc", "L�m sao nh�n ���c h�i s�n"))
	tinsert(tbSay, format("%s/npc_talk_open_shop", "Ta c� h�i s�n, ta mu�n ��i"))
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function npc_talk_desc()
	local szTitle = format("Th��ng Nh�n H�i S�n: Ta �� m�i m�t ng��i Ng� Ph� gi�p ta ��nh b�t h�i s�n, nh�ng ch� m�t ng��i e r�ng l�m kh�ng xu�, ng��i c� th� ��n ��ng H�i H�i Binh 1 (227, 209) t�m th�. Ng� ph� �� l�m ra r�t nhi�u Ng� D�n Th� Ph�o, ch� c�n b� c�c lo�i ph�o v�o trong th� c� th� b�t ��u n� c�.")
	local tbSay = {}
	tinsert(tbSay, format("%s/npc_talk_main", "tr� l�i"))
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function npc_talk_open_shop()
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", 3096, "Ti�m H�i S�n"));
end
