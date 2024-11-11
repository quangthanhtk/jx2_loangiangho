Include("\\script\\misc\\fair\\fair.lua")
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
function OnUse(nItemIdx)
    local nPlayerLevel = GetLevel()
    local nTrans = gf_GetTransCount();
    local nTotallevel = nTrans * 100 + nPlayerLevel;
    if nTotallevel < 1099 then
        Talk(1, "", "C�n ��t CS 10 Lv99 m�i m� H�a C�nh")
        return
    end
    SetTask(TASKID_FAIR_UP_FLAG, 1)
    DelItemByIndex(nItemIdx, 1)
    Msg2Global(format("Ch�c m�ng [%s] v��t qua th� th�ch, m� c�p H�a C�nh!", GetName()))
    Talk(1, "", "Ch�c m�ng m� c�p <color=yellow>H�a C�nh<color>! C� th� v�o <color=green>giao di�n nh�n v�t<color>, trang <color=yellow>H�a C�nh<color> �� xem v� t�ng sao H�a C�nh!")
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end