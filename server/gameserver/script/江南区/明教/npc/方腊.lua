--�ű����ܣ��������ŶԻ�����
--������ƣ�������
--���ܿ������峤
--����ʱ�䣺2009-3-13
--   (__)��
--�� /oo\\________
--�� \��/�������� \---\
 --�� \/������ /�� \�� \
 --������\\_|___\\_|/����*
 --������  ||�� YY|  
 --������  ||����||  ����NB�Ĳ߻���������ڵķ�ʽ�������ʵ���Լ��Ĺ��ܣ����Բ�Ҫ�������������רҵ�̶ȡ�
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\���\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- ʦ����������ͷ�ļ�
Include("\\script\\task\\faction\\faction_main_sl.lua"); -- ��������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\practice\\practice_main.lua")

Import("\\script\\task\\faction_task\\faction_task.lua")


NPC_NAME = "<color=green>Ph��ng L�p<color>:"
PLAYER_NAME = "<color=green>Ng��i ch�i<color>: ���c, ta �i ngay!"
MING_FACTION_ID = 9
TB_FACTION_TASKID_LIST = {1002,1003,1004,1005,1031,1032,1033,1017,1018,1019,1001}
g_nFactionID = 9

Import("\\script\\ksgvn\\functions\\phutu_functions.lua")
g_szTalkHead = NPC_NAME

function main()
	local selTab = {
		"Ngu�n g�c Minh Gi�o/say1_1",
		"V� c�ng Minh Gi�o/say1_2",
		"�i�u ki�n nh�p m�n/say1_3",
		--"Ph� tu m�n ph�i/phutu_Main", --LongDaiKa: ��ng t�nh n�ng ph� tu m�n ph�i
		-- "��Ҫ��������/say1_4",
		"Ta mu�n l�m nhi�m v� S� M�n/#ftask_repeat_main(9)",
		"Li�n quan tu luy�n./practice",
		"Ta s�p th�nh th�n n�n ph�i xu�t s�/#faction_graduate(9)",
		"B�i ki�n gi�o ch�/end_dialog",
	}
	if FT_RELEASE_WORK == 1 then
		tinsert(selTab, 1, format("Nhi�m V� S� M�n M�i/#nft_talk(%d)", g_nFactionID));	
	end	
	Say(NPC_NAME.."Minh Gi�o x�a nay lu�n t�n s�ng �nh s�ng v� th�nh h�a, tr� gian di�t �c. Tuy kh�ng h�p v�i nh�n s� trung nguy�n nh�ng t�m l�ng th�nh kh�n th� nh�t nguy�t ch�ng gi�m.",
		getn(selTab),
		selTab
	)
end
--��Դ
function say1_1()
	Talk(2,"main",
		NPC_NAME.."Gi�o ph�i c�a ta c� ngu�n g�c t� Ma Ni Gi�o � Ba T�, gia nh�p v�o trung nguy�n t� ��i nh� ���ng, sau �� d�n d�n ph�t tri�n l�n. ��n ��i nh� T�ng th� ��i t�n th�nh 'Minh Gi�o'. Minh Gi�o x�a nay lu�n t�n s�ng �nh s�ng v� th�nh h�a, cho r�ng th� gi�i n�y �nh s�ng v� b�ng t�i lu�n ��i l�p v�i nhau, �nh s�ng cu�i c�ng s� chi�n th�ng b�ng t�i. Hi�n nay, gi�o ngh�a c�a b�n gi�o quy n�p th�nh 8 ch� 'Thanh t�nh, quang minh, ��i l�c, tr� tu�'.",
		NPC_NAME.."Gi�o ch�ng c�a b�n gi�o ��n t� kh�p m�i n�i, kh�ng ph�n bi�t ng�nh ngh� t� n�ng d�n, t� t�i, l�c l�m h�o h�n, c��ng ��o, t�ng l� ho�c ��o s� ��u c� th� gia nh�p. Nh�ng b�n gi�o x�a nay h�nh tung �n d�t, ch�u s� nghi k� c�a tri�u ��nh v� c�c m�n ph�i kh�c, th�m ch� c�n b� xem l� 'Ma gi�o', x�a nay lu�n b� tri�u ��nh v� c�c m�n ph�i kh�c kh�ng ch�. Cho n�n �� b�t tay v�o x�y d�ng Quang Minh ��nh tr�n n�i C�n L�n, xem nh� t�ng ��n m�i c�a Minh Gi�o, �� tr�nh b� tri�u ��nh di�t g�n."
		)
end
--�书
function say1_2()
	Talk(4,"main",
		NPC_NAME.."Gi�o ch�ng Minh Gi�o chia th�nh 3 h� <color=yellow>Th�nh Chi�n, Huy�t Nh�n, Tr�n Binh<color>.",
		NPC_NAME.."<color=yellow>Th�nh Chi�n<color> ��c k�t t� � ngh�a c�a 'Quang minh', kh�ng s� h�i, d�ng th�n m�nh �� ngh�nh chi�n ��ch t� ch�nh di�n. L�c chi�n do t�m quy�t ��nh, t�m c�ng n� th� s�c c�ng m�nh, ch� c�n c�n n� � th� kh�ng s� g� c�. Tr�n ph�i <color=red>C�n Kh�n ��i Na Di<color>, k� n�ng c�a <color=yellow>Th�nh Chi�n<color> do <color=green>Quang Minh Ph�p V��ng-L� Thi�n Nhu�n<color> truy�n th�.",
		NPC_NAME.."<color=yellow>Huy�t Nh�n<color> ��c k�t t� � ngh�a c�a 'Thanh t�nh', thanh t�nh nh� tr�ng s�ng. Khi chi�n ��u v�i h� n�y n�u tr�ng ph�i �n k� th� ph�p ��c m�n, l�c ��u s� kh�ng c� d�u v�t, n�u d�ng th� ph�p ��c m�n �� ph� �n th� s�c m�nh b�n trong s� khi�n k� ��ch b� tr�ng th��ng. T�m <color=green>X�ch Di�m Ph�p V��ng-T� H�nh Ph��ng<color> �� h�c <color=red>H�n B�ng Mi�n Ch��ng<color>.",
		NPC_NAME.."<color=yellow>Tr�n Binh<color> ��c k�t t� � ngh�a c�a 'Tr� tu�', d�nh cho ng��i tr� tu�. H� n�y b�t ngu�n t� Ng� H�nh K�, th� ph�p b� tr�n ��c ��o, k� ��ch khi l�t v�o tr�n s� b� kh�ng ch�, b�t k� h�nh ��ng ho�c thi tri�n k� n�ng ��u b� t�m ma kh�ng ch�, g�y s�t th��ng cho b�n th�n. Khi ��ng ��i trong tr�n, s� c��ng h�a b�n th�n, �i�u tr� v�t th��ng. Tr�n ph�i <color=red>Quang Minh Ng� H�nh Tr�n<color>, v� c�ng c�a h� n�y do <color=green>��i V�n Ph�p V��ng-V��ng D�n<color> truy�n th�."
	)
end
--����
function say1_3()
	Talk(1,"",NPC_NAME.."Kh�ng gi�i h�n nam n�, ch�a c� m�n ph�i v� kh�ng ph�i ph�n �� ��u c� th� gia nh�p. Gi�o ch�ng c�n ph�i h�nh thi�n tr� �c, n�u c� t�i s�n th� ph�i c�u tr� ng��i ngh�o, t�n s�ng minh t�n.")
