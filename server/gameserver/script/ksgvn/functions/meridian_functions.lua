Import("\\script\\ksgvn\\lib.lua")

function meridian_AddChanKhi()
    AwardGenuineQi(888888)
    PlaySound("\\sound\\sound_i016.wav")
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end

function meridian_AddKinhMachDongNhan(nCount)
    AddItem(2, 1, 30730, nCount)
    PlaySound("\\sound\\sound_i016.wav")
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end

function meridian_AddKinhMachNganNhan(nCount)
    AddItem(2, 1, 30731, nCount)
    PlaySound("\\sound\\sound_i016.wav")
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end

function meridian_ResetPoint(nConfirm)
    if not nConfirm or tonumber(nConfirm) ~= 1 then
        return KsgNpc:SayDialog({
            "C�c h� x�c nh�n mu�n t�y l�i �i�m kinh m�ch?",
            "��ng �/#meridian_ResetPoint(1)",
            "Ta suy ngh� l�i m�t ch�t/no",
        })
    end
    MeridianRestore(-1)
    PlaySound("\\sound\\sound_i016.wav")
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end

function meridian_LevelUp(nLevel)
    KsgPlayer:MeridianLevelUp(nLevel)
end