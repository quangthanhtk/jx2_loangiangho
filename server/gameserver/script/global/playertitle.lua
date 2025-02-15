-- 设置称号和取消设置声望时执行

-- type = 0x1, equip;  type = 0x2, have;

TITLE_MAX_ATTR_CNT = 10
function Equip(nGeren, nDetail, nType)
	--WriteLog("Equip::geren: "..nGeren..", detai: "..nDetail..", type: "..nType);
	local nStateID = nGeren * 10000 + nDetail * 100
	if check_battle_rank(nGeren, nDetail) == 0 then
		if nType == 2 then
			RemoveState(nStateID)
			return 0;
		end;
		SetCurTitle(0,0);
		return 0;
	end;
	if check_new_battle_rank(nGeren, nDetail) == 0 then
		if nType == 2 then
			RemoveState(nStateID)
			return 0;
		end;
		SetCurTitle(0,0);
		return 0;
	end;
	local szfunc = format("_%.2d_%.2d_(%d, %d)", nGeren, nDetail, nType, nStateID)
	dostring(szfunc)
	if nType == 1 then
		local nYear, nMonth, nDay, nHour, nMin, nSec = AddTitleTime(nGeren, nDetail, 0)
		--WriteLog("year: "..nYear..", month: "..nMonth..", day: "..nDay..", hour: "..nHour..", minute: "..nMin..", second: "..nSec);
		if nYear ~= 1970 then
			Msg2Player("X璶g hi謚 c馻 b筺 h誸 h筺 v祇 " .. format("ng祔 %d/%d/%d l骳 %d:%d", nDay, nMonth, nYear, nHour, nMin))
		end
	end
end

function UnEquip(nGeren, nDetail, nType)
	local nStateID = nGeren * 10000 + nDetail * 100
	for i = 1, TITLE_MAX_ATTR_CNT do
		RemoveState(nStateID + i - 1)
	end
	if nGeren == 72 and nType == 2 then--帮会称号
		SyncCustomState(0, nStateID, 0, 0)
	end
end

function title_cast_state(szAttr, nVal, nTime, bReplace, nId)
	local nSubId = mod(nId, 100)
	if nSubId >= TITLE_MAX_ATTR_CNT then
		error(format("Title only support %d attrs", TITLE_MAX_ATTR_CNT))
	end
	CastState(szAttr, nVal, nTime, bReplace, nId)
end

function _22_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 1, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 3, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 5, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 5, -1, 1, nStateID)
	end
end

function _22_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 20 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 20 甶觤");
	end
end

function _22_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 15, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
	end
end

function _22_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
	end
end

function _22_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 25, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_15_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 30, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_16_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 40, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 0, -1, 1, nStateID)
	end
end

-- 初级
function _23_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_vitality", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: G﹏ c鑤 + 5 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_vitality", 3, -1, 1, nStateID);
		Msg2Player("Л頲 hi謚 qu�: G﹏ c鑤 + 3 甶觤");
	end;
end

function _23_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 5 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 3 甶觤");
	end;
end

function _23_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 5 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 3 甶觤");
	end;
end

function _23_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 5 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 3 甶觤");
	end;
end

function _23_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 5 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 3 甶觤");
	end;
end

function _23_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 5 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 3 甶觤");
	end;
end

function _23_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_strength", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 5 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_strength", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 3 甶觤");
	end;
end

function _23_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 5 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 3 甶觤");
	end;
end

function _23_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 5 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 3 甶觤");
	end;
end

function _23_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 5 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 3 甶觤");
	end;
end

function _23_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_strength", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 5 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_strength", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 3 甶觤");
	end;
end

function _23_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 5 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 3 甶觤");
	end;
end

function _23_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 5 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 3 甶觤");
	end;
end

function _23_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 5 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 3 甶觤");
	end;
end

function _23_15_(nType, nStateID)	--天师
	if nType == 1 then
		CastState("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 3 甶觤");
	end;
end

function _23_16_(nType, nStateID)	--圣战
	if nType == 1 then
		CastState("state_add_strength", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_strength", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 3 甶觤");
	end;
end

function _23_17_(nType, nStateID)	--阵兵
	if nType == 1 then
		CastState("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 3 甶觤");
	end;
end

function _23_18_(nType, nStateID)	--血人
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 3 甶觤");
	end;
end

function _23_19_(nType, nStateID)	--舞仙
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 3 甶觤");
	end;
end

function _23_20_(nType, nStateID)	--灵女
	if nType == 1 then
		CastState("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 5 甶觤");
	elseif nType == 2 then
		CastState("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 3 甶觤");
	end;
end

-- 中级
function _24_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID);
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 10 甶觤");
	end;
end

function _24_15_(nType, nStateID)	--天师
	if nType == 1 then
		CastState("state_add_energy", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_energy", 6, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 6 甶觤");
	end;
end

function _24_16_(nType, nStateID)	--圣战
	if nType == 1 then
		CastState("state_add_strength", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_strength", 6, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 6 甶觤");
	end;
end

function _24_17_(nType, nStateID)	--阵兵
	if nType == 1 then
		CastState("state_add_observe", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_observe", 6, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 6 甶觤");
	end;
end

function _24_18_(nType, nStateID)	--血人
	if nType == 1 then
		CastState("state_add_dexterity", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_dexterity", 6, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 6 甶觤");
	end;
end

function _24_19_(nType, nStateID)	--舞仙
	if nType == 1 then
		CastState("state_add_dexterity", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_dexterity", 6, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 6 甶觤");
	end;
end

