--IB��Ʒ����ת�ػ굤����
--��������������
--�����д�ˣ���־��
--�����дʱ�䣺2008��6��18��

Include("\\script\\online\\zgc_public_fun.lua")
goods_num = 3
dabaoyuntie_id = 3380
--**********************************��Ʒʹ��������************************************
function OnUse(goods_index)
	local isBind = GetItemSpecialAttr(goods_index,"BIND")
	Say("B�n c� mu�n d�ng C�u Chuy�n H�i H�n ��n Bao ��i C�u Chuy�n H�i H�n ��n"..goods_num.."?",
	2,
	format("��i/#use_determine(%d)",isBind),
	"�� suy ngh�/end_dialog")
end
function use_determine( isBind )
	if GetItemCount(2,1,dabaoyuntie_id) == 0 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c� <color=red>C�u Chuy�n H�i H�n ��n Bao<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(1,30) ~= 1 then
		return
	end
	if DelItem(2,1,dabaoyuntie_id,1) ~= 1 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c� <color=red>C�u Chuy�n H�i H�n ��n Bao<color>!")
		return
	end
	local add_flag = 0;
	if isBind == 1 then
		add_flag = AddItem(1,0,32,goods_num,4)
	else
		add_flag = AddItem(1,0,32,goods_num,5)
	end
	if add_flag == 1 then
		Msg2Player("Ch�c m�ng b�n d�ng C�u Chuy�n H�i H�n ��n Bao ��i "..goods_num.." C�u Chuy�n H�i H�n ��n!")
	else
		WriteLog(GetName()..":D�ng C�u Chuy�n H�i H�n ��n Bao ��i C�u Chuy�n H�i H�n ��n th�t b�i, v� tr� th�t b�i:"..add_flag)
	end
end
