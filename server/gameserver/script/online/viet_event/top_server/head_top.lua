-- VNG event �ua top server
-- Created by TuanNA5
-- Modify by PhucBDB 14/12/2011
-- Modify by DoanDVP 10/07/2014

Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");

TOP_START_DATE = 20200318
TOP_END_DATE  = 20200518
TSK_TOP_TRANSLIFE1 = 1	--Top 1 h� ph�i, s� d�ng task TSK_TOP_AWARD (Bit 1)
TSK_TOP_HORNOR = 2
TSK_TOP_1MIL_HORNOR = 3	--Top 1 ��t 3t5 c�ng tr�ng + Top 3 ��t 2t8 c�ng tr�ng, , s� d�ng task TSK_TOP_AWARD (Bit 3)
TSK_TOP_TRANSLIFE3 = 3
TOP_CREATED_ROLE = 1324490626
TOP_SERVER_ID = 128
szLOGSERVERNAME = "SAT HO"

-- Qui ��nh gia tr� �i�m danh v�ng , s� m�n , qu�n c�ng , top Level nh�n th��ng theo ��ng c�p
tb_topserver_award_limit = {				
				[76] = {  3000,   4000,   50000,     0},
				[77] = {  3000,   4000,   50000,     1},
				[78] = {  4000,   5000,   55000,     2},
				[79] = {  5000,   5000,   55000,     3},
				[80] = {  6000,   5000,   55000,     4},
				[81] = {  7000,   6000,   55000,     5},
				[82] = {  8000,   7000,   60000,     6},
				[83] = {  9000,   8000,   60000,     7},
--				[84] = {10000,   9000,   70000,   	 8},
--				[85] = {10000, 10000,   80000,    9},				
				[86] = {10000, 10000,   80000,    8},
				[87] = {10000, 10000,   80000,    9},
				[88] = {10000, 10000,   80000,    10},
				[89] = {10000, 10000,   80000,    11},
--				[90] = {10000, 10000,   80000,    14},
				[91] = {11000, 11000,   85000,    12},
				[92] = {11000, 11000,   90000,    13},
				[93] = {11000, 11000,   95000,    14},
				[94] = {12000, 12000,   120000,    15},
--				[98] = {16000, 16000,   160000,    19},
				[99] = {14000, 14000,   140000,    16},
--				[192] = {22000, 22000, 220000, 21},
--				[292] = {25000, 25000, 250000, 22},
--				[396] = {25000, 25000, 250000, 23},
};
-- Danh s�ch ID Skill 55
tRouteSkillInfo =
{
				[0] = 0,
				[1] = 0,
				[2] = 31,
				[3] = 56,
				[4] = 43,
				[5] = 0,
				[6] = 73,
				[7] = 0,
				[8] = 88,
				[9] = 101,
				[10] = 0,
				[11] = 112,
				[12] = 123,
				[13] = 0,
				[14] = 145,
				[15] = 158,
				[16] = 0,
				[17] = 731,
				[18] = 744,
				[19] = 0,
				[20] = 377,
				[21] = 363,
				[22] = 0,
				[23] = 1030,
				[24] = 0,
				[25] = 1065,
				[26] = 1093,
				[27] = 1143,
				[28] = 0,
				[29] = 1176,
				[30] = 1229,
				[31] = 1882,
				[32] = 1896,
}
-- Danh s�ch ID Skill tr�n ph�i
tFactionSkillInfo =
{
		[0] = 0,
		[1] = 0,	
		[2] = 32,	
		[3] = 57,	
		[4] = 44,	
		[5] = 0,	
		[6] = 74,	
		[7] = 0,	
		[8] = 89,	
		[9] = 102,
		[10] = 0,			
		[11] = 113,
		[12] = 124,
		[13] = 0,		
		[14] = 146,
		[15] = 159,
		[16] = 0,		
		[17] = 732,
		[18] = 745,
		[19] = 0,		
		[20] = 775,
		[21] = 774,
		[23] = 1032,
		[24] = 0,
		[25] = 1066,
		[26] = 1094,
		[27] = 1144,
		[28] = 0,
		[29] = 1196,
		[30] = 1230,
		[31] = 1883,
		[32] = 1897,
}

