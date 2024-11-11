--���һЩ���ý�������
Import("\\script\\lib\\globalfunctions.lua")

function Vet_Complete_Revive_OnePartner_FirstStage_check()
	return 1;
end

function Vet_Complete_Revive_OnePartner_FirstStage()
	--complete by veit
	--finish first stage
	--
end

function Vet_Complete_Revive_OnePartner_SecondStage_check()
	--complete by veit
	--
	return 0;
end

function Vet_Complete_Revive_OnePartner_SecondStage(nTaskId, nBitIdx)	--(nActivityID,nTaskGrouId,nTaskIDSeq)
	nTaskId = nTaskId or 0
	nBitIdx = nBitIdx or 0
	
	local nCheck = GetBit(GetTask(2765),1)--GetTask(nTaskIdFinalPrize1)
	if nCheck >= 1 then
		Talk(1,"","B�n �� nh�n ph�n th��ng cu�i khi s� d�ng t�i �a v�t ph�m r�i.")
		return 0
	end
	local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10)
	if mod(nIsPS,10) >= 1 then
		Talk(1,"","B�n ��ng h�nh �� ph�c sinh r�i n�n kh�ng th� nh�n ph�n th��ng n�y.")
		return 0
	end
--	local tbActivity = TB_VN_ACTIVITY_MAIN[nActivityID];
	
--	if not tbActivity then return end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
	 return
	end
	local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
	if nCurGodPoint < 200 then
		Talk(1,"","B�n ��ng h�nh ch�a �� 200 �i�m linh l�c")
		return 0
	end
--	if GetItemCount(2,1,30603) < 999 then
--		Talk(1,"","Ti�u Dao Ng�c trong t�i kh�ng �� 999 c�i")
--		return
--	end
	local checka = VNG_GetTaskPos(TSK_PET_PS_GIAIDOAN_A,10,5)
	local checkb = VNG_GetTaskPos(TSK_PET_PS_GIAIDOAN_B,10,3)	
--	if checka < 160160 or checkb < 3303030 then
--		Talk(1, "", "B�n ch�a ho�n th�nh giai �o�n 1 nhi�m v?ph�c sinh b�n ��ng h�nh n�n kh�ng th?nh�n ph�n th��ng !!!!")
--		return 0
--	end	

--	gf_WriteLogEx(EVENT_LOG_TITLE, "��i ph�n th��ng cu�i c�ng", 2500, "Ti�u hao Ti�u Dao Ng�c ho�n th�nh giai �o�n 2 c�a ph�c sinh ��ng h�nh");		
	--��������ȡ���
--	Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);
	local szNpcName = "<color=green>S� ki�n Event th�ng 11<color>: "
	local tSay = {}
	local tHeader = szNpcName.." ��i hi�p h�y ch�n h��ng Ph�c Sinh cho B�n ��ng H�nh c�a m�nh."
	tinsert(tSay, format("H� tr� h� N�i C�ng/#add_buffEvent2(1,%d,%d)",nTaskId, nBitIdx))		
	tinsert(tSay, format("H� tr� h� Ngo�i C�ng/#add_buffEvent2(2,%d,%d)",nTaskId, nBitIdx))		
	--tinsert(tSay, "H?tr?h?Ngo�i C�ng/#add_buffEvent(2,tbActivity.nActivityID..","..nTaskGrouId..","..nTaskIDSeq..")")	

	--tinsert(tSay, "Ta ch?gh?qua th�i/nothing")
	Say(tHeader, getn(tSay), tSay)	
	return 1
end

function add_buffEvent2(nWay)
	local nCheck = GetBit(GetTask(2765),1)--GetTask(nTaskIdFinalPrize1)
	if nCheck >= 1 then
		Talk(1,"","B�n �� nh�n ph�n th��ng cu�i khi s� d�ng t�i �a v�t ph�m r�i.")
		return 0
	end
	local tNoiNgoai = {
			 [1] = {
						{"N�i C�ng 6%", "state_m_attack_percent_add", 6},
						{"Sinh L�c +6000", "state_life_max_point_add", 8000},
						{"Sinh L�c 6%", "state_life_max_percent_add", 6},
						{"Kh�ng t�t c?+12", "state_add_allability", 12}, 
					},
			[2] = {
						{"Ngo�i C�ng 12%", "state_p_attack_percent_add", 12},
						{"Sinh L�c +6000", "state_life_max_point_add", 10000},
						{"Sinh L�c 6%", "state_life_max_percent_add", 6},
						{"N�i ph�ng/Ngo�i ph�ng +60", "state_i_defence_point_add", 60},
						{"Ngo�i ph�ng +60", "state_o_defence_point_add", 60},
					},
				}
	local t_pet_type = {
									[1] = {"Th?tr�ng",3333,24},
									[2] = {"Th?x�m",3333,25},
									[3] = {"Th?�en",3334,26},		
								}	
