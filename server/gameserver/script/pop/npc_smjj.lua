Include("\\script\\equip_shop\\equip_shop_head.lua");

function main()
	local strtab = {
			"Mua Ng� H�nh Thi�n Ngh�a B�n/buy_wuxingpan",
			"Mua Ng� H�nh Luy�n H�a Th�m V�t/buy_lianhuawu",
			"Ch� t�o �� Ng� H�nh/#show_equip_shop(46)",
			"K�t th�c ��i tho�i/nothing"
		};
	Say("<color=green>T� M� Thanh Thanh<color>: Ta �ang gi�p gia gia ph�n lo�i nguy�n li�u ng� h�nh, ��i ca/��i t�, c�n gi�p g� v�y?",
		getn(strtab),
		strtab)
end

--��������������
function buy_wuxingpan()
	Sale(146);
end

--�����������������
function buy_lianhuawu()
	Sale(145);
end

function nothing()
	
end

--��λ����������Ĳ���
function get_resource()
       Say("<color=green>T� M� Thanh Thanh<color>: Ng� H�nh Nguy�n Th�ch bao g�m: Ng� H�nh Nguy�n Th�ch (S�) v� Ng� H�nh Nguy�n Th�ch (Cao).<enter>    Nh�n Ng� H�nh Nguy�n Th�ch (S�): Tham gia Thi�n M�n Tr�n c� c� h�i nh�n ���c [Thi�n M�n Tr�n Qu�n Nhu Bao], m� Qu�n Nhu Bao nh�n ���c Ng� H�nh Nguy�n Th�ch (S�); c�ng c� th� d�ng �i�m t�ch l�y Thi�n M�n Tr�n �� ��i Ng� H�nh Nguy�n Th�ch (S�).<enter>    Nh�n Ng� H�nh Nguy�n Th�ch (Cao): Mua trong Ng� C�c [R��ng Ng� H�nh Nguy�n Th�ch (Cao)].", 1,"tr� l�i/main");
end