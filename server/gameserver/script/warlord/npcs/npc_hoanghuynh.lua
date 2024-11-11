----------------------------------------------------------------------------------------------------
--- Author: Thanh
--- Modified: 2022-09-01
--- Description: Npc Top Chu Tu��c
----------------------------------------------------------------------------------------------------
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\newserver\\topbanghoi.lua");
Include("\\script\\vng\\newserver\\hoatdong.lua");
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\functions\\function_top_award.lua");

strNpcName = "<color=green>Ho�ng Huynh: <color> "
szLogTitle = "Top SAT HO"
szStartDate = "08-04-2024"
szEndDate = "08-05-2024"
szServerName = "S�t H�"
TOP_STOP_HDL = 20240508
function main()
    local nDate = tonumber(date("%Y%m%d"))

    local tSay = {}
    --tinsert(tSay,"Bang h�i danh gi�")
    tinsert(tSay, format("%s/#_w_top_OpenMenu()", "Nh�n t��ng Top"));
    tinsert(tSay, format("%s/#_w_top_Menu_Top_succes()", "Danh s�ch �� trao gi�i"));
    --tinsert(tSay,"Xem t�nh h�nh nh�n th��ng top h� ph�i/get_top_faction_info")
    --	tinsert(tSay,"Xem t�nh h�nh nh�n th��ng top 3 chi�n tr��ng/get_top_nation_info")
    --	tinsert(tSay,"Xem t�nh h�nh ��ng k� nh�n th��ng m�t t�ch/get_top100_award_info")
    --	tinsert(tSay,"Ph�t th��ng bang h�i/PhatThuongBangHoi")
    tinsert(tSay,"Ta bi�t r�i/dlgover")

    if nDate <= TOP_STOP_HDL then
        local strSay = strNpcName.."Ho�t ��ng <color=yellow>Top C�ng Tr�ng M�y Ch� M�i<color> di�n ra t� ng�y<color=red> "..szStartDate.." ��n 24:00 "..szEndDate.."<color>. Trong th�i gian n�y, qu� ��ng ��o c� th� ��n g�p ta �� nh�n c�c ph�n th��ng h�p d�n. Th�ng tin chi ti�t ho�t ��ng ��ng ��o c� th� xem t�i trang ch�."
        Say(strSay,getn(tSay),tSay)
    end
end
