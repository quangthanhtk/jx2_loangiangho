--����
Include("\\script\\missions\\yp\\yp_head.lua")

function main()
	local strNpcName = GetTargetNpcName();
	if strNpcName == "Th� Kh�" then
		OpenBox()
		EnableBoxLock(1)
	elseif strNpcName == "Ch� D��c �i�m" then
		Sale(30)
	elseif strNpcName == "Xa phu" then
		local strtab = {};
		local m = GetWorldPos()
		if m == 6300 then
			local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
			for i = 1,3 do
				if g_nDebugVersion==1 or nCamp == 0 or i == nCamp then
					tinsert(strtab,"��n "..tMainMapID[i][2].."/#cf_talk_1("..i..")")
					break;
				end
			end
			tinsert(strtab,"Tr� v� V� L�m Minh/cf_leave");
			tinsert(strtab,"K�t th�c ��i tho�i/nothing");
		else
			strtab = {
				"�i ��n Th�t L�c Nhai M�t C�c/cf_goto_slymg",
				"��n Ch��ng Kh� S�n C�c/cf_goto_zqsg",
				"Tr� v� V� L�m Minh/cf_leave",
				"K�t th�c ��i tho�i/nothing",
			};
		end
		Say("<color=green>T� L�i Ca<color>: ��i hi�p mu�n �i ��u? Mi�n ph� nh�!",
			getn(strtab),
			strtab)
	elseif strNpcName == "Xa Phu T�y V�c" then
		strtab = {
			"��n Th�t L�c Nhai/cf_talk_4",
			"K�t th�c ��i tho�i/nothing",
		};
		Say("<color=green>Xa Phu T�y V�c<color>: Ta c� th� nhanh ch�ng ��a ng��i ��n Th�t L�c Nhai. Mi�n ph� nh�!",
			getn(strtab),
			strtab)		
	end
end

function cf_leave()
	local strNpcName = GetTargetNpcName();
	if GetTeamSize() ~= 0 then
		Talk(1,"",strNpcName.."��i hi�p h�y r�i kh�i t� ��i r�i quay l�i!");
		return 0;
	end
	SetDeathPunish(1)
	NewWorld(425,1746,3197);	
end

function cf_talk_1(nType)
	if nType == 1 then
		cf_enter_1();
	elseif nType == 2 then
		cf_enter_2();
	elseif nType == 3 then
		cf_enter_3();
	end
end

function cf_enter_1()
	SetPlayerScript("\\script\\missions\\yp\\tls\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\tls\\entrynpc.lua","enter()");
end

function cf_enter_2()
	SetPlayerScript("\\script\\missions\\yp\\hss\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\hss\\entrynpc.lua","enter()");
end

function cf_enter_3()
	SetPlayerScript("\\script\\missions\\yp\\mm\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\mm\\entrynpc.lua","enter()");
end

function cf_talk_4()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then
		Talk(1,"","<color=green>Xa Phu T�y V�c<color>: Thi�u hi�p h�y gia nh�p th� l�c r�i h�y quay l�i nh�!");
		return 0;
	end
	if GetPKValue() >= 10 then
		Talk(1,"","<color=green>Xa Phu T�y V�c<color>: C�c h� s�t kh� qu� n�ng (PK#10), n�u v�o T�y V�c e r�ng s� c� h�a s�t th�n, �� ngh� c�c h� h�y t�y tr� s�t kh� (S� d�ng Ti�u Ki�p T�n �� gi�m tr� PK), �� tr�nh tai h�a khi v�o T�y V�c.");
		return 0;
	end
	if GetTeamSize() ~= 0 then
		Talk(1,"","<color=green>Xa Phu T�y V�c<color>: ��i hi�p h�y r�i ��i r�i v�o ti�p!");
		return 0;
	end
--	LeaveTeam();
	SetPlayerScript("\\script\\missions\\yp\\qmy\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\qmy\\entrynpc.lua","enter()");	
end

--ǰ�������ܹ�
function cf_goto_slymg()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then
		Talk(1,"","<color=green>Xa Phu T�y V�c<color>: Thi�u hi�p h�y gia nh�p th� l�c r�i h�y quay l�i nh�!");
		return 0;
	end
	if GetPKValue() >= 10 then
		Talk(1,"","<color=green>Xa Phu T�y V�c<color>: C�c h� s�t kh� qu� n�ng (PK#10), n�u v�o T�y V�c e r�ng s� c� h�a s�t th�n, �� ngh� c�c h� h�y t�y tr� s�t kh� (S� d�ng Ti�u Ki�p T�n �� gi�m tr� PK), �� tr�nh tai h�a khi v�o T�y V�c.");
		return 0;
	end
	if GetTeamSize() ~= 0 then
		Talk(1,"","<color=green>Xa Phu T�y V�c<color>: ��i hi�p h�y r�i ��i r�i v�o ti�p!");
		return 0;
	end
	SetPlayerScript("\\script\\missions\\yp\\slymg\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\slymg\\entrynpc.lua","enter()");	
end

--ǰ������ɽ��
function cf_goto_zqsg()
	SetPlayerScript("\\script\\missions\\yp\\ywz\\head.lua");
	SendScript2VM("\\script\\missions\\yp\\ywz\\head.lua","ywz_GotoZqsg()");	
end