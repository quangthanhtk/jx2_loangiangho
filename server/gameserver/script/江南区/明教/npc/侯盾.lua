--�ű����ܣ��������ŶԻ�����
--������ƣ�������
--���ܿ������峤
--����ʱ�䣺2009-3-13
NPC_NAME = "<color=green>H�u ��n<color>:"
function main()
	if GetTask(1018) ==2 and BigGetItemCount(2,0,781) == 0 then
		if GetItemCount(2,0,780) == 0 then
			Talk(1,"",NPC_NAME.."Kh�ng c� H�a Chung l�m sao l�y H�a Ch�ng, h�y t�m <color=green>Ph��ng Th�t Ph�t<color> (185/189) l�y H�a Chung!")
		else
			Talk(1,"",NPC_NAME.."��y l� <color=yellow>Thanh T�nh H�a Chung<color>, h�y c�m l�y. Ti�p theo h�y �i t�m <color=green>V��ng D�n<color> (195/189).")
			DelItem(2,0,780,1)
			AddItem(2,0,781,1)
			SetTask(1018,3)
			TaskTip("T�m ��i V�n Ph�p V��ng-V��ng D�n l�y Quang Minh H�a Ch�ng")
			Msg2Player("T�m ��i V�n Ph�p V��ng-V��ng D�n (195/189) l�y Quang Minh H�a Ch�ng")
		end
	elseif GetTask(1018) ==3 then
		Talk(1,"",NPC_NAME.."V��ng D�n (195/189) � ph�a tr��c.")
	else
		if random(1000) == 137 then
			Talk(1,"",NPC_NAME.."T�m ta c� vi�c g�?")
		else
			Talk(1,"",NPC_NAME.."Thanh T�nh, Quang Minh, ��i L�c, Tr� Tu�' l� gi�o ngh�a c�a b�n gi�o, Th�nh H�a H�a Ch�ng do ta v� 3 Ph�p V��ng qu�n l�.")
		end
	end
end
