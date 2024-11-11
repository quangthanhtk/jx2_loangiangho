----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-12-21
--- Description: ��nh ngh�a c�c h�m entrypoint �� t��ng t�c v�i h�m trong functions
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\online_activities\\ruong_hoat_dong\\functions.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>��i S� Ho�t ��ng<color>: ";
----------------------------------------------------------------------------------------------------
function WRUONGHD_Act1()
    local tbSay = { "<npcname>: <sex> sau khi m� <color=white>R��ng Ho�t ��ng<color> c� th� t�ch l�y <color=white>1 �i�m ho�t ��ng<color> v� s� reset m�t l�n sau 0h m�i ng�y." ..
                            "3 nh�n s� c� s� �i�m t�ch l�y cao duy nh�t s� nh�n ���c 1 b� trang b� <color=white>V� Song Chi�n Th�n<color> v� 1 b� <color=white>V� C�c Minh Tinh<color>"
    };

    tinsert(tbSay, format("%s/#WRUONGHD:ShowAwardList(1)", "Xem top �i�m t�ch l�y h�m qua"));

    tinsert(tbSay, format("%s/nothing", "Ta ch� xem qua th�i."));
    WNpc:SayDialog(tbSay);
end

function WRUONGHD_Act2()
    local tbSay = { "<npcname>: <sex> sau khi m� <color=white>R��ng Ho�t ��ng<color> c� th� nh�n ng�u nhi�n <color=white>1 m�nh gh�p [V�] [L�m] [2] [Huy�n] [Tho�i]<color>." ..
                            "M�nh gh�p c� th� d�ng �� ��i c�c v�t ph�m, ��c bi�t c� 5 b� V� Song Chi�n Th�n cho nh�n s� nhanh tay nh�t thu th�p �� 5 m�nh gh�p!"
    };

    tinsert(tbSay, format("%s/#WRUONGHD:ExchanceGoods()", "Xem v�t ph�m c� th� ��i"));

    tinsert(tbSay, format("%s/nothing", "Ta ch� xem qua th�i."));
    WNpc:SayDialog(tbSay);
end