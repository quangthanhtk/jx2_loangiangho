----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-24
--- Description: file chøa c¸c hµm liªn quan ®Õn bang héi
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\isolate\\functions\\tong_title\\head.lua"); -- cã mét sè hµm sö dông trong file nµy
----------------------------------------------------------------------------------------------------
TONG_LEVEL_MAX = 5;
TONG_TOKEN_MAX = 20;
TONG_TOKEN_NUM = 20;
TONG_TITLE_MAX = 10;
TONG_TITLE_NUM = 10;
----------------------------------------------------------------------------------------------------
function _w_tong_ShowCreateDialog(bSupport, szLogTitle)
    bSupport = tonumber(bSupport) or WEnv.FALSE;
    szLogTitle = szLogTitle or "_w_tong_ShowCreateDialog";

    if IsTongMember() ~= 0 then
        WNpc:Talk("C¸c h¹ ®· cã bang héi råi!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end
    if WLib:CheckInv(2 + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    if bSupport == WEnv.TRUE then
        local tbAward = {};
        if GetItemCount(2, 0, 555) < 1 then
            tinsert(tbAward, { tbProp = { 2, 0, 555 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }); -- Cµn Kh«n phï
        end
        if GetItemCount(2, 0, 125) < 1 then
            tinsert(tbAward, { tbProp = { 2, 0, 125 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }); -- Héi Minh LÖnh Bµi
        end
        if WPlayer:GetRepute() < 2000 then
            tinsert(tbAward, { nRepute = 2000 - WPlayer:GetRepute() }); -- danh väng
        end
        if WPlayer:GetGold() < 500 then
            tinsert(tbAward, { nGold = 500 }); -- vµng
        end
        if getn(tbAward) > 0 then
            WAward:Give(tbAward, szLogTitle);
        end
    end
    CreateTongDialog();
end

function _w_tong_AddLevel(szLogTitle)
    szLogTitle = szLogTitle or "_w_tong_AddLevel";

    --- kiÓm tra hîp lÖ
    if IsTongMember() == 0 then
        WNpc:Talk("C¸c h¹ cÇn vµo bang hoÆc t¹o lËp bang tr­íc khi tiÕn hµnh thao t¸c nµy!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end

    if GetTongLevel() < TONG_LEVEL_MAX then
        AddTongLevel();
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
    else
        WNpc:Talk("CÊp bang héi ®· ®¹t ®Õn tèi ®a, kh«ng thÓ th¨ng cÊp thªm!", WEnv.TRUE);
    end
end

function _w_tong_AddGxd(nAmount, szLogTitle)
    szLogTitle = szLogTitle or "_w_tong_AddGxd";

    --- kiÓm tra hîp lÖ
    if IsTongMember() == 0 then
        WNpc:Talk("C¸c h¹ cÇn vµo bang hoÆc t¹o lËp bang tr­íc khi tiÕn hµnh thao t¸c nµy!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end

    --- nhËn ®iÓm
    add_tong_gxd(nAmount);
    WPlayer:Msg(format("NhËn ®­îc %s ®iÓm cèng hiÕn bang!", WLib:MoneyFormat(nAmount)));
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
    return WEnv.RETCODE_SUCCESS;
end

function _w_tong_AddToken(nLevel, szLogTitle)
    szLogTitle = szLogTitle or "_w_tong_AddToken";

    --- kiÓm tra hîp lÖ
    if IsTongMember() == 0 then
        WNpc:Talk("C¸c h¹ cÇn vµo bang hoÆc t¹o lËp bang tr­íc khi tiÕn hµnh thao t¸c nµy!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end
    if WLib:CheckInv(1 + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    --- chän cÊp tÝn vËt nÕu ch­a truyÒn tham sè nLevel vµo
    if nLevel == WEnv.NULL then
        local tbSay = { "Chän tÝn vËt bang héi:" };
        for i = 1, TONG_TOKEN_MAX do
            tinsert(tbSay, format("%s/#_w_tong_AddToken(%d, %q)", WItem:GetName(ITEM_G_EQUIP, ITEM_D_EQUIP_TOKENS, i), i, szLogTitle));
        end
        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, "[x] §ãng/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    --- kiÓm tra tham sè nLevel
    nLevel = tonumber(nLevel) or 1;
    if nLevel < 1 or nLevel > TONG_TOKEN_MAX then
        return WEnv.RETCODE_ERROR;
    end

    --- mçi nh©n vËt chØ ®­îc gi÷ trªn ng­êi 1 lo¹i tÝn vËt
    --for i = 1, TONG_TOKEN_NUM do
    --    WItem:DeleteAll(ITEM_G_EQUIP, ITEM_D_EQUIP_TOKENS, i);
    --end

    --- nhËn tÝn vËt
    local tbAward = {
        { tbProp = { ITEM_G_EQUIP, ITEM_D_EQUIP_TOKENS, nLevel }, nStatus = ITEMSTATUS_LOCK }
    };
    local tbResult = WAward:Give(tbAward, szLogTitle);
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
    return WEnv.RETCODE_SUCCESS, tbResult;
end

function _w_tong_AddTitle(nLevel, szLogTitle)
    szLogTitle = szLogTitle or "_w_tong_AddTitle";

    --- kiÓm tra hîp lÖ
    if IsTongMember() == 0 then
        WNpc:Talk("C¸c h¹ cÇn vµo bang hoÆc t¹o lËp bang tr­íc khi tiÕn hµnh thao t¸c nµy!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end

    --- chän danh hiÖu nÕu ch­a truyÒn tham sè nLevel vµo
    if nLevel == WEnv.NULL then
        local tbSay = { "Chän danh hiÖu bang héi:" };
        for i = 1, TONG_TITLE_MAX do
            if i > get_tong_title_max_lv() then
                tinsert(tbSay, format("%s%d/#_w_tong_AddTitle(%d)", "NhËn hiÖu bang cÊp ", i, i, szLogTitle))
            else
                tinsert(tbSay, format("%s%d%s/nothing", "NhËn hiÖu bang cÊp ", i, " (®· nhËn)"))
            end
        end
        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, "[x] §ãng/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    --- kiÓm tra tham sè nLevel
    nLevel = tonumber(nLevel) or 1;
    if nLevel < 1 or nLevel > TONG_TITLE_MAX then
        return WEnv.RETCODE_ERROR;
    end

    --- nhËn danh hiÖu bang héi
    if get_tong_title_max_lv() < nLevel then
        set_tong_title_lv(nLevel);
        set_tong_title_max_lv(nLevel);

        --- mçi nh©n vËt chØ cã thÓ nhËn 1 lo¹i danh hiÖu bang
        for i = 1, TONG_TITLE_NUM do
            RemoveTitle(72, i);
        end

        AddTitle(72, nLevel);
        SetCurTitle(72, nLevel);
        WPlayer:Msg(format("NhËn thµnh c«ng hiÖu bang cÊp %d!", nLevel));
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
    end
    return WEnv.RETCODE_SUCCESS;
end
