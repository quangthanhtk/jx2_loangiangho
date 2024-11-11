----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-30
--- Description: item m¶nh mËt tÞch cao cÊp ®æi ra mËt tÞch 20%
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>Tói Kim Xµ<color>: ";
--local tbGoods = {
--    [1] = { tbProp = { 2, 1, 31261 }, nStack = 1 },
--    [2] = { tbProp = { 2, 1, 31262 }, nStack = 1},
--    [3] = { tbProp = { 2, 1, 31263 }, nStack = 1 },
--    [4] = { tbProp = { 2, 1, 31264 }, nStack = 1 },
--    [5] = { tbProp = { 2, 1, 31265 }, nStack = 1 },
--};
--m_tbTrangBi = {
--    [1] = { "V¨n søc 3  §Çu", { 2, 1, 31261, 1, 4, -1, -1, -1, -1, -1, -1 } },
--    [2] = { "V¨n søc 3 ¸o", { 1, 102, 31262, 1, 4, -1, -1, -1, -1, -1, -1 } },
--    [3] = { "V¨n søc 3 QuÇn", { 2, 1, 31263, 1, 4, -1, -1, -1, -1, -1, -1 } },
--    [4] = { "V¨n søc 3 NhÉn", { 2, 1, 31264, 1, 4, -1, -1, -1, -1, -1, -1 } },
--    [5] = { "V¨n søc 3 Ngäc", { 2, 1, 31265, 1, 4, -1, -1, -1, -1, -1, -1 } },
--};

function OnUse(nItemIdx)
    local tbGoods = {
        [1] = { tbProp = { 2, 1, 31261 }, nStack = 1 },
        [2] = { tbProp = { 2, 1, 31262 }, nStack = 1},
        [3] = { tbProp = { 2, 1, 31263 }, nStack = 1 },
        [4] = { tbProp = { 2, 1, 31264 }, nStack = 1 },
        [5] = { tbProp = { 2, 1, 31265 }, nStack = 1 },
    };

        local tbSay = { "Chän v¨n søc cÇn" };

        for i = 1, getn(tbGoods) do
            tinsert(tbSay, format("§ång ý nhËn %d %s/#_w_OnSelect(%d,%d)", tbGoods[i].nStack, WItem:GetName(tbGoods[i].tbProp), i,nItemIdx));
        end

        tinsert(tbSay, "Ta chØ hái qua th«i/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;


    --if tbGoods[nSelected] == WEnv.NULL then
    --    return WEnv.RETCODE_NOTMATCH;
    --end
    --
    --WAward:Give(tbGoods[nSelected], "NhËn méc 2k5 Tô B¶o Trai");
end

function _w_OnSelect(nSelectIdx,nItemIdx)
    local tbGoods1 = {
        [1] = { tbProp = { 2, 1, 31261 }, nStack = 1 },
        [2] = { tbProp = { 2, 1, 31262 }, nStack = 1},
        [3] = { tbProp = { 2, 1, 31263 }, nStack = 1 },
        [4] = { tbProp = { 2, 1, 31264 }, nStack = 1 },
        [5] = { tbProp = { 2, 1, 31265 }, nStack = 1 },
    };
       if WLib:CheckInv(3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    if WItem:DelByIndex(nItemIdx) ~= WEnv.RETCODE_SUCCESS then
        return WEnv.RETCODE_ERROR;
    end

    WAward:Give(tbGoods1[nSelectIdx], "NhËn méc 2k5 Tô B¶o Trai");
    return WEnv.RETCODE_SUCCESS;
end
