Include("\\script\\isolate\\functions\\tong_title\\head.lua")

t_gxd_lingpai_cfg = {
	GXD_PER_USE=100,
	G = 2,
	D = 1,
	P = 30914,
	NAME = "L�nh b�i �� c�ng hi�n",
}
function handle_use_item_gxd_linpai(nIdx)
	return _handle_use_item_gxd_linpai(nIdx, 1)
end

function _handle_use_item_gxd_linpai(nIdx, ask_num)
	local t = t_gxd_lingpai_cfg
	if ask_num and ask_num == 1 then
		local szTitle = format("S� d�ng l�nh b�i �� c�ng hi�n s� nh�n ���c %d �� c�ng hi�n bang h�i, c� ch�c ch�n kh�ng?", t.GXD_PER_USE)
        local tbSay = {}
        tinsert(tbSay, format("%s/#_handle_use_item_gxd_linpai(%d, 0)", "��ng � d�ng", nIdx))
        tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
        Say(szTitle, getn(tbSay), tbSay)
	else
		if GetTongName() == "" then
    		Talk(1, "", "Gia nh�p bang h�i m�i c� th� s� d�ng")
    		return 0
    	else
    		local nMaxCnt = GetItemCount(t.G,t.D,t.P)
			AskClientForNumber("_handle_use_item_gxd_linpai_ret", 1, nMaxCnt, "C�n s� d�ng bao nhi�u c�i?");
		end
	end
end

function _handle_use_item_gxd_linpai_ret(nNum)
	local t = t_gxd_lingpai_cfg
	if DelItem(t.G,t.D,t.P, nNum) == 1 then
		local gxd = t.GXD_PER_USE * nNum
		add_tong_gxd(gxd)
		Msg2Player(format("Ch�c m�ng s� d�ng %d c�i %s nh�n ���c %d �� c�ng hi�n bang h�i.", nNum, t.NAME, gxd))
	end
end
