Include("\\script\\lib\\floyd.lua")
Import("\\script\\lib\\npccmdhead.lua")
Include("\\script\\missions\\tong_activity\\activity_function.lua")
Include("\\script\\missions\\tong_activity\\cfg\\pos_cfg.lua")
Import("\\script\\lib\\globalfunctions.lua")
--Include("\\script\\lib\\exchangemgr.lua")

g_NpcName = "<color=green>Th��ng Nh�n C�u T��ng Nh�t Gan<color>:";


function main()
	local tMsg = {
		"Qu�i v�t �� r�t cu�c l� c�i g�?/about_boss",
		"Ch�ng ta ph�i l�m sao ��i ph� v�i n�?/about_award_box",
		"Nghe n�i ng��i �ang thu th�p v�t g� �� trong b�o r��ng?/about_collect",
		"C�ch h�c chi�u th�c ri�ng/about_learn_special_skill",
		--"��Ҫѧϰ������ʽ/learn_advanced_skill",
		-- "��Ҫ������������/buy_lucky_item",
		--"��Ҫ�Ͻ��ر�ͼ��ȡ����/exchange_award",
		"R�i kh�i/nothing"
		}
	Say(g_NpcName .. "Th�t ��ng s�.",
		getn(tMsg),
		tMsg);
end

function about_boss()
	local tMsg = {
		"H�m �� ta mang theo manh m�i T�ng B�o �� thu th�p ���c �i ngang b�i ��t tr�ng, ��t nhi�n tr�i t�i s�m, m�t v�t l�n m�u tr�ng... nh�y ra! Ta s� qu�... C�i c� d�i v� khu�n m�t qu�i d� c�a n� �p s�t ta, sau �� th� ta kh�ng nh� g� n�a. Khi t�nh l�i, b�o r��ng �� kh�ng c�n! Ta �� quan s�t n� ���c m�t l�c, nh�t ��nh l� bi�n d� c�a Ng� H�nh Th�!",
		"Sao ta kh�ng t� �i �? Th�y n� ch�n m�m nh�n c� ra. M�i khi t�n c�ng ��n m�c nh�t ��nh s� kh�ng th� t�n c�ng n�a, khi �� s� r�i b�o r��ng � v� tr� b�t k� tr�n b�n �� n�y! C�c ng��i ph�i gi�p ta t�m l�i b�o r��ng v� l�y M�nh T�ng B�o �� trong ��. Ta s� ��i b�o r��ng ch�a b�u v�t kh�c! Nh�ng b�o r��ng n�y c� g� c�n t�y v�o � tr�i."
	};
	Talk(2, "main", g_NpcName .. tMsg[1], g_NpcName .. tMsg[2]);
end


function about_award_box()
	local tMsg = {
		"�� t�m l�i b�o r��ng, ta �� kh� t�m nghi�n c�u chi�u th�c c�a h�n, cu�i c�ng �� t�m ra! D�ng chi�u th�c ri�ng c�a ta k�t h�p v�i thu�c t�nh ng� h�nh. Ta �� d�ng ti�n thu� Ng� H�nh S�, ch� c�n h�c chi�u th�c c�a ta r�i k�t h�p v�i thu�c t�nh ng� h�nh c�a Ng� H�nh S� l� c� th� ��nh b�i n�!",
		"Qu�i v�t �� c� th� thay ��i 5 thu�c t�nh, ng��i ph�i t�m ra thu�c t�nh kh�c ch�, b� quy�t ng� h�nh l�... ��c theo ta n�o: <color=yellow>Kim kh�c M�c, M�c kh�c Th�, Th� kh�c Th�y, Th�y kh�c H�a, H�a kh�c Kim<color> nh� r�i ch�?",
		"<color=yellow>N�u d�ng thu�c t�nh kh�c ch� c� th� g�y s�t th��ng cho n�, d�ng thu�c t�nh b� kh�c ch� s� gi�p n� t�ng l��ng m�u, thu�c t�nh kh�c kh�ng c� t�c d�ng.<color>",
		"Thu�c t�nh ng� h�nh qu� m�nh, ch� khi c� m�t lo�i c�ng ph�p m�i kh�ng b� t�u h�a nh�p ma, ch� c�n m�i ng��i trong bang nh�n ���c m�t lo�i thu�c t�nh, theo thu�c t�nh kh�c ch� nh� ta �� n�i � tr�n, l�n l��t t�n c�ng l� ���c.",
	};
	Talk(4, "main", g_NpcName .. tMsg[1], g_NpcName .. tMsg[2], g_NpcName .. tMsg[3], g_NpcName .. tMsg[4]);
end

