Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\define.lua")
Include("\\script\\missions\\yp\\yp_head.lua")
tAward = {
	--���� �����ַ���
	{"B�c l� t�i n�ng", 2000, "Faction_Reputation_2000"},
	{"Danh ti�ng th��c kh�i", 8000, "Faction_Reputation_6000"},
	{"C�ng danh l�n lao", 20000, "Faction_Reputation_12000"},
	{"C�u ph� th�nh danh", 40000, "Faction_Reputation_20000"},
	{"V�n ng��i ng��ng m�", 80000, "Faction_Reputation_40000"},
}

function shengwang_award_main()
	if yp_get_camp()<=0 then
		Talk(1,"","Ch�a gia nh�p th� l�c b�t k�")
		return
	end
	local tSay = {}
	local szTitle = format("M�i m�c ph�n th��ng c�a danh v�ng ch� ���c nh�n 1 l�n, sau khi ��i th� l�c c�ng kh�ng th� nh�n l�i")
	for i, tt in tAward do
		if _check_can_award(i)==1 then
			tinsert(tSay, format("%s/#_do_award(%d)", format("Nh�n th��ng %s", tt[1]), i))
		end
	end
	tinsert(tSay, format("%s/nothing", "Ra kh�i"))
	Say(szTitle, getn(tSay), tSay)
end

function _check_can_award(nIndex)
	local nTaskVal = GetTask(TASK_FIELD_SHENGWANG_AWARD)
	if SafeGetBit(nTaskVal, nIndex) == 1 then--����ȡ
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