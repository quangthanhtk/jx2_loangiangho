-- �����ּ�
-- Ba & Bia
-- 2,114,120; 2,114,121
Import("\\settings\\static_script\\lib\\item_define.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\book_appendix\\head.lua")

function OnUse(nItemIdx)
	local bookIdx = GetPlayerEquipIndex(itempart_book);
	if bookIdx == 0 then
		Talk(1, "", "H�y trang b� b� k�p tr��c")
		return
	end

	if nil == GetSubData(1, nItemIdx, enumCCDT_Item_Book_Appendix, -1) then
		Ba(nItemIdx, bookIdx, exchange); -- Ba
	else
		Bia(bookIdx, nItemIdx); -- Bia
	end
end

function Ba(toItem, fromItem, bSure)
	local g,d,p = GetItemInfoByIndex(fromItem);
	local exchange = g_tItemExchange[PackItemId(g,d,p)];
	if not exchange then
		return Talk(1, "", "B� k�p b�n �ang trang b� kh�ng th� ti�n h�nh thao t�c!");
	end
	if IsBookLocked() == 1 then
		return Talk(1, "", "B� k�p b�n �ang trang b� kh�ng th� ti�n h�nh thao t�c!");
	end
	if IsReading() == 1 then
		return Talk(1, "", "D��i tr�ng th�i tu luy�n s�ch kh�ng th� ti�n h�nh thao t�c!");
	end
	if GetSubData(1, toItem, enumCCDT_Item_Book_Appendix, -1) then
		return Talk(1, "", format("[%s] �� c� thu�c t�nh, kh�ng th� ti�n h�nh thao t�c", GetItemName(toItem)));
	end
	if GetSubData(1, fromItem, enumCCDT_Item_Book_Appendix, -1) == nil then
		return Talk(1, "", format("[%s] kh�ng c� thu�c t�nh, kh�ng th� ti�n h�nh thao t�c", GetItemName(fromItem)));
	end
	if not bSure then
		local tSel = {
			format("��ng �/#Ba(%d, %d, 1)", toItem, fromItem),
			"H�y b�/nothing",
		}
		Say("Ch�n V� Th� K�: Quy�t ��nh vi�t l�i n�i dung c�a Ch�n V� M�t T�ch hi�n �ang trang b� kh�ng? Sau khi ch�p h�nh s� ti�u hao 1 Ch�n V� Th� K�, ��ng th�i t�t c� n�i dung Ch�n V� B�o �i�n c�a b� k�p �ang trang b� c�ng s� bi�n m�t.", 
			getn(tSel), tSel);
		return
	end
	if DelItemByIndex(toItem, 1) ~= 1 then return end
	local ret, newItem = gf_AddItemEx2(exchange[2][2],exchange[2][1]);
	if ret ~= 1 then
		return Talk(1, "", "[Ch�n V� Th� K�] L�i ch�a x�c ��nh! H�y li�n h� b� ph�n ch�m s�c kh�ch h�ng!");
	end
	WriteLog(format("[BookApp] [Ba] [Acc=%s, Role=%s] [Item=%s] [AttrLv=%s]", 
		GetAccount(), GetName(),GetItemName(fromItem), GetSubDataLog(1, fromItem, enumCCDT_Item_Book_Appendix, -1)))
	CloneSubData(1, fromItem, 1, newItem, enumCCDT_Item_Book_Appendix, -1);
	while (1 == DelSubData(1, fromItem, enumCCDT_Item_Book_Appendix, -1)) do end
	AddSubData(1, fromItem, enumCCDT_Item_Book_Appendix, g_Route2AppID[GetPlayerRoute()]);
	SyncItem2Client(fromItem);
	SyncItem2Client(newItem);
	--AddStatValue("bookapp_ba", 1);
end

function Bia(toItem, fromItem, bSure)
	if GetEquipLevel(toItem) < 99 then
		return Talk(1, "", "B� k�p b�n �ang trang b� ch�a tu luy�n ��n ��y c�p, kh�ng th� th�ng c�p!");
	end
	local g,d,p = GetItemInfoByIndex(toItem);
	local exchange = g_tItemExchange[PackItemId(g,d,p)];
	if not exchange then
		return Talk(1, "", "B� k�p b�n �ang trang b� kh�ng th� ti�n h�nh thao t�c!");
	end
	local g,d,p = GetItemInfoByIndex(fromItem);
	if exchange[2][2][3] ~= p then
		return Talk(1, "", "L�u ph�i kh�ng ph� h�p, kh�ng th� ti�n h�nh thao t�c!");
	end
	if GetSubData(1, fromItem, enumCCDT_Item_Book_Appendix, -1) == nil then
		return Talk(1, "", format("[%s] kh�ng c� thu�c t�nh, kh�ng th� ti�n h�nh thao t�c", GetItemName(fromItem)));
	end
	if GetSubData(1, toItem, enumCCDT_Item_Book_Appendix, -1) == nil then
		return Talk(1, "", format("[%s] ch�a th�ng hoa, kh�ng th� ti�n h�nh thao t�c", GetItemName(toItem)));
	end
	if not bSure then
		local tSel = {
			format("��ng �/#Bia(%d, %d, 1)", toItem, fromItem),
			"H�y b�/nothing",
		}
		Say("Quy�t ��nh �em n�i dung �ang ghi ch�p vi�t l�n tr�n b� k�p �ang trang b� kh�ng? Sau khi ch�p h�nh th� v�t ph�m n�y s� bi�n m�t, ��ng th�i ch�p �� l�n t�t c� n�i dung tr�n b� k�p hi�n �ang trang b�.", 
			getn(tSel), tSel);
		return
	end
	WriteLog(format("[BookApp] [Ba] [Acc=%s, Role=%s] [fromItem=%s] [AttrLv=%s]", 
		GetAccount(), GetName(),GetItemName(fromItem), GetSubDataLog(1, fromItem, enumCCDT_Item_Book_Appendix, -1)))
	WriteLog(format("[BookApp] [Ba] [Acc=%s, Role=%s] [toItem=%s] [AttrLv=%s]", 
		GetAccount(), GetName(),GetItemName(toItem), GetSubDataLog(1, toItem, enumCCDT_Item_Book_Appendix, -1)))
	while (1 == DelSubData(1, toItem, enumCCDT_Item_Book_Appendix, -1)) do end
	CloneSubData(1, fromItem, 1, toItem, enumCCDT_Item_Book_Appendix, -1);
	while (1 == DelSubData(1, fromItem, enumCCDT_Item_Book_Appendix, -1)) do end
	SyncItem2Client(toItem);
	if 1 ~= DelItemByIndex(fromItem, 1) then
		WriteLog(format("[BookApp] [Del Fail] [Acc=%s, Role=%s] [from=%s, to=%s]", 
			GetAccount(), GetName(), GetItemName(fromItem), GetItemName(toItem)));
		return
	end
	AddStatValue("bookapp_bia", 1);
end