function about_collect()
	local tMsg = {
		"M�nh T�ng B�o ��... T�t l�m, n�u ng��i c� th� gi�p ta t�m �� 4 m�nh h�p th�nh 1 T�ng B�o �� ho�n ch�nh, ta s� t�ng ng��i b�o r��ng t�t h�n, c� t� l� cao nh�n ���c v�t ph�m ��c bi�t. Nh�ng <color=yellow>b�u v�t c� gi�i h�n, M�nh v� T�ng B�o �� ho�n ch�nh m�i ng��i ch� ���c ��i 10 l�n. D� l� T�ng B�o �� hay M�nh T�ng B�o �� ��u l� c�a ta, kh�ng ���c mang ra kh�i khu v�c n�y, n�u kh�ng s� b� t�ch thu.<color>"
	};
	
	Talk(1, "main", g_NpcName .. tMsg[1]);
end

function about_learn_special_skill()
	local tMsg = {
		"C�ch h�c chi�u th�c? Chi�u th�c n�y r�t l�i h�i, m�i ng��i ch� ���c c� 1 lo�i chi�u th�c, �� kh�ng b� t�u h�a nh�p ma, ta �� l�n l��t truy�n th� cho Ng� H�nh S�, h�y t�m h� �� h�c. M�i l�n ��i s� qu�n chi�u th�c �� h�c tr��c ��."
	}
	Talk(1, "main", g_NpcName .. tMsg[1]);
end

--function learn_normal_skill()
--	LearnSkill(g_nSkillId);
--	SetLRSkill(g_nSkillId,0);  --��һ������������������Ҽ�ͼ��
--	local szTip1 = "��ϲ�����Ѿ�ѧ��������ʽ��";
--	Talk(1, "", g_NpcName .. szTip1);
--end

--function learn_advanced_skill()
--end

-- function buy_lucky_item()
-- 	local nCostCount = 50;
-- 	local szContent = "��������������ô�������ϴ����ҵ��ĺö���������ʹ���ö���Ĳر�ͼ��Ƭ���ܻ���ɣ�ֻҪ50��������Ըɰ��";
-- 	local tMsg = {
-- 		format("��Ҫ��%d��������Ըɰ��ȡ��������/#do_buy_lucky_item(%d)", nCostCount, nCostCount),
-- 		"��ô�ӣ��ҲŲ����ϵ���/nothing"
-- 	};
-- 	Say(g_NpcName .. szContent,
-- 		getn(tMsg),
-- 		tMsg);
-- end

-- function do_buy_lucky_item(nCostCount)
-- 	local tCostItem = {2, 95, 231};
-- 	local tGiveItem = {2, 111, 156};
-- 	local szTip1 = "������ͯ�����ۣ������Ͽ�û��ô����Ըɰ���������˲��ɣ�";
-- 	local szTip2 = "��ϲ�����Ѿ��ɹ��һ���1���������ң�";
			
-- 	local nCount = GetItemCount(gf_UnPack(tCostItem));
-- 	if nCount == nil or nCount < nCostCount then
-- 		Talk(1, "main", g_NpcName .. szTip1);
-- 		return 0;
-- 	end
	
-- 	--��鱳���ռ�	
-- 	if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
-- 		return 
-- 	end	
	
-- 	--�۳���Ʒ
-- 	if DelItem(tCostItem[1], tCostItem[2], tCostItem[3], nCostCount) ~= 1 then
-- 		return 0;
-- 	end
	
-- 	--����Ʒ
-- 	local szName = GetItemName(gf_UnPack(tGiveItem));
-- 	local nResult, nItemIdx = gf_AddItemEx(tGiveItem, szName, 1);
-- 	if (nResult == 1) and (nItemIdx ~= 0) then
-- 		SetItemExpireTime(nItemIdx, 60*60); --������ƷʱЧΪ1��Сʱ
-- 		Talk(1, "", g_NpcName .. szTip2);
-- 	end
-- end

function exchange_award()
	local szContent = "�� kh�ng c�n nhi�u n�a, mu�n ��i th� nhanh tay l�n n�o. M�i ng��i t�i �a ��i 10 l�n, d� l� T�ng B�o �� hay M�nh T�ng B�o �� c�ng ch� 10 l�n! T�ng B�o �� kh�ng ���c mang ra kh�i khu v�c, n�u kh�ng s� b� t�ch thu. N�u d� c� th� cho ng��i kh�c, nh�ng mu�n thu th�p �� 10 T�ng B�o �� th� kh�ng d� ch�t n�o.";
	local tMsg = {
		"N�p T�ng B�o �� ho�n ch�nh/#do_exchange_award(0)",
		"N�p M�nh T�ng B�o ��/#do_exchange_award(1)",
		"R�i kh�i/nothing"
	};

	Say(g_NpcName .. szContent,
		getn(tMsg),
		tMsg);
end

function do_exchange_award(nType)
	local szTip1 = "Tr�n ng��i kh�ng c� T�ng B�o �� ho�n ch�nh!";
	local szTip2 = "Tr�n ng��i kh�ng c� M�nh T�ng B�o ��!";
	local szTip3 = "M�i ng��i t�i �a ��i 10 l�n, ch� ta �� kh�ng c�n b�o r��ng cho ng��i n�a r�i.";
end
