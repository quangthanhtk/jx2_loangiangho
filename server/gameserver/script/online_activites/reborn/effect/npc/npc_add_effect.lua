----------------[��˵����Ӧ����һ������]----------------
--------------------------------------------------------
--�ű�����:��������NPC���Ի��ű�                       |
--�ű�����:��������NPC�������                         |
--���ܿ�����:�����                                    |
--���ܿ���ʱ�䣺2009-12-28                             |
--��Ҫ�޸ļ�¼��                                       |
--------------------------------------------------------
Include("\\script\\online_activites\\reborn\\effect\\head.lua")
Include("\\script\\online_activites\\reborn\\effect\\npc\\npc_add_effect_weapon.lua")
Include("\\script\\online_activites\\reborn\\effect\\npc\\npc_add_effect_cloth.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\nhiemvudonghanh.lua")

-----------------------------------------npc�ű����-----------------------------------------
-- 20190920 �����������鹦����ڹر�

function main()
    local tbSays = {
         VIE_201005_REBORN_STR_NpcDialog[0][2].."/weapon_effect",          --�����������
        --VIE_201005_REBORN_STR_NpcDialog[0][3].."/cloth_effect",           --��װ������� 201607��ֲ��Ƿ��йر�
        VIE_201005_REBORN_STR_NpcDialog[0][4].."/gf_DoNothing"            --�պ���
    };
    -- Say(VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[0][1], getn(tbSays), tbSays);
    local szTitleReplace = "H�m nay c� hi�n t��ng l�, ph�a sa m�c xu�t hi�n nhi�u Y�u Ma. �� t� C�n L�n ph�i g�nh v�c tr�ch nhi�m tr�m y�u tr� ma!"
    Say(VIE_201005_REBORN_STR_NpcName..szTitleReplace, getn(tbSays), tbSays);
end