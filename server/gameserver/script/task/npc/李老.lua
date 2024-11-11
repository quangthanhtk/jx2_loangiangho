Include("\\script\\task\\global_task\\task_id.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\isolate\\functions\\longmenhotel\\main.lua")
function main()
--		if tGtTask:check_cur_task(13) == 1 and GetTask(Task_id_004) == 1 then
--			--if DelItem(2,0,30010,1) == 1 and DelItem(2,0,30028,1) == 1 then
--			--	Talk(2,"","<color=green>���ϣ�<color>��л"..tSex.."���������壬���ɢ������ɢ�����Ұɣ���ȥ���Ȱ��գ�","<color=green>"..GetName()..":<color>��!");
--			--	SetTask(Task_id_004,GetTask(Task_id_004)+1);
--			--end
--		else
	if GetTask(LM_TSKID_FINISH_PRETASK) == 0 then
		Talk(1,"",format("<color=green>%s<color>:".."Ch�o m�ng ��n nh� ta ch�i!", GetTargetNpcName()));
	else
		local szTitle = format("<color=green>%s<color>: �� l� c�ng h�i c�ng thuy�n, ch� ta c� v�i th� c� th� gi�p ���c ng��i!", GetTargetNpcName())
		local tbSay = {}
		tinsert(tbSay, "Mua 1 B�nh ��c Ch�: ti�u hao 500 v�ng/buy_banhdacche")
		tinsert(tbSay, "C�a H�ng U�n Linh 8/open_shop")
		tinsert(tbSay, "H�y b�/nothing")
		Say(szTitle, getn(tbSay), tbSay)
		
	end
		--end
end

function open_shop()
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", 3115, "Ti�m Qu�n Tr� Long M�n"));
end

function buy_banhdacche()
	local szNpcName = "<color=green>L� L�o: <color>"
	local nCount = VNG_GetTaskPos(TSK_BUY_BANHDACCHE, 2, 1)
	if nCount >= 30 then
		Talk(1,"",szNpcName.."H�m nay ��i hi�p �� mua �� 30 l�n r�i, ng�y mai h�y quay l�i !")
		return
	end
	if gf_Judge_Room_Weight(2,200) ~= 1 then
		Talk(1,"",szNpcName.."H�nh trang c�a c�c h� kh�ng �� � tr�ng ho�c �� n�ng!")
		return
	end
	if GetCash() < 500*10000 then
		Talk(1, "", szNpcName.."��i hi�p kh�ng mang theo �� 500 V�ng.")
		return 0
	end
	if Pay(500*10000) == 1 then
		VNG_SetTaskPos(TSK_BUY_BANHDACCHE, nCount + 1, 2, 1)
		gf_AddItemEx2({2,1,31319,1}, "b�nh ��c ch�", "MUA BANH DAC CHE", "Mua b�nh ��c ch�")
	end
end