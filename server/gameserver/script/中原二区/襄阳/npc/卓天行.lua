-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ͨ������ɱ�������ļ�(���Npc:����׿����)
-- Edited by starry night
-- 2005/09/15 PM 9:27

-- ======================================================

--����ͨ������ͷ�ļ�
Include("\\script\\lib\\message.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua");

g_NpcName = "<color=green>Tr�c Thi�n H�nh<color>:";

function main()
	local szTitle = format("%s %s", g_NpcName, "Nh� n�m x�a l�o phu c�ng t�ng l� m�t ��i hi�p tu�i tr� t�i cao, phong l�u ph�ng kho�ng. Nay qu� th�t �� gi� r�i. Ng��i t�m ta c� vi�c g� kh�ng?")
	local tSay = {
		--format("%s/Task_Check", "��������һ�����ƣ���������ѧǳ����ǰ�����԰��ҽ⿪����������"),
		format("%s/bookDecompose", "T�ch b� k�p"),
		--format("%s/bookCompose", "�ؼ�����"),
		--format("%s/qby_task", "ί������"),
		format("%s/book_main", "Ch�n V� M�t T�ch"),
		format("%s/nothing", "H�n g�p l�i"),
	}
	Say(szTitle,	getn(tSay), tSay)
end


function Task_Check()

	if GetItemCount(2,1,195) >= 1 then --�ж�ɱ��������
		Say("<color=green>Tr�c Thi�n H�nh<color>: ��y l� L�nh B�i S�t Th� c�a T�y H� Nh�t Ph�m ���ng, trong �� �n ch�a huy�n c�. H�y giao n� cho ta, ta c� th� gi�i huy�n c� c�a l�nh b�i n�y.",
				2,
				"���c, l�nh b�i n�y cho ng��i/Task_Confirm",
				"Th�i ���c! �a t� ti�n b�i/Task_Exit");
	else
		Say("L�nh b�i c�a ng��i ��u?!",0);
	end;

end;


function Task_Confirm()

local n = 0;
local nLevel = GetLevel();

local str1 = { "<color=green>Tr�c Thi�n H�nh<color>:�",
						   "L�nh b�i n�y xem ra ch�ng c� g� ��c bi�t.",
						   "Ta c� m�t �t th�nh d��c �i l�i trong giang h� r�t c�n thi�t, t�ng ng��i xem nh� kh�ng u�ng c�ng c�a ng��i v�y.",
						   "�a t� ti�n b�i"}

local str2 = { "<color=green>Tr�c Thi�n H�nh<color>:�",
						 	 "B�n d��i l�nh b�i c� �n ch�a m�t b�n v�, b�n tr�n m�i ch� l� nh�ng k� hi�u",
               "K� hi�u?",
               "<color=yellow>T�ng B�o ��<color> do ng��i mang ��n ���ng nhi�nl� ph�i tr� l�i cho ng��i r�i. N�i th�t ta gi� r�i c�ng kh�ng c�n �� s�c �� �i qu�ng ���ng d�i nh� v�y.",
						   "�a t� ti�n b�i ch� gi�o!"}

local str3 = { "<color=green>Tr�c Thi�n H�nh<color>:�",
							 "� ��y c�n c� <color=yellow>Ph�o hoa truy�n tin<color>��",
							 "Ph�o hoa truy�n tin?",
							 "��y l� v�t ph�m m� Nh�t Ph�m ���ng S�t Th� hay s� d�ng, ch� c�n ra ngo�i th�nh ��t l�n th� s� c� S�t th� ��u m�c ��n ti�p �ng. Ng��i nh�n c� h�i n�y tr� h�i cho ��i T�ng.",
							 "�a t� ti�n b�i ch� gi�o!"}

--	if Pay(5000) == 1 then
		local nDelItem = DelItem(2,1,195,1,1);
			if nDelItem == 1 then

				n = random(1,100);

				if n <= 67 then --67���õ�һ�Ųر�ͼ
					TalkEx("",str2);
					local nRow = random(3,tonumber(tabPos:getRow()));
					local nParticular = tonumber(tabPos:getCell(nRow,"PosID"));
					AddItem(2,14,nParticular,1,1);
				else --33����ȡһ������ɱ�ִ����̻�
					AddItem(2,1,203,1,1);
					TalkEx("",str3);
				end;
			end;
--	else
--
--		Say("<color=green>׿����<color>�����Ǯ�����ﰡ������ô˵Ҳ��һ����������Ȼ�����ˣ���Ҳ�����ڱ�������Щ�������⻣�Ұɣ�",0);
--
--	end;