--Trang b� chi�n cu�ng
tbTrangBiChienCuong = {
	[100] = {
		[1] = {
			[2] = {item={{gdp={0,100,30143,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n ��a B�o"}}},
			[4] = {item={{gdp={0,100,30145,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ph� T� B�o"}}},
			[3] = {item={{gdp={0,100,30147,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n T�n B�o"}}},
			[6] = {item={{gdp={0,100,30149,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tuy�t M�nh Y"}}},
			[11] = {item={{gdp={0,100,30157,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�n Du Y"}}},
			[12] = {item={{gdp={0,100,30161,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ti�u Dao Y"}}},
			[14] = {item={{gdp={0,100,30165,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng V� Vi B�o"}}},
			[15] = {item={{gdp={0,100,30169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C�n Kh�n B�o"}}},
			[17] = {item={{gdp={0,100,30173,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n Tinh  Gi�p"}}},
			[18] = {item={{gdp={0,100,30177,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Xuy�n V�n Gi�p"}}},
			[20] = {item={{gdp={0,100,30181,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Minh T�n Y"}}},
			[21] = {item={{gdp={0,100,30185,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C� T�m Y"}}},
			[23] = {item={{gdp={0,100,30189,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Phong L�i B�o"}}},
			[25] = {item={{gdp={0,100,30191,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng ��i ��a Y"}}},
			[26] = {item={{gdp={0,100,30195,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng T�y M�ng B�o"}}},
			[27] = {item={{gdp={0,100,30199,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ma V�c  B�o"}}},
			[31] = {item={{gdp={0,100,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B�n V�n B�o"}}},
			[32] = {item={{gdp={0,100,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�m Ma B�o"}}},
		},
		[2] = {
			[2] = {item={{gdp={0,100,30144,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n ��a B�o"}}},
			[4] = {item={{gdp={0,100,30146,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ph� T� B�o"}}},
			[3] = {item={{gdp={0,100,30148,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n T�n B�o"}}},
			[6] = {item={{gdp={0,100,30150,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tuy�t M�nh Y"}}},
			[11] = {item={{gdp={0,100,30158,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�n Du Y"}}},
			[12] = {item={{gdp={0,100,30162,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ti�u Dao Y"}}},
			[14] = {item={{gdp={0,100,30166,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng V� Vi B�o"}}},
			[15] = {item={{gdp={0,100,30170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C�n Kh�n B�o"}}},
			[17] = {item={{gdp={0,100,30174,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n Tinh  Gi�p"}}},
			[18] = {item={{gdp={0,100,30178,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Xuy�n V�n Gi�p"}}},
			[20] = {item={{gdp={0,100,30182,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Minh T�n Y"}}},
			[21] = {item={{gdp={0,100,30186,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C� T�m Y"}}},
			[23] = {item={{gdp={0,100,30190,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Phong L�i B�o"}}},
			[25] = {item={{gdp={0,100,30192,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng ��i ��a Y"}}},
			[26] = {item={{gdp={0,100,30196,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng T�y M�ng B�o"}}},
			[27] = {item={{gdp={0,100,30200,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ma V�c  B�o"}}},
			[31] = {item={{gdp={0,100,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B�n V�n B�o"}}},
			[32] = {item={{gdp={0,100,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�m Ma B�o"}}},
		},
		[3] = {
			[6] = {item={{gdp={0,100,30151,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tuy�t M�nh Y"}}},
			[8] = {item={{gdp={0,100,30153,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B� T�t Y"}}},
			[9] = {item={{gdp={0,100,30155,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng L�u Th�yY"}}},
			[11] = {item={{gdp={0,100,30159,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�n Du Y"}}},
			[12] = {item={{gdp={0,100,30163,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ti�u Dao Y"}}},
			[14] = {item={{gdp={0,100,30167,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng V� Vi B�o"}}},
			[15] = {item={{gdp={0,100,30171,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C�n Kh�n B�o"}}},
			[17] = {item={{gdp={0,100,30175,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n Tinh  Gi�p"}}},
			[18] = {item={{gdp={0,100,30179,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Xuy�n V�n Gi�p"}}},
			[20] = {item={{gdp={0,100,30183,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Minh T�n Y"}}},
			[21] = {item={{gdp={0,100,30187,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C� T�m Y"}}},
			[25] = {item={{gdp={0,100,30193,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng ��i ��a Y"}}},
			[26] = {item={{gdp={0,100,30197,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng T�y M�ng B�o"}}},
			[27] = {item={{gdp={0,100,30201,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ma V�c  B�o"}}},
			[29] = {item={{gdp={0,100,30203,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�nh N�  Y"}}},
			[30] = {item={{gdp={0,100,30205,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�nh Linh Y"}}},
			[31] = {item={{gdp={0,100,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B�n V�n B�o"}}},
			[32] = {item={{gdp={0,100,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�m Ma B�o"}}},
		},
		[4] = {
			[6] = {item={{gdp={0,100,30152,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tuy�t M�nh Y"}}},
			[8] = {item={{gdp={0,100,30154,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B� T�t Y"}}},
			[9] = {item={{gdp={0,100,30156,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng L�u Th�yY"}}},
			[11] = {item={{gdp={0,100,30160,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�n Du Y"}}},
			[12] = {item={{gdp={0,100,30164,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ti�u Dao Y"}}},
			[14] = {item={{gdp={0,100,30168,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng V� Vi B�o"}}},
			[15] = {item={{gdp={0,100,30172,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C�n Kh�n B�o"}}},
			[17] = {item={{gdp={0,100,30176,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n Tinh  Gi�p"}}},
			[18] = {item={{gdp={0,100,30180,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Xuy�n V�n Gi�p"}}},
			[20] = {item={{gdp={0,100,30184,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Minh T�n Y"}}},
			[21] = {item={{gdp={0,100,30188,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C� T�m Y"}}},
			[25] = {item={{gdp={0,100,30194,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng ��i ��a Y"}}},
			[26] = {item={{gdp={0,100,30198,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng T�y M�ng B�o"}}},
			[27] = {item={{gdp={0,100,30202,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ma V�c  B�o"}}},
			[29] = {item={{gdp={0,100,30204,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�nh N�  Y"}}},
			[30] = {item={{gdp={0,100,30206,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�nh Linh Y"}}},
			[31] = {item={{gdp={0,100,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B�n V�n B�o"}}},
			[32] = {item={{gdp={0,100,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�m Ma B�o"}}},
		}
	},
	
	[101] = {
		[1] = {
			[2] = {item={{gdp={0,101,30143,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n ��a Trang"}}},
			[4] = {item={{gdp={0,101,30145,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ph� T� Trang"}}},
			[3] = {item={{gdp={0,101,30147,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n T�n Trang"}}},
			[6] = {item={{gdp={0,101,30149,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tuy�t M�nh Trang"}}},
			[11] = {item={{gdp={0,101,30157,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�n Du Trang"}}},
			[12] = {item={{gdp={0,101,30161,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ti�u Dao Trang"}}},
			[14] = {item={{gdp={0,101,30165,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng V� Vi Trang"}}},
			[15] = {item={{gdp={0,101,30169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C�n Kh�n Trang"}}},
			[17] = {item={{gdp={0,101,30173,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n Tinh  Trang"}}},
			[18] = {item={{gdp={0,101,30177,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Xuy�n V�n Trang"}}},
			[20] = {item={{gdp={0,101,30181,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Minh T�n Trang"}}},
			[21] = {item={{gdp={0,101,30185,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C� T�m Trang"}}},
			[23] = {item={{gdp={0,101,30189,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Phong L�i Trang"}}},
			[25] = {item={{gdp={0,101,30191,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng ��i ��a Trang"}}},
			[26] = {item={{gdp={0,101,30195,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng T�y M�ng Trang"}}},
			[27] = {item={{gdp={0,101,30199,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ma V�c  Trang"}}},
			[31] = {item={{gdp={0,101,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B�n V�n Trang"}}},
			[32] = {item={{gdp={0,101,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�m Ma Trang"}}},
		},
		[2] = {
			[2] = {item={{gdp={0,101,30144,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n ��a Trang"}}},
			[4] = {item={{gdp={0,101,30146,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ph� T� Trang"}}},
			[3] = {item={{gdp={0,101,30148,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n T�n Trang"}}},
			[6] = {item={{gdp={0,101,30150,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tuy�t M�nh Trang"}}},
			[11] = {item={{gdp={0,101,30158,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�n Du Trang"}}},
			[12] = {item={{gdp={0,101,30162,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ti�u Dao Trang"}}},
			[14] = {item={{gdp={0,101,30166,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng V� Vi Trang"}}},
			[15] = {item={{gdp={0,101,30170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C�n Kh�n Trang"}}},
			[17] = {item={{gdp={0,101,30174,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n Tinh  Trang"}}},
			[18] = {item={{gdp={0,101,30178,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Xuy�n V�n Trang"}}},
			[20] = {item={{gdp={0,101,30182,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Minh T�n Trang"}}},
			[21] = {item={{gdp={0,101,30186,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C� T�m Trang"}}},
			[23] = {item={{gdp={0,101,30190,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Phong L�i Trang"}}},
			[25] = {item={{gdp={0,101,30192,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng ��i ��a Trang"}}},
			[26] = {item={{gdp={0,101,30196,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng T�y M�ng Trang"}}},
			[27] = {item={{gdp={0,101,30200,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ma V�c  Trang"}}},
			[31] = {item={{gdp={0,101,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B�n V�n Trang"}}},
			[32] = {item={{gdp={0,101,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�m Ma Trang"}}},
		},
		[3] = {
			[6] = {item={{gdp={0,101,30151,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tuy�t M�nh Trang"}}},
			[8] = {item={{gdp={0,101,30153,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B� T�t Kh�"}}},
			[9] = {item={{gdp={0,101,30155,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng L�u Th�yKh�"}}},
			[11] = {item={{gdp={0,101,30159,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�n Du Trang"}}},
			[12] = {item={{gdp={0,101,30163,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ti�u Dao Trang"}}},
			[14] = {item={{gdp={0,101,30167,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng V� Vi Trang"}}},
			[15] = {item={{gdp={0,101,30171,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C�n Kh�n Trang"}}},
			[17] = {item={{gdp={0,101,30175,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n Tinh  Trang"}}},
			[18] = {item={{gdp={0,101,30179,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Xuy�n V�n Trang"}}},
			[20] = {item={{gdp={0,101,30183,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Minh T�n Trang"}}},
			[21] = {item={{gdp={0,101,30187,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C� T�m Trang"}}},
			[25] = {item={{gdp={0,101,30193,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng ��i ��a Trang"}}},
			[26] = {item={{gdp={0,101,30197,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng T�y M�ng Trang"}}},
			[27] = {item={{gdp={0,101,30201,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ma V�c  Trang"}}},
			[29] = {item={{gdp={0,101,30203,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�nh N�  Kh�"}}},
			[30] = {item={{gdp={0,101,30205,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�nh Linh Kh�"}}},
			[31] = {item={{gdp={0,101,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B�n V�n Trang"}}},
			[32] = {item={{gdp={0,101,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�m Ma Trang"}}},
		},
		[4] = {
			[6] = {item={{gdp={0,101,30152,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tuy�t M�nh Trang"}}},
			[8] = {item={{gdp={0,101,30154,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B� T�t Kh�"}}},
			[9] = {item={{gdp={0,101,30156,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng L�u Th�yKh�"}}},
			[11] = {item={{gdp={0,101,30160,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�n Du Trang"}}},
			[12] = {item={{gdp={0,101,30164,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ti�u Dao Trang"}}},
			[14] = {item={{gdp={0,101,30168,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng V� Vi Trang"}}},
			[15] = {item={{gdp={0,101,30172,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C�n Kh�n Trang"}}},
			[17] = {item={{gdp={0,101,30176,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n Tinh  Trang"}}},
			[18] = {item={{gdp={0,101,30180,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Xuy�n V�n Trang"}}},
			[20] = {item={{gdp={0,101,30184,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Minh T�n Trang"}}},
			[21] = {item={{gdp={0,101,30188,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C� T�m Trang"}}},
			[25] = {item={{gdp={0,101,30194,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng ��i ��a Trang"}}},
			[26] = {item={{gdp={0,101,30198,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng T�y M�ng Trang"}}},
			[27] = {item={{gdp={0,101,30202,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ma V�c  Trang"}}},
			[29] = {item={{gdp={0,101,30204,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�nh N�  Kh�"}}},
			[30] = {item={{gdp={0,101,30206,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�nh Linh Kh�"}}},
			[31] = {item={{gdp={0,101,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B�n V�n Trang"}}},
			[32] = {item={{gdp={0,101,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�m Ma Trang"}}},
		},
	},
	
	[103] = {
		[1] = {
			[2] = {item={{gdp={0,103,30143,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n ��a M�o"}}},
			[4] = {item={{gdp={0,103,30145,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ph� T� M�o"}}},
			[3] = {item={{gdp={0,103,30147,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n T�n M�o"}}},
			[6] = {item={{gdp={0,103,30149,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tuy�t M�nh Qu�n"}}},
			[11] = {item={{gdp={0,103,30157,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�n Du C�n"}}},
			[12] = {item={{gdp={0,103,30161,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ti�u Dao C�n"}}},
			[14] = {item={{gdp={0,103,30165,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng V� Vi Qu�n"}}},
			[15] = {item={{gdp={0,103,30169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C�n Kh�n Qu�n"}}},
			[17] = {item={{gdp={0,103,30173,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n Tinh  Kh�i"}}},
			[18] = {item={{gdp={0,103,30177,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Xuy�n V�n Kh�i"}}},
			[20] = {item={{gdp={0,103,30181,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Minh T�n C�n"}}},
			[21] = {item={{gdp={0,103,30185,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C� T�m C�n"}}},
			[23] = {item={{gdp={0,103,30189,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Phong L�i Qu�n"}}},
			[25] = {item={{gdp={0,103,30191,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng ��i ��a C�n"}}},
			[26] = {item={{gdp={0,103,30195,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng T�y M�ng Qu�n"}}},
			[27] = {item={{gdp={0,103,30199,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ma V�c  Qu�n"}}},
			[31] = {item={{gdp={0,103,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B�n V�n Qu�n"}}},
			[32] = {item={{gdp={0,103,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�m Ma Qu�n"}}},
		},
		[2] = {
			[2] = {item={{gdp={0,103,30144,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n ��a M�o"}}},
			[4] = {item={{gdp={0,103,30146,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ph� T� M�o"}}},
			[3] = {item={{gdp={0,103,30148,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n T�n M�o"}}},
			[6] = {item={{gdp={0,103,30150,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tuy�t M�nh Qu�n"}}},
			[11] = {item={{gdp={0,103,30158,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�n Du C�n"}}},
			[12] = {item={{gdp={0,103,30162,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ti�u Dao C�n"}}},
			[14] = {item={{gdp={0,103,30166,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng V� Vi Qu�n"}}},
			[15] = {item={{gdp={0,103,30170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C�n Kh�n Qu�n"}}},
			[17] = {item={{gdp={0,103,30174,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n Tinh  Kh�i"}}},
			[18] = {item={{gdp={0,103,30178,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Xuy�n V�n Kh�i"}}},
			[20] = {item={{gdp={0,103,30182,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Minh T�n C�n"}}},
			[21] = {item={{gdp={0,103,30186,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C� T�m C�n"}}},
			[23] = {item={{gdp={0,103,30190,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Phong L�i Qu�n"}}},
			[25] = {item={{gdp={0,103,30192,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng ��i ��a C�n"}}},
			[26] = {item={{gdp={0,103,30196,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng T�y M�ng Qu�n"}}},
			[27] = {item={{gdp={0,103,30200,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ma V�c  Qu�n"}}},
			[31] = {item={{gdp={0,103,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B�n V�n Qu�n"}}},
			[32] = {item={{gdp={0,103,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�m Ma Qu�n"}}},
		},
		[3] = {
			[6] = {item={{gdp={0,103,30151,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tuy�t M�nh Qu�n"}}},
			[8] = {item={{gdp={0,103,30153,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B� T�t Tr�m"}}},
			[9] = {item={{gdp={0,103,30155,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng L�u Th�y Tr�m"}}},
			[11] = {item={{gdp={0,103,30159,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�n Du C�n"}}},
			[12] = {item={{gdp={0,103,30163,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ti�u Dao C�n"}}},
			[14] = {item={{gdp={0,103,30167,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng V� Vi Qu�n"}}},
			[15] = {item={{gdp={0,103,30171,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C�n Kh�n Qu�n"}}},
			[17] = {item={{gdp={0,103,30175,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n Tinh  Kh�i"}}},
			[18] = {item={{gdp={0,103,30179,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Xuy�n V�n Kh�i"}}},
			[20] = {item={{gdp={0,103,30183,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Minh T�n C�n"}}},
			[21] = {item={{gdp={0,103,30187,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C� T�m C�n"}}},
			[25] = {item={{gdp={0,103,30193,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng ��i ��a C�n"}}},
			[26] = {item={{gdp={0,103,30197,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng T�y M�ng Qu�n"}}},
			[27] = {item={{gdp={0,103,30201,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ma V�c  Qu�n"}}},
			[29] = {item={{gdp={0,103,30203,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�nh N�  Tr�m"}}},
			[30] = {item={{gdp={0,103,30205,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�nh Linh Tr�m"}}},
			[31] = {item={{gdp={0,103,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B�n V�n Qu�n"}}},
			[32] = {item={{gdp={0,103,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�m Ma Qu�n"}}},
		},
		[4] = {
			[6] = {item={{gdp={0,103,30152,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tuy�t M�nh Qu�n"}}},
			[8] = {item={{gdp={0,103,30154,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B� T�t Tr�m"}}},
			[9] = {item={{gdp={0,103,30156,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng L�u Th�y Tr�m"}}},
			[11] = {item={{gdp={0,103,30160,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�n Du C�n"}}},
			[12] = {item={{gdp={0,103,30164,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ti�u Dao C�n"}}},
			[14] = {item={{gdp={0,103,30168,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng V� Vi Qu�n"}}},
			[15] = {item={{gdp={0,103,30172,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C�n Kh�n Qu�n"}}},
			[17] = {item={{gdp={0,103,30176,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n Tinh  Kh�i"}}},
			[18] = {item={{gdp={0,103,30180,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Xuy�n V�n Kh�i"}}},
			[20] = {item={{gdp={0,103,30184,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Minh T�n C�n"}}},
			[21] = {item={{gdp={0,103,30188,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng C� T�m C�n"}}},
			[25] = {item={{gdp={0,103,30194,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng ��i ��a C�n"}}},
			[26] = {item={{gdp={0,103,30198,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng T�y M�ng Qu�n"}}},
			[27] = {item={{gdp={0,103,30202,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ma V�c  Qu�n"}}},
			[29] = {item={{gdp={0,103,30204,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�nh N�  Tr�m"}}},
			[30] = {item={{gdp={0,103,30206,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�nh Linh Tr�m"}}},
			[31] = {item={{gdp={0,103,32169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B�n V�n Qu�n"}}},
			[32] = {item={{gdp={0,103,32170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�m Ma Qu�n"}}},
		},
	},
}

tbVuKhiChienCuong = {
	[1] = {
		[2] = {item={{gdp={0,3,30143,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B�ng Thi�n �ao"}}},
		[3] = {item={{gdp={0,8,30147,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n ��nh Tr��ng"}}},
		[4] = {item={{gdp={0,0,30145,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�nh Chi�n Th�"}}},
		[6] = {item={{gdp={0,1,30149,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng �o�t H�n Ch�m"}}},
		[11] = {item={{gdp={0,0,30157,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�ng �c Th�"}}},
		[12] = {item={{gdp={0,5,30161,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng V� C�c C�n"}}},
		[14] = {item={{gdp={0,2,30165,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Khu Ma Ki�m"}}},
		[15] = {item={{gdp={0,9,30169,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th��ng Khung B�t"}}},
		[17] = {item={{gdp={0,6,30173,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�n K�ch Th��ng"}}},
		[18] = {item={{gdp={0,4,30177,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Xung Thi�n Cung"}}},
		[20] = {item={{gdp={0,7,30181,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Luy�n Ng�c �ao"}}},
		[21] = {item={{gdp={0,11,30185,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Nhi�p H�n Tr�o"}}},
		[23] = {item={{gdp={0,2,30189,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n Ph�t Ki�m"}}},
		[25] = {item={{gdp={0,3,30191,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ch�c Dung �ao"}}},
		[26] = {item={{gdp={0,9,30195,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng T� M�nh B�t"}}},
		[27] = {item={{gdp={0,11,30199,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Truy H�n Tr�o"}}},
		[31] = {item={{gdp={0,14,32217,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B�n V�n Ch�y"}}},
		[32] = {item={{gdp={0,2,32218,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�m Ma Ki�m"}}},
	},
	[2] = {
		[2] = {item={{gdp={0,3,30144,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B�ng Thi�n �ao"}}},
		[3] = {item={{gdp={0,8,30148,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n ��nh Tr��ng"}}},
		[4] = {item={{gdp={0,0,30146,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�nh Chi�n Th�"}}},
		[6] = {item={{gdp={0,1,30150,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng �o�t H�n Ch�m"}}},
		[11] = {item={{gdp={0,0,30158,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�ng �c Th�"}}},
		[12] = {item={{gdp={0,5,30162,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng V� C�c C�n"}}},
		[14] = {item={{gdp={0,2,30166,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Khu Ma Ki�m"}}},
		[15] = {item={{gdp={0,9,30170,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th��ng Khung B�t"}}},
		[17] = {item={{gdp={0,6,30174,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�n K�ch Th��ng"}}},
		[18] = {item={{gdp={0,4,30178,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Xung Thi�n Cung"}}},
		[20] = {item={{gdp={0,7,30182,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Luy�n Ng�c �ao"}}},
		[21] = {item={{gdp={0,11,30186,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Nhi�p H�n Tr�o"}}},
		[23] = {item={{gdp={0,2,30190,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Thi�n Ph�t Ki�m"}}},
		[25] = {item={{gdp={0,3,30192,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ch�c Dung �ao"}}},
		[26] = {item={{gdp={0,9,30196,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng T� M�nh B�t"}}},
		[27] = {item={{gdp={0,11,30200,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Truy H�n Tr�o"}}},
		[31] = {item={{gdp={0,14,32217,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B�n V�n Ch�y"}}},
		[32] = {item={{gdp={0,2,32218,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�m Ma Ki�m"}}},

	},
	[3] = {
		[6] = {item={{gdp={0,1,30151,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng �o�t H�n Ch�m"}}},
		[8] = {item={{gdp={0,2,30153,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ph�t Quang Ki�m"}}},
		[9] = {item={{gdp={0,10,30155,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng H� Bang C�m"}}},
		[11] = {item={{gdp={0,0,30159,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�ng �c Th�"}}},
		[12] = {item={{gdp={0,5,30163,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng V� C�c C�n"}}},
		[14] = {item={{gdp={0,2,30167,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Khu Ma Ki�m"}}},
		[15] = {item={{gdp={0,9,30171,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th��ng Khung B�t"}}},
		[17] = {item={{gdp={0,6,30175,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�n K�ch Th��ng"}}},
		[18] = {item={{gdp={0,4,30179,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Xung Thi�n Cung"}}},
		[20] = {item={{gdp={0,7,30183,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Luy�n Ng�c �ao"}}},
		[21] = {item={{gdp={0,11,30187,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Nhi�p H�n Tr�o"}}},
		[25] = {item={{gdp={0,3,30193,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ch�c Dung �ao"}}},
		[26] = {item={{gdp={0,9,30197,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng T� M�nh B�t"}}},
		[27] = {item={{gdp={0,11,30201,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Truy H�n Tr�o"}}},
		[29] = {item={{gdp={0,13,30203,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Phong Linh Phi�n"}}},
		[30] = {item={{gdp={0,12,30205,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Kh�ng Minh ��ch"}}},
		[31] = {item={{gdp={0,14,32217,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B�n V�n Ch�y"}}},
		[32] = {item={{gdp={0,2,32218,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�m Ma Ki�m"}}},
	},
	[4] = {
		[6] = {item={{gdp={0,1,30152,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng �o�t H�n Ch�m"}}},
		[8] = {item={{gdp={0,2,30154,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ph�t Quang Ki�m"}}},
		[9] = {item={{gdp={0,10,30156,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng H� Bang C�m"}}},
		[11] = {item={{gdp={0,0,30160,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�ng �c Th�"}}},
		[12] = {item={{gdp={0,5,30164,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng V� C�c C�n"}}},
		[14] = {item={{gdp={0,2,30168,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Khu Ma Ki�m"}}},
		[15] = {item={{gdp={0,9,30172,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th��ng Khung B�t"}}},
		[17] = {item={{gdp={0,6,30176,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Th�n K�ch Th��ng"}}},
		[18] = {item={{gdp={0,4,30180,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Xung Thi�n Cung"}}},
		[20] = {item={{gdp={0,7,30184,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Luy�n Ng�c �ao"}}},
		[21] = {item={{gdp={0,11,30188,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Nhi�p H�n Tr�o"}}},
		[25] = {item={{gdp={0,3,30194,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Ch�c Dung �ao"}}},
		[26] = {item={{gdp={0,9,30198,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng T� M�nh B�t"}}},
		[27] = {item={{gdp={0,11,30202,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Truy H�n Tr�o"}}},
		[29] = {item={{gdp={0,13,30204,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Phong Linh Phi�n"}}},
		[30] = {item={{gdp={0,12,30206,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Kh�ng Minh ��ch"}}},
		[31] = {item={{gdp={0,14,32217,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng B�n V�n Ch�y"}}},
		[32] = {item={{gdp={0,2,32218,1,1,-1,-1,-1,-1,-1,-1,-1,9}, name="Chi�n Cu�ng Tr�m Ma Ki�m"}}},
	},
}

tb_topserver_book45_1 = {
			[2] =  {"Kim Cang Ph�c Ma T�m Ph�p", {0,107,2,1}},
			[3] =  {"V� Tr�n T�m Ph�p", {0,107,6,1}},
			[4] =  {"Ti�m Long T�m Ph�p", {0,107,4,1}},
			[14] =  {"Huy�n �nh T�m Ph�p", {0,107,18,1}},
			[15] =  {"Qu�n T� T�m Ph�p", {0,107,20,1}},
			[8] =  {"Nh� � T�m Ph�p", {0,107,10,1}},
			[9] =  {"B�ch H�i T�m Ph�p", {0,107,12,1}},
			[11] =  {"H�n ��n T�m Ph�p", {0,107,14,1}},
			[12] =  {"Qu� Thi�n T�m Ph�p", {0,107,16,1}},
			[6] =  {"Thi�n La T�m Ph�p", {0,107,8,1}},
			[17] =  {"Tr�n Qu�n T�m Ph�p", {0,107,22,1}},
			[18] =  {"Xuy�n V�n T�m Ph�p", {0,107,24,1}},
			[20] = {"U Minh T�m Ph�p", {0,107,26,1}},
			[21] = {"Linh C� T�m Ph�p", {0,107,28,1}},
			[23] = {"Kinh Phong T�m Ph�p", {0,107,181,1}},
			[29] = {"T�y M�ng T�m Ph�p", {0,107,189,1}},
			[30] = {"Ph�n Hoa T�m Ph�p", {0,107,194,1}},
			[31] =  {"Thi�n La T�m Ph�p", {0,107,8,1}},
			[32] = {"Kinh Phong T�m Ph�p", {0,107,181,1}},
}

tb_topserver_book45_2 = {
			[2] =  {"Kim Cang Ph�c Ma kinh", {0,107,1,1}}, 
			[3] =  {"V� Tr�n M�t t�ch", {0,107,5,1}}, 
			[4] =  {"Ti�m Long M�t t�ch", {0,107,3,1}}, 
			[14] =  {"Huy�n �nh M�t t�ch", {0,107,17,1}}, 
			[15] =  {"Qu�n T� M�t t�ch", {0,107,19,1}}, 
			[8] =  {"Nh� � M�t T�ch", {0,107,9,1}}, 
			[9] =  {"B�ch H�i Ph�", {0,107,11,1}}, 
			[11] =  {"H�n ��n M�t t�ch", {0,107,13,1}}, 
			[12] =  {"Qu� Thi�n M�t t�ch", {0,107,15,1}}, 
			[6] =  {"Thi�n La M�t T�ch", {0,107,7,1}}, 
			[17] =  {"Tr�n Qu�n M�t t�ch", {0,107,21,1}}, 
			[18] =  {"Xuy�n V�n M�t t�ch", {0,107,23,1}}, 
			[20] = {"U Minh Qu� L�c", {0,107,25,1}}, 
			[21] = {"Linh C� M�t t�ch", {0,107,27,1}}, 
			[23] = {"Kinh Phong M�t t�ch", {0,107,180,1}}, 
			[29] = {"T�y M�ng  M�t t�ch", {0,107,188,1}}, 
			[30] = {"Ph�n Hoa M�t t�ch", {0,107,190,1}}, 
			[31] =  {"Thi�n La M�t T�ch", {0,107,7,1}}, 
			[32] = {"Kinh Phong M�t t�ch", {0,107,180,1}},
}
tb_topserver_book70_1 ={
			[2] = {"Kim Cang B�t Nh� Kinh", {0,107,166,1}},
			[3] = {"V� Tr�n B� �� Kinh",{0,107,168,1}},
			[4] = {"Ti�m Long T�ch Di�t Kinh",{0,107,167,1}},
			[6] = {"Thi�n La Li�n Ch�u L�c",{0,107,169,1}},
			[8] = {"Nh� � Kim ��nh M�t T�ch",{0,107,170,1}},
			[9] = {"B�ch H�i Tuy�t �m Ph�",{0,107,171,1}},
			[11] = {"H�n ��n Tr�n Nh�c M�t T�ch"	,{0,107,172,1}},
			[12] = {"Qu� Thi�n Du Long M�t T�ch",{0,107,173,1}},
			[14] = {"Huy�n �nh M� Tung M�t T�ch",{0,107,174,1}},
			[15] = {"Qu�n T� Ti�t Phong M�t T�ch",{0,107,175,1}},
			[17] = {"Tr�n Qu�n Phi Long Th��ng Ph�"	,{0,107,176,1}},
			[18] = {"Xuy�n V�n L�c H�ng M�t T�ch",{0,107,177,1}},
			[20] = {"U Minh Phong Ma L�c",{0,107,178,1}},
			[21] = {"Linh C� Huy�n T� L�c",{0,107,179,1}},
			[23] = {"C�u Thi�n Phong L�i Quy�n",{0,107,198,1}},
			[29] = {"H�ng Tr�n T�y M�ng Ph�",{0,107,202,1}},
			[30] = {"Phong Hoa Thi�n Di�p Quy�n",{0,107,203,1}},
			[31] = {"Thi�n La Li�n Ch�u L�c",{0,107,230,1}},
			[32] = {"C�u Thi�n Phong L�i Quy�n",{0,107,234,1}},
}

tb_topserver_yue = {
				[2] = {"T�i b� ki�p Thi�u L�m", {2, 0, 607, 1, 4}},
				[3] = {"T�i b� ki�p Thi�u L�m", {2, 0, 607, 1, 4}},
				[4] = {"T�i b� ki�p Thi�u L�m", {2, 0, 607, 1, 4}},
				[6] = {"T�i b� ki�p ���ng M�n", {2, 0, 608, 1, 4}},
				[8] = {"T�i b� ki�p Nga My", {2, 0, 609, 1, 4}},
				[9] = {"T�i b� ki�p Nga My", {2, 0, 609, 1, 4}},
				[11] = {"T�i b� ki�p C�i Bang", {2, 0, 610, 1, 4}},
				[12] = {"T�i b� ki�p C�i Bang", {2, 0, 610, 1, 4}},
				[14] = {"T�i b� ki�p V� �ang", {2, 0, 611, 1, 4}},
				[15] = {"T�i b� ki�p V� �ang", {2, 0, 611, 1, 4}},
				[17] = {"T�i b� ki�p D��ng M�n", {2, 0, 612, 1, 4}},
				[18] = {"T�i b� ki�p D��ng M�n", {2, 0, 612, 1, 4}},
				[20] = {"T�i b� ki�p Ng� ��c", {2, 0, 613, 1, 4}},
				[21] = {"T�i b� ki�p Ng� ��c", {2, 0, 613, 1, 4}}
};

tb_topserver_jew = {
				[1] = {"T�ng Ki�m Kim �n", 10, {0, 102, 40,1,1,-1,-1,-1,-1,-1,-1}},
				[2] = {"T�ng Ki�m K� Th�ch", 10, {0, 102, 39,1,1,-1,-1,-1,-1,-1,-1}},				
				[3] = {"T�ng Ki�m B�o Ch�u", 80, {0, 102, 38,1,1,-1,-1,-1,-1,-1,-1}},				
};

tb_topserver_book_high = {
				[2] = {"D�ch C�n Kinh-th��ng", {2, 1, 916, 1}},
				[4] = {"Nh� Lai Th�n Ch��ng-th��ng", {2, 1, 919, 1}},
				[3] = {"T�y T�y Kinh-th��ng", {2, 1, 922, 1}},
				[6] = {"H�p Tinh Tr�n-th��ng", {2, 1, 925, 1}},
				[8] = {"V�n T��ng Th�n C�ng-th��ng", {2, 1, 928, 1}},
				[9] = {"Thi�n �m Tr�n H�n Kh�c-th��ng", {2, 1, 931, 1}},
				[11] = {"Gi�ng Long Th�p B�t Ch��ng-th��ng", {2, 1, 934, 1}},
				[12] = {"�� C�u C�n Tr�n-th��ng", {2, 1, 937, 1}},
				[14] = {"V� Th��ng Th�i C�c Ki�m-th��ng", {2, 1, 940, 1}},
				[15] = {"Th�i C�c Th�n C�ng-th��ng", {2, 1, 943, 1}},
				[17] = {"Li�n Ho�n To�n Long Th��ng-th��ng", {2, 1, 946, 1}},
				[18] = {"B� V��ng T��ng Ph�ng Ti�n-th��ng", {2, 1, 949, 1}},
				[20] = {"V� Thi�n Ma C�ng-th��ng", {2, 1, 955, 1}},
				[21] = {"V� �nh Ma C�-th��ng", {2, 1, 952, 1}},
};

tb_topserver_book_med = {
				[2] = {"D�ch C�n Kinh-trung", {2, 1, 917, 1}},			
				[4] = {"Nh� Lai Th�n Ch��ng-trung", {2, 1, 920, 1}},			
				[3] = {"T�y T�y Kinh-trung", {2, 1, 923, 1}},			
				[6] = {"H�p Tinh Tr�n-trung", {2, 1, 926, 1}},			
				[8] = {"V�n T��ng Th�n C�ng-trung", {2, 1, 929, 1}},			
				[9] = {"Thi�n �m Tr�n H�n Kh�c-trung", {2, 1, 932, 1}},			
				[11] = {"Gi�ng Long Th�p B�t Ch��ng-trung", {2, 1, 935, 1}},			
				[12] = {"�� C�u C�n Tr�n-trung", {2, 1, 938, 1}},			
				[14] = {"V� Th��ng Th�i C�c Ki�m-trung", {2, 1, 941, 1}},			
				[15] = {"Th�i C�c Th�n C�ng-trung", {2, 1, 944, 1}},			
				[17] = {"Li�n Ho�n To�n Long Th��ng-trung", {2, 1, 947, 1}},			
				[18] = {"B� V��ng T��ng Ph�ng Ti�n-trung", {2, 1, 950, 1}},			
				[20] = {"V� Thi�n Ma C�ng-trung", {2, 1, 956, 1}}, 
				[21] = {"V� �nh Ma C�-trung", {2, 1, 953, 1}},
};

tb_topserver_book_low = {
				[2] = {"D�ch C�n Kinh-h� ", {2, 1, 918, 1}},		
				[4] = {"Nh� Lai Th�n Ch��ng-h� ", {2, 1, 921, 1}},		
				[3] = {"T�y T�y Kinh-h� ", {2, 1, 924, 1}},		
				[6] = {"H�p Tinh Tr�n-h� ", {2, 1, 927, 1}},		
				[8] = {"V�n T��ng Th�n C�ng-h� ", {2, 1, 930, 1}},		
				[9] = {"Thi�n �m Tr�n H�n Kh�c-h� ", {2, 1, 933, 1}},		
				[11] = {"Gi�ng Long Th�p B�t Ch��ng-h� ", {2, 1, 936, 1}},		
				[12] = {"�� C�u C�n Tr�n-h� ", {2, 1, 939, 1}},		
				[14] = {"V� Th��ng Th�i C�c Ki�m-h� ", {2, 1, 942, 1}},		
				[15] = {"Th�i C�c Th�n C�ng-h� ", {2, 1, 945, 1}},		
				[17] = {"Li�n Ho�n To�n Long Th��ng-h� ", {2, 1, 948, 1}},		
				[18] = {"B� V��ng T��ng Ph�ng Ti�n-h� ", {2, 1, 951, 1}},		
				[20] = {"V� Thi�n Ma C�ng-h� ", {2, 1, 957, 1}},
				[21] = {"V� �nh Ma C�-h� ", {2, 1, 954, 1}},
};

tb_golden_book_all = {
				[2] = {"D�ch C�n Kinh", {0, 112, 101, 1}},		
				[4] = {"Nh� Lai Th�n Ch��ng", {0, 112, 102, 1}},		
				[3] = {"T�y T�y Kinh", {0, 112, 103, 1}},		
				[6] = {"H�p Tinh Tr�n", {0, 112, 104, 1}},		
				[8] = {"V�n T��ng Th�n C�ng", {0, 112, 105, 1}},		
				[9] = {"Thi�n �m Tr�n H�n Kh�c", {0, 112, 106, 1}},		
				[11] = {"Gi�ng Long Th�p B�t Ch��ng", {0, 112, 107, 1}},		
				[12] = {"�� C�u C�n Tr�n", {0, 112, 108, 1}},		
				[14] = {"V� Th��ng Th�i C�c Ki�m", {0, 112, 109, 1}},		
				[15] = {"Th�i C�c Th�n C�ng", {0, 112, 110, 1}},		
				[17] = {"Li�n Ho�n To�n Long Th��ng", {0, 112, 111, 1}},		
				[18] = {"B� V��ng T��ng Ph�ng Ti�n", {0, 112, 112, 1}},		
				[20] = {"V� Thi�n Ma C�ng", {0, 112, 113, 1}},		
				[21] = {"V� �nh Ma C�", {0, 112, 114, 1}},
				[23] = {"Phong L�i Ch�u", {0,112,192,1}},
				[29] = {"Ph�ng Minh Ph�", {0,112,196,1}},
				[30] = {"Hoa Ti�n T�m Kinh", {0,112,197,1}},	
				[31] = {"H�p Tinh Tr�n", {0, 112, 104, 1}},
				[32] = {"Phong L�i Ch�u", {0,112,192,1}},				
}

tbMatTich70caocap  =
{	
		[2] =  {item={{gdp={0, 107, 204,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Kim Cang B�t Nh� Ch�n Quy�n"}}}, 
		[3] =  {item={{gdp={0, 107, 206,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="V� Tr�n B� �� Ch�n Quy�n"}}},
		[4] =  {item={{gdp={0, 107, 205,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Ti�m Long T�c Di�t Ch�n Quy�n"}}},
		[6] =  {item={{gdp={0, 107, 207,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n La Li�n Ch�u Ch�n Quy�n"}}},
		[8] =  {item={{gdp={0, 107, 208,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Nh� � Kim ��nh Ch�n Quy�n"}}},
		[9] =  {item={{gdp={0, 107, 209,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="B�ch H�i Tuy�t �m Ch�n Quy�n"}}},
		[14] =  {item={{gdp={0, 107, 212,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Huy�n �nh M� T�ng Ch�n Quy�n"}}},
		[15] =  {item={{gdp={0, 107, 213,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Qu�n T� ��i Phong Ch�n Quy�n"}}},		
		[11] =  {item={{gdp={0, 107, 210,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�n ��n Tr�n Nh�c Ch�n Quy�n"}}},
		[12] =  {item={{gdp={0, 107, 211,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Qu� Thi�n Du Long Ch�n Quy�n"}}},		
		[17] =  {item={{gdp={0, 107, 214,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"}}},
		[18] =  {item={{gdp={0, 107, 215,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Xuy�n V�n L�c H�ng Ch�n Quy�n"}}},
		[20] =  {item={{gdp={0, 107, 216,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Huy�n Minh Phong Ma Ch�n Quy�n"}}},
		[21] =  {item={{gdp={0, 107, 217,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Linh C� Huy�n T� Ch�n Quy�n"}}},
		[23] =  {item={{gdp={0, 107, 218,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="C�u Thi�n Phong L�i Ch�n Quy�n"}}},
		[29] =  {item={{gdp={0, 107, 222,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�ng Tr�n T�y M�ng Ch�n Quy�n"}}},
		[30] =  {item={{gdp={0, 107, 223,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Phong Hoa Thi�n Di�p Ch�n Quy�n"}}},		
		[31] =  {item={{gdp={0, 107, 231,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n La Li�n Ch�u Ch�n Quy�n"}}},
		[32] =  {item={{gdp={0, 107, 235,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="C�u Thi�n Phong L�i Ch�n Quy�n"}}},		
}

local tbVukhiVietYen = {
		--[2] = {"Vi�t Y�n Phi Tinh �ao", {0,3,30001,1,1,-1,-1,-1,-1,-1,-1,-1,0}}, 
		--[2] = {"Vi�t Y�n Phi Tinh C�n", {0,5,30002,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
		[3] =  {"Vi�t Y�n Phi Tinh Tr��ng", {0,8,30003,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[4] =  {"Vi�t Y�n Phi Tinh Th�", {0,0,30004,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[14] =  {"Vi�t Y�n Tr�m Nguy�t Ki�m", {0,2,30010,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[15] =  {"Vi�t Y�n Tr�m Nguy�t B�t", {0,9,30011,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[8] =  {"Vi�t Y�n Phi Tinh Ki�m", {0,2,30006,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[9] =  {"Vi�t Y�n Phi Tinh C�m", {0,10,30007,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[11] =  {"Vi�t Y�n Phi Tinh Th�", {0,0,30008,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[12] =  {"Vi�t Y�n Tr�m Nguy�t C�n", {0,5,30009,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[6] =  {"Vi�t Y�n Phi Tinh Ch�m", {0,1,30005,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[17] =  {"Vi�t Y�n Tr�m Nguy�t Th��ng", {0,6,30012,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[18] =  {"Vi�t Y�n Tr�m Nguy�t Cung", {0,4,30013,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[20] = {"Vi�t Y�n Tr�m Nguy�t Nh�n", {0,7,30014,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[21] = {"Vi�t Y�n Tr�m Nguy�t Tr�o", {0,11,30015,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
}

-- 1 item, 2 command, 3 table
-- must identify this table below the sub table
tb_topserver_award_item = {				
				[76] = {{3, tb_topserver_book70_1, 0, 0}, {2, "Earn(%d)", 1000000, 0}},
				[77] = {{3, tb_topserver_book70_1, 0, 0}, {2, "Earn(%d)", 2000000, 0}},
				[78] = {{3, tbMatTich70caocap, 0, 0},{3, tbMatTich70caocap, 0, 0},{3, tbMatTich70caocap, 0, 0}, {2, "Earn(%d)", 3000000, 0}},
				[79] = {{1, "V� L�m Cao Th�", {2,1,1040,1,4}, 60*24*60*60}, {2, "Earn(%d)", 4000000, 0}},
				[80] = {{2, "AddItem(2,1,30164+mod(random(0,1000),%d),100)",20, 0}, {2, "Earn(%d)", 10000000, 0}},
				[81] = {{2,"NhanRuongYeuQuyet(%d)", 30*24*60*60,0}, {1, "M�c R��ng", {2,1,30340,999,4}, 0}},
				[82] = {{2, "NhanRuongYeuQuyet(%d)", 30*24*60*60,0},{2, "NhanRuongYeuQuyet(%d)", 30*24*60*60,0}, {1, "N� Oa Tinh Th�ch", {2,1,504,2,4}, 30*24*60*60}},
				[83] = {{3, tb_golden_book_all, 0, 0}, {2, "Earn(%d)", 10000000, 0}},
--				[84] = {{3, tb_topserver_book_med, 0, 0}, {1, "Thi�n Th�ch Linh Th�ch", {2,1,1068,1,4}, 30*24*60*60}},
--				[85] = {{3, tb_topserver_book_low, 0, 0}, {1, "M�nh B�ch Kim", {2,1,30346,1,1}, 0}},
				[86] = {{1, "Qu�n C�ng Ch��ng", {2,1,9999,5,1}, 30*24*60*60}, {1, "T� �o", {2,1,1070,1,4}, 30*24*60*60}},
				[87] = {{1, "Nh�n S�m V�n N�m", {2,1,30071,5,1}, 30*24*60*60},{1, "Qu�n C�ng Ch��ng", {2,1,9999,5,1}, 0}},
				[88] = {{1, "Qu�n C�ng Ch��ng", {2,1,9999,5,1}, 30*24*60*60}, {1, "Qu�n C�ng ��i", {2,1,9998,1,1}, 30*24*60*60}},
				[89] = {{1, "Qu�n C�ng ��i", {2,1,9998,5,1}, 30*24*60*60}},
--				[90] = {{1, "N� Oa Tinh Th�ch", {2,1,504,4,4}, 30*24*60*60}},
				[91] = {{1, "Qu�n C�ng Huy Ho�ng", {2,1,9977,3,1}, 30*24*60*60}},
				[92] = {{1, "Qu�n C�ng Huy Ho�ng", {2,1,9977,6,1}, 30*24*60*60}},
				[93] = {{1, "Thi�n Th�ch Linh Th�ch", {2,1,1068,2,4}, 30*24*60*60}},
				[94] = {{1, "Qu�n C�ng Huy Ho�ng", {2,1,9977,8,1}, 30*24*60*60}},
--				[98] = {{3, tbMatTich70caocap, 0, 0}, {3, tbMatTich70caocap, 0, 0}, {3, tbMatTich70caocap, 0, 0}},
				[99] = {{1, "��i ��nh H�n", {2,1,1113,1}, 30*24*60*60},{1, "��nh H�n Thi�n Th�ch Th�n Th�ch", {2,1,1067,1}, 30*24*60*60}},
--				[192] = {{3, tbMatTich70caocap, 0, 0}, {3, tbMatTich70caocap, 0, 0}, {3, tbMatTich70caocap, 0, 0}, {1, "Th�i D�ch H�n Nguy�n C�ng ��", {2,0,1082,100,1}, 0}, {1, "L�ng Ba Vi B�", {0,112,78,1,1}, 0}},
--				[292] = {{3, tbMatTich70caocap, 0, 0}, {1, "Th�i D�ch H�n Nguy�n C�ng ��", {2,0,1082,100,1}, 0}, {3, tbVukhiVietYen, 0, 0}},
--				[396] = {{1, "��i ��nh H�n", {2,1,1113,1}, 30*24*60*60}, {1, "Chuy�n Sinh ��n", {2,1,30345,1,4}, 60*24*60*60}},
};

tbTuVienChien = {
	[2] = {"T� Vi�n Chi�n",{0,102,8851,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"T� Vi�n Chi�n",{0,102,8853,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"T� Vi�n Chi�n",{0,102,8855,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"T� Vi�n Chi�n",{0,102,8857,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"T� Vi�n Chi�n",{0,102,8859,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"T� Vi�n Chi�n",{0,102,8861,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"T� Vi�n Chi�n",{0,102,8863,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"T� Vi�n Chi�n",{0,102,8865,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"T� Vi�n Chi�n",{0,102,8867,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"T� Vi�n Chi�n",{0,102,8869,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"T� Vi�n Chi�n",{0,102,8871,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"T� Vi�n Chi�n",{0,102,8873,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"T� Vi�n Chi�n",{0,102,8875,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"T� Vi�n Chi�n",{0,102,8877,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbTuVienDau = {
	[2] = {"T� Vi�n ��u",{0,102,8852,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"T� Vi�n ��u",{0,102,8854,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"T� Vi�n ��u",{0,102,8856,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"T� Vi�n ��u",{0,102,8858,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"T� Vi�n ��u",{0,102,8860,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"T� Vi�n ��u",{0,102,8862,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"T� Vi�n ��u",{0,102,8864,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"T� Vi�n ��u",{0,102,8866,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"T� Vi�n ��u",{0,102,8868,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"T� Vi�n ��u",{0,102,8870,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"T� Vi�n ��u",{0,102,8872,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"T� Vi�n ��u",{0,102,8874,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"T� Vi�n ��u",{0,102,8876,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"T� Vi�n ��u",{0,102,8878,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbTuVienVuKhi = {
	[2] = {{"T� Quang To�i V� �ao",{0,3,8851,1,1,-1,-1,-1,-1,-1,-1,-1,0}}, {"T� Quang To�i V� C�n",{0,5,8852,1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
	[3] = {"T� Quang C�u Nh� Tr��ng",{0,8,8853,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"T� Quang H�o Nhi�n Th�",{0,0,8854,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"T� Quang V� H�nh Ch�m",{0,1,8855,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"T� Quang T� Tinh Ki�m",{0,2,8856,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"T� Quang Ph�ng Ho�ng C�m",{0,10,8857,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"T� Quang Ng� Nh�c Th�",{0,0,8858,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"T� Quang Ph� Thi�n C�n",{0,5,8859,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"T� Quang H�ng Qu�n Ki�m",{0,2,8860,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"T� Quang Sinh T� B�t",{0,9,8861,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"T� Quang Ph� Qu�n Th��ng",{0,6,8862,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"T� Quang Khai Thi�n Cung",{0,4,8863,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"T� Quang �m D��ng Nh�n",{0,7,8864,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"T� Quang U Minh Tr�o",{0,11,8865,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbHienVienChien = {
	[2] = {"Hi�n Vi�n Chi�n",{0,102,8801,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"Hi�n Vi�n Chi�n",{0,102,8803,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"Hi�n Vi�n Chi�n",{0,102,8805,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"Hi�n Vi�n Chi�n",{0,102,8807,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"Hi�n Vi�n Chi�n",{0,102,8809,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"Hi�n Vi�n Chi�n",{0,102,8811,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"Hi�n Vi�n Chi�n",{0,102,8813,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"Hi�n Vi�n Chi�n",{0,102,8815,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"Hi�n Vi�n Chi�n",{0,102,8817,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"Hi�n Vi�n Chi�n",{0,102,8819,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"Hi�n Vi�n Chi�n",{0,102,8821,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"Hi�n Vi�n Chi�n",{0,102,8823,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"Hi�n Vi�n Chi�n",{0,102,8825,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"Hi�n Vi�n Chi�n",{0,102,8827,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbHienVienDau = {
	[2] = {"Hi�n Vi�n ��u",{0,102,8802,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"Hi�n Vi�n ��u",{0,102,8804,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"Hi�n Vi�n ��u",{0,102,8806,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"Hi�n Vi�n ��u",{0,102,8808,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"Hi�n Vi�n ��u",{0,102,8810,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"Hi�n Vi�n ��u",{0,102,8812,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"Hi�n Vi�n ��u",{0,102,8814,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"Hi�n Vi�n ��u",{0,102,8816,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"Hi�n Vi�n ��u",{0,102,8818,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"Hi�n Vi�n ��u",{0,102,8820,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"Hi�n Vi�n ��u",{0,102,8822,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"Hi�n Vi�n ��u",{0,102,8824,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"Hi�n Vi�n ��u",{0,102,8826,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"Hi�n Vi�n ��u",{0,102,8828,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbHienVienVuKhi = {
	[2] = {{"Hi�n Vi�n To�i V� �ao",{0,3,8801,1,1,-1,-1,-1,-1,-1,-1,-1,14}}, {"Hi�n Vi�n To�i V� C�n",{0,5,8802,1,1,-1,-1,-1,-1,-1,-1,-1,14}}},
	[3] = {"Hi�n Vi�n C�u Nh� Tr��ng",{0,8,8803,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[4] = {"Hi�n Vi�n H�o Nhi�n Th�",{0,0,8804,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[6] = {"Hi�n Vi�n V� H�nh Ch�m",{0,1,8805,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[8] = {"Hi�n Vi�n T� Tinh Ki�m",{0,2,8806,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[9] = {"Hi�n Vi�n Ph�ng Ho�ng C�m",{0,10,8807,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[11] = {"Hi�n Vi�n Ng� Nh�c Th�",{0,0,8808,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[12] = {"Hi�n Vi�n Ph� Thi�n C�n",{0,5,8809,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[14] = {"Hi�n Vi�n H�ng Qu�n Ki�m",{0,2,8810,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[15] = {"Hi�n Vi�n Sinh T� B�t",{0,9,8811,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[17] = {"Hi�n Vi�n Ph� Qu�n Th��ng",{0,6,8812,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[18] = {"Hi�n Vi�n Khai Thi�n Cung",{0,4,8813,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[20] = {"Hi�n Vi�n �m D��ng Nh�n",{0,7,8814,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[21] = {"Hi�n Vi�n U Minh Tr�o",{0,11,8815,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
}

tbVuKhiHaoNguyet = {
	[2] = {"H�o Nguy�t-�� N�n T�n Gi� Ph�t �ao",{0,3,8972,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"H�o Nguy�t-�� Ki�p T�n Gi� Ph�t Th�",{0,8,8973,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"H�o Nguy�t-�� �ch T�n Gi� Ph�t Tr��ng",{0,0,8974,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"H�o Nguy�t-V�n Ki�p Th�nh Th� Ch�m",{0,1,8975,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"H�o Nguy�t-Ph�t V�n Th�nh C� Li�n Ki�m",{0,2,8976,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"H�o Nguy�t-Ph�t Tr�n Th�nh C� C�m",{0,10,8977,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Th�",{0,0,8978,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"H�o Nguy�t-Du Long ��a Kh�t C�n",{0,5,8979,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"H�o Nguy�t-V� C�c Thi�n T�n T�c Ki�m",{0,2,8980,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"H�o Nguy�t-B�ch L�c Thi�n T�n B�t",{0,9,8981,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"H�o Nguy�t-C�m Thi�n ��u H�n Th��ng",{0,6,8982,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"H�o Nguy�t-��nh Thi�n Th�n Ngh� Cung",{0,4,8983,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"H�o Nguy�t-Qu� X�c T� Th�n �ao",{0,7,8984,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"H�o Nguy�t-Vu C�t ��c V��ng Tr�o",{0,11,8985,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}
-- Qu�n C�ng ��i	2	1	9998
-- Qu�n C�ng Huy Ho�ng	2	1	9977
tbDieuKienUuDai = {
	[1] = {nLevel = 88, tbitem = {2,1,504,1, "N� Oa Tinh Th�ch"}, nBit = 9, name= "Thi�n Chi T�ng Ki�m B�o Ch�u", nSlot = 7, nWeight = 100},
	[2] = {nLevel = 89, tbitem = {2,1,504,2, "N� Oa Tinh Th�ch"}, nBit = 10, name= "Thi�n Chi T�ng Ki�m K� Th�ch", nSlot = 7, nWeight = 100},
	[3] = {nLevel = 90, tbitem = {2,1,504,3, "N� Oa Tinh Th�ch"}, nBit = 11, name= "Thi�n Chi T�ng Ki�m Kim �n", nSlot  = 7, nWeight  = 100},
	[4] = {nLevel = 91, tbitem = {2,1,504,5, "N� Oa Tinh Th�ch"}, nBit = 12, name= "��ng Ph��ng Long Ch�u", nSlot  = 7, nWeight  = 100},
	[5] = {nLevel = 92, tbitem = {2,1,504,1, "N� Oa Tinh Th�ch"}, nBit = 13, name= "1000 Tr�i c�y ng�u nhi�n", nSlot  = 7, nWeight  = 100},
	[6] = {nLevel = 93, tbitem = {2,1,504,1, "N� Oa Tinh Th�ch"}, nBit = 14, name= "1000 Tr�i c�y ng�u nhi�n", nSlot  = 7, nWeight  = 100},
	[7] = {nLevel = 94, tbitem = {2,1,504,4, "N� Oa Tinh Th�ch"}, nBit = 15, name= "500 C� Linh Th�ch , 1000 C� Linh Ng�c", nSlot  = 7, nWeight  = 100},
	[8] = {nLevel = 96, tbitem = {2,1,504,9, "N� Oa Tinh Th�ch"}, nBit = 16, name= "1200 C� Linh Th�ch , 2000 C� Linh Ng�c", nSlot  = 7, nWeight  = 100},
}

tbTrangBiKimXa_NguyenSoai = {
	[1] = {
		[1] = {
				[1] = {item={{gdp={0,153,14,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng Nguy�n So�i"}}},
				[2] = {item={{gdp={0,153,15,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng Nguy�n So�i"}}},
				[3] = {item={{gdp={0,153,16,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng Nguy�n So�i"}}},
				[4] = {item={{gdp={0,153,17,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng Nguy�n So�i"}}},
			},
		[2] = {
				[1] = {item={{gdp={0,152,14,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng T�ng Nguy�n So�i"}}},
				[2] = {item={{gdp={0,152,15,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng T�ng Nguy�n So�i"}}},
				[3] = {item={{gdp={0,152,16,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng T�ng Nguy�n So�i"}}},
				[4] = {item={{gdp={0,152,17,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng T�ng Nguy�n So�i"}}},
			},
		[3] = {
				[1] = {item={{gdp={0,154,14,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i T�ng Nguy�n So�i"}}},
				[2] = {item={{gdp={0,154,15,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i T�ng Nguy�n So�i"}}},
				[3] = {item={{gdp={0,154,16,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i T�ng Nguy�n So�i"}}},
				[4] = {item={{gdp={0,154,17,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i T�ng Nguy�n So�i"}}},
			},
	},
	[2] = {
		[1] = {
				[1] = {item={{gdp={0,153,22,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u Nguy�n So�i"}}},
				[2] = {item={{gdp={0,153,23,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u Nguy�n So�i"}}},
				[3] = {item={{gdp={0,153,24,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u Nguy�n So�i"}}},
				[4] = {item={{gdp={0,153,25,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u Nguy�n So�i"}}},
			},
		[2] = {
				[1] = {item={{gdp={0,152,22,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u Nguy�n So�i"}}},
				[2] = {item={{gdp={0,152,23,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u Nguy�n So�i"}}},
				[3] = {item={{gdp={0,152,24,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u Nguy�n So�i"}}},
				[4] = {item={{gdp={0,152,25,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u Nguy�n So�i"}}},
			},
		[3] = {
				[1] = {item={{gdp={0,154,22,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u Nguy�n So�i"}}},
				[2] = {item={{gdp={0,154,23,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u Nguy�n So�i"}}},
				[3] = {item={{gdp={0,154,24,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u Nguy�n So�i"}}},
				[4] = {item={{gdp={0,154,25,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u Nguy�n So�i"}}},
			},
	},
}
tb7KimXaHoanLang = {
	item = {
		{gdp={0,152,35,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="T�t �nh Phi Phong"},
		{gdp={0,153,35,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="T�t �nh Ch��ng"},
		{gdp={0,154,35,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="T�t �nh Ngoa"},
	}
}
tb7KimXaDangGiao = {
	item = {
		{gdp={0,152,36,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Nhu� Nha Phi Phong"},
		{gdp={0,153,36,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Nhu� Nha Ch��ng"},
		{gdp={0,154,36,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Nhu� Nha Ngoa"},
	}
}
tb7KimXaKhoiPhuong = {
	item = {
		{gdp={0,152,37,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="M�ng S�t Phi Phong"},
		{gdp={0,153,37,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="M�ng S�t Ch��ng"},
		{gdp={0,154,37,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="M�ng S�t Ngoa"},
	}
}
--*********
tbKimXaHoanLang = {
	item = {
		{gdp={0,152,32,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Hi�p C�t Phi Phong"},
		{gdp={0,153,32,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Hi�p C�t Ch��ng"},
		{gdp={0,154,32,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Hi�p C�t Ngoa"},
	}
}
tbKimXaDangGiao = {
	item = {
		{gdp={0,152,33,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Qu� Ph� Phi Phong"},
		{gdp={0,153,33,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Qu� Ph� Ch��ng"},
		{gdp={0,154,33,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="Qu� Ph� Ngoa"},
	}
}
tbKimXaKhoiPhuong = {
	item = {
		{gdp={0,152,34,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="��ng V�n Phi Phong"},
		{gdp={0,153,34,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="��ng V�n Ch��ng"},
		{gdp={0,154,34,1,4,-1,-1,-1,-1,-1,-1,-1,0}, name="��ng V�n Ngoa"},
	}
}
tbKimXaVanDu = {
	item = {
		{gdp={0,153,28,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name="Huy Ch��ng V�n Du"},
		{gdp={0,152,28,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name="�o Cho�ng V�n Du"},
		{gdp={0,154,28,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name="��o H�i V�n Du"},
	}
}
	
tbKimXaThietHuyet = {
	item = {
		{gdp={0,153,27,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name="Huy Ch��ng Thi�t Huy�t"},
		{gdp={0,152,27,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name="�o Cho�ng Thi�t Huy�t"},
		{gdp={0,154,27,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name="��o H�i Thi�t Huy�t"},
	}
}
	
tbKimXaDuHiep = {
	item = {
		{gdp={0,153,26,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name="Huy Ch��ng Du Hi�p"},
		{gdp={0,152,26,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name="�o Cho�ng Du Hi�p"},
		{gdp={0,154,26,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name="��o H�i Du Hi�p"},
	}
}
tbKimXaVanDu7 = {
	item = {
		{gdp={0,153,28,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Huy Ch��ng V�n Du"},
		{gdp={0,152,28,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="�o Cho�ng V�n Du"},
		{gdp={0,154,28,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="��o H�i V�n Du"},
	}
}
	
tbKimXaThietHuyet7 = {
	item = {
		{gdp={0,153,27,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Huy Ch��ng Thi�t Huy�t"},
		{gdp={0,152,27,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="�o Cho�ng Thi�t Huy�t"},
		{gdp={0,154,27,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="��o H�i Thi�t Huy�t"},
	}
}
	
tbKimXaDuHiep7 = {
	item = {
		{gdp={0,153,26,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Huy Ch��ng Du Hi�p"},
		{gdp={0,152,26,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="�o Cho�ng Du Hi�p"},
		{gdp={0,154,26,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="��o H�i Du Hi�p"},
	}
}		

tbTrangBiKimXa_TuongQuan = {
	[1] = {
		[1] = {
				[1] = {item={{gdp={0,153,10,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng T��ng Qu�n"}}},
				[2] = {item={{gdp={0,153,11,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng T��ng Qu�n"}}},
				[3] = {item={{gdp={0,153,12,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng T��ng Qu�n"}}},
				[4] = {item={{gdp={0,153,13,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng T��ng Qu�n"}}},
			},
		[2] = {
				[1] = {item={{gdp={0,152,10,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng T�ng T��ng Qu�n"}}},
				[2] = {item={{gdp={0,152,11,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng T�ng T��ng Qu�n"}}},
				[3] = {item={{gdp={0,152,12,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng T�ng T��ng Qu�n"}}},
				[4] = {item={{gdp={0,152,13,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng T�ng T��ng Qu�n"}}},
			},
		[3] = {
				[1] = {item={{gdp={0,154,10,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i T�ng T��ng Qu�n"}}},
				[2] = {item={{gdp={0,154,11,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i T�ng T��ng Qu�n"}}},
				[3] = {item={{gdp={0,154,12,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i T�ng T��ng Qu�n"}}},
				[4] = {item={{gdp={0,154,13,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i T�ng T��ng Qu�n"}}},
			}
	},
	[2] = {
		[1] = {
				[1] = {item={{gdp={0,153,18,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u T��ng Qu�n"}}},
				[2] = {item={{gdp={0,153,19,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u T��ng Qu�n"}}},
				[3] = {item={{gdp={0,153,20,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u T��ng Qu�n"}}},
				[4] = {item={{gdp={0,153,21,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u T��ng Qu�n"}}},
			},
		[2] = {
				[1] = {item={{gdp={0,152,18,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u T��ng Qu�n"}}},
				[2] = {item={{gdp={0,152,19,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u T��ng Qu�n"}}},
				[3] = {item={{gdp={0,152,20,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u T��ng Qu�n"}}},
				[4] = {item={{gdp={0,152,21,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u T��ng Qu�n"}}},
			},
		[3] = {
				[1] = {item={{gdp={0,154,18,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u T��ng Qu�n"}}},
				[2] = {item={{gdp={0,154,19,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u T��ng Qu�n"}}},
				[3] = {item={{gdp={0,154,20,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u T��ng Qu�n"}}},
				[4] = {item={{gdp={0,154,21,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u T��ng Qu�n"}}},
			}
	},
}
tb_translife_cloth_PS_DuaTop = {
										[1] = {
													{"Chuy�n Sinh Trang", {0,108,30005,1,4,5,639,6,102}}, 
													{"Chuy�n Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													{"Chuy�n Sinh Trang", {0,110,30005,1,4,6,306,6,102}},
											},		
										[2] = {
													{"Chuy�n Sinh Trang", {0,108,30005,1,4,6,302,6,102}}, 
													{"Chuy�n Sinh Trang", {0,109,30005,1,4,5,409,6,102}}, 
													{"Chuy�n Sinh Trang", {0,110,30005,1,4,5,79,5,80,6,102}},
											},
										[3] = {
													 {"Chuy�n Sinh Trang", {0,108,30005,1,4,2,13075,6,102}}, 
													 {"Chuy�n Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													 {"Chuy�n Sinh Trang", {0,110,30005,1,4,6,306,6,102}},
											},	
										[4] = {
													 {"Chuy�n Sinh Trang", {0,108,30005,1,4,5,27,6,102}}, 
													 {"Chuy�n Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													 {"Chuy�n Sinh Trang", {0,110,30005,1,4,4,292,4,293,6,102}},
											},
									}	
-- Check �i�u ki�n nh�n th��ng theo Level
function TopCheckLevel()
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nAwardLevel = 0;
	local nLevel = GetLevel() + nChuyenSinh*100;
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = abs(GetTask(701));
	local nTaskVal = gf_GetTaskByte(TSK_TOP_LEVEL,1)
	for i = 396, 76, -1 do
		if type(tb_topserver_award_limit[i])=="table" and nLevel >= i and nRep >= tb_topserver_award_limit[i][1] and nFaction >= tb_topserver_award_limit[i][2] and nHor >= tb_topserver_award_limit[i][3] and nTaskVal >=  tb_topserver_award_limit[i][4] then
			nAwardLevel = i;
			break;
		end
	end
	return nAwardLevel;
end

-- Check level skill tr�n ph�i
function TopCheckSkill(tb_Skill_ID, nSkillLevel)
	local nRoute = GetPlayerRoute();
	local nSkillID = tb_Skill_ID[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= nSkillLevel then
			return 1
		else
			return 0
		end;
	end;
end

tb_Faction_Name = {	
	[1] = {"shaolin","Thi�u L�m"},
	[2] = {"wudang","V� �ang"},
	[3] = {"emei","Nga My"},
	[4] = {"gaibang","C�i Bang"},
	[5] = {"tangmen","���ng M�n"},
	[6] = {"yangmen","D��ng M�n"},
	[7] = {"wudu","Ng� ��c"},
}

tb_Route_Name = {	
	[1] = "",
	[2] = "Thi�u L�m T�c Gia",
	[3] = "Thi�u L�m Thi�n T�ng",
	[4] = "Thi�u L�m V� T�ng",
	[5] = "",
	[6] = "���ng M�n Ch�m",
	[7] = "",
	[8] = "Nga My Ph�t Gia",
	[9] = "Nga My T�c Gia",
	[10] = "",
	[11] = "C�i Bang T�nh Y",
	[12] = "C�i Bang � Y",
	[13] = "",
	[14] = "V� �ang ��o Gia",
	[15] = "V� �ang T�c Gia",
	[16] = "",
	[17] = "D��ng M�n Th��ng K�",
	[18] = "D��ng M�n Cung K�",
	[19] = "",
	[20] = "Ng� ��c T� Hi�p",
	[21] = "Ng� ��c C� S�",
	[22] = "",
	[23] = "C�n L�n Thi�n S�",
	[24] = "",
	[25] = "Minh Gi�o Th�nh Chi�n",
	[26] = "Minh Gi�o Tr�n Binh",
	[27] = "Minh Gi�o Huy�t Nh�n",
	[28] = "",
	[29] = "Th�y Y�n V� Ti�n",
	[30] = "Th�y Y�n Linh N�",
	[31] = "���ng M�n Nh�m Hi�p",
	[32] = "C�n L�n Ki�m T�n",
	
	
}

tb_Nation_Name = {	
	[1] = "T�ng",
	[2] = "Li�u",
}

-- Check Max Skill 55
function CheckMaxSkill55()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= 7 then
			return 1
		else
			return 0
		end;
	end;
end;


-- Nh�n th��ng Vi�m ��
function GiveAwardVD(nLv)
	local VD =
	{
		{0,103,8000,"Vi�m �� Kh�i"},
		{0,100,8000,"Vi�m �� Gi�p"},
		{0,101,8000,"Vi�m �� Trang"},
	}
	local nBody = GetBody()
	for i = 1 , getn(VD) do
		gf_AddItemEx2({VD[i][1],VD[i][2],VD[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nLv},VD[i][4],"Nhan Thuong Server moi","nh�n")
	end
end

-- Nh�n th��ng Nguy�n So�i theo ki�u h�nh
function GiveAwardNguyenSoai(nLv)
	local nBody = GetBody()
	if GetTask(701)>0 then
		for i = 1 , getn(tbNguyenSoaiTong) do
			local nItemLevel = nLv
			if tbNguyenSoaiTong[i][2] == 102 then
				nItemLevel = 0
			end
			gf_AddItemEx2({tbNguyenSoaiTong[i][1],tbNguyenSoaiTong[i][2],tbNguyenSoaiTong[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},tbNguyenSoaiTong[i][4],"Nhan Thuong Server moi","nh�n")
		end
	elseif GetTask(701)<0 then
		for i = 1 , getn(tbNguyenSoaiLieu) do
			local nItemLevel = nLv
			if tbNguyenSoaiLieu[i][2] == 102 then
				nItemLevel = 0
			end
			gf_AddItemEx2({tbNguyenSoaiLieu[i][1],tbNguyenSoaiLieu[i][2],tbNguyenSoaiLieu[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},tbNguyenSoaiLieu[i][4],"Nhan Thuong Server moi","nh�n")
		end
	end
end

-- Nh�n th��ng Thi�n Chi T��ng Qu�n  theo ki�u h�nh
function GiveAwardTCTQ(nLv)
	local tbTCTQTong = {
		{0,100,3015,"T�ng T��ng Qu�n Chi�n B�o"},
		{0,101,3015,"T�ng T��ng Qu�n Chi�n B�o"},
		{0,103,3015,"T�ng T��ng Qu�n Chi�n B�o"},
		{0,102,3031,"Thi�n Chi T�ng T��ng Qu�n L�nh B�i"},
		{0,102,3035,"Thi�n Chi T�ng T��ng Qu�n L�nh K�"},
		{0,102,3039,"Thi�n Chi T�ng T��ng Qu�n L�nh Ph�"},
	}
	local tbTCTQLieu = {
		{0,100,3019,"Li�u T��ng Qu�n Chi�n B�o"},
		{0,101,3019,"Li�u T��ng Qu�n Chi�n B�o"},
		{0,103,3019,"Li�u T��ng Qu�n Chi�n B�o"},
		{0,102,3043,"Thi�n Chi Li�u T��ng Qu�n L�nh B�i"},
		{0,102,3047,"Thi�n Chi Li�u T��ng Qu�n L�nh K�"},
		{0,102,3051,"Thi�n Chi Li�u T��ng Qu�n L�nh Ph�"},
	}
	local nBody = GetBody()
	if GetTask(701)>0 then
		for i = 1 , getn(tbTCTQTong) do
			local nItemLevel = nLv
			if tbTCTQTong[i][2] == 102 then
				nItemLevel = 0
			end
			gf_AddItemEx2({tbTCTQTong[i][1],tbTCTQTong[i][2],tbTCTQTong[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},tbTCTQTong[i][4],"Nhan Thuong Server moi","nh�n")
		end
	elseif GetTask(701)<0 then
		for i = 1 , getn(tbTCTQLieu) do
			local nItemLevel = nLv
			if tbTCTQLieu[i][2] == 102 then
				nItemLevel = 0
			end
			gf_AddItemEx2({tbTCTQLieu[i][1],tbTCTQLieu[i][2],tbTCTQLieu[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},tbTCTQLieu[i][4],"Nhan Thuong Server moi","nh�n")
		end
	end
end


-- Nh�n th��ng Thi�n Chi T�ng Ki�m theo ki�u h�nh
function GiveAwardTCTK(nAwardOrder)
	local tbBodyRatio = {1, 4, 7, 10}
	local tbTCTK = {
		[4] = {0,103,30000,"Thi�n Chi T�ng Ki�m T� Kim M�o"},
		[5] = {0,100,30000,"Thi�n Chi T�ng Ki�m Kim L� Th��ng"},
		[6] = {0,101,30000,"Thi�n Chi T�ng Ki�m � Kim Ph�c"},
		[7] = {0,102,30000,"Thi�n Chi T�ng Ki�m B�o Ch�u"},
		[8] = {0,102,30001,"Thi�n Chi T�ng Ki�m K� Th�ch"},
		[9] = {0,102,30002,"Thi�n Chi T�ng Ki�m Kim �n"},
	}
	local nBody = GetBody()
	if tbTCTK[nAwardOrder][2] ~= 102 then
		gf_AddItemEx2({tbTCTK[nAwardOrder][1], tbTCTK[nAwardOrder][2], tbTCTK[nAwardOrder][3]+nBody, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0}, tbTCTK[nAwardOrder][4], "Uu Dai "..szLOGSERVERNAME, "nh�n")
	else
		gf_AddItemEx2({tbTCTK[nAwardOrder][1], tbTCTK[nAwardOrder][2], tbTCTK[nAwardOrder][3]+tbBodyRatio[nBody], 1, 1, -1, -1, -1, -1, -1, -1, -1, 0}, tbTCTK[nAwardOrder][4], "Uu Dai "..szLOGSERVERNAME, "nh�n")
	end
end


function NhanVKTuVienThieuLam(nOption)
	if nOption==1 then
		gf_AddItemEx2(tbTuVienVuKhi[2][1][2], tbTuVienVuKhi[2][1][1], "Uu Dai "..szLOGSERVERNAME, "nh�n")
	else
		gf_AddItemEx2(tbTuVienVuKhi[2][2][2], tbTuVienVuKhi[2][2][1], "Uu Dai "..szLOGSERVERNAME, "nh�n")
	end
end

function NhanVKHienVienThieuLam(nOption)
	if nOption==1 then
		gf_AddItemEx2(tbHienVienVuKhi[2][1][2], tbHienVienVuKhi[2][1][1], "Uu Dai "..szLOGSERVERNAME, "nh�n")
	else
		gf_AddItemEx2(tbHienVienVuKhi[2][2][2], tbHienVienVuKhi[2][2][1], "Uu Dai "..szLOGSERVERNAME, "nh�n")
	end
end

function TraoThienChiViemDe(nItemLevel)
	local tbTCVD_Body1 = {
			item = {
				{gdp = {0,103,8055,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Kh�i"},
				{gdp = {0,100,8055,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Gi�p"},
				{gdp = {0,101,8055,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Trang"},
			}}
	local tbTCVD_Body2 = {
			item = {
				{gdp = {0,103,8056,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Kh�i"},
				{gdp = {0,100,8056,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Gi�p"},
				{gdp = {0,101,8056,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Trang"},
			}}
	local tbTCVD_Body3 = {
			item = {
				{gdp = {0,103,8057,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Kh�i"},
				{gdp = {0,100,8057,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Gi�p"},
				{gdp = {0,101,8057,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Trang"},
			}}
	local tbTCVD_Body4 = {
			item = {
				{gdp = {0,103,8058,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Kh�i"},
				{gdp = {0,100,8058,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Gi�p"},
				{gdp = {0,101,8058,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Trang"},
			}}
	local tbAwardSet = {
		[1] = tbTCVD_Body1,
		[2] = tbTCVD_Body2,
		[3] = tbTCVD_Body3,
		[4] = tbTCVD_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:AwardByBody(tbAwardSet)
end


function TraoThienChiTuongQuan(nItemLevel)
	local tbTongTCTQ_Body1 = {
			item = {
				{gdp = {0,103,3016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,3016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,3016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,3032,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,3036,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh K�"},
				{gdp = {0,102,3040,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongTCTQ_Body2 = {
			item = {
				{gdp = {0,103,3017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,3017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,3017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,3033,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,3037,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh K�"},
				{gdp = {0,102,3041,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Vi�m �� Trang"},
			}}
	local tbTongTCTQ_Body3 = {
			item = {
				{gdp = {0,103,3018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,3018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,3018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,3034,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,3038,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh K�"},
				{gdp = {0,102,3042,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongTCTQ_Body4 = {
			item = {
				{gdp = {0,103,3019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,3019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,3019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,3035,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,3039,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh K�"},
				{gdp = {0,102,3043,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh Ph�"},
			}}
	
	local tbLieuTCTQ_Body1 = {
			item = {
				{gdp = {0,103,3020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,3020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,3020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,3044,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,3048,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh K�"},
				{gdp = {0,102,3052,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuTCTQ_Body2 = {
			item = {
				{gdp = {0,103,3021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,3021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,3021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,3045,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,3049,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh K�"},
				{gdp = {0,102,3053,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuTCTQ_Body3 = {
			item = {
				{gdp = {0,103,3022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,3022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,3022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,3046,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,3050,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh K�"},
				{gdp = {0,102,3054,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuTCTQ_Body4 = {
			item = {
				{gdp = {0,103,3023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,3023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,3023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,3047,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,3051,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh K�"},
				{gdp = {0,102,3055,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongTCTQ_Body1,
		[2] = tbTongTCTQ_Body2,
		[3] = tbTongTCTQ_Body3,
		[4] = tbTongTCTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuTCTQ_Body1,
		[2] = tbLieuTCTQ_Body2,
		[3] = tbLieuTCTQ_Body3,
		[4] = tbLieuTCTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoNguLongTuongQuan(nItemLevel)
	local tbTongNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
				{gdp = {0,102,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30017,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30021,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
				{gdp = {0,102,30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30018,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30022,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
				{gdp = {0,102,30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30019,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30023,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
				{gdp = {0,102,30016,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30020,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30024,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
				{gdp = {0,102,30025,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30029,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30033,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
				{gdp = {0,102,30026,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30030,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30034,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
				{gdp = {0,102,30027,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30031,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30035,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
				{gdp = {0,102,30028,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30032,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30036,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongNLTQ_Body1,
		[2] = tbTongNLTQ_Body2,
		[3] = tbTongNLTQ_Body3,
		[4] = tbTongNLTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNLTQ_Body1,
		[2] = tbLieuNLTQ_Body2,
		[3] = tbLieuNLTQ_Body3,
		[4] = tbLieuNLTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoBachKimViemDe(nItemLevel)
	local tbBachKimViemDe_Body1 = {
			item = {
				{gdp = {0,103,30013,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Kh�i"},
				{gdp = {0,100,30013,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Gi�p"},
				{gdp = {0,101,30013,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Trang"},
			}}
	local tbBachKimViemDe_Body2 = {
			item = {
				{gdp = {0,103,30014,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Kh�i"},
				{gdp = {0,100,30014,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Gi�p"},
				{gdp = {0,101,30014,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Trang"},
			}}
	local tbBachKimViemDe_Body3 = {
			item = {
				{gdp = {0,103,30015,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Kh�i"},
				{gdp = {0,100,30015,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Gi�p"},
				{gdp = {0,101,30015,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Trang"},
			}}
	local tbBachKimViemDe_Body4 = {
			item = {
				{gdp = {0,103,30016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Kh�i"},
				{gdp = {0,100,30016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Gi�p"},
				{gdp = {0,101,30016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Trang"},
			}}
	local tbAwardSet = {
		[1] = tbBachKimViemDe_Body1,
		[2] = tbBachKimViemDe_Body2,
		[3] = tbBachKimViemDe_Body3,
		[4] = tbBachKimViemDe_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:AwardByBody(tbAwardSet)
end

function TraoNguyenSoai(nItemLevel)
	local tbTongNguyenSoai_Body1 = {
			item = {
				{gdp = {0,103,2251,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,100,2251,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,101,2251,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,102,2301,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Nguy�n So�i H� Ph�"},
				{gdp = {0,102,2305,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Nguy�n So�i L�nh K�"},
				{gdp = {0,102,2501,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng So�i Ph�"},
				{gdp = {0,102,2505,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng So�i K�"},
			}}
	local tbTongNguyenSoai_Body2 = {
			item = {
				{gdp = {0,103,2252,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,100,2252,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,101,2252,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,102,2302,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Nguy�n So�i H� Ph�"},
				{gdp = {0,102,2306,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Nguy�n So�i L�nh K�"},
				{gdp = {0,102,2502,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng So�i Ph�"},
				{gdp = {0,102,2506,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng So�i K�"},
			}}
	local tbTongNguyenSoai_Body3 = {
			item = {
				{gdp = {0,103,2253,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,100,2253,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,101,2253,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,102,2303,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Nguy�n So�i H� Ph�"},
				{gdp = {0,102,2307,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Nguy�n So�i L�nh K�"},
				{gdp = {0,102,2503,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng So�i Ph�"},
				{gdp = {0,102,2507,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng So�i K�"},
			}}
	local tbTongNguyenSoai_Body4 = {
			item = {
				{gdp = {0,103,2254,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,100,2254,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,101,2254,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,102,2304,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Nguy�n So�i H� Ph�"},
				{gdp = {0,102,2308,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Nguy�n So�i L�nh K�"},
				{gdp = {0,102,2504,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng So�i Ph�"},
				{gdp = {0,102,2508,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng So�i K�"},
			}}		
	
	local tbLieuNguyenSoai_Body1 = {
			item = {
				{gdp = {0,103,2255,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u  Nguy�n So�i Chi�n B�o"},
				{gdp = {0,100,2255,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Nguy�n So�i Chi�n B�o"},
				{gdp = {0,101,2255,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Nguy�n So�i Chi�n B�o"},
				{gdp = {0,102,2311,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Nguy�n So�i H� Ph�"},
				{gdp = {0,102,2315,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Nguy�n So�i L�nh K�"},
				{gdp = {0,102,2511,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u So�i Ph�"},
				{gdp = {0,102,2515,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u So�i K�"},
			}}
	local tbLieuNguyenSoai_Body2 = {
			item = {
				{gdp = {0,103,2256,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u  Nguy�n So�i Chi�n B�o"},
				{gdp = {0,100,2256,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Nguy�n So�i Chi�n B�o"},
				{gdp = {0,101,2256,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Nguy�n So�i Chi�n B�o"},
				{gdp = {0,102,2312,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Nguy�n So�i H� Ph�"},
				{gdp = {0,102,2316,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Nguy�n So�i L�nh K�"},
				{gdp = {0,102,2512,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u So�i Ph�"},
				{gdp = {0,102,2516,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u So�i K�"},
			}}
	local tbLieuNguyenSoai_Body3 = {
			item = {
				{gdp = {0,103,2257,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u  Nguy�n So�i Chi�n B�o"},
				{gdp = {0,100,2257,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Nguy�n So�i Chi�n B�o"},
				{gdp = {0,101,2257,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Nguy�n So�i Chi�n B�o"},
				{gdp = {0,102,2313,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Nguy�n So�i H� Ph�"},
				{gdp = {0,102,2317,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Nguy�n So�i L�nh K�"},
				{gdp = {0,102,2513,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u So�i Ph�"},
				{gdp = {0,102,2517,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u So�i K�"},
			}}
	local tbLieuNguyenSoai_Body4 = {
			item = {
				{gdp = {0,103,2258,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u  Nguy�n So�i Chi�n B�o"},
				{gdp = {0,100,2258,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Nguy�n So�i Chi�n B�o"},
				{gdp = {0,101,2258,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Nguy�n So�i Chi�n B�o"},
				{gdp = {0,102,2314,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Nguy�n So�i H� Ph�"},
				{gdp = {0,102,2318,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Nguy�n So�i L�nh K�"},
				{gdp = {0,102,2514,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u So�i Ph�"},
				{gdp = {0,102,2518,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u So�i K�"},
			}}
					
	local tbTongAwardSet = {
		[1] = tbTongNguyenSoai_Body1,
		[2] = tbTongNguyenSoai_Body2,
		[3] = tbTongNguyenSoai_Body3,
		[4] = tbTongNguyenSoai_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNguyenSoai_Body1,
		[2] = tbLieuNguyenSoai_Body2,
		[3] = tbLieuNguyenSoai_Body3,
		[4] = tbLieuNguyenSoai_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoThuongUngNguyenSoai(nItemLevel)
	local tbTongTUNS_Body1 = {
			item = {
				{gdp = {0,103,30037,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Kh�i"},
				{gdp = {0,100,30037,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Gi�p"},
				{gdp = {0,101,30037,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Trang"},
				{gdp = {0,102,30064,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i H�"},
				{gdp = {0,102,30068,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i L�nh"},
				{gdp = {0,102,30072,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i Ph�"},
				{gdp = {0,102,30076,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i K�"},
			}}
	local tbTongTUNS_Body2 = {
			item = {
				{gdp = {0,103,30038,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Kh�i"},
				{gdp = {0,100,30038,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Gi�p"},
				{gdp = {0,101,30038,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Trang"},
				{gdp = {0,102,30065,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i H�"},
				{gdp = {0,102,30069,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i L�nh"},
				{gdp = {0,102,30073,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i Ph�"},
				{gdp = {0,102,30077,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i K�"},
			}}
	local tbTongTUNS_Body3 = {
			item = {
				{gdp = {0,103,30039,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Kh�i"},
				{gdp = {0,100,30039,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Gi�p"},
				{gdp = {0,101,30039,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Trang"},
				{gdp = {0,102,30066,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i H�"},
				{gdp = {0,102,30070,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i L�nh"},
				{gdp = {0,102,30074,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i Ph�"},
				{gdp = {0,102,30078,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i K�"},
			}}
	local tbTongTUNS_Body4 = {
			item = {
				{gdp = {0,103,30040,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Kh�i"},
				{gdp = {0,100,30040,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Gi�p"},
				{gdp = {0,101,30040,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Trang"},
				{gdp = {0,102,30067,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i H�"},
				{gdp = {0,102,30071,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i L�nh"},
				{gdp = {0,102,30075,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i Ph�"},
				{gdp = {0,102,30079,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i K�"},
			}}
			
	local tbLieuTUNS_Body1 = {
			item = {
				{gdp = {0,103,30049,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Kh�i"},
				{gdp = {0,100,30049,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Gi�p"},
				{gdp = {0,101,30049,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Trang"},
				{gdp = {0,102,30100,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i H�"},
				{gdp = {0,102,30104,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i L�nh"},
				{gdp = {0,102,30108,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i Ph�"},
				{gdp = {0,102,30112,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i K�"},
			}}
	local tbLieuTUNS_Body2 = {
			item = {
				{gdp = {0,103,30050,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Kh�i"},
				{gdp = {0,100,30050,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Gi�p"},
				{gdp = {0,101,30050,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Trang"},
				{gdp = {0,102,30101,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i H�"},
				{gdp = {0,102,30105,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i L�nh"},
				{gdp = {0,102,30109,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i Ph�"},
				{gdp = {0,102,30113,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i K�"},
			}}
	local tbLieuTUNS_Body3 = {
			item = {
				{gdp = {0,103,30051,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Kh�i"},
				{gdp = {0,100,30051,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Gi�p"},
				{gdp = {0,101,30051,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Trang"},
				{gdp = {0,102,30102,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i H�"},
				{gdp = {0,102,30106,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i L�nh"},
				{gdp = {0,102,30110,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i Ph�"},
				{gdp = {0,102,30114,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i K�"},
			}}
	local tbLieuTUNS_Body4 = {
			item = {
				{gdp = {0,103,30052,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Kh�i"},
				{gdp = {0,100,30052,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Gi�p"},
				{gdp = {0,101,30052,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Trang"},
				{gdp = {0,102,30103,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i H�"},
				{gdp = {0,102,30107,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i L�nh"},
				{gdp = {0,102,30111,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i Ph�"},
				{gdp = {0,102,30115,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i K�"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongTUNS_Body1,
		[2] = tbTongTUNS_Body2,
		[3] = tbTongTUNS_Body3,
		[4] = tbTongTUNS_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuTUNS_Body1,
		[2] = tbLieuTUNS_Body2,
		[3] = tbLieuTUNS_Body3,
		[4] = tbLieuTUNS_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoThuongUngTuongQuan(nItemLevel)
	local tbTongTUTQ_Body1 = {
			item = {
				{gdp = {0,103,30033,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,30033,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,30033,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,30052,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30056,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30060,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongTUTQ_Body2 = {
			item = {
				{gdp = {0,103,30034,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,30034,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,30034,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,30053,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30057,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30061,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongTUTQ_Body3 = {
			item = {
				{gdp = {0,103,30035,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,30035,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,30035,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,30054,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30058,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30062,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongTUTQ_Body4 = {
			item = {
				{gdp = {0,103,30036,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,30036,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,30036,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,30055,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30059,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30063,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh Ph�"},
			}}	
			
	local tbLieuTUTQ_Body1 = {
			item = {
				{gdp = {0,103,30045,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,30045,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,30045,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,30088,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30092,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30096,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuTUTQ_Body2 = {
			item = {
				{gdp = {0,103,30046,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,30046,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,30046,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,30089,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30093,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30097,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuTUTQ_Body3 = {
			item = {
				{gdp = {0,103,30047,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,30047,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,30047,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,30090,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30094,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30098,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuTUTQ_Body4 = {
			item = {
				{gdp = {0,103,30048,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,30048,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,30048,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,30091,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30095,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30099,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh Ph�"},
			}}		
	local tbTongAwardSet = {
		[1] = tbTongTUTQ_Body1,
		[2] = tbTongTUTQ_Body2,
		[3] = tbTongTUTQ_Body3,
		[4] = tbTongTUTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuTUTQ_Body1,
		[2] = tbLieuTUTQ_Body2,
		[3] = tbLieuTUTQ_Body3,
		[4] = tbLieuTUTQ_Body4,
	}
	LIB_Award.szLogTitle = "Uu Dai "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoThuongUngDoThong(nGenre)
	local szItemName = "Th��ng �ng �� Th�ng "
	local nID = 30028
	local szPhe = "T�ng "
	if GetTask(701) < 0 then
		nID = 30040
		szPhe = "Li�u "
	end
	if nGenre == 100 then
		szItemName = szPhe .. szItemName .. "Gi�p"
	elseif nGenre == 101 then
		szItemName = szPhe .. szItemName .. "Trang"
	elseif nGenre == 103 then
		szItemName = szPhe .. szItemName .. "Kh�i"
	end
	local nBody = GetBody()
	local tbAward = {item = {{gdp={0,nGenre,nID+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = szItemName}}}
	LIB_Award.szLogTitle = "Uu Dai "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbAward)
end


function TraoThuongUngTienPhong(nType)
	local szItemName = "Th��ng �ng Ti�n Phong "
	local nID = 30043
	local szPhe = "T�ng "
	if GetTask(701) < 0 then
		nID = 30079
		szPhe = "Li�u "
	end
	
	if nType == 1 then
		szItemName = szPhe .. szItemName .. "K�"
	else
		szItemName = szPhe .. szItemName .. "Ph�"
		nID = nID + 4
	end
	local nBody = GetBody()
	local tbAward = {item = {{gdp={0,102,nID+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = szItemName}}}
	LIB_Award.szLogTitle = "Uu Dai "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbAward)
end


function TraoNguLongTuongQuan_TrangBi(nItemLevel)
	local tbTongNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
			}}
	local tbTongNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
			}}
	local tbTongNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
			}}
	local tbTongNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
			}}
	local tbLieuNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
			}}
	local tbLieuNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
			}}
	local tbLieuNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
			}}
	local tbLieuNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongNLTQ_Body1,
		[2] = tbTongNLTQ_Body2,
		[3] = tbTongNLTQ_Body3,
		[4] = tbTongNLTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNLTQ_Body1,
		[2] = tbLieuNLTQ_Body2,
		[3] = tbLieuNLTQ_Body3,
		[4] = tbLieuNLTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoNguLongTuongQuan_TrangSuc()
	local tbTongNLTQ_Body1 = {
			item = {
				{gdp = {0,102,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30017,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30021,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongNLTQ_Body2 = {
			item = {
				{gdp = {0,102,30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30018,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30022,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongNLTQ_Body3 = {
			item = {
				{gdp = {0,102,30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30019,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30023,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongNLTQ_Body4 = {
			item = {
				{gdp = {0,102,30016,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30020,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30024,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body1 = {
			item = {
				{gdp = {0,102,30025,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30029,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30033,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body2 = {
			item = {
				{gdp = {0,102,30026,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30030,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30034,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body3 = {
			item = {
				{gdp = {0,102,30027,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30031,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30035,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body4 = {
			item = {
				{gdp = {0,102,30028,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30032,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30036,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongNLTQ_Body1,
		[2] = tbTongNLTQ_Body2,
		[3] = tbTongNLTQ_Body3,
		[4] = tbTongNLTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNLTQ_Body1,
		[2] = tbLieuNLTQ_Body2,
		[3] = tbLieuNLTQ_Body3,
		[4] = tbLieuNLTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoMatTich70CaoCap(nQty)
	local tbMatTich = {
		[2] =  {item={{gdp={0, 107, 204,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Kim Cang B�t Nh� Ch�n Quy�n"}}}, 
		[3] =  {item={{gdp={0, 107, 206,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="V� Tr�n B� �� Ch�n Quy�n"}}},
		[4] =  {item={{gdp={0, 107, 205,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Ti�m Long T�c Di�t Ch�n Quy�n"}}},
		[6] =  {item={{gdp={0, 107, 207,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n La Li�n Ch�u Ch�n Quy�n"}}},
		[8] =  {item={{gdp={0, 107, 208,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Nh� � Kim ��nh Ch�n Quy�n"}}},
		[9] =  {item={{gdp={0, 107, 209,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="B�ch H�i Tuy�t �m Ch�n Quy�n"}}},
		[14] =  {item={{gdp={0, 107, 212,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Huy�n �nh M� T�ng Ch�n Quy�n"}}},
		[15] =  {item={{gdp={0, 107, 213,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Qu�n T� ��i Phong Ch�n Quy�n"}}},		
		[11] =  {item={{gdp={0, 107, 210,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�n ��n Tr�n Nh�c Ch�n Quy�n"}}},
		[12] =  {item={{gdp={0, 107, 211,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Qu� Thi�n Du Long Ch�n Quy�n"}}},		
		[17] =  {item={{gdp={0, 107, 214,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"}}},
		[18] =  {item={{gdp={0, 107, 215,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Xuy�n V�n L�c H�ng Ch�n Quy�n"}}},
		[20] =  {item={{gdp={0, 107, 216,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Huy�n Minh Phong Ma Ch�n Quy�n"}}},
		[21] =  {item={{gdp={0, 107, 217,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Linh C� Huy�n T� Ch�n Quy�n"}}},
		[23] =  {item={{gdp={0, 107, 218,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="C�u Thi�n Phong L�i Ch�n Quy�n"}}},
		[29] =  {item={{gdp={0, 107, 222,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�ng Tr�n T�y M�ng Ch�n Quy�n"}}},
		[30] =  {item={{gdp={0, 107, 223,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Phong Hoa Thi�n Di�p Ch�n Quy�n"}}},
		[31] =  {item={{gdp={0, 107, 231,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="H�ng Tr�n T�y M�ng Ch�n Quy�n"}}},
		[32] =  {item={{gdp={0, 107, 235,nQty,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Phong Hoa Thi�n Di�p Ch�n Quy�n"}}},	
	}
	
	local tbMatTich_GN = {
		[2] = {0,107,204, 2,"Kim Cang B�t Nh� Ch�n Quy�n"},
		[4] = {0,107,205, 1,"Ti�m Long T�c Di�t Ch�n Quy�n"},
		[3] = {0,107,206, 1,"V� Tr�n B� �� Ch�n Quy�n"},
		[6] = {0,107,207, 2,"Thi�n La Li�n Ch�u Ch�n Quy�n"},
		[8] = {0,107,208, 1,"Nh� � Kim ��nh Ch�n Quy�n"},
		[9] = {0,107,209, 1,"B�ch H�i Tuy�t �m Ch�n Quy�n"},
		[11] = {0,107,210, 2,"H�n ��n Tr�n Nh�c Ch�n Quy�n"},
		[12] = {0,107,211, 2,"Qu� Thi�n Du Long Ch�n Quy�n"},
		[14] = {0,107,212, 1,"Huy�n �nh M� T�ng Ch�n Quy�n"},
		[15] = {0,107,213, 2,"Qu�n T� ��i Phong Ch�n Quy�n"},
		[17] = {0,107,214, 2,"Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"},
		[18] = {0,107,215, 2,"Xuy�n V�n L�c H�ng Ch�n Quy�n"},
		[20] = {0,107,216, 2,"Huy�n Minh Phong Ma Ch�n Quy�n"},
		[21] = {0,107,217, 1,"Linh C� Huy�n T� Ch�n Quy�n"},
		[23] = {0,107,218,1,"C�u Thi�n Phong L�i Ch�n Quy�n"},
		[29] = {0,107,222,2,"H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[30] = {0,107,223,2,"Phong Hoa Thi�n Di�p Ch�n Quy�n"},
		[31] = {0,107,231,2,"H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[32] = {0,107,235,2,"Phong Hoa Thi�n Di�p Ch�n Quy�n"},
	}
	
	local nRoute = GetPlayerRoute()
	for i = 1, nQty do 
		if nRoute == nil then
			nIndex = LIB_Award:GetValueByRate(tbRate)
		else
			nIndex = nRoute
		end
		local _, nItemID = AddItem(tbMatTich_GN[nRoute][1], tbMatTich_GN[nRoute][2], tbMatTich_GN[nRoute][3], 1)
		if tbMatTich_GN[nRoute][4] == 1 then
			SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
		else
			SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
		end
	end
	
	gf_WriteLogEx("Nhan Thuong Dua Top"..szLOGSERVERNAME, "nh�n", nQty, "M�t t�ch si�u c�p")
	Msg2Player("B�n nh�n ���c "..nQty.." m�t t�ch si�u c�p")

end


function ThuongVuKhi_ThuyYenLinhNu()
	local nOpLevel1, nOpID1 = IDOption_Random()
	local nOpLevel2, nOpID2 = IDOption_Random()
	if nOpID1 == nOpID2 then
		local tbRate = {[1]={[1] = 6, nRate=80}, [2]={[1] = 7, nRate=20},}
		nOpID2 = 50
		nOpLevel2 = LIB_Award:GetValueByRate(tbRate)
	end

	local tbAward = {item={{gdp={0,12,12,1,1,3,252,nOpLevel1,nOpID1,nOpLevel2,nOpID2,-1, 0}, name = "Minh B�ng"}}}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbAward)
end

			
function IDOption_Random()
	local tbOptionIDList = {
		[1] = {[1] = {49, {
						[1] = {[1] = 6, nRate=50}, 
						[2] = {[1] = 7, nRate=50},
				}}, nRate = 10.12},
		
		[2] = {[1] = {268, {
					[1]={[1] = 3, nRate=60}, 
					[2]={[1] = 4, nRate=34},
					[3]={[1] = 5, nRate=5},
					[4]={[1] = 6, nRate=1},
				}}, nRate = 1.62},
		[3] = {[1] = {53, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 6.11},
		[4] = {[1] = {54, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 6.11},
		[5] = {[1] = {63, {
					[1]={[1] = 5, nRate=50}, 
					[2]={[1] = 6, nRate=50},
				}}, nRate = 10.12},
		[6] = {[1] = {390, {
					[1]={[1] = 2, nRate=70}, 
					[2]={[1] = 3, nRate=25},
					[3]={[1] = 4,nRate=5},
				}}, nRate = 1.11},
		[7] = {[1] = {85, {
					[1]={[1] = 4, nRate=60}, 
					[2]={[1] = 5, nRate=30},
					[3]={[1] = 6,nRate=10},
				}}, nRate = 4.11},
		[8] = {[1] = {94, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 11.12},	
		[9] = {[1] = {96, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 11.12},
		[10] = {[1] = {97, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 11.12},
		[11] = {[1] = {95, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 11.12},
		[12] = {[1] = {102, {
					[1]={[1] = 6, nRate=80}, 
					[2]={[1] = 7, nRate=20},
				}}, nRate = 8.11},
		[13] = {[1] = {111, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 8.11},
	}
	local tbOptionTemp = LIB_Award:GetValueByRate(tbOptionIDList)
	local nOptionID = tbOptionTemp[1]
	local nOptionLevel = LIB_Award:GetValueByRate(tbOptionTemp[2])
	return nOptionLevel, nOptionID
end


function NhanRuongYeuQuyet(nThoihan)
	local tbRuongYeuQuyet = {
		[2] = {item={{gdp={2,0,607,1}, name="T�i b� ki�p Thi�u L�m", nExpired = nThoihan}}},
		[4] = {item={{gdp={2,0,607,1}, name="T�i b� ki�p Thi�u L�m", nExpired = nThoihan}}},
		[3] = {item={{gdp={2,0,607,1}, name="T�i b� ki�p Thi�u L�m", nExpired = nThoihan}}},
		[6] = {item={{gdp={2,0,608,1}, name="T�i b� ki�p ���ng M�n", nExpired = nThoihan}}},
		[8] = {item={{gdp={2,0,609,1}, name="T�i b� ki�p Nga My", nExpired = nThoihan}}},
		[9] = {item={{gdp={2,0,609,1}, name="T�i b� ki�p Nga My", nExpired = nThoihan}}},
		[11] = {item={{gdp={2,0,610,1}, name="T�i b� ki�p C�i Bang", nExpired = nThoihan}}},
		[12] = {item={{gdp={2,0,610,1}, name="T�i b� ki�p C�i Bang", nExpired = nThoihan}}},
		[14] = {item={{gdp={2,0,611,1}, name="T�i b� ki�p V� �ang", nExpired = nThoihan}}},
		[15] = {item={{gdp={2,0,611,1}, name="T�i b� ki�p V� �ang", nExpired = nThoihan}}},
		[17] = {item={{gdp={2,0,612,1}, name="T�i b� ki�p D��ng M�n", nExpired = nThoihan}}},
		[18] = {item={{gdp={2,0,612,1}, name="T�i b� ki�p D��ng M�n", nExpired = nThoihan}}},
		[20] = {item={{gdp={2,0,613,1}, name="T�i b� ki�p Ng� ��c", nExpired = nThoihan}}},
		[21] = {item={{gdp={2,0,613,1}, name="T�i b� ki�p Ng� ��c", nExpired = nThoihan}}},
		[23] = {fn="NhanBiKipConLon()"},
		[29] = {fn="NhanBiKipThuyYen()"},
		[30] = {fn="NhanBiKipThuyYen()"},
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
--	for i=1,5 do
		LIB_Award:AwardByRoute(tbRuongYeuQuyet)
--	end
end


function NhanBiKipConLon()
	if gf_Judge_Room_Weight(5,100) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0
	end
	local tbBiKipConLon = {
		[1] = { [1] = { item = { { gdp = { 2, 6, 169, 1 }, name = "B� ki�p L�i T�" } } }, nRate = 7.15 },
		[2] = { [1] = { item = { { gdp = { 2, 6, 170, 1 }, name = "B� ki�p Phong T�" } } }, nRate = 7.15 },
		[3] = { [1] = { item = { { gdp = { 2, 6, 171, 1 }, name = "B� ki�p Thi�n l�i ph�" } } }, nRate = 7.15 },
		[4] = { [1] = { item = { { gdp = { 2, 6, 172, 1 }, name = "B� ki�p B�ng Phong Quy�t" } } }, nRate = 7.15 },
		[5] = { [1] = { item = { { gdp = { 2, 6, 173, 1 }, name = "B� ki�p Ng� Phong Quy�t" } } }, nRate = 7.14 },
		[6] = { [1] = { item = { { gdp = { 2, 6, 174, 1 }, name = "B� Ki�p Cu�ng L�i Ph�" } } }, nRate = 7.14 },
		[7] = { [1] = { item = { { gdp = { 2, 6, 175, 1 }, name = "B� Ki�p D��ng Sa Quy�t" } } }, nRate = 7.14 },
		[8] = { [1] = { item = { { gdp = { 2, 6, 176, 1 }, name = "B� Ki�p Oanh L�i Ph�" } } }, nRate = 7.14 },
		[9] = { [1] = { item = { { gdp = { 2, 6, 177, 1 }, name = "B� Ki�p Canh Phong Quy�t" } } }, nRate = 7.14 },
		[10] = { [1] = { item = { { gdp = { 2, 6, 178, 1 }, name = "B� Ki�p B�o L�i Ph�" } } }, nRate = 7.14 },
		[11] = { [1] = { item = { { gdp = { 2, 6, 179, 1 }, name = "B� Ki�p Ti�u phong t�n quy�t" } } }, nRate = 7.14 },
		[12] = { [1] = { item = { { gdp = { 2, 6, 180, 1 }, name = "B� Ki�p Ng� L�i ch�nh ph�p ph�" } } }, nRate = 7.14 },
		[13] = { [1] = { item = { { gdp = { 2, 6, 181, 1 }, name = "B� Ki�p V�n L�i To�i Tinh ph�" } } }, nRate = 7.14 },
		[14] = { [1] = { item = { { gdp = { 2, 6, 182, 1 }, name = "B� Ki�p Huy�n Phong tri�n quy�t" } } }, nRate = 7.14 },
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	for i=1,5 do
		LIB_Award:AwardByRate(tbBiKipConLon)
	end
end


function NhanBiKipThuyYen()
	if gf_Judge_Room_Weight(5,100) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0
	end
	local tbBiKipThuyYen = {
		[1] = {[1] = {item={{gdp={2,6,219,1}, name = "Y�u quy�t Kh�i V�"}}}, nRate = 4.55},
		[2] = {[1] = {item={{gdp={2,6,220,1}, name = "Y�u quy�t Linh Mi�u V�n"}}}, nRate = 4.55},
		[3] = {[1] = {item={{gdp={2,6,221,1}, name = "Y�u quy�t V� V�n T�m Ph�p"}}}, nRate = 4.55},
		[4] = {[1] = {item={{gdp={2,6,222,1}, name = "Y�u quy�t M� Hoa"}}}, nRate = 4.55},
		[5] = {[1] = {item={{gdp={2,6,223,1}, name = "Y�u quy�t �o�n V�n"}}}, nRate = 4.55},
		[6] = {[1] = {item={{gdp={2,6,224,1}, name = "Y�u quy�t Thu Nguy�t V�"}}}, nRate = 4.55},
		[7] = {[1] = {item={{gdp={2,6,225,1}, name = "Y�u quy�t Thi�n L�i T�m Kinh"}}}, nRate = 4.54},
		[8] = {[1] = {item={{gdp={2,6,226,1}, name = "Y�u quy�t �i�p Uy�n"}}}, nRate = 4.54},
		[9] = {[1] = {item={{gdp={2,6,227,1}, name = "Y�u quy�t Thi�n H�a Di�m D��ng"}}}, nRate = 4.54},
		[10] = {[1] = {item={{gdp={2,6,228,1}, name = "��p V�n X�o B� Quy�t Y�u"}}}, nRate = 4.54},
		[11] = {[1] = {item={{gdp={2,6,229,1}, name = "Y�u quy�t M�ng X�"}}}, nRate = 4.54},
		[12] = {[1] = {item={{gdp={2,6,230,1}, name = "Y�u quy�t L�c Hoa Quy�t"}}}, nRate = 4.55},
		[13] = {[1] = {item={{gdp={2,6,231,1}, name = "Y�u quy�t ��o Hoa Ch��ng"}}}, nRate = 4.55},
		[14] = {[1] = {item={{gdp={2,6,232,1}, name = "Y�u quy�t B�ch Hoa T�m Kinh"}}}, nRate = 4.55},
		[15] = {[1] = {item={{gdp={2,6,233,1}, name = "Y�u quy�t T�a T�m Quy�t"}}}, nRate = 4.55},
		[16] = {[1] = {item={{gdp={2,6,234,1}, name = "Y�u quy�t Ho�n Th�n Thu�t"}}}, nRate = 4.55},
		[17] = {[1] = {item={{gdp={2,6,235,1}, name = "Y�u quy�t Linh ��ng Quy�t"}}}, nRate = 4.55},
		[18] = {[1] = {item={{gdp={2,6,236,1}, name = "Y�u quy�t M� X�o Quy�t"}}}, nRate = 4.54},
		[19] = {[1] = {item={{gdp={2,6,237,1}, name = "Y�u quy�t Ti�n L� H��ng"}}}, nRate = 4.54},
		[20] = {[1] = {item={{gdp={2,6,238,1}, name = "Y�u quy�t B�ch �i�p Ngh�nh H��ng Quy�t"}}}, nRate = 4.54},
		[21] = {[1] = {item={{gdp={2,6,239,1}, name = "Y�u quy�t �i�p Luy�n Hoa"}}}, nRate = 4.54},
		[22] = {[1] = {item={{gdp={2,6,240,1}, name = "Y�u quy�t Ng�c Long Xuy�n Nguy�t"}}}, nRate = 4.54},
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	for i=1,5 do
		LIB_Award:AwardByRate(tbBiKipThuyYen)
	end
end


function TraoMatTichCaoCap20(nQty,nRoute)

	local tbMatTich = {
		[2] = {0,107,204, 2,"Kim Cang B�t Nh� Ch�n Quy�n"},
		[4] = {0,107,205, 1,"Ti�m Long T�c Di�t Ch�n Quy�n"},
		[3] = {0,107,206, 1,"V� Tr�n B� �� Ch�n Quy�n"},
		[6] = {0,107,207, 2,"Thi�n La Li�n Ch�u Ch�n Quy�n"},
		[8] = {0,107,208, 1,"Nh� � Kim ��nh Ch�n Quy�n"},
		[9] = {0,107,209, 1,"B�ch H�i Tuy�t �m Ch�n Quy�n"},
		[11] = {0,107,210, 2,"H�n ��n Tr�n Nh�c Ch�n Quy�n"},
		[12] = {0,107,211, 2,"Qu� Thi�n Du Long Ch�n Quy�n"},
		[14] = {0,107,212, 1,"Huy�n �nh M� T�ng Ch�n Quy�n"},
		[15] = {0,107,213, 2,"Qu�n T� ��i Phong Ch�n Quy�n"},
		[17] = {0,107,214, 2,"Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"},
		[18] = {0,107,215, 2,"Xuy�n V�n L�c H�ng Ch�n Quy�n"},
		[20] = {0,107,216, 2,"Huy�n Minh Phong Ma Ch�n Quy�n"},
		[21] = {0,107,217, 1,"Linh C� Huy�n T� Ch�n Quy�n"},
		[23] = {0,107,218,1,"C�u Thi�n Phong L�i Ch�n Quy�n"},
		[25] = {0,107,219,2,"H�i Phong Tr�m Nh�t Ch�n Quy�n"},
		[26] = {0,107,220,2,"Ph� K� H�nh Tr�n Ch�n Quy�n"},
		[27] = {0,107,221,1,"Ng�ng Huy�t Phong H�n Ch�n Quy�n"},
		[29] = {0,107,222,2,"H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[30] = {0,107,223,2,"Phong Hoa Thi�n Di�p Ch�n Quy�n"},
		[31] = {0,107,231,2,"H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[32] = {0,107,235,2,"Phong Hoa Thi�n Di�p Ch�n Quy�n"},
	}
	local tbRate = {
		[1] = {[1] = 2, nRate = 5.88},
		[2] = {[1] = 4, nRate = 5.88},
		[3] = {[1] = 3, nRate = 5.88},
		[4] = {[1] = 6, nRate = 5.88},
		[5] = {[1] = 8, nRate = 5.88},
		[6] = {[1] = 9, nRate = 5.88},
		[7] = {[1] = 11, nRate = 5.88},
		[8] = {[1] = 12, nRate = 5.88},
		[9] = {[1] = 14, nRate = 5.88},
		[10] = {[1] = 15, nRate = 5.88},
		[11] = {[1] = 17, nRate = 5.88},
		[12] = {[1] = 18, nRate = 5.88},
		[13] = {[1] = 20, nRate = 5.88},
		[14] = {[1] = 21, nRate = 5.88},
		[15] = {[1] = 23, nRate = 5.88},
		[16] = {[1] = 29, nRate = 5.88},
		[17] = {[1] = 30, nRate = 5.92},
	}
	for i=1, nQty do
		if nRoute == nil then
			nIndex = LIB_Award:GetValueByRate(tbRate)
		else
			nIndex = nRoute
		end
		local _, nItemID = AddItem(tbMatTich[nIndex][1], tbMatTich[nIndex][2], tbMatTich[nIndex][3], 1)
		if tbMatTich[nIndex][4] == 1 then
			SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
		else
			SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
		end
	end
end
function TraoMatTichCaoCap20_loaithuong(nQty,nRoute)

	local tbMatTich = {
		[2] = {0,107,204, 2,"Kim Cang B�t Nh� Ch�n Quy�n"},
		[4] = {0,107,205, 1,"Ti�m Long T�c Di�t Ch�n Quy�n"},
		[3] = {0,107,206, 1,"V� Tr�n B� �� Ch�n Quy�n"},
		[6] = {0,107,207, 2,"Thi�n La Li�n Ch�u Ch�n Quy�n"},
		[8] = {0,107,208, 1,"Nh� � Kim ��nh Ch�n Quy�n"},
		[9] = {0,107,209, 1,"B�ch H�i Tuy�t �m Ch�n Quy�n"},
		[11] = {0,107,210, 2,"H�n ��n Tr�n Nh�c Ch�n Quy�n"},
		[12] = {0,107,211, 2,"Qu� Thi�n Du Long Ch�n Quy�n"},
		[14] = {0,107,212, 1,"Huy�n �nh M� T�ng Ch�n Quy�n"},
		[15] = {0,107,213, 2,"Qu�n T� ��i Phong Ch�n Quy�n"},
		[17] = {0,107,214, 2,"Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"},
		[18] = {0,107,215, 2,"Xuy�n V�n L�c H�ng Ch�n Quy�n"},
		[20] = {0,107,216, 2,"Huy�n Minh Phong Ma Ch�n Quy�n"},
		[21] = {0,107,217, 1,"Linh C� Huy�n T� Ch�n Quy�n"},
		[23] = {0,107,218,1,"C�u Thi�n Phong L�i Ch�n Quy�n"},
		[25] = {0,107,219,2,"H�i Phong Tr�m Nh�t Ch�n Quy�n"},
		[26] = {0,107,220,2,"Ph� K� H�nh Tr�n Ch�n Quy�n"},
		[27] = {0,107,221,1,"Ng�ng Huy�t Phong H�n Ch�n Quy�n"},
		[29] = {0,107,222,2,"H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[30] = {0,107,223,2,"Phong Hoa Thi�n Di�p Ch�n Quy�n"},
		[31] = {0,107,231,2,"H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[32] = {0,107,235,2,"Phong Hoa Thi�n Di�p Ch�n Quy�n"},
	}
	local tbRate = {
		[1] = {[1] = 2, nRate = 5.88},
		[2] = {[1] = 4, nRate = 5.88},
		[3] = {[1] = 3, nRate = 5.88},
		[4] = {[1] = 6, nRate = 5.88},
		[5] = {[1] = 8, nRate = 5.88},
		[6] = {[1] = 9, nRate = 5.88},
		[7] = {[1] = 11, nRate = 5.88},
		[8] = {[1] = 12, nRate = 5.88},
		[9] = {[1] = 14, nRate = 5.88},
		[10] = {[1] = 15, nRate = 5.88},
		[11] = {[1] = 17, nRate = 5.88},
		[12] = {[1] = 18, nRate = 5.88},
		[13] = {[1] = 20, nRate = 5.88},
		[14] = {[1] = 21, nRate = 5.88},
		[15] = {[1] = 23, nRate = 5.88},
		[16] = {[1] = 29, nRate = 5.88},
		[17] = {[1] = 30, nRate = 5.92},
	}
	for i=1, nQty do
		if nRoute == nil then
			nIndex = LIB_Award:GetValueByRate(tbRate)
		else
			nIndex = nRoute
		end
--		local _, nItemID = AddItem(tbMatTich[nIndex][1], tbMatTich[nIndex][2], tbMatTich[nIndex][3], 1)
		gf_AddItemEx2({tbMatTich[nIndex][1], tbMatTich[nIndex][2], tbMatTich[nIndex][3], 1},"m�t t�ch","DUA TOP","nh�n m�t t�ch")
	end
end


function TraoTrangBiKimXaNguyenSoai()
	local nBody = GetBody()
	local nPhe = 1
	if GetTask(701) < 0 then
		nPhe = 2
	end
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][1][nBody])
	LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][2][nBody])
	LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][3][nBody])
end

function TraoTrangBiKimXaTuongQuan()
	local nBody = GetBody()
	local nPhe = 1
	if GetTask(701) < 0 then
		nPhe = 2
	end
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbTrangBiKimXa_TuongQuan[nPhe][1][nBody])
	LIB_Award:Award(tbTrangBiKimXa_TuongQuan[nPhe][2][nBody])
	LIB_Award:Award(tbTrangBiKimXa_TuongQuan[nPhe][3][nBody])
end

function TraoTrangBiChienCuong()
	local nBody = GetBody()

	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:AwardByRoute(tbTrangBiChienCuong[103][nBody])
	LIB_Award:AwardByRoute(tbTrangBiChienCuong[100][nBody])
	LIB_Award:AwardByRoute(tbTrangBiChienCuong[101][nBody])
	LIB_Award:AwardByRoute(tbVuKhiChienCuong[nBody])
end


function TraoLoiHoNguyenSoai(nItemLevel)
	local tbTongLHNS_Body1 = {
			item = {
				{gdp = {0,103,30219,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30219,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30219,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30169,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30173,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30177,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30181,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongLHNS_Body2 = {
			item = {
				{gdp = {0,103,30220,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30220,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30220,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30170,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30174,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30178,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30182,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongLHNS_Body3 = {
			item = {
				{gdp = {0,103,30221,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30221,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30221,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30171,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30175,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30179,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30183,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongLHNS_Body4 = {
			item = {
				{gdp = {0,103,30222,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30222,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30222,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30172,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30176,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30180,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30184,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
			
	local tbLieuLHNS_Body1 = {
			item = {
				{gdp = {0,103,30231,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30231,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30231,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30205,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30209,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30213,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30217,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbLieuLHNS_Body2 = {
			item = {
				{gdp = {0,103,30232,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30232,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30232,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30206,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30210,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30214,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30218,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbLieuLHNS_Body3 = {
			item = {
				{gdp = {0,103,30233,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30233,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30233,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30207,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30211,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30215,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30219,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbLieuLHNS_Body4 = {
			item = {
				{gdp = {0,103,30234,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30234,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30234,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30208,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30212,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30216,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30220,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongAwardSet = {
		[1] = tbTongLHNS_Body1,
		[2] = tbTongLHNS_Body2,
		[3] = tbTongLHNS_Body3,
		[4] = tbTongLHNS_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuLHNS_Body1,
		[2] = tbLieuLHNS_Body2,
		[3] = tbLieuLHNS_Body3,
		[4] = tbLieuLHNS_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoLoiHoTuongQuan(nItemLevel)
	local tbTongLHTQ_Body1 = {
			item = {
				{gdp = {0,103,30215,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30215,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30215,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30157,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30161,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30165,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongLHTQ_Body2 = {
			item = {
				{gdp = {0,103,30216,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30216,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30216,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30158,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30162,1,4,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30166,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				
			}}
	local tbTongLHTQ_Body3 = {
			item = {
				{gdp = {0,103,30217,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30217,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30217,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30159,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30163,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30167,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
		
			}}
	local tbTongLHTQ_Body4 = {
			item = {
				{gdp = {0,103,30218,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30218,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30218,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30160,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30164,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30168,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
		
			}}
			
	local tbLieuLHTQ_Body1 = {
			item = {
				{gdp = {0,103,30227,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30227,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30227,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30193,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30197,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30201,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
	
			}}
	local tbLieuLHTQ_Body2 = {
			item = {
				{gdp = {0,103,30228,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30228,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30228,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30194,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30198,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30202,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
	
			}}
	local tbLieuLHTQ_Body3 = {
			item = {
				{gdp = {0,103,30229,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30229,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30229,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30195,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30199,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30203,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
		
			}}
	local tbLieuLHTQ_Body4 = {
			item = {
				{gdp = {0,103,30230,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30230,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30230,1,4,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30196,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30200,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30204,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
			
			}}
	local tbTongAwardSet = {
		[1] = tbTongLHTQ_Body1,
		[2] = tbTongLHTQ_Body2,
		[3] = tbTongLHTQ_Body3,
		[4] = tbTongLHTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuLHTQ_Body1,
		[2] = tbLieuLHTQ_Body2,
		[3] = tbLieuLHTQ_Body3,
		[4] = tbLieuLHTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end

function AddTrangBiHoaPhungTuongQuan(nLevel,bIsHaveWeapon)

local VET_HOAPHUNG_CLOTH = {
	[2] = {
	    [1] = {{0, 100, 30311, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30439, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
		[2] = {{0, 100, 30312, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30440, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
	},
	[3] = {
		[1] = {{0, 100, 30313, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30441, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
		[2] = {{0, 100, 30314, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30442, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
	},
	[4] = {
		[1] = {{0, 100, 30315, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30443, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 100, 30316, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30444, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
	[6] = {
		[1] = {{0, 100, 30317, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30445, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[2] = {{0, 100, 30318, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30446, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[3] = {{0, 100, 30319, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30447, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[4] = {{0, 100, 30320, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30448, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
	},
	[8] = {
		[3] = {{0, 100, 30321, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30449, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
		[4] = {{0, 100, 30322, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30450, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
	},
	[9] = {
		[3] = {{0, 100, 30323, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30451, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
		[4] = {{0, 100, 30324, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30452, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
	},
	[11] = {
		[1] = {{0, 100, 30325, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30453, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[2] = {{0, 100, 30326, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30454, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[3] = {{0, 100, 30327, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30455, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[4] = {{0, 100, 30328, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30456, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
	},
	[12] = {
		[1] = {{0, 100, 30329, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30457, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[2] = {{0, 100, 30330, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30458, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[3] = {{0, 100, 30331, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30459, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[4] = {{0, 100, 30332, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30460, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
	},
	[14] = {
		[1] = {{0, 100, 30333, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30461, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[2] = {{0, 100, 30334, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30462, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[3] = {{0, 100, 30335, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30463, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[4] = {{0, 100, 30336, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30464, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
	},
	[15] = {
		[1] = {{0, 100, 30337, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30465, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[2] = {{0, 100, 30338, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30466, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[3] = {{0, 100, 30339, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30467, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[4] = {{0, 100, 30340, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30468, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
	},
	[17] = {
		[1] = {{0, 100, 30341, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30469, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[2] = {{0, 100, 30342, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30470, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[3] = {{0, 100, 30343, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30471, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[4] = {{0, 100, 30344, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30472, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
	},
	[18] = {
		[1] = {{0, 100, 30345, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30473, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[2] = {{0, 100, 30346, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30474, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[3] = {{0, 100, 30347, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30475, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[4] = {{0, 100, 30348, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30476, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
	},
	[20] = {
		[1] = {{0, 100, 30349, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30477, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[2] = {{0, 100, 30350, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30478, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[3] = {{0, 100, 30351, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30479, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[4] = {{0, 100, 30352, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30480, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
	},
	[21] = {
		[1] = {{0, 100, 30353, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30481, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[2] = {{0, 100, 30354, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30482, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[3] = {{0, 100, 30355, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30483, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[4] = {{0, 100, 30356, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30484, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
	},
	[23] = {
		[1] = {{0, 100, 30357, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30485, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
		[2] = {{0, 100, 30358, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30486, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
	},
	[25] = {
		[1] = {{0, 100, 30359, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30487, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[2] = {{0, 100, 30360, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30488, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[3] = {{0, 100, 30361, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30489, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[4] = {{0, 100, 30362, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30490, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
	},
	[26] = {
		[1] = {{0, 100, 30363, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30491, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[2] = {{0, 100, 30364, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30492, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[3] = {{0, 100, 30365, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30493, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[4] = {{0, 100, 30366, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30494, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
	},
	[27] = {
		[1] = {{0, 100, 30367, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30495, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 100, 30368, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30496, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 100, 30369, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30497, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 100, 30370, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30498, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[29] = {
		[3] = {{0, 100, 30371, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30499, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 100, 30372, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30500, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[30] = {
		[3] = {{0, 100, 30373, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30501, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
		[4] = {{0, 100, 30374, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30502, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
	[31] = {
		[1] = {{0, 100, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[2] = {{0, 100, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[3] = {{0, 100, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 100, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[32] = {
		[1] = {{0, 100, 32161, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32163, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
		[2] = {{0, 100, 32161, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32163, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
}

local VET_HOAPHUNG_CAP = {
	[2] = {
	    [1] = {{0, 103, 30311, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30439, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
		[2] = {{0, 103, 30312, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30440, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
	},
	[3] = {
		[1] = {{0, 103, 30313, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30441, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
		[2] = {{0, 103, 30314, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30442, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
	},
	[4] = {
		[1] = {{0, 103, 30315, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30443, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 103, 30316, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30444, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
	[6] = {
		[1] = {{0, 103, 30317, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30445, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[2] = {{0, 103, 30318, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30446, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[3] = {{0, 103, 30319, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30447, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[4] = {{0, 103, 30320, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30448, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
	},
	[8] = {
		[3] = {{0, 103, 30321, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30449, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
		[4] = {{0, 103, 30322, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30450, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
	},
	[9] = {
		[3] = {{0, 103, 30323, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30451, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
		[4] = {{0, 103, 30324, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30452, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
	},
	[11] = {
		[1] = {{0, 103, 30325, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30453, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[2] = {{0, 103, 30326, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30454, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[3] = {{0, 103, 30327, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30455, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[4] = {{0, 103, 30328, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30456, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
	},
	[12] = {
		[1] = {{0, 103, 30329, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30457, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[2] = {{0, 103, 30330, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30458, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[3] = {{0, 103, 30331, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30459, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[4] = {{0, 103, 30332, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30460, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
	},
	[14] = {
		[1] = {{0, 103, 30333, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30461, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[2] = {{0, 103, 30334, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30462, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[3] = {{0, 103, 30335, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30463, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[4] = {{0, 103, 30336, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30464, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
	},
	[15] = {
		[1] = {{0, 103, 30337, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30465, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[2] = {{0, 103, 30338, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30466, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[3] = {{0, 103, 30339, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30467, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[4] = {{0, 103, 30340, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30468, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
	},
	[17] = {
		[1] = {{0, 103, 30341, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30469, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[2] = {{0, 103, 30342, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30470, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[3] = {{0, 103, 30343, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30471, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[4] = {{0, 103, 30344, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30472, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
	},
	[18] = {
		[1] = {{0, 103, 30345, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30473, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[2] = {{0, 103, 30346, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30474, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[3] = {{0, 103, 30347, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30475, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[4] = {{0, 103, 30348, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30476, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
	},
	[20] = {
		[1] = {{0, 103, 30349, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30477, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[2] = {{0, 103, 30350, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30478, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[3] = {{0, 103, 30351, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30479, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[4] = {{0, 103, 30352, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30480, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
	},
	[21] = {
		[1] = {{0, 103, 30353, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30481, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[2] = {{0, 103, 30354, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30482, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[3] = {{0, 103, 30355, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30483, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[4] = {{0, 103, 30356, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30484, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
	},
	[23] = {
		[1] = {{0, 103, 30357, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30485, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
		[2] = {{0, 103, 30358, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30486, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
	},
	[25] = {
		[1] = {{0, 103, 30359, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30487, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[2] = {{0, 103, 30360, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30488, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[3] = {{0, 103, 30361, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30489, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[4] = {{0, 103, 30362, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30490, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
	},
	[26] = {
		[1] = {{0, 103, 30363, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30491, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[2] = {{0, 103, 30364, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30492, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[3] = {{0, 103, 30365, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30493, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[4] = {{0, 103, 30366, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30494, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
	},
	[27] = {
		[1] = {{0, 103, 30367, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30495, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 103, 30368, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30496, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 103, 30369, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30497, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 103, 30370, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30498, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[29] = {
		[3] = {{0, 103, 30371, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30499, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 103, 30372, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30500, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[30] = {
		[3] = {{0, 103, 30373, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30501, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
		[4] = {{0, 103, 30374, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30502, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
	[31] = {
		[1] = {{0, 103, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[2] = {{0, 103, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[3] = {{0, 103, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 103, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[32] = {
		[1] = {{0, 103, 32161, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32163, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
		[2] = {{0, 103, 32161, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32163, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
}  

local VET_HOAPHUNG_SHOE = {
	[2] = {
	    [1] = {{0, 101, 30311, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30439, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
		[2] = {{0, 101, 30312, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30440, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
	},
	[3] = {
		[1] = {{0, 101, 30313, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30441, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
		[2] = {{0, 101, 30314, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30442, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
	},
	[4] = {
		[1] = {{0, 101, 30315, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30443, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 101, 30316, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30444, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
	[6] = {
		[1] = {{0, 101, 30317, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30445, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[2] = {{0, 101, 30318, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30446, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[3] = {{0, 101, 30319, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30447, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[4] = {{0, 101, 30320, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30448, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
	},
	[8] = {
		[3] = {{0, 101, 30321, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30449, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
		[4] = {{0, 101, 30322, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30450, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
	},
	[9] = {
		[3] = {{0, 101, 30323, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30451, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
		[4] = {{0, 101, 30324, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30452, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
	},
	[11] = {
		[1] = {{0, 101, 30325, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30453, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[2] = {{0, 101, 30326, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30454, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[3] = {{0, 101, 30327, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30455, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[4] = {{0, 101, 30328, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30456, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
	},
	[12] = {
		[1] = {{0, 101, 30329, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30457, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[2] = {{0, 101, 30330, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30458, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[3] = {{0, 101, 30331, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30459, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[4] = {{0, 101, 30332, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30460, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
	},
	[14] = {
		[1] = {{0, 101, 30333, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30461, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[2] = {{0, 101, 30334, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30462, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[3] = {{0, 101, 30335, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30463, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[4] = {{0, 101, 30336, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30464, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
	},
	[15] = {
		[1] = {{0, 101, 30337, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30465, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[2] = {{0, 101, 30338, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30466, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[3] = {{0, 101, 30339, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30467, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[4] = {{0, 101, 30340, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30468, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
	},
	[17] = {
		[1] = {{0, 101, 30341, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30469, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[2] = {{0, 101, 30342, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30470, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[3] = {{0, 101, 30343, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30471, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[4] = {{0, 101, 30344, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30472, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
	},
	[18] = {
		[1] = {{0, 101, 30345, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30473, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[2] = {{0, 101, 30346, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30474, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[3] = {{0, 101, 30347, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30475, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[4] = {{0, 101, 30348, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30476, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
	},
	[20] = {
		[1] = {{0, 101, 30349, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30477, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[2] = {{0, 101, 30350, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30478, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[3] = {{0, 101, 30351, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30479, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[4] = {{0, 101, 30352, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30480, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
	},
	[21] = {
		[1] = {{0, 101, 30353, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30481, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[2] = {{0, 101, 30354, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30482, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[3] = {{0, 101, 30355, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30483, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[4] = {{0, 101, 30356, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30484, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
	},
	[23] = {
		[1] = {{0, 101, 30357, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30485, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
		[2] = {{0, 101, 30358, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30486, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
	},
	[25] = {
		[1] = {{0, 101, 30359, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30487, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[2] = {{0, 101, 30360, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30488, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[3] = {{0, 101, 30361, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30489, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[4] = {{0, 101, 30362, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30490, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
	},
	[26] = {
		[1] = {{0, 101, 30363, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30491, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[2] = {{0, 101, 30364, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30492, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[3] = {{0, 101, 30365, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30493, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[4] = {{0, 101, 30366, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30494, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
	},
	[27] = {
		[1] = {{0, 101, 30367, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30495, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 101, 30368, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30496, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 101, 30369, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30497, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 101, 30370, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30498, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[29] = {
		[3] = {{0, 101, 30371, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30499, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 101, 30372, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30500, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[30] = {
		[3] = {{0, 101, 30373, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30501, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
		[4] = {{0, 101, 30374, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30502, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
	[31] = {
		[1] = {{0, 101, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[2] = {{0, 101, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[3] = {{0, 101, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 101, 32153, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32155, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[32] = {
		[1] = {{0, 101, 32161, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32163, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
		[2] = {{0, 101, 32161, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32163, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
}

local VET_HOAPHUNG_WEAPON = {
	[2] = {
	   [1] = {{0, 3, 30328, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30536, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
		[2] = {{0, 3, 30329, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30537, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
	},
	[3] = {
		[1] = {{0, 8, 30330, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 8, 30538, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
		[2] = {{0, 8, 30331, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 8, 30539, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
	},
	[4] = {
		[1] = {{0, 0, 30332, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30540, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 0, 30333, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30541, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
	[6] = {
		[1] = {{0, 1, 30334, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 1, 30542, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[2] = {{0, 1, 30335, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 1, 30543, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[3] = {{0, 1, 30336, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 1, 30544, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[4] = {{0, 1, 30337, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 1, 30545, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
	},
	[8] = {
		[3] = {{0, 2, 30338, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30546, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
		[4] = {{0, 2, 30339, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30547, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
	},
	[9] = {
		[3] = {{0, 10, 30340, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 10, 30548, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
		[4] = {{0, 10, 30341, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 10, 30549, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
	},
	[11] = {
		[1] = {{0, 0, 30342, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30550, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[2] = {{0, 0, 30343, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30551, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[3] = {{0, 0, 30344, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30552, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[4] = {{0, 0, 30345, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30553, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
	},
	[12] = {
		[1] = {{0, 5, 30346, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 5, 30554, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[2] = {{0, 5, 30347, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 5, 30555, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[3] = {{0, 5, 30348, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 5, 30556, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[4] = {{0, 5, 30349, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 5, 30557, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
	},
	[14] = {
		[1] = {{0, 2, 30350, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30558, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[2] = {{0, 2, 30351, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30559, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[3] = {{0, 2, 30352, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30560, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[4] = {{0, 2, 30353, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30561, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
	},
	[15] = {
		[1] = {{0, 9, 30354, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30562, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[2] = {{0, 9, 30355, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30563, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[3] = {{0, 9, 30356, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30564, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[4] = {{0, 9, 30357, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30565, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
	},
	[17] = {
		[1] = {{0, 6, 30358, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 6, 30566, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[2] = {{0, 6, 30359, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 6, 30567, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[3] = {{0, 6, 30360, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 6, 30568, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[4] = {{0, 6, 30361, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 6, 30569, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
	},
	[18] = {
		[1] = {{0, 4, 30362, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 4, 30570, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[2] = {{0, 4, 30363, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 4, 30571, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[3] = {{0, 4, 30364, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 4, 30572, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[4] = {{0, 4, 30365, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 4, 30573, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
	},
	[20] = {
		[1] = {{0, 7, 30366, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 7, 30574, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[2] = {{0, 7, 30367, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 7, 30575, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[3] = {{0, 7, 30368, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 7, 30576, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[4] = {{0, 7, 30369, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 7, 30577, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
	},
	[21] = {
		[1] = {{0, 11, 30370, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30578, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[2] = {{0, 11, 30371, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30579, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[3] = {{0, 11, 30372, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30580, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[4] = {{0, 11, 30373, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30581, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
	},
	[23] = {
		[1] = {{0, 2, 30374, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30582, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
		[2] = {{0, 2, 30375, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30583, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
	},
	[25] = {
		[1] = {{0, 3, 30376, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30584, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[2] = {{0, 3, 30377, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30585, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[3] = {{0, 3, 30378, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30586, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[4] = {{0, 3, 30379, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30587, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
	},
	[26] = {
		[1] = {{0, 9, 30380, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30588, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[2] = {{0, 9, 30381, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30589, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[3] = {{0, 9, 30382, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30590, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[4] = {{0, 9, 30383, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30591, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
	},
	[27] = {
		[1] = {{0, 11, 30384, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30592, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 11, 30385, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30593, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 11, 30386, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30594, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 11, 30387, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30595, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[29] = {
		[3] = {{0, 13, 30388, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 13, 30596, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 13, 30389, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 13, 30597, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[30] = {
		[3] = {{0, 12, 30390, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 12, 30598, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
		[4] = {{0, 12, 30391, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 12, 30599, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
}

local VET_HOAPHUNG_PHU = {
	[2] = {
	    [1] = {{0, 102, 30356, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30804, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
		[2] = {{0, 102, 30357, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30805, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
	},
	[3] = {
		[1] = {{0, 102, 30358, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30806, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
		[2] = {{0, 102, 30359, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30807, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
	},
	[4] = {
		[1] = {{0, 102, 30360, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30808, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 102, 30361, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30809, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
	[6] = {
		[1] = {{0, 102, 30362, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30810, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[2] = {{0, 102, 30363, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30811, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[3] = {{0, 102, 30364, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30812, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[4] = {{0, 102, 30365, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30813, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
	},
	[8] = {
		[3] = {{0, 102, 30366, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30814, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
		[4] = {{0, 102, 30367, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30815, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
	},
	[9] = {
		[3] = {{0, 102, 30368, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30816, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
		[4] = {{0, 102, 30369, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30817, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
	},
	[11] = {
		[1] = {{0, 102, 30370, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30818, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[2] = {{0, 102, 30371, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30819, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[3] = {{0, 102, 30372, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30820, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[4] = {{0, 102, 30373, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30821, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
	},
	[12] = {
		[1] = {{0, 102, 30374, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30822, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[2] = {{0, 102, 30375, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30823, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[3] = {{0, 102, 30376, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30824, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[4] = {{0, 102, 30377, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30825, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
	},
	[14] = {
		[1] = {{0, 102, 30378, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30826, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[2] = {{0, 102, 30379, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30827, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[3] = {{0, 102, 30380, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30828, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[4] = {{0, 102, 30381, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30829, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
	},
	[15] = {
		[1] = {{0, 102, 30382, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30830, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[2] = {{0, 102, 30383, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30831, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[3] = {{0, 102, 30384, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30832, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[4] = {{0, 102, 30385, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30833, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
	},
	[17] = {
		[1] = {{0, 102, 30386, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30834, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[2] = {{0, 102, 30387, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30835, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[3] = {{0, 102, 30388, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30836, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[4] = {{0, 102, 30389, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30837, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
	},
	[18] = {
		[1] = {{0, 102, 30390, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30838, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[2] = {{0, 102, 30391, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30839, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[3] = {{0, 102, 30392, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30840, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[4] = {{0, 102, 30393, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30841, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
	},
	[20] = {
		[1] = {{0, 102, 30394, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30842, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[2] = {{0, 102, 30395, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30843, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[3] = {{0, 102, 30396, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30844, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[4] = {{0, 102, 30397, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30845, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
	},
	[21] = {
		[1] = {{0, 102, 30398, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30846, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[2] = {{0, 102, 30399, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30847, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[3] = {{0, 102, 30400, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30848, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[4] = {{0, 102, 30401, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30849, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
	},
	[23] = {
		[1] = {{0, 102, 30402, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30850, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
		[2] = {{0, 102, 30403, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30851, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
	},
	[25] = {
		[1] = {{0, 102, 30404, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30852, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[2] = {{0, 102, 30405, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30853, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[3] = {{0, 102, 30406, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30854, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[4] = {{0, 102, 30407, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30855, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
	},
	[26] = {
		[1] = {{0, 102, 30408, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30856, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[2] = {{0, 102, 30409, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30857, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[3] = {{0, 102, 30410, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30858, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[4] = {{0, 102, 30411, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30859, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
	},
	[27] = {
		[1] = {{0, 102, 30412, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30860, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 102, 30413, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30861, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 102, 30414, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30862, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 102, 30415, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30863, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[29] = {
		[3] = {{0, 102, 30416, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30864, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 102, 30417, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30865, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[30] = {
		[3] = {{0, 102, 30418, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30866, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T�"},
		[4] = {{0, 102, 30419, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30867, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
	[31] = {
		[1] = {{0, 102, 31488, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31502, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 102, 31488, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31502, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 102, 31488, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31502, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 102, 31488, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31502, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[32] = {
		[1] = {{0, 102, 31516, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31530, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[2] = {{0, 102, 31516, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31530, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
}

local VET_HOAPHUNG_KY = {
	[2] = {
	    [1] = {{0, 102, 30292, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30740, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
		[2] = {{0, 102, 30293, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30741, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
	},
	[3] = {
		[1] = {{0, 102, 30294, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30742, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
		[2] = {{0, 102, 30295, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30743, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
	},
	[4] = {
		[1] = {{0, 102, 30296, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30744, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 102, 30297, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30745, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
	[6] = {
		[1] = {{0, 102, 30298, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30746, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[2] = {{0, 102, 30299, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30747, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[3] = {{0, 102, 30300, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30748, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[4] = {{0, 102, 30301, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30749, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
	},
	[8] = {
		[3] = {{0, 102, 30302, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30750, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
		[4] = {{0, 102, 30303, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30751, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
	},
	[9] = {
		[3] = {{0, 102, 30304, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30752, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
		[4] = {{0, 102, 30305, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30753, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
	},
	[11] = {
		[1] = {{0, 102, 30306, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30754, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[2] = {{0, 102, 30307, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30755, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[3] = {{0, 102, 30308, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30756, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[4] = {{0, 102, 30309, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30757, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
	},
	[12] = {
		[1] = {{0, 102, 30310, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30758, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[2] = {{0, 102, 30311, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30759, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[3] = {{0, 102, 30312, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30760, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[4] = {{0, 102, 30313, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30761, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
	},
	[14] = {
		[1] = {{0, 102, 30314, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30762, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[2] = {{0, 102, 30315, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30763, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[3] = {{0, 102, 30316, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30764, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[4] = {{0, 102, 30317, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30765, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
	},
	[15] = {
		[1] = {{0, 102, 30318, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30766, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[2] = {{0, 102, 30319, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30767, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[3] = {{0, 102, 30320, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30768, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[4] = {{0, 102, 30321, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30769, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
	},
	[17] = {
		[1] = {{0, 102, 30322, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30770, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[2] = {{0, 102, 30323, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30771, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[3] = {{0, 102, 30324, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30772, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[4] = {{0, 102, 30325, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30773, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
	},
	[18] = {
		[1] = {{0, 102, 30326, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30774, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[2] = {{0, 102, 30327, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30775, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[3] = {{0, 102, 30328, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30776, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[4] = {{0, 102, 30329, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30777, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
	},
	[20] = {
		[1] = {{0, 102, 30330, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30778, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[2] = {{0, 102, 30331, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30779, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[3] = {{0, 102, 30332, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30780, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[4] = {{0, 102, 30333, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30781, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
	},
	[21] = {
		[1] = {{0, 102, 30334, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30782, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[2] = {{0, 102, 30335, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30783, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[3] = {{0, 102, 30336, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30784, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[4] = {{0, 102, 30337, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30785, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
	},
	[23] = {
		[1] = {{0, 102, 30338, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30786, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
		[2] = {{0, 102, 30339, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30787, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
	},
	[25] = {
		[1] = {{0, 102, 30340, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30788, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[2] = {{0, 102, 30341, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30789, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[3] = {{0, 102, 30342, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30790, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[4] = {{0, 102, 30343, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30791, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
	},
	[26] = {
		[1] = {{0, 102, 30344, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30792, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[2] = {{0, 102, 30345, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30793, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[3] = {{0, 102, 30346, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30794, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[4] = {{0, 102, 30347, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30795, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
	},
	[27] = {
		[1] = {{0, 102, 30348, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30796, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 102, 30349, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30797, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 102, 30350, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30798, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 102, 30351, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30799, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[29] = {
		[3] = {{0, 102, 30352, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30800, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 102, 30353, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30801, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[30] = {
		[3] = {{0, 102, 30354, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30802, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T�"},
		[4] = {{0, 102, 30355, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30803, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
	[31] = {
		[1] = {{0, 102, 31487, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31501, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 102, 31487, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31501, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 102, 31487, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31501, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 102, 31487, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31501, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[32] = {
		[1] = {{0, 102, 31515, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31529, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[2] = {{0, 102, 31515, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31529, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
}

local VET_HOAPHUNG_BAI = {
	[2] = {
	    [1] = {{0, 102, 30228, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30676, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
		[2] = {{0, 102, 30229, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30677, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
	},
	[3] = {
		[1] = {{0, 102, 30230, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30678, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
		[2] = {{0, 102, 30231, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30679, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
	},
	[4] = {
		[1] = {{0, 102, 30232, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30680, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 102, 30233, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30681, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
	[6] = {
		[1] = {{0, 102, 30234, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30682, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[2] = {{0, 102, 30235, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30683, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[3] = {{0, 102, 30236, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30684, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[4] = {{0, 102, 30237, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30685, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
	},
	[8] = {
		[3] = {{0, 102, 30238, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30686, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
		[4] = {{0, 102, 30239, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30687, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
	},
	[9] = {
		[3] = {{0, 102, 30240, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30688, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
		[4] = {{0, 102, 30241, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30689, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
	},
	[11] = {
		[1] = {{0, 102, 30242, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30690, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[2] = {{0, 102, 30243, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30691, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[3] = {{0, 102, 30244, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30692, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[4] = {{0, 102, 30245, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30693, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
	},
	[12] = {
		[1] = {{0, 102, 30246, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30694, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[2] = {{0, 102, 30247, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30695, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[3] = {{0, 102, 30248, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30696, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[4] = {{0, 102, 30249, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30697, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
	},
	[14] = {
		[1] = {{0, 102, 30250, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30698, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[2] = {{0, 102, 30251, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30699, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[3] = {{0, 102, 30252, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30700, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[4] = {{0, 102, 30253, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30701, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
	},
	[15] = {
		[1] = {{0, 102, 30254, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30702, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[2] = {{0, 102, 30255, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30703, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[3] = {{0, 102, 30256, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30704, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[4] = {{0, 102, 30257, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30705, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
	},
	[17] = {
		[1] = {{0, 102, 30258, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30706, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[2] = {{0, 102, 30259, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30707, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[3] = {{0, 102, 30260, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30708, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[4] = {{0, 102, 30261, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30709, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
	},
	[18] = {
		[1] = {{0, 102, 30262, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30710, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[2] = {{0, 102, 30263, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30711, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[3] = {{0, 102, 30264, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30712, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[4] = {{0, 102, 30265, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30713, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
	},
	[20] = {
		[1] = {{0, 102, 30266, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30714, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[2] = {{0, 102, 30267, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30715, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[3] = {{0, 102, 30268, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30716, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[4] = {{0, 102, 30269, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30717, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
	},
	[21] = {
		[1] = {{0, 102, 30270, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30718, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[2] = {{0, 102, 30271, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30719, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[3] = {{0, 102, 30272, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30720, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[4] = {{0, 102, 30273, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30721, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
	},
	[23] = {
		[1] = {{0, 102, 30274, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30722, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
		[2] = {{0, 102, 30275, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30723, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
	},
	[25] = {
		[1] = {{0, 102, 30276, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30724, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[2] = {{0, 102, 30277, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30725, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[3] = {{0, 102, 30278, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30726, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[4] = {{0, 102, 30279, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30727, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
	},
	[26] = {
		[1] = {{0, 102, 30280, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30728, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[2] = {{0, 102, 30281, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30729, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[3] = {{0, 102, 30282, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30730, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[4] = {{0, 102, 30283, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30731, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
	},
	[27] = {
		[1] = {{0, 102, 30284, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30732, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 102, 30285, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30733, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 102, 30286, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30734, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 102, 30287, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30735, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[29] = {
		[3] = {{0, 102, 30288, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30736, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 102, 30289, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30737, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[30] = {
		[3] = {{0, 102, 30290, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30738, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T�"},
		[4] = {{0, 102, 30291, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30739, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
	[31] = {
		[1] = {{0, 102, 31486, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31500, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 102, 31486, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31500, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 102, 31486, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31500, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 102, 31486, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31500, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[32] = {
		[1] = {{0, 102, 31514, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31528, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[2] = {{0, 102, 31514, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31528, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
}

	local nRoute = GetPlayerRoute();
	local nBody = GetBody();

	local nQuanHam = GetTask(704)

	if nQuanHam < 0 then

		gf_AddItemEx2(VET_HOAPHUNG_CLOTH[nRoute][nBody][2], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_CAP[nRoute][nBody][2], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_SHOE[nRoute][nBody][2], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_PHU[nRoute][nBody][2], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_KY[nRoute][nBody][2], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_BAI[nRoute][nBody][2], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		--trang b� Li�u 
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_HOAPHUNG_WEAPON[nRoute][nBody][2], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
--		end
	else

		gf_AddItemEx2(VET_HOAPHUNG_CLOTH[nRoute][nBody][1], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_CAP[nRoute][nBody][1], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_SHOE[nRoute][nBody][1], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_PHU[nRoute][nBody][1], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_KY[nRoute][nBody][1], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_BAI[nRoute][nBody][1], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		--trang b� T�ng
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_HOAPHUNG_WEAPON[nRoute][nBody][1], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
--		end
	end
end

function AddTrangBiHoaPhungNguyenSoai(nLevel,bIsHaveWeapon)
local VET_HOAPHUNG_CAP = {
	[2] = {
	    [1] = {{0, 103, 30375, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30503, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
		[2] = {{0, 103, 30376, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30504, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
	},
	[3] = {
		[1] = {{0, 103, 30377, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30505, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
		[2] = {{0, 103, 30378, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30506, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
	},
	[4] = {
		[1] = {{0, 103, 30379, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30507, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 103, 30380, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30508, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
	[6] = {
		[1] = {{0, 103, 30381, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30509, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[2] = {{0, 103, 30382, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30510, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[3] = {{0, 103, 30383, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30511, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[4] = {{0, 103, 30384, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30512, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
	},
	[8] = {
		[3] = {{0, 103, 30385, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30513, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
		[4] = {{0, 103, 30386, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30514, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
	},
	[9] = {
		[3] = {{0, 103, 30387, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30515, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
		[4] = {{0, 103, 30388, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30516, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
	},
	[11] = {
		[1] = {{0, 103, 30389, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30517, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[2] = {{0, 103, 30390, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30518, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[3] = {{0, 103, 30391, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30519, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[4] = {{0, 103, 30392, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30520, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
	},
	[12] = {
		[1] = {{0, 103, 30393, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30521, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[2] = {{0, 103, 30394, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30522, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[3] = {{0, 103, 30395, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30523, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[4] = {{0, 103, 30396, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30524, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
	},
	[14] = {
		[1] = {{0, 103, 30397, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30525, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[2] = {{0, 103, 30398, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30526, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[3] = {{0, 103, 30399, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30527, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[4] = {{0, 103, 30400, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30528, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
	},
	[15] = {
		[1] = {{0, 103, 30401, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30529, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[2] = {{0, 103, 30402, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30530, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[3] = {{0, 103, 30403, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30531, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[4] = {{0, 103, 30404, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30532, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
	},
	[17] = {
		[1] = {{0, 103, 30405, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30533, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[2] = {{0, 103, 30406, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30534, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[3] = {{0, 103, 30407, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30535, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[4] = {{0, 103, 30408, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30536, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
	},
	[18] = {
		[1] = {{0, 103, 30409, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30537, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[2] = {{0, 103, 30410, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30538, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[3] = {{0, 103, 30411, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30539, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[4] = {{0, 103, 30412, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30540, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
	},
	[20] = {
		[1] = {{0, 103, 30413, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30541, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[2] = {{0, 103, 30414, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30542, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[3] = {{0, 103, 30415, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30543, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[4] = {{0, 103, 30416, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30544, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
	},
	[21] = {
		[1] = {{0, 103, 30417, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30545, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[2] = {{0, 103, 30418, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30546, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[3] = {{0, 103, 30419, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30547, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[4] = {{0, 103, 30420, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30548, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
	},
	[23] = {
		[1] = {{0, 103, 30421, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30549, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
		[2] = {{0, 103, 30422, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30550, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
	},
	[25] = {
		[1] = {{0, 103, 30423, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30551, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[2] = {{0, 103, 30424, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30552, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[3] = {{0, 103, 30425, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30553, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[4] = {{0, 103, 30426, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30554, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
	},
	[26] = {
		[1] = {{0, 103, 30427, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30555, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[2] = {{0, 103, 30428, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30556, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[3] = {{0, 103, 30429, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30557, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[4] = {{0, 103, 30430, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30558, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
	},
	[27] = {
		[1] = {{0, 103, 30431, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30559, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 103, 30432, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30560, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 103, 30433, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30561, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 103, 30434, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30562, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[29] = {
		[3] = {{0, 103, 30435, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30563, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 103, 30436, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30564, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[30] = {
		[3] = {{0, 103, 30437, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30565, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
		[4] = {{0, 103, 30438, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30566, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
	[31] = {
		[1] = {{0, 103, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 103, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 103, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 103, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[32] = {
		[1] = {{0, 103, 32162, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32164, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[2] = {{0, 103, 32162, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32164, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
}

local VET_HOAPHUNG_CLOTH = {
	[2] = {
	   [1] = {{0, 100, 30375, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30503, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
		[2] = {{0, 100, 30376, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30504, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
	},
	[3] = {
		[1] = {{0, 100, 30377, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30505, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
		[2] = {{0, 100, 30378, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30506, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
	},
	[4] = {
		[1] = {{0, 100, 30379, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30507, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 100, 30380, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30508, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
	[6] = {
		[1] = {{0, 100, 30381, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30509, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[2] = {{0, 100, 30382, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30510, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[3] = {{0, 100, 30383, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30511, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[4] = {{0, 100, 30384, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30512, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
	},
	[8] = {
		[3] = {{0, 100, 30385, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30513, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
		[4] = {{0, 100, 30386, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30514, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
	},
	[9] = {
		[3] = {{0, 100, 30387, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30515, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
		[4] = {{0, 100, 30388, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30516, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
	},
	[11] = {
		[1] = {{0, 100, 30389, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30517, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[2] = {{0, 100, 30390, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30518, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[3] = {{0, 100, 30391, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30519, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[4] = {{0, 100, 30392, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30520, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
	},
	[12] = {
		[1] = {{0, 100, 30393, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30521, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[2] = {{0, 100, 30394, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30522, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[3] = {{0, 100, 30395, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30523, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[4] = {{0, 100, 30396, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30524, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
	},
	[14] = {
		[1] = {{0, 100, 30397, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30525, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[2] = {{0, 100, 30398, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30526, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[3] = {{0, 100, 30399, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30527, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[4] = {{0, 100, 30400, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30528, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
	},
	[15] = {
		[1] = {{0, 100, 30401, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30529, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[2] = {{0, 100, 30402, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30530, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[3] = {{0, 100, 30403, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30531, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[4] = {{0, 100, 30404, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30532, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
	},
	[17] = {
		[1] = {{0, 100, 30405, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30533, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[2] = {{0, 100, 30406, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30534, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[3] = {{0, 100, 30407, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30535, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[4] = {{0, 100, 30408, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30536, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
	},
	[18] = {
		[1] = {{0, 100, 30409, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30537, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[2] = {{0, 100, 30410, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30538, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[3] = {{0, 100, 30411, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30539, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[4] = {{0, 100, 30412, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30540, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
	},
	[20] = {
		[1] = {{0, 100, 30413, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30541, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[2] = {{0, 100, 30414, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30542, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[3] = {{0, 100, 30415, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30543, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[4] = {{0, 100, 30416, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30544, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
	},
	[21] = {
		[1] = {{0, 100, 30417, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30545, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[2] = {{0, 100, 30418, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30546, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[3] = {{0, 100, 30419, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30547, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[4] = {{0, 100, 30420, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30548, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
	},
	[23] = {
		[1] = {{0, 100, 30421, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30549, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
		[2] = {{0, 100, 30422, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30550, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
	},
	[25] = {
		[1] = {{0, 100, 30423, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30551, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[2] = {{0, 100, 30424, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30552, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[3] = {{0, 100, 30425, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30553, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[4] = {{0, 100, 30426, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30554, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
	},
	[26] = {
		[1] = {{0, 100, 30427, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30555, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[2] = {{0, 100, 30428, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30556, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[3] = {{0, 100, 30429, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30557, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[4] = {{0, 100, 30430, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30558, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
	},
	[27] = {
		[1] = {{0, 100, 30431, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30559, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 100, 30432, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30560, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 100, 30433, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30561, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 100, 30434, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30562, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[29] = {
		[3] = {{0, 100, 30435, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30563, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 100, 30436, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30564, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[30] = {
		[3] = {{0, 100, 30437, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30565, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
		[4] = {{0, 100, 30438, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30566, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
	[31] = {
		[1] = {{0, 100, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 100, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 100, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 100, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[32] = {
		[1] = {{0, 100, 32162, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32164, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[2] = {{0, 100, 32162, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32164, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
}

local VET_HOAPHUNG_SHOE = {
	[2] = {
	   [1] = {{0, 101, 30375, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30503, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
		[2] = {{0, 101, 30376, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30504, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
	},
	[3] = {
		[1] = {{0, 101, 30377, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30505, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
		[2] = {{0, 101, 30378, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30506, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
	},
	[4] = {
		[1] = {{0, 101, 30379, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30507, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 101, 30380, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30508, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
	[6] = {
		[1] = {{0, 101, 30381, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30509, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[2] = {{0, 101, 30382, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30510, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[3] = {{0, 101, 30383, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30511, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[4] = {{0, 101, 30384, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30512, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
	},
	[8] = {
		[3] = {{0, 101, 30385, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30513, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
		[4] = {{0, 101, 30386, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30514, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
	},
	[9] = {
		[3] = {{0, 101, 30387, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30515, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
		[4] = {{0, 101, 30388, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30516, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
	},
	[11] = {
		[1] = {{0, 101, 30389, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30517, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[2] = {{0, 101, 30390, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30518, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[3] = {{0, 101, 30391, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30519, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[4] = {{0, 101, 30392, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30520, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
	},
	[12] = {
		[1] = {{0, 101, 30393, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30521, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[2] = {{0, 101, 30394, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30522, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[3] = {{0, 101, 30395, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30523, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[4] = {{0, 101, 30396, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30524, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
	},
	[14] = {
		[1] = {{0, 101, 30397, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30525, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[2] = {{0, 101, 30398, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30526, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[3] = {{0, 101, 30399, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30527, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[4] = {{0, 101, 30400, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30528, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
	},
	[15] = {
		[1] = {{0, 101, 30401, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30529, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[2] = {{0, 101, 30402, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30530, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[3] = {{0, 101, 30403, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30531, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[4] = {{0, 101, 30404, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30532, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
	},
	[17] = {
		[1] = {{0, 101, 30405, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30533, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[2] = {{0, 101, 30406, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30534, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[3] = {{0, 101, 30407, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30535, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[4] = {{0, 101, 30408, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30536, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
	},
	[18] = {
		[1] = {{0, 101, 30409, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30537, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[2] = {{0, 101, 30410, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30538, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[3] = {{0, 101, 30411, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30539, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[4] = {{0, 101, 30412, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30540, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
	},
	[20] = {
		[1] = {{0, 101, 30413, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30541, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[2] = {{0, 101, 30414, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30542, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[3] = {{0, 101, 30415, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30543, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[4] = {{0, 101, 30416, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30544, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
	},
	[21] = {
		[1] = {{0, 101, 30417, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30545, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[2] = {{0, 101, 30418, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30546, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[3] = {{0, 101, 30419, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30547, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[4] = {{0, 101, 30420, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30548, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
	},
	[23] = {
		[1] = {{0, 101, 30421, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30549, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
		[2] = {{0, 101, 30422, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30550, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
	},
	[25] = {
		[1] = {{0, 101, 30423, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30551, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[2] = {{0, 101, 30424, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30552, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[3] = {{0, 101, 30425, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30553, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[4] = {{0, 101, 30426, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30554, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
	},
	[26] = {
		[1] = {{0, 101, 30427, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30555, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[2] = {{0, 101, 30428, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30556, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[3] = {{0, 101, 30429, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30557, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[4] = {{0, 101, 30430, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30558, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
	},
	[27] = {
		[1] = {{0, 101, 30431, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30559, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 101, 30432, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30560, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 101, 30433, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30561, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 101, 30434, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30562, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[29] = {
		[3] = {{0, 101, 30435, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30563, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 101, 30436, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30564, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[30] = {
		[3] = {{0, 101, 30437, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30565, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
		[4] = {{0, 101, 30438, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30566, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
	[31] = {
		[1] = {{0, 101, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 101, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 101, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 101, 32154, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32156, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[32] = {
		[1] = {{0, 101, 32162, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32164, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[2] = {{0, 101, 32162, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32164, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
}

local VET_HOAPHUNG_HIEUPHU = {
	[2] = {
	   [1] = {{0, 102, 30420, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30868, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
		[2] = {{0, 102, 30421, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30869, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
	},
	[3] = {
		[1] = {{0, 102, 30422, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30870, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
		[2] = {{0, 102, 30423, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30871, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
	},
	[4] = {
		[1] = {{0, 102, 30424, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30872, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 102, 30425, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30873, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
	[6] = {
		[1] = {{0, 102, 30426, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30874, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[2] = {{0, 102, 30427, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30875, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[3] = {{0, 102, 30428, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30876, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[4] = {{0, 102, 30429, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30877, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
	},
	[8] = {
		[3] = {{0, 102, 30430, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30878, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
		[4] = {{0, 102, 30431, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30879, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
	},
	[9] = {
		[3] = {{0, 102, 30432, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30880, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
		[4] = {{0, 102, 30433, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30881, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
	},
	[11] = {
		[1] = {{0, 102, 30434, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30882, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[2] = {{0, 102, 30435, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30883, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[3] = {{0, 102, 30436, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30884, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[4] = {{0, 102, 30437, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30885, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
	},
	[12] = {
		[1] = {{0, 102, 30438, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30886, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[2] = {{0, 102, 30439, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30887, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[3] = {{0, 102, 30440, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30888, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[4] = {{0, 102, 30441, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30889, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
	},
	[14] = {
		[1] = {{0, 102, 30442, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30890, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[2] = {{0, 102, 30443, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30891, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[3] = {{0, 102, 30444, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30892, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[4] = {{0, 102, 30445, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30893, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
	},
	[15] = {
		[1] = {{0, 102, 30446, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30894, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[2] = {{0, 102, 30447, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30895, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[3] = {{0, 102, 30448, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30896, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[4] = {{0, 102, 30449, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30897, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
	},
	[17] = {
		[1] = {{0, 102, 30450, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30898, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[2] = {{0, 102, 30451, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30899, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[3] = {{0, 102, 30452, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30900, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[4] = {{0, 102, 30453, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30901, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
	},
	[18] = {
		[1] = {{0, 102, 30454, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30902, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[2] = {{0, 102, 30455, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30903, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[3] = {{0, 102, 30456, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30904, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[4] = {{0, 102, 30457, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30905, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
	},
	[20] = {
		[1] = {{0, 102, 30458, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30906, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[2] = {{0, 102, 30459, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30907, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[3] = {{0, 102, 30460, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30908, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[4] = {{0, 102, 30461, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30909, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
	},
	[21] = {
		[1] = {{0, 102, 30462, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30910, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[2] = {{0, 102, 30463, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30911, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[3] = {{0, 102, 30464, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30912, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[4] = {{0, 102, 30465, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30913, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
	},
	[23] = {
		[1] = {{0, 102, 30466, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30914, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
		[2] = {{0, 102, 30467, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30915, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
	},
	[25] = {
		[1] = {{0, 102, 30468, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30916, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[2] = {{0, 102, 30469, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30917, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[3] = {{0, 102, 30470, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30918, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[4] = {{0, 102, 30471, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30919, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
	},
	[26] = {
		[1] = {{0, 102, 30472, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30920, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[2] = {{0, 102, 30473, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30921, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[3] = {{0, 102, 30474, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30922, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[4] = {{0, 102, 30475, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30923, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
	},
	[27] = {
		[1] = {{0, 102, 30476, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30924, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 102, 30477, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30925, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 102, 30478, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30926, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 102, 30479, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30927, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[29] = {
		[3] = {{0, 102, 30480, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30928, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 102, 30481, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30929, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[30] = {
		[3] = {{0, 102, 30482, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30930, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T�"},
		[4] = {{0, 102, 30483, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30931, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
	[31] = {
		[1] = {{0, 102, 31489, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31503, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 102, 31489, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31503, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 102, 31489, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31503, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 102, 31489, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31503, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[32] = {
		[1] = {{0, 102, 31517, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31531, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[2] = {{0, 102, 31517, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31531, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
}

local VET_HOAPHUNG_LENHKY = {
	[2] = {
	   [1] = {{0, 102, 30548, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30996, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
		[2] = {{0, 102, 30549, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30997, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
	},
	[3] = {
		[1] = {{0, 102, 30550, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30998, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
		[2] = {{0, 102, 30551, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30999, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
	},
	[4] = {
		[1] = {{0, 102, 30552, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31000, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 102, 30553, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31001, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
	[6] = {
		[1] = {{0, 102, 30554, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31002, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[2] = {{0, 102, 30555, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31003, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[3] = {{0, 102, 30556, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31004, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[4] = {{0, 102, 30557, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31005, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
	},
	[8] = {
		[3] = {{0, 102, 30558, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31006, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
		[4] = {{0, 102, 30559, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31007, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
	},
	[9] = {
		[3] = {{0, 102, 30560, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31008, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
		[4] = {{0, 102, 30561, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31009, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
	},
	[11] = {
		[1] = {{0, 102, 30562, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31010, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[2] = {{0, 102, 30563, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31011, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[3] = {{0, 102, 30564, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31012, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[4] = {{0, 102, 30565, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31013, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
	},
	[12] = {
		[1] = {{0, 102, 30566, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31014, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[2] = {{0, 102, 30567, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31015, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[3] = {{0, 102, 30568, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31016, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[4] = {{0, 102, 30569, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31017, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
	},
	[14] = {
		[1] = {{0, 102, 30570, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31018, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[2] = {{0, 102, 30571, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31019, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[3] = {{0, 102, 30572, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31020, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[4] = {{0, 102, 30573, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31021, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
	},
	[15] = {
		[1] = {{0, 102, 30574, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31022, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[2] = {{0, 102, 30575, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31023, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[3] = {{0, 102, 30576, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31024, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[4] = {{0, 102, 30577, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31025, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
	},
	[17] = {
		[1] = {{0, 102, 30578, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31026, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[2] = {{0, 102, 30579, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31027, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[3] = {{0, 102, 30580, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31028, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[4] = {{0, 102, 30581, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31029, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
	},
	[18] = {
		[1] = {{0, 102, 30582, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31030, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[2] = {{0, 102, 30583, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31031, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[3] = {{0, 102, 30584, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31032, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[4] = {{0, 102, 30585, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31033, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
	},
	[20] = {
		[1] = {{0, 102, 30586, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31034, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[2] = {{0, 102, 30587, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31035, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[3] = {{0, 102, 30588, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31036, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[4] = {{0, 102, 30589, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31037, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
	},
	[21] = {
		[1] = {{0, 102, 30590, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31038, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[2] = {{0, 102, 30591, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31039, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[3] = {{0, 102, 30592, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31040, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[4] = {{0, 102, 30593, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31041, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
	},
	[23] = {
		[1] = {{0, 102, 30594, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31042, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
		[2] = {{0, 102, 30595, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31043, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
	},
	[25] = {
		[1] = {{0, 102, 30596, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31044, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[2] = {{0, 102, 30597, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31045, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[3] = {{0, 102, 30598, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31046, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[4] = {{0, 102, 30599, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31047, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
	},
	[26] = {
		[1] = {{0, 102, 30600, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31048, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[2] = {{0, 102, 30601, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31049, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[3] = {{0, 102, 30602, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31050, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[4] = {{0, 102, 30603, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31051, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
	},
	[27] = {
		[1] = {{0, 102, 30604, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31052, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 102, 30605, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31053, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 102, 30606, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31054, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 102, 30607, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31055, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[29] = {
		[3] = {{0, 102, 30608, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31056, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 102, 30609, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31057, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[30] = {
		[3] = {{0, 102, 30610, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31058, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T�"},
		[4] = {{0, 102, 30611, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31059, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
	[31] = {
		[1] = {{0, 102, 31491, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31505, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 102, 31491, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31505, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 102, 31491, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31505, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 102, 31491, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31505, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[32] = {
		[1] = {{0, 102, 31519, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31533, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[2] = {{0, 102, 31519, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31533, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
}

local VET_HOAPHUNG_HIEUKY = {
	[2] = {
	   [1] = {{0, 102, 30612, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31060, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
		[2] = {{0, 102, 30613, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31061, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
	},
	[3] = {
		[1] = {{0, 102, 30614, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31062, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
		[2] = {{0, 102, 30615, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31063, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
	},
	[4] = {
		[1] = {{0, 102, 30616, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31064, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 102, 30617, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31065, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
	[6] = {
		[1] = {{0, 102, 30618, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31066, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[2] = {{0, 102, 30619, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31067, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[3] = {{0, 102, 30620, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31068, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[4] = {{0, 102, 30621, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31069, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
	},
	[8] = {
		[3] = {{0, 102, 30622, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31070, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
		[4] = {{0, 102, 30623, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31071, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
	},
	[9] = {
		[3] = {{0, 102, 30624, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31072, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
		[4] = {{0, 102, 30625, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31073, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
	},
	[11] = {
		[1] = {{0, 102, 30626, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31074, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[2] = {{0, 102, 30627, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31075, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[3] = {{0, 102, 30628, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31076, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[4] = {{0, 102, 30629, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31077, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
	},
	[12] = {
		[1] = {{0, 102, 30630, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31078, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[2] = {{0, 102, 30631, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31079, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[3] = {{0, 102, 30632, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31080, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[4] = {{0, 102, 30633, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31081, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
	},
	[14] = {
		[1] = {{0, 102, 30634, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31082, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[2] = {{0, 102, 30635, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31083, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[3] = {{0, 102, 30636, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31084, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[4] = {{0, 102, 30637, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31085, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
	},
	[15] = {
		[1] = {{0, 102, 30638, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31086, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[2] = {{0, 102, 30639, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31087, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[3] = {{0, 102, 30640, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31088, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[4] = {{0, 102, 30641, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31089, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
	},
	[17] = {
		[1] = {{0, 102, 30642, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31090, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[2] = {{0, 102, 30643, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31091, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[3] = {{0, 102, 30644, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31092, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[4] = {{0, 102, 30645, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31093, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
	},
	[18] = {
		[1] = {{0, 102, 30646, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31094, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[2] = {{0, 102, 30647, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31095, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[3] = {{0, 102, 30648, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31096, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[4] = {{0, 102, 30649, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31097, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
	},
	[20] = {
		[1] = {{0, 102, 30650, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31098, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[2] = {{0, 102, 30651, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31099, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[3] = {{0, 102, 30652, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31100, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[4] = {{0, 102, 30653, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31101, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
	},
	[21] = {
		[1] = {{0, 102, 30654, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31102, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[2] = {{0, 102, 30655, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31103, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[3] = {{0, 102, 30656, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31104, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[4] = {{0, 102, 30657, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31105, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
	},
	[23] = {
		[1] = {{0, 102, 30658, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31106, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
		[2] = {{0, 102, 30659, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31107, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
	},
	[25] = {
		[1] = {{0, 102, 30660, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31108, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[2] = {{0, 102, 30661, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31109, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[3] = {{0, 102, 30662, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31110, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[4] = {{0, 102, 30663, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31111, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
	},
	[26] = {
		[1] = {{0, 102, 30664, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31112, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[2] = {{0, 102, 30665, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31113, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[3] = {{0, 102, 30666, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31114, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[4] = {{0, 102, 30667, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31115, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
	},
	[27] = {
		[1] = {{0, 102, 30668, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31116, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 102, 30669, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31117, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 102, 30670, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31118, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 102, 30671, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31119, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[29] = {
		[3] = {{0, 102, 30672, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31120, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 102, 30673, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31121, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[30] = {
		[3] = {{0, 102, 30674, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31122, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T�"},
		[4] = {{0, 102, 30675, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31123, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
	[31] = {
		[1] = {{0, 102, 31492, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31506, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 102, 31492, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31506, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 102, 31492, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31506, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 102, 31492, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31506, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[32] = {
		[1] = {{0, 102, 31520, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31534, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[2] = {{0, 102, 31520, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31534, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
}

local VET_HOAPHUNG_HOPHU = {
	[2] = {
	   [1] = {{0, 102, 30484, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30932, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
		[2] = {{0, 102, 30485, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30933, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
	},
	[3] = {
		[1] = {{0, 102, 30486, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30934, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
		[2] = {{0, 102, 30487, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30935, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
	},
	[4] = {
		[1] = {{0, 102, 30488, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30936, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 102, 30489, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30937, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
	[6] = {
		[1] = {{0, 102, 30490, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30938, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[2] = {{0, 102, 30491, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30939, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[3] = {{0, 102, 30492, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30940, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[4] = {{0, 102, 30493, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30941, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
	},
	[8] = {
		[3] = {{0, 102, 30494, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30942, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
		[4] = {{0, 102, 30495, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30943, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
	},
	[9] = {
		[3] = {{0, 102, 30496, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30944, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
		[4] = {{0, 102, 30497, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30945, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
	},
	[11] = {
		[1] = {{0, 102, 30498, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30946, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[2] = {{0, 102, 30499, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30947, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[3] = {{0, 102, 30500, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30948, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[4] = {{0, 102, 30501, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30949, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
	},
	[12] = {
		[1] = {{0, 102, 30502, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30950, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[2] = {{0, 102, 30503, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30951, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[3] = {{0, 102, 30504, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30952, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[4] = {{0, 102, 30505, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30953, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
	},
	[14] = {
		[1] = {{0, 102, 30506, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30954, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[2] = {{0, 102, 30507, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30955, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[3] = {{0, 102, 30508, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30956, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[4] = {{0, 102, 30509, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30957, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
	},
	[15] = {
		[1] = {{0, 102, 30510, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30958, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[2] = {{0, 102, 30511, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30959, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[3] = {{0, 102, 30512, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30960, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[4] = {{0, 102, 30513, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30961, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
	},
	[17] = {
		[1] = {{0, 102, 30514, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30962, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[2] = {{0, 102, 30515, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30963, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[3] = {{0, 102, 30516, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30964, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[4] = {{0, 102, 30517, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30965, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
	},
	[18] = {
		[1] = {{0, 102, 30518, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30966, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[2] = {{0, 102, 30519, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30967, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[3] = {{0, 102, 30520, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30968, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[4] = {{0, 102, 30521, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30969, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
	},
	[20] = {
		[1] = {{0, 102, 30522, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30970, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[2] = {{0, 102, 30523, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30971, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[3] = {{0, 102, 30524, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30972, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[4] = {{0, 102, 30525, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30973, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
	},
	[21] = {
		[1] = {{0, 102, 30526, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30974, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[2] = {{0, 102, 30527, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30975, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[3] = {{0, 102, 30528, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30976, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[4] = {{0, 102, 30529, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30977, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
	},
	[23] = {
		[1] = {{0, 102, 30530, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30978, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
		[2] = {{0, 102, 30531, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30979, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
	},
	[25] = {
		[1] = {{0, 102, 30532, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30980, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[2] = {{0, 102, 30533, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30981, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[3] = {{0, 102, 30534, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30982, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[4] = {{0, 102, 30535, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30983, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
	},
	[26] = {
		[1] = {{0, 102, 30536, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30984, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[2] = {{0, 102, 30537, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30985, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[3] = {{0, 102, 30538, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30986, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[4] = {{0, 102, 30539, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30987, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
	},
	[27] = {
		[1] = {{0, 102, 30540, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30988, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 102, 30541, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30989, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 102, 30542, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30990, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 102, 30543, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30991, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[29] = {
		[3] = {{0, 102, 30544, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30992, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 102, 30545, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30993, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[30] = {
		[3] = {{0, 102, 30546, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30994, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T�"},
		[4] = {{0, 102, 30547, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30995, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
	[31] = {
		[1] = {{0, 102, 31490, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31504, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 102, 31490, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31504, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 102, 31490, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31504, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 102, 31490, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31504, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[32] = {
		[1] = {{0, 102, 31518, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31532, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[2] = {{0, 102, 31518, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 31532, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
}

local VET_HOAPHUNG_WEAPON = {
	[2] = {
	   [1] = {{0, 3, 30432, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30640, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
		[2] = {{0, 3, 30433, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30641, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
	},
	[3] = {
		[1] = {{0, 8, 30434, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 8, 30642, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
		[2] = {{0, 8, 30435, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 8, 30643, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
	},
	[4] = {
		[1] = {{0, 0, 30436, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30644, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 0, 30437, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30645, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
	[6] = {
		[1] = {{0, 1, 30438, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 1, 30646, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[2] = {{0, 1, 30439, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 1, 30647, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[3] = {{0, 1, 30440, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 1, 30648, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[4] = {{0, 1, 30441, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 1, 30649, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
	},
	[8] = {
		[3] = {{0, 2, 30442, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30650, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
		[4] = {{0, 2, 30443, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30651, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
	},
	[9] = {
		[3] = {{0, 10, 30444, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 10, 30652, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
		[4] = {{0, 10, 30445, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 10, 30653, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
	},
	[11] = {
		[1] = {{0, 0, 30446, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30654, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[2] = {{0, 0, 30447, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30655, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[3] = {{0, 0, 30448, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30656, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[4] = {{0, 0, 30449, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 0, 30657, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
	},
	[12] = {
		[1] = {{0, 5, 30450, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 5, 30658, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[2] = {{0, 5, 30451, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 5, 30659, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[3] = {{0, 5, 30452, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 5, 30660, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[4] = {{0, 5, 30453, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 5, 30661, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
	},
	[14] = {
		[1] = {{0, 2, 30454, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30662, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[2] = {{0, 2, 30455, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30663, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[3] = {{0, 2, 30456, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30664, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[4] = {{0, 2, 30457, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30665, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
	},
	[15] = {
		[1] = {{0, 9, 30458, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30666, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[2] = {{0, 9, 30459, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30667, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[3] = {{0, 9, 30460, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30668, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[4] = {{0, 9, 30461, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30669, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
	},
	[17] = {
		[1] = {{0, 6, 30462, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 6, 30670, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[2] = {{0, 6, 30463, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 6, 30671, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[3] = {{0, 6, 30464, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 6, 30672, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[4] = {{0, 6, 30465, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 6, 30673, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
	},
	[18] = {
		[1] = {{0, 4, 30466, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 4, 30674, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[2] = {{0, 4, 30467, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 4, 30675, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[3] = {{0, 4, 30468, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 4, 30676, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[4] = {{0, 4, 30469, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 4, 30677, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
	},
	[20] = {
		[1] = {{0, 7, 30470, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 7, 30678, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[2] = {{0, 7, 30471, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 7, 30679, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[3] = {{0, 7, 30472, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 7, 30680, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[4] = {{0, 7, 30473, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 7, 30681, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
	},
	[21] = {
		[1] = {{0, 11, 30474, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30682, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[2] = {{0, 11, 30475, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30683, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[3] = {{0, 11, 30476, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30684, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[4] = {{0, 11, 30477, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30685, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
	},
	[23] = {
		[1] = {{0, 2, 30478, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30686, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
		[2] = {{0, 2, 30479, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 2, 30687, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
	},
	[25] = {
		[1] = {{0, 3, 30480, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30688, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[2] = {{0, 3, 30481, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30689, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[3] = {{0, 3, 30482, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30690, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[4] = {{0, 3, 30483, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 3, 30591, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
	},
	[26] = {
		[1] = {{0, 9, 30484, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30692, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[2] = {{0, 9, 30485, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30693, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[3] = {{0, 9, 30486, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30694, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[4] = {{0, 9, 30487, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 9, 30695, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
	},
	[27] = {
		[1] = {{0, 11, 30488, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30696, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 11, 30489, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30697, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 11, 30490, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30698, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 11, 30491, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 11, 30699, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[29] = {
		[3] = {{0, 13, 30492, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 13, 30700, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 13, 30493, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 13, 30701, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[30] = {
		[3] = {{0, 12, 30494, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 12, 30702, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
		[4] = {{0, 12, 30495, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 12, 30703, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
}


	local nRoute = GetPlayerRoute();
	local nBody = GetBody();

	local nQuanHam = GetTask(704)
	if nQuanHam < 0 then
		gf_AddItemEx2(VET_HOAPHUNG_CLOTH[nRoute][nBody][2], "B� Trang b� H�a Ph�ng Nguy�n So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_CAP[nRoute][nBody][2], "B� Trang b� H�a Ph�ng Nguy�n So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_SHOE[nRoute][nBody][2], "B� Trang b� H�a Ph�ng Nguy�n So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_HIEUPHU[nRoute][nBody][2], "B� Trang b� H�a Ph�ng Nguy�n So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_HOPHU[nRoute][nBody][2], "B� Trang b� H�a Ph�ng Nguy�n So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_LENHKY[nRoute][nBody][2], "B� Trang b� H�a Ph�ng Nguy�n So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_HIEUKY[nRoute][nBody][2], "B� Trang b� H�a Ph�ng Nguy�n So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);

		--trang b� Li�u 
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_HOAPHUNG_WEAPON[nRoute][nBody][2], "B� Trang b� H�a Ph�ng Nguy�n So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
--		end
	else
		gf_AddItemEx2(VET_HOAPHUNG_CLOTH[nRoute][nBody][1], "B� Trang b� H�a Ph�ng Nguy�n So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_CAP[nRoute][nBody][1], "B� Trang b� H�a Ph�ng Nguy�n So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_SHOE[nRoute][nBody][1], "B� Trang b� H�a Ph�ng Nguy�n So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_HIEUPHU[nRoute][nBody][1], "B� Trang b� H�a Ph�ng Nguy�n So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_HOPHU[nRoute][nBody][1], "B� Trang b� H�a Ph�ng Nguy�n So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_LENHKY[nRoute][nBody][1], "B� Trang b� H�a Ph�ng Nguy�n So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		gf_AddItemEx2(VET_HOAPHUNG_HIEUKY[nRoute][nBody][1], "B� Trang b� H�a Ph�ng Nguy�n So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
		--trang b� T�ng
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_HOAPHUNG_WEAPON[nRoute][nBody][1], "B� Trang b� H�a Ph�ng Nguy�n So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� h�a ph�ng", 0, 1);
--		end
	end
end
function GiveJue()
	local tJue ={
		[2]		={1,10},
		[3]		={21,31},
		[4]		={11,20},
		[6]		={32,46},
		[8]		={47,59},
		[9]		={60,70},
		[11]	={71,79},
		[12]	={80,88},
		[14]	={89,108},
		[15]	={109,119},
		[17]	={120,130},
		[18]	={131,141},
		[20]	={142,154},
		[21]	={155,168},
		[23]	={169,182},
		[25]	={183,194},
		[26]	={195,206},
		[27]	={207,218},
		[29]	={219,229},
		[30]	={230,240},
		[31]	={382,391},
		[32]	={392,402},
	};

	local nRoute = GetPlayerRoute()
	if 1 ~= gf_CheckPlayerRoute() then
		Talk(1,"","H�y gia nh�p m�n ph�i sau �� quay l�i t�m ta nh�n y�u quy�t")
		return 0;
	end

	if 1 ~= gf_Judge_Room_Weight((tJue[nRoute][2] - tJue[nRoute][1] + 1), 1, g_szTitle) then
		return 0;
	end

	for i = tJue[nRoute][1],tJue[nRoute][2] do
		gf_AddItemEx({2, 6, i, 1, 4}, "Quy�t Y�u");
	end
end 

function AddTrangBiThanhLongTuongQuan(nLevel,bIsHaveWeapon)
local VET_THANHLONG_CLOTH = {
	[2] = {
	    {{0, 100, 30570, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30611, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[3] = {
		{{0, 100, 30571, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30612, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[4] = {
		{{0, 100, 30572, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30613, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[6] = {
		{{0, 100, 30573, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30614, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[8] = {
		{{0, 100, 30574, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30615, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[9] = {
		{{0, 100, 30575, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30616, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[11] = {
		{{0, 100, 30576, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30617, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[12] = {
		{{0, 100, 30577, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30618, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[14] = {
		{{0, 100, 30578, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30619, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[15] = {
		{{0, 100, 30579, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30620, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[17] = {
		{{0, 100, 30580, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30621, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[18] = {
		{{0, 100, 30581, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30622, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[20] = {
		{{0, 100, 30582, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30623, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[21] = {
		{{0, 100, 30583, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30624, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[23] = {
		{{0, 100, 30584, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30625, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[25] = {
		{{0, 100, 30585, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30626, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[26] = {
		{{0, 100, 30586, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30627, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[27] = {
		{{0, 100, 30587, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30628, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[29] = {
		{{0, 100, 30588, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30629, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[30] = {
		{{0, 100, 30589, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30630, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[31] = {
		{{0, 100, 32157, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32159, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[32] = {
		{{0, 100, 32165, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32167, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
}

local VET_THANHLONG_CAP = {
	[2] = {
	    {{0, 103, 30570, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30611, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[3] = {
		{{0, 103, 30571, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30612, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[4] = {
		{{0, 103, 30572, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30613, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[6] = {
		{{0, 103, 30573, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30614, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[8] = {
		{{0, 103, 30574, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30615, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[9] = {
		{{0, 103, 30575, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30616, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[11] = {
		{{0, 103, 30576, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30617, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[12] = {
		{{0, 103, 30577, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30618, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[14] = {
		{{0, 103, 30578, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30619, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[15] = {
		{{0, 103, 30579, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30620, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[17] = {
		{{0, 103, 30580, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30621, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[18] = {
		{{0, 103, 30581, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30622, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[20] = {
		{{0, 103, 30582, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30623, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[21] = {
		{{0, 103, 30583, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30624, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[23] = {
		{{0, 103, 30584, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30625, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[25] = {
		{{0, 103, 30585, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30626, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[26] = {
		{{0, 103, 30586, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30627, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[27] = {
		{{0, 103, 30587, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30628, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[29] = {
		{{0, 103, 30588, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30629, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[30] = {
		{{0, 103, 30589, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30630, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[31] = {
		{{0, 103, 32157, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32159, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[32] = {
		{{0, 103, 32165, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32167, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
}  

local VET_THANHLONG_SHOE = {
	[2] = {
	    {{0, 101, 30570, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30611, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[3] = {
		{{0, 101, 30571, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30612, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[4] = {
		{{0, 101, 30572, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30613, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[6] = {
		{{0, 101, 30573, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30614, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[8] = {
		{{0, 101, 30574, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30615, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[9] = {
		{{0, 101, 30575, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30616, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[11] = {
		{{0, 101, 30576, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30617, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[12] = {
		{{0, 101, 30577, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30618, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[14] = {
		{{0, 101, 30578, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30619, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[15] = {
		{{0, 101, 30579, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30620, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[17] = {
		{{0, 101, 30580, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30621, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[18] = {
		{{0, 101, 30581, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30622, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[20] = {
		{{0, 101, 30582, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30623, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[21] = {
		{{0, 101, 30583, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30624, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[23] = {
		{{0, 101, 30584, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30625, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[25] = {
		{{0, 101, 30585, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30626, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[26] = {
		{{0, 101, 30586, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30627, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[27] = {
		{{0, 101, 30587, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30628, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[29] = {
		{{0, 101, 30588, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30629, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[30] = {
		{{0, 101, 30589, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30630, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[31] = {
		{{0, 101, 32157, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32159, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
	[32] = {
		{{0, 101, 32165, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32167, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long T��ng Qu�n"},
	},
}

local VET_THANHLONG_PHU = {
	[2] = {
	    {{0, 102, 31172, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31314, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[3] = {
		{{0, 102, 31173, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31315, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[4] = {
		{{0, 102, 31174, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31316, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[6] = {
		{{0, 102, 31175, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31317, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[8] = {
		{{0, 102, 31176, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31318, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[9] = {
		{{0, 102, 31177, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31319, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[11] = {
		{{0, 102, 31178, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31320, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[12] = {
		{{0, 102, 31179, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31321, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[14] = {
		{{0, 102, 31180, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31322, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[15] = {
		{{0, 102, 31181, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31323, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[17] = {
		{{0, 102, 31182, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31324, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[18] = {
		{{0, 102, 31183, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31325, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[20] = {
		{{0, 102, 31184, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31326, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[21] = {
		{{0, 102, 31185, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31327, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[23] = {
		{{0, 102, 31186, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31328, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[25] = {
		{{0, 102, 31187, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31329, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[26] = {
		{{0, 102, 31188, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31330, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[27] = {
		{{0, 102, 31189, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31331, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[29] = {
		{{0, 102, 31190, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31332, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[30] = {
		{{0, 102, 31191, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31333, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[31] = {
		{{0, 102, 31495, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31509, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[32] = {
		{{0, 102, 31523, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31537, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
}

local VET_THANHLONG_KY = {
	[2] = {
	    {{0, 102, 31152, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31294, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[3] = {
		{{0, 102, 31153, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31295, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[4] = {
		{{0, 102, 31154, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31296, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[6] = {
		{{0, 102, 31155, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31297, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[8] = {
		{{0, 102, 31156, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31298, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[9] = {
		{{0, 102, 31157, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31299, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[11] = {
		{{0, 102, 31158, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31300, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[12] = {
		{{0, 102, 31159, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31301, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[14] = {
		{{0, 102, 31160, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31302, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[15] = {
		{{0, 102, 31161, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31303, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[17] = {
		{{0, 102, 31162, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31304, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[18] = {
		{{0, 102, 31163, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31305, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[20] = {
		{{0, 102, 31164, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31306, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[21] = {
		{{0, 102, 31165, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31307, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[23] = {
		{{0, 102, 31166, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31308, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[25] = {
		{{0, 102, 31167, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31309, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[26] = {
		{{0, 102, 31168, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31310, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[27] = {
		{{0, 102, 31169, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31311, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[29] = {
		{{0, 102, 31170, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31312, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[30] = {
		{{0, 102, 31171, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31313, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[31] = {
		{{0, 102, 31494, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31508, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[32] = {
		{{0, 102, 31522, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31536, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
}

local VET_THANHLONG_BAI = {
	[2] = {
	    {{0, 102, 31132, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31274, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[3] = {
		{{0, 102, 31133, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31275, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[4] = {
		{{0, 102, 31134, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31276, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[6] = {
		{{0, 102, 31135, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31277, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[8] = {
		{{0, 102, 31136, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31278, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[9] = {
		{{0, 102, 31137, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31279, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[11] = {
		{{0, 102, 31138, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31280, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[12] = {
		{{0, 102, 31139, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31281, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[14] = {
		{{0, 102, 31140, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31282, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[15] = {
		{{0, 102, 31141, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31283, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[17] = {
		{{0, 102, 31142, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31284, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[18] = {
		{{0, 102, 31143, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31285, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[20] = {
		{{0, 102, 31144, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31286, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[21] = {
		{{0, 102, 31145, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31287, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[23] = {
		{{0, 102, 31146, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31288, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[25] = {
		{{0, 102, 31147, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31289, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[26] = {
		{{0, 102, 31148, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31290, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[27] = {
		{{0, 102, 31149, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31291, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[29] = {
		{{0, 102, 31150, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31292, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[30] = {
		{{0, 102, 31151, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31293, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[31] = {
		{{0, 102, 31493, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31507, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
	[32] = {
		{{0, 102, 31521, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31535, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long T��ng Qu�n"},
	},
}

	local nRoute = GetPlayerRoute();
--	local nBody = GetBody();

	local nQuanHam = GetTask(704)
	if nQuanHam < 0 then
		gf_AddItemEx2(VET_THANHLONG_CLOTH[nRoute][1][2], "B� Trang b� Thanh Long T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_CAP[nRoute][1][2], "B� Trang b� Thanh Long T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_SHOE[nRoute][1][2], "B� Trang b� Thanh Long T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_PHU[nRoute][1][2], "B� Trang b� Thanh Long T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_KY[nRoute][1][2], "B� Trang b� Thanh Long T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_BAI[nRoute][1][2], "B� Trang b� Thanh Long T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Thanh Long", 0, 1);
		--trang b� Li�u 
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_THANHLONG_WEAPON[nRoute][2], "B� Trang b� Thanh Long T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Thanh Long", 0, 1);
--		end
	else
		gf_AddItemEx2(VET_THANHLONG_CLOTH[nRoute][1][1], "B� Trang b� Thanh Long T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_CAP[nRoute][1][1], "B� Trang b� Thanh Long T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_SHOE[nRoute][1][1], "B� Trang b� Thanh Long T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_PHU[nRoute][1][1], "B� Trang b� Thanh Long T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_KY[nRoute][1][1], "B� Trang b� Thanh Long T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Thanh Long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_BAI[nRoute][1][1], "B� Trang b� Thanh Long T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Thanh Long", 0, 1);
		--trang b� T�ng
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_THANHLONG_WEAPON[nRoute][1], "B� Trang b� Thanh Long T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Thanh Long", 0, 1);
--		end
	end
end

function AddTrangBiThanhLongNguyenSoai(nLevel,bIsHaveWeapon)
local VET_THANHLONG_CLOTH = {
	[2] = {
	    {{0, 100, 30590, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30631, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[3] = {
		{{0, 100, 30591, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30632, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[4] = {
		{{0, 100, 30592, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30633, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[6] = {
		{{0, 100, 30593, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30634, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[8] = {
		{{0, 100, 30594, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30635, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[9] = {
		{{0, 100, 30595, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30636, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[11] = {
		{{0, 100, 30596, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30637, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[12] = {
		{{0, 100, 30597, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30638, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[14] = {
		{{0, 100, 30598, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30639, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[15] = {
		{{0, 100, 30599, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30640, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[17] = {
		{{0, 100, 30600, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30641, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[18] = {
		{{0, 100, 30601, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30642, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[20] = {
		{{0, 100, 30602, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30643, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[21] = {
		{{0, 100, 30603, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30644, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[23] = {
		{{0, 100, 30604, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30645, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[25] = {
		{{0, 100, 30605, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30646, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[26] = {
		{{0, 100, 30606, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30647, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[27] = {
		{{0, 100, 30607, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30648, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long TSo�i"},
	},
	[29] = {
		{{0, 100, 30608, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30649, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[30] = {
		{{0, 100, 30609, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30650, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[31] = {
		{{0, 100, 32158, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32160, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[32] = {
		{{0, 100, 32166, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32168, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
}

local VET_THANHLONG_CAP = {
	[2] = {
	    {{0, 103, 30590, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30631, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[3] = {
		{{0, 103, 30591, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30632, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[4] = {
		{{0, 103, 30592, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30633, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[6] = {
		{{0, 103, 30593, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30634, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[8] = {
		{{0, 103, 30594, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30635, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[9] = {
		{{0, 103, 30595, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30636, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[11] = {
		{{0, 103, 30596, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30637, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[12] = {
		{{0, 103, 30597, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30638, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[14] = {
		{{0, 103, 30598, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30639, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[15] = {
		{{0, 103, 30599, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30640, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[17] = {
		{{0, 103, 30600, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30641, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[18] = {
		{{0, 103, 30601, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30642, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[20] = {
		{{0, 103, 30602, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30643, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[21] = {
		{{0, 103, 30603, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30644, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[23] = {
		{{0, 103, 30604, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30645, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[25] = {
		{{0, 103, 30605, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30646, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[26] = {
		{{0, 103, 30606, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30647, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[27] = {
		{{0, 103, 30607, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30648, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[29] = {
		{{0, 103, 30608, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30649, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[30] = {
		{{0, 103, 30609, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 30650, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[31] = {
		{{0, 103, 32158, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32160, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[32] = {
		{{0, 103, 32166, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32168, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
}  

local VET_THANHLONG_SHOE = {
	[2] = {
	    {{0, 101, 30590, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30631, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[3] = {
		{{0, 101, 30591, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30632, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[4] = {
		{{0, 101, 30592, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30633, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[6] = {
		{{0, 101, 30593, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30634, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[8] = {
		{{0, 101, 30594, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30635, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[9] = {
		{{0, 101, 30595, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30636, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[11] = {
		{{0, 101, 30596, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30637, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[12] = {
		{{0, 101, 30597, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30638, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[14] = {
		{{0, 101, 30598, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30639, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[15] = {
		{{0, 101, 30599, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30640, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[17] = {
		{{0, 101, 30600, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30641, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[18] = {
		{{0, 101, 30601, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30642, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[20] = {
		{{0, 101, 30602, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30643, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[21] = {
		{{0, 101, 30603, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30644, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[23] = {
		{{0, 101, 30604, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30645, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[25] = {
		{{0, 101, 30605, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30646, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[26] = {
		{{0, 101, 30606, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30647, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[27] = {
		{{0, 101, 30607, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30648, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[29] = {
		{{0, 101, 30608, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30649, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[30] = {
		{{0, 101, 30609, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 30650, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[31] = {
		{{0, 101, 32158, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32160, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
	[32] = {
		{{0, 101, 32166, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32168, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Thanh Long So�i"},
	},
}

local VET_THANHLONG_HIEUPHU = {
	[2] = {
	    {{0, 102, 31192, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31334, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[3] = {
		{{0, 102, 31193, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31335, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[4] = {
		{{0, 102, 31194, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31336, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[6] = {
		{{0, 102, 31195, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31337, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[8] = {
		{{0, 102, 31196, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31338, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[9] = {
		{{0, 102, 31197, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31339, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[11] = {
		{{0, 102, 31198, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31340, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[12] = {
		{{0, 102, 31199, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31341, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[14] = {
		{{0, 102, 31200, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31342, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[15] = {
		{{0, 102, 31201, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31343, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[17] = {
		{{0, 102, 31202, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31344, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[18] = {
		{{0, 102, 31203, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31345, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[20] = {
		{{0, 102, 31204, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31346, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[21] = {
		{{0, 102, 31205, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31347, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[23] = {
		{{0, 102, 31206, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31348, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[25] = {
		{{0, 102, 31207, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31349, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[26] = {
		{{0, 102, 31208, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31350, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[27] = {
		{{0, 102, 31209, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31351, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[29] = {
		{{0, 102, 31210, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31352, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[30] = {
		{{0, 102, 31211, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31353, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long TSo�i"},
	},
	[31] = {
		{{0, 102, 31496, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31510, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[32] = {
		{{0, 102, 31524, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31538, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long TSo�i"},
	},
}
local VET_THANHLONG_PHU = {
	[2] = {
	    {{0, 102, 31212, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31354, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[3] = {
		{{0, 102, 31213, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31355, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[4] = {
		{{0, 102, 31214, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31356, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[6] = {
		{{0, 102, 31215, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31357, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[8] = {
		{{0, 102, 31216, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31358, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[9] = {
		{{0, 102, 31217, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31359, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[11] = {
		{{0, 102, 31218, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31360, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[12] = {
		{{0, 102, 31219, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31361, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[14] = {
		{{0, 102, 31220, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31362, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[15] = {
		{{0, 102, 31221, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31363, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[17] = {
		{{0, 102, 31222, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31364, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[18] = {
		{{0, 102, 31223, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31365, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[20] = {
		{{0, 102, 31224, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31366, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[21] = {
		{{0, 102, 31225, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31367, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[23] = {
		{{0, 102, 31226, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31368, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[25] = {
		{{0, 102, 31227, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31369, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[26] = {
		{{0, 102, 31228, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31370, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[27] = {
		{{0, 102, 31229, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31371, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[29] = {
		{{0, 102, 31230, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31372, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[30] = {
		{{0, 102, 31231, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31373, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[31] = {
		{{0, 102, 31497, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31511, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[32] = {
		{{0, 102, 31525, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31539, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
}
local VET_THANHLONG_KY = {
	[2] = {
	    {{0, 102, 31232, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31374, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[3] = {
		{{0, 102, 31233, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31375, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[4] = {
		{{0, 102, 31234, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31376, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[6] = {
		{{0, 102, 31235, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31377, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[8] = {
		{{0, 102, 31236, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31378, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[9] = {
		{{0, 102, 31237, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31379, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[11] = {
		{{0, 102, 31238, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31380, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[12] = {
		{{0, 102, 31239, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31381, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[14] = {
		{{0, 102, 31240, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31382, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[15] = {
		{{0, 102, 31241, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31383, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[17] = {
		{{0, 102, 31242, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31384, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[18] = {
		{{0, 102, 31243, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31385, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[20] = {
		{{0, 102, 31244, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31386, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[21] = {
		{{0, 102, 31245, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31387, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[23] = {
		{{0, 102, 31246, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31388, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[25] = {
		{{0, 102, 31247, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31389, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[26] = {
		{{0, 102, 31248, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31390, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[27] = {
		{{0, 102, 31249, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31391, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[29] = {
		{{0, 102, 31250, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31392, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[30] = {
		{{0, 102, 31251, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31393, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[31] = {
		{{0, 102, 31498, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31512, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[32] = {
		{{0, 102, 31526, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31540, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
}

local VET_THANHLONG_BAI = {
	[2] = {
	    {{0, 102, 31252, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31394, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[3] = {
		{{0, 102, 31253, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31395, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[4] = {
		{{0, 102, 31254, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31396, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[6] = {
		{{0, 102, 31255, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31397, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[8] = {
		{{0, 102, 31256, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31398, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[9] = {
		{{0, 102, 31257, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31399, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[11] = {
		{{0, 102, 31258, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31400, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[12] = {
		{{0, 102, 31259, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31401, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[14] = {
		{{0, 102, 31260, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31402, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[15] = {
		{{0, 102, 31261, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31403, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[17] = {
		{{0, 102, 31262, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31404, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[18] = {
		{{0, 102, 31263, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31405, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[20] = {
		{{0, 102, 31264, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31406, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[21] = {
		{{0, 102, 31265, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31407, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[23] = {
		{{0, 102, 31266, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31408, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[25] = {
		{{0, 102, 31267, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31409, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[26] = {
		{{0, 102, 31268, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31410, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[27] = {
		{{0, 102, 31269, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31411, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[29] = {
		{{0, 102, 31270, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31412, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[30] = {
		{{0, 102, 31271, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31413, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[31] = {
		{{0, 102, 31499, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31513, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
	[32] = {
		{{0, 102, 31527, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31541, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Thanh Long So�i"},
	},
}

	local nRoute = GetPlayerRoute();
--	local nBody = GetBody();

	local nQuanHam = GetTask(704)
	if nQuanHam < 0 then
		gf_AddItemEx2(VET_THANHLONG_CLOTH[nRoute][1][2], "B� Trang b� Thanh Long So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_CAP[nRoute][1][2], "B� Trang b� Thanh Long So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_SHOE[nRoute][1][2], "B� Trang b� Thanh Long So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_PHU[nRoute][1][2], "B� Trang b� Thanh Long So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_KY[nRoute][1][2], "B� Trang b� Thanh Long So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_BAI[nRoute][1][2], "B� Trang b� Thanh Long So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_HIEUPHU[nRoute][1][2], "B� Trang b� Thanh Long So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� thanh long", 0, 1);
		--trang b� Li�u 
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_THANHLONG_WEAPON[nRoute][2], "B� Trang b� Thanh Long So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� thanh long", 0, 1);
--		end
	else
		gf_AddItemEx2(VET_THANHLONG_CLOTH[nRoute][1][1], "B� Trang b� Thanh Long So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_CAP[nRoute][1][1], "B� Trang b� Thanh Long So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_SHOE[nRoute][1][1], "B� Trang b� Thanh Long So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_PHU[nRoute][1][1], "B� Trang b� Thanh Long So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_KY[nRoute][1][1], "B� Trang b� Thanh Long So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_BAI[nRoute][1][1], "B� Trang b� Thanh Long So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� thanh long", 0, 1);
		gf_AddItemEx2(VET_THANHLONG_HIEUPHU[nRoute][1][1], "B� Trang b� Thanh Long So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� thanh long", 0, 1);
		--trang b� T�ng
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_THANHLONG_WEAPON[nRoute][1], "B� Trang b� Thanh Long So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� thanh long", 0, 1);
--		end
	end
end
--=================Trang b� Uy H�
function AddTrangBiUyHoTuongQuan(nLevel,bIsHaveWeapon)
local VET_UYHO_CAP = {
	[2] = {
	    {{0, 103, 32171, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32215, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[3] = {
		{{0, 103, 32172, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32216, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[4] = {
		{{0, 103, 32173, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32217, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[6] = {
		{{0, 103, 32174, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32218, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[8] = {
		{{0, 103, 32175, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32219, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[9] = {
		{{0, 103, 32176, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32220, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[11] = {
		{{0, 103, 32177, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32221, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[12] = {
		{{0, 103, 32178, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32222, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[14] = {
		{{0, 103, 32179, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32223, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[15] = {
		{{0, 103, 32180, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32224, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[17] = {
		{{0, 103, 32181, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32225, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[18] = {
		{{0, 103, 32182, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32226, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[20] = {
		{{0, 103, 32183, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32227, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[21] = {
		{{0, 103, 32184, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32228, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[23] = {
		{{0, 103, 32185, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32229, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[25] = {
		{{0, 103, 32186, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32230, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[26] = {
		{{0, 103, 32187, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32231, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[27] = {
		{{0, 103, 32188, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32232, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[29] = {
		{{0, 103, 32189, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32233, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[30] = {
		{{0, 103, 32190, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32234, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[31] = {
		{{0, 103, 32191, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32235, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[32] = {
		{{0, 103, 32192, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32236, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
}  
local VET_UYHO_CLOTH = {
	[2] = {
	    {{0, 100, 32171, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32215, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[3] = {
		{{0, 100, 32172, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32216, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[4] = {
		{{0, 100, 32173, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32217, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[6] = {
		{{0, 100, 32174, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32218, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[8] = {
		{{0, 100, 32175, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32219, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[9] = {
		{{0, 100, 32176, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32220, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[11] = {
		{{0, 100, 32177, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32221, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[12] = {
		{{0, 100, 32178, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32222, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[14] = {
		{{0, 100, 32179, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32223, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[15] = {
		{{0, 100, 32180, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32224, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[17] = {
		{{0, 100, 32181, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32225, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[18] = {
		{{0, 100, 32182, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32226, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[20] = {
		{{0, 100, 32183, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32227, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[21] = {
		{{0, 100, 32184, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32228, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[23] = {
		{{0, 100, 32185, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32229, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[25] = {
		{{0, 100, 32186, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32230, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[26] = {
		{{0, 100, 32187, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32231, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[27] = {
		{{0, 100, 32188, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32232, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[29] = {
		{{0, 100, 32189, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32233, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[30] = {
		{{0, 100, 32190, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32234, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[31] = {
		{{0, 100, 32191, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32235, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[32] = {
		{{0, 100, 32192, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32236, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
}
local VET_UYHO_SHOE = {
	[2] = {
	    {{0, 101, 32171, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32215, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[3] = {
		{{0, 101, 32172, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32216, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[4] = {
		{{0, 101, 32173, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32217, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[6] = {
		{{0, 101, 32174, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32218, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[8] = {
		{{0, 101, 32175, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32219, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[9] = {
		{{0, 101, 32176, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32220, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[11] = {
		{{0, 101, 32177, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32221, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[12] = {
		{{0, 101, 32178, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32222, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[14] = {
		{{0, 101, 32179, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32223, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[15] = {
		{{0, 101, 32180, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32224, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[17] = {
		{{0, 101, 32181, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32225, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[18] = {
		{{0, 101, 32182, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32226, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[20] = {
		{{0, 101, 32183, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32227, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[21] = {
		{{0, 101, 32184, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32228, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[23] = {
		{{0, 101, 32185, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32229, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[25] = {
		{{0, 101, 32186, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32230, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[26] = {
		{{0, 101, 32187, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32231, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[27] = {
		{{0, 101, 32188, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32232, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[29] = {
		{{0, 101, 32189, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32233, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[30] = {
		{{0, 101, 32190, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32234, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[31] = {
		{{0, 101, 32191, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32235, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
	[32] = {
		{{0, 101, 32192, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32236, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� T��ng Qu�n"},
	},
}

local VET_UYHO_BAI = {
	[2] = {
	    {{0, 102, 31542, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31696, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[3] = {
		{{0, 102, 31543, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31697, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[4] = {
		{{0, 102, 31544, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31698, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[6] = {
		{{0, 102, 31545, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31699, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[8] = {
		{{0, 102, 31546, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31700, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[9] = {
		{{0, 102, 31547, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31701, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[11] = {
		{{0, 102, 31548, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31702, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[12] = {
		{{0, 102, 31549, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31703, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[14] = {
		{{0, 102, 31550, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31704, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[15] = {
		{{0, 102, 31551, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31705, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[17] = {
		{{0, 102, 31552, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31706, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[18] = {
		{{0, 102, 31553, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31707, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[20] = {
		{{0, 102, 31554, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31708, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[21] = {
		{{0, 102, 31555, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31709, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[23] = {
		{{0, 102, 31556, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31710, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[25] = {
		{{0, 102, 31557, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31711, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[26] = {
		{{0, 102, 31558, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31712, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[27] = {
		{{0, 102, 31559, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31713, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[29] = {
		{{0, 102, 31560, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31714, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[30] = {
		{{0, 102, 31561, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31715, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[31] = {
		{{0, 102, 31562, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31716, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[32] = {
		{{0, 102, 31563, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31717, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
}
local VET_UYHO_KY = {
	[2] = {
	    {{0, 102, 31564, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31718, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[3] = {
		{{0, 102, 31565, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31719, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[4] = {
		{{0, 102, 31566, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31720, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[6] = {
		{{0, 102, 31567, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31721, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[8] = {
		{{0, 102, 31568, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31722, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[9] = {
		{{0, 102, 31569, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31723, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[11] = {
		{{0, 102, 31570, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31724, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[12] = {
		{{0, 102, 31571, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31725, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[14] = {
		{{0, 102, 31572, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31726, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[15] = {
		{{0, 102, 31573, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31727, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[17] = {
		{{0, 102, 31574, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31728, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[18] = {
		{{0, 102, 31575, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31729, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[20] = {
		{{0, 102, 31576, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31730, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[21] = {
		{{0, 102, 31577, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31731, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[23] = {
		{{0, 102, 31578, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31732, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[25] = {
		{{0, 102, 31579, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31733, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[26] = {
		{{0, 102, 31580, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31734, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[27] = {
		{{0, 102, 31581, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31735, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[29] = {
		{{0, 102, 31582, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31736, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[30] = {
		{{0, 102, 31583, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31737, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[31] = {
		{{0, 102, 31584, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31738, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[32] = {
		{{0, 102, 31585, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31739, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
}
local VET_UYHO_PHU = {
	[2] = {
	    {{0, 102, 31586, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31740, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[3] = {
		{{0, 102, 31587, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31741, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[4] = {
		{{0, 102, 31588, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31742, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[6] = {
		{{0, 102, 31589, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31743, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[8] = {
		{{0, 102, 31590, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31744, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[9] = {
		{{0, 102, 31591, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31745, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[11] = {
		{{0, 102, 31592, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31746, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[12] = {
		{{0, 102, 31593, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31747, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[14] = {
		{{0, 102, 31594, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31748, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[15] = {
		{{0, 102, 31595, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31749, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[17] = {
		{{0, 102, 31596, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31750, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[18] = {
		{{0, 102, 31597, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31751, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[20] = {
		{{0, 102, 31598, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31752, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[21] = {
		{{0, 102, 31599, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31753, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[23] = {
		{{0, 102, 31600, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31754, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[25] = {
		{{0, 102, 31601, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31755, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[26] = {
		{{0, 102, 31602, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31756, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[27] = {
		{{0, 102, 31603, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31757, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[29] = {
		{{0, 102, 31604, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31758, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[30] = {
		{{0, 102, 31605, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31759, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[31] = {
		{{0, 102, 31606, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31760, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
	[32] = {
		{{0, 102, 31607, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31761, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� T��ng Qu�n"},
	},
}
	local nRoute = GetPlayerRoute();
--	local nBody = GetBody();

	local nQuanHam = GetTask(704)
	if nQuanHam < 0 then
		gf_AddItemEx2(VET_UYHO_CLOTH[nRoute][1][2], "B� Trang b� Uy H� T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_CAP[nRoute][1][2], "B� Trang b� Uy H� T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_SHOE[nRoute][1][2], "B� Trang b� Uy H� T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_PHU[nRoute][1][2], "B� Trang b� Uy H� T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_KY[nRoute][1][2], "B� Trang b� Uy H� T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_BAI[nRoute][1][2], "B� Trang b� Uy H� T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		--trang b� Li�u 
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_UYHO_WEAPON[nRoute][2], "B� Trang b� Uy H� T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
--		end
	else
		gf_AddItemEx2(VET_UYHO_CLOTH[nRoute][1][1], "B� Trang b� Uy H� T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_CAP[nRoute][1][1], "B� Trang b� Uy H� T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_SHOE[nRoute][1][1], "B� Trang b� Uy H� T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_PHU[nRoute][1][1], "B� Trang b� Uy H� T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_KY[nRoute][1][1], "B� Trang b� Uy H� T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_BAI[nRoute][1][1], "B� Trang b� Uy H� T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		--trang b� T�ng
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_UYHO_WEAPON[nRoute][1], "B� Trang b� Uy H� T��ng Qu�n", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
--		end
	end
end

function AddTrangBiUyHoNguyenSoai(nLevel,bIsHaveWeapon)
local VET_UYHO_CAP = {
	[2] = {
	    {{0, 103, 32193, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32237, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[3] = {
		{{0, 103, 32194, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32238, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[4] = {
		{{0, 103, 32195, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32239, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[6] = {
		{{0, 103, 32196, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32240, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[8] = {
		{{0, 103, 32197, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32241, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[9] = {
		{{0, 103, 32198, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32242, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[11] = {
		{{0, 103, 32199, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32243, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[12] = {
		{{0, 103, 32200, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32244, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[14] = {
		{{0, 103, 32201, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32245, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[15] = {
		{{0, 103, 32202, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32246, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[17] = {
		{{0, 103, 32203, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32247, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[18] = {
		{{0, 103, 32204, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32248, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[20] = {
		{{0, 103, 32205, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32249, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[21] = {
		{{0, 103, 32206, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32250, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[23] = {
		{{0, 103, 32207, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32251, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[25] = {
		{{0, 103, 32208, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32252, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[26] = {
		{{0, 103, 32209, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32253, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[27] = {
		{{0, 103, 32210, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32254, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[29] = {
		{{0, 103, 32211, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32255, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[30] = {
		{{0, 103, 32212, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32256, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[31] = {
		{{0, 103, 32213, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32257, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[32] = {
		{{0, 103, 32214, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 103, 32258, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
} 
local VET_UYHO_CLOTH = {
	[2] = {
	    {{0, 100, 32193, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32237, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[3] = {
		{{0, 100, 32194, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32238, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[4] = {
		{{0, 100, 32195, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32239, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[6] = {
		{{0, 100, 32196, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32240, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[8] = {
		{{0, 100, 32197, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32241, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[9] = {
		{{0, 100, 32198, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32242, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[11] = {
		{{0, 100, 32199, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32243, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[12] = {
		{{0, 100, 32200, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32244, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[14] = {
		{{0, 100, 32201, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32245, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[15] = {
		{{0, 100, 32202, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32246, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[17] = {
		{{0, 100, 32203, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32247, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[18] = {
		{{0, 100, 32204, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32248, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[20] = {
		{{0, 100, 32205, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32249, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[21] = {
		{{0, 100, 32206, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32250, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[23] = {
		{{0, 100, 32207, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32251, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[25] = {
		{{0, 100, 32208, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32252, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[26] = {
		{{0, 100, 32209, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32253, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[27] = {
		{{0, 100, 32210, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32254, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[29] = {
		{{0, 100, 32211, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32255, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[30] = {
		{{0, 100, 32212, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32256, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[31] = {
		{{0, 100, 32213, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32257, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[32] = {
		{{0, 100, 32214, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 32258, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
}

 

local VET_UYHO_SHOE = {
	[2] = {
	    {{0, 101, 32193, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32237, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[3] = {
		{{0, 101, 32194, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32238, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[4] = {
		{{0, 101, 32195, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32239, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[6] = {
		{{0, 101, 32196, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32240, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[8] = {
		{{0, 101, 32197, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32241, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[9] = {
		{{0, 101, 32198, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32242, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[11] = {
		{{0, 101, 32199, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32243, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[12] = {
		{{0, 101, 32200, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32244, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[14] = {
		{{0, 101, 32201, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32245, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[15] = {
		{{0, 101, 32202, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32246, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[17] = {
		{{0, 101, 32203, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32247, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[18] = {
		{{0, 101, 32204, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32248, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[20] = {
		{{0, 101, 32205, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32249, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[21] = {
		{{0, 101, 32206, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32250, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[23] = {
		{{0, 101, 32207, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32251, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[25] = {
		{{0, 101, 32208, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32252, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[26] = {
		{{0, 101, 32209, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32253, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[27] = {
		{{0, 101, 32210, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32254, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[29] = {
		{{0, 101, 32211, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32255, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[30] = {
		{{0, 101, 32212, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32256, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[31] = {
		{{0, 101, 32213, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32257, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
	[32] = {
		{{0, 101, 32214, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 101, 32258, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Uy H� So�i"},
	},
}

local VET_UYHO_HIEUPHU = {
	[2] = {
	    {{0, 102, 31608, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31762, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[3] = {
		{{0, 102, 31609, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31763, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[4] = {
		{{0, 102, 31610, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31764, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[6] = {
		{{0, 102, 31611, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31765, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[8] = {
		{{0, 102, 31612, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31766, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[9] = {
		{{0, 102, 31613, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31767, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[11] = {
		{{0, 102, 31614, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31768, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[12] = {
		{{0, 102, 31615, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31769, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[14] = {
		{{0, 102, 31616, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31770, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[15] = {
		{{0, 102, 31617, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31771, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[17] = {
		{{0, 102, 31618, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31772, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[18] = {
		{{0, 102, 31619, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31773, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[20] = {
		{{0, 102, 31620, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31774, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[21] = {
		{{0, 102, 31621, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31775, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[23] = {
		{{0, 102, 31622, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31776, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[25] = {
		{{0, 102, 31623, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31777, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[26] = {
		{{0, 102, 31624, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31778, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[27] = {
		{{0, 102, 31625, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31779, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[29] = {
		{{0, 102, 31626, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31780, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[30] = {
		{{0, 102, 31627, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31781, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[31] = {
		{{0, 102, 31628, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31782, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[32] = {
		{{0, 102, 31629, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31783, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
}
local VET_UYHO_PHU = {
	[2] = {
	    {{0, 102, 31630, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31784, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[3] = {
		{{0, 102, 31631, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31785, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[4] = {
		{{0, 102, 31632, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31786, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[6] = {
		{{0, 102, 31633, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31787, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[8] = {
		{{0, 102, 31634, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31788, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[9] = {
		{{0, 102, 31635, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31789, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[11] = {
		{{0, 102, 31636, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31790, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[12] = {
		{{0, 102, 31637, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31791, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[14] = {
		{{0, 102, 31638, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31792, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[15] = {
		{{0, 102, 31639, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31793, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[17] = {
		{{0, 102, 31640, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31794, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[18] = {
		{{0, 102, 31641, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31795, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[20] = {
		{{0, 102, 31642, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31796, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[21] = {
		{{0, 102, 31643, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31797, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[23] = {
		{{0, 102, 31644, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31798, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[25] = {
		{{0, 102, 31645, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31799, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[26] = {
		{{0, 102, 31646, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31800, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[27] = {
		{{0, 102, 31647, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31801, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[29] = {
		{{0, 102, 31648, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31802, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[30] = {
		{{0, 102, 31649, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31803, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[31] = {
		{{0, 102, 31650, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31804, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[32] = {
		{{0, 102, 31651, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31805, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
}
local VET_UYHO_KY = {
	[2] = {
	    {{0, 102, 31652, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31806, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[3] = {
		{{0, 102, 31653, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31807, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[4] = {
		{{0, 102, 31654, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31808, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[6] = {
		{{0, 102, 31655, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31809, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[8] = {
		{{0, 102, 31656, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31810, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[9] = {
		{{0, 102, 31657, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31811, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[11] = {
		{{0, 102, 31658, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31812, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[12] = {
		{{0, 102, 31659, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31813, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[14] = {
		{{0, 102, 31660, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31814, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[15] = {
		{{0, 102, 31661, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31815, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[17] = {
		{{0, 102, 31662, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31816, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[18] = {
		{{0, 102, 31663, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31817, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[20] = {
		{{0, 102, 31664, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31818, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[21] = {
		{{0, 102, 31665, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31819, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[23] = {
		{{0, 102, 31666, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31820, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[25] = {
		{{0, 102, 31667, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31821, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[26] = {
		{{0, 102, 31668, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31822, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[27] = {
		{{0, 102, 31669, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31823, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[29] = {
		{{0, 102, 31670, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31824, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[30] = {
		{{0, 102, 31671, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31825, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[31] = {
		{{0, 102, 31672, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31826, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[32] = {
		{{0, 102, 31673, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31827, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
}

local VET_UYHO_BAI = {
	[2] = {
	    {{0, 102, 31674, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31828, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[3] = {
		{{0, 102, 31675, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31829, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[4] = {
		{{0, 102, 31676, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31830, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[6] = {
		{{0, 102, 31677, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31831, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[8] = {
		{{0, 102, 31678, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31832, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[9] = {
		{{0, 102, 31679, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31833, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[11] = {
		{{0, 102, 31680, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31834, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[12] = {
		{{0, 102, 31681, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31835, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[14] = {
		{{0, 102, 31682, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31836, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[15] = {
		{{0, 102, 31683, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31837, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[17] = {
		{{0, 102, 31684, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31838, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[18] = {
		{{0, 102, 31685, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31839, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[20] = {
		{{0, 102, 31686, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31840, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[21] = {
		{{0, 102, 31687, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31841, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[23] = {
		{{0, 102, 31688, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31842, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[25] = {
		{{0, 102, 31689, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31843, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[26] = {
		{{0, 102, 31690, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31844, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[27] = {
		{{0, 102, 31691, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31845, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[29] = {
		{{0, 102, 31692, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31846, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[30] = {
		{{0, 102, 31693, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31847, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[31] = {
		{{0, 102, 31694, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31848, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
	[32] = {
		{{0, 102, 31695, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 102, 31849, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Uy H� So�i"},
	},
}

	local nRoute = GetPlayerRoute();
--	local nBody = GetBody();

	local nQuanHam = GetTask(704)
	if nQuanHam < 0 then
		gf_AddItemEx2(VET_UYHO_CLOTH[nRoute][1][2], "B� Trang b� Uy H� So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_CAP[nRoute][1][2], "B� Trang b� Uy H� So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_SHOE[nRoute][1][2], "B� Trang b� Uy H� So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_PHU[nRoute][1][2], "B� Trang b� Uy H� So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_KY[nRoute][1][2], "B� Trang b� Uy H� So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_BAI[nRoute][1][2], "B� Trang b� Uy H� So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_HIEUPHU[nRoute][1][2], "B� Trang b� Uy H� So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		--trang b� Li�u 
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_UYHO_WEAPON[nRoute][2], "B� Trang b� Uy H� So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
--		end
	else
		gf_AddItemEx2(VET_UYHO_CLOTH[nRoute][1][1], "B� Trang b� Uy H� So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_CAP[nRoute][1][1], "B� Trang b� Uy H� So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_SHOE[nRoute][1][1], "B� Trang b� Uy H� So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_PHU[nRoute][1][1], "B� Trang b� Uy H� So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_KY[nRoute][1][1], "B� Trang b� Uy H� So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_BAI[nRoute][1][1], "B� Trang b� Uy H� So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		gf_AddItemEx2(VET_UYHO_HIEUPHU[nRoute][1][1], "B� Trang b� Uy H� So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
		--trang b� T�ng
--		if bIsHaveWeapon == 1 then
--			gf_AddItemEx2(VET_UYHO_WEAPON[nRoute][1], "B� Trang b� Uy H� So�i", "NHAN THUONG DUA TOP "..szLOGSERVERNAME, "Nh�n trang b� Uy H�", 0, 1);
--		end
	end
end