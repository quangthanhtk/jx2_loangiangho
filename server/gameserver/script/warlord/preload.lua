----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: lua entrypoint, import file nµy vµo c¸c script cÇn sö dông
----------------------------------------------------------------------------------------------------
g_nPreloadVersion = 1; -- Dïng ®Ó kiÓm tra khi reload script
----------------------------------------------------------------------------------------------------
--- CÊm dïng c¸c hµm sau
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
--- C¸c th­ viÖn s½n cã
Import("\\script\\class\\mem.lua");
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\lib\\define.lua");
Import("\\script\\vng\\define_vng.lua");
Import("\\script\\task_access_code_def.lua");
Import("\\script\\ksgvn\\lib.lua");
----------------------------------------------------------------------------------------------------
--- §Þnh nghÜa c¸c biÕn vµ m«i tr­êng code, sö dông Import môc ®Ých ®Ó gi÷ l¹i c¸c biÕn khi reload
Include("\\script\\warlord\\constants.lua"); -- 1st: h»ng sè cña game
Include("\\script\\warlord\\defines\\define_env.lua"); -- 2nd: biÕn m«i tr­êng game
Import("\\script\\warlord\\defines\\define_static.lua"); -- 3rd: c¸c biÕn global kh«ng muèn bÞ mÊt khi ReloadScript th× ®Æt ë ®©y
Include("\\script\\warlord\\defines\\define_shop.lua");
Include("\\script\\warlord\\configs.lua");
----------------------------------------------------------------------------------------------------
--- Load c¸c th­ viÖn script c¬ së
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
