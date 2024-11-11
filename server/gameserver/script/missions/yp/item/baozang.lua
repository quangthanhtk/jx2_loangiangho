--±¦²Ø½±Àø
Include("\\script\\missions\\yp\\award.lua")

tItemInfo = {
	{"Kho B¸u Tr©n PhÈm",	2,95,931},
	{"Kho B¸u T× H­u",	2,95,932},
	{"Kho B¸u Di VËt",	2,95,933},
	{"Kho B¸u Kinh ThÕ",	2,95,934},
}

TASKID_JINGSHIBOX_USED = 3539
MAX_JINGSHIBOX = 3

function OnUse(nItemIdx)
	local g,d,p = GetItemInfoByIndex(nItemIdx);
	if p == 934 then
		local used = GetTask(TASKID_JINGSHIBOX_USED)
		if used >= MAX_JINGSHIBOX then
			Talk(1, "", "Sè lÇn sö dông ®· ®¹t giíi h¹n")
			return
		end
		SetTask(TASKID_JINGSHIBOX_USED, used + 1)
	end
	local nType = 0;
	for i = 1,getn(tItemInfo) do
		if g == tItemInfo[i][2] and d == tItemInfo[i][3] and p == tItemInfo[i][4] then
			nType = i;
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
	
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then 
		Talk(1,"","CÇn ph¶i gia nhËp thÕ lùc míi ®­îc dïng vËt phÈm nµy!");
		return 0;
	end
	if gf_Judge_Room_Weight(5,200,"") ~= 1 then
		return 0;
	end	
	if DelItem(g,d,p,1) == 1 then
		yp_aw_giveAward_19(nType);
	end
end
