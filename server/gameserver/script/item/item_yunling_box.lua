--ǧ�����Ʒ�ű�
Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\global\\bit_task_support.lua")
Import("\\script\\lib\\globalfunctions.lua")

t_item_para = 
{
	2,1,30494,"T� �o Thi�n Bi�n Ti�u",
}

function OnUse(nItemIndex)
	if IsSubSystemOpen(SYS_SWITCH_QIANBIAN_BOX) == 1 then
		SendScript2Client('Open([[Collection]]);')
	else
		Say("T� �o Thi�n Bi�n Ti�u t�m ch�a m�", 1, "\nTa bi�t r�i/no")
	end
end

function no()
end

function NpcTalkMain()
	local tbSay = {}
	local szTitle = ""

	szTitle = format("Ta c� T� �o Thi�n Bi�n Ti�u d� d�ng mua v� l�u tr� ngo�i trang.")
	tinsert(tbSay, "Nh�n T� �o Thi�n Bi�n Ti�u/_npc_get_box")
	tinsert(tbSay, "T�m hi�u v� T� �o/_about")
	tinsert(tbSay, "Ra kh�i/no")

	Say(szTitle, getn(tbSay), tbSay)
end

function _about(nIndex)
	nIndex = nIndex or 1
	local tbSay = {}
	local tMsg = {
		"T� �o Thi�n Bi�n Ti�u l� n�i t�ng h�p <color=yellow>ngo�i trang, th� c��i, trang s�c<color> v� qu�n l� <color=yellow>�i�m quy�n r�<color>, ng��i ch�i c� th� m� T� �o Thi�n Bi�n Ti�u �� xem, mua, thu th�p v�t ph�m ngo�i trang.",
		format("<color=yellow>%s<color>:%s", "Ngo�i trang", "Ti�u <color=yellow>�i�m Th��ng Ti�u Y Ph��ng<color> mua ngo�i trang. Mua ngo�i trang <color=yellow>v�nh vi�n<color> s� t� ��ng l�u tr� ho�c l�u tr� v�o t� �o. Ngo�i trang �� l�u tr� c� th� l�y ra kh�ng gi�i h�n s� l�n. Khi l�y ra c� th� th�ng qua T� �o Thi�n Bi�n Ti�u �� ti�n h�nh u�n linh (U�n linh �� l�u tr�)."),
		format("<color=yellow>%s<color>:%s", "Th� c��i", "Ti�u <color=yellow>xu v�t ph�m<color> �� mua ho�c �em th� c��i <color=yellow>v�nh vi�n<color> l�u tr� v�o t� �o. Th� c��i �� l�u tr� c� th� l�y ra kh�ng gi�i h�n s� l�n."),
		format("<color=yellow>%s<color>:%s", "Trang s�c �eo h�ng", "Ti�u <color=yellow>�i�m Phong Hoa<color> �� mua. Mua trang s�c v�nh vi�n s� t� ��ng l�u tr� ho�c �em <color=yellow>trang s�c v�nh vi�n<color> l�u tr� v�o t� �o. Trang s�c �� l�u tr� c� th� l�y ra kh�ng gi�i h�n s� l�n."),
		format("%s", "<color=red>V�t ph�m l�y ra t� T� �o Thi�n Bi�n Ti�u ��u c� h�n s� d�ng 30 ng�y, kh�ng th� giao d�ch<color>"),
	}

	tinsert(tbSay, "tr� l�i/NpcTalkMain")
	if nIndex < getn(tMsg) then
		tinsert(tbSay, format("%s/#_about(%d)", "Trang k�", nIndex+1))
	end
	tinsert(tbSay, "Ra kh�i/no")
	local szTitle = format("<color=green>%s:<color>\n%s", "T� �o Thi�n Bi�n Ti�u", tMsg[nIndex])
	Say(szTitle, getn(tbSay), tbSay)
end

function _npc_get_box()
	get_qianbian_box(1)
end

function get_qianbian_box(bNotify)
	if GetItemCount(t_item_para[1],t_item_para[2],t_item_para[3]) <= 0 then
		if gf_Judge_Room_Weight(1,100,"") == 1 then
    		AddItem(t_item_para[1],t_item_para[2],t_item_para[3],1,4)
    		bt_SetBitTask(N_BIT_TASK_INDEX_SHOW_QIANBIANHE_MSG, 1)
    		--�Զ�ѧ��3����ʼ����
    		if GetPlayerCollectionData(2,1) == 0 then
    			SetPlayerCollectionData(2, 1, 1)
    			SetPlayerCollectionData(2, 2, 1)
    			SetPlayerCollectionData(2, 3, 1)
    		end
    		if bNotify==1 then
    			Msg2Player(format("C�c h� �� nh�n ���c %s.", t_item_para[4]))
    		end
    		return 1
    	end
	end
	return 0
end

function show_yunling_box_login_message()
	if IsSubSystemOpen(SYS_SWITCH_QIANBIAN_BOX) == 1 then
    	if bt_GetBitTask(N_BIT_TASK_INDEX_SHOW_QIANBIANHE_MSG) == 0 then
    		if get_qianbian_box(0) == 1 then
    			local tbSay = {}
            	local szTitle = format("B�n �� nh�n ���c<color=yellow>[T� �o Thi�n Bi�n Thi�u]<color>, th�ng qua t� �o n�y, c�c b�n c� th� th� v� mua c�c lo�i ngo�i trang ��p. �i�m th��ng d�ng �� mua ngo�i trang c� b�n trong Ng� C�c. \n N�u b�n l� tay m�t t� �o, c� th� t�m<color=yellow>L�u T� Anh � R��ng Ch�u<color> nh�n l�i.")
            	tinsert(tbSay, format("%s/nothing", "Bi�t r�i!"))
            	Say(szTitle, getn(tbSay), tbSay)
    		end
    	end
	end
end
