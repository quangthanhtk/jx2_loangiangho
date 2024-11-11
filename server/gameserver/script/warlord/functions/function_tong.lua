----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-24
--- Description: file ch�a c�c h�m li�n quan ��n bang h�i
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\isolate\\functions\\tong_title\\head.lua"); -- c� m�t s� h�m s� d�ng trong file n�y
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
        WNpc:Talk("C�c h� �� c� bang h�i r�i!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end
    if WLib:CheckInv(2 + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    if bSupport == WEnv.TRUE then
        local tbAward = {};
        if GetItemCount(2, 0, 555) < 1 then
            tinsert(tbAward, { tbProp = { 2, 0, 555 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }); -- C�n Kh�n ph�
        end
        if GetItemCount(2, 0, 125) < 1 then
            tinsert(tbAward, { tbProp = { 2, 0, 125 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }); -- H�i Minh L�nh B�i
        end
        if WPlayer:GetRepute() < 2000 then
            tinsert(tbAward, { nRepute = 2000 - WPlayer:GetRepute() }); -- danh v�ng
        end
        if WPlayer:GetGold() < 500 then
            tinsert(tbAward, { nGold = 500 }); -- v�ng
        end
        if getn(tbAward) > 0 then
            WAward:Give(tbAward, szLogTitle);
        end
    end
    CreateTongDialog();
end

function _w_tong_AddLevel(szLogTitle)
    szLogTitle = szLogTitle or "_w_tong_AddLevel";

    --- ki�m tra h�p l�
    if IsTongMember() == 0 then
        WNpc:Talk("C�c h� c�n v�o bang ho�c t�o l�p bang tr��c khi ti�n h�nh thao t�c n�y!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end

    if GetTongLevel() < TONG_LEVEL_MAX then
        AddTongLevel();
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
    else
        WNpc:Talk("C�p bang h�i �� ��t ��n t�i �a, kh�ng th� th�ng c�p th�m!", WEnv.TRUE);
    end
end

function _w_tong_AddGxd(nAmount, szLogTitle)
    szLogTitle = szLogTitle or "_w_tong_AddGxd";

    --- ki�m tra h�p l�
    if IsTongMember() == 0 then
        WNpc:Talk("C�c h� c�n v�o bang ho�c t�o l�p bang tr��c khi ti�n h�nh thao t�c n�y!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end

    --- nh�n �i�m
    add_tong_gxd(nAmount);
    WPlayer:Msg(format("Nh�n ���c %s �i�m c�ng hi�n bang!", WLib:MoneyFormat(nAmount)));
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
    return WEnv.RETCODE_SUCCESS;
end

function _w_tong_AddToken(nLevel, szLogTitle)
    szLogTitle = szLogTitle or "_w_tong_AddToken";

    --- ki�m tra h�p l�
    if IsTongMember() == 0 then
        WNpc:Talk("C�c h� c�n v�o bang ho�c t�o l�p bang tr��c khi ti�n h�nh thao t�c n�y!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end
    if WLib:CheckInv(1 + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    --- ch�n c�p t�n v�t n�u ch�a truy�n tham s� nLevel v�o
    if nLevel == WEnv.NULL then
        local tbSay = { "Ch�n t�n v�t bang h�i:" };
        for i = 1, TONG_TOKEN_MAX do
            tinsert(tbSay, format("%s/#_w_tong_AddToken(%d, %q)", WItem:GetName(ITEM_G_EQUIP, ITEM_D_EQUIP_TOKENS, i), i, szLogTitle));
        end
        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, "[x] ��ng/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    --- ki�m tra tham s� nLevel
    nLevel = tonumber(nLevel) or 1;
    if nLevel < 1 or nLevel > TONG_TOKEN_MAX then
        return WEnv.RETCODE_ERROR;
    end

    --- m�i nh�n v�t ch� ���c gi� tr�n ng��i 1 lo�i t�n v�t
    --for i = 1, TONG_TOKEN_NUM do
    --    WItem:DeleteAll(ITEM_G_EQUIP, ITEM_D_EQUIP_TOKENS, i);
    --end

    --- nh�n t�n v�t
    local tbAward = {
        { tbProp = { ITEM_G_EQUIP, ITEM_D_EQUIP_TOKENS, nLevel }, nStatus = ITEMSTATUS_LOCK }
    };
    local tbResult = WAward:Give(tbAward, szLogTitle);
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
    return WEnv.RETCODE_SUCCESS, tbResult;
end

function _w_tong_AddTitle(nLevel, szLogTitle)
    szLogTitle = szLogTitle or "_w_tong_AddTitle";

    --- ki�m tra h�p l�
    if IsTongMember() == 0 then
        WNpc:Talk("C�c h� c�n v�o bang ho�c t�o l�p bang tr��c khi ti�n h�nh thao t�c n�y!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end

    --- ch�n danh hi�u n�u ch�a truy�n tham s� nLevel v�o
    if nLevel == WEnv.NULL then
        local tbSay = { "Ch�n danh hi�u bang h�i:" };
        for i = 1, TONG_TITLE_MAX do
            if i > get_tong_title_max_lv() then
                tinsert(tbSay, format("%s%d/#_w_tong_AddTitle(%d)", "Nh�n hi�u bang c�p ", i, i, szLogTitle))
            else
                tinsert(tbSay, format("%s%d%s/nothing", "Nh�n hi�u bang c�p ", i, " (�� nh�n)"))
            end
        end
        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, "[x] ��ng/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    --- ki�m tra tham s� nLevel
    nLevel = tonumber(nLevel) or 1;
    if nLevel < 1 or nLevel > TONG_TITLE_MAX then
        return WEnv.RETCODE_ERROR;
    end

    --- nh�n danh hi�u bang h�i
    if get_tong_title_max_lv() < nLevel then
        set_tong_title_lv(nLevel);
        set_tong_title_max_lv(nLevel);

        --- m�i nh�n v�t ch� c� th� nh�n 1 lo�i danh hi�u bang
        for i = 1, TONG_TITLE_NUM do
            RemoveTitle(72, i);
        end

        AddTitle(72, nLevel);
        SetCurTitle(72, nLevel);
        WPlayer:Msg(format("Nh�n th�nh c�ng hi�u bang c�p %d!", nLevel));
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
    end
    return WEnv.RETCODE_SUCCESS;
end
