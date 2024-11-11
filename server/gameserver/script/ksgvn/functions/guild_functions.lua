Import("\\script\\ksgvn\\lib.lua")

function guild_ShowCreateDialog()
    if IsTongMember() ~= 0 then
        return KsgNpc:Talk("Ng��i �� c� bang h�i!")
    end
    if not KsgLib:HasEnoughBagRoom(2, 100) then
        return
    end
    if GetItemCount(2, 0, 555) < 1 then
        AddItem(2, 0, 555, 1)
    end
    if GetItemCount(2, 0, 125) < 1 then
        AddItem(2, 0, 125, 1)
    end
    if GetReputation() < 2000 then
        ModifyReputation(2000 - GetReputation(), 0)
    end
    if GetCash() < 5000000 then
        Earn(5000000 - GetCash())
    end
    CreateTongDialog()
end

function guild_LevelUp()
    if GetTongLevel() < 5 then
        AddTongLevel()
        PlaySound("\\sound\\sound_i016.wav")
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
    else
        KsgNpc:Talk("C�p bang h�i �� ��t ��n t�i �a, kh�ng th� th�ng c�p th�m.")
    end
end

function guild_AddGxd()
    if IsTongMember() == 0 and 1 == 2 then
        return KsgNpc:Talk("C�c h� c�n v�o bang ho�c t�o l�p bang tr��c khi ti�n h�nh thao t�c n�y!")
    end
    add_tong_gxd(10000)
    KsgPlayer:Msg("Nh�n ���c 10.000 �i�m c�ng hi�n bang!")
end

function guild_ShowAddTitle()
    if IsTongMember() == 0 then
        return KsgNpc:Talk("C�c h� c�n v�o bang ho�c t�o l�p bang tr��c khi ti�n h�nh thao t�c n�y!")
    end
    local tSay = {
        "Nh�n hi�u bang",
    }

    for i = 1, 10 do
        if i > get_tong_title_max_lv() then
            tinsert(tSay, i + 1, format("Nh�n hi�u bang c�p %s/#guild_AddTitle(%d)", i, i))
        else
            tinsert(tSay, i + 1, format("Nh�n hi�u bang c�p %s (�� nh�n)/no", i))
        end
    end
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function guild_ShowAddGangToken()
    if IsTongMember() == 0 then
        return KsgNpc:Talk("C�c h� c�n v�o bang ho�c t�o l�p bang tr��c khi ti�n h�nh thao t�c n�y!")
    end
    local tSay = {
        "Nh�n t�n v�t bang h�i: ",
    }

    for i = 1, 20 do
        tinsert(tSay, i + 1, format("Nh�n t�n v�t c�p %s/#guild_AddGangToken(%d)", i, i))
    end

    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function guild_AddGangToken(nLevel)
    nLevel = tonumber(nLevel)
    if nLevel < 1 or nLevel > 20 then
        return
    end
    if KsgItem:CountAll(0, 155, nLevel) == 0 then
        AddItem(0, 155, nLevel, 1)
        KsgNpc:Talk(format("Nh�n th�nh c�ng t�n v�t bang c�p %d", nLevel))
    else
        KsgNpc:Talk(format("C�c h� �� c� t�n v�t bang c�p %d r�i, kh�ng th� nh�n th�m!", nLevel))
    end
end

function guild_AddTitle(nLevel)
    nLevel = tonumber(nLevel)
    if get_tong_title_max_lv() < nLevel then
        set_tong_title_lv(nLevel)
        set_tong_title_max_lv(nLevel)
        for i = 1, 10 do
            RemoveTitle(72, i)
        end
        AddTitle(72, nLevel)
        SetCurTitle(72, nLevel)
        PlaySound("\\sound\\sound_i016.wav")
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
        KsgNpc:Talk(format("Nh�n th�nh c�ng hi�u bang c�p %d", nLevel))
    end
end