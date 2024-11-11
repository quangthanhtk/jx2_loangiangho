--�����Ծ����
Import("\\script\\missions\\yp\\ywz\\define.lua")

function OnUse(nItem)
	if not YWZ_SYSTEM_SWITCH then
		Talk(1,"","V�t ph�m �� qu� h�n s� d�ng");
		return 0;
	end
    Say(format("��ng � m� %s kh�ng?", GetItemName(nItem)), 3, format("M� mi�n ph�/#open_ywhy_free(%d)", nItem), format("Thi�n Ki�u L�nh �� m�/#open_ywhy_ib(%d)", nItem), "T�i h� ch� xem qua th�i/nothing");
end

function open_ywhy_free(nItem)
    if CustomAwardCheckCondition("SLYWZ_YWHYBX_FREE") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	CustomAwardGiveGroup("SLYWZ_YWHYBX_FREE", 0);
	AddRuntimeStat(36, 9, 0, 1);
end

function open_ywhy_ib(nItem)
  if GetItemCount(2, 97, 236) < 1 then
      Talk(1, "", format("Trong h�nh trang %s s� l��ng kh�ng �� %d", "Thi�n Ki�u L�nh", 1));
      return 0;
  end
  if CustomAwardCheckCondition("SLYWZ_YWHYBX_IB") ~= 1 then
		return 0;
	end
  if DelItem(2, 97, 236, 1) ~= 1 then
      return 0;
  end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	FireEvent("event_ib_cost", 2, 97, 236, 1);
	CustomAwardGiveGroup("SLYWZ_YWHYBX_IB", 0);
	AddRuntimeStat(36, 10, 0, 1);
end
