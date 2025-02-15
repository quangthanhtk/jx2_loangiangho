--脚本名称：
--脚本功能：
--功能策划：刘亮
--功能开发：朱力
--开发时间：2010-03-29
--代码修改记录

Import("\\script\\lib\\globalfunctions.lua");


g_tItem = { -- 包包
	[14] = {"C� Kim Th筩h",	2,	201,	14},
	[15] = {"觤 Tinh Ng鋍",	2,	201,	15},
	[16] = {"觤 Tinh Ng鋍-Nh�",	2,	201,	16},
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
