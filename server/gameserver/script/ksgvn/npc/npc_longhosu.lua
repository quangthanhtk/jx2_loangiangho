Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\event\\bhta\\bhta.lua")

g_szNpcName = "<color=green>Long H� S�<color>: "

function main()
    local tSay = {
        format(g_szNpcName .. "<color=gold>Bang H�i Tinh Anh m�a %d<color> �� khai m�, c�c h� h�i ta c� vi�c g�?", BHTA_SEASON),
    }

    local szCurrentDate = tonumber(date("%Y%m%d"));

    if szCurrentDate >= BHTA_REGISTER_START_DATE and szCurrentDate <= BHTA_REGISTER_END_DATE then
        tinsert(tSay, "��ng k� tham gia Bang H�i Tinh Anh/bhta_Register")
        tinsert(tSay, "Ta mu�n xem t�nh h�nh b�o danh Bang H�i Tinh Anh/bhta_ViewRegister")
    end

    if szCurrentDate >= BHTA_GIVE_FLAG_START_DATE and szCurrentDate <= BHTA_GIVE_FLAG_END_DATE then
        tinsert(tSay, "Nh�n Tinh Anh L�nh K�/bhta_GetFlags")
        tinsert(tSay, format("N�p Tinh Anh L�nh K�/#bhta_RegisterFight(%d)", BHTA_FLAG_TYPE_NORMAL))
        tinsert(tSay, format("N�p Tinh Anh L�nh K� (Nguy�n So�i)/#bhta_RegisterFight(%d)", BHTA_FLAG_TYPE_NGUYEN_SOAI))
        tinsert(tSay, "Xem danh s�ch ��ng k� thi ��u/bhta_ViewRegisterFightList")
    end

    tinsert(tSay, "Ta mu�n t�m hi�u v� gi�i ��u/#bhta_About(1)")
    tinsert(tSay, "\nTa ch� ti�n gh� qua!/no")

    KsgNpc:SayDialog(tSay)
end
