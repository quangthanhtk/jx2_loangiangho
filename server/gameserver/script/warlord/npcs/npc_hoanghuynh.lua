----------------------------------------------------------------------------------------------------
--- Author: Thanh
--- Modified: 2022-09-01
--- Description: Npc Top Chu Tu­íc
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

strNpcName = "<color=green>Hoµng Huynh: <color> "
szLogTitle = "Top SAT HO"
szStartDate = "08-04-2024"
szEndDate = "08-05-2024"
szServerName = "S¸t Hæ"
TOP_STOP_HDL = 20240508
function main()
    local nDate = tonumber(date("%Y%m%d"))

    local tSay = {}
    --tinsert(tSay,"Bang héi danh gi¸")
    tinsert(tSay, format("%s/#_w_top_OpenMenu()", "NhËn t­ëng Top"));
    tinsert(tSay, format("%s/#_w_top_Menu_Top_succes()", "Danh s¸ch ®· trao gi¶i"));
    --tinsert(tSay,"Xem t×nh h×nh nhËn th­ëng top hÖ ph¸i/get_top_faction_info")
    --	tinsert(tSay,"Xem t×nh h×nh nhËn th­ëng top 3 chiÕn tr­êng/get_top_nation_info")
    --	tinsert(tSay,"Xem t×nh h×nh ®¨ng ký nhËn th­ëng mËt tÞch/get_top100_award_info")
    --	tinsert(tSay,"Ph¸t th­ëng bang héi/PhatThuongBangHoi")
    tinsert(tSay,"Ta biÕt råi/dlgover")

    if nDate <= TOP_STOP_HDL then
        local strSay = strNpcName.."Ho¹t ®éng <color=yellow>Top C«ng Tr¹ng M¸y Chñ Míi<color> diÔn ra tõ ngµy<color=red> "..szStartDate.." ®Õn 24:00 "..szEndDate.."<color>. Trong thêi gian nµy, quý ®ång ®¹o cã thÓ ®Õn gÆp ta ®Ó nhËn c¸c phÇn th­ëng hÊp dÉn. Th«ng tin chi tiÕt ho¹t ®éng ®ång ®¹o cã thÓ xem t¹i trang chñ."
        Say(strSay,getn(tSay),tSay)
    end
end
