--ºê¸£ºÀÏÀÁî(2,1,30803)
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")

g_WeaponDialog = {
	baseAttr = {
		["Vò khÝ s¸t th­¬ng"] = {{1597, 1601}, 1605, 1609},
		["CÇm chuyªn dïng"] = {{1614, 1618}, 1622, 1626},
		["Néi c«ng "] = {1631, 1635, 1639},
		["Ngo¹i c«ng"] = {1644, 1648, 1652},	
	},
	UnLockAttr = {
		{1855, 1858, 1852, 1861, 1864, 1867},
		{1869, 1870, 1871, 1872, 1873, 1876},
		{1880, 1883, 1886, 1887, 1888, 1889, 1890, 1891, 1894},
	},
};

g_RingDialog = {
	baseAttr = {
		{1657, 1661, 0},
	},
	UnLockAttr = {
		{1896, 1897, 1898, 1899, 1900, 1901, 1902, 1903, 1904, 1905, 1906, 1907},
		{1911, 1914, 1917, 1920, 1921, 1922, 1923},
		{1925, 1928, 1934, 1935, 1936, 1937, 1938, 1940, 1943, 1944, 1947},
	},
};

g_CapDialog = {
	baseAttr = {
		{1558, 1562, 1566},
	},
	UnLockAttr = {
		{1665, 1668, 1671, 1674, 1677, 1680, 1681, 1682, 1683, 1684, 1685},
		{1689, 1692, 1695, 1698, 1699, 1700, 1701, 1702, 1703, 1704, 1705, 1706, 1707, 1708, 1709, 1710, 1711, 1712, 1713},
		{1715, 1716, 1717, 1720, 1721, 1722},
	},
};

g_ClothDialog = {
	baseAttr = {
		{1571, 1575, 1579},
	},
	UnLockAttr = {
		{1726, 1729, 1732, 1736, 1740, 1743, 1744, 1745, 1746, 1747, 1748},
		{1752, 1755, 1758, 1761, 1762, 1763, 1764, 1765, 1766, 1767, 1768, 1769, 1770, 1771, 1772, 1773, 1774, 1775, 1776},
		{1778, 1779, 1780, 1783, 1784, 1785},
	},
};

g_ShoeDialog = {
	baseAttr = {
		{1584, 1588, 1592},
	},
	UnLockAttr = {
		{1789, 1792, 1795, 1799, 1803, 1806, 1807, 1808, 1809, 1810, 1811},
		{1815, 1818, 1821, 1824, 1825, 1826, 1827, 1828, 1829, 1830, 1831, 1832, 1833, 1834, 1835, 1836, 1837, 1838, 1839},
		{1841, 1842, 1843, 1846, 1847, 1848},
	},
};

g_ItemFeedDialog = {
	title = "H·y chän bé phÇn mµ b¹n cÇn:",
	dialog = {
		["Vò khÝ"] = {
			title = "H·y chän lo¹i vò khÝ:",
			dialog = {
				["V« H¹ Hµo HiÖp §ao (ThiÕu L©m §ao)"] = g_WeaponDialog,
				["V« H¹ Hµo HiÖp Tr­îng (ThiÕu L©m ThiÒn)"] = g_WeaponDialog,
				["V« H¹ Hµo HiÖp Thñ (ThiÕu L©m Thñ)"] = g_WeaponDialog,
				["V« H¹ Hµo HiÖp Ch©m (§­êng M«n Ch©m)"] = g_WeaponDialog,
				["V« H¹ Hµo HiÖp KiÕm (Nga My KiÕm)"] = g_WeaponDialog,
				["V« H¹ Hµo HiÖp CÇm (Nga My CÇm)"] = g_WeaponDialog,
				["V« H¹ Hµo HiÖp Thñ (C¸i Bang Thñ)"] = g_WeaponDialog,
				["V« H¹ Hµo HiÖp C«n (C¸i Bang C«n)"] = g_WeaponDialog,
				["V« H¹ Hµo HiÖp KiÕm (Vâ §ang KiÕm)"] = g_WeaponDialog,
				["V« H¹ Hµo HiÖp Bót (Vâ §ang Bót)"] = g_WeaponDialog,
				["V« H¹ Hµo HiÖp Th­¬ng (D­¬ng M«n Th­¬ng)"] = g_WeaponDialog,
				["V« H¹ Hµo HiÖp Cung (D­¬ng M«n Cung)"] = g_WeaponDialog,
				["V« H¹ Hµo HiÖp Song §ao (Ngò §éc §ao)"] = g_WeaponDialog,
				["V« H¹ Hµo HiÖp Tr¶o (Ngò §éc Tr¶o)"] = g_WeaponDialog,
				["V« H¹ Hµo HiÖp KiÕm (C«n L«n Thiªn S­)"] = g_WeaponDialog,
				["V« H¹ Hµo HiÖp PhiÕn (Thóy Yªn PhiÕn)"] = g_WeaponDialog,
				["V« H¹ Hµo HiÖp §Þch (Thóy Yªn §Þch)"] = g_WeaponDialog,
			},
		},
		["Hé gi¸p"] = {
			title = "H·y chän lo¹i hé gi¸p:",
			dialog = {
				["Nãn Hµo HiÖp-V« H¹"] = g_CapDialog,
				["¸o Hµo HiÖp-V« H¹"] = g_ClothDialog,
				["QuÇn Hµo HiÖp-V« H¹"] = g_ShoeDialog,
			},
		},
		["Trang søc"] = {
			title = "H·y chän lo¹i trang søc:",
			dialog = {
				["Hµo HiÖp Giíi-V« H¹"] = g_RingDialog,
				["Hµo HiÖp Béi-V« H¹"] = g_RingDialog,
			},		
		},
	},
};

