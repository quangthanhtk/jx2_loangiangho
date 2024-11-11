----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: lua entrypoint, import file n�y v�o c�c script c�n s� d�ng
----------------------------------------------------------------------------------------------------
g_nPreloadVersion = 1; -- D�ng �� ki�m tra khi reload script
----------------------------------------------------------------------------------------------------
--- C�m d�ng c�c h�m sau
function ReloadAllScript(...)
end
function nothing(...)
end
function pairs(tb)
    local tbCopy = {};
    for k, v in tb do
        if k ~= "n" then
            tbCopy[k] = v;
        end
    end
    return tbCopy;
end
----------------------------------------------------------------------------------------------------
--- C�c th� vi�n s�n c�
Import("\\script\\class\\mem.lua");
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\lib\\define.lua");
Import("\\script\\vng\\define_vng.lua");
Import("\\script\\task_access_code_def.lua");
Import("\\script\\ksgvn\\lib.lua");
----------------------------------------------------------------------------------------------------
--- ��nh ngh�a c�c bi�n v� m�i tr��ng code, s� d�ng Import m�c ��ch �� gi� l�i c�c bi�n khi reload
Include("\\script\\warlord\\constants.lua"); -- 1st: h�ng s� c�a game
Include("\\script\\warlord\\defines\\define_env.lua"); -- 2nd: bi�n m�i tr��ng game
Import("\\script\\warlord\\defines\\define_static.lua"); -- 3rd: c�c bi�n global kh�ng mu�n b� m�t khi ReloadScript th� ��t � ��y
Include("\\script\\warlord\\defines\\define_shop.lua");
Include("\\script\\warlord\\configs.lua");
----------------------------------------------------------------------------------------------------
--- Load c�c th� vi�n script c� s�
Include("\\script\\warlord\\libs\\lib_common.lua");
Include("\\script\\warlord\\libs\\lib_filelog.lua");
Include("\\script\\warlord\\libs\\lib_dblog.lua");
Include("\\script\\warlord\\libs\\lib_date.lua");
Include("\\script\\warlord\\libs\\lib_calc.lua");
Include("\\script\\warlord\\libs\\lib_npc.lua");
Include("\\script\\warlord\\libs\\lib_player.lua");
Include("\\script\\warlord\\libs\\lib_team.lua");
Include("\\script\\warlord\\libs\\lib_item.lua");
Include("\\script\\warlord\\libs\\lib_task.lua");
Include("\\script\\warlord\\libs\\lib_tasktemp.lua");
Include("\\script\\warlord\\libs\\lib_award.lua");
Include("\\script\\warlord\\libs\\lib_ic.lua");
Include("\\script\\warlord\\libs\\lib_duatop.lua");

if not WARLORD_PRELOAD then
    --print(format("========== g_nPreloadVersion(%d) ==========", g_nPreloadVersion));
    --print(format("========== g_nDefineVersion(%d) ==========", g_nDefineVersion));
    WARLORD_PRELOAD = 1;
end
