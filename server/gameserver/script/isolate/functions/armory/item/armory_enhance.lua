--�ű����ƣ�
--�ű����ܣ�
--���ܲ߻�������
--���ܿ���������
--����ʱ�䣺2010-03-29
--�����޸ļ�¼

Import("\\script\\lib\\globalfunctions.lua");


g_tItem = { -- ����
	[14] = {"C� Kim Th�ch",	2,	201,	14},
	[15] = {"�i�m Tinh Ng�c",	2,	201,	15},
	[16] = {"�i�m Tinh Ng�c-Nh�",	2,	201,	16},
};

function OnUse(idx)
	local nItemIndex	= tonumber(idx);
	local nG, nD, nP	= GetItemInfoByIndex(nItemIndex);
	local tItem		= g_tItem[nP];

	if not tItem then
		return 0;
	end

	if tItem[2] ~= nG or tItem[3] ~= nD or tItem[4] ~= nP then
		return 0;
	end

	SendScript2Client('Open([[CommonEnhanceItem]],203);');

	return 1;
end
