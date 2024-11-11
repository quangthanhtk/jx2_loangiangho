Include("\\script\\online\\2012\\qingming\\head.lua")

function OnUse(goods_index)
	if qm_check_date() ~= 1 then
		Talk(1,"", "H�y d�ng trong th�i gian c�a ho�t ��ng Ti�t Thanh Minh!");
		return 0;
	end
	--��ͼ	
	local map_ID,att_X,att_Y = GetWorldPos()
	if map_ID ~= 406 then				--�ڰݼ���ͼ��Ч
		Talk(1, "", "T�m ng��i ch�i mang theo 1 �H�p tro c�t (N� ��c th�n)� c�ng t� ��i ��n V� L�ng S�n (184, 197) ti�n h�nh h�p t�ng");
		return
	end
	if att_X < 1475 - 32 or att_X > 1475 + 32 or att_Y < 3156 - 32 or att_Y > 3156 + 32  then								--��������
		Talk(1,"","T�m ng��i ch�i mang theo 1 �H�p tro c�t (N� ��c th�n)� c�ng t� ��i ��n V� L�ng S�n (184, 197) ti�n h�nh h�p t�ng")
		return
	end
	
	if gf_JudgeRoomWeight(2, 100, "") ~= 1 then return end; -- �ж�
	
	if GetTeamSize() == 0 or GetTeamSize() == 1 then --�������
		if GetItemCount(2,95,832) ~= 0 then
			if DelItem(2, 95, 832, 1) ~= 1 then
				WriteLog("Trong ho�t ��ng Ti�t Thanh Minh 2012, x�a H�p tro c�t (N� ��c th�n) th�t b�i");
				return 
			end
			DoAward(8);
		else
			Talk(1, "", "Ng��i ch�a l�y ���c H�p tro c�t (N� ��c th�n), kh�ng th� ti�n h�nh h�p t�ng!");
		end
		return
	elseif GetTeamSize() > 2 then
		Talk(1, "", "S� ng��i trong t� ��i qu� nhi�u, kh�ng th� ho�n th�nh nhi�m v�.");
		return
	elseif GetTeamSize() == 2 then
		if GetTeamMember(0) ~= PlayerIndex then
			Talk(1, "", "Ch� c� ��i tr��ng m�i c� th� ti�n h�nh thao t�c!");
			return
		end
		
		local oldPlayerIndex = PlayerIndex;
		for i = 1,2 do 
			if GetTeamMember(i) ~= oldPlayerIndex then
				PlayerIndex = GetTeamMember(i);
				break;
			end
		end
		if GetItemCount(2, 95, 832) == 0 then
			PlayerIndex = oldPlayerIndex;
			Talk(1, "", "��ng ��i ch�a c� H�p tro c�t (N� ��c th�n), kh�ng th� ti�n h�nh h�p t�ng!");
			return
		else
				--���Ѳ���
				if gf_JudgeRoomWeight(2, 100, "") ~= 1 then return end; -- �ж�
				
				local nMapID, nMapx, nMapy = GetWorldPos();
				if map_ID ~= 406 or nMapx < 1475 - 32 or nMapx > 1475 + 32 or nMapy < 3156 - 32 or nMapy > 3156 + 32 then
					PlayerIndex = oldPlayerIndex;
					Talk(1, "", "Kho�ng c�ch ��ng ��i qu� xa, kh�ng th� ti�n h�nh h�p t�ng!");
					return
				end
			
				if DelItem(2, 95, 832, 1) ~= 1 then
					WriteLog("Trong ho�t ��ng Ti�t Thanh Minh 2012, x�a H�p tro c�t (N� ��c th�n) th�t b�i");
					return 
				end
				gf_SetLogCaption("[Ho�t ��ng Ti�t Thanh Minh 2012: Ch�a k�t h�n]");
				gf_AddItemEx({2,95,1329,1}, "D��ng Li�u Chi", 4);
			PlayerIndex = oldPlayerIndex;
			DoAward(4);
		end
	end
end

function DoAward(nCount)
	if DelItem(2, 95, 831, 1) ~= 1 then
		WriteLog("Trong ho�t ��ng Ti�t Thanh Minh 2012, x�a H�p tro c�t (Nam ��c th�n) th�t b�i");
		return 
	end
	gf_SetLogCaption("[Ho�t ��ng Ti�t Thanh Minh 2012: Ch�a k�t h�n]");
	gf_AddItemEx({2,95,1329,1}, "D��ng Li�u Chi", nCount);
end