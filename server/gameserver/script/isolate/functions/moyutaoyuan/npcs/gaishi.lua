function main()
    local szTitle = "<color=green>C�i Th�<color>: Th� gi�i ngo�i th�n c� g� vui ch�, m�i ng��i � b�n nhau m�i vui."
    local tbSay = {
        "M� c�a h�nh �m Th� Y�u Quy�t/TaoYuan_OpenShop",
        "H�y b�/nothing"
    }
    Say(szTitle, getn(tbSay), tbSay)
end

function TaoYuan_OpenShop()
    SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3101, "C�a h�nh �m Th� Y�u Quy�t"))
end