end
--��������
function say1_4()
	--�ȼ��ж�
	if GetLevel() <10 then
		Talk(1,"",NPC_NAME.."C�p kh�ng ��, ��t c�p <color=yellow>10<color> r�i quay l�i.")
		return
	end
	--�����ж�
	if GetPlayerFaction() == 9 then
		Talk(1,"",NPC_NAME.."Ng��i �� l� ng��i c�a Minh Gi�o, c�n t�m ta l�m g�!")
		return
	end
	--�����ж�
	if GetPlayerFaction() > 0 then
		Talk(1,"",NPC_NAME.."Thi�u hi�p �� c� m�n ph�i, ta kh�ng th� nh�n.")
		return
	end
	local faction_task_step = without_other_factask(MING_FACTION_ID) 
	if faction_task_step == -1 then
		Talk(1,"",NPC_NAME.."�� nh�n nhi�m v� c�a ph�i kh�c, kh�ng th� gia nh�p b�n ph�i.")
		return
	elseif faction_task_step == 7 then
		Talk(3,"",
			NPC_NAME.."<color=green>��ng Nguy�n Gi�c<color> �� th�ng b�o v�i ta, ng��i �� giao 4 H�a Ch�ng cho �ng �y. Ng��i l�m t�t l�m, hi�n t�i c� th� gia nh�p gi�o ph�i. Nh�ng h�y nh� l�y, sau khi v�o gi�o th� ph�i h�nh thi�n tr� �c, n�u c� t�i s�n th� ph�i c�u tr� ng��i ngh�o, t�n s�ng minh t�n.",
			PLAYER_NAME.."�� t� ghi nh�.",
			NPC_NAME.."Gi�o ch�ng Minh Gi�o chia th�nh 3 h� <color=green>Tr�n Binh, Th�nh Chi�n, Huy�t Nh�n<color>. Ng��i c� th� �i t�m <color=green>��i V�n Ph�p V��ng-V��ng D�n<color> h�c k� n�ng <color=yellow>Tr�n Binh<color>, n�u h�ng th� v�i <color=yellow>Th�nh Chi�n<color> th� ph�i t�m <color=green>Quang Minh Ph�p V��ng-L� Thi�n Nhu�n<color>, c�n h�ng th� v�i <color=yellow>Huy�t Nh�n<color> th� h�y �i t�m <color=green>X�ch Di�m Ph�p V��ng-T� H�nh Ph��ng<color>."
		)
		TaskTip("Ta �� thu�n l�i gia nh�p Minh Gi�o")
		SetPlayerFaction(9)
		SetPlayerRoute(24)
		SetTask(TB_FACTION_TASKID_LIST[MING_FACTION_ID],8)
		return
	else
		if faction_task_step == 0 then
			SetTask(TB_FACTION_TASKID_LIST[MING_FACTION_ID],1)
			TaskTip("T�m Ph��ng Th�t Ph�t l�y H�a Chung")
			Msg2Player("T�m Ph��ng Th�t Ph�t (185/189) l�y H�a Chung")
			Talk(3,"",
				NPC_NAME.."<color=yellow>Th�nh h�a h�ng h�c, thi�u ��t th�n ta, s�ng c� g� vui, ch�t c� g� bu�n<color>. Gi�o quy nghi�m ng�t, kh�ng ph�i t�y ti�n c� th� gia nh�p v�o gi�o, nh�ng n� t�nh ng��i t� xa ��n ��y, n�u c� th� gi�p <color=yellow>Th�nh H�a ��n<color> h� ph�p <color=green>��ng Nguy�n Gi�c<color> mang v� 4 H�a Ch�ng, ta s� cho ng��i gia nh�p.",
				PLAYER_NAME.."Ta ph�i l�m sao.",
				NPC_NAME.."4 H�a Ch�ng: Thanh T�nh, Quang Minh, ��i L�c, Tr� Tu� c�a Minh Gi�o do 4 ng��i <color=green>Quang Minh H�u S�-H�u ��n, ��i V�n Ph�p V��ng-V��ng D�n, X�ch Di�m Ph�p V��ng-T� H�nh Ph��ng, Quang Minh Ph�p V��ng-L� Thi�n Nhu�n<color> n�m gi�, ng��i ph�i chu�n b� 4 H�a Chung �� b� H�a Ch�ng, t�m <color=green>Ph��ng Th�t Ph�t<color> (185/189) �� l�y nh�."
			)
		else
			Talk(1,"",NPC_NAME..GetPlayerSex().."Kh�ng th�y <color=green>Ph��ng Th�t Ph�t<color> sao?  �ng �y � c�ch ��y kh�ng xa, h�y �i t�m �� l�y <color=green>4 H�a Chung<color>.")
		end
		
	end
end
--�����Ի�
function end_dialog()
	
end
--������
--������
function without_other_factask(faction_diff)
	for i = 1,getn(TB_FACTION_TASKID_LIST) do
		if i ~= faction_diff and GetTask(TB_FACTION_TASKID_LIST[i]) > 0 then
			return -1
		end
	end
	return GetTask(TB_FACTION_TASKID_LIST[faction_diff])
end

-- �չ�����
function practice()
    if GetPlayerFaction() ~= MING_FACTION_ID then
       Talk(1,"",NPC_NAME.."Ng��i kh�ng ph�i l� �� t� Minh Gi�o, kh�ng th� ��n ��y tu luy�n.");
    else
        if GetItemCount(2,0,788) >= 1 then  --ʦ������
            Say(NPC_NAME.."B��c v�o tu luy�n kh�ng?",2,"��ng/practice_start","Sai/no");
        else
            Talk(1,"",NPC_NAME.."Ng��i kh�ng c� <color=yellow>Minh Gi�o S� M�n L�nh<color>, kh�ng th� ti�n h�nh b� quan tu luy�n.");
        end;
    end;
end;