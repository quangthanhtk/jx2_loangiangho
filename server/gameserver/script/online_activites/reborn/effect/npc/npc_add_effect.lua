----------------[话说代码应该是一种艺术]----------------
--------------------------------------------------------
--脚本名称:龙光真人NPC主对话脚本                       |
--脚本功能:龙光真人NPC功能入口                         |
--功能开发人:刘宇斌                                    |
--功能开发时间：2009-12-28                             |
--主要修改记录：                                       |
--------------------------------------------------------
Include("\\script\\online_activites\\reborn\\effect\\head.lua")
Include("\\script\\online_activites\\reborn\\effect\\npc\\npc_add_effect_weapon.lua")
Include("\\script\\online_activites\\reborn\\effect\\npc\\npc_add_effect_cloth.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\nhiemvudonghanh.lua")

-----------------------------------------npc脚本入口-----------------------------------------
-- 20190920 龙光真人蕴灵功能入口关闭

function main()
    local tbSays = {
         VIE_201005_REBORN_STR_NpcDialog[0][2].."/weapon_effect",          --武器蕴灵相关
        --VIE_201005_REBORN_STR_NpcDialog[0][3].."/cloth_effect",           --外装蕴灵相关 201607移植到欠扁盒关闭
        VIE_201005_REBORN_STR_NpcDialog[0][4].."/gf_DoNothing"            --空函数
    };
    -- Say(VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[0][1], getn(tbSays), tbSays);
    local szTitleReplace = "H玬 nay c� hi謓 tng l�, ph輆 sa m筩 xu蕋 hi謓 nhi襲 Y猽 Ma. е t� C玭 L玭 ph秈 g竛h v竎 tr竎h nhi謒 tr秏 y猽 tr� ma!"
    Say(VIE_201005_REBORN_STR_NpcName..szTitleReplace, getn(tbSays), tbSays);
end