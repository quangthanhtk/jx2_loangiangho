--�ű����ƣ���װ����Ľ���
--�ű����ܣ�
--���ܲ߻���
--���ܿ���������
--����ʱ�䣺2010-03-09
--�����޸ļ�¼

function ShowHelp()
	local szTitle	= "C�c h� c� bi�t kh�ng?"
	local tMenu	= {
		"Ta bi�t r�i /nothing",
	};

	Say(szTitle, getn(tMenu), tMenu);
end

function ShowHelp_Ex()
	local szTitle	= "C�c h� �� bi�t r�i??"
	local tMenu	= {
		"Ta bi�t r�i /nothing",
	};

	Say(szTitle, getn(tMenu), tMenu);
end

function ShowHelp_Coat()
	local szTitle	= "";
	szTitle = szTitle.."    Ngo�i trang sau khi ���c l�u tr�, v�t ph�m s� <color=yellow>bi�n m�t<color> v� ���c ghi nh� v�o 'T� �o Nh�', ���c l�y ra kh�ng gi�i h�n s� l�n nh�ng s� bi�n th�nh v�t ph�m kh�a, <color=yellow>kh�ng th� giao d�ch<color>, sau khi l�y ra c� h�n s� d�ng 30 ng�y.\n";
	szTitle = szTitle.."    U�n Linh sau khi ���c l�u tr�, v�t ph�m s� <color=yellow>bi�n m�t<color> v� ���c ghi nh� v�o giao di�n 'U�n Linh''. Khi mua Ng� Hi�n Thi�n Bi�n H�p v� l�y ngo�i trang ra, kh�c v�o hi�n qu� U�n Linh, c� th� d�ng kh�ng gi�i h�n s� l�n.\n";
	szTitle = szTitle.."    �i�u ki�n l�u tr� ngo�i trang: V�t ph�m b�n � <color=yellow>T� �o Thi�n Bi�n Ti�u<color> c� t�nh ch�t <color=yellow>v�nh vi�n<color> v� v�t ph�m ngo�i trang <color=yellow>v�nh vi�n<color> nh�n ���c trong game ��u c� th� l�u tr�. Kh�ng th� l�u tr� U�n Linh chuy�n sinh.\n";
	--szTitle = szTitle.."    ��������ѧϰ������ȥ������������˴�ѧϰ���ѯ��\n";
	szTitle = szTitle.."\n<color>";
	Say(szTitle, 1, {"Ta bi�t r�i /nothing"});
end

function ShowHelp_Coat_Ex()
	local szTitle	= "";
	szTitle = szTitle.."    Ngo�i trang sau khi ���c l�u tr�, v�t ph�m s� <color=yellow>bi�n m�t<color> v� ���c ghi nh� v�o 'T� �o Nh�', ���c l�y ra kh�ng gi�i h�n s� l�n, sau khi l�y ra c� h�n s� d�ng 30 ng�y.\n";
	szTitle = szTitle.."    U�n Linh sau khi ���c l�u tr�, v�t ph�m s� <color=yellow>bi�n m�t<color> v� ���c ghi nh� v�o giao di�n 'U�n Linh'. Khi mua Ng� Hi�n Thi�n Bi�n H�p v� l�y ngo�i trang ra, kh�c v�o hi�n qu� U�n Linh, c� th� d�ng kh�ng gi�i h�n s� l�n.\n";
	szTitle = szTitle.."    �i�u ki�n l�u tr� ngo�i trang: V�t ph�m b�n � <color=yellow>T� �o Thi�n Bi�n Ti�u<color> c� t�nh ch�t <color=yellow>v�nh vi�n<color> v� v�t ph�m ngo�i trang <color=yellow>v�nh vi�n<color> nh�n ���c trong game ��u c� th� l�u tr�. Kh�ng th� l�u tr� U�n Linh chuy�n sinh.\n";
	--szTitle = szTitle.."    ��������ѧϰ������ȥ������������˴�ѧϰ���ѯ��\n";
	szTitle = szTitle.."\n";
	Say(szTitle, 1, {"Ta bi�t r�i /nothing"});
end

function ShowHelp_Horse()
	local szTitle	= "";
	szTitle = szTitle.."    Th� c��i sau khi ���c l�u tr�, v�t ph�m s� <color=yellow>bi�n m�t<color> v� ���c ghi nh� v�o 'Chu�ng Ng�a Nh�', ���c l�y ra kh�ng gi�i h�n s� l�n, sau khi l�y ra c� h�n s� d�ng 30 ng�y.\n";
	szTitle = szTitle.."    Th� c��i sau khi ���c l�u tr�, l�y ra s� bi�n th�nh v�t ph�m kh�a, <color=yellow>kh�ng th� giao d�ch<color>.\n";
	--szTitle = szTitle.."    ��ʱ�޵����ﲻ�ܳ�����࣬�ʲ��ܱ��ղء�"
	szTitle = szTitle.."\n";
	Say(szTitle, 1, {"Ta bi�t r�i /nothing"});
end

ShowHelp_Horse_Ex	= ShowHelp_Horse;

--function ShowHelp_Follower()
--	local szTitle	= "";
--	szTitle = szTitle.."    �� ���豻�ղغ���Ʒ��<color=yellow>��ʧ<color>����¼����СС�޼����У������޴�ȡ����\n";
--	szTitle = szTitle.."    �� ���豻�ղغ��ٴ�ȡ����Ϊ����Ʒ��<color=yellow>���ɽ���<color>��\n";
--	szTitle = szTitle.."    �� ��ʱ�޵ĸ��費�ܳ�����࣬�ʲ��ܱ��ղء�"
--	szTitle = szTitle.."\n";
--	Say(szTitle, 1, {"��֪���� /nothing"});
--end

ShowHelp_Follower_Ex	= ShowHelp_Follower;

function ShowHelp_Ornament()
	local szTitle	= "";
	szTitle = szTitle.."    Trang s�c sau khi ���c l�u tr�, v�t ph�m s� <color=yellow>bi�n m�t<color> v� ���c ghi nh� v�o 'Tr�p Ng�c Nh�', ���c l�y ra kh�ng gi�i h�n s� l�n, sau khi l�y ra c� h�n s� d�ng 30 ng�y.\n";
	szTitle = szTitle.."    Trang s�c sau khi ���c l�u tr�, l�y ra s� bi�n th�nh v�t ph�m kh�a, <color=yellow>kh�ng th� giao d�ch<color>.\n";
	szTitle = szTitle.."    Trang s�c c� h�n s� d�ng kh�ng th� �eo tr�n ng��i th��ng xuy�n, n�n kh�ng th� l�u tr�."
	szTitle = szTitle.."\n";
	Say(szTitle, 1, {"Ta bi�t r�i /nothing"});
end

ShowHelp_Ornament_Ex	= ShowHelp_Ornament;

function nothing()
end
