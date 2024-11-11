--������

Include("\\script\\missions\\yp\\award.lua")

tNpcName = {
	{"<color=green>�o�n H�a Phong<color>: ","Ph� v��ng b�o ta chu�n b� c�a h�i m�n, nh�ng chi�n s� li�n mi�n, qu�c kh� tr�ng r�ng th� l�m sao c�n l�a l� g�m v�c!"},
	{"<color=green>�� T�ng C�t Ng�a<color>: ","A di �� ph�t! C�m �n c�c v�, s� da n�y s� do b�n t� qu�n l� gi�p, thi�n tai! Thi�n tai!"},
	{"<color=green>L� K� Minh<color>: ","Ha ha, b�n kh�n Thi�n �m Gi�o, h�y tr� ch�u b�u l�i cho l�o t�!"},	
};

function main()
	local nMapID = GetWorldPos()
	local nType = 0;
	for i = 1, getn(tMainMapID) do
		if tMainMapID[i][1] == nMapID then
			nType = i;
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
	local g_NpcName = tNpcName[nType][1];
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 or tMainMapID[nCamp][1] ~= nMapID then
		Talk(1,"",g_NpcName.."Ta gi�p ���c g� cho ��i hi�p?");
		return 0;
	end
	yp_clearPlayerData();
	local strtab = {
		"Nh�n ph�n th��ng �� c�ng hi�n (M�i tu�n ch� ���c nh�n 1 l�n)/#dhf_talk_1("..nType..")",
		"T�m hi�u v� �� c�ng hi�n/#dhf_talk_2("..nType..")",
		"Kh�ng c� vi�c g�!/nothing",
	}
	Say(g_NpcName..tNpcName[nType][2].."�� c�ng hi�n hi�n t�i: <color=yellow>"..GetTask(TASK_FIELD_PVP_GXD).."<color>.",
		getn(strtab),
		strtab)
end

function dhf_talk_1(nType)
	local g_NpcName = tNpcName[nType][1];
	if GetTask(TASK_FIELD_PVP_GXD_WARD) ~= 0 then
		Talk(1,"",g_NpcName.."Tu�n n�y �� nh�n r�i, tu�n sau h�y quay l�i!");
		return 0;
	end
	local nNum = GetTask(TASK_FIELD_PVP_GXD);
	if nNum < 900 then
		Talk(1,"",g_NpcName.."�� c�ng hi�n tu�n n�y c�a ��i hi�p kh�ng �� �� nh�n th��ng, h�y ti�p t�c c� g�ng!");
		return 0;
	end
	if gf_Judge_Room_Weight(4,30,"") ~= 1 then
		return 0;
	end
	yp_aw_giveAward_18(nNum);	
end

function dhf_talk_2(nType)
	local g_NpcName = tNpcName[nType][1];
	Talk(1,"main",g_NpcName.."�� c�ng hi�n d�ng �� �o l��ng m�c �� c�ng hi�n trong tu�n ��i v�i th� l�c, ch� c� th� giao n�p v�t ph�m c�n thu th�p t��ng �ng c�a th� l�c �� n�ng cao.\n    ");
end