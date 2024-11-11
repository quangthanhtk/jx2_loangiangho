-- ÉèÖÃ³ÆºÅºÍÈ¡ÏûÉèÖÃÉùÍûÊ±Ö´ĞĞ

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
			Msg2Player("X­ng hiÖu cña b¹n hÕt h¹n vµo " .. format("ngµy %d/%d/%d lóc %d:%d", nDay, nMonth, nYear, nHour, nMin))
		end
	end
end

function UnEquip(nGeren, nDetail, nType)
	local nStateID = nGeren * 10000 + nDetail * 100
	for i = 1, TITLE_MAX_ATTR_CNT do
		RemoveState(nStateID + i - 1)
	end
	if nGeren == 72 and nType == 2 then--°ï»á³ÆºÅ
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
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 20 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 20 ®iÓm");
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

-- ³õ¼¶
function _23_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_vitality", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: G©n cèt + 5 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_vitality", 3, -1, 1, nStateID);
		Msg2Player("§­îc hiÖu qu¶: G©n cèt + 3 ®iÓm");
	end;
end

function _23_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 5 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 3 ®iÓm");
	end;
end

function _23_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 5 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 3 ®iÓm");
	end;
end

function _23_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 5 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 3 ®iÓm");
	end;
end

function _23_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 5 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 3 ®iÓm");
	end;
end

function _23_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 5 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 3 ®iÓm");
	end;
end

function _23_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_strength", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Søc m¹nh + 5 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_strength", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Søc m¹nh + 3 ®iÓm");
	end;
end

function _23_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 5 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 3 ®iÓm");
	end;
end

function _23_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 5 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 3 ®iÓm");
	end;
end

function _23_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 5 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 3 ®iÓm");
	end;
end

function _23_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_strength", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Søc m¹nh + 5 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_strength", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Søc m¹nh + 3 ®iÓm");
	end;
end

function _23_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 5 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 3 ®iÓm");
	end;
end

function _23_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 5 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 3 ®iÓm");
	end;
end

function _23_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 5 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 3 ®iÓm");
	end;
end

function _23_15_(nType, nStateID)	--ÌìÊ¦
	if nType == 1 then
		CastState("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 5 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 3 ®iÓm");
	end;
end

function _23_16_(nType, nStateID)	--Ê¥Õ½
	if nType == 1 then
		CastState("state_add_strength", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Søc m¹nh + 5 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_strength", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Søc m¹nh + 3 ®iÓm");
	end;
end

function _23_17_(nType, nStateID)	--Õó±ø
	if nType == 1 then
		CastState("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 5 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 3 ®iÓm");
	end;
end

function _23_18_(nType, nStateID)	--ÑªÈË
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 5 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 3 ®iÓm");
	end;
end

function _23_19_(nType, nStateID)	--ÎèÏÉ
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 5 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 3 ®iÓm");
	end;
end

function _23_20_(nType, nStateID)	--ÁéÅ®
	if nType == 1 then
		CastState("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 5 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 3 ®iÓm");
	end;
end

-- ÖĞ¼¶
function _24_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	end;
end

function _24_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	end;
end

function _24_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	end;
end

function _24_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	end;
end

function _24_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	end;
end

function _24_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	end;
end

function _24_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	end;
end

function _24_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	end;
end

function _24_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	end;
end

function _24_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	end;
end

function _24_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID);
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	end;
end

function _24_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	end;
end

function _24_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	end;
end

function _24_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 10 ®iÓm");
	end;
end

function _24_15_(nType, nStateID)	--ÌìÊ¦
	if nType == 1 then
		CastState("state_add_energy", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 10 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_energy", 6, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 6 ®iÓm");
	end;
end

function _24_16_(nType, nStateID)	--Ê¥Õ½
	if nType == 1 then
		CastState("state_add_strength", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Søc m¹nh + 10 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_strength", 6, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Søc m¹nh + 6 ®iÓm");
	end;
end

function _24_17_(nType, nStateID)	--Õó±ø
	if nType == 1 then
		CastState("state_add_observe", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 10 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_observe", 6, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 6 ®iÓm");
	end;
end

function _24_18_(nType, nStateID)	--ÑªÈË
	if nType == 1 then
		CastState("state_add_dexterity", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 10 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_dexterity", 6, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 6 ®iÓm");
	end;
end

function _24_19_(nType, nStateID)	--ÎèÏÉ
	if nType == 1 then
		CastState("state_add_dexterity", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 10 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_dexterity", 6, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 6 ®iÓm");
	end;
end

function _24_20_(nType, nStateID)	--ÁéÅ®
	if nType == 1 then
		CastState("state_add_observe", 10, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 10 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_observe", 6, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 6 ®iÓm");
	end;
end

-- ¸ß¼¶
function _25_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	end;
end

function _25_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	end;
end

function _25_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	end;
end

function _25_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	end;
end

function _25_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	end;
end

function _25_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	end;
end

function _25_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	end;
end

function _25_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	end;
end

function _25_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	end;
end

function _25_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	end;
end

function _25_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	end;
end

function _25_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	end;
end

function _25_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	end;
end

function _25_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 12 ®iÓm");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 4%");
	end;
end

function _25_15_(nType, nStateID)	--ÌìÊ¦
	if nType == 1 then
		CastState("state_add_energy", 20, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 20 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_energy", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 12 ®iÓm");
	end;
end

function _25_16_(nType, nStateID)	--Ê¥Õ½
	if nType == 1 then
		CastState("state_add_strength", 20, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Søc m¹nh + 20 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_strength", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Søc m¹nh + 12 ®iÓm");
	end;
end

function _25_17_(nType, nStateID)	--Õó±ø
	if nType == 1 then
		CastState("state_add_observe", 20, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 20 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_observe", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 12 ®iÓm");
	end;
end

function _25_18_(nType, nStateID)	--ÑªÈË
	if nType == 1 then
		CastState("state_add_dexterity", 20, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 20 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_dexterity", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 12 ®iÓm");
	end;
end

function _25_19_(nType, nStateID)	--ÎèÏÉ
	if nType == 1 then
		CastState("state_add_dexterity", 20, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 20 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_dexterity", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 12 ®iÓm");
	end;
end

function _25_20_(nType, nStateID)	--ÁéÅ®
	if nType == 1 then
		CastState("state_add_observe", 20, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 20 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_observe", 12, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 12 ®iÓm");
	end;
end

-- ×î¸ß
function _26_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	end;
end

function _26_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	end;
end

function _26_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	end;
end

function _26_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	end;
end

function _26_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	end;
end

function _26_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	end;
end

function _26_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	end;
end

function _26_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	end;
end

function _26_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	end;
end

function _26_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	end;
end

function _26_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	end;
end

function _26_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	end;
end

function _26_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	end;
end

function _26_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 14 ®iÓm");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 1%");
	end;
end

function _26_15_(nType, nStateID)	--ÌìÊ¦
	if nType == 1 then
		CastState("state_add_energy", 30, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 30 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_energy", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 18 ®iÓm");
	end;
end

function _26_16_(nType, nStateID)	--Ê¥Õ½
	if nType == 1 then
		CastState("state_add_strength", 30, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Søc m¹nh + 30 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_strength", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Søc m¹nh + 18 ®iÓm");
	end;
end

function _26_17_(nType, nStateID)	--Õó±ø
	if nType == 1 then
		CastState("state_add_observe", 30, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 30 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_observe", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 18 ®iÓm");
	end;
end

function _26_18_(nType, nStateID)	--ÑªÈË
	if nType == 1 then
		CastState("state_add_dexterity", 30, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 30 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_dexterity", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 18 ®iÓm");
	end;
end

function _26_19_(nType, nStateID)	--ÎèÏÉ
	if nType == 1 then
		CastState("state_add_dexterity", 30, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 30 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_dexterity", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 18 ®iÓm");
	end;
end

function _26_20_(nType, nStateID)	--ÁéÅ®
	if nType == 1 then
		CastState("state_add_observe", 30, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 30 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_observe", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 18 ®iÓm");
	end;
end
--Ê¦ÃÅµÚ4³ÆºÅ
function _27_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	end;
end

function _27_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	end;
end

function _27_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	end;
end

function _27_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	end;
end

function _27_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	end;
end

function _27_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	end;
end

function _27_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	end;
end

function _27_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	end;
end

function _27_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	end;
end

function _27_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	end;
end

function _27_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	end;
end

function _27_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	end;
end

function _27_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	end;
end

function _27_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 16 ®iÓm");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("§­îc hiÖu qu¶: t¨ng thªm hiÖu qu¶ cña th­¬ng d­îc 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 2%");
	end;
end

function _27_15_(nType, nStateID)	--ÌìÊ¦
	if nType == 1 then
		CastState("state_add_energy", 35, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 35 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_energy", 21, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 21 ®iÓm");
	end;
end

function _27_16_(nType, nStateID)	--Ê¥Õ½
	if nType == 1 then
		CastState("state_add_strength", 35, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Søc m¹nh + 35 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_strength", 21, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Søc m¹nh + 21 ®iÓm");
	end;
end

function _27_17_(nType, nStateID)	--Õó±ø
	if nType == 1 then
		CastState("state_add_observe", 35, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 35 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_observe", 21, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 21 ®iÓm");
	end;
end

function _27_18_(nType, nStateID)	--ÑªÈË
	if nType == 1 then
		CastState("state_add_dexterity", 35, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 35 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_dexterity", 21, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 21 ®iÓm");
	end;
end

function _27_19_(nType, nStateID)	--ÎèÏÉ
	if nType == 1 then
		CastState("state_add_dexterity", 35, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 35 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_dexterity", 21, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 21 ®iÓm");
	end;
end

function _27_20_(nType, nStateID)	--ÁéÅ®
	if nType == 1 then
		CastState("state_add_observe", 35, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 35 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_observe", 21, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 21 ®iÓm");
	end;
end
--Ê¦ÃÅµÚ5³ÆºÅ
function _28_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3% ");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3% ");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	end;
end

function _28_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3% ");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	end;
end

function _28_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	end;
end

function _28_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	end;
end

function _28_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	end;
end

function _28_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	end;
end

function _28_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	end;
end

function _28_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	end;
end

function _28_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	end;
end

function _28_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	end;
end

function _28_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	end;
end

function _28_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	end;
end

function _28_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	end;
end

function _28_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Kh¸ng TÊt C¶ + 18 ®iÓm");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("§­îc hiÖu qu¶: Mçi 10 gi©y sinh lùc phôc håi 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("§­îc hiÖu qu¶: hç trî mËt tŞch t¨ng 3%");
	end;
end

function _28_15_(nType, nStateID)	--ÌìÊ¦
	if nType == 1 then
		CastState("state_add_energy", 40, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 40 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_energy", 24, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 24 ®iÓm");
	end;
end

function _28_16_(nType, nStateID)	--Ê¥Õ½
	if nType == 1 then
		CastState("state_add_strength", 40, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Søc m¹nh + 40 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_strength", 24, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Søc m¹nh + 24 ®iÓm");
	end;
end

function _28_17_(nType, nStateID)	--Õó±ø
	if nType == 1 then
		CastState("state_add_observe", 40, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 40 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_observe", 24, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 24 ®iÓm");
	end;
end

function _28_18_(nType, nStateID)	--ÑªÈË
	if nType == 1 then
		CastState("state_add_dexterity", 40, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 40 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_dexterity", 24, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 24 ®iÓm");
	end;
end

function _28_19_(nType, nStateID)	--ÎèÏÉ
	if nType == 1 then
		CastState("state_add_dexterity", 40, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 40 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_dexterity", 24, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Th©n ph¸p + 24 ®iÓm");
	end;
end

function _28_20_(nType, nStateID)	--ÁéÅ®
	if nType == 1 then
		CastState("state_add_observe", 40, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 40 ®iÓm");
	elseif nType == 2 then
		CastState("state_add_observe", 24, -1, 1, nStateID)
		Msg2Player("§­îc hiÖu qu¶: Linh ho¹t + 24 ®iÓm");
	end;
end

--ËÎ·½Ê¿±ø
function _30_01_(nType, nStateID)

end;
--ËÎ¾üÎäÓÂĞ£Î¾
function _30_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_life_max_percent_add", 5, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_life_max_percent_add", 5, -1, 1, nStateID)
	end;
end;
--ËÎ¾ü³£Ê¤¶¼Í³
function _30_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_life_max_percent_add", 8, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_life_max_percent_add", 8, -1, 1, nStateID)
	end;
end;
--ËÎ¾ü¶¨±±´óÏÈ·æ
function _30_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID)
	end;
end;
--´óËÎÎŞË«´ó½«¾ü
function _30_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	end;
end;
--´óËÎ»¤¹ú´óÔªË§
function _30_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_burst_enhance_rate", 25, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_burst_enhance_rate", 25, -1, 1, nStateID)
	end;
end;
--ÁÉ·½Ê¿±ø
function _30_07_(nType, nStateID)

end;
--ÁÉ¾üæçÓÂĞ£Î¾
function _30_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_life_max_percent_add", 5, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_life_max_percent_add", 5, -1, 1, nStateID)
	end;
end;
--ÁÉ¾ü¾ø³¾¶¼Í³
function _30_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_life_max_percent_add", 8, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_life_max_percent_add", 8, -1, 1, nStateID)
	end;
end;
--ÁÉ¾üÆ½ÄÏ´óÏÈ·æ
function _30_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID)
	end;
end;
--´óÁÉÍ¨Ìì´ó½«¾ü
function _30_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	end;
end;
--ÄÏÔº´óÍõ
function _30_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_burst_enhance_rate", 25, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_burst_enhance_rate", 25, -1, 1, nStateID)
	end;
