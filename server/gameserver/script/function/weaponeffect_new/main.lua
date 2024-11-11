
szMainNpcName = "<color=green>C�m Nang ��i S� Ki�n:<color>"

T_WE_ITEM2TIME = {
    [1] = {{2,1,31507,  1}, 7},
    [2] = {{2,1,30230,200}, 7},
    [3] = {{2,1,30230,600}, 30},
}

function WECheckWeapon()
    local g,d,p = GetPlayerEquipInfo(2)
    if g == 0 and d == 0 and p == 0 then
        return 0
    end
    return 1
end

function WECheckIfImposed() -- �Ѿ����ӵ�����
    local szEffectSoulName = GetBindedWeaponEffectName();
    if szEffectSoulName ~= "" then                                          --�Ƿ��Ѿ���������
        return 0;
    end
    return 1
end

function WEfMainDialog()
    if WECheckWeapon() ~= 1 then
        Talk(1,"",format("%s Ch�a trang b� v� kh�, kh�ng th� thao t�c!", szMainNpcName))
        return
    end
    
    if WECheckIfImposed() ~= 1 then
        local szTitle = format("%s V� Kh� �� U�n Linh r�i, ti�p t�c thao t�c s� thay th� hi�u qu� �ang c�, ��ng �?", szMainNpcName)    
        local tbSay = {
            "Ti�p t�c!/WEDoAddEffect",
            "H�y b�/nothing"
        }
        Say(szTitle, getn(tbSay), tbSay)
        return
    end

    WEDoAddEffect()
    
end

function WEDoAddEffect()
    local szTitle = format("%s H�y ch�n lo�i U�n Linh mu�n ��i:", szMainNpcName)    
    local tbSay = {
        "Linh Ph�ch-Thi�t C�t/#WEDoAddEffectChooseTime(\"Thi�t C�t\")",
        "Linh Ph�ch-B�ch Chi�n/#WEDoAddEffectChooseTime(\"B�ch Chi�n\")",
        "Linh Ph�ch-Ch��c Nh�t/#WEDoAddEffectChooseTime(\"Ch��c Nh�t\")",
        "Linh Ph�ch-Tu�n D�t/#WEDoAddEffectChooseTime(\"Tu�n D�t\")",
        "Linh Ph�ch-��o L�/#WEDoAddEffectChooseTime(\"��o L�\")",
        "Linh Ph�ch-Danh T�c/#WEDoAddEffectChooseTime(\"Danh T�c\")",
        "Linh Ph�ch-L�c H�/#WEDoAddEffectChooseTime(\"L�c H�\")",
        "Linh Ph�ch-�o�n Giao/#WEDoAddEffectChooseTime(\"�o�n Giao\")",
        "Linh Ph�ch-Ph� Qu�n/#WEDoAddEffectChooseTime(\"Ph� Qu�n\")",
        "Linh Ph�ch-H�o m�n/#WEDoAddEffectChooseTime(\"H�o m�n\")",
        "Linh Ph�ch-Tinh Di/#WEDoAddEffectChooseTime(\"Tinh Di\")",
        "H�y b�/nothing",
    }
    Say(szTitle, getn(tbSay), tbSay)
end

function WEDoAddEffectChooseTime(szName)
    local szTitle = format("%s Hi�u qu� U�n Linh s� tan d�n theo th�i gian. C��ng �� U�n Linh c�ng cao, t�n t�i c�ng l�u, ti�u hao c�ng l�n.", szMainNpcName)    
    local tbSay = {
        -- format("��ϣ������7��(�����������Ǽ���ȯx1)/#WEDoAddEffectConfirm(\"%s\", %d)", szName, 3),
        -- format("��ϣ������7��(����200����xu)/#WEDoAddEffectConfirm(\"%s\", %d)", szName, 1),
        -- format("��ϣ������30��(����600����xu)/#WEDoAddEffectConfirm(\"%s\", %d)", szName, 2),
        -- "����/WEDoAddEffect",
    }
    local tInfo = nil
    for i=1, getn(T_WE_ITEM2TIME) do
        tInfo = T_WE_ITEM2TIME[i]
        tinsert(tbSay, format("K�ch ho�t %d ng�y (T�n [%s] x%d)/#WEDoAddEffectConfirm(\"%s\", %d)",
            tInfo[2],
            GetItemName(tInfo[1][1],tInfo[1][2],tInfo[1][3]),
            tInfo[1][4],
            szName,
            i ) )
    end
    tinsert(tbSay, "tr� l�i/WEDoAddEffect")
    tbSay.n = nil
    
    Say(szTitle, getn(tbSay), tbSay)
end

function WEDoAddEffectConfirm(szName, szType)
    local tInfo = T_WE_ITEM2TIME[szType]
    if not tInfo then
        return
    end

    if DelItem(tInfo[1][1],tInfo[1][2],tInfo[1][3],tInfo[1][4]) ~= 1 then
        Talk(1,"",format("%s: Tr�n ng��i kh�ng �� %s!", szMainNpcName, GetItemName(tInfo[1][1],tInfo[1][2],tInfo[1][3])) )
        return
    end

    BindWeaponEffect( szName, tInfo[2]*86400 )
    AddWeaponEffectAttribute(8, 1) 
    AddWeaponEffectAttribute(9, 1) 
    Msg2Player("U�n Linh th�nh c�ng! C� th� ch�n m�/��ng Ho�n Linh t� bi�u t��ng V� Kh� trong giao di�n Trang B� (Ph�m t�t: F)")

    if szType == 1 then -- ����һ���������ǵĴ��� ����������
        AddRuntimeStat(90, 1, GetPlayerRoute(), 1)
    elseif szType == 2 then  -- ����һ���������ǵĴ��� ����������
        AddRuntimeStat(90, 2, GetPlayerRoute(), 1)
    end
end