Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\lib\\message.lua")

g_tLetterMsg = {
	[[��ӡ�׼��������յõ���ԭ��������з𷨣��ջ��ķᡣ��������ʣ���ɽ��ˮ���д����ڡ�ÿ˼����������Цò���������ա�������������ԭ������������֮��ֻ�����׷������޷�����ֻأ��������������а��ڷ����С������в����ھ��ߣ����߾����ܣ��Ա�����ȭȭ֮�顣�Ὣ���յִ�׹��ɽ�����ܵ��ٴ����ӡ֤��֮Ե����֮���ӡ�ɳ�޶���
	]],
}

function OnUse(nItemIdx)
	local g,d,p = GetItemInfoByIndex(nItemIdx);
	suSay(g_tLetterMsg[1],
		1,
		"K�t th�c ��i tho�i/nothing")
end