g_ItemFeedAward = {
	["Vò khÝ"] = {
		["V« H¹ Hµo HiÖp §ao (ThiÕu L©m §ao)"] = 	 {0,	3	, 30744, 1, 4, -1, -1, -1, -1, -1, -1},
		["V« H¹ Hµo HiÖp Tr­îng (ThiÕu L©m ThiÒn)"] = 	 {0,	8	, 30745, 1, 4, -1, -1, -1, -1, -1, -1},
		["V« H¹ Hµo HiÖp Thñ (ThiÕu L©m Thñ)"] = 	 {0,	0	, 30746, 1, 4, -1, -1, -1, -1, -1, -1},
		["V« H¹ Hµo HiÖp Ch©m (§­êng M«n Ch©m)"] = 	 {0,	1	, 30747, 1, 4, -1, -1, -1, -1, -1, -1},
		["V« H¹ Hµo HiÖp KiÕm (Nga My KiÕm)"] = 	 {0,	2	, 30748, 1, 4, -1, -1, -1, -1, -1, -1},
		["V« H¹ Hµo HiÖp CÇm (Nga My CÇm)"] = 	 {0,	10, 30749, 1, 4, -1, -1, -1, -1, -1, -1},
		["V« H¹ Hµo HiÖp Thñ (C¸i Bang Thñ)"] = 	 {0,	0	, 30750, 1, 4, -1, -1, -1, -1, -1, -1},
		["V« H¹ Hµo HiÖp C«n (C¸i Bang C«n)"] = 	 {0,	5	, 30751, 1, 4, -1, -1, -1, -1, -1, -1},
		["V« H¹ Hµo HiÖp KiÕm (Vâ §ang KiÕm)"] = 	 {0,	2	, 30752, 1, 4, -1, -1, -1, -1, -1, -1},
		["V« H¹ Hµo HiÖp Bót (Vâ §ang Bót)"] = 	 {0,	9	, 30753, 1, 4, -1, -1, -1, -1, -1, -1},
		["V« H¹ Hµo HiÖp Th­¬ng (D­¬ng M«n Th­¬ng)"] = 	 {0,	6	, 30754, 1, 4, -1, -1, -1, -1, -1, -1},
		["V« H¹ Hµo HiÖp Cung (D­¬ng M«n Cung)"] = 	 {0,	4	, 30755, 1, 4, -1, -1, -1, -1, -1, -1},
		["V« H¹ Hµo HiÖp Song §ao (Ngò §éc §ao)"] = {0,	7	, 30756, 1, 4, -1, -1, -1, -1, -1, -1},
		["V« H¹ Hµo HiÖp Tr¶o (Ngò §éc Tr¶o)"] = 	 {0,	11, 30757, 1, 4, -1, -1, -1, -1, -1, -1},
		["V« H¹ Hµo HiÖp KiÕm (C«n L«n Thiªn S­)"] = 	 {0,	2	, 30758, 1, 4, -1, -1, -1, -1, -1, -1},
		["V« H¹ Hµo HiÖp PhiÕn (Thóy Yªn PhiÕn)"] = 	 {0,	13, 30762, 1, 4, -1, -1, -1, -1, -1, -1},
		["V« H¹ Hµo HiÖp §Þch (Thóy Yªn §Þch)"] = 	 {0,	12, 30763, 1, 4, -1, -1, -1, -1, -1, -1},
	},
	["Hé gi¸p"] = {
		["Nãn Hµo HiÖp-V« H¹"] = {0, 103, 30569, 1, 4, -1, -1, -1, -1, -1, -1},
		["¸o Hµo HiÖp-V« H¹"] = {0, 100, 30569, 1, 4, -1, -1, -1, -1, -1, -1},
		["QuÇn Hµo HiÖp-V« H¹"] = {0, 101, 30569, 1, 4, -1, -1, -1, -1, -1, -1},
	},
	["Trang søc"] = {
		["Hµo HiÖp Giíi-V« H¹"] = {0, 102, 31128, 1, 4, -1, -1, -1, -1, -1, -1},
		["Hµo HiÖp Béi-V« H¹"] = {0, 102, 31129, 1, 4, -1, -1, -1, -1, -1, -1},		
	},
};

