----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item r��ng ho�t ��ng tr�ng b�t nh� l�n
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\items\\item_box_base.lua");
----------------------------------------------------------------------------------------------------
m_tbItem = inherit(WItemBoxBase, {
    szKey = "item_ruong_batnhalon",
    szName = "R��ng B�t Nh� L�n",

    nOpenTypeTaskTempId = WTASKTEMP_RUONG_BNL_OPENTYPE,

    bEnableLimitDaily = WEnv.TRUE,
    nLimitDailyTaskId = WTASKID_RUONG_BNL_DAILY_COUNT,
    nLimitDailyCount = 16,

    tbAwardTypes = {
        [1] = { szName = "M� mi�n ph�",
                tbItemConsumes = {
                    tbItems = {
                        { szName = "R��ng B�t Nh� L�n", tbProp = { 2, 1, 40019 }, nCount = 1 },
                    },
                },
                tbFixedAward = {
                    { nExp = 50000000 },
                    { nGold = 5000000 },
                    { szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 1 },
                },
                tbRandomAward = {
                },
        },
    },
});
m_szNpcName = format("<color=green>%s<color>: ", m_tbItem.szName);

function OnUse(nItemIdx)
    m_tbItem:OnUse(nItemIdx);
end
