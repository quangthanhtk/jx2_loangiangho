--���ɵ���ƷNPC
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\global_task\\gtask_head.lua")
	
tNpcInfo = {
"H�c y nh�n: C�n th�n! ��ng ��ng v�o c�i g�i ��!",
"H�c y nh�n: �i, xem ra tr� r�i, ��c t� �� b�t ��u lan ra.",
"H�c y nh�n: H�y c�m l�y thu�c gi�i n�y, ��i sau khi ��u �c t�nh t�o h�y nhanh ch�ng u�ng v�o, c� th� gi� l�i t�nh m�ng.",
	}
function main()
	if gf_JudgeRoomWeight(1,10,"V�t ph�m kh� nghi") ~= 1 then
			return 0;
	end
	if tGtTask:check_cur_task(917) == 1 then
		if gf_GetTaskByte(TASKID_SW_CHECK_DOUBTFUL_GOODS,1) == 1 then return 0; end; 
		local nNpcIdx = CreateNpc("Tuy�t t�nh","H�c y nh�n",604,1482,2831); 
		SetNpcLifeTime(nNpcIdx,15);        
		nNpcIdx = CreateNpc("Tuy�t t�nh","H�c y nh�n",604,1481,2824);
		SetNpcLifeTime(nNpcIdx,15);
		local nNpcIdx = CreateNpc("Tuy�t t�nh","H�c y nh�n",604,1484,2823);
		SetNpcLifeTime(nNpcIdx,15);
		CastState("state_lost_life_per18",150,18*30,0,1); --���ÿ���Ѫ10%
		gf_AddItemEx({2,96,111,1,4},"Thu�c gi�i c�a h�c nh�n");
		gf_SetTaskByte(TASKID_SW_CHECK_DOUBTFUL_GOODS,1,1) 
		Talk(3,"",tNpcInfo[1],tNpcInfo[2],tNpcInfo[3]);
		return 0;
	end
	if tGtTask:check_cur_task(918) == 1 then
		if gf_GetTaskByte(TASKID_SW_CHECK_DOUBTFUL_GOODS,2) == 1 then return 0; end;
		gf_AddItemEx({2,96,112,1,4},"Chi�c h�p �� b� m� ra");
		gf_SetTaskByte(TASKID_SW_CHECK_DOUBTFUL_GOODS,2,1)
	end
end
