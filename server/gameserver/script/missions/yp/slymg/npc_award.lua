Import("\\script\\lib\\define.lua")

function main()
	local tSay = {
		"\n xem c� nh�ng g�/OpenIBShop",
		"\n ��i t�i v��t �i xong r�i ��n t�m b�n nh�./nothing",
	}
	local msg = format("<color=gold>%s<color>:", GetTargetNpcName());
	msg = msg.."V��t ph�n �� nh� �i tr�n ��t b�ng, c�ng l�c hi�p s� qu� nhi�n b�t th��ng, n�u l�y ���c danh s�ch, c� th� ho�n ��i v�i t�i, tin ch�c r�ng c� m�t s� v�t ph�m kh�ng t� ��u.";
	msg = msg..format("<color=green>B�n hi�n t�i c� %d �i�m t�ch l�y Long H� ���ng<color>", GetTask(TASK_MISSION_BAIHUTANG_SCORE));
	Say(msg, getn(tSay), tSay)
end

function OpenIBShop()
	SendScript2VM("\\script\\equip_shop\\equip_shop_head.lua", "show_equip_shop(3067)");
end