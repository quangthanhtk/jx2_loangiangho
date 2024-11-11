--�ຣ����
Include("\\script\\missions\\yp\\award.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\lib\\message.lua");

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

g_NpcName = "<color=green>Thanh H�i Di�m Th��ng<color>: "

function main()
	local strtab = {
		"Ta mu�n giao ti�u/qhys_talk_1",
		--"Nh�n ph�n th��ng mua b�o hi�m/qhys_talk_2", --LongDaiKa: ��ng t�nh n�ng b�o hi�m ti�u
		"K�t th�c ��i tho�i/nothing"
	};
	Say(g_NpcName.."Ta l� ��i di�m th��ng c�a v�ng b� h� Thanh H�i, g�n ��y h�nh nh� c� r�t nhi�u ti�u c�a Tr�n Vi�n Ti�u C�c ��u b�t ngu�n t� ch� c�a ta, xem ra ta s�p ph�t t�i r�i.",
		getn(strtab),
		strtab)
end

function qhys_talk_1()
	local tNpcPos = { 6300, 1367, 3271 }
	if GetTask(TASK_FIELD_PVP_CAR_START) == 0 then
		Talk(1,"",g_NpcName.."Ng��i ch�a nh�n nhi�m v� Ti�u Xa!");
		return 0;
	end
	local nNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nNpcID = GetTask(TASK_FIELD_PVP_CAR_ID);
	local nAwardType = GetTask(TASK_FIELD_PVP_CAR_RAND);
	local nDouble = GetTask(TASK_FIELD_PVP_CAR_DOUBLE);
	local nCurNpcID = GetNpcID(nNpcIdx);
	if nNpcIdx == 0 or nNpcID ~= nCurNpcID then
		Talk(1,"",g_NpcName.."Ti�u Xa c�a ng��i b� ph� h�y ho�c qu� th�i gian v�n ti�u v�n ch�a ��n ��ch, v�n ti�u th�t b�i!");
		SetTask(TASK_FIELD_PVP_CAR_RAND,0)
		SetTask(TASK_FIELD_PVP_CAR_START,0);
		SetTask(TASK_FIELD_PVP_CAR_IDX,0);
		SetTask(TASK_FIELD_PVP_CAR_ID,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFE,0);
		SetTask(TASK_FIELD_PVP_CAR_DOUBLE,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFETIME,0);
		return 0;
	end
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nNpcIdx);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	local nNpcDistance = abs(nPosX-tNpcPos[2])+abs(nPosY-tNpcPos[3]);
	if nMapID ~= tNpcPos[1] or nNpcDistance > 40 then
		Talk(1,"",g_NpcName.."��i hi�p ch�y qu� xa r�i!");
		return 0;
	end	
	if nMapID ~= nNpcMapID or nDistance > 16 then
		Talk(1,"",g_NpcName.."Ti�u Xa c�a ��i hi�p v�n ch�a giao ��n, h�y nhanh ch�ng �i ki�m tra!")
		return 0;
	end
	if gf_Judge_Room_Weight(5,200,"") ~= 1 then
		return 0;
	end	
	SetTask(TASK_FIELD_PVP_CAR_RAND,0)
	SetTask(TASK_FIELD_PVP_CAR_START,0);
	SetTask(TASK_FIELD_PVP_CAR_IDX,0);
	SetTask(TASK_FIELD_PVP_CAR_ID,0);
	SetTask(TASK_FIELD_PVP_CAR_LIFE,0);
	SetTask(TASK_FIELD_PVP_CAR_DOUBLE,0);
	SetTask(TASK_FIELD_PVP_CAR_TB,0);
	SetTask(TASK_FIELD_PVP_CAR_LIFETIME,0);
	SetNpcRemoveScript(nNpcIdx,"");
	SetNpcLifeTime(nNpcIdx,0);
	-----
	--������
	yp_aw_giveAward_14(nAwardType,nDouble+1);
	-----
	Talk(1,"",g_NpcName.."��i hi�p qu� l� c� th�n th� t�t, qu�ng ���ng xa nh� th� m� v�n ti�u ��n ��y nhanh th� n�y, v�t v� r�i, m�i ng��i ngh� ng�i!")	
end

function qhys_talk_2()
	local nTouBao = GetTask(TASK_FIELD_PVP_CAR_TB);
	local nState = GetTask(TASK_FIELD_PVP_CAR_START);
	if nState == 0 and nTouBao ~= 0 then
		if gf_Judge_Room_Weight(5,200,"") ~= 1 then
			return 0;
		end
		SetTask(TASK_FIELD_PVP_CAR_TB,0);
		yp_aw_giveAward_16(nTouBao);
	elseif nState ~= 0 then
		Talk(1,"",g_NpcName.."Ti�u Xa c�a ng��i ch�a b� ph� h�y, h�y y�n t�m v�n chuy�n Ti�u Xa ��n ��y n�o!");
	elseif nTouBao == 0 then
		Talk(1,"",g_NpcName.."Ng��i ch�a mua b�o hi�m cho Ti�u Xa, ��nh l�a ta giao ph�n th��ng mua b�o hi�m �!");
	end
end