end;

function bookCompose(bSure)
	if not bSure then
		local tSel = {
			"\nB�t ��u l�nh ng� b� k�p/#bookCompose(1)",
			"\nK�t th�c ��i tho�i/nothing",
		}

		Say("<color=green>Tr�c Thi�n H�nh<color>: B�n c� th� b� v�o c�c lo�i b� k�p �� c�ng l�nh ng�, t� �� nh�n ���c b� k�p m�i, b�n c� th� b� v�o tu vi, [��i Nh�n S�m] th�i gian v� [Nh�n S�m Ng�n N�m] th�i gian �� n�ng cao t� l� l�nh ng� th�nh c�ng ([Qu� Nh�n S�m] c� b�n trong Ng� C�c). V� d�: L�ng Ba Di B� v� Ng� H�nh M�t T�chc�ng l�nh ng�, c� th� nh�n ���c <color=yellow>B� K�p Ti�u Dao<color>, th�m v� d�: H�n ��n M�t T�ch, Huy�n �nh M�t T�ch, Kim Cang Ph�c Ma Kinh, Thi�n La M�t T�ch, Linh C� M�t T�ch c�ng nhau l�nh ng� s� ���c Ng� H�nh M�t T�ch! C�c b�n c�n t� t�m hi�u c�ch ph��ng th�c l�nh ng� kh�c.",
			getn(tSel), tSel);
		return
	else
		SendScript2Client('Open([[BookCompose]]);Open([[Items]])');
	end
end

function bookDecompose()
	if 1 == IsBoxLocking() then
		Talk(1, "", "<color=green>Tr�c Thi�n H�nh<color>: H�y m� kh�a r��ng tr��c.");
		return
	end
	SendScript2Client("Open[[EquipRecycle]]");
end

function nothing()
end

--function qby_award()
--	local strtab = {}
--	for i = 1,getn(tQbyAward) do
--		tinsert(strtab,format("�һ�[%s]����Ҫ[���Ӧ����]%d����/#qby_ask_award(%d)",tQbyAward[i][1],tQbyAward[i][3],i));
--	end
--	for i = 1,getn(tDSwordAward[1]) do
--		tinsert(strtab,format("�һ�[%s]����Ҫ�����硢�ס������Ƹ�%d����/#ask_sword_award(%d,%d)",tDSwordAward[1][i][1],tDSwordAward[1][i][3],1,i));
--	end
--	for i = 1,getn(tDSwordAward[2]) do
--		tinsert(strtab,format("�һ�[%s]����Ҫ�����硢�ס������Ƹ�%d����/#ask_sword_award(%d,%d)",tDSwordAward[2][i][1],tDSwordAward[2][i][3],2,i));
--	end
--	tinsert(strtab,"����/main");
--	--tinsert(strtab,"�����Ի�/nothing");
--	suSay(g_NpcName.."������Ҫ�һ����ֽ����أ�",
--		getn(strtab),
--		strtab)	
--end
--
--double_sword_award = qby_award;
--
--tDSwordAward[1].name = "<color=green>׿����<color>��";
--tDSwordAward[2].name = "<color=green>׿����<color>��";

function book_main()
	local szMsg = g_NpcName .. "Tu luy�n Ch�n V� M�t T�ch c� th� gi�p c�nh gi�i v� h�c c�a ��i hi�p t�ng th�m m�t t�ng. ��i hi�p c� th�c m�c g� v� vi�c tu luy�n Ch�n V� M�t T�ch th� c� vi�c h�i!";
	local tSel = {
		"L�m sao m� tu luy�n Ch�n V� M�t T�ch/#book_introduce(1)",
		"Tu luy�n Ch�n V� M�t T�ch c�n g�?/#book_introduce(2)",
		"L�m sao ph�n bi�t tr�nh �� tu luy�n Ch�n V� M�t T�ch?/#book_introduce(3)",
		"Chuy�n hi�u qu� Ch�n V� M�t T�ch/#book_introduce(4)",
		"T�ch ch�n quy�n/bookDecompose",
		format("%s/#show_equip_shop(3072)", "��i Ch�n Quy�n Tinh Hoa"),
		"H�n g�p l�i/nothing",
	};
	Say(szMsg, getn(tSel), tSel);
end

