--�ű����ܣ��������ŶԻ�����
--������ƣ�������
--���ܿ������峤
--����ʱ�䣺2009-3-13
NPC_NAME = "<color=green>V��ng D�n<color>:"
PLAYER_NAME = "<color=green>Ng��i ch�i<color>: ���c, ta �i ngay!"
Include("\\script\\task\\faction\\faction_head.lua")
Include("\\script\\global\\����������.lua")
--�����б�
SKILLS={
--�������
--������ң�� (����id=1083)
[1083]={
     --{�ؼ�������ǰ�Ἴ������ǰ�Ἴ�ܹ�ϵ���룺1����0����ǰ�Ἴ��1��ǰ�Ἴ��1�ȼ���...}
     levelless={4,0,0,},
     --�ؼ��㣨���ܵȼ�����ҵȼ������Ľ�Ǯ�����ɹ��׶�}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={3,13,0,0},
     [4]={10,27,0,0},
	 },
--�����ʷ� (����id=1084)
[1084]={
     levelless={3,1,0,1083,1},
     [1]={1,10,1000,0},
     [2]={2,12,800,0},
     [3]={9,26,0,0},
     },
--������ (����id=1085)
[1085]={
     levelless={3,1,0,1083,1},
     [1]={1,10,1000,0},
     [2]={2,13,800,0},
     [3]={7,28,0,0},
     },
--������ (����id=1086)
[1086]={
     levelless={2,1,0,1085,1},
     [1]={1,10,1000,0},
     [2]={1,10,800,0},
     },
--��ˮ�� (����id=1087)
[1087]={
     levelless={4,2,0,1085,1,1084,1},
     [1]={1,10,8000,80},
     [2]={2,12,2500,80},
     [3]={3,15,0,80},
     [4]={7,27,0,80},
     },
--����� (����id=1088)
[1088]={
     levelless={3,1,0,1086,1},
     [1]={1,20,8000,80},
     [2]={2,22,2500,80},
     [3]={8,34,0,80},
     },
--��ľ�� (����id=1089)
[1089]={
     levelless={3,1,0,1087,1},
     [1]={1,20,8000,80},
     [2]={2,23,2500,80},
     [3]={7,38,0,80},
     },
--ѸӰ�� (����id=1090)
[1090]={
     levelless={3,1,0,1088,1},
     [1]={1,20,27000,300},
     [2]={2,22,6000,300},
     [3]={8,34,0,300},
     },
--Ǭ����ת (����id=1091)
[1091]={
     levelless={3,1,0,1090,1},
     [1]={1,30,90000,700},
     [2]={2,32,24000,700},
     [3]={7,42,0,700},
     },
--ҵ���� (����id=1092)
[1092]={
     levelless={3,1,0,1089,1},
     [1]={1,30,27000,300},
     [2]={2,33,6000,300},
     [3]={7,48,0,300},
     },
--�����Ԫ (����id=1095)
[1095]={
     levelless={3,1,0,1094,1},
     [1]={1,40,90000,700},
     [2]={2,43,24000,700},
     [3]={7,58,0,700},
     },
--����ɢԪ (����id=1094)
[1094]={
     levelless={4,1,0,1084,1},
     [1]={1,40,27000,300},
     [2]={2,41,6000,300},
     [3]={3,43,0,300},
     [4]={9,55,0,300},
     },
--������ (����id=1093)
[1093]={
     levelless={5,2,1,1095,1,1092,1},
     [1]={1,50,90000,700},
     [2]={2,53,24000,700},
     [3]={5,62,0,700},
     [4]={6,66,0,700},
     [5]={7,70,0,700},
     },
--���������� (����id=1096)
[1096]={
     levelless={5,2,1,1093,7,1091,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}

function main()
	if GetTask(1018) == 3 and BigGetItemCount(2,0,782) == 0 then
		if GetItemCount(2,0,780) == 0 then
			Talk(1,"",NPC_NAME.."Kh�ng c� H�a Chung l�m sao l�y H�a Ch�ng, h�y t�m <color=green>Ph��ng Th�t Ph�t<color> (185/189) l�y H�a Chung!")
		else
			Talk(4,"faction_task",
				NPC_NAME.."Ta �ang u�ng r��u ngon l�nh, ��ng khi�n cho ta m�t h�ng.",
				PLAYER_NAME.."Gi�o ch� b�o ta ��n ��y l�y H�a Ch�ng.",
				NPC_NAME.."H�a Ch�ng g� ch�, vi�c u�ng r��u c�a ta quan tr�ng h�n, ��ng gh�t, r��u c�ng h�t r�i.",
				PLAYER_NAME.."Ta �� chu�n b� r��u ngon r�i, m�i d�ng."
			)
		end
		return
     elseif GetTask(1018) == 4 then
          Talk(1,"",NPC_NAME.."<color=green>T� H�nh Ph��ng<color> (182/196) � h��ng kh�c, <color=yellow>��i L�c H�a Ch�ng<color> � trong ta c�a �ng �y, h�y mau �i l�y n�o.")
          return
	end

	MJZB_master_main(9,26)
end
--ʦ������
function faction_task()
	if GetItemCount(2,0,786) == 0 then
		Talk(1,"",NPC_NAME.."R��u ��u?")
		return
	else
		DelItem(2,0,786,1)
		DelItem(2,0,780,1)
		AddItem(2,0,782,1)
		Talk(1,"",NPC_NAME.."R��u ngon! T�t l�m! N�o h�y ��n ��y mang <color=yellow>Quang Minh H�a Ch�ng<color> �i. �i h��ng kh�c �� t�m <color=green>T� H�nh Ph��ng<color> (182/196), <color=yellow>��i L�c H�a Ch�ng<color> � trong tay c�a �ng �y.")
		SetTask(1018,4)
		TaskTip("T�m T� H�nh Ph��ng l�y ��i L�c H�a Ch�ng")
		Msg2Player("T�m T� H�nh Ph��ng (182/196) l�y ��i L�c H�a Ch�ng")
	end
end


function MJZB_master_main(faction_seq,route_seq)
     local t_dia_sel = {
          "�� t� b�i ki�n s� ph�!/#MJZB_EnterRoute("..faction_seq..","..route_seq..")",
          "H�c"..TB_FACTION_INFO[faction_seq]..TB_ROUTE_INFO[route_seq].."V� c�ng/#skilllearn("..route_seq..")",
          "Ta c� ���c t�n quy�n m�t t�ch tr�n ph�i c�a b�n m�n./#MJZB_book_chg("..route_seq..")",
          "Ch�o h�i/end_dialog",
     }
     local t_dia_show = {}
     local s_dia_main = "<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: "..TB_ROUTE_IN_INFO[route_seq].bewrite
     if GetPlayerFaction() == faction_seq then  --���ŵ���
          tinsert(t_dia_show,t_dia_sel[1])
          tinsert(t_dia_show,t_dia_sel[2])
          tinsert(t_dia_show,t_dia_sel[3])
          -- end
     end
     if getn(t_dia_show) == 1 then
          Talk(1,"",s_dia_main)
     else
          Say(s_dia_main,
               getn(t_dia_show),
               t_dia_show
          )
     end
end

function MJZB_EnterRoute( faction_seq,route_seq )
     if GetPlayerFaction() ~= faction_seq then
          Say(NPC_NAME.."Thi�u hi�p ph�i ���c gi�o ch� ��ng � cho gia nh�p Minh Gi�o, sau �� m�i c� th� ��n b�i s� h�c ngh�.",0)
     elseif GetPlayerRoute()  == route_seq then -- ���ɵ���
          Say(NPC_NAME.."Mau �i luy�n c�ng, kh�ng ���c l�m bi�ng.",0)
     elseif GetPlayerRoute()  == 24 then        -- �������ɵ���
          get_in_route(faction_seq,route_seq)
     else                                       -- ���ű��ɵ���
          Say(NPC_NAME.."Ta kh�ng ph�i s� ph� c�a ng��i, ng��i n�n g�i ta l� s� th�c!",0)
     end
end


function MJZB_book_chg( route_seq )
     if GetPlayerRoute() ~= route_seq then --���ɼ��
          Say(NPC_NAME.."Ng��i kh�ng ph�i �� t� c�a ta, m�t t�ch tr�n ph�i c�a b�n m�n sau c� th� giao cho ng��i!", 0)
          return
     else
          book_chg(route_seq)
     end 
end


--���������� (����id=1096)
GREATE_SKILL_NAME = "Quang Minh Ng� H�nh Tr�n"
GREATE_SKILL_ID = 1096
ROUTE_SKILL_NAME = "Minh Gi�o Tr�n Binh"
function showlimit(n)    --ʦ��˵��
     if n==2 then
          Say(NPC_NAME.."C�p kh�ng �� �� h�c v� c�ng m�i, h�y th�ng c�p tr��c?",0)
     elseif n==3 then
          Say(NPC_NAME.."Kinh nghi�m kh�ng �� h�c v� c�ng m�i, h�y luy�n t�p tr��c?",0)
     elseif n==4 then
          Say(NPC_NAME.."Danh v�ng c�a ng��i kh�ng �� �� h�c v� c�ng m�i, h�y l�m nhi�m v� �� t�ch l�y th�m danh v�ng.",0)
     elseif n==5 then
          Say(NPC_NAME.."V� c�ng tr��c v�n ch�a h�c xong, kh�ng th� h�c v� c�ng m�i!",0)
     elseif n==6 then
          Say(NPC_NAME.."Ng�n l��ng c�a ng��i kh�ng ��, t�m �� r�i h�y quay l�i nh�!",0)
     else
     end
end;

function skilllearn(route_seq)         --ѧϰ����
     if GetPlayerRoute() ~= route_seq then --���ɼ��
          Say(NPC_NAME.."Kh�ng ph�i �� t�, kh�ng th� h�c"..ROUTE_SKILL_NAME.."V� c�ng.",0)
     else
          Say(NPC_NAME.."G�c ph�i ph�a d��i bi�u t��ng v� c�ng xu�t hi�n d�u m�i t�n bi�u th� c� th� h�c v� c�ng n�y, nh�n chu�t �� t�ng c�p.",0)
          AllowLearnSkill()
     end
end;

function beforelearnskill(id)
     if id == GREATE_SKILL_ID then 
          if GetSkillLevel(GREATE_SKILL_NAME) <= 0 then
               return NPC_NAME.."\""..GREATE_SKILL_NAME.."? l� <color=red>tuy�t h�c tr�n ph�i<color> c�a b�n m�n, kh�ng ph�i ng��i c� v� ��c cao trong b�n m�n, kh�ng ���c h�c."
          end
     end
end

function afterlearnskill(id)
     if id == GREATE_SKILL_ID then 
          if GetSkillLevel(GREATE_SKILL_NAME) == 1 then
               Say(NPC_NAME.."Thi�u hi�p qu� t� ch�t h�n ng��i, �� s� b� l�nh ng� ���c ?"..GREATE_SKILL_NAME.."?, th�t hi�m c�!<enter><color=green>Ng��i ch�i<color>:  Nh�ng s� ph�, t�i sao khi con xu�t chi�u ?"..GREATE_SKILL_NAME.."?, c�m th�y n�i kh� kh�ng t�p trung kh� l�ng thi tri�n? T� tr��c �� nghe n�i L�c M�ch Th�n Ki�m c�a ��i L� �o�n Th�, mu�n thi tri�n nh�ng kh�ng ���c.<enter>"..NPC_NAME.."Thi�u hi�p c� �i�u ch�a bi�t, ?"..GREATE_SKILL_NAME.."? d� c� bi�t nh�ng mu�n �i�u khi�n n� th�t kh�ng ph�i chuy�n d�. Tinh kh� trong c� th� kh�ng n�i t� th�nh ?S�t kh�? (�i�m s�t kh�) s� kh�ng th� thi tri�n. Mu�n thi tri�n c�n t�n ?S�t kh�?. ?S�t khi? t�ng 10 ph�n, trong c�ng th� t� th��ng c� th� t�ng, ��ng th�i c�ng s� t� t� t�p.", 1, "��ng �/GiveMomentum")
          elseif GetSkillLevel(GREATE_SKILL_NAME) == 5 then
               Say(NPC_NAME.."Thi�u hi�p qu� t� ch�t th�ng minh, ?"..GREATE_SKILL_NAME.."? �� l�nh ng� ���c 5 ph�n. V� c�ng n�y t�ng c� 20 c�p, 5 c�p ti�p theo thi�u hi�p ph�i si�ng n�ng tu luy�n, ��n �� thu�n th�c nh�t ��nh m�i c� th� ��t ph�. C�n 10 c�p sau c�ng ph�i tham ng� m�t t�ch tr�n ph�i c�a b�n m�n m�i c� th� l�nh ng� ra.", 0)
          end
     end
end

function GiveMomentum()
     Say(NPC_NAME.."���c, gi� ta s� v�n c�ng �� s�t kh� trong c� th� ng��i n�i t� 10 ph�n, gi�p ng��i xu�t chi�u?"..GREATE_SKILL_NAME.."?.<enter><enter>R�t l�u...<enter><enter>"..NPC_NAME.."Xong r�i, s�t kh� trong c� th� thi�u hi�p �� h�nh th�nh, gi� c� th� th� xu�t chi�u ?"..GREATE_SKILL_NAME.."? r�i. Tuy�t h�c tr�n ph�i b�n m�n uy l�c ��ng s�, ch� ���c d�ng �� gi�p �� m�i ng��i, thay tr�i h�nh ��o, kh�ng ���c l�m h�i ng��i v� t�i, nh� ��...", 0)
     SetMomentum(10)
     RandomTaskTipEx("Nh�n ���c 10 �i�m s�t kh� s� ph� truy�n cho", "momentumtip")
end

