Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\equip_shop\\equip_shop_item.lua")
Include("script\\item\\exchange_error_huwei_weapon.lua")
Import("\\script\\ksgvn\\lib.lua")

function main()
    local szTitile = "<color=green>H�a Ph�ng T�: <color> Ta c� th� gi�p ���c g� cho ng��i kh�ng?"
    local tSay = {
        format("%s/open_zhuque_equipshop", "M� Ti�m Trang B� Chu T��c"),
        format("%s/open_qinglong_equipshop", "M� ti�m trang b� Thanh Long"),
        format("%s/open_huofeng_equipshop", "M� ti�m trang b� H�a Ph�ng"),
        format("%s/open_huwei_equipshop", "M� Ti�m Trang B� Uy H�"),
        format("%s/showHanVuShop", "M� Ti�m Trang B� H�n V�"),
        --format("%s/main_exchange", "��i Trang B� Uy H� M�i Nh�t (D�nh cho Ki�m T�n)"),
        "Ta ch� gh� ch�i/nothing",
    }
    Say(szTitile, getn(tSay), tSay)
end

function open_huofeng_equipshop()
    local tShop = {
        [1] = {
            "Ti�m V� Kh� H�a Ph�ng-S� C�p/#show_equip_shop(3055)",
            "Ti�m Trang B� T��ng Qu�n H�a Ph�ng /#show_equip_shop(3056)",
            "Ti�m H�a Ph�ng Nguy�n So�i/#show_equip_shop(3058)",
            "Ti�m Trang S�c T��ng Qu�n H�a Ph�ng/#show_equip_shop(3060)",
            "Ti�m Trang S�c H�a Ph�ng Nguy�n So�i/#show_equip_shop(3062)",
            "Ta ch� gh� ch�i/nothing",
        },
        [2] = {
            "Ti�m V� Kh� H�a Ph�ng-S� C�p/#show_equip_shop(3055)",
            "Ti�m Trang B� T��ng Qu�n H�a Ph�ng /#show_equip_shop(3057)",
            "Ti�m H�a Ph�ng Nguy�n So�i/#show_equip_shop(3059)",
            "Ti�m Trang S�c T��ng Qu�n H�a Ph�ng/#show_equip_shop(3061)",
            "Ti�m Trang S�c H�a Ph�ng Nguy�n So�i/#show_equip_shop(3063)",
            "Ta ch� gh� ch�i/nothing",
        },
    }
    local nSex = GetSex();
    Say("<color=green>H�a Ph�ng T�: <color> Ta c� th� gi�p ���c g� cho ng��i kh�ng?", getn(tShop[nSex]), tShop[nSex])
end

function showHanVuShop()
    local shop = {
        {
            EQUIP_SHOP_EXCHANGE_TONG_HVT_PHONGCU,
            EQUIP_SHOP_EXCHANGE_TONG_HVT_TRANGSUC,
            EQUIP_SHOP_EXCHANGE_TONG_HVS_PHONGCU,
            EQUIP_SHOP_EXCHANGE_TONG_HVS_TRANGSUC
        },
        {
            EQUIP_SHOP_EXCHANGE_LIEU_HVT_PHONGCU,
            EQUIP_SHOP_EXCHANGE_LIEU_HVT_TRANGSUC,
            EQUIP_SHOP_EXCHANGE_LIEU_HVS_PHONGCU,
            EQUIP_SHOP_EXCHANGE_LIEU_HVS_TRANGSUC
        }
    }

    showShopTongLieu(shop)
end

function showShopTongLieu(tbShopCfg, bySex)
    local tSay = {
        "<color=green>H�a Ph�ng T�: <color>Ta c� th� gi�p ���c g� cho ng��i kh�ng?",
        "\t��ng/no",
    }
    local nBegin = 2
    local nExchangeIndex = 1
    if not bySex then
        if GetTask(701) < 0 then
            nExchangeIndex = 2
        end
    else
        nExchangeIndex = GetSex()
    end

    local tbShop = tbShopCfg[nExchangeIndex]
    for _, nShopId in tbShop do
        tinsert(tSay, nBegin, format("%s /#KsgLib:OpenEquipShop(%d)", g_tbEquipShop[nShopId], nShopId))
        nBegin = nBegin + 1
    end
    KsgNpc:SayDialog(tSay)
end
