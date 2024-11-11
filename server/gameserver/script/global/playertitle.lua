-- ���óƺź�ȡ����������ʱִ��

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
			Msg2Player("X�ng hi�u c�a b�n h�t h�n v�o " .. format("ng�y %d/%d/%d l�c %d:%d", nDay, nMonth, nYear, nHour, nMin))
		end
	end
end

function UnEquip(nGeren, nDetail, nType)
	local nStateID = nGeren * 10000 + nDetail * 100
	for i = 1, TITLE_MAX_ATTR_CNT do
		RemoveState(nStateID + i - 1)
	end
	if nGeren == 72 and nType == 2 then--���ƺ�
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
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 20 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 20 �i�m");
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

-- ����
function _23_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_vitality", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: G�n c�t + 5 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_vitality", 3, -1, 1, nStateID);
		Msg2Player("���c hi�u qu�: G�n c�t + 3 �i�m");
	end;
end

function _23_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 5 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 3 �i�m");
	end;
end

function _23_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 5 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 3 �i�m");
	end;
end

function _23_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 5 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 3 �i�m");
	end;
end

function _23_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 5 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 3 �i�m");
	end;
end

function _23_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 5 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 3 �i�m");
	end;
end

function _23_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_strength", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 5 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_strength", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 3 �i�m");
	end;
end

function _23_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 5 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 3 �i�m");
	end;
end

function _23_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 5 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 3 �i�m");
	end;
end

function _23_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 5 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 3 �i�m");
	end;
end

function _23_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_strength", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 5 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_strength", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 3 �i�m");
	end;
end

function _23_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 5 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 3 �i�m");
	end;
end

function _23_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 5 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 3 �i�m");
	end;
end

function _23_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 5 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 3 �i�m");
	end;
end

function _23_15_(nType, nStateID)	--��ʦ
	if nType == 1 then
		CastState("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 3 �i�m");
	end;
end

function _23_16_(nType, nStateID)	--ʥս
	if nType == 1 then
		CastState("state_add_strength", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_strength", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 3 �i�m");
	end;
end

function _23_17_(nType, nStateID)	--���
	if nType == 1 then
		CastState("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 3 �i�m");
	end;
end

function _23_18_(nType, nStateID)	--Ѫ��
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 3 �i�m");
	end;
end

function _23_19_(nType, nStateID)	--����
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 3 �i�m");
	end;
end

function _23_20_(nType, nStateID)	--��Ů
	if nType == 1 then
		CastState("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 3 �i�m");
	end;
end

-- �м�
function _24_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID);
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_15_(nType, nStateID)	--��ʦ
	if nType == 1 then
		CastState("state_add_energy", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_energy", 6, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 6 �i�m");
	end;
end

function _24_16_(nType, nStateID)	--ʥս
	if nType == 1 then
		CastState("state_add_strength", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_strength", 6, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 6 �i�m");
	end;
end

function _24_17_(nType, nStateID)	--���
	if nType == 1 then
		CastState("state_add_observe", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_observe", 6, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 6 �i�m");
	end;
end

function _24_18_(nType, nStateID)	--Ѫ��
	if nType == 1 then
		CastState("state_add_dexterity", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_dexterity", 6, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 6 �i�m");
	end;
end

function _24_19_(nType, nStateID)	--����
	if nType == 1 then
		CastState("state_add_dexterity", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_dexterity", 6, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 6 �i�m");
	end;
end

function _24_20_(nType, nStateID)	--��Ů
	if nType == 1 then
		CastState("state_add_observe", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_observe", 6, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 6 �i�m");
	end;
end

