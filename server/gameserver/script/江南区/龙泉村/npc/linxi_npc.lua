--��ϫ�������ˣ�������ң�ɶ�
Import("\\script\\ksgvn\\lib.lua")

g_szInfoHeader = "<color=green>L�m T�ch<color>: "

LONGCAO_PRICE = 5 -- V�ng

function main()
    local tSay = {
        g_szInfoHeader .. "T�m ta c� vi�c g� kh�ng? Ch� ta g�n ��y c� r�t nhi�u h� ly t� Mai Trang ��n, ch�ng su�t ng�y qu�y r�i ta, th�t l� t�c qu� �i ~~~",
        format("Nghe n�i t� t� c� r�t nhi�u lo�i �i�u hi�m, c� th� cho ta xem ���c kh�ng?/#KsgLib:OpenEquipShop(%d)", EQUIP_SHOP_EXCHANGE_TIENDIEU),
        "Ta c�n 1 �t L�ng C�o/buyLongCao",
        "Ta mu�n ��n Dao Ti�n ��ng/go_to_yaoxiandong",
        "\nKh�ng c� g�/nothing"
    }
    KsgNpc:SayDialog(tSay)
end

function go_to_yaoxiandong()
    local nLevel = GetLevel()
    if nLevel < 85 then
        Talk(1, "", g_szInfoHeader .. "��ng c�p th�p h�n <color=yellow>85<color> kh�ng th� v�o Dao Ti�n ��ng.")
        return 0
    end
    NewWorld(118, 1616, 3211)
end

function buyLongCao(nNumber)
    if not nNumber then
        local tSay = {
            g_szInfoHeader .. format("��i 1 L�ng C�o c�n t�n <color=gold>%d V�ng<color>, ��i hi�p mu�n ��i bao nhi�u c�i?", LONGCAO_PRICE),
            "Nh�p s� l��ng c�n ��i/buyLongCao_Input",
            "\nTa kh�ng mu�n ��i/nothing"
        }
        return KsgNpc:SayDialog(tSay)
    end
	if nNumber <= 0 then
		return
	end
	local tSay = {
		g_szInfoHeader .. format("��i <color=green>%d L�ng C�o<color> c�n t�n <color=gold>%d V�ng<color>, ��i hi�p x�c nh�n ��i kh�ng?", nNumber, LONGCAO_PRICE * nNumber),
		format("X�c nh�n/#buyLongCao_Submit(%d)", nNumber),
		"\n�� ta suy ngh� l�i m�t ch�t/nothing"
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
		}, "Mua L�ng C�o")
	end
end

function buyLongCao_Input()
    local nMax = floor(KsgPlayer:GetGold() / LONGCAO_PRICE)
    if nMax > 10000 then
        nMax = 10000
    end
    AskClientForNumber("buyLongCao", 0, nMax, "Nh�p v�o s� l��ng")
end

function nothing()

end