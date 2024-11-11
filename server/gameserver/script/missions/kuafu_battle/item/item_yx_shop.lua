Include("\\script\\equip_shop\\equip_shop_head.lua")
Import("\\script\\function\\lucky_box\\lb_head.lua");
Import("\\script\\function\\cdkey\\ck_head.lua");
Import("\\script\\warlord\\preload.lua");
Import("\\script\\lib\\globalvalue.lua");
Include("\\settings\\static_script\\gem\\imp_npc_gem.lua");

function OnUse(nItem)
	--show_equip_shop(3029);
    local tbSay = { "§æi th­ëng Hu©n ch­¬ng Anh Hïng:" };

   tinsert(tbSay, format("%s/_w_yxshop_OpenMenu_QuayThuong", "Ho¹t ®éng quay th­ëng"));
    tinsert(tbSay, format("%s/#_w_yxshop_Exchange_Gold(1)", "§æi 500 Hu©n Ch­¬ng lÊy 5000 vµng"));
    tinsert(tbSay, format("%s/#_w_yxshop_Exchange_UHH(1)", "§æi 2000 Hu©n Ch­¬ng lÊy 1 Uy Hæ Hån"));

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);

end
function _w_yxshop_OpenMenu_QuayThuong()
    local tbSay = { "Ho¹t ®éng quay th­ëng:" };
    tinsert(tbSay, format("%s/_open_gem_lucky_box", "Më Quay th­ëng"));
    tinsert(tbSay, format("%s/#QuayThuong_GetAccumulateAward()", "TÝch Lòy Quay Th­ëng"));
    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
end

function _w_yxshop_Exchange_Gold(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local nHuanChuongEx=nAmount*500;
    local nGoldRec=nHuanChuongEx*100000;
    local nGoldRecReal=nHuanChuongEx*10;
    local tbRequirements = {
        tbItems = {
            { szName = "Hu©n Ch­¬ng Anh Hïng", tbProp = { 2, 1, 30499 }, nCount = nHuanChuongEx }
        },
    }
    local tbAward = {
        { nGold = nGoldRec }, -- Vµng
    };

    if KsgLib:PayMaterial(tbRequirements) and nAmount > 0 then

        WAward:Give(tbAward, "item_newbie_card");
        return KsgNpc:Talk("Chóc mõng ®¹i hiÖp ®· quy ®æi "..nHuanChuongEx.." lÊy"..nGoldRecReal.." vµng", 1)
    else
        WNpc:Talk("HiÖn kh«ng ®ñ Hu©n Ch­¬ng Anh Hïng");
    end

end
function _w_yxshop_Exchange_UHH(nAmount)
    nAmount = tonumber(nAmount) or 0;
    local nHuanChuongEx=nAmount*2000;
    local tbRequirements = {
        tbItems = {
            { szName = "Hu©n Ch­¬ng Anh Hïng", tbProp = { 2, 1, 30499 }, nCount = nHuanChuongEx }
        },
    }
    local tbAward = {
        { tbProp = { 2, 1, 31294 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Uy Hæ Hån
    };

    if KsgLib:PayMaterial(tbRequirements) and nAmount > 0 then

        WAward:Give(tbAward, "item_newbie_card");
        return KsgNpc:Talk("Chóc mõng ®¹i hiÖp ®· quy ®æi "..nHuanChuongEx.." lÊy"..nAmount.." Uy Hæ Hån", 1)
    else
        WNpc:Talk("HiÖn kh«ng ®ñ Hu©n Ch­¬ng Anh Hïng");
    end

end