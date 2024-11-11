--����
Include("\\script\\online_activites\\201505feedpet\\head.lua")

function OnUse(nItemIndex)
	if check_player_condition()~= 1 then
		return
	end
	local nLevel = get_feedLevel(nItemIndex)
	if nLevel <= 0 then
		return
	end
	do_feed_pet(nLevel)
end

function do_feed_pet(nLevel, szHeadMsg)
	local ncurPoint = get_cur_point(nLevel)
	if get_award_count(nLevel) >= g_tFeedPet.nMaxFeedPetOneDay then
		Talk(1,"","S� l�n hu�n luy�n th� h�m nay �� ��t gi�i h�n")
		return
	end
	if get_cur_point(nLevel) == g_tFeedPet.nFeedTargetPoint then
		Talk(1,"","�� �� �� c��ng tr�ng r�i, h�y mang ��n ch� ��i S� Ho�t ��ng.")
		return
	end
	local szTitle = format("�� c��ng tr�ng l� <color=yellow>%d<color>, h�y mau hu�n luy�n cho �� c��ng tr�ng ��t ��n <color=yellow>%d<color> n�o.", ncurPoint, g_tFeedPet.nFeedTargetPoint)
	if szHeadMsg then
		szTitle = format("%s\n%s",szHeadMsg, szTitle)
		
	end
	szTitle = format("%s\n%s", szTitle, "Nguy�n li�u hu�n luy�n th� c�ng c� h�n, h�y s� d�ng th�t ti�t ki�m.!")
	
	local tbSay = {}
	local t=g_tFeedPet.tFood
	for i=1,getn(t) do
		local tt = t[i]
		tinsert(tbSay, format("%s(%s)/#_do_feed_pet(%d,%d, %d)", tt[4], tt[5],nLevel, i, 0))
	end
	tinsert(tbSay, format("%s/nothing", "Ti�p t�c hu�n luy�n sau"))
	
	Say(szTitle, getn(tbSay), tbSay)
end

function _do_feed_pet(nLevel, nType, bConfirm)
	local t = g_tFeedPet.tFood[nType]
	local ncurPoint = get_cur_point(nLevel)
	local nNewPoint = get_next_point(nLevel,nType)
	local t = g_tFeedPet.tFood[nType]
	local tt=t[3]
	if GetItemCount(tt[1],tt[2],tt[3])<1 then
		Talk(1,"",format("�i, qu�n mang theo %s r�i, quay l�i sau",t[2]))
		return
	end
	if nNewPoint==ncurPoint then
		Talk(1,"","H�nh nh� th� c�ng kh�ng th�ch �ng, c�n thay ��i c�ch hu�n luy�n kh�ng?")
		return
	end
	if bConfirm ~= 1 then
		local szTitle = format("�� c��ng tr�ng hi�n t�i l� <color=yellow>%d/%d<color>, sau khi hu�n luy�n s� thay ��i th�nh <color=yellow>%d<color>, ��ng � kh�ng?", ncurPoint, g_tFeedPet.nFeedTargetPoint, nNewPoint)
    	local tbSay = {}
    	
    	tinsert(tbSay, format("%s/#_do_feed_pet(%d,%d,%d)", "��ng �", nLevel, nType, 1))
    	tinsert(tbSay, format("%s/#do_feed_pet(%d)", "tr� l�i", nLevel))
    	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
    	
    	Say(szTitle, getn(tbSay), tbSay)
    	return
	end
	
	if DelItem(tt[1],tt[2],tt[3], 1)==1 then
		set_cur_point(nLevel, nNewPoint)
		local szMsg = format("Ch�c m�ng th�nh c�ng hu�n luy�n th� c�ng!")
		--Msg2Player(szMsg)
		do_feed_pet(nLevel, szMsg)
		return
	end
end

function get_feedLevel(nItemIndex)
	local g,d,p = GetItemInfoByIndex(nItemIndex)
	local t = g_tFeedPet.tToolItem
	for i=1,getn(t) do
		local tt = t[i][3]
		if g==tt[1] and d==tt[2] and p==tt[3] then
			return i
		end
	end
	return 0
end