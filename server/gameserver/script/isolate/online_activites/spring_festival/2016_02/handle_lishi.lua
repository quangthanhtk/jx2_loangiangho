--
-- Author: Zheng Jinke
-- Date: 2015-12-28 14:10:00
--

Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\stringtable.lua")			-- ����ַ�����
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\award.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

------------------------------������ȡ(��Ѳ���)------------------------------
function do_get_award()
	local flag = get_task("id_get_lishi")
	if flag == 1 then 
		Talk(1,"","<color=gold>��i S� Ho�t ��ng:<color> Trong th�i gian ho�t ��ng m�i ng��i ch� nh�n ���c 1 l�n l� x�.!")
		return false;
	end
	if gf_Judge_Room_Weight(1,100,"") ~= 1 then
		return false;
	end
	
	AddItem(2,1,31006,1)
	set_task("id_get_lishi",1)
	Talk(1,"","<color=gold>��i S� Ho�t ��ng:<color> L� x� �� ch�ng t� t�m l�ng, cung ch�c t�n xu�n, ch�c c�c ��i hi�p v�n s� nh� �, s� nghi�p thu�n l�i, s�c kh�e d�i d�o!")
end

function handle_use_xinnianlishi( Itemidx )
	handle_on_use_award( Itemidx )
end

