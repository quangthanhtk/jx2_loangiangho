-- ��ͨȯ 2,114,118
-- �����ؼ�
Import("\\settings\\static_script\\lib\\item_define.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\book_appendix\\head.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")

function OnUse(nItemIdx)
	onUse(nItemIdx);
end

function onUse(nItemIdx, bSure)
	local bookIdx = GetPlayerEquipIndex(itempart_book);
	if bookIdx == 0 then
		Talk(1, "", "H�y trang b� b� k�p tr��c")
		return
	end
	if IsReading() == 1 then
		return Talk(1, "", "D��i tr�ng th�i tu luy�n s�ch kh�ng th� ti�n h�nh thao t�c!");
	end
	local g,d,p = GetItemInfoByIndex(bookIdx);
	local exchange = g_tItemExchange[PackItemId(g,d,p)];
	if not exchange then
		return Talk(1, "", "B� k�p b�n �ang trang b� kh�ng th� th�ng c�p!");
	end
	if GetEquipLevel(bookIdx) < 99 then
		return Talk(1, "", "B� k�p b�n �ang trang b� ch�a tu luy�n ��n ��y c�p, kh�ng th� th�ng c�p!");
	end
	--print(GetSubData(1, bookIdx, enumCCDT_Item_Book_Appendix, -1))
	if GetSubData(1, bookIdx, enumCCDT_Item_Book_Appendix, -1) then
		return Talk(1, "", format("[%s] m� b�n trang b� �� th�ng hoa, kh�ng th� ti�n h�nh thao t�c", GetItemName(bookIdx)));
	end
	if not bSure then
		local tSel = {
			format("��ng �/#onUse(%d, 1)", nItemIdx),
			"H�y b�/nothing",
		}
		Say("Qu�n Th�ng Quy�n: Quy�t ��nh th�ng hoa ch�n quy�n hi�n �ang trang b�? Sau khi ch�p h�nh s� ti�u hao 1 Qu�n Th�ng Quy�n.", 
			getn(tSel), tSel);
		return
	end
	
	if DelItemByIndex(nItemIdx, 1) ~= 1 then return end

	local bRet = AddSubData(1, bookIdx, enumCCDT_Item_Book_Appendix, g_Route2AppID[GetPlayerRoute()]);
	SyncItem2Client(bookIdx);
	if bRet >= 0 then
		Talk(1,"","Th�ng hoa b� k�p th�nh c�ng")
		AddRuntimeStat(39, 5, 0, 1)
	else
		AddItem(2,114,118,1)
		Talk(1,"","Th�ng hoa b� k�p th�t b�i")
	end
	--Observer:onEvent(OE_BOOKAPP_UPGRADE, {book=bookIdx});
	--print("AddSubData result ", bRet, bookIdx, enumCCDT_Item_Book_Appendix, g_Route2AppID[GetPlayerRoute()])
	WriteLog(format("[BookApp] [ShenHua] [Acc=%s, Role=%s] [Book=%s]", GetAccount(), GetName(), GetItemName(bookIdx)));
	--AddStatValue("bookapp_upgrade", 1);
end
