--脚本名称：外装蕴灵的介绍
--脚本功能：
--功能策划：
--功能开发：朱力
--开发时间：2010-03-09
--代码修改记录

function ShowHelp()
	local szTitle	= "C竎 h� c� bi誸 kh玭g?"
	local tMenu	= {
		"Ta bi誸 r錳 /nothing",
	};

	Say(szTitle, getn(tMenu), tMenu);
end

function ShowHelp_Ex()
	local szTitle	= "C竎 h�  bi誸 r錳??"
	local tMenu	= {
		"Ta bi誸 r錳 /nothing",
	};

	Say(szTitle, getn(tMenu), tMenu);
end

function ShowHelp_Coat()
	local szTitle	= "";
	szTitle = szTitle.."    Ngo筰 trang sau khi 頲 l璾 tr�, v藅 ph萴 s� <color=yellow>bi課 m蕋<color> v� 頲 ghi nh� v祇 'T� 竜 Nh�', 頲 l蕐 ra kh玭g gi韎 h筺 s� l莕 nh璶g s� bi課 th祅h v藅 ph萴 kh鉧, <color=yellow>kh玭g th� giao d辌h<color>, sau khi l蕐 ra c� h筺 s� d鬾g 30 ng祔.\n";
	szTitle = szTitle.."    U萵 Linh sau khi 頲 l璾 tr�, v藅 ph萴 s� <color=yellow>bi課 m蕋<color> v� 頲 ghi nh� v祇 giao di謓 'U萵 Linh''. Khi mua Ng� Hi猲 Thi猲 Bi課 H筽 v� l蕐 ngo筰 trang ra, kh綾 v祇 hi謓 qu� U萵 Linh, c� th� d飊g kh玭g gi韎 h筺 s� l莕.\n";
	szTitle = szTitle.."    襲 ki謓 l璾 tr� ngo筰 trang: V藅 ph萴 b竛 � <color=yellow>T� 竜 Thi猲 Bi課 Ti誹<color> c� t輓h ch蕋 <color=yellow>v躰h vi詎<color> v� v藅 ph萴 ngo筰 trang <color=yellow>v躰h vi詎<color> nh薾 頲 trong game u c� th� l璾 tr�. Kh玭g th� l璾 tr� U萵 Linh chuy觧 sinh.\n";
	--szTitle = szTitle.."    蕴灵能力学习：可以去凤翔的龙光真人处学习与查询。\n";
	szTitle = szTitle.."\n<color>";
	Say(szTitle, 1, {"Ta bi誸 r錳 /nothing"});
end

function ShowHelp_Coat_Ex()
	local szTitle	= "";
	szTitle = szTitle.."    Ngo筰 trang sau khi 頲 l璾 tr�, v藅 ph萴 s� <color=yellow>bi課 m蕋<color> v� 頲 ghi nh� v祇 'T� 竜 Nh�', 頲 l蕐 ra kh玭g gi韎 h筺 s� l莕, sau khi l蕐 ra c� h筺 s� d鬾g 30 ng祔.\n";
	szTitle = szTitle.."    U萵 Linh sau khi 頲 l璾 tr�, v藅 ph萴 s� <color=yellow>bi課 m蕋<color> v� 頲 ghi nh� v祇 giao di謓 'U萵 Linh'. Khi mua Ng� Hi猲 Thi猲 Bi課 H筽 v� l蕐 ngo筰 trang ra, kh綾 v祇 hi謓 qu� U萵 Linh, c� th� d飊g kh玭g gi韎 h筺 s� l莕.\n";
	szTitle = szTitle.."    襲 ki謓 l璾 tr� ngo筰 trang: V藅 ph萴 b竛 � <color=yellow>T� 竜 Thi猲 Bi課 Ti誹<color> c� t輓h ch蕋 <color=yellow>v躰h vi詎<color> v� v藅 ph萴 ngo筰 trang <color=yellow>v躰h vi詎<color> nh薾 頲 trong game u c� th� l璾 tr�. Kh玭g th� l璾 tr� U萵 Linh chuy觧 sinh.\n";
	--szTitle = szTitle.."    蕴灵能力学习：可以去凤翔的龙光真人处学习与查询。\n";
	szTitle = szTitle.."\n";
	Say(szTitle, 1, {"Ta bi誸 r錳 /nothing"});
end

function ShowHelp_Horse()
	local szTitle	= "";
	szTitle = szTitle.."    Th� ci sau khi 頲 l璾 tr�, v藅 ph萴 s� <color=yellow>bi課 m蕋<color> v� 頲 ghi nh� v祇 'Chu錸g Ng鵤 Nh�', 頲 l蕐 ra kh玭g gi韎 h筺 s� l莕, sau khi l蕐 ra c� h筺 s� d鬾g 30 ng祔.\n";
	szTitle = szTitle.."    Th� ci sau khi 頲 l璾 tr�, l蕐 ra s� bi課 th祅h v藅 ph萴 kh鉧, <color=yellow>kh玭g th� giao d辌h<color>.\n";
	--szTitle = szTitle.."    有时限的坐骑不能常伴身侧，故不能被收藏。"
	szTitle = szTitle.."\n";
	Say(szTitle, 1, {"Ta bi誸 r錳 /nothing"});
end

ShowHelp_Horse_Ex	= ShowHelp_Horse;

--function ShowHelp_Follower()
--	local szTitle	= "";
--	szTitle = szTitle.."    ◆ 跟宠被收藏后，物品将<color=yellow>消失<color>并记录到“小小兽槛”中，可无限次取出。\n";
--	szTitle = szTitle.."    ◆ 跟宠被收藏后，再次取出即为绑定物品，<color=yellow>不可交易<color>。\n";
--	szTitle = szTitle.."    ◆ 有时限的跟宠不能常伴身侧，故不能被收藏。"
--	szTitle = szTitle.."\n";
--	Say(szTitle, 1, {"我知道了 /nothing"});
--end

ShowHelp_Follower_Ex	= ShowHelp_Follower;

function ShowHelp_Ornament()
	local szTitle	= "";
	szTitle = szTitle.."    Trang s鴆 sau khi 頲 l璾 tr�, v藅 ph萴 s� <color=yellow>bi課 m蕋<color> v� 頲 ghi nh� v祇 'Tr竝 Ng鋍 Nh�', 頲 l蕐 ra kh玭g gi韎 h筺 s� l莕, sau khi l蕐 ra c� h筺 s� d鬾g 30 ng祔.\n";
	szTitle = szTitle.."    Trang s鴆 sau khi 頲 l璾 tr�, l蕐 ra s� bi課 th祅h v藅 ph萴 kh鉧, <color=yellow>kh玭g th� giao d辌h<color>.\n";
	szTitle = szTitle.."    Trang s鴆 c� h筺 s� d鬾g kh玭g th� 甧o tr猲 ngi thng xuy猲, n猲 kh玭g th� l璾 tr�."
	szTitle = szTitle.."\n";
	Say(szTitle, 1, {"Ta bi誸 r錳 /nothing"});
end

ShowHelp_Ornament_Ex	= ShowHelp_Ornament;

function nothing()
end