-- �߼�
function _25_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		title_cast_state("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_15_(nType, nStateID)	--��ʦ
	if nType == 1 then
		CastState("state_add_energy", 20, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 20 �i�m");
	elseif nType == 2 then
		CastState("state_add_energy", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 12 �i�m");
	end;
end

function _25_16_(nType, nStateID)	--ʥս
	if nType == 1 then
		CastState("state_add_strength", 20, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 20 �i�m");
	elseif nType == 2 then
		CastState("state_add_strength", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 12 �i�m");
	end;
end

function _25_17_(nType, nStateID)	--���
	if nType == 1 then
		CastState("state_add_observe", 20, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 20 �i�m");
	elseif nType == 2 then
		CastState("state_add_observe", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 12 �i�m");
	end;
end

function _25_18_(nType, nStateID)	--Ѫ��
	if nType == 1 then
		CastState("state_add_dexterity", 20, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 20 �i�m");
	elseif nType == 2 then
		CastState("state_add_dexterity", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 12 �i�m");
	end;
end

function _25_19_(nType, nStateID)	--����
	if nType == 1 then
		CastState("state_add_dexterity", 20, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 20 �i�m");
	elseif nType == 2 then
		CastState("state_add_dexterity", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 12 �i�m");
	end;
end

function _25_20_(nType, nStateID)	--��Ů
	if nType == 1 then
		CastState("state_add_observe", 20, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 20 �i�m");
	elseif nType == 2 then
		CastState("state_add_observe", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 12 �i�m");
	end;
end

-- ���
function _26_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		title_cast_state("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		title_cast_state("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_15_(nType, nStateID)	--��ʦ
	if nType == 1 then
		CastState("state_add_energy", 30, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 30 �i�m");
	elseif nType == 2 then
		CastState("state_add_energy", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 18 �i�m");
	end;
end

function _26_16_(nType, nStateID)	--ʥս
	if nType == 1 then
		CastState("state_add_strength", 30, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 30 �i�m");
	elseif nType == 2 then
		CastState("state_add_strength", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 18 �i�m");
	end;
end

function _26_17_(nType, nStateID)	--���
	if nType == 1 then
		CastState("state_add_observe", 30, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 30 �i�m");
	elseif nType == 2 then
		CastState("state_add_observe", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 18 �i�m");
	end;
end

function _26_18_(nType, nStateID)	--Ѫ��
	if nType == 1 then
		CastState("state_add_dexterity", 30, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 30 �i�m");
	elseif nType == 2 then
		CastState("state_add_dexterity", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 18 �i�m");
	end;
end

function _26_19_(nType, nStateID)	--����
	if nType == 1 then
		CastState("state_add_dexterity", 30, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 30 �i�m");
	elseif nType == 2 then
		CastState("state_add_dexterity", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 18 �i�m");
	end;
end

function _26_20_(nType, nStateID)	--��Ů
	if nType == 1 then
		CastState("state_add_observe", 30, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 30 �i�m");
	elseif nType == 2 then
		CastState("state_add_observe", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 18 �i�m");
	end;
end
--ʦ�ŵ�4�ƺ�
function _27_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		title_cast_state("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		title_cast_state("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_15_(nType, nStateID)	--��ʦ
	if nType == 1 then
		CastState("state_add_energy", 35, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 35 �i�m");
	elseif nType == 2 then
		CastState("state_add_energy", 21, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 21 �i�m");
	end;
end

function _27_16_(nType, nStateID)	--ʥս
	if nType == 1 then
		CastState("state_add_strength", 35, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 35 �i�m");
	elseif nType == 2 then
		CastState("state_add_strength", 21, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 21 �i�m");
	end;
end

function _27_17_(nType, nStateID)	--���
	if nType == 1 then
		CastState("state_add_observe", 35, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 35 �i�m");
	elseif nType == 2 then
		CastState("state_add_observe", 21, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 21 �i�m");
	end;
end

function _27_18_(nType, nStateID)	--Ѫ��
	if nType == 1 then
		CastState("state_add_dexterity", 35, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 35 �i�m");
	elseif nType == 2 then
		CastState("state_add_dexterity", 21, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 21 �i�m");
	end;
end

function _27_19_(nType, nStateID)	--����
	if nType == 1 then
		CastState("state_add_dexterity", 35, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 35 �i�m");
	elseif nType == 2 then
		CastState("state_add_dexterity", 21, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 21 �i�m");
	end;
end

function _27_20_(nType, nStateID)	--��Ů
	if nType == 1 then
		CastState("state_add_observe", 35, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 35 �i�m");
	elseif nType == 2 then
		CastState("state_add_observe", 21, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 21 �i�m");
	end;
end
--ʦ�ŵ�5�ƺ�
function _28_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3% ");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3% ");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3% ");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_07_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_13_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_14_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		title_cast_state("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_15_(nType, nStateID)	--��ʦ
	if nType == 1 then
		CastState("state_add_energy", 40, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 40 �i�m");
	elseif nType == 2 then
		CastState("state_add_energy", 24, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 24 �i�m");
	end;
end

function _28_16_(nType, nStateID)	--ʥս
	if nType == 1 then
		CastState("state_add_strength", 40, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 40 �i�m");
	elseif nType == 2 then
		CastState("state_add_strength", 24, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 24 �i�m");
	end;
end

function _28_17_(nType, nStateID)	--���
	if nType == 1 then
		CastState("state_add_observe", 40, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 40 �i�m");
	elseif nType == 2 then
		CastState("state_add_observe", 24, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 24 �i�m");
	end;
end

function _28_18_(nType, nStateID)	--Ѫ��
	if nType == 1 then
		CastState("state_add_dexterity", 40, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 40 �i�m");
	elseif nType == 2 then
		CastState("state_add_dexterity", 24, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 24 �i�m");
	end;
end

function _28_19_(nType, nStateID)	--����
	if nType == 1 then
		CastState("state_add_dexterity", 40, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 40 �i�m");
	elseif nType == 2 then
		CastState("state_add_dexterity", 24, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 24 �i�m");
	end;
end

function _28_20_(nType, nStateID)	--��Ů
	if nType == 1 then
		CastState("state_add_observe", 40, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 40 �i�m");
	elseif nType == 2 then
		CastState("state_add_observe", 24, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 24 �i�m");
	end;
end

--�η�ʿ��
function _30_01_(nType, nStateID)

end;
--�ξ�����Уξ
function _30_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_life_max_percent_add", 5, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_life_max_percent_add", 5, -1, 1, nStateID)
	end;
end;
--�ξ���ʤ��ͳ
function _30_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_life_max_percent_add", 8, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_life_max_percent_add", 8, -1, 1, nStateID)
	end;
end;
--�ξ��������ȷ�
function _30_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID)
	end;
end;
--������˫�󽫾�
function _30_05_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	end;
end;
--���λ�����Ԫ˧
function _30_06_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_burst_enhance_rate", 25, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_burst_enhance_rate", 25, -1, 1, nStateID)
	end;
end;
--�ɷ�ʿ��
function _30_07_(nType, nStateID)

end;
--�ɾ�����Уξ
function _30_08_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_life_max_percent_add", 5, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_life_max_percent_add", 5, -1, 1, nStateID)
	end;
end;
--�ɾ�������ͳ
function _30_09_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_life_max_percent_add", 8, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_life_max_percent_add", 8, -1, 1, nStateID)
	end;
end;
--�ɾ�ƽ�ϴ��ȷ�
function _30_10_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID)
	end;
end;
--����ͨ��󽫾�
function _30_11_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	end;
end;
--��Ժ����
function _30_12_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_burst_enhance_rate", 25, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_burst_enhance_rate", 25, -1, 1, nStateID)
	end;
end;
--�������󶽻�
function _30_13_(nType, nStateID)
	if nType == 1 then	--�������⹥15%
		title_cast_state("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	elseif nType == 2 then	
		title_cast_state("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	end;
end;
--�������󶽻�
function _30_14_(nType, nStateID)
	if nType == 1 then	--�������⹥15%
		title_cast_state("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		title_cast_state("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	end;
end;
--�������󶽻�
function _30_15_(nType, nStateID)
	if nType == 1 then	--�����˺�100��
		title_cast_state("state_damage_point", 100, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_damage_point", 100, -1, 1, nStateID)
	end;
end;
--�������󶽻�
function _30_16_(nType, nStateID)
	if nType == 1 then	--�����˺�100��
		title_cast_state("state_damage_point", 100, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_damage_point", 100, -1, 1, nStateID)
	end;
end;
--���������
function _30_17_(nType, nStateID)
	if nType == 1 then	--�˺��������25%
		title_cast_state("state_receive_half_damage", 25, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_receive_half_damage", 25, -1, 1, nStateID)
	end;
end;
--���������
function _30_18_(nType, nStateID)
	if nType == 1 then	--�˺��������25%
		title_cast_state("state_receive_half_damage", 25, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_receive_half_damage", 25, -1, 1, nStateID)
	end;
end;
--������������
function _30_19_(nType, nStateID)
	if nType == 1 then	--��������60��
		title_cast_state("state_add_allability", 60, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 60, -1, 1, nStateID)
	end;
end;
--������������
function _30_20_(nType, nStateID)
	if nType == 1 then	--��������60��
		title_cast_state("state_add_allability", 60, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 60, -1, 1, nStateID)
	end;
end;
--������˫�ɽ�
function _30_21_(nType, nStateID)
	if nType == 1 then	--������������10000��
		title_cast_state("state_life_max_point_add", 10000, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_life_max_point_add", 10000, -1, 1, nStateID)
	end;
end;
--������˫�ɽ�
function _30_22_(nType, nStateID)
	if nType == 1 then	--������������10000��
		title_cast_state("state_life_max_point_add", 10000, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_life_max_point_add", 10000, -1, 1, nStateID)
	end;
end;
--����������ʿ
function _30_23_(nType, nStateID)
	if nType == 1 then	--��������40��
		title_cast_state("state_add_allability", 40, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 40, -1, 1, nStateID)
	end;
end;
--����������ʿ
function _30_24_(nType, nStateID)
	if nType == 1 then	--��������40��
		title_cast_state("state_add_allability", 40, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 40, -1, 1, nStateID)
	end;
end;

function _63_01_(nType, nStateID)
    if nType == 1 then	--��������8��
		title_cast_state("state_add_allability", 8, -1, 1, nStateID)
	elseif nType == 2 then
		title_cast_state("state_add_allability", 8, -1, 1, nStateID)
	end;
end

function _64_01_(type, stateID)
	if 1 == type then
		title_cast_state("state_add_energy", 20, -1, 1, stateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 20 �i�m");
	end
end

function _64_02_(type, stateID)
	if 1 == type then
		title_cast_state("state_add_strength", 20, -1, 1, stateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 20 �i�m");	
	end
end

--function _64_03_(type, stateID)
--	if 1 == type then
--		title_cast_state("state_add_dexterity", 20, -1, 1, stateID)
--		Msg2Player("���Ч����������20��");
--	end
--end
--
--function _64_04_(type, stateID)
--	if 1 == type then
--		title_cast_state("state_add_vitality", 20, -1, 1, stateID)
--		Msg2Player("���Ч������������20��");
--	end
--end
--
--function _64_05_(type, stateID)
--	if 1 == type then
--		title_cast_state("state_add_observe", 20, -1, 1, stateID)
--		Msg2Player("���Ч������������20��");
--	end
--end

function PT_AddAllWhenEquip(type, stateID, number1, number2)
	if 1 == type then
		title_cast_state("state_burst_enhance_rate", number1, -1, 1, stateID+1);
		title_cast_state("state_add_allability", number2, -1, 1, stateID+2);
		--Msg2Player(format("%s%d%%%s%d%s","���Ч����ʩչ�ٶ����", number1, ",ȫ��������", number2, "��"));
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
--		Msg2Player("���Ч��������ֵ�½�15%");		
--	end
--end
--
--function _65_20_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_neili_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("���Ч��������ֵ�½�15%");		
--	end
--end
--
--function _65_21_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_life_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("���Ч��������ֵ�½�15%");		
--	end
--end
--
--function _65_22_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_life_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("���Ч��������ֵ�½�15%");		
--	end
--end
--
--function _65_23_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_neili_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("���Ч��������ֵ�½�15%");		
--	end
--end
--
--function _65_24_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_neili_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("���Ч��������ֵ�½�15%");		
--	end
--end
--
--function _65_25_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_slow", 10, -1, 1, stateID);
--		Msg2Player("���Ч�����ƶ��ٶ��½�10%");		
--	end
--end
--
--function _65_26_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_add_allability", 8, -1, 1, stateID);
--		Msg2Player("���Ч����ȫ��������8��");
--	end
--end
--
--function _65_27_(type, stateID)
--	if 2 == type then
--		title_cast_state("state_add_allability", 8, -1, 1, stateID);
--		Msg2Player("���Ч����ȫ��������8��");
--	end
--end

--------------------------------------------------------------------------------------
-- ����ս�ƺ�

function CityWarEquip(nGeren, nDetail, nType)
	local nStateID = nGeren * 10000 + nDetail * 100
	local szfunc = format("_%.2d_%.2d_(%d, %d)", nGeren, nDetail, nType, nStateID)
	dostring(szfunc)
	if nType == 1 then
		local nYear, nMonth, nDay, nHour, nMin, nSec = AddTitleTime(nGeren, nDetail, 0)
		if nYear ~= 1970 then
			Msg2Player("X�ng hi�u c�a b�n h�t h�n v�o " .. format("ng�y %d/%d/%d l�c %d:%d", nDay, nMonth, nYear, nHour, nMin))
		end
	end
end

function CityWarUnEquip(nGeren, nDetail, nType)
	SetCityWarDutyFlag(0, 0)
	VerifyEquip()
	UnEquip(nGeren, nDetail, nType);
end

function _51_01_(nType, nStateID)		-- �ɶ�����
	SetCityWarDutyFlag(300, 0)
	title_cast_state("state_life_max_percent_add", 25, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 25, -1, 1, nStateID + 1);
end

function _51_02_(nType, nStateID)		-- �ɶ�����
	SetCityWarDutyFlag(300, 0)
	title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 15, -1, 1, nStateID + 1);
end

function _51_03_(nType, nStateID)		-- �ɶ���ʦ
	SetCityWarDutyFlag(300, 1)
	title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 15, -1, 1, nStateID + 1);
end

function _51_04_(nType, nStateID)		-- �ɶ�����
	if nType == 1 then
		SetCityWarDutyFlag(300, 2)
	elseif nType == 2 then
		SetCityWarDutyFlag(0, 0)
	end
	title_cast_state("state_life_max_percent_add", 10, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 10, -1, 1, nStateID + 1);
end

function _51_05_(nType, nStateID)		-- Ȫ�ݳ���
	SetCityWarDutyFlag(100, 0)
	title_cast_state("state_life_max_percent_add", 25, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 25, -1, 1, nStateID + 1);
end

function _51_06_(nType, nStateID)		-- Ȫ�ݿ���
	SetCityWarDutyFlag(100, 0)
	title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 15, -1, 1, nStateID + 1);
end

function _51_07_(nType, nStateID)		-- Ȫ�ݾ�ʦ
	SetCityWarDutyFlag(100, 1)
	title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 15, -1, 1, nStateID + 1);
end

function _51_08_(nType, nStateID)		-- Ȫ������
	if nType == 1 then
		SetCityWarDutyFlag(100, 2)
	elseif nType == 2 then
		SetCityWarDutyFlag(0, 0)
	end
	title_cast_state("state_life_max_percent_add", 10, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 10, -1, 1, nStateID + 1);
end

function _51_09_(nType, nStateID)		-- ��������
	SetCityWarDutyFlag(350, 0)
	title_cast_state("state_life_max_percent_add", 25, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 25, -1, 1, nStateID + 1);
end

function _51_10_(nType, nStateID)		-- ��������
	SetCityWarDutyFlag(350, 0)
	title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 15, -1, 1, nStateID + 1);
end

function _51_11_(nType, nStateID)		-- ������ʦ
	SetCityWarDutyFlag(350, 1)
	title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 15, -1, 1, nStateID + 1);
end

function _51_12_(nType, nStateID)		-- ��������
	if nType == 1 then
		SetCityWarDutyFlag(350, 2)
	elseif nType == 2 then
		SetCityWarDutyFlag(0, 0)
	end
	title_cast_state("state_life_max_percent_add", 10, -1, 1, nStateID);
	title_cast_state("state_neili_max_percent_add", 10, -1, 1, nStateID + 1);
end

--�����ؿ��ƺ�
--�ݺ����ģ�������Ԫ���õĳƺţ�
function _60_08_(nType, nStateID)
	if nType == 1 then	--����������5%
		title_cast_state("state_inc_exp_gain", 5, -1, 1, nStateID)
	elseif nType == 2 then  --����������5%
		title_cast_state("state_inc_exp_gain", 0, -1, 1, nStateID)
	end;
end;

-- ����ս�ƺŽ���

--==========�ж�ս���ƺŵ�============================================================
tTitleTab =
{
--�ƺ����ƣ���Ӧ�ƺű��ڵĴ��࣬���࣬�������
	{"T�ng_V� D�ng Hi�u �y",	30, 2, 2},
	{"Li�u_Ki�u D�ng �� �y",	30, 8,-2},
	{"T�ng_Th��ng Th�ng �� th�ng",	30, 3, 3},
	{"Li�u_Tuy�t tr�n �� th�ng",	30, 9,-3},
	{"T�ng_��nh B�c ��i Ti�n phong",	30, 4, 4},
	{"Li�u_B�nh Nam ��i Ti�n phong",	30,10,-4},	
	{"T�ng_V� Song ��i t��ng qu�n",	30, 5, 5},	
	{"Li�u_Th�ng Thi�n ��i t��ng qu�n",	30,11,-5},	
	{"T�ng_H� Qu�c ��i nguy�n so�i",	30, 6, 6},	
	{"Nam Vi�n ��i V��ng",		30,12,-6},	
} 

tNewTitleTab =
{
--�ƺ����ƣ���Ӧ�ƺű��ڵĴ��࣬���࣬����������Ƿ�֧������Ԫ˧����
	{"T�ng -Ph� Tr�n ��c h�",	30,	13,		300000,		1}, 
	{"Li�u-Ph� Tr�n ��c h� ",	30,	14,		-300000,	1},
	{"T�ng -Ph� Tr�n ��c h�",	30,	15,		300000,		1}, 
	{"Li�u-Ph� Tr�n ��c h� ",	30,	16,		-300000,	1},
	{"T�ng-Tr�n Qu�n H� k�",	30,	17,		450000,		0}, 
	{"Li�u-Tr�n Qu�n H� k�",	30,	18,		-450000,	0},	
	{"T�ng -Thi�t C� Long V�",	30,	19,		400000,		0}, 
	{"Li�u- Thi�t C� Long V�",	30,	20,		-400000,	0},
	{"T�ng- V� Song Phi T��ng",	30,	21,		500000,		0}, 
	{"Li�u-V� Song Phi T��ng",	30,	22,		-500000,	0},
	{"T�ng- Ng� ��ch M�nh S�",	30,	23,		250000,		1}, 
	{"Li�u- Ng� ��ch M�nh S�",	30,	24,		-250000,	1},
}
--��鵱ǰ�ǲ���ս���ƺŲ��ҷ��϶�����ƺŵ��ʸ�
function check_battle_rank(nGeren, nDetail)
	local nTitleIdx = 0;
	for i,v in tTitleTab do
		if tTitleTab[i][2] == nGeren and tTitleTab[i][3] == nDetail then
			nTitleIdx = i;
		end;
	end;
	if nTitleIdx == 0 then	--����ս���ƺ�
		return 1;
	end;
	local nCurRank = GetTask(704);
	local nNeedRank = tTitleTab[nTitleIdx][4];	
	if nCurRank > 0 then
		if nNeedRank < 0 then
			Msg2Player("B�n hi�n thu�c phe T�ng, kh�ng th� d�ng danh hi�u c�a phe Li�u");
			return 0
		end
	elseif nCurRank < 0 then
		if nNeedRank > 0 then
			Msg2Player("B�n hi�n thu�c phe Li�u kh�ng th� d�ng danh hi�u c�a phe T�ng");
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
		Msg2Player("Qu�n h�m c�a b�n qu� th�p kh�ng th� s� d�ng danh hi�u n�y.")
		return 0
	end
	return 1
end;
--�ڶ���ս���ƺż��
function check_new_battle_rank(nGeren, nDetail)
	local tCampNameZ =					--��Ӫ���֣����ģ�����ʾ�Ի���ʱ���õ�
	{
		[0] = "",
		[1] = "T�ng",
		[2] = "Li�u",
	}
	local nTitleIdx = 0;
	for i,v in tNewTitleTab do
		if tNewTitleTab[i][2] == nGeren and tNewTitleTab[i][3] == nDetail then
			nTitleIdx = i;
		end;
	end;
	if nTitleIdx == 0 then	--����ս���ƺ�
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
		bEverMarshal = 1;	--������Ԫ˧
	end;
	if nCurCamp == 1 then	--��ǰΪ�η�
		if nNeedEverRank == 1 then
			if (bEverMarshal == 0 and nCurJunGong < nNeedJunGong) or nCurCamp ~= nTitleCamp then
				Msg2Player("B�n ph�i ��t ���c "..tCampNameZ[nTitleCamp].."Ph��ng "..abs(nNeedJunGong).." chi�n c�ng ho�c c� "..tCampNameZ[nTitleCamp].." Qu�n h�m Ph��ng V�nh c�u Nguy�n So�i m�i c� th� s� d�ng x�ng hi�u n�y");				
				return 0;
			end;
		else
			if nCurJunGong < nNeedJunGong or nCurCamp ~= nTitleCamp then
				Msg2Player("B�n ph�i ��t ���c "..tCampNameZ[nTitleCamp].."Ph��ng "..abs(nNeedJunGong).." Qu�n c�ng m�i ���c s� d�ng x�ng hi�u n�y");				
				return 0;
			end;
		end;
	else
		if nNeedEverRank == 1 then
			if (bEverMarshal == 0 and nCurJunGong > nNeedJunGong) or nCurCamp ~= nTitleCamp then
				Msg2Player("B�n ph�i ��t ���c "..tCampNameZ[nTitleCamp].."Ph��ng "..abs(nNeedJunGong).." chi�n c�ng ho�c c� "..tCampNameZ[nTitleCamp].." Qu�n h�m Ph��ng V�nh c�u Nguy�n So�i m�i c� th� s� d�ng x�ng hi�u n�y");				
				return 0;
			end;
		else
			if nCurJunGong > nNeedJunGong or nCurCamp ~= nTitleCamp then
				Msg2Player("B�n ph�i ��t ���c "..tCampNameZ[nTitleCamp].."Ph��ng "..abs(nNeedJunGong).." Qu�n c�ng m�i ���c s� d�ng x�ng hi�u n�y");				
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

--�ٻ�����һ ���ֳƺ�
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

--��ʮ����ƺ�
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

--����ת��ƺ�����
function _61_05_(nType, nStateID)
--	print(nType, nStateID)
--	print(GetPlayerRebornParam(1))
	if nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID);
		title_cast_state("state_medicine_time_increase", 10, -1, 1, nStateID + 1);
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 2);
	end
end

--����ת��2�ƺ�����
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
    [2] = {"state_add_strength", "S�c m�nh",}, --�����׼�
    [3] = {"state_add_energy", "N�i c�ng ",}, --��������
    [4] = {"state_add_energy", "N�i c�ng ",}, --��������
    [6] = {"state_add_dexterity", "Th�n ph�p",}, --����
    [8] = {"state_add_energy", "N�i c�ng ",}, --���ҷ��
    [9] = {"state_add_dexterity", "Th�n ph�p",}, --�����׼�
    [11] = {"state_add_strength", "S�c m�nh",}, --ؤ�ﾻ��
    [12] = {"state_add_dexterity", "Th�n ph�p",}, --ؤ������
    [14] = {"state_add_energy", "N�i c�ng ",}, --�䵱����
    [15] = {"state_add_observe", "Linh ho�t",}, --�䵱�׼�
    [17] = {"state_add_strength", "S�c m�nh",}, --����ǹ��
    [18] = {"state_add_dexterity", "Th�n ph�p",}, --���Ź���
    [20] = {"state_add_dexterity", "Th�n ph�p",}, --�嶾а��
    [21] = {"state_add_observe", "Linh ho�t",}, --�嶾��ʦ
    [23] = {"state_add_energy", "N�i c�ng ",}, --����
	[25] = {"state_add_strength", "S�c m�nh",}, --����ʥս
	[26] = {"state_add_strength", "S�c m�nh",}, --�������
	[27] = {"state_add_energy", "N�i c�ng ",}, --����Ѫ��
    [29] = {"state_add_strength", "S�c m�nh",}, --��������
	[30] = {"state_add_observe", "Linh ho�t",}, --������Ů
	[31] = {"state_add_strength", "S�c m�nh",}, --��������
	[32] = {"state_add_strength", "S�c m�nh",}, --���ؽ���
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


--������ƺ�
function _67_14_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���2�㣬ȫ�������п���2�㡣
		title_cast_state("state_element_all_attack_point_add", 2, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 2, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 2, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 2, -1, 1, nStateID+2)
	end;
end

function _67_15_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���4�㣬ȫ�������п���4�㡣
		title_cast_state("state_element_all_attack_point_add", 4, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 4, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 4, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 4, -1, 1, nStateID+2)
	end;
end

function _67_16_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���6�㣬ȫ�������п���6�㡣
		title_cast_state("state_element_all_attack_point_add", 6, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 6, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 6, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 6, -1, 1, nStateID+2)
	end;
end

function _67_17_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���8�㣬ȫ�������п���8�㡣
		title_cast_state("state_element_all_attack_point_add", 8, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 8, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 8, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 8, -1, 1, nStateID+2)
	end;
end

function _67_18_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���10�㣬ȫ�������п���10�㡣
		title_cast_state("state_element_all_attack_point_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 10, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 10, -1, 1, nStateID+2)
	end;
end

function _67_19_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���12�㣬ȫ�������п���12�㡣
		title_cast_state("state_element_all_attack_point_add", 12, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 12, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 12, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 12, -1, 1, nStateID+2)
	end;
end

function _67_20_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���14�㣬ȫ�������п���14�㡣
		title_cast_state("state_element_all_attack_point_add", 14, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 14, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 14, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 14, -1, 1, nStateID+2)
	end;
end

function _67_21_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���16�㣬ȫ�������п���16�㡣
		title_cast_state("state_element_all_attack_point_add", 16, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 16, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 16, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 16, -1, 1, nStateID+2)
	end;
end

function _67_22_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���18�㣬ȫ�������п���18�㡣
		title_cast_state("state_element_all_attack_point_add", 18, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 18, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 18, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 18, -1, 1, nStateID+2)
	end;
end

function _67_23_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���20�㣬ȫ�������п���20�㡣
		title_cast_state("state_element_all_attack_point_add", 20, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 20, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 20, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 20, -1, 1, nStateID+2)
	end;
end


--������ƺ�
function _67_24_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���4�㣬ȫ�������п���4�㡣
		title_cast_state("state_element_all_attack_point_add", 4, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 4, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 4, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 4, -1, 1, nStateID+2)
	end;
end

function _67_25_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���6�㣬ȫ�������п���6�㡣
		title_cast_state("state_element_all_attack_point_add", 6, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 6, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 6, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 6, -1, 1, nStateID+2)
	end;
end

function _67_26_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���8�㣬ȫ�������п���8�㡣
		title_cast_state("state_element_all_attack_point_add", 8, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 8, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 8, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 8, -1, 1, nStateID+2)
	end;
end

function _67_27_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���10�㣬ȫ�������п���10�㡣
		title_cast_state("state_element_all_attack_point_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 10, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 10, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 10, -1, 1, nStateID+2)
	end;
end

function _67_28_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���12�㣬ȫ�������п���12�㡣
		title_cast_state("state_element_all_attack_point_add", 12, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 12, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 12, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 12, -1, 1, nStateID+2)
	end;
end

function _67_29_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���14�㣬ȫ�������п���14�㡣
		title_cast_state("state_element_all_attack_point_add", 14, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 14, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 14, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 14, -1, 1, nStateID+2)
	end;
end

function _67_30_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���16�㣬ȫ�������п���16�㡣
		title_cast_state("state_element_all_attack_point_add", 16, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 16, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 16, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 16, -1, 1, nStateID+2)
	end;
end

function _67_31_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���18�㣬ȫ�������п���18�㡣
		title_cast_state("state_element_all_attack_point_add", 18, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 18, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 18, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 18, -1, 1, nStateID+2)
	end;
end

function _67_32_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���20�㣬ȫ�������п���20�㡣
		title_cast_state("state_element_all_attack_point_add", 20, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 20, -1, 1, nStateID+2)
	elseif nType == 2 then
		title_cast_state("state_element_all_attack_point_add", 20, -1, 1, nStateID+1)
		title_cast_state("state_element_all_defend_point_add", 20, -1, 1, nStateID+2)
	end;
end

function _67_33_(nType, nStateID)
    if nType == 1 then	--���ȫ�������й���22�㣬ȫ�������п���22�㡣
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

t_tong_title_cfg = {--���ƺ�������ֵ
    {"K�t ngh�a", 20, 10000, 10, 10 },
    {"Hu� Th�", 30, 12000, 12, 15 },
    {"Kim Lan", 40, 14000, 14, 20 },
    {"T� T�m", 50, 16000, 16, 25 },
    {"��ng h��ng", 80, 18000, 20, 40 },
    {"Ph� H�a", 90, 20000, 25, 50 },
    {"Qu�n H�ng", 120, 25000, 30, 60 },
    {"H�p m�u", 150, 30000, 35, 70 },
    {"Ch� Kh�", 200, 35000, 40, 80 },
    {"��ng C�u", 300, 40000, 50, 100 },
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

function _74_01_(nType, nStateID)	--����
	if 1 == nType or 2 == nType then
		title_cast_state("state_destiny_armor_point_add", 50, -1, 1, nStateID)
		title_cast_state("state_interrupt_rate_dec", 10, -1, 1, nStateID+1)		
	end
end

function _74_02_(nType, nStateID)	--���
	if 1 == nType or 2 == nType then
		title_cast_state("state_max_damage", 100, -1, 1, nStateID)
		title_cast_state("state_critical_point_increase", 10, -1, 1, nStateID+1)		
	end
end

function _74_03_(nType, nStateID)	--����
	if 1 == nType or 2 == nType then
		title_cast_state("state_destiny_attack_point_add", 50, -1, 1, nStateID)
		title_cast_state("state_critical_damage_increase", 50, -1, 1, nStateID+1)		
	end
end

function _75_01_(nType, nStateID)	--��Ȩ
	if 1 == nType or 2 == nType then
		title_cast_state("state_element_all_attack_point_add", 10, -1, 1, nStateID)
		title_cast_state("state_p_attack_percent_add", 30, -1, 1, nStateID+1)		
		title_cast_state("state_m_attack_percent_add", 30, -1, 1, nStateID+2)
	end
end

function _75_02_(nType, nStateID)	--���
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
	--���ȫ�������п���20�㣬�޾�20�㡣
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
		Msg2Player("Th��ng danh ph�n ��i Hi�p: T�ng t�c �� thi tri�n t�ng 8%, kh�ng t�t c� t�ng 15 �i�m, sinh l�c t�i �a t�ng 2000 �i�m.")
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
		title_cast_state("state_p_attack_percent_add", 15, -1, 1, nStateID+1)-- t�ng 15% cong kich
		title_cast_state("state_m_attack_percent_add", 15, -1, 1, nStateID+2) -- t�ng 15% cong kich
		title_cast_state("state_life_max_point_add", 20000, -1, 1, nStateID+3) -- tang 20k HP
		title_cast_state("state_burst_enhance_rate", 15, -1, 1, nStateID+4) -- t�c do xu�t chieu
		title_cast_state("state_receive_half_damage", 10, -1, 1, nStateID+5)--- gi�m th th��ng
		--title_cast_state("state_burst_enhance_rate", 50, -1, 1, nStateID);
		--title_cast_state("state_add_allability", 50, -1, 1, nStateID+6);
	end
end

function _200_02_(nType, nStateID)
	if 1 == nType or 2 == nType then
		title_cast_state("state_destiny_armor_point_add", 100, -1, 1, nStateID) --- V� c� 100
		title_cast_state("state_destiny_attack_point_add", 50, -1, 1, nStateID+1) ---  Ph Dich 50
		title_cast_state("state_element_all_attack_point_add", 15, -1, 1, nStateID+2) --- Cong Kich ngu hanh 15
		title_cast_state("state_element_all_defend_point_add", 20, -1, 1, nStateID+3) -- Kh�ng ng� H�nh 20
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
	title_cast_state("state_p_attack_percent_add", 5, -1, 1, nStateID+3)-- t�ng 5% cong kich
	title_cast_state("state_m_attack_percent_add", 5, -1, 1, nStateID+4) -- t�ng 5% cong kich
	end
end
