--IB��Ʒ��С��������Ƭ
--��������������ʹ�ñ���Ʒѡ�񲢶һ���Ӧ��ʦ���ؼ�
--�����д�ˣ��Թ�
--�����дʱ�䣺2007��1��23��
--�߻��ˣ�����
Include("\\script\\online\\zgc_public_fun.lua")
goods_num = 10
dabaoyuntiesuipian_id = 30788
--**********************************��Ʒʹ��������************************************
function OnUse(goods_index)
	local isBind = GetItemSpecialAttr(goods_index,"BIND")
	Say("B�n mu�n d�ng H�p M�nh Thi�n Th�ch (Nh�) �� ��i M�nh Thi�n Th�ch"..goods_num.."?",
	2,
	format("��i/#use_determine(%d)",isBind),	
	"�� suy ngh�/end_dialog")
end
function use_determine(isBind)
	if GetItemCount(2,1,dabaoyuntiesuipian_id) == 0 then
		Talk(1,"end_dialog","H�y ki�m tra trong t�i c� <color=red>H�p M�nh Thi�n Th�ch (Nh�)<color> kh�ng!")
		return
	end
	if Zgc_pub_goods_add_chk(5,500) ~= 1 then
		return
	end
	if DelItem(2,1,dabaoyuntiesuipian_id,1) ~= 1 then
		Talk(1,"end_dialog","H�y ki�m tra trong t�i c� <color=red>H�p M�nh Thi�n Th�ch (Nh�)<color> kh�ng!")
		return
	end
	local add_flag = 0
	if isBind == 1 then
		add_flag,_idx = AddItem(2,2,7,goods_num,4)
	else
		add_flag,_idx = AddItem(2,2,7,goods_num,5)
	end
	if add_flag == 1 then
		Msg2Player("Ch�c m�ng b�n �� d�ng H�p M�nh Thi�n Th�ch (Nh�) �� ��i"..goods_num.." m�nh Thi�n Th�ch!")
	else
		WriteLog(GetName().."use xiaoheyuntieshuipian fail :"..add_flag)
	end
end
