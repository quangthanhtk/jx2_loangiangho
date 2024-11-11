
t_tile_cfg =
{
	[30560] = {65, 1, 7, "Du Hi�p"},
	[30561] = {65, 2, 7, "�ng D��ng"},
	[30562] = {65, 3, 7, "Chi�n Cu�ng"},
	[31171]	= {74, 1, 30, "Thi�n Xu", {8, 10, 1}},--RuntimeStat
	[31172] = {74, 2, 30, "Thi�n To�n", {8, 10, 2}},
	[31173] = {74, 3, 30, "Thi�n C�", {8, 10, 3}},
	[31197] = {75, 1, 30, "Thi�n Quy�n", {8, 10, 4}},
	[31198] = {75, 2, 30, "Ng�c H�ng", {8, 10, 5}}
}
ITEM_G=2
ITEM_D=1

function OnUse(id)
	local g = GetItemGenre(id)
	local d = GetItemDetail(id)
	if g == ITEM_G and ITEM_D == 1 then
		local p = GetItemParticular(id)
		local t = t_tile_cfg[p]
		if t then
    		local szMsg = format("Ng��i x�c nh�n mu�n ��i %d ng�y gia h�n th�i gian [%s] danh hi�u kh�ng?", t[3], t[4])
    		local tSay = 
        	{
        		format("��ng �/#ye_use(%d)", p),
        		"R�i kh�i/no",
        	}
        	Say(szMsg, getn(tSay), tSay)
		end
	end	
end

function ye_use(nItemP)
	local t = t_tile_cfg[nItemP]
	if t then
		if 1 ~= IsTitleExist(t[1], t[2]) then
			local nDelResult = DelItem(ITEM_G, ITEM_D, nItemP, 1)
			if 1 == nDelResult then
				AddTitle(t[1], t[2])
				SetTitleTime(t[1], t[2], GetTime() + t[3] * 24 * 60 * 60)
				SetCurTitle(t[1], t[2])
				if t[5] then
					local nMainId, nSubId, nExtId = unpack(t[5])
					AddRuntimeStat(nMainId, nSubId, nExtId, 1)
				end
				Msg2Player(format("Ng��i nh�n ���c %d ng�y gia h�n th�i gian [%s] danh hi�u", t[3], t[4]))
			end
		else
			Say(format("�� c� [%s] danh hi�u, kh�ng th� s� d�ng l�i", t[4]), 0)
		end
	end
end

function no()
end
