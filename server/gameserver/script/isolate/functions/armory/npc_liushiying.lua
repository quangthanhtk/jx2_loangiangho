--�칤������ʫӢ

g_NpcName = "<color=green>Thi�n c�ng x�o th� L�u Thi Anh<color>:";

function main()
	local strtab = {
		format("%s/#lsy_enhance(201)", "Mu�n c��ng h�a thu�c t�nh c� b�n c�a V�n S�c"),
		format("%s/#lsy_enhance(202)", "Mu�n t�ng ph�m ch�t V�n S�c"),
		-- format("%s/#lsy_enhance(206)", "��Ҫ�����̰�"),
--		format("%s/#lsy_enhance(204)", "��Ҫ������������"),
		--format("%s/change_lv4_armory", "ת��4������ר�������������(ÿ��10000��)"),
		format("%s/lsy_intro_main", "Gi�i thi�u V�n S�c"),
		format("%s/nothing", "Ra kh�i"),
	};
	Say(g_NpcName.."",
		getn(strtab),
		strtab)
end

function lsy_enhance(nType)
	nType = nType or 201;
	SendScript2Client(format("Open([[CommonEnhanceItem]],%d);", nType));
end

function lsy_intro_main()
	local strtab = {
		format("%s/#lsy_intro(1)", "V�n S�c l� g�"),
		format("%s/#lsy_intro(2)", "C��ng h�a c�p V�n S�c c� t�c d�ng g�"),
		format("%s/#lsy_intro(3)", "T�ng ph�m ch�t V�n S�c c� t�c d�ng g�"),
		-- format("%s/#lsy_intro(4)", "��ξ�����������"),
		format("%s/#lsy_intro(5)", "C�ch nh�n V�n S�c"),
		format("%s/#lsy_intro(6)", "C�ch nh�n nguy�n li�u c��ng h�a V�n S�c"),
		format("%s/#lsy_intro(7)", "C��ng h�a V�n S�c Nh� Th� N�o"),
		format("%s/#lsy_intro(8)", "N�ng c�p ph�m ch�t V�n S�c nh� th� n�o"),
		format("%s/nothing", "Ra kh�i"),
	};
	Say(g_NpcName.."",
		getn(strtab),
		strtab)
end


lsy_tIntro = {
	[1] = "Nguy�n li�u V�n S�c g�m Ch� V�ng, Ng�n Ti, Ng�c Th�ch, M� N�o, s� d�ng k� thu�t c� ��ng Ph��ng �� r�p h�nh v�o trang b�, \n     c� s�c m�nh ng� h�nh, kh�ng ch� t�ng thu�c t�nh chi�n ��u c�a ng��i mang, m� c�n t�ng ph�ng ng� ng� h�nh. ",
	[2] = "C��ng h�a c�p V�n S�c s� t�ng kh�ng t�nh ng� h�nh t��ng �ng, gi�m s�t th��ng c�a thu�c t�nh ng� h�nh t��ng �ng.",
	[3] = "V�n S�c g�m 4 ph�m ch�t: V�, Th��ng, V� H�, Ho�n m�.\n    T�ng ph�m ch�t V�n S�c s� t�ng gi� tr� c�a b� ph�n V�n S�c �ang �eo ho�c t�t c� thu�c t�nh chi�n ��u.",
	[4] = "Tinh luy�n/tr�ng luy�n V�n S�c c� th� tr�ng luy�n V�n S�c V� H� v� Ho�n M� th�nh V�n S�c Kh�c B�n c�ng v� tr� c�p cao h�n, c�n c� �� c��ng h�a c�a V�n S�c ban ��u ho�n tr� nguy�n li�u c��ng h�a v�i s� l��ng nh�t ��nh. Quy t�c ho�n tr� nh� sau:\n",
	[5] = "Th�i �� c�a Chi�t Xung X� ��i v�i b�n s� quy�t ��nh lo�i v�n s�c m� b�n c� th� nh�n ���c, cho n�n n�ng c�p danh v�ng Chi�t Xung X� c� th� nh�n ���c t�t c� c�c lo�i trang s�c. \n ti�u hao kh�c b�n v�n s�c c� th� nh�n ���c v�n s�c t��ng �ng v� tr� v�i thu�c t�nh ng�u nhi�n v� ng� h�nh.",
	[6] = "Trong ph� b�n anh h�ng Ki�m ��ng Y�n V�n c� th� nh�n ���c nguy�n li�u c��ng h�a v�n s�c.",
	[7] = "C��ng h�a v�n s�c c�n ti�u hao L�u Kim, trong qu� tr�nh c��ng h�a c� th� th�m v�o Thi�n V�n Th�ch �� gi�m t�n th�t khi c��ng h�a th�t b�i.\n    Sau khi �� c��ng h� V�n S�c ��t ��n 10, ti�p t�c c��ng h�a ph�i th�m v�o Thi�n V�n Th�ch m�i c� th� ti�n h�nh c��ng h�a.",
	[8] = "N�ng c�p ph�m ch�t c�n ti�u hao V�n S�c c� ��ng c�p, v� tr�, ph�m ch�t ��u gi�ng nhau.\n    Nguy�n li�u th�m v�o c�ng nhi�u, x�c su�t th�nh c�ng th� c�ng cao. <color=red>(n�u V�n S�c c�n n�ng c�p ph�m ch�t ho�c nguy�n li�u �� n�ng c�p c� v�t ph�m kh�a, th� V�n S�c sau khi n�ng c�p c�ng s� b� kh�a. )<color>",
};

function lsy_intro(nType)
	if not lsy_tIntro[nType] then return end
	Talk(1,"lsy_intro_main",g_NpcName..lsy_tIntro[nType]);
end
