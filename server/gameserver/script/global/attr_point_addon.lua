Include("\\settings\\static_script\\meridian\\meridian_payer_login.lua")
Include("\\script\\misc\\fair\\fair.lua")

t_funcAttrPointList = {
    [1] = onlogin_fix_meridian_attr_point_addon, --�Զ��޸�����������Ǳ�ܵ�������չ,�Դ���ʼ������=.=
    [2] = onlogin_fair_attr_point_addon, -- ����������Ǳ�ܵ�������չ
}


function Update_Player_Attr_Point_Addon()
    for i = 1, getn(t_funcAttrPointList) do
        t_funcAttrPointList[i]()
    end
end
