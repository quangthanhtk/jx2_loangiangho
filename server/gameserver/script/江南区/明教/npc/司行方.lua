--�ű����ܣ��������ŶԻ�����
--������ƣ�������
--���ܿ������峤
--����ʱ�䣺2009-3-13
NPC_NAME = "<color=green>T� H�nh Ph��ng<color>:"
PLAYER_NAME = "<color=green>Ng��i ch�i<color>: ���c, ta �i ngay!"
Include("\\script\\task\\faction\\faction_head.lua")
Include("\\script\\global\\����������.lua")
--�����б�
SKILLS={
--����Ѫ��
--�����ķ� (����id=1131)
[1131]={
     --{�ؼ�������ǰ�Ἴ������ǰ�Ἴ�ܹ�ϵ���룺1����0����ǰ�Ἴ��1��ǰ�Ἴ��1�ȼ���...}
     levelless={4,0,0,},
     --�ؼ��㣨���ܵȼ�����ҵȼ������Ľ�Ǯ�����ɹ��׶�}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={3,13,0,0},
     [4]={10,27,0,0},
	 },
--�Ϲ�צ (����id=1132)
[1132]={
     levelless={3,1,0,1131,1},
     [1]={1,10,1000,0},
     [2]={2,12,800,0},
     [3]={8,24,0,0},
     },
--����ӡ (����id=1133)
[1133]={
     levelless={3,1,0,1131,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={7,22,0,0},
     },
--������ (����id=1134)
[1134]={
     levelless={3,1,0,1132,1},
     [1]={1,10,8000,80},
     [2]={2,13,2500,80},
     [3]={5,22,0,80},
     },
--��Ѫӡ (����id=1135)
[1135]={
     levelless={4,1,0,1133,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={3,15,0,0},
     [4]={8,30,0,0},
     },
--��Ѫӡ (����id=1136)
[1136]={
     levelless={3,1,0,1135,1},
     [1]={1,20,8000,80},
     [2]={2,22,2500,80},
     [3]={6,30,0,80},
     },
--��Ѫӡ (����id=1137)
[1137]={
     levelless={3,1,0,1133,1},
     [1]={1,20,8000,80},
     [2]={2,23,2500,80},
     [3]={6,35,0,80},
     },
--�̹�ӡ (����id=1138)
[1138]={
     levelless={4,1,0,1137,1},
     [1]={1,20,27000,300},
     [2]={2,21,6000,300},
     [3]={3,23,0,300},
     [4]={7,31,0,300},
     },
--׷��ӡ (����id=1139)
[1139]={
     levelless={3,1,0,1136,1},
     [1]={1,30,27000,300},
     [2]={2,32,6000,300},
     [3]={7,42,0,300},
     },
--߱��צ (����id=1140)
[1140]={
     levelless={4,1,0,1134,1},
     [1]={1,30,90000,700},
     [2]={2,31,24000,700},
     [3]={3,33,0,700},
     [4]={8,43,0,700},
     },
--����Ѫ�� (����id=1141)
[1141]={
     levelless={3,2,0,1138,1,1139,1},
     [1]={1,40,27000,300},
     [2]={2,42,6000,300},
     [3]={8,54,0,300},
     },
--��Ѫӡ (����id=1142)
[1142]={
     levelless={4,1,0,1141,1},
     [1]={1,40,90000,700},
     [2]={2,41,24000,700},
     [3]={3,43,0,700},
     [4]={7,51,0,700},
     },
--����ӡ (����id=1143)
[1143]={
     levelless={5,1,0,1141,1},
     [1]={1,50,90000,700},
     [2]={2,53,24000,700},
     [3]={5,62,0,700},
     [4]={6,66,0,700},
     [5]={7,70,0,700},
     },
--�������� (����id=1213)
[1213]={
     levelless={5,3,1,1140,8,1141,7,1142,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}

function main()
	if GetTask(1018) == 4 and BigGetItemCount(2,0,783) == 0 then
		if GetItemCount(2,0,780) == 0 then
			Talk(1,"",NPC_NAME.."Kh�ng c� H�a Chung l�m sao l�y H�a Ch�ng, h�y t�m <color=green>Ph��ng Th�t Ph�t<color> (185/189) l�y H�a Chung!")
		else
			Talk(3,"faction_task",
				NPC_NAME.."T�m ta c� vi�c g�, ta chu�n b� �i ki�m ch�t th�c �n.",
				PLAYER_NAME.."Gi�o ch� b�o ta ��n l�y H�a Ch�ng, ngo�i ra c�n chu�n b� cho ng��i 1 ph�n <color=yellow>G� Quay<color>.",
				NPC_NAME.."Gi�o ch� th�t c� l�ng. Ng��i h�y l�y <color=yellow>H�a Chung<color> �� ��ng ��i L�c H�a Ch�ng."
				)

		end
		return
     elseif GetTask(1018) == 5 then
          Talk(1,"",NPC_NAME.."Kh�ng ph�i b�o ng��i �i l�y <color=yellow>Tr� Tu� H�a Ch�ng<color> sao? Sao c�n � ��y, <color=green>Quang Minh Ph�p V��ng L� Thi�n Nhu�n<color> (175/191) �ang � g�n ��y, h�y mau �i l�y.")
          return
	end
	MJXR_master_main(9,27)
end
--ʦ������
function faction_task()
	if GetItemCount(2,0,785) == 0 then
		Talk(1,"",NPC_NAME.."G� ��u?")
		return
	else
		DelItem(2,0,785,1)
		DelItem(2,0,780,1)
		AddItem(2,0,783,1)
		Talk(1,"",NPC_NAME.."��i L�c H�a Ch�ng �� l�y ���c, <color=yellow>Tr� Tu� H�a Ch�ng<color> t�m <color=green>Quang Minh Ph�p V��ng L� Thi�n Nhu�n<color> (175/191)")
		SetTask(1018,5)
		TaskTip("T�m Quang Minh Ph�p V��ng L� Thi�n Nhu�n l�y Tr� Tu� H�a Ch�ng")
		Msg2Player("T�m Quang Minh Ph�p v��ng L� Thi�n Nhu�n (175/191) l�y Tr� Tu� H�a Ch�ng")
	end
end



function MJXR_master_main(faction_seq,route_seq)
     local t_dia_sel = {
          "�� t� b�i ki�n s� ph�!/#MJXR_EnterRoute("..faction_seq..","..route_seq..")",
          "H�c"..TB_FACTION_INFO[faction_seq]..TB_ROUTE_INFO[route_seq].."V� c�ng/#skilllearn("..route_seq..")",
          "Ta c� ���c t�n quy�n m�t t�ch tr�n ph�i c�a b�n m�n./#MJXR_book_chg("..route_seq..")",
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

function MJXR_EnterRoute( faction_seq,route_seq )
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

function MJXR_book_chg( route_seq )
     if GetPlayerRoute() ~= route_seq then --���ɼ��
          Say(NPC_NAME.."Ng��i kh�ng ph�i �� t� c�a ta, m�t t�ch tr�n ph�i c�a b�n m�n sau c� th� giao cho ng��i!", 0)
          return
     else
          book_chg(route_seq)
     end 
end



GREATE_SKILL_NAME = "H�n B�ng Mi�n Ch��ng"
GREATE_SKILL_ID = 1213
ROUTE_SKILL_NAME = "Minh Gi�o Huy�t Nh�n"
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

