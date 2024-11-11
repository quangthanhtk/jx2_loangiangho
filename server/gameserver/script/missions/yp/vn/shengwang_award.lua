Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\define.lua")
Include("\\script\\missions\\yp\\yp_head.lua")
tAward = {
	--ÉùÍû ½±Àø×Ö·û´®
	{"Béc lé tµi n¨ng", 2000, "Faction_Reputation_2000"},
	{"Danh tiÕng th­íc khëi", 8000, "Faction_Reputation_6000"},
	{"C«ng danh lín lao", 20000, "Faction_Reputation_12000"},
	{"Cùu phô thÞnh danh", 40000, "Faction_Reputation_20000"},
	{"V¹n ng­êi ng­ìng mé", 80000, "Faction_Reputation_40000"},
}

function shengwang_award_main()
	if yp_get_camp()<=0 then
		Talk(1,"","Ch­a gia nhËp thÕ lùc bÊt kú")
		return
	end
	local tSay = {}
	local szTitle = format("Mçi mèc phÇn th­ëng cña danh väng chØ ®­îc nhËn 1 lÇn, sau khi ®æi thÕ lùc còng kh«ng thÓ nhËn l¹i")
	for i, tt in tAward do
		if _check_can_award(i)==1 then
			tinsert(tSay, format("%s/#_do_award(%d)", format("NhËn th­ëng %s", tt[1]), i))
		end
	end
	tinsert(tSay, format("%s/nothing", "Ra khái"))
	Say(szTitle, getn(tSay), tSay)
end

function _check_can_award(nIndex)
	local nTaskVal = GetTask(TASK_FIELD_SHENGWANG_AWARD)
	if SafeGetBit(nTaskVal, nIndex) == 1 then--ÒÑÁìÈ¡
		return 0
	end
	if gf_Judge_Room_Weight(5,200,"") ~= 1 then
		return 0
	end
	local t = tAward[nIndex]
	local nPop = yp_get_camp_pop()
	if nPop < t[2] then
		return 0
	end
	return 1
end

function _do_award(nIndex)
	if _check_can_award(nIndex)~=1 then
		return
	end
	local t = tAward[nIndex]
	local nTaskVal = GetTask(TASK_FIELD_SHENGWANG_AWARD)
	local nTaskValNew = SafeSetBit(nTaskVal, nIndex, 1)
	SetTask(TASK_FIELD_SHENGWANG_AWARD, nTaskValNew)
	CustomAwardGiveGroup(t[3], 1)
end