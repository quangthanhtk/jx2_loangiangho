Include("\\script\\equip_shop\\equip_shop_head.lua")
Import("\\script\\function\\lucky_box\\lb_head.lua");
Import("\\script\\function\\cdkey\\ck_head.lua");
Import("\\script\\warlord\\preload.lua");
Import("\\script\\lib\\globalvalue.lua");
Include("\\settings\\static_script\\gem\\imp_npc_gem.lua");

function OnUse(nItem)
	--show_equip_shop(3029);
    local tbSay = { "��i th��ng Hu�n ch��ng Anh H�ng:" };

   tinsert(tbSay, format("%s/_w_yxshop_OpenMenu_QuayThuong", "Ho�t ��ng quay th��ng"));
    tinsert(tbSay, format("%s/#_w_yxshop_Exchange_Gold(1)", "��i 500 Hu�n Ch��ng l�y 5000 v�ng"));
    tinsert(tbSay, format("%s/#_w_yxshop_Exchange_UHH(1)", "��i 2000 Hu�n Ch��ng l�y 1 Uy H� H�n"));

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);

end
function _w_yxshop_OpenMenu_QuayThuong()
    local tbSay = { "Ho�t ��ng quay th��ng:" };
    tinsert(tbSay, format("%s/_open_gem_lucky_box", "M� Quay th��ng"));
    tinsert(tbSay, format("%s/#QuayThuong_GetAccumulateAward()", "T�ch L�y Quay Th��ng"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
end

function _w_yxshop_Exchange_Gold(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local nHuanChuongEx=nAmount*500;
    local nGoldRec=nHuanChuongEx*100000;
    local nGoldRecReal=nHuanChuongEx*10;
    local tbRequirements = {
        tbItems = {
            { szName = "Hu�n Ch��ng Anh H�ng", tbProp = { 2, 1, 30499 }, nCount = nHuanChuongEx }
        },
    }
    local tbAward = {
        { nGold = nGoldRec }, -- V�ng
    };

    if KsgLib:PayMaterial(tbRequirements) and nAmount > 0 then

        WAward:Give(tbAward, "item_newbie_card");
        return KsgNpc:Talk("Ch�c m�ng ��i hi�p �� quy ��i "..nHuanChuongEx.." l�y"..nGoldRecReal.." v�ng", 1)
    else
        WNpc:Talk("Hi�n kh�ng �� Hu�n Ch��ng Anh H�ng");
    end

end
function _w_yxshop_Exchange_UHH(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local nHuanChuongEx=nAmount*2000;
    local tbRequirements = {
        tbItems = {
            { szName = "Hu�n Ch��ng Anh H�ng", tbProp = { 2, 1, 30499 }, nCount = nHuanChuongEx }
        },
    }
    local tbAward = {
        { tbProp = { 2, 1, 31294 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Uy H� H�n
    };

    if KsgLib:PayMaterial(tbRequirements) and nAmount > 0 then

        WAward:Give(tbAward, "item_newbie_card");
        return KsgNpc:Talk("Ch�c m�ng ��i hi�p �� quy ��i "..nHuanChuongEx.." l�y"..nAmount.." Uy H� H�n", 1)
    else
        WNpc:Talk("Hi�n kh�ng �� Hu�n Ch��ng Anh H�ng");
    end

end