end;
--´óËÎÆÆÕó¶½»¤
function _30_13_(nType, nStateID)
	if nType == 1 then	--Ôö¼ÓÄÚÍâ¹¥15%
		title_cast_state("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	elseif nType == 2 then	
		title_cast_state("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	end;
end;
--´óÁÉÆÆÕó¶½»¤
function _30_14_(nType, nStateID)
	if nType == 1 then	--Ôö¼ÓÄÚÍâ¹¥15%
		title_cast_state("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	end;
end;
--´óËÎÆÆÕó¶½»¤
function _30_15_(nType, nStateID)
	if nType == 1 then	--Ôö¼ÓÉËº¦100µã
		title_cast_state("state_damage_point", 100, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_damage_point", 100, -1, 1, nStateID)
	end;
end;
--´óÁÉÆÆÕó¶½»¤
function _30_16_(nType, nStateID)
	if nType == 1 then	--Ôö¼ÓÉËº¦100µã
		title_cast_state("state_damage_point", 100, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_damage_point", 100, -1, 1, nStateID)
	end;
end;
--ËÎÕò¾ü»¢Æï
function _30_17_(nType, nStateID)
	if nType == 1 then	--ÉËº¦¼õ°ë¸ÅÂÊ25%
		title_cast_state("state_receive_half_damage", 25, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_receive_half_damage", 25, -1, 1, nStateID)
	end;
end;
--ÁÉÕò¾ü»¢Æï
function _30_18_(nType, nStateID)
	if nType == 1 then	--ÉËº¦¼õ°ë¸ÅÂÊ25%
		title_cast_state("state_receive_half_damage", 25, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_receive_half_damage", 25, -1, 1, nStateID)
	end;
end;
--´óËÎÌú¹ÇÁúÎÀ
function _30_19_(nType, nStateID)
	if nType == 1 then	--ËùÓĞÊôĞÔ60µã
		title_cast_state("state_add_allability", 60, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 60, -1, 1, nStateID)
	end;
end;
--´óÁÉÌú¹ÇÁúÎÀ
function _30_20_(nType, nStateID)
	if nType == 1 then	--ËùÓĞÊôĞÔ60µã
		title_cast_state("state_add_allability", 60, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 60, -1, 1, nStateID)
	end;
end;
--´óËÎÎŞË«·É½«
function _30_21_(nType, nStateID)
	if nType == 1 then	--ÉúÃüÉÏÏŞÔö¼Ó10000µã
		title_cast_state("state_life_max_point_add", 10000, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_life_max_point_add", 10000, -1, 1, nStateID)
	end;
end;
--´óÁÉÎŞË«·É½«
function _30_22_(nType, nStateID)
	if nType == 1 then	--ÉúÃüÉÏÏŞÔö¼Ó10000µã
		title_cast_state("state_life_max_point_add", 10000, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_life_max_point_add", 10000, -1, 1, nStateID)
	end;
end;
--´óËÎÓùµĞÃÍÊ¿
function _30_23_(nType, nStateID)
	if nType == 1 then	--ËùÓĞÊôĞÔ40µã
		title_cast_state("state_add_allability", 40, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 40, -1, 1, nStateID)
	end;
end;
--´óÁÉÓùµĞÃÍÊ¿
function _30_24_(nType, nStateID)
	if nType == 1 then	--ËùÓĞÊôĞÔ40µã
		title_cast_state("state_add_allability", 40, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 40, -1, 1, nStateID)
	end;
end;

function _63_01_(nType, nStateID)
    if nType == 1 then	--ËùÓĞÊôĞÔ8µã
		title_cast_state("state_add_allability", 8, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 8, -1, 1, nStateID)
	end;
end

function _64_01_(type, stateID)
	if 1 == type then
		title_cast_state("state_add_energy", 20, -1, 1, stateID)
		Msg2Player("§­îc hiÖu qu¶: Néi c«ng + 20 ®iÓm");
	end
end

function _64_02_(type, stateID)
	if 1 == type then
		title_cast_state("state_add_strength", 20, -1, 1, stateID)
		Msg2Player("§­îc hiÖu qu¶: Søc m¹nh + 20 ®iÓm");	
	end
end

--function _64_03_(type, stateID)
--	if 1 == type then
--		title_cast_state("state_add_dexterity", 20, -1, 1, stateID)
--		Msg2Player("»ñµÃĞ§¹û£ºÉí·¨Ôö¼Ó20µã");
--	end
--end
--
--function _64_04_(type, stateID)
--	if 1 == type then
--		title_cast_state("state_add_vitality", 20, -1, 1, stateID)
--		Msg2Player("»ñµÃĞ§¹û£º¸ù¹ÇÔö¼Ó20µã");
--	end
--end
--
--function _64_05_(type, stateID)
--	if 1 == type then
--		title_cast_state("state_add_observe", 20, -1, 1, stateID)
--		Msg2Player("»ñµÃĞ§¹û£º¶´²ìÔö¼Ó20µã");
--	end
--end

function PT_AddAllWhenEquip(type, stateID, number1, number2)
	if 1 == type then
		title_cast_state("state_burst_enhance_rate", number1, -1, 1, stateID+1);
		title_cast_state("state_add_allability", number2, -1, 1, stateID+2);
		--Msg2Player(format("%s%d%%%s%d%s","»ñµÃĞ§¹û£ºÊ©Õ¹ËÙ¶ÈÌá¸ß", number1, ",È«ÊôĞÔÔö¼Ó", number2, "µã"));
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
--		Msg2Player("»ñµÃĞ§¹û£ºÉúÃüÖµÏÂ½µ15%");		
--	end
--end
--
--function _65_20_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_neili_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("»ñµÃĞ§¹û£ºÄÚÁ¦ÖµÏÂ½µ15%");		
--	end
--end
--
--function _65_21_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_life_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("»ñµÃĞ§¹û£ºÉúÃüÖµÏÂ½µ15%");		
--	end
--end
--
--function _65_22_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_life_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("»ñµÃĞ§¹û£ºÉúÃüÖµÏÂ½µ15%");		
--	end
--end
--
--function _65_23_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_neili_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("»ñµÃĞ§¹û£ºÄÚÁ¦ÖµÏÂ½µ15%");		
--	end
--end
--
--function _65_24_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_neili_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("»ñµÃĞ§¹û£ºÄÚÁ¦ÖµÏÂ½µ15%");		
--	end
--end
--
--function _65_25_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_slow", 10, -1, 1, stateID);
--		Msg2Player("»ñµÃĞ§¹û£ºÒÆ¶¯ËÙ¶ÈÏÂ½µ10%");		
--	end
--end
--
--function _65_26_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_add_allability", 8, -1, 1, stateID);
--		Msg2Player("»ñµÃĞ§¹û£ºÈ«ÊôĞÔÔö¼Ó8µã");
--	end
--end
--
--function _65_27_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_add_allability", 8, -1, 1, stateID);
--		Msg2Player("»ñµÃĞ§¹û£ºÈ«ÊôĞÔÔö¼Ó8µã");
--	end
--end

--------------------------------------------------------------------------------------
-- ¹¥³ÇÕ½³ÆºÅ

function CityWarEquip(nGeren, nDetail, nType)
	local nStateID = nGeren * 10000 + nDetail * 100
	local szfunc = format("_%.2d_%.2d_(%d, %d)", nGeren, nDetail, nType, nStateID)
	dostring(szfunc)
	if nType == 1 then
		local nYear, nMonth, nDay, nHour, nMin, nSec = AddTitleTime(nGeren, nDetail, 0)
		if nYear ~= 1970 then
			Msg2Player("X­ng hiÖu cña b¹n hÕt h¹n vµo " .. format("ngµy %d/%d/%d lóc %d:%d", nDay, nMonth, nYear, nHour, nMin))
		end
	end
end

function CityWarUnEquip(nGeren, nDetail, nType)
	SetCityWarDutyFlag(0, 0)
	VerifyEquip()
	UnEquip(nGeren, nDetail, nType);
end

function _51_01_(nType, nStateID)		-- ³É¶¼³ÇÖ÷
	SetCityWarDutyFlag(300, 0)
	title_cast_state("state_life_max_percent_add", 25, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 25, -1, 1, nStateID + 1);
end

function _51_02_(nType, nStateID)		-- ³É¶¼¿¤Ö÷
	SetCityWarDutyFlag(300, 0)
	title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 15, -1, 1, nStateID + 1);
end

function _51_03_(nType, nStateID)		-- ³É¶¼¾üÊ¦
	SetCityWarDutyFlag(300, 1)
	title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 15, -1, 1, nStateID + 1);
end

function _51_04_(nType, nStateID)		-- ³É¶¼Ãû²¶
	if nType == 1 then
		SetCityWarDutyFlag(300, 2)
	elseif nType == 2 then
		SetCityWarDutyFlag(0, 0)
	end
	title_cast_state("state_life_max_percent_add", 10, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 10, -1, 1, nStateID + 1);
end

function _51_05_(nType, nStateID)		-- ÈªÖİ³ÇÖ÷
	SetCityWarDutyFlag(100, 0)
	title_cast_state("state_life_max_percent_add", 25, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 25, -1, 1, nStateID + 1);
end

function _51_06_(nType, nStateID)		-- ÈªÖİ¿¤Ö÷
	SetCityWarDutyFlag(100, 0)
	title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 15, -1, 1, nStateID + 1);
end

function _51_07_(nType, nStateID)		-- ÈªÖİ¾üÊ¦
	SetCityWarDutyFlag(100, 1)
	title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 15, -1, 1, nStateID + 1);
end

function _51_08_(nType, nStateID)		-- ÈªÖİÃû²¶
	if nType == 1 then
		SetCityWarDutyFlag(100, 2)
	elseif nType == 2 then
		SetCityWarDutyFlag(0, 0)
	end
	title_cast_state("state_life_max_percent_add", 10, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 10, -1, 1, nStateID + 1);
end

function _51_09_(nType, nStateID)		-- ÏåÑô³ÇÖ÷
	SetCityWarDutyFlag(350, 0)
	title_cast_state("state_life_max_percent_add", 25, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 25, -1, 1, nStateID + 1);
end

function _51_10_(nType, nStateID)		-- ÏåÑô¿¤Ö÷
	SetCityWarDutyFlag(350, 0)
	title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 15, -1, 1, nStateID + 1);
end

function _51_11_(nType, nStateID)		-- ÏåÑô¾üÊ¦
	SetCityWarDutyFlag(350, 1)
	title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 15, -1, 1, nStateID + 1);
end

function _51_12_(nType, nStateID)		-- ÏåÑôÃû²¶
	if nType == 1 then
		SetCityWarDutyFlag(350, 2)
	elseif nType == 2 then
		SetCityWarDutyFlag(0, 0)
	end
	title_cast_state("state_life_max_percent_add", 10, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 10, -1, 1, nStateID + 1);
end

--Î÷±±¹Ø¿¨³ÆºÅ
--×İºáÎ÷ÏÄ£¨»÷°ÜÀîÔªÇì»ñµÃµÄ³ÆºÅ£©
function _60_08_(nType, nStateID)
	if nType == 1 then	--¾­Ñé»ñµÃÔö¼Ó5%
		title_cast_state("state_inc_exp_gain", 5, -1, 1, nStateID)
	elseif nType == 2 then  --¾­Ñé»ñµÃÔö¼Ó5%
		title_cast_state("state_inc_exp_gain", 0, -1, 1, nStateID)
	end;
end;

-- ¹¥³ÇÕ½³ÆºÅ½áÊø

--==========ÅĞ¶ÏÕ½³¡³ÆºÅµÄ============================================================
tTitleTab =
{
--³ÆºÅÃû³Æ£¬¶ÔÓ¦³ÆºÅ±íÄÚµÄ´óÀà£¬¸±Àà£¬ËùĞè¾üÏÎ
	{"Tèng_Vâ Dòng HiÖu óy",	30, 2, 2},
	{"Liªu_Kiªu Dòng §« óy",	30, 8,-2},
	{"Tèng_Th­êng Th¾ng §« thèng",	30, 3, 3},
	{"Liªu_TuyÖt trÇn §« thèng",	30, 9,-3},
	{"Tèng_§Şnh B¾c ®¹i Tiªn phong",	30, 4, 4},
	{"Liªu_B×nh Nam ®¹i Tiªn phong",	30,10,-4},	
	{"Tèng_V« Song §¹i t­íng qu©n",	30, 5, 5},	
	{"Liªu_Th«ng Thiªn §¹i t­íng qu©n",	30,11,-5},	
	{"Tèng_Hé Quèc §¹i nguyªn so¸i",	30, 6, 6},	
	{"Nam ViÖn ®¹i V­¬ng",		30,12,-6},	
} 

tNewTitleTab =
{
--³ÆºÅÃû³Æ£¬¶ÔÓ¦³ÆºÅ±íÄÚµÄ´óÀà£¬¸±Àà£¬ËùĞè¾ü¹¦£¬ÊÇ·ñÖ§³ÖÓÀ¾ÃÔªË§¾üÏÎ
	{"Tèng -Ph¸ TrËn §èc hé",	30,	13,		300000,		1}, 
	{"Liªu-Ph¸ TrËn §èc hé ",	30,	14,		-300000,	1},
	{"Tèng -Ph¸ TrËn §èc hé",	30,	15,		300000,		1}, 
	{"Liªu-Ph¸ TrËn §èc hé ",	30,	16,		-300000,	1},
	{"Tèng-TrÊn Qu©n Hæ kú",	30,	17,		450000,		0}, 
	{"Liªu-TrÊn Qu©n Hæ kú",	30,	18,		-450000,	0},	
	{"Tèng -ThiÕt Cæ Long VÖ",	30,	19,		400000,		0}, 
	{"Liªu- ThiÕt Cæ Long VÖ",	30,	20,		-400000,	0},
	{"Tèng- V« Song Phi T­íng",	30,	21,		500000,		0}, 
	{"Liªu-V« Song Phi T­íng",	30,	22,		-500000,	0},
	{"Tèng- Ngù §Şch M·nh Sü",	30,	23,		250000,		1}, 
	{"Liªu- Ngù §Şch M·nh Sü",	30,	24,		-250000,	1},
}
--¼ì²éµ±Ç°ÊÇ²»ÊÇÕ½³¡³ÆºÅ²¢ÇÒ·ûºÏ¶¥Õâ¸ö³ÆºÅµÄ×Ê¸ñ
function check_battle_rank(nGeren, nDetail)
	local nTitleIdx = 0;
	for i,v in tTitleTab do
		if tTitleTab[i][2] == nGeren and tTitleTab[i][3] == nDetail then
			nTitleIdx = i;
		end;
	end;
	if nTitleIdx == 0 then	--²»ÊÇÕ½³¡³ÆºÅ
		return 1;
	end;
	local nCurRank = GetTask(704);
	local nNeedRank = tTitleTab[nTitleIdx][4];	
	if nCurRank > 0 then
		if nNeedRank < 0 then
			Msg2Player("B¹n hiÖn thuéc phe Tèng, kh«ng thÓ dïng danh hiÖu cña phe Liªu");
			return 0
		end
	elseif nCurRank < 0 then
		if nNeedRank > 0 then
			Msg2Player("B¹n hiÖn thuéc phe Liªu kh«ng thÓ dïng danh hiÖu cña phe Tèng");
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
		Msg2Player("Qu©n hµm cña b¹n qu¸ thÊp kh«ng thÓ sö dông danh hiÖu nµy.")
		return 0
	end
	return 1
end;
--µÚ¶şÅúÕ½³¡³ÆºÅ¼ì²é
function check_new_battle_rank(nGeren, nDetail)
	local tCampNameZ =					--ÕóÓªÃû×Ö£¨ÖĞÎÄ£©£¬ÏÔÊ¾¶Ô»°µÄÊ±ºòÓÃµÄ
	{
		[0] = "",
		[1] = "Tèng",
		[2] = "Liªu",
	}
	local nTitleIdx = 0;
	for i,v in tNewTitleTab do
		if tNewTitleTab[i][2] == nGeren and tNewTitleTab[i][3] == nDetail then
			nTitleIdx = i;
		end;
	end;
	if nTitleIdx == 0 then	--²»ÊÇÕ½³¡³ÆºÅ
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
		bEverMarshal = 1;	--ÊÇÓÀ¾ÃÔªË§
	end;
	if nCurCamp == 1 then	--µ±Ç°ÎªËÎ·½
		if nNeedEverRank == 1 then
			if (bEverMarshal == 0 and nCurJunGong < nNeedJunGong) or nCurCamp ~= nTitleCamp then
				Msg2Player("B¹n ph¶i ®¹t ®­îc "..tCampNameZ[nTitleCamp].."Ph­¬ng "..abs(nNeedJunGong).." chiÕn c«ng hoÆc cã "..tCampNameZ[nTitleCamp].." Qu©n hµm Ph­¬ng VÜnh cöu Nguyªn So¸i míi cã thÓ sö dông x­ng hiÖu nµy");				
				return 0;
			end;
		else
			if nCurJunGong < nNeedJunGong or nCurCamp ~= nTitleCamp then
				Msg2Player("B¹n ph¶i ®¹t ®­îc "..tCampNameZ[nTitleCamp].."Ph­¬ng "..abs(nNeedJunGong).." Qu©n c«ng míi ®­îc sö dông x­ng hiÖu nµy");				
				return 0;
			end;
		end;
	else
		if nNeedEverRank == 1 then
			if (bEverMarshal == 0 and nCurJunGong > nNeedJunGong) or nCurCamp ~= nTitleCamp then
				Msg2Player("B¹n ph¶i ®¹t ®­îc "..tCampNameZ[nTitleCamp].."Ph­¬ng "..abs(nNeedJunGong).." chiÕn c«ng hoÆc cã "..tCampNameZ[nTitleCamp].." Qu©n hµm Ph­¬ng VÜnh cöu Nguyªn So¸i míi cã thÓ sö dông x­ng hiÖu nµy");				
				return 0;
			end;
		else
			if nCurJunGong > nNeedJunGong or nCurCamp ~= nTitleCamp then
				Msg2Player("B¹n ph¶i ®¹t ®­îc "..tCampNameZ[nTitleCamp].."Ph­¬ng "..abs(nNeedJunGong).." Qu©n c«ng míi ®­îc sö dông x­ng hiÖu nµy");				
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

--ÕÙ»ØÀÏÍæ¼Ò»î¶¯ ÎäÁÖ³ÆºÅ
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

--¶şÊ®ÖÜÄê³ÆºÅ
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

--ËÄÁé×ªÉí³ÆºÅÊôĞÔ
function _61_05_(nType, nStateID)
--	print(nType, nStateID)
--	print(GetPlayerRebornParam(1))
	if nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID);
		title_cast_state("state_medicine_time_increase", 10, -1, 1, nStateID + 1);
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 2);
	end
end

--ËÄÁé×ªÉí2³ÆºÅÊôĞÔ
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
    [2] = {"state_add_strength", "Søc m¹nh",}, --ÉÙÁÖË×¼Ò
    [3] = {"state_add_energy", "Néi c«ng ",}, --ÉÙÁÖìø×Ú
    [4] = {"state_add_energy", "Néi c«ng ",}, --ÉÙÁÖÎä×Ú
    [6] = {"state_add_dexterity", "Th©n ph¸p",}, --ÌÆÃÅ
    [8] = {"state_add_energy", "Néi c«ng ",}, --¶ğáÒ·ğ¼Ò
    [9] = {"state_add_dexterity", "Th©n ph¸p",}, --¶ğáÒË×¼Ò
    [11] = {"state_add_strength", "Søc m¹nh",}, --Ø¤°ï¾»ÒÂ
    [12] = {"state_add_dexterity", "Th©n ph¸p",}, --Ø¤°ïÎÛÒÂ
    [14] = {"state_add_energy", "Néi c«ng ",}, --Îäµ±µÀ¼Ò
    [15] = {"state_add_observe", "Linh ho¹t",}, --Îäµ±Ë×¼Ò
    [17] = {"state_add_strength", "Søc m¹nh",}, --ÑîÃÅÇ¹Æï
    [18] = {"state_add_dexterity", "Th©n ph¸p",}, --ÑîÃÅ¹­Æï
    [20] = {"state_add_dexterity", "Th©n ph¸p",}, --Îå¶¾Ğ°ÏÀ
    [21] = {"state_add_observe", "Linh ho¹t",}, --Îå¶¾¹ÆÊ¦
    [23] = {"state_add_energy", "Néi c«ng ",}, --À¥ÂØ
	[25] = {"state_add_strength", "Søc m¹nh",}, --Ã÷½ÌÊ¥Õ½
	[26] = {"state_add_strength", "Søc m¹nh",}, --Ã÷½ÌÕó±ø
	[27] = {"state_add_energy", "Néi c«ng ",}, --Ã÷½ÌÑªÈË
    [29] = {"state_add_strength", "Søc m¹nh",}, --´äÑÌÎèÏÉ
	[30] = {"state_add_observe", "Linh ho¹t",}, --´äÑÌÁéÅ®
	[31] = {"state_add_strength", "Søc m¹nh",}, --ÌÆÃÅÈÎÏÀ
	[32] = {"state_add_strength", "Søc m¹nh",}, --À¥ÂØ½£×ğ
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


--ĞÂĞã×é³ÆºÅ
function _67_14_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷2µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ2µã¡£
		title_cast_state("state_element_all_attack_point_add", 2, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 2, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 2, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 2, -1, 1, nStateID+2)
	end;
end

function _67_15_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷4µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ4µã¡£
		title_cast_state("state_element_all_attack_point_add", 4, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 4, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 4, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 4, -1, 1, nStateID+2)
	end;
end

function _67_16_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷6µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ6µã¡£
		title_cast_state("state_element_all_attack_point_add", 6, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 6, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 6, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 6, -1, 1, nStateID+2)
	end;
end

function _67_17_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷8µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ8µã¡£
		title_cast_state("state_element_all_attack_point_add", 8, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 8, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 8, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 8, -1, 1, nStateID+2)
	end;
end

function _67_18_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷10µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ10µã¡£
		title_cast_state("state_element_all_attack_point_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 10, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 10, -1, 1, nStateID+2)
	end;
end

function _67_19_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷12µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ12µã¡£
		title_cast_state("state_element_all_attack_point_add", 12, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 12, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 12, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 12, -1, 1, nStateID+2)
	end;
end

function _67_20_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷14µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ14µã¡£
		title_cast_state("state_element_all_attack_point_add", 14, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 14, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 14, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 14, -1, 1, nStateID+2)
	end;
end

function _67_21_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷16µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ16µã¡£
		title_cast_state("state_element_all_attack_point_add", 16, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 16, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 16, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 16, -1, 1, nStateID+2)
	end;
end

function _67_22_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷18µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ18µã¡£
		title_cast_state("state_element_all_attack_point_add", 18, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 18, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 18, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 18, -1, 1, nStateID+2)
	end;
end

function _67_23_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷20µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ20µã¡£
		title_cast_state("state_element_all_attack_point_add", 20, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 20, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 20, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 20, -1, 1, nStateID+2)
	end;
end


--´óÏÀ×é³ÆºÅ
function _67_24_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷4µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ4µã¡£
		title_cast_state("state_element_all_attack_point_add", 4, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 4, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 4, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 4, -1, 1, nStateID+2)
	end;
end

function _67_25_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷6µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ6µã¡£
		title_cast_state("state_element_all_attack_point_add", 6, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 6, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 6, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 6, -1, 1, nStateID+2)
	end;
end

function _67_26_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷8µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ8µã¡£
		title_cast_state("state_element_all_attack_point_add", 8, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 8, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 8, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 8, -1, 1, nStateID+2)
	end;
end

function _67_27_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷10µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ10µã¡£
		title_cast_state("state_element_all_attack_point_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 10, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 10, -1, 1, nStateID+2)
	end;
end

function _67_28_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷12µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ12µã¡£
		title_cast_state("state_element_all_attack_point_add", 12, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 12, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 12, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 12, -1, 1, nStateID+2)
	end;
end

function _67_29_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷14µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ14µã¡£
		title_cast_state("state_element_all_attack_point_add", 14, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 14, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 14, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 14, -1, 1, nStateID+2)
	end;
end

function _67_30_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷16µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ16µã¡£
		title_cast_state("state_element_all_attack_point_add", 16, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 16, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 16, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 16, -1, 1, nStateID+2)
	end;
end

function _67_31_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷18µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ18µã¡£
		title_cast_state("state_element_all_attack_point_add", 18, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 18, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 18, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 18, -1, 1, nStateID+2)
	end;
end

function _67_32_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷20µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ20µã¡£
		title_cast_state("state_element_all_attack_point_add", 20, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 20, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 20, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 20, -1, 1, nStateID+2)
	end;
end

function _67_33_(nType, nStateID)
    if nType == 1 then	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¹¥»÷22µã£¬È«ÊôĞÔÎåĞĞ¿¹ĞÔ22µã¡£
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

t_tong_title_cfg = {--°ï»á³ÆºÅÊôĞÔÊıÖµ
    {"KÕt nghÜa", 20, 10000, 10, 10 },
    {"HuÒ Thñ", 30, 12000, 12, 15 },
    {"Kim Lan", 40, 14000, 14, 20 },
    {"TÒ T©m", 50, 16000, 16, 25 },
    {"§ång h­ëng", 80, 18000, 20, 40 },
    {"Phã Háa", 90, 20000, 25, 50 },
    {"QuÇn Hïng", 120, 25000, 30, 60 },
    {"Hîp m­u", 150, 30000, 35, 70 },
    {"Chİ Khİ", 200, 35000, 40, 80 },
    {"§ång Cõu", 300, 40000, 50, 100 },
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

function _74_01_(nType, nStateID)	--ÌìÊà
	if 1 == nType or 2 == nType then
		title_cast_state("state_destiny_armor_point_add", 50, -1, 1, nStateID)
		title_cast_state("state_interrupt_rate_dec", 10, -1, 1, nStateID+1)		
	end
end

function _74_02_(nType, nStateID)	--Ììè¯
	if 1 == nType or 2 == nType then
		title_cast_state("state_max_damage", 100, -1, 1, nStateID)
		title_cast_state("state_critical_point_increase", 10, -1, 1, nStateID+1)		
	end
end

function _74_03_(nType, nStateID)	--Ììçá
	if 1 == nType or 2 == nType then
		title_cast_state("state_destiny_attack_point_add", 50, -1, 1, nStateID)
		title_cast_state("state_critical_damage_increase", 50, -1, 1, nStateID+1)		
	end
end

function _75_01_(nType, nStateID)	--ÌìÈ¨
	if 1 == nType or 2 == nType then
		title_cast_state("state_element_all_attack_point_add", 10, -1, 1, nStateID)
		title_cast_state("state_p_attack_percent_add", 30, -1, 1, nStateID+1)		
		title_cast_state("state_m_attack_percent_add", 30, -1, 1, nStateID+2)
	end
end

function _75_02_(nType, nStateID)	--Óñºâ
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
	--Ìá¸ßÈ«ÊôĞÔÎåĞĞ¿¹ĞÔ20µã£¬ÎŞ¾å20µã¡£
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
		Msg2Player("Th­ëng danh phËn §¹i HiÖp: T¨ng tèc ®é thi triÓn t¨ng 8%, kh¸ng tÊt c¶ t¨ng 15 ®iÓm, sinh lùc tèi ®a t¨ng 2000 ®iÓm.")
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
		title_cast_state("state_p_attack_percent_add", 15, -1, 1, nStateID+1)-- t¨ng 15% cong kich
		title_cast_state("state_m_attack_percent_add", 15, -1, 1, nStateID+2) -- t¨ng 15% cong kich
		title_cast_state("state_life_max_point_add", 20000, -1, 1, nStateID+3) -- tang 20k HP
		title_cast_state("state_burst_enhance_rate", 15, -1, 1, nStateID+4) -- tèc do xuÊt chieu
		title_cast_state("state_receive_half_damage", 10, -1, 1, nStateID+5)--- gi¶m th th­¬ng
		--title_cast_state("state_burst_enhance_rate", 50, -1, 1, nStateID);
		--title_cast_state("state_add_allability", 50, -1, 1, nStateID+6);
	end
end

function _200_02_(nType, nStateID)
	if 1 == nType or 2 == nType then
		title_cast_state("state_destiny_armor_point_add", 100, -1, 1, nStateID) --- V« cô 100
		title_cast_state("state_destiny_attack_point_add", 50, -1, 1, nStateID+1) ---  Ph Dich 50
		title_cast_state("state_element_all_attack_point_add", 15, -1, 1, nStateID+2) --- Cong Kich ngu hanh 15
		title_cast_state("state_element_all_defend_point_add", 20, -1, 1, nStateID+3) -- Kh¸ng ngò Hµnh 20
	end
end
function _200_03_(nType, nStateID)
	if 1 == nType or 2 == nType then
	title_cast_state("state_destiny_armor_point_add", 80, -1, 1, nStateID) --- V« cô 300
	title_cast_state("state_destiny_attack_point_add", 50, -1, 1, nStateID+1) ---  Ph Dich 50
	title_cast_state("state_add_allability", 30, -1, 1, nStateID+2)
	end
end
function _200_04_(nType, nStateID)
	if 1 == nType or 2 == nType then
	title_cast_state("state_destiny_armor_point_add", 80, -1, 1, nStateID) --- V« cô 300
	title_cast_state("state_destiny_attack_point_add", 50, -1, 1, nStateID+1) ---  Ph Dich 50
	title_cast_state("state_add_allability", 30, -1, 1, nStateID+2)
	end
end
function _200_05_(nType, nStateID)
	if 1 == nType or 2 == nType then
	title_cast_state("state_destiny_armor_point_add", 30, -1, 1, nStateID) --- V« cô 30
	title_cast_state("state_destiny_attack_point_add", 20, -1, 1, nStateID+1) ---  Ph Dich 20
	--title_cast_state("state_move_speed_percent_add", 12, -1, 1, nStateID+2) --- toc do di chuyen 12%
	title_cast_state("state_p_attack_percent_add", 5, -1, 1, nStateID+3)-- t¨ng 5% cong kich
	title_cast_state("state_m_attack_percent_add", 5, -1, 1, nStateID+4) -- t¨ng 5% cong kich
	end
end