function _24_20_(nType, nStateID)	--灵女
	if nType == 1 then
		CastState("state_add_observe", 10, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 10 甶觤");
	elseif nType == 2 then
		CastState("state_add_observe", 6, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 6 甶觤");
	end;
end

-- 高级
function _25_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 12 甶觤");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 4%");
	end;
end

function _25_15_(nType, nStateID)	--天师
	if nType == 1 then
		CastState("state_add_energy", 20, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 20 甶觤");
	elseif nType == 2 then
		CastState("state_add_energy", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 12 甶觤");
	end;
end

function _25_16_(nType, nStateID)	--圣战
	if nType == 1 then
		CastState("state_add_strength", 20, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 20 甶觤");
	elseif nType == 2 then
		CastState("state_add_strength", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 12 甶觤");
	end;
end

function _25_17_(nType, nStateID)	--阵兵
	if nType == 1 then
		CastState("state_add_observe", 20, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 20 甶觤");
	elseif nType == 2 then
		CastState("state_add_observe", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 12 甶觤");
	end;
end

function _25_18_(nType, nStateID)	--血人
	if nType == 1 then
		CastState("state_add_dexterity", 20, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 20 甶觤");
	elseif nType == 2 then
		CastState("state_add_dexterity", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 12 甶觤");
	end;
end

function _25_19_(nType, nStateID)	--舞仙
	if nType == 1 then
		CastState("state_add_dexterity", 20, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 20 甶觤");
	elseif nType == 2 then
		CastState("state_add_dexterity", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 12 甶觤");
	end;
end

function _25_20_(nType, nStateID)	--灵女
	if nType == 1 then
		CastState("state_add_observe", 20, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 20 甶觤");
	elseif nType == 2 then
		CastState("state_add_observe", 12, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 12 甶觤");
	end;
end

-- 最高
function _26_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 14 甶觤");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 1%");
	end;
end

function _26_15_(nType, nStateID)	--天师
	if nType == 1 then
		CastState("state_add_energy", 30, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 30 甶觤");
	elseif nType == 2 then
		CastState("state_add_energy", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 18 甶觤");
	end;
end

function _26_16_(nType, nStateID)	--圣战
	if nType == 1 then
		CastState("state_add_strength", 30, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 30 甶觤");
	elseif nType == 2 then
		CastState("state_add_strength", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 18 甶觤");
	end;
end

function _26_17_(nType, nStateID)	--阵兵
	if nType == 1 then
		CastState("state_add_observe", 30, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 30 甶觤");
	elseif nType == 2 then
		CastState("state_add_observe", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 18 甶觤");
	end;
end

function _26_18_(nType, nStateID)	--血人
	if nType == 1 then
		CastState("state_add_dexterity", 30, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 30 甶觤");
	elseif nType == 2 then
		CastState("state_add_dexterity", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 18 甶觤");
	end;
end

function _26_19_(nType, nStateID)	--舞仙
	if nType == 1 then
		CastState("state_add_dexterity", 30, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 30 甶觤");
	elseif nType == 2 then
		CastState("state_add_dexterity", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 18 甶觤");
	end;
end

function _26_20_(nType, nStateID)	--灵女
	if nType == 1 then
		CastState("state_add_observe", 30, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 30 甶觤");
	elseif nType == 2 then
		CastState("state_add_observe", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 18 甶觤");
	end;
end
--师门第4称号
function _27_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 16 甶觤");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("Л頲 hi謚 qu�: t╪g th猰 hi謚 qu� c馻 thng dc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 2%");
	end;
end

function _27_15_(nType, nStateID)	--天师
	if nType == 1 then
		CastState("state_add_energy", 35, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 35 甶觤");
	elseif nType == 2 then
		CastState("state_add_energy", 21, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 21 甶觤");
	end;
end

function _27_16_(nType, nStateID)	--圣战
	if nType == 1 then
		CastState("state_add_strength", 35, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 35 甶觤");
	elseif nType == 2 then
		CastState("state_add_strength", 21, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 21 甶觤");
	end;
end

function _27_17_(nType, nStateID)	--阵兵
	if nType == 1 then
		CastState("state_add_observe", 35, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 35 甶觤");
	elseif nType == 2 then
		CastState("state_add_observe", 21, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 21 甶觤");
	end;
end

function _27_18_(nType, nStateID)	--血人
	if nType == 1 then
		CastState("state_add_dexterity", 35, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 35 甶觤");
	elseif nType == 2 then
		CastState("state_add_dexterity", 21, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 21 甶觤");
	end;
end

function _27_19_(nType, nStateID)	--舞仙
	if nType == 1 then
		CastState("state_add_dexterity", 35, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 35 甶觤");
	elseif nType == 2 then
		CastState("state_add_dexterity", 21, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 21 甶觤");
	end;
end

function _27_20_(nType, nStateID)	--灵女
	if nType == 1 then
		CastState("state_add_observe", 35, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 35 甶觤");
	elseif nType == 2 then
		CastState("state_add_observe", 21, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 21 甶觤");
	end;
end
--师门第5称号
function _28_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3% ");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3% ");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3% ");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Kh竛g T蕋 C� + 18 甶觤");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("Л頲 hi謚 qu�: M鏸 10 gi﹜ sinh l鵦 ph鬰 h錳 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("Л頲 hi謚 qu�: h� tr� m藅 t辌h t╪g 3%");
	end;
end

function _28_15_(nType, nStateID)	--天师
	if nType == 1 then
		CastState("state_add_energy", 40, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 40 甶觤");
	elseif nType == 2 then
		CastState("state_add_energy", 24, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 24 甶觤");
	end;
end

function _28_16_(nType, nStateID)	--圣战
	if nType == 1 then
		CastState("state_add_strength", 40, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 40 甶觤");
	elseif nType == 2 then
		CastState("state_add_strength", 24, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 24 甶觤");
	end;
end

function _28_17_(nType, nStateID)	--阵兵
	if nType == 1 then
		CastState("state_add_observe", 40, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 40 甶觤");
	elseif nType == 2 then
		CastState("state_add_observe", 24, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 24 甶觤");
	end;
end

function _28_18_(nType, nStateID)	--血人
	if nType == 1 then
		CastState("state_add_dexterity", 40, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 40 甶觤");
	elseif nType == 2 then
		CastState("state_add_dexterity", 24, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 24 甶觤");
	end;
end

function _28_19_(nType, nStateID)	--舞仙
	if nType == 1 then
		CastState("state_add_dexterity", 40, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 40 甶觤");
	elseif nType == 2 then
		CastState("state_add_dexterity", 24, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Th﹏ ph竝 + 24 甶觤");
	end;
end

function _28_20_(nType, nStateID)	--灵女
	if nType == 1 then
		CastState("state_add_observe", 40, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 40 甶觤");
	elseif nType == 2 then
		CastState("state_add_observe", 24, -1, 1, nStateID)
		Msg2Player("Л頲 hi謚 qu�: Linh ho箃 + 24 甶觤");
	end;
end

--宋方士兵
function _30_01_(nType, nStateID)

end;
--宋军武勇校尉
function _30_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_life_max_percent_add", 5, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_life_max_percent_add", 5, -1, 1, nStateID)
	end;
end;
--宋军常胜都统
function _30_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_life_max_percent_add", 8, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_life_max_percent_add", 8, -1, 1, nStateID)
	end;
end;
--宋军定北大先锋
function _30_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID)
	end;
end;
--大宋无双大将军
function _30_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	end;
end;
--大宋护国大元帅
function _30_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_burst_enhance_rate", 25, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_burst_enhance_rate", 25, -1, 1, nStateID)
	end;
end;
--辽方士兵
function _30_07_(nType, nStateID)

end;
--辽军骁勇校尉
function _30_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_life_max_percent_add", 5, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_life_max_percent_add", 5, -1, 1, nStateID)
	end;
end;
--辽军绝尘都统
function _30_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_life_max_percent_add", 8, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_life_max_percent_add", 8, -1, 1, nStateID)
	end;
end;
--辽军平南大先锋
function _30_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID)
	end;
end;
--大辽通天大将军
function _30_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	end;
end;
--南院大王
function _30_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_burst_enhance_rate", 25, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_burst_enhance_rate", 25, -1, 1, nStateID)
	end;
end;
--大宋破阵督护
function _30_13_(nType, nStateID)
	if nType == 1 then	--增加内外攻15%
		title_cast_state("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	elseif nType == 2 then	
		title_cast_state("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	end;
end;
--大辽破阵督护
function _30_14_(nType, nStateID)
	if nType == 1 then	--增加内外攻15%
		title_cast_state("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	end;
end;
--大宋破阵督护
function _30_15_(nType, nStateID)
	if nType == 1 then	--增加伤害100点
		title_cast_state("state_damage_point", 100, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_damage_point", 100, -1, 1, nStateID)
	end;
end;
--大辽破阵督护
function _30_16_(nType, nStateID)
	if nType == 1 then	--增加伤害100点
		title_cast_state("state_damage_point", 100, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_damage_point", 100, -1, 1, nStateID)
	end;
end;
--宋镇军虎骑
function _30_17_(nType, nStateID)
	if nType == 1 then	--伤害减半概率25%
		title_cast_state("state_receive_half_damage", 25, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_receive_half_damage", 25, -1, 1, nStateID)
	end;
end;
--辽镇军虎骑
function _30_18_(nType, nStateID)
	if nType == 1 then	--伤害减半概率25%
		title_cast_state("state_receive_half_damage", 25, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_receive_half_damage", 25, -1, 1, nStateID)
	end;
end;
--大宋铁骨龙卫
function _30_19_(nType, nStateID)
	if nType == 1 then	--所有属性60点
		title_cast_state("state_add_allability", 60, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 60, -1, 1, nStateID)
	end;
end;
--大辽铁骨龙卫
function _30_20_(nType, nStateID)
	if nType == 1 then	--所有属性60点
		title_cast_state("state_add_allability", 60, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 60, -1, 1, nStateID)
	end;
end;
--大宋无双飞将
function _30_21_(nType, nStateID)
	if nType == 1 then	--生命上限增加10000点
		title_cast_state("state_life_max_point_add", 10000, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_life_max_point_add", 10000, -1, 1, nStateID)
	end;
end;
--大辽无双飞将
function _30_22_(nType, nStateID)
	if nType == 1 then	--生命上限增加10000点
		title_cast_state("state_life_max_point_add", 10000, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_life_max_point_add", 10000, -1, 1, nStateID)
	end;
end;
--大宋御敌猛士
function _30_23_(nType, nStateID)
	if nType == 1 then	--所有属性40点
		title_cast_state("state_add_allability", 40, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 40, -1, 1, nStateID)
	end;
end;
--大辽御敌猛士
function _30_24_(nType, nStateID)
	if nType == 1 then	--所有属性40点
		title_cast_state("state_add_allability", 40, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 40, -1, 1, nStateID)
	end;
end;

function _63_01_(nType, nStateID)
    if nType == 1 then	--所有属性8点
		title_cast_state("state_add_allability", 8, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 8, -1, 1, nStateID)
	end;
end

function _64_01_(type, stateID)
	if 1 == type then
		title_cast_state("state_add_energy", 20, -1, 1, stateID)
		Msg2Player("Л頲 hi謚 qu�: N閕 c玭g + 20 甶觤");
	end
end

function _64_02_(type, stateID)
	if 1 == type then
		title_cast_state("state_add_strength", 20, -1, 1, stateID)
		Msg2Player("Л頲 hi謚 qu�: S鴆 m筺h + 20 甶觤");	
	end
end

--function _64_03_(type, stateID)
--	if 1 == type then
--		title_cast_state("state_add_dexterity", 20, -1, 1, stateID)
--		Msg2Player("获得效果：身法增加20点");
--	end
--end
--
--function _64_04_(type, stateID)
--	if 1 == type then
--		title_cast_state("state_add_vitality", 20, -1, 1, stateID)
--		Msg2Player("获得效果：根骨增加20点");
--	end
--end
--
--function _64_05_(type, stateID)
--	if 1 == type then
--		title_cast_state("state_add_observe", 20, -1, 1, stateID)
--		Msg2Player("获得效果：洞察增加20点");
--	end
--end

function PT_AddAllWhenEquip(type, stateID, number1, number2)
	if 1 == type then
		title_cast_state("state_burst_enhance_rate", number1, -1, 1, stateID+1);
		title_cast_state("state_add_allability", number2, -1, 1, stateID+2);
		--Msg2Player(format("%s%d%%%s%d%s","获得效果：施展速度提高", number1, ",全属性增加", number2, "点"));
	elseif 2 == type then		
		title_cast_state("state_burst_enhance_rate", number1, -1, 1, stateID+1);
		title_cast_state("state_add_allability", number2, -1, 1, stateID+2);
	end
	
end

function _65_01_(type, stateID)
	PT_AddAllWhenEquip(type, stateID, 10, 10);
end

function _65_02_(type, stateID)
	PT_AddAllWhenEquip(type, stateID, 12, 12);
end

function _65_03_(type, stateID)
	PT_AddAllWhenEquip(type, stateID, 14, 14);
end

--function _65_04_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_05_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_06_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_07_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_08_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_09_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_10_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_11_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_12_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_13_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_14_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_15_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_16_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_17_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_18_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_19_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_life_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("获得效果：生命值下降15%");		
--	end
--end
--
--function _65_20_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_neili_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("获得效果：内力值下降15%");		
--	end
--end
--
--function _65_21_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_life_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("获得效果：生命值下降15%");		
--	end
--end
--
--function _65_22_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_life_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("获得效果：生命值下降15%");		
--	end
--end
--
--function _65_23_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_neili_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("获得效果：内力值下降15%");		
--	end
--end
--
--function _65_24_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_neili_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("获得效果：内力值下降15%");		
--	end
--end
--
--function _65_25_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_slow", 10, -1, 1, stateID);
--		Msg2Player("获得效果：移动速度下降10%");		
--	end
--end
--
--function _65_26_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_add_allability", 8, -1, 1, stateID);
--		Msg2Player("获得效果：全属性增加8点");
--	end
--end
--
--function _65_27_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_add_allability", 8, -1, 1, stateID);
--		Msg2Player("获得效果：全属性增加8点");
--	end
--end

--------------------------------------------------------------------------------------
-- 攻城战称号

function CityWarEquip(nGeren, nDetail, nType)
	local nStateID = nGeren * 10000 + nDetail * 100
	local szfunc = format("_%.2d_%.2d_(%d, %d)", nGeren, nDetail, nType, nStateID)
	dostring(szfunc)
	if nType == 1 then
		local nYear, nMonth, nDay, nHour, nMin, nSec = AddTitleTime(nGeren, nDetail, 0)
		if nYear ~= 1970 then
			Msg2Player("X璶g hi謚 c馻 b筺 h誸 h筺 v祇 " .. format("ng祔 %d/%d/%d l骳 %d:%d", nDay, nMonth, nYear, nHour, nMin))
		end
	end
end

function CityWarUnEquip(nGeren, nDetail, nType)
	SetCityWarDutyFlag(0, 0)
	VerifyEquip()
	UnEquip(nGeren, nDetail, nType);
end

function _51_01_(nType, nStateID)		-- 成都城主
	SetCityWarDutyFlag(300, 0)
	title_cast_state("state_life_max_percent_add", 25, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 25, -1, 1, nStateID + 1);
end

function _51_02_(nType, nStateID)		-- 成都郡主
	SetCityWarDutyFlag(300, 0)
	title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 15, -1, 1, nStateID + 1);
end

function _51_03_(nType, nStateID)		-- 成都军师
	SetCityWarDutyFlag(300, 1)
	title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 15, -1, 1, nStateID + 1);
end

function _51_04_(nType, nStateID)		-- 成都名捕
	if nType == 1 then
		SetCityWarDutyFlag(300, 2)
	elseif nType == 2 then
		SetCityWarDutyFlag(0, 0)
	end
	title_cast_state("state_life_max_percent_add", 10, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 10, -1, 1, nStateID + 1);
end

function _51_05_(nType, nStateID)		-- 泉州城主
	SetCityWarDutyFlag(100, 0)
	title_cast_state("state_life_max_percent_add", 25, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 25, -1, 1, nStateID + 1);
end

function _51_06_(nType, nStateID)		-- 泉州郡主
	SetCityWarDutyFlag(100, 0)
	title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 15, -1, 1, nStateID + 1);
end

function _51_07_(nType, nStateID)		-- 泉州军师
	SetCityWarDutyFlag(100, 1)
	title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 15, -1, 1, nStateID + 1);
end

function _51_08_(nType, nStateID)		-- 泉州名捕
	if nType == 1 then
		SetCityWarDutyFlag(100, 2)
	elseif nType == 2 then
		SetCityWarDutyFlag(0, 0)
	end
	title_cast_state("state_life_max_percent_add", 10, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 10, -1, 1, nStateID + 1);
end

function _51_09_(nType, nStateID)		-- 襄阳城主
	SetCityWarDutyFlag(350, 0)
	title_cast_state("state_life_max_percent_add", 25, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 25, -1, 1, nStateID + 1);
end

function _51_10_(nType, nStateID)		-- 襄阳郡主
	SetCityWarDutyFlag(350, 0)
	title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 15, -1, 1, nStateID + 1);
end

function _51_11_(nType, nStateID)		-- 襄阳军师
	SetCityWarDutyFlag(350, 1)
	title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 15, -1, 1, nStateID + 1);
end

function _51_12_(nType, nStateID)		-- 襄阳名捕
	if nType == 1 then
		SetCityWarDutyFlag(350, 2)
	elseif nType == 2 then
		SetCityWarDutyFlag(0, 0)
	end
	title_cast_state("state_life_max_percent_add", 10, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 10, -1, 1, nStateID + 1);
end

--西北关卡称号
--纵横西夏（击败李元庆获得的称号）
function _60_08_(nType, nStateID)
	if nType == 1 then	--经验获得增加5%
		title_cast_state("state_inc_exp_gain", 5, -1, 1, nStateID)
	elseif nType == 2 then  --经验获得增加5%
		title_cast_state("state_inc_exp_gain", 0, -1, 1, nStateID)
	end;
end;

-- 攻城战称号结束

--==========判断战场称号的============================================================
tTitleTab =
{
--称号名称，对应称号表内的大类，副类，所需军衔
	{"T鑞g_V� D騨g Hi謚 髖",	30, 2, 2},
	{"Li猽_Ki猽 D騨g Й 髖",	30, 8,-2},
	{"T鑞g_Thng Th緉g Й th鑞g",	30, 3, 3},
	{"Li猽_Tuy謙 tr莕 Й th鑞g",	30, 9,-3},
	{"T鑞g_мnh B綾 i Ti猲 phong",	30, 4, 4},
	{"Li猽_B譶h Nam i Ti猲 phong",	30,10,-4},	
	{"T鑞g_V� Song Чi tng qu﹏",	30, 5, 5},	
	{"Li猽_Th玭g Thi猲 Чi tng qu﹏",	30,11,-5},	
	{"T鑞g_H� Qu鑓 Чi nguy猲 so竔",	30, 6, 6},	
	{"Nam Vi謓 i Vng",		30,12,-6},	
} 

tNewTitleTab =
{
--称号名称，对应称号表内的大类，副类，所需军功，是否支持永久元帅军衔
	{"T鑞g -Ph� Tr薾 цc h�",	30,	13,		300000,		1}, 
	{"Li猽-Ph� Tr薾 цc h� ",	30,	14,		-300000,	1},
	{"T鑞g -Ph� Tr薾 цc h�",	30,	15,		300000,		1}, 
	{"Li猽-Ph� Tr薾 цc h� ",	30,	16,		-300000,	1},
	{"T鑞g-Tr蕁 Qu﹏ H� k�",	30,	17,		450000,		0}, 
	{"Li猽-Tr蕁 Qu﹏ H� k�",	30,	18,		-450000,	0},	
	{"T鑞g -Thi誸 C� Long V�",	30,	19,		400000,		0}, 
	{"Li猽- Thi誸 C� Long V�",	30,	20,		-400000,	0},
	{"T鑞g- V� Song Phi Tng",	30,	21,		500000,		0}, 
	{"Li猽-V� Song Phi Tng",	30,	22,		-500000,	0},
	{"T鑞g- Ng� мch M穘h S�",	30,	23,		250000,		1}, 
	{"Li猽- Ng� мch M穘h S�",	30,	24,		-250000,	1},
}
--检查当前是不是战场称号并且符合顶这个称号的资格
function check_battle_rank(nGeren, nDetail)
	local nTitleIdx = 0;
	for i,v in tTitleTab do
		if tTitleTab[i][2] == nGeren and tTitleTab[i][3] == nDetail then
			nTitleIdx = i;
		end;
	end;
	if nTitleIdx == 0 then	--不是战场称号
		return 1;
	end;
	local nCurRank = GetTask(704);
	local nNeedRank = tTitleTab[nTitleIdx][4];	
	if nCurRank > 0 then
		if nNeedRank < 0 then
			Msg2Player("B筺 hi謓 thu閏 phe T鑞g, kh玭g th� d飊g danh hi謚 c馻 phe Li猽");
			return 0
		end
	elseif nCurRank < 0 then
		if nNeedRank > 0 then
			Msg2Player("B筺 hi謓 thu閏 phe Li猽 kh玭g th� d飊g danh hi謚 c馻 phe T鑞g");
			return 0
		end;
	end;

	local nEverRank = 0
	if GetTask(765) >= 15 then
		nEverRank = 6
	elseif GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 5
	elseif GetTask(767) + GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 4
	end
	
	nCurRank = abs(nCurRank)
	nNeedRank = abs(nNeedRank)
	if nCurRank < nEverRank then
		nCurRank = nEverRank
	end
	if nCurRank < nNeedRank then
		Msg2Player("Qu﹏ h祄 c馻 b筺 qu� th蕄 kh玭g th� s� d鬾g danh hi謚 n祔.")
		return 0
	end
	return 1
end;
--第二批战场称号检查
function check_new_battle_rank(nGeren, nDetail)
	local tCampNameZ =					--阵营名字（中文），显示对话的时候用的
	{
		[0] = "",
		[1] = "T鑞g",
		[2] = "Li猽",
	}
	local nTitleIdx = 0;
	for i,v in tNewTitleTab do
		if tNewTitleTab[i][2] == nGeren and tNewTitleTab[i][3] == nDetail then
			nTitleIdx = i;
		end;
	end;
	if nTitleIdx == 0 then	--不是战场称号
		return 1;
	end;
	local nCurCamp = 0;
	local nNeedJunGong = tNewTitleTab[nTitleIdx][4];
	local nNeedEverRank = tNewTitleTab[nTitleIdx][5];
	local nCurJunGong = GetTask(701);
	local bEverMarshal = 0;
	local nTitleCamp = 0;
	if nNeedJunGong > 0 then
		nTitleCamp = 1;
	else
		nTitleCamp = 2;
	end;
	if nCurJunGong >= 0 then
		nCurCamp = 1;
	else
		nCurCamp = 2;
	end;
	if GetTask(765) >= 15 then
		bEverMarshal = 1;	--是永久元帅
	end;
	if nCurCamp == 1 then	--当前为宋方
		if nNeedEverRank == 1 then
			if (bEverMarshal == 0 and nCurJunGong < nNeedJunGong) or nCurCamp ~= nTitleCamp then
				Msg2Player("B筺 ph秈 t 頲 "..tCampNameZ[nTitleCamp].."Phng "..abs(nNeedJunGong).." chi課 c玭g ho芻 c� "..tCampNameZ[nTitleCamp].." Qu﹏ h祄 Phng V躰h c鰑 Nguy猲 So竔 m韎 c� th� s� d鬾g x璶g hi謚 n祔");				
				return 0;
			end;
		else
			if nCurJunGong < nNeedJunGong or nCurCamp ~= nTitleCamp then
				Msg2Player("B筺 ph秈 t 頲 "..tCampNameZ[nTitleCamp].."Phng "..abs(nNeedJunGong).." Qu﹏ c玭g m韎 頲 s� d鬾g x璶g hi謚 n祔");				
				return 0;
			end;
		end;
	else
		if nNeedEverRank == 1 then
			if (bEverMarshal == 0 and nCurJunGong > nNeedJunGong) or nCurCamp ~= nTitleCamp then
				Msg2Player("B筺 ph秈 t 頲 "..tCampNameZ[nTitleCamp].."Phng "..abs(nNeedJunGong).." chi課 c玭g ho芻 c� "..tCampNameZ[nTitleCamp].." Qu﹏ h祄 Phng V躰h c鰑 Nguy猲 So竔 m韎 c� th� s� d鬾g x璶g hi謚 n祔");				
				return 0;
			end;
		else
			if nCurJunGong > nNeedJunGong or nCurCamp ~= nTitleCamp then
				Msg2Player("B筺 ph秈 t 頲 "..tCampNameZ[nTitleCamp].."Phng "..abs(nNeedJunGong).." Qu﹏ c玭g m韎 頲 s� d鬾g x璶g hi謚 n祔");				
				return 0;
			end;
		end;		
	end;
	return 1;
end;
--===================================================================================

function ZhenzaiEquip(nGeren, nDetail, nType)
	RemoveTrigger(GetTrigger(2021))
end

function ZhenzaiUnEquip(nGeren, nDetail, nType)
	RemoveTrigger(GetTrigger(2021))
end

--召回老玩家活动 武林称号
function CallbackEquip(nGeren, nDetail, nType)
	if nType == 1 then
		local n = CreateTrigger(1, 51, 2022)
		ContinueTimer(n)
	elseif nType == 2 then
		RemoveTrigger(GetTrigger(2022))
	end
end

function CallbackUnEquip(nGeren, nDetail, nType)
	RemoveTrigger(GetTrigger(2022))
end

--二十周年称号
function YearsEquip(nGeren, nDetail, nType)
	if nType == 1 then
		local n = CreateTrigger(1, 52, 2023)
		ContinueTimer(n)
	elseif nType == 2 then
		RemoveTrigger(GetTrigger(2023))
	end
end

function YearsUnEquip(nGeren, nDetail, nType)
	RemoveTrigger(GetTrigger(2023))
end

--四灵转身称号属性
function _61_05_(nType, nStateID)
--	print(nType, nStateID)
--	print(GetPlayerRebornParam(1))
	if nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID);
		title_cast_state("state_medicine_time_increase", 10, -1, 1, nStateID + 1);
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 2);
	end
end

--四灵转身2称号属性
function _61_06_(nType, nStateID)
--	print(nType, nStateID)
--	print(GetPlayerRebornParam(1))
	if nType == 2 then
		title_cast_state("state_add_allability", 21, -1, 1, nStateID);
		title_cast_state("state_medicine_time_increase", 10, -1, 1, nStateID + 1);
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 2);
	end
end

function _66_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 40, -1, 1, nStateID);
		title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID + 1);
		title_cast_state("state_burst_enhance_rate", 5, -1, 1, nStateID + 2);
		title_cast_state("state_move_speed_percent_add", 5, -1, 1, nStateID + 3);
	end
end

function _66_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 30, -1, 1, nStateID);
		title_cast_state("state_life_max_percent_add", 12, -1, 1, nStateID + 1);
		title_cast_state("state_burst_enhance_rate", 4, -1, 1, nStateID + 2);
		title_cast_state("state_move_speed_percent_add", 4, -1, 1, nStateID + 3);
	end
end

function _66_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID);
		title_cast_state("state_life_max_percent_add", 9, -1, 1, nStateID + 1);
		title_cast_state("state_burst_enhance_rate", 3, -1, 1, nStateID + 2);
		title_cast_state("state_move_speed_percent_add", 3, -1, 1, nStateID + 3);
	end
end

function _66_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID);
		title_cast_state("state_life_max_percent_add", 6, -1, 1, nStateID + 1);
		title_cast_state("state_burst_enhance_rate", 3, -1, 1, nStateID + 2);
		title_cast_state("state_move_speed_percent_add", 3, -1, 1, nStateID + 3);
	end
end

function _67_01_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,1)
end
function _67_02_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,2)
end
function _67_03_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,3)
end
function _67_11_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,1)
end
function _67_12_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,2)
end
function _67_13_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,3)
end
T_NEW_BATTLE_ATTR = {
    [2] = {"state_add_strength", "S鴆 m筺h",}, --少林俗家
    [3] = {"state_add_energy", "N閕 c玭g ",}, --少林禅宗
    [4] = {"state_add_energy", "N閕 c玭g ",}, --少林武宗
    [6] = {"state_add_dexterity", "Th﹏ ph竝",}, --唐门
    [8] = {"state_add_energy", "N閕 c玭g ",}, --娥嵋佛家
    [9] = {"state_add_dexterity", "Th﹏ ph竝",}, --娥嵋俗家
    [11] = {"state_add_strength", "S鴆 m筺h",}, --丐帮净衣
    [12] = {"state_add_dexterity", "Th﹏ ph竝",}, --丐帮污衣
    [14] = {"state_add_energy", "N閕 c玭g ",}, --武当道家
    [15] = {"state_add_observe", "Linh ho箃",}, --武当俗家
    [17] = {"state_add_strength", "S鴆 m筺h",}, --杨门枪骑
    [18] = {"state_add_dexterity", "Th﹏ ph竝",}, --杨门弓骑
    [20] = {"state_add_dexterity", "Th﹏ ph竝",}, --五毒邪侠
    [21] = {"state_add_observe", "Linh ho箃",}, --五毒蛊师
    [23] = {"state_add_energy", "N閕 c玭g ",}, --昆仑
	[25] = {"state_add_strength", "S鴆 m筺h",}, --明教圣战
	[26] = {"state_add_strength", "S鴆 m筺h",}, --明教阵兵
	[27] = {"state_add_energy", "N閕 c玭g ",}, --明教血人
    [29] = {"state_add_strength", "S鴆 m筺h",}, --翠烟舞仙
	[30] = {"state_add_observe", "Linh ho箃",}, --翠烟灵女
	[31] = {"state_add_strength", "S鴆 m筺h",}, --唐门任侠
	[32] = {"state_add_strength", "S鴆 m筺h",}, --昆仑剑尊
}
T_NEW_BATTLE_TYPE = {100, 60, 40}


function newbattle_season_titile(nType, nStateID, nSubId)
	if nType == 2 then
		local tAttr = T_NEW_BATTLE_ATTR[GetPlayerRoute()]
		local nVal = T_NEW_BATTLE_TYPE[nSubId]
		if tAttr and nVal then
			title_cast_state(tAttr[1], nVal, -1, 1, nStateID);
		end
	end
end


--新秀组称号
function _67_14_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击2点，全属性五行抗性2点。
		title_cast_state("state_element_all_attack_point_add", 2, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 2, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 2, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 2, -1, 1, nStateID+2)
	end;
end

function _67_15_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击4点，全属性五行抗性4点。
		title_cast_state("state_element_all_attack_point_add", 4, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 4, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 4, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 4, -1, 1, nStateID+2)
	end;
end

function _67_16_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击6点，全属性五行抗性6点。
		title_cast_state("state_element_all_attack_point_add", 6, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 6, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 6, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 6, -1, 1, nStateID+2)
	end;
end

function _67_17_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击8点，全属性五行抗性8点。
		title_cast_state("state_element_all_attack_point_add", 8, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 8, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 8, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 8, -1, 1, nStateID+2)
	end;
end

function _67_18_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击10点，全属性五行抗性10点。
		title_cast_state("state_element_all_attack_point_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 10, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 10, -1, 1, nStateID+2)
	end;
end

function _67_19_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击12点，全属性五行抗性12点。
		title_cast_state("state_element_all_attack_point_add", 12, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 12, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 12, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 12, -1, 1, nStateID+2)
	end;
end

function _67_20_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击14点，全属性五行抗性14点。
		title_cast_state("state_element_all_attack_point_add", 14, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 14, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 14, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 14, -1, 1, nStateID+2)
	end;
end

function _67_21_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击16点，全属性五行抗性16点。
		title_cast_state("state_element_all_attack_point_add", 16, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 16, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 16, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 16, -1, 1, nStateID+2)
	end;
end

function _67_22_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击18点，全属性五行抗性18点。
		title_cast_state("state_element_all_attack_point_add", 18, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 18, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 18, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 18, -1, 1, nStateID+2)
	end;
end

function _67_23_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击20点，全属性五行抗性20点。
		title_cast_state("state_element_all_attack_point_add", 20, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 20, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 20, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 20, -1, 1, nStateID+2)
	end;
end


--大侠组称号
function _67_24_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击4点，全属性五行抗性4点。
		title_cast_state("state_element_all_attack_point_add", 4, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 4, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 4, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 4, -1, 1, nStateID+2)
	end;
end

function _67_25_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击6点，全属性五行抗性6点。
		title_cast_state("state_element_all_attack_point_add", 6, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 6, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 6, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 6, -1, 1, nStateID+2)
	end;
end

function _67_26_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击8点，全属性五行抗性8点。
		title_cast_state("state_element_all_attack_point_add", 8, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 8, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 8, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 8, -1, 1, nStateID+2)
	end;
end

function _67_27_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击10点，全属性五行抗性10点。
		title_cast_state("state_element_all_attack_point_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 10, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 10, -1, 1, nStateID+2)
	end;
end

function _67_28_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击12点，全属性五行抗性12点。
		title_cast_state("state_element_all_attack_point_add", 12, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 12, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 12, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 12, -1, 1, nStateID+2)
	end;
end

function _67_29_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击14点，全属性五行抗性14点。
		title_cast_state("state_element_all_attack_point_add", 14, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 14, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 14, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 14, -1, 1, nStateID+2)
	end;
end

function _67_30_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击16点，全属性五行抗性16点。
		title_cast_state("state_element_all_attack_point_add", 16, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 16, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 16, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 16, -1, 1, nStateID+2)
	end;
end

function _67_31_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击18点，全属性五行抗性18点。
		title_cast_state("state_element_all_attack_point_add", 18, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 18, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 18, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 18, -1, 1, nStateID+2)
	end;
end

function _67_32_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击20点，全属性五行抗性20点。
		title_cast_state("state_element_all_attack_point_add", 20, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 20, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 20, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 20, -1, 1, nStateID+2)
	end;
end

function _67_33_(nType, nStateID)
    if nType == 1 then	--提高全属性五行攻击22点，全属性五行抗性22点。
		title_cast_state("state_element_all_attack_point_add", 22, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 22, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 22, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 22, -1, 1, nStateID+2)
	end;
end

function _68_01_(nType, nStateID)
	if 1 == nType then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID);
	end
end

function _68_02_(nType, nStateID)
	if 1 == nType then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID);
	end
end

function _68_03_(nType, nStateID)
	if 1 == nType then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID);
	end
end

function _68_04_(nType, nStateID)
	if 1 == nType then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID);
	end
end

function _69_01_(nType, nStateID)
	if 1 == nType then
		title_cast_state("state_p_attack_percent_add", 6, -1, 1, nStateID);
		title_cast_state("state_m_attack_percent_add", 6, -1, 1, nStateID + 1);
		title_cast_state("state_add_allability", 20, -1, 1, nStateID + 2);
		title_cast_state("state_armor_add", 60, -1, 1, nStateID + 3);
		title_cast_state("state_life_max_point_add", 8000, -1, 1, nStateID + 4);
		
		
		if GetTrigger(1538*2) == 0 then
			local nTrigger = CreateTrigger(1, 1538, 1538*2);
			ContinueTimer(nTrigger);
		end
	end
end

function _69_02_(nType, nStateID)
	if 1 == nType then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID);
		title_cast_state("state_armor_add", 35, -1, 1, nStateID + 1);
		title_cast_state("state_life_max_point_add", 6000, -1, 1, nStateID + 2);
	end
end

function _70_01_(nType, nStateID)
	if 1 == nType then
		title_cast_state("state_physical_parmor_poi_add", 3, -1, 1, nStateID);
		title_cast_state("state_magic_parmor_poi_add", 3, -1, 1, nStateID+1);
		title_cast_state("state_life_max_point_add", 10000, -1, 1, nStateID+2);
		title_cast_state("state_dodge_point_increase", 200, -1, 1, nStateID+3);
	end
end

function _71_01_(nType, nStateID)
	if 1 == nType or 2 == nType then
		title_cast_state("state_burst_enhance_rate", 5, -1, 1, nStateID)
		title_cast_state("state_medicine_time_increase", 30, -1, 1, nStateID+1)
		title_cast_state("state_life_max_point_add", 10000, -1, 1, nStateID+2)
		title_cast_state("state_add_book_attribute_value", 5, -1, 1, nStateID+3)
		title_cast_state("state_add_allability", 25, -1, 1, nStateID+4)
	end
end

t_tong_title_cfg = {--帮会称号属性数值
    {"K誸 ngh躠", 20, 10000, 10, 10 },
    {"Hu� Th�", 30, 12000, 12, 15 },
    {"Kim Lan", 40, 14000, 14, 20 },
    {"T� T﹎", 50, 16000, 16, 25 },
    {"уng hng", 80, 18000, 20, 40 },
    {"Ph� H醓", 90, 20000, 25, 50 },
    {"Qu莕 H飊g", 120, 25000, 30, 60 },
    {"H頿 m璾", 150, 30000, 35, 70 },
    {"Ch� Kh�", 200, 35000, 40, 80 },
    {"уng C鮱", 300, 40000, 50, 100 },
}

function _tong_title_(nLevel, nType, nStateID)
	if 2 == nType then
		local t = t_tong_title_cfg[nLevel]
		title_cast_state("state_destiny_armor_point_add", t[2], -1, 1, nStateID, 1)
		title_cast_state("state_life_max_point_add", t[3], -1, 1, nStateID+1)
		title_cast_state("state_def_critical_point_increase", t[4], -1, 1, nStateID+2)
		title_cast_state("state_def_critical_damage_increase", t[5], -1, 1, nStateID+3)
		
		local nRet = SyncCustomState(1, nStateID, 7, t[1])
	end
end
function _72_01_(nType, nStateID) return _tong_title_(1, nType, nStateID) end
function _72_02_(nType, nStateID) return _tong_title_(2, nType, nStateID) end
function _72_03_(nType, nStateID) return _tong_title_(3, nType, nStateID) end
function _72_04_(nType, nStateID) return _tong_title_(4, nType, nStateID) end
function _72_05_(nType, nStateID) return _tong_title_(5, nType, nStateID) end
function _72_06_(nType, nStateID) return _tong_title_(6, nType, nStateID) end
function _72_07_(nType, nStateID) return _tong_title_(7, nType, nStateID) end
function _72_08_(nType, nStateID) return _tong_title_(8, nType, nStateID) end
function _72_09_(nType, nStateID) return _tong_title_(9, nType, nStateID) end
function _72_10_(nType, nStateID) return _tong_title_(10, nType, nStateID) end

function _73_01_(nType, nStateID)
	if 1 == nType or 2 == nType then
		title_cast_state("state_burst_enhance_rate", 7, -1, 1, nStateID)
		title_cast_state("state_medicine_time_increase", 35, -1, 1, nStateID+1)
		title_cast_state("state_life_max_point_add", 15000, -1, 1, nStateID+2)
		title_cast_state("state_add_book_attribute_value", 5, -1, 1, nStateID+3)
		title_cast_state("state_add_allability", 27, -1, 1, nStateID+4)
	end
end

function _74_01_(nType, nStateID)	--天枢
	if 1 == nType or 2 == nType then
		title_cast_state("state_destiny_armor_point_add", 50, -1, 1, nStateID)
		title_cast_state("state_interrupt_rate_dec", 10, -1, 1, nStateID+1)		
	end
end

function _74_02_(nType, nStateID)	--天璇
	if 1 == nType or 2 == nType then
		title_cast_state("state_max_damage", 100, -1, 1, nStateID)
		title_cast_state("state_critical_point_increase", 10, -1, 1, nStateID+1)		
	end
end

function _74_03_(nType, nStateID)	--天玑
	if 1 == nType or 2 == nType then
		title_cast_state("state_destiny_attack_point_add", 50, -1, 1, nStateID)
		title_cast_state("state_critical_damage_increase", 50, -1, 1, nStateID+1)		
	end
end

function _75_01_(nType, nStateID)	--天权
	if 1 == nType or 2 == nType then
		title_cast_state("state_element_all_attack_point_add", 10, -1, 1, nStateID)
		title_cast_state("state_p_attack_percent_add", 30, -1, 1, nStateID+1)		
		title_cast_state("state_m_attack_percent_add", 30, -1, 1, nStateID+2)
	end
end

function _75_02_(nType, nStateID)	--玉衡
	if 1 == nType or 2 == nType then
		title_cast_state("state_cast_technique_rate", 8, -1, 1, nStateID)
		title_cast_state("state_receive_half_damage", 15, -1, 1, nStateID+1)		
	end
end

function _76_01_(nType, nStateID)
	if 1 == nType or 2 == nType then
		title_cast_state("state_burst_enhance_rate", 8, -1, 1, nStateID)
		title_cast_state("state_medicine_time_increase", 40, -1, 1, nStateID+1)
		title_cast_state("state_life_max_point_add", 20000, -1, 1, nStateID+2)
		title_cast_state("state_add_book_attribute_value", 5, -1, 1, nStateID+3)
		title_cast_state("state_add_allability", 30, -1, 1, nStateID+4)
	end
end

function _77_01_(nType, nStateID)
	if 1 == nType or 2 == nType then
		title_cast_state("state_m_attack_percent_add", 10, -1, 1, nStateID)
		title_cast_state("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_life_max_point_add", 10000, -1, 1, nStateID+2)
		title_cast_state("state_life_max_percent_add", 10, -1, 1, nStateID+3)
		title_cast_state("state_add_allability", 10, -1, 1, nStateID+4)
		title_cast_state("state_medicine_time_increase", 5, -1, 1, nStateID+5)
	end
end

function _78_01_(nType, nStateID)
	--提高全属性五行抗性20点，无惧20点。
	if 1 == nType or 2 == nType then
		--title_cast_state("state_element_all_attack_point_add", 10, -1, 1, nStateID+1--
		title_cast_state("state_element_all_defend_point_add", 20, -1, 1, nStateID+2)
		title_cast_state("state_destiny_armor_point_add", 20, -1, 1, nStateID+3)
	end
end

function _99_01_(nType, nStateID)
	local nVal1, nVal2 = 8, 15
	if 1 == nType or 2 == nType then
		title_cast_state("state_burst_enhance_rate", nVal1, -1, 1, nStateID)
		title_cast_state("state_add_allability", nVal2, -1, 1, nStateID + 1)
		title_cast_state("state_life_max_point_add", 2000, -1, 1, nStateID + 2)
	end
	if 1 == nType then
		Msg2Player("Thng danh ph薾 Чi Hi謕: T╪g t鑓  thi tri觧 t╪g 8%, kh竛g t蕋 c� t╪g 15 甶觤, sinh l鵦 t鑙 產 t╪g 2000 甶觤.")
	end
end

function _100_01_(nType, nStateID)

end

function _101_02_(nType, nStateID)

end

function _101_03_(nType, nStateID)

end

function _101_04_(nType, nStateID)

end

function _101_05_(nType, nStateID)

end

function _101_06_(nType, nStateID)

end

function _101_07_(nType, nStateID)

end

function _101_08_(nType, nStateID)

end

function _101_09_(nType, nStateID)

end

function _101_10_(nType, nStateID)

end

function _200_01_(nType, nStateID)
	if 1 == nType or 2 == nType then
        title_cast_state("state_add_allability", 50, -1, 1, nStateID);
		title_cast_state("state_p_attack_percent_add", 15, -1, 1, nStateID+1)-- t╪g 15% cong kich
		title_cast_state("state_m_attack_percent_add", 15, -1, 1, nStateID+2) -- t╪g 15% cong kich
		title_cast_state("state_life_max_point_add", 20000, -1, 1, nStateID+3) -- tang 20k HP
		title_cast_state("state_burst_enhance_rate", 15, -1, 1, nStateID+4) -- t鑓 do xu蕋 chieu
		title_cast_state("state_receive_half_damage", 10, -1, 1, nStateID+5)--- gi秏 th thng
		--title_cast_state("state_burst_enhance_rate", 50, -1, 1, nStateID);
		--title_cast_state("state_add_allability", 50, -1, 1, nStateID+6);
	end
end

function _200_02_(nType, nStateID)
	if 1 == nType or 2 == nType then
		title_cast_state("state_destiny_armor_point_add", 100, -1, 1, nStateID) --- V� c� 100
		title_cast_state("state_destiny_attack_point_add", 50, -1, 1, nStateID+1) ---  Ph Dich 50
		title_cast_state("state_element_all_attack_point_add", 15, -1, 1, nStateID+2) --- Cong Kich ngu hanh 15
		title_cast_state("state_element_all_defend_point_add", 20, -1, 1, nStateID+3) -- Kh竛g ng� H祅h 20
	end
end
function _200_03_(nType, nStateID)
	if 1 == nType or 2 == nType then
	title_cast_state("state_destiny_armor_point_add", 80, -1, 1, nStateID) --- V� c� 300
	title_cast_state("state_destiny_attack_point_add", 50, -1, 1, nStateID+1) ---  Ph Dich 50
	title_cast_state("state_add_allability", 30, -1, 1, nStateID+2)
	end
end
function _200_04_(nType, nStateID)
	if 1 == nType or 2 == nType then
	title_cast_state("state_destiny_armor_point_add", 80, -1, 1, nStateID) --- V� c� 300
	title_cast_state("state_destiny_attack_point_add", 50, -1, 1, nStateID+1) ---  Ph Dich 50
	title_cast_state("state_add_allability", 30, -1, 1, nStateID+2)
	end
end
function _200_05_(nType, nStateID)
	if 1 == nType or 2 == nType then
	title_cast_state("state_destiny_armor_point_add", 30, -1, 1, nStateID) --- V� c� 30
	title_cast_state("state_destiny_attack_point_add", 20, -1, 1, nStateID+1) ---  Ph Dich 20
	--title_cast_state("state_move_speed_percent_add", 12, -1, 1, nStateID+2) --- toc do di chuyen 12%
	title_cast_state("state_p_attack_percent_add", 5, -1, 1, nStateID+3)-- t╪g 5% cong kich
	title_cast_state("state_m_attack_percent_add", 5, -1, 1, nStateID+4) -- t╪g 5% cong kich
	end
end
