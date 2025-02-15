--活动的一些共用奖励函数
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\ks2vng\\isolate\\online_activites\\base\\activity_award_base_vng.lua")

BOOK1 = {
	[2] = {0, 107, 204, "Kim Cang B竧 Nh� Ch﹏ Quy觧 "},
	[3] = {0, 107, 206, "V� Tr莕 B� б Ch﹏ Quy觧"},
	[4] = {0, 107, 205, "Ti襪 Long T骳 Di謙 Ch﹏ Quy觧"},
	[6] = {0, 107, 207, "Thi猲 La Li猲 Ch﹗ Ch﹏ Quy觧"},
	[8] = {0, 107, 208, "Nh� � Kim жnh Ch﹏ Quy觧"},
	[9] = {0, 107, 209, "B輈h H秈 Tuy謙  Ch﹏ Quy觧"},
	[11] = {0, 107, 210, "H鏽 чn Tr蕁 Nh筩 Ch﹏ Quy觧"},
	[12] = {0, 107, 211, "Qu� Thi猲 Du Long Ch﹏ Quy觧"},
	[14] = {0, 107, 212, "Huy襫 秐h M� T玭g Ch﹏ Quy觧"},
	[15] = {0, 107, 213, "Qu﹏ T� ыi Phong Ch﹏ Quy觧"},
	[17] = {0, 107, 214, "Tr蕁 Qu﹏ Phi Long Thng Ch﹏ Quy觧"},
	[18] = {0, 107, 215, "Xuy猲 V﹏ L筩 H錸g Ch﹏ Quy觧"},
	[20] = {0, 107, 216, "Huy襫 Minh Phong Ma Ch﹏ Quy觧"},
	[21] = {0, 107, 217, "Linh C� Huy襫 T� Ch﹏ Quy觧"},
	[23] = {0, 107, 218, "C鰑 Thi猲 Phong L玦 Ch﹏ Quy觧"},
	[25] = {0, 107, 219, "H錳 Phong Tr秏 Nh藅 Ch﹏ Quy觧"},
	[26] = {0, 107, 220, "Ph� K� H祅h Tr薾 Ch﹏ Quy觧"},
	[27] = {0, 107, 221, "Ng璶g Huy誸 Phong H錸 Ch﹏ Quy觧"},
	[29] = {0, 107, 222, "H錸g Tr莕 T髖 M閚g Ch﹏ Quy觧"},
	[30] = {0, 107, 223, "Phong Hoa Thi猲 Di謕 Ch﹏ Quy觧"},	
	[31] = {0, 107, 231, "M� Tung Ch﹏ Quy觧"},
	[32] = {0, 107, 235, "Thi猲 Phong Ch﹏ Quy觧"},
}

BOOK2 = {
	[2] = {0, 107, 30001, "Kim Cang B竧 Nh� Ch﹏ Quy觧 (Cao c蕄)"},
	[3] = {0, 107, 30003, "V� Tr莕 B� б Ch﹏ Quy觧 (Cao c蕄)"},
	[4] = {0, 107, 30002, "Ti襪 Long T骳 Di謙 Ch﹏ Quy觧 (Cao c蕄)"},
	[6] = {0, 107, 30004, "Thi猲 La Li猲 Ch﹗ Ch﹏ Quy觧 (Cao c蕄)"},
	[8] = {0, 107, 30005, "Nh� � Kim жnh Ch﹏ Quy觧 (Cao c蕄)"},
	[9] = {0, 107, 30006, "B輈h H秈 Tuy謙  Ch﹏ Quy觧 (Cao c蕄)"},
	[11] = {0, 107, 30007, "H鏽 чn Tr蕁 Nh筩 Ch﹏ Quy觧 (Cao c蕄)"},
	[12] = {0, 107, 30008, "Qu� Thi猲 Du Long Ch﹏ Quy觧 (Cao c蕄)"},
	[14] = {0, 107, 30009, "Huy襫 秐h M� T玭g Ch﹏ Quy觧 (Cao c蕄)"},
	[15] = {0, 107, 30010, "Qu﹏ T� ыi Phong Ch﹏ Quy觧 (Cao c蕄)"},
	[17] = {0, 107, 30011, "Tr蕁 Qu﹏ Phi Long Thng Ch﹏ Quy觧 (Cao c蕄)"},
	[18] = {0, 107, 30012, "Xuy猲 V﹏ L筩 H錸g Ch﹏ Quy觧 (Cao c蕄)"},
	[20] = {0, 107, 30013, "Huy襫 Minh Phong Ma Ch﹏ Quy觧 (Cao c蕄)"},
	[21] = {0, 107, 30014, "Linh C� Huy襫 T� Ch﹏ Quy觧 (Cao c蕄)"},
	[23] = {0, 107, 30015, "C鰑 Thi猲 Phong L玦 Ch﹏ Quy觧 (Cao c蕄)"},
	[25] = {0, 107, 30035, "H錳 Phong Tr秏 Nh藅 Ch﹏ Quy觧 (Cao C蕄)"},
	[26] = {0, 107, 30036, "Ph� K� H祅h Tr薾 Ch﹏ Quy觧 (Cao C蕄)"},
	[27] = {0, 107, 30037, "Ng璶g Huy誸 Phong H錸 Ch﹏ Quy觧 (Cao c蕄)"},
	[29] = {0, 107, 30016, "H錸g Tr莕 T髖 M閚g Ch﹏ Quy觧 (Cao c蕄)"},
	[30] = {0, 107, 30017, "Phong Hoa Thi猲 Di謕 Ch﹏ Quy觧 (Cao c蕄)"},	
	[31] = {0, 107, 30041, "M� Tung Ch﹏ Quy觧"},
	[32] = {0, 107, 30043, "Thi猲 Phong Ch﹏ Quy觧"},
}

--高级真卷
function act_give_gaoji_zhenjuan(nNum, bByRoute,  nBind, nKind)
	if not nNum or nNum <= 0 then
		return 0
	end
	nBind = nBind or 4
	local tGgBook = {
		BOOK1,
		BOOK2,
	}
	if not nKind then
		nKind = 1;
	end
	local tBook = tGgBook[nKind];
	local nIndex = 0
	if bByRoute and bByRoute == 1 then
		nIndex = GetPlayerRoute();
	else
		local tRoute = {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,25,26,27,29,30,31,32}
		nIndex = tRoute[random(getn(tRoute))]
	end
	if not tBook[nIndex] then return 0 end
	gf_AddItemEx2({tBook[nIndex][1],tBook[nIndex][2],tBook[nIndex][3], nNum, nBind}, tBook[nIndex][4], "activity", "70_gaoji_zhenjuan", 0, 1);
	return 1
end

function act_finish_pet_task(nTaskId, nBitIdx)
--	Vet_Complete_Revive_OnePartner_FirstStage(nTaskId, nBitIdx)
	local nRet = Vet_Complete_Revive_OnePartner_SecondStage(nTaskId, nBitIdx)
	return nRet
end
