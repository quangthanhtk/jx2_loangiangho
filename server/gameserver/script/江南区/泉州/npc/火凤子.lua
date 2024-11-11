Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\equip_shop\\equip_shop_item.lua")
Include("script\\item\\exchange_error_huwei_weapon.lua")
Import("\\script\\ksgvn\\lib.lua")

function main()
    local szTitile = "<color=green>Háa Phông Tö: <color> Ta cã thÓ gióp ®­îc g× cho ng­¬i kh«ng?"
    local tSay = {
        format("%s/open_zhuque_equipshop", "Më TiÖm Trang BÞ Chu T­íc"),
        format("%s/open_qinglong_equipshop", "Më tiÖm trang bÞ Thanh Long"),
        format("%s/open_huofeng_equipshop", "Më tiÖm trang bÞ Háa Phông"),
        format("%s/open_huwei_equipshop", "Më TiÖm Trang BÞ Uy Hæ"),
        format("%s/showHanVuShop", "Më TiÖm Trang BÞ H·n Vò"),
        --format("%s/main_exchange", "§æi Trang BÞ Uy Hæ Míi NhÊt (Dµnh cho KiÕm T«n)"),
        "Ta chØ ghÐ ch¬i/nothing",
    }
    Say(szTitile, getn(tSay), tSay)
end

function open_huofeng_equipshop()
    local tShop = {
        [1] = {
            "TiÖm Vò KhÝ Háa Phông-S¬ CÊp/#show_equip_shop(3055)",
            "TiÖm Trang BÞ T­íng Qu©n Háa Phông /#show_equip_shop(3056)",
            "TiÖm Háa Phông Nguyªn So¸i/#show_equip_shop(3058)",
            "TiÖm Trang Søc T­íng Qu©n Háa Phông/#show_equip_shop(3060)",
            "TiÖm Trang Søc Háa Phông Nguyªn So¸i/#show_equip_shop(3062)",
            "Ta chØ ghÐ ch¬i/nothing",
        },
        [2] = {
            "TiÖm Vò KhÝ Háa Phông-S¬ CÊp/#show_equip_shop(3055)",
            "TiÖm Trang BÞ T­íng Qu©n Háa Phông /#show_equip_shop(3057)",
            "TiÖm Háa Phông Nguyªn So¸i/#show_equip_shop(3059)",
            "TiÖm Trang Søc T­íng Qu©n Háa Phông/#show_equip_shop(3061)",
            "TiÖm Trang Søc Háa Phông Nguyªn So¸i/#show_equip_shop(3063)",
            "Ta chØ ghÐ ch¬i/nothing",
        },
    }
    local nSex = GetSex();
    Say("<color=green>Háa Phông Tö: <color> Ta cã thÓ gióp ®­îc g× cho ng­¬i kh«ng?", getn(tShop[nSex]), tShop[nSex])
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
        "<color=green>Háa Phông Tö: <color>Ta cã thÓ gióp ®­îc g× cho ng­¬i kh«ng?",
        "\t§ãng/no",
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