--	if GetItemCount(2,1,30603) < 999 then
--		Talk(1,"","Ti�u Dao Ng�c trong t�i kh�ng �� 999 c�i")
--		return
--	end								
--	if DelItem(2,1,30603,999) ~= 1 then
--		return 0;
--	end								
	--Vet_Activity_SetItemUseInfo(nTaskGrouId,nTaskIDSeq,tbActivity.nGetBothFinalPrize,1);		
	SetTask(2765,SetBit(GetTask(2765),1,1));	--SetTask(2786,1)	--nh�n ph�n th��ng cu�i 
	
--	gf_SetTaskBit(nTaskId, nBitIdx, 1)--Set awawd bit, avoid repeat get award
	
--	Vet_Activity_SetItemUseInfo(self.tbTaskGroup[1],self.tbTaskGroup[2],tbPrizeInfo.nTaskIdGetFinalPrize,1)
--	self:GiveItemPrize(tbPrizeInfo.tbFinalPrize,format(self.tbHintString[10][3],tbPrizeInfo.tbItemInfo[4]))
	---------------
	SetTask(TSK_PET_PS_GIAIDOAN_B, GetTask(TSK_PET_PS_GIAIDOAN_B) + 1) --t�ng b��c nhi�m v?l�n gi?tr?3 l?ho�n th�nh xong giai �o�n 2
	gf_WriteLogEx("PHUC SINH PET", "xong giai �o�n 2", 1, "Ho�n th�nh Giai �o�n 2")												
		local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10) --mod 10 l?gi?tr?x�c ��nh c?Ph�c Sinh PET 
		nIsPS = (nIsPS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
		SetTask(TSK_PET_PS_GIAIDOAN_B, nIsPS) --set gi?tr?x�c ��nh c?Ph�c Sinh PET
		-------------
		local nCount_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10)
		nCount_PET_PS = (nCount_PET_PS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_A),10) 
		SetTask(TSK_PET_PS_GIAIDOAN_A, nCount_PET_PS) --set gi?tr?x�c ��nh s?l�n Ph�c Sinh PET
		-------------
		local nNewValue =  SetBytePos(GetTask(TSK_PET_PS_GIAIDOAN_A),nWay,4)
		SetTask(TSK_PET_PS_GIAIDOAN_A, nNewValue ) -- set h��ng Ph�c Sinh c�a PET
		-------------Set c�c ch?s?buff
		local nAttrId = 2908130 --29/08/13 + x
		for i = 1, getn(tNoiNgoai[nWay]) do
			CastState(tNoiNgoai[nWay][i][2], tNoiNgoai[nWay][i][3], -1, 1, nAttrId);
			nAttrId = nAttrId + 1;
		end		
		------------- add PET m�i
		local nRand = gf_GetRandItemByTable(t_pet_type,10000,1)
		local nNewType = t_pet_type[nRand][3]
		local nResult = AddPet(nNewType)
		if nResult >= 0 then
			Msg2Player("Ch�c m�ng ��i hi�p �� chi�u m?PET th�nh c�ng")
		else
			gf_WriteLogEx("PHUC SINH PET BK", "add th�t b�i", 1, "Add pet th�t b�i")			
		end
		-------------
		Msg2Player("Ch�c m�ng ��i hi�p �� ho�n th�nh nhi�m v� Ph�c Sinh cho B�n ��ng H�nh !!!!")		
		gf_WriteLogEx("PHUC SINH PET BK", "xong giai �o�n 2", 1, "Ho�n th�nh Giai �o�n buff")			

end
