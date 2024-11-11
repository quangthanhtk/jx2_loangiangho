--ÁÕÏ«£¬´«ËÍÈË£¬´«ËÍÖÁÒ£ÏÉ¶´
Import("\\script\\ksgvn\\lib.lua")

g_szInfoHeader = "<color=green>L©m TÞch<color>: "

LONGCAO_PRICE = 5 -- Vµng

function main()
    local tSay = {
        g_szInfoHeader .. "T×m ta cã viÖc g× kh«ng? Chç ta gÇn ®©y cã rÊt nhiÒu hå ly tõ Mai Trang ®Õn, chóng suèt ngµy quÊy r«i ta, thËt lµ tøc qu¸ ®i ~~~",
        format("Nghe nãi tû tû cã rÊt nhiÒu lo¹i ®iªu hiÕm, cã thÓ cho ta xem ®­îc kh«ng?/#KsgLib:OpenEquipShop(%d)", EQUIP_SHOP_EXCHANGE_TIENDIEU),
        "Ta cÇn 1 Ýt L«ng C¸o/buyLongCao",
        "Ta muèn ®Õn Dao Tiªn ®éng/go_to_yaoxiandong",
        "\nKh«ng cã g×/nothing"
    }
    KsgNpc:SayDialog(tSay)
end

function go_to_yaoxiandong()
    local nLevel = GetLevel()
    if nLevel < 85 then
        Talk(1, "", g_szInfoHeader .. "§¼ng cÊp thÊp h¬n <color=yellow>85<color> kh«ng thÓ vµo Dao Tiªn ®éng.")
        return 0
    end
    NewWorld(118, 1616, 3211)
end

function buyLongCao(nNumber)
    if not nNumber then
        local tSay = {
            g_szInfoHeader .. format("§æi 1 L«ng C¸o cÇn tèn <color=gold>%d Vµng<color>, ®¹i hiÖp muèn ®æi bao nhiªu c¸i?", LONGCAO_PRICE),
            "NhËp sè l­îng cÇn ®æi/buyLongCao_Input",
            "\nTa kh«ng muèn ®æi/nothing"
        }
        return KsgNpc:SayDialog(tSay)
    end
	if nNumber <= 0 then
		return
	end
	local tSay = {
		g_szInfoHeader .. format("§æi <color=green>%d L«ng C¸o<color> cÇn tèn <color=gold>%d Vµng<color>, ®¹i hiÖp x¸c nhËn ®æi kh«ng?", nNumber, LONGCAO_PRICE * nNumber),
		format("X¸c nhËn/#buyLongCao_Submit(%d)", nNumber),
		"\n§Ó ta suy nghÜ l¹i mét chót/nothing"
	}
	return KsgNpc:SayDialog(tSay)
end

function buyLongCao_Submit(nNumber)
	if nNumber <= 0 then
		return
	end
	local nNeedRoom = floor(nNumber / 999)

	if not KsgLib:HasEnoughBagRoom(nNeedRoom) then
		return
	end

	local tbCondition = {
		nGold = nNumber * LONGCAO_PRICE
	}
	if KsgLib:PayMaterial(tbCondition) then
		KsgAward:Give({
			tbProp = { 2, 1, 155 }, nStack = nNumber, nStatus = 1
		}, "Mua L«ng C¸o")
	end
end

function buyLongCao_Input()
    local nMax = floor(KsgPlayer:GetGold() / LONGCAO_PRICE)
    if nMax > 10000 then
        nMax = 10000
    end
    AskClientForNumber("buyLongCao", 0, nMax, "NhËp vµo sè l­îng")
end

function nothing()

end