BOOK_INTRO_MSG = {
	"<color=Green>Tr�c Thi�n H�nh<color>: Tr��c ti�n ��i hi�p c�n chu�n b� m�t s� <color=Yellow>S� M�n Ch�n Quy�n luy�n ��n c�p 99<color>, sau khi t�ch s� nh�n ���c <color=Yellow>Ch�n Quy�n Tinh Hoa<color>. D�ng Ch�n Quy�n Tinh Hoa c� th� ��i <color=Yellow>Qu�n Th�ng Quy�n<color> v� <color=Yellow>Ch�n V� Th� K�<color>. D�ng v� ti�u hao 1 Qu�n Th�ng Quy�n c� th� th�ng hoa S� M�n Ch�n Quy�n �ang trang b�, b�t ��u tu luy�n Ch�n V� M�t T�ch. Tu luy�n Ch�n V� M�t T�ch v�n c� th� d�ng Nh�n S�m Ng�n N�m ti�n h�nh t�ng t�c.",
	"<color=Green>Tr�c Thi�n H�nh<color>: Tu luy�n Ch�n V� M�t T�ch c�n ti�u hao l�ch luy�n. V�o Ng� C�c mua <color=Yellow>Ch�n V� H�n Th�ch<color> v� <color=Yellow>��i Ch�n V� H�n Th�ch<color> nh�n ���c l�ch luy�n, c�ng c� th� d�ng tu vi �� ��i v�i t� l� <color=Yellow>300:1<color>. Gi�i h�n l�u tr� l�ch luy�n l� 5000 �i�m.",
	"<color=Green>Tr�c Thi�n H�nh<color>: Sau khi ��i hi�p m� tu luy�n s� ph�t hi�n, tr��c hi�u qu� c�a m�i t�ng ��u c� 1 m�nh Hoa V�n Linh Long, m�nh hoa v�n n�y c�n c� v�o m�c �� tu luy�n c�a t�ng �ang luy�n s� th� hi�n ch�t li�u kh�c nhau: Hi�n th� l� ��, t�ng n�y ch�a m� ho�c ch�a tu luy�n; hi�n th� l� ho�ng ��ng, hi�u qu� t�ng n�y n�m trong kho�ng <color=Yellow>1%-33%<color>; hi�n th� l� b�ch ng�n, hi�u qu� t�ng n�y n�m trong kho�ng <color=Yellow>34%-66%<color>; hi�n th� l� ho�ng kim, hi�u qu� t�ng n�y n�m trong kho�ng <color=Yellow>67%-99%<color>; hi�n th� l� x�ch h�ng dung nham, hi�u qu� t�ng n�y tr� t�i �a l� <color=Yellow>100%<color>. Hi�u qu� m�i t�ng c�a Ch�n V� M�t T�ch l� c� ��nh, �� tu luy�n ch� kh�c nhau v� m�t tr� s�.",
	"<color=Green>Tr�c Thi�n H�nh<color>: ��i hi�p d�ng <color=Yellow>Ch�n Quy�n Tinh Hoa<color> c� th� ��i <color=Yellow>Ch�n V� Th� K�<color>. D�ng Ch�n V� Th� K�, c� th� mang hi�u qu� c�a Ch�n V� M�t T�ch (kh�ng bao g�m thu�c t�nh ban ��u c�a Ch�n Quy�n) �ang trang b� vi�t xu�ng. Sau khi vi�t, ti�u hao 1 Ch�n V� Th� K� s� nh�n ���c k� y�u c�a l�u ph�i t��ng �ng, nh�ng thao t�c n�y s� <color=Yellow>x�a b� ho�n to�n<color> hi�u qu� c�a Ch�n V� M�t T�ch (kh�ng bao g�m thu�c t�nh ban ��u c�a Ch�n Quy�n) �ang trang b� tr�n ng��i ��i hi�p; ti�p t�c d�ng k� y�u, c� th� ti�u hao k� y�u n�y �� ghi ch�p hi�u qu� c�a Ch�n V� M�t T�ch tr� v� cho Ch�n Quy�n <color=Yellow>�� th�ng hoa<color> hi�n �ang trang b� (L�u ph�i c�a ch�n quy�n ph�i t��ng �ng v�i k� y�u).",
}

function book_introduce(nType)
	if not BOOK_INTRO_MSG[nType] then return end
	local szMsg = BOOK_INTRO_MSG[nType];
	local tSel = {
		"Ta c�n mu�n t�m hi�u th�m/book_main",
		"Ta bi�t r�i/nothing",
	};
	Say(szMsg, getn(tSel), tSel);
end