function GetItemFeedAttrDesc(LineID)
	if not g_FeedItemDesc then
		g_ItemFeedDesc = {};
	end
	if not g_ItemFeedDesc[LineID] then
		g_ItemFeedDesc[LineID] = GetItemFeedAttiDesc(LineID);
	end	
	return g_ItemFeedDesc[LineID];
end

function ComposeFeedItem(nItem)
	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	local szName = GetName();
	local tRet = tempEquipType[szName];
	local tLineID = tempLineID[szName];
	local nRet, nItemIdx = gf_AddItemEx2(g_ItemFeedAward[tRet[1]][tRet[2]], tRet[2], "Hång Phóc Hµo HiÖp LÖnh", tRet[2], 0, 1);
	if nItemIdx then
		SetItemFeedUpAttrs(nItemIdx, tLineID[1], tLineID[2], tLineID[3], tLineID[4], tLineID[5], tLineID[6]);
		gf_WriteLogEx("Hång Phóc Hµo HiÖp LÖnh", tRet[2], format("Index:%d LineID:%d|%d|%d|%d|%d|%d", nItemIdx, tLineID[1], tLineID[2], tLineID[3], tLineID[4], tLineID[5], tLineID[6]))
		AddRuntimeStat(29, 11, 0, 1);
	end
end

--Ñ¡Ôñ½âËøÊôÐÔ
function ChoiceUnLockAttr(nItem, nLineID)
	local szName = GetName();
	local tDialog = tempOpenDialog[szName];
	local tLineID = tempLineID[szName];
	if nLineID then
		tLineID[getn(tLineID) + 1] = nLineID;
	end
	if getn(tLineID) < 6 then
		local nIndex = getn(tLineID) - 2;
		local unlock = tDialog.UnLockAttr;
		local tCurrList = unlock[nIndex];
		local tbSay = {};
		local tName = {"Thuéc tÝnh tÊn c«ng", "Thuéc tÝnh phßng thñ", "Thuéc tÝnh kh¸c"};
		tbSay.msg = format("H·y chän thuéc tÝnh %s t­¬ng øng:", tName[nIndex]);
		tbSay.sel = {};			
		for i = 1, getn(tCurrList) do
			tinsert(tbSay.sel, {GetItemFeedAttiDesc(tCurrList[i]), 
				format("#ChoiceUnLockAttr(%d, %d)", nItem, tCurrList[i])});
		end
		tinsert(tbSay.sel, {"\n rót lui", "nothing"});
		temp_Talk(tbSay);
		return 0;
	end
	--×îºóµÄÈ·ÈÏ
	local tRet = tempEquipType[szName];
	local msg = "Thuéc tÝnh lùa chän cuèi cïng nh­ sau:\n";
	msg = msg..format("    Thuéc tÝnh mÆc ®Þnh: <color=green>%s, %s, %s<color>\n", GetItemFeedAttiDesc(tLineID[1]), GetItemFeedAttiDesc(tLineID[2]), GetItemFeedAttiDesc(tLineID[3]));
	msg = msg..format("    Thuéc tÝnh më khãa: <color=green>%s, %s, %s<color>\n", GetItemFeedAttiDesc(tLineID[4]), GetItemFeedAttiDesc(tLineID[5]), GetItemFeedAttiDesc(tLineID[6]));
	msg = msg..format("QuyÕt ®Þnh dïng <color=gold>%s<color> ghÐp thµnh <color=gold>%s<color> kh«ng?", GetItemName(nItem), tRet[2]);
	Say(msg, 2, 
		format("§ång ý/#ComposeFeedItem(%d)", nItem),
		"§Ó ta suy nghÜ/nothing");
