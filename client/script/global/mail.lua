--脚本名称：邮箱
--脚本功能：
--功能策划：
--功能开发：朱力
--开发时间：2010-12-16
--代码修改记录

tMsg = {
	"<color=green>Hng d蒼 s� d鬾g h閜 th�:<color>\n"..
	"    <color=yellow>цi thng g鰅 th�<color>: H秓 h鱱, th祅h vi猲 bang h閕, c鮱 nh﹏, ngi ch琲 b蕋 k� trong danh s竎h 甧n.\n"..
	"    <color=yellow>襲 ki謓 g鰅 th�<color>: Ngi ch琲 c蕄 10 tr� l猲 m韎 頲 g鰅 th�. M鏸 ng祔 頲 g鰅 t鑙 產 3 th�.",
	"    <color=yellow>襲 ki謓 v藅 ph萴 nh k蘭 qua th�<color>: <color=red> B﹜ gi� t筸 kh玭g th� g鰅 v藅 ph萴 v� ti襪 v祅g cho ngi ch琲 kh竎.\n"..
	"    <color=yellow>Quy t綾 l璾 th�<color>: цi v韎 th� ch璦 c, h� th鑞g s� l璾 l筰 trong 30 ng祔, sau  s� t� ng x鉧. цi v韎 th�  c v� c� nh k蘭 ch璦 nh薾, h� th鑞g s� l璾 l筰 trong 30 ng祔, sau  t� ng x鉧. цi v韎 th�  c v� kh玭g c� nh k蘭, h� th鑞g s� l璾 l筰 3 ng祔, sau  t� ng x鉧. Th� c� nh k蘭 s� 頲 nh d蕌 [!]  nh綾 nh�.\n\n",
	"    <color=red>Nh綾 nh� 1<color>: K� hi謚 th� c馻 th� h� th鑞g l� logo game, k� hi謚 th� c馻 ngi ch琲 l� th� thng. Vui l遪g kh玭g tin v祇 b蕋 k� th� c馻 ngi ch琲 n祇 t� nh薾 l� ngi c馻 B, <color=red>h琻 n鱝 B c騨g kh玭g bao gi� y猽 c莡 ngi ch琲 cung c蕄 th玭g tin t礽 kho秐 v� m藅 kh萿. H穣 c萵 th薾  ph遪g!<color>\n",
	"    <color=red>Nh綾 nh� 2<color>: Khi b筺 c遪 th� ch璦 c, k� hi謚 nh綾 nh� th� s� l鉫 s竛g, k� hi謚 nh綾 nh� th� n籱 � b猲 tr竔 b秐  nh� trong giao di謓 ch輓h. H穣 ch� � c th� k辮 th阨, tr竛h qu� h筺 s� b� h� th鑞g x鉧!\n",
	"    <color=red>Nh綾 nh� 3<color>: N誹 v� l� do c� nh﹏ m� kh玭g th� c th� k辮 l骳, d蒼 n v藅 ph萴 nh k蘭 trong th� qu� h筺 v� b� x鉧, t蕋 c� s� kh玭g 頲 x� l�!",
}


function show_help()
	Talk(getn(tMsg), "", unpack(tMsg));
end
