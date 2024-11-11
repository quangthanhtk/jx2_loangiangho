--脚本名称：
--脚本功能：
--功能策划：刘亮
--功能开发：朱力
--开发时间：2012-04-20
--代码修改记录

function OnUse(nItemIndex)
	if 32 ~= GetPlayerRoute() then
		Talk(1, "", "V藅 ph萴 d祅h cho C玭 L玭 Ki誱 T玭.");
		return
	end

	SendScript2Client('Open([[EnhanceItem2]],205);');
end