end

--Ñ¡Ôñ»ù´¡ÊôÐÔ
function ChoiceBaseAttr(nItem, szKey, nTempID)
	local szName = GetName();
	local tDialog = tempOpenDialog[szName];
	local tLineID = tempLineID[szName];
	if getn(tLineID) < 3 then
		local base = tDialog.baseAttr;
		if getn(base) == 1 then
			for i = 1, getn(base[1]) do
				tLineID[i] = base[1][i];
			end
		else
			if not szKey then
				local tSay = {};
				for k, v in base do
					tinsert(tSay, format("%s/#ChoiceBaseAttr(%d, '%s')", k, nItem, k));
				end
				tinsert(tSay, "\n rót lui/nothing");
				Say("H·y chän thuéc tÝnh vò khÝ yªu thÝch:", getn(tSay), tSay);
				return 0;
			elseif not nTempID then
				local t = base[szKey];
				if type(t[1]) == "table" then
					Say("H·y chän thuéc tÝnh vò khÝ yªu thÝch:", 3, 
						format("\n%s/#ChoiceBaseAttr(%d, '%s', %d)", GetItemFeedAttrDesc(t[1][1]), nItem, szKey, t[1][1]),
						format("\n%s/#ChoiceBaseAttr(%d, '%s', %d)", GetItemFeedAttrDesc(t[1][2]), nItem, szKey, t[1][2]),
					"\n rót lui/nothing")			
					return 0;
				end
				ChoiceBaseAttr(nItem, szKey, t[1]);
				return 0;
			else
				tLineID[1] = nTempID;
				local t = base[szKey];
				for i = 2, getn(t) do
					tLineID[i] = t[i];
				end
			end
		end
	end
	ChoiceUnLockAttr(nItem);
end

--Ñ¡Ôñ×°±¸
function ChoiceEquip(nItem, sKey)
	local szName = GetName();
	local tDialog = tempOpenDialog[szName];
	local tRet = tempEquipType[szName];
	if sKey then 
		tRet[getn(tRet) + 1] = sKey; 
		tempOpenDialog[szName] = tDialog.dialog[sKey];
		tDialog = tempOpenDialog[szName];
	end	
	if getn(tRet) < 2 then
		local tbSay = {};
		tbSay.msg = tDialog.title;
		tbSay.sel = {};			
		for k, v in tDialog.dialog do
			tinsert(tbSay.sel, {k, format("#ChoiceEquip(%d, %s)", nItem, Val2Str(k))});
		end
		tinsert(tbSay.sel, {"\n rót lui", "nothing"});
		temp_Talk(tbSay);
		return 0;
	end
	ChoiceBaseAttr(nItem);
end

function OnUseItem(nItem)
	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end
	if gf_Check55FullSkill() ~= 1 then
		Talk(1,"","Gia nhËp l­u ph¸i vµ häc kü n¨ng cÊp 55 míi ®­îc dïng!");
		return 0;
	end
	if not tempOpenDialog then tempOpenDialog = {} end
	if not tempEquipType then tempEquipType = {}; end
	if not tempLineID then tempLineID = {}; end
	local szName = GetName();
	tempOpenDialog[szName] = g_ItemFeedDialog;
	tempEquipType[szName] = {};
	tempLineID[szName] = {};
	ChoiceEquip(nItem);
end

function OnUse(nItem)
	Say("Dïng <color=gold>Hång Phóc Hµo HiÖp LÖnh<color> cã thÓ ghÐp thµnh <color=gold>trang bÞ Hµo HiÖp-V« H¹<color>, ®ång ý dïng kh«ng?", 2,
		 format("\n§ång ý dïng/#OnUseItem(%d)", nItem), "\n§Ó ta suy nghÜ l¹i/nothing");
end