--�ű����ܣ��������ŶԻ�����
--������ƣ�������
--���ܿ������峤
--����ʱ�䣺2009-3-13
NPC_NAME = "<color=green>L� Thi�n Nhu�n<color>:"
PLAYER_NAME = "<color=green>Ng��i ch�i<color>: ���c, ta �i ngay!"
Include("\\script\\task\\faction\\faction_head.lua")
Include("\\script\\global\\����������.lua")
--�����б�
SKILLS={
--����ʥս
--ʥ���¯�� (����id=1053)
[1053]={
     --{�ؼ�������ǰ�Ἴ������ǰ�Ἴ�ܹ�ϵ���룺1����0����ǰ�Ἴ��1��ǰ�Ἴ��1�ȼ���...}
     levelless={4,0,0,},
     --�ؼ��㣨���ܵȼ�����ҵȼ������Ľ�Ǯ�����ɹ��׶�}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={3,13,0,0},
     [4]={10,27,0,0},
	 },
--ʥ�𵶷� (����id=1054)
[1054]={
     levelless={3,1,0,1053,1},
     [1]={1,10,1000,0},
     [2]={2,12,800,0},
     [3]={9,26,0,0},
     },
--��¯���� (����id=1055)
[1055]={
     levelless={3,1,0,1053,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={9,26,0,0},
     },
--���ն (����id=1056)
[1056]={
     levelless={3,1,0,1054,1},
     [1]={1,10,1000,0},
     [2]={2,13,200,0},
     [3]={7,28,0,0},
     },
--���׻� (����id=1057)
[1057]={
     levelless={4,1,0,1054,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={3,15,0,0},
     [4]={7,27,0,0},
     },
--��ٷ� (����id=1058)
[1058]={
     levelless={3,2,0,1056,1,1057,1},
     [1]={1,20,8000,80},
     [2]={2,22,2500,80},
     [3]={8,34,0,80},
     },
--����� (����id=1059)
[1059]={
     levelless={3,1,0,1055,1},
     [1]={1,20,8000,80},
     [2]={2,23,2500,80},
     [3]={7,38,0,80},
     },
--���汼 (����id=1060)
[1060]={
     levelless={4,1,0,1059,1},
     [1]={1,20,27000,300},
     [2]={2,21,6000,300},
     [3]={3,23,0,300},
     [4]={9,35,0,300},
     },
--�˷��� (����id=1061)
[1061]={
     levelless={3,1,0,1058,1},
     [1]={1,30,27000,300},
     [2]={2,32,6000,300},
     [3]={7,42,0,300},
     },
--�ԻͶ� (����id=1062)
[1062]={
     levelless={4,1,0,1058,1},
     [1]={1,30,27000,300},
     [2]={2,31,6000,300},
     [3]={3,33,0,300},
     [4]={7,41,0,300},
     },
--�������� (����id=1063)
[1063]={
     levelless={3,1,0,1060,1},
     [1]={1,40,90000,700},
     [2]={2,42,24000,700},
     [3]={7,52,0,700},
     },
--���ױ� (����id=1064)
[1064]={
     levelless={4,1,0,1061,1},
     [1]={1,40,90000,700},
     [2]={2,41,24000,700},
     [3]={3,43,0,700},
     [4]={9,55,0,700},
     },
--��ɱ�� (����id=1065)
[1065]={
     levelless={5,1,0,1062,1},
     [1]={1,50,90000,700},
     [2]={2,53,24000,700},
     [3]={5,62,0,700},
     [4]={6,66,0,700},
     [5]={7,70,0,700},
     },
--Ǭ����Ų�� (����id=1066)
[1066]={
     levelless={5,3,1,1065,7,1064,9,1063,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}

function main()
	if GetTask(1018) == 5 and BigGetItemCount(2,0,784) == 0 then
		if GetItemCount(2,0,780) == 0 then
			Talk(1,"",NPC_NAME.."Kh�ng c� H�a Chung l�m sao l�y H�a Ch�ng, h�y t�m <color=green>Ph��ng Th�t Ph�t<color> (185/189) l�y H�a Chung!")
		else
			Talk(1,"faction_task",	PLAYER_NAME.."B�i ki�n L� Ph�p V��ng, gi�o ch� b�o ta ��n l�y H�a Ch�ng.")
		end
		return
     elseif GetTask(1018) == 6 then
          Talk(1,"",NPC_NAME.."<color=green>��ng Nguy�n Gݸc<color> (161/172) � Minh Gi�o H�u S�n tr�ng gi� Th�nh H�a ��n, ng��i l�y �� H�a Ch�ng mau ��a cho y.")
          return
	end

	MJSZ_master_main(9,25)
end
--ʦ������
function faction_task()
	Say(PLAYER_NAME.."Ta h�i ng��i, <color=yellow>Minh Gi�o<color> Th�p L�c T� Ch�n Ng�n l� g�?",
	2,
	"Th�nh h�a ch�y r�c, ��t ch�y th�n x�c, s�ng c� g� vui, ch�t c� g� kh�./task_right",
	"Thanh T�nh an ninh, Quang Minh tr��ng ngh�a, ��i L�c uy ch�n, Tr� Tu� kh� h�i./task_wrong"
	)
end
function task_right()
		Talk(1,"",NPC_NAME.."�� l�y �� H�a Ch�ng, mau giao cho <color=green>Th�nh H�a ��n<color> H� Ph�p <color=green>��ng Nguy�n Gݸc<color> (161/172). Nh� b�o v� t�t H�a Ch�ng, t�t r�i ta kh�ng ch�u tr�ch nhi�m.")
		DelItem(2,0,780,1)
		AddItem(2,0,784,1)
		SetTask(1018,6)
		TaskTip("C�m 4 H�a Ch�ng ��n g�p ��ng Nguy�n Gݸc")
		Msg2Player("C�m 4 H�a Ch�ng ��n g�p ��ng Nguy�n Gݸc (161/172)")
end
function task_wrong()
	Talk(1,"",PLAYER_NAME.."C� Th�p L�c T� Ch�n Ng�n c�a Minh Gi�o c�n kh�ng bi�t, H�a Ch�ng n�y ta kh�ng th� giao cho ng��i.")
	return
end

function MJSZ_master_main(faction_seq,route_seq)
     local t_dia_sel = {
          "�� t� b�i ki�n s� ph�!/#MJSZ_EnterRoute("..faction_seq..","..route_seq..")",
          "H�c"..TB_FACTION_INFO[faction_seq]..TB_ROUTE_INFO[route_seq].."V� c�ng/#skilllearn("..route_seq..")",
          "Ta c� ���c t�n quy�n m�t t�ch tr�n ph�i c�a b�n m�n./#MJSZ_book_chg("..route_seq..")",
          "Ch�o h�i/end_dialog",
     }
     local t_dia_show = {}
     local s_dia_main = "<color=green>"..TB_ROUTE_IN_INFO[route_seq].npc_name.."<color>: "..TB_ROUTE_IN_INFO[route_seq].bewrite
     if GetPlayerFaction() == faction_seq then  --���ŵ���
          tinsert(t_dia_show,t_dia_sel[1])
          tinsert(t_dia_show,t_dia_sel[2])
          tinsert(t_dia_show,t_dia_sel[3])
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
function MJSZ_EnterRoute( faction_seq,route_seq )
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
function MJSZ_book_chg( route_seq )
     if GetPlayerRoute() ~= route_seq then --���ɼ��
          Say(NPC_NAME.."Ng��i kh�ng ph�i �� t� c�a ta, m�t t�ch tr�n ph�i c�a b�n m�n sau c� th� giao cho ng��i!", 0)
          return
     else
          book_chg(route_seq)
     end 
end

GREATE_SKILL_NAME = "C�n Kh�n ��i Na Di"
GREATE_SKILL_ID = 1066
ROUTE_SKILL_NAME = "Minh Gi�o Th�nh Chi�n"

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
     if id == GREATE_SKILL_ID then  --������
          if GetSkillLevel(GREATE_SKILL_NAME) <= 0 then
               return NPC_NAME.."\""..GREATE_SKILL_NAME.."? l� <color=red>tuy�t h�c tr�n ph�i<color> c�a b�n m�n, kh�ng ph�i ng��i c� v� ��c cao trong b�n m�n, kh�ng ���c h�c."
          end
     end
end

function afterlearnskill(id)
     if id == GREATE_SKILL_ID then  --������
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

