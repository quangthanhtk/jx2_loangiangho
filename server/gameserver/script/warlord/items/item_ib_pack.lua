----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item t�i/r��ng m� ra c�c v�t ph�m con
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_tbPackItemList = {
    [PackItemId(2, 1, 40021)] = { szName = "T�i K� N�ng B�H Lv1",
                                  tbItems = {
                                      { tbProp = { 2, 150, 1 }, nStack = 1, nRate = 6.666666666666667 }, -- Ch�n kh� h� th� C�p 1
                                      { tbProp = { 2, 150, 5 }, nStack = 1, nRate = 6.666666666666667 }, -- �ch Th� Di�n D��ng C�p 1
                                      { tbProp = { 2, 150, 9 }, nStack = 1, nRate = 6.666666666666667 }, -- C��ng Th�n B� Th� C�p 1
                                      { tbProp = { 2, 150, 13 }, nStack = 1, nRate = 6.666666666666667 }, -- �m Phong Th�c C�t C�p 1
                                      { tbProp = { 2, 150, 17 }, nStack = 1, nRate = 6.666666666666667 }, -- Huy�n V� V� Song C�p 1
                                      { tbProp = { 2, 150, 21 }, nStack = 1, nRate = 6.666666666666667 }, -- V� H�nh V� T��ng C�p 1
                                      { tbProp = { 2, 150, 25 }, nStack = 1, nRate = 6.666666666666667 }, -- Kim Linh Ph� Th� C�p 1
                                      { tbProp = { 2, 150, 29 }, nStack = 1, nRate = 6.666666666666667 }, -- M�c Linh Ph� Th� C�p 1
                                      { tbProp = { 2, 150, 33 }, nStack = 1, nRate = 6.666666666666667 }, -- Thu� Linh Ph� Th� C�p 1
                                      { tbProp = { 2, 150, 37 }, nStack = 1, nRate = 6.666666666666667 }, -- Ho� Linh Ph� Th� C�p 1
                                      { tbProp = { 2, 150, 41 }, nStack = 1, nRate = 6.666666666666667 }, -- Th� Linh Ph� Th� C�p 1
                                      { tbProp = { 2, 150, 45 }, nStack = 1, nRate = 6.666666666666667 }, -- Ph� Kh�ng Tr�m �nh C�p 1
                                      { tbProp = { 2, 150, 49 }, nStack = 1, nRate = 6.666666666666667 }, -- S�t th��ng gia n�ng c�p 1
                                      { tbProp = { 2, 150, 53 }, nStack = 1, nRate = 6.666666666666667 }, -- Khinh Linh T�n T�t  C�p 1
                                      { tbProp = { 2, 150, 57 }, nStack = 1, nRate = 6.666666666666667 }, -- V� H�nh Chi C� C�p 1
                                  },
    },
    [PackItemId(2, 1, 40022)] = { szName = "T�i K� N�ng B�H Lv2",
                                  tbItems = {
                                      { tbProp = { 2, 150, 2 }, nStack = 1, nRate = 6.666666666666667 }, -- Ch�n kh� h� th� C�p 2
                                      { tbProp = { 2, 150, 6 }, nStack = 1, nRate = 6.666666666666667 }, -- �ch Th� Di�n D��ng C�p 2
                                      { tbProp = { 2, 150, 10 }, nStack = 1, nRate = 6.666666666666667 }, -- C��ng Th�n B� Th� C�p 2
                                      { tbProp = { 2, 150, 14 }, nStack = 1, nRate = 6.666666666666667 }, -- �m Phong Th�c C�t C�p 2
                                      { tbProp = { 2, 150, 18 }, nStack = 1, nRate = 6.666666666666667 }, -- Huy�n V� V� Song C�p 2
                                      { tbProp = { 2, 150, 22 }, nStack = 1, nRate = 6.666666666666667 }, -- V� H�nh V� T��ng C�p 2
                                      { tbProp = { 2, 150, 26 }, nStack = 1, nRate = 6.666666666666667 }, -- Kim Linh Ph� Th� C�p 2
                                      { tbProp = { 2, 150, 30 }, nStack = 1, nRate = 6.666666666666667 }, -- M�c Linh Ph� Th� C�p 2
                                      { tbProp = { 2, 150, 34 }, nStack = 1, nRate = 6.666666666666667 }, -- Thu� Linh Ph� Th� C�p 2
                                      { tbProp = { 2, 150, 38 }, nStack = 1, nRate = 6.666666666666667 }, -- Ho� Linh Ph� Th� C�p 2
                                      { tbProp = { 2, 150, 42 }, nStack = 1, nRate = 6.666666666666667 }, -- Th� Linh Ph� Th� C�p 2
                                      { tbProp = { 2, 150, 46 }, nStack = 1, nRate = 6.666666666666667 }, -- Ph� Kh�ng Tr�m �nh C�p 2
                                      { tbProp = { 2, 150, 50 }, nStack = 1, nRate = 6.666666666666667 }, -- S�t th��ng gia n�ng c�p 2
                                      { tbProp = { 2, 150, 54 }, nStack = 1, nRate = 6.666666666666667 }, -- Khinh Linh T�n T�t  C�p 2
                                      { tbProp = { 2, 150, 58 }, nStack = 1, nRate = 6.666666666666667 }, -- V� H�nh Chi C� C�p 2
                                  },
    },
    [PackItemId(2, 1, 40023)] = { szName = "T�i K� N�ng B�H Lv3",
                                  tbItems = {
                                      { tbProp = { 2, 150, 3 }, nStack = 1, nRate = 6.666666666666667 }, -- Ch�n kh� h� th� C�p 3
                                      { tbProp = { 2, 150, 7 }, nStack = 1, nRate = 6.666666666666667 }, -- �ch Th� Di�n D��ng C�p 3
                                      { tbProp = { 2, 150, 11 }, nStack = 1, nRate = 6.666666666666667 }, -- C��ng Th�n B� Th� C�p 3
                                      { tbProp = { 2, 150, 15 }, nStack = 1, nRate = 6.666666666666667 }, -- �m Phong Th�c C�t C�p 3
                                      { tbProp = { 2, 150, 19 }, nStack = 1, nRate = 6.666666666666667 }, -- Huy�n V� V� Song C�p 3
                                      { tbProp = { 2, 150, 23 }, nStack = 1, nRate = 6.666666666666667 }, -- V� H�nh V� T��ng C�p 3
                                      { tbProp = { 2, 150, 27 }, nStack = 1, nRate = 6.666666666666667 }, -- Kim Linh Ph� Th� C�p 3
                                      { tbProp = { 2, 150, 31 }, nStack = 1, nRate = 6.666666666666667 }, -- M�c Linh Ph� Th� C�p 3
                                      { tbProp = { 2, 150, 35 }, nStack = 1, nRate = 6.666666666666667 }, -- Thu� Linh Ph� Th� C�p 3
                                      { tbProp = { 2, 150, 39 }, nStack = 1, nRate = 6.666666666666667 }, -- Ho� Linh Ph� Th� C�p 3
                                      { tbProp = { 2, 150, 43 }, nStack = 1, nRate = 6.666666666666667 }, -- Th� Linh Ph� Th� C�p 3
                                      { tbProp = { 2, 150, 47 }, nStack = 1, nRate = 6.666666666666667 }, -- Ph� Kh�ng Tr�m �nh C�p 3
                                      { tbProp = { 2, 150, 51 }, nStack = 1, nRate = 6.666666666666667 }, -- S�t th��ng gia n�ng c�p 3
                                      { tbProp = { 2, 150, 55 }, nStack = 1, nRate = 6.666666666666667 }, -- Khinh Linh T�n T�t  C�p 3
                                      { tbProp = { 2, 150, 59 }, nStack = 1, nRate = 6.666666666666667 }, -- V� H�nh Chi C� C�p 3
                                  },
    },
    [PackItemId(2, 1, 40024)] = { szName = "T�i K� N�ng B�H Lv4",
                                  tbItems = {
                                      { tbProp = { 2, 150, 4 }, nStack = 1, nRate = 6.666666666666667 }, -- Ch�n kh� h� th� C�p 4
                                      { tbProp = { 2, 150, 8 }, nStack = 1, nRate = 6.666666666666667 }, -- �ch Th� Di�n D��ng C�p 4
                                      { tbProp = { 2, 150, 12 }, nStack = 1, nRate = 6.666666666666667 }, -- C��ng Th�n B� Th� C�p 4
                                      { tbProp = { 2, 150, 16 }, nStack = 1, nRate = 6.666666666666667 }, -- �m Phong Th�c C�t C�p 4
                                      { tbProp = { 2, 150, 20 }, nStack = 1, nRate = 6.666666666666667 }, -- Huy�n V� V� Song C�p 4
                                      { tbProp = { 2, 150, 24 }, nStack = 1, nRate = 6.666666666666667 }, -- V� H�nh V� T��ng C�p 4
                                      { tbProp = { 2, 150, 28 }, nStack = 1, nRate = 6.666666666666667 }, -- Kim Linh Ph� Th� C�p 4
                                      { tbProp = { 2, 150, 32 }, nStack = 1, nRate = 6.666666666666667 }, -- M�c Linh Ph� Th� C�p 4
                                      { tbProp = { 2, 150, 36 }, nStack = 1, nRate = 6.666666666666667 }, -- Thu� Linh Ph� Th� C�p 4
                                      { tbProp = { 2, 150, 40 }, nStack = 1, nRate = 6.666666666666667 }, -- Ho� Linh Ph� Th� C�p 4
                                      { tbProp = { 2, 150, 44 }, nStack = 1, nRate = 6.666666666666667 }, -- Th� Linh Ph� Th� C�p 4
                                      { tbProp = { 2, 150, 48 }, nStack = 1, nRate = 6.666666666666667 }, -- Ph� Kh�ng Tr�m �nh C�p 4
                                      { tbProp = { 2, 150, 52 }, nStack = 1, nRate = 6.666666666666667 }, -- S�t th��ng gia n�ng c�p 4
                                      { tbProp = { 2, 150, 56 }, nStack = 1, nRate = 6.666666666666667 }, -- Khinh Linh T�n T�t  C�p 4
                                      { tbProp = { 2, 150, 60 }, nStack = 1, nRate = 6.666666666666667 }, -- V� H�nh Chi C� C�p 4
                                  },
    },
    [PackItemId(2, 1, 40025)] = { szName = "T�i K� N�ng B�H Lv5",
                                  tbItems = {
                                      { tbProp = { 2, 150, 82 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Linh Quang Nh�t Thi�m C�p 1
                                      { tbProp = { 2, 150, 83 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Ng�ng Th�n Quy�t C�p 1
                                      { tbProp = { 2, 150, 84 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Kinh ��o Quy�t C�p 1
                                      { tbProp = { 2, 150, 85 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Nguy�n Th�y B�o N� C�p 1
                                      { tbProp = { 2, 150, 86 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Thi�t B� Sam C�p 1
                                      { tbProp = { 2, 150, 67 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Ch�n kh� h� th� C�p 5
                                      { tbProp = { 2, 150, 68 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- �ch Th� Di�n D��ng C�p 5
                                      { tbProp = { 2, 150, 69 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- C��ng Th�n B� Th� C�p 5
                                      { tbProp = { 2, 150, 70 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- �m Phong Th�c C�t C�p 5
                                      { tbProp = { 2, 150, 71 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Huy�n V� V� Song C�p 5
                                      { tbProp = { 2, 150, 72 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- V� H�nh V� T��ng C�p 5
                                      { tbProp = { 2, 150, 73 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Kim Linh Ph� Th� C�p 5
                                      { tbProp = { 2, 150, 74 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- M�c Linh Ph� Th� C�p 5
                                      { tbProp = { 2, 150, 75 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Thu� Linh Ph� Th� C�p 5
                                      { tbProp = { 2, 150, 76 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Ho� Linh Ph� Th� C�p 5
                                      { tbProp = { 2, 150, 77 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Th� Linh Ph� Th� C�p 5
                                      { tbProp = { 2, 150, 78 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Ph� Kh�ng Tr�m �nh C�p 5
                                      { tbProp = { 2, 150, 79 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- S�t th��ng gia n�ng c�p 5
                                      { tbProp = { 2, 150, 80 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Khinh Linh T�n T�t  C�p 5
                                      { tbProp = { 2, 150, 81 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- V� H�nh Chi C� C�p 5
                                  },
    },
    [PackItemId(2, 1, 40027)] = { szName = "T�i Linh Chi T�c M�nh Ho�n",
                                  tbItems = {
                                      { tbProp = { 1, 0, 30012 }, nStack = 10 }, -- Linh Chi T�c M�nh Ho�n
                                  },
    },
    [PackItemId(2, 1, 40028)] = { szName = "T�i Dao Tr� ��i Ho�n ��n",
                                  tbItems = {
                                      { tbProp = { 1, 0, 30013 }, nStack = 10 }, -- Dao Tr� ��i Ho�n ��n
                                  },
    },
    [PackItemId(2, 1, 40029)] = { szName = "T�i Tuy�t S�m Ph�n Kh� Ho�n",
                                  tbItems = {
                                      { tbProp = { 1, 0, 30014 }, nStack = 10 }, -- Tuy�t S�m Ph�n Kh� Ho�n
                                  },
    },
    [PackItemId(2, 1, 40031)] = { szName = "R��ng Thi�n Th�ch Tinh Th�ch Kh�a",
                                  tbItems = {
                                      { tbProp = { 2, 1, 1009 }, nStack = 100, nStatus = 4 }, -- Thi�n Th�ch Tinh Th�ch
                                  },
    },
    [PackItemId(2, 1, 40037)] = { szName = "T�i K� N�ng B�H Lv6",
                                  tbItems = {
                                      { tbProp = { 2, 150, 102 }, nStack = 1, nRate = 5.0 }, -- Linh Quang Thi�m Lv2
                                      { tbProp = { 2, 150, 103 }, nStack = 1, nRate = 5.0 }, -- Ng�ng Th�n Quy�t Lv2
                                      { tbProp = { 2, 150, 104 }, nStack = 1, nRate = 5.0 }, -- Kinh ��o Quy�t Lv2
                                      { tbProp = { 2, 150, 105 }, nStack = 1, nRate = 5.0 }, -- Nguy�n Th�y B�o N� Lv2
                                      { tbProp = { 2, 150, 106 }, nStack = 1, nRate = 5.0 }, -- Thi�t B� Sam Lv2
                                      { tbProp = { 2, 150, 87 }, nStack = 1, nRate = 5.0 }, -- Ch�n Kh� H� Th� Lv6
                                      { tbProp = { 2, 150, 88 }, nStack = 1, nRate = 5.0 }, -- �ch Th� Di�n D��ng Lv6
                                      { tbProp = { 2, 150, 89 }, nStack = 1, nRate = 5.0 }, -- C��ng Th�n B� Th� Lv6
                                      { tbProp = { 2, 150, 90 }, nStack = 1, nRate = 5.0 }, -- �m Phong Th�c C�t Lv6
                                      { tbProp = { 2, 150, 91 }, nStack = 1, nRate = 5.0 }, -- Huy�n V� V� Song Lv6
                                      { tbProp = { 2, 150, 92 }, nStack = 1, nRate = 5.0 }, -- Ng� H�nh V� T��ng Lv6
                                      { tbProp = { 2, 150, 93 }, nStack = 1, nRate = 5.0 }, -- Kim Linh Ph� Th� Lv6
                                      { tbProp = { 2, 150, 94 }, nStack = 1, nRate = 5.0 }, -- M�c Linh Ph� Th� Lv6
                                      { tbProp = { 2, 150, 95 }, nStack = 1, nRate = 5.0 }, -- Th�y Linh Ph� Th� Lv6
                                      { tbProp = { 2, 150, 96 }, nStack = 1, nRate = 5.0 }, -- H�a Linh Ph� Th� Lv6
                                      { tbProp = { 2, 150, 97 }, nStack = 1, nRate = 5.0 }, -- Th� Linh Ph� Th� Lv6
                                      { tbProp = { 2, 150, 98 }, nStack = 1, nRate = 5.0 }, -- Ph� Kh�ng Tr�m �nh Lv6
                                      { tbProp = { 2, 150, 99 }, nStack = 1, nRate = 5.0 }, -- S�t Th��ng Gia T�ng Lv6
                                      { tbProp = { 2, 150, 100 }, nStack = 1, nRate = 5.0 }, -- Khinh Linh T�n T�t Lv6
                                      { tbProp = { 2, 150, 101 }, nStack = 1, nRate = 5.0 }, -- V� H�nh Chi C� Lv6
                                  },
    },
    [PackItemId(2, 1, 40038)] = { szName = "T�i K� N�ng B�H Lv7",
                                  tbItems = {
                                      { tbProp = { 2, 150, 107 }, nStack = 1, nRate = 5.0 }, -- Ch�n Kh� H� Th� Lv7
                                      { tbProp = { 2, 150, 108 }, nStack = 1, nRate = 5.0 }, -- �ch Th� Di�n D��ng Lv7
                                      { tbProp = { 2, 150, 109 }, nStack = 1, nRate = 5.0 }, -- C��ng Th�n B� Th� Lv7
                                      { tbProp = { 2, 150, 110 }, nStack = 1, nRate = 5.0 }, -- �m Phong Th�c C�t Lv7
                                      { tbProp = { 2, 150, 111 }, nStack = 1, nRate = 5.0 }, -- Huy�n V� V� Song Lv7
                                      { tbProp = { 2, 150, 112 }, nStack = 1, nRate = 5.0 }, -- Ng� H�nh V� T��ng Lv7
                                      { tbProp = { 2, 150, 113 }, nStack = 1, nRate = 5.0 }, -- Kim Linh Ph� Th� Lv7
                                      { tbProp = { 2, 150, 114 }, nStack = 1, nRate = 5.0 }, -- M�c Linh Ph� Th� Lv7
                                      { tbProp = { 2, 150, 115 }, nStack = 1, nRate = 5.0 }, -- Th�y Linh Ph� Th� Lv7
                                      { tbProp = { 2, 150, 116 }, nStack = 1, nRate = 5.0 }, -- H�a Linh Ph� Th� Lv7
                                      { tbProp = { 2, 150, 117 }, nStack = 1, nRate = 5.0 }, -- Th� Linh Ph� Th� Lv7
                                      { tbProp = { 2, 150, 118 }, nStack = 1, nRate = 5.0 }, -- Ph� Kh�ng Tr�m �nh Lv7
                                      { tbProp = { 2, 150, 119 }, nStack = 1, nRate = 5.0 }, -- S�t Th��ng Gia T�ng Lv7
                                      { tbProp = { 2, 150, 120 }, nStack = 1, nRate = 5.0 }, -- Khinh Linh T�n T�t Lv7
                                      { tbProp = { 2, 150, 121 }, nStack = 1, nRate = 5.0 }, -- V� H�nh Chi C� Lv7
                                      { tbProp = { 2, 150, 122 }, nStack = 1, nRate = 5.0 }, -- Linh Quang Thi�m Lv3
                                      { tbProp = { 2, 150, 123 }, nStack = 1, nRate = 5.0 }, -- Ng�ng Th�n Quy�t Lv3
                                      { tbProp = { 2, 150, 124 }, nStack = 1, nRate = 5.0 }, -- Kinh ��o Quy�t Lv3
                                      { tbProp = { 2, 150, 125 }, nStack = 1, nRate = 5.0 }, -- Nguy�n Th�y B�o N� Lv3
                                      { tbProp = { 2, 150, 126 }, nStack = 1, nRate = 5.0 }, -- Thi�t B� Sam Lv3
                                  },
    },
    [PackItemId(2, 1, 40044)] = { szName = "T�i B�ng Th�ch",
                                  tbItems = {
                                      { tbProp = { 2, 1, 149 }, nStack = 100 }, -- B�ng Th�ch
                                  },
    },
    [PackItemId(2, 1, 40045)] = { szName = "T�i M�nh B�ng Th�ch",
                                  tbItems = {
                                      { tbProp = { 2, 1, 148 }, nStack = 100 }, -- M�nh B�ng Th�ch
                                  },
    },
    [PackItemId(2, 1, 40051)] = { szName = "T�i T�y T�m Th�ch Lv6",
                                  tbItems = {
                                      { tbProp = { 2, 1, 30526 }, nStack = 100 }, -- T�y T�m Th�ch Lv6
                                  },
    },
    [PackItemId(2, 1, 40052)] = { szName = "T�i Luy�n L� Thi�t Lv6",
                                  tbItems = {
                                      { tbProp = { 2, 1, 30532 }, nStack = 100 }, -- Luy�n L� Thi�t Lv6
                                  },
    },
    [PackItemId(2, 1, 40054)] = { szName = "T�i Nguy�t Hoa Chi Tinh",
                                  tbItems = {
                                      { tbProp = { 2, 1, 3219 }, nStack = 100 }, -- Nguy�t Hoa Chi Tinh
                                  },
    },
    [PackItemId(2, 1, 40056)] = { szName = "T�i M�nh B� �i�n 25",
                                  tbItems = {
                                      { tbProp = { 2, 1, 40047 }, nStack = 100 }, -- M�nh B� �i�n 25
                                  },
    },
    [PackItemId(2, 1, 40057)] = { szName = "T�i M�nh B� �i�n 27",
                                  tbItems = {
                                      { tbProp = { 2, 1, 40048 }, nStack = 100 }, -- M�nh B� �i�n 27
                                  },
    },
    [PackItemId(2, 1, 40058)] = { szName = "T�i M�nh B� �i�n 30",
                                  tbItems = {
                                      { tbProp = { 2, 1, 40049 }, nStack = 100 }, -- M�nh B� �i�n 30
                                  },
    },
    [PackItemId(2, 1, 40059)] = { szName = "T�i M�nh B� �i�n 32",
                                  tbItems = {
                                      { tbProp = { 2, 1, 40050 }, nStack = 100 }, -- M�nh B� �i�n 32
                                  },
    },
    [PackItemId(2, 1, 40060)] = { szName = "T�i M�nh T�y Bi�n Ch�u 7",
                                  tbItems = {
                                      { tbProp = { 2, 1, 40046 }, nStack = 100 }, -- M�nh T�y Bi�n Ch�u 7
                                  },
    },
    [PackItemId(2, 1, 40061)] = { szName = "R��ng M�nh T�y Bi�n Ch�u 7",
                                  tbItems = {
                                      { tbProp = { 2, 1, 40046 }, nStack = 1000 }, -- M�nh T�y Bi�n Ch�u 7
                                  },
    },
    [PackItemId(2, 1, 40117)] = { szName = "T�i Thi�n V�n Th�ch",
                                  tbItems = {
                                      { tbProp = { 2, 201, 13 }, nStack = 5 }, -- Thi�n V�n Th�ch
                                  },
    },
    [PackItemId(2, 1, 40118)] = { szName = "T�i T�y T�m Th�ch Lv7",
                                  tbItems = {
                                      { tbProp = { 2, 1, 31402 }, nStack = 10 }, -- T�y T�m Th�ch Lv7
                                  },
    },
    [PackItemId(2, 1, 40119)] = { szName = "T�i Luy�n L� Thi�t Lv7",
                                  tbItems = {
                                      { tbProp = { 2, 1, 31401 }, nStack = 10 }, -- Luy�n L� Thi�t Lv7
                                  },
    },
    [PackItemId(2, 1, 40120)] = { szName = "T�i Thi�n Cang L�nh",
                                  tbItems = {
                                      { tbProp = { 2, 95, 204 }, nStack = 10 }, -- Thi�n Cang L�nh
                                  },
    },
    [PackItemId(2, 1, 40121)] = { szName = "T�i Thi�n M�n Kim L�nh",
                                  tbItems = {
                                      { tbProp = { 2, 1, 30370 }, nStack = 10 }, -- Thi�n M�n Kim L�nh
                                  },
    },
}

function OnUse(nItemIdx)
    if WLib:CheckInv(5, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
    local nPackItemtId = PackItemId(nGenre, nDetail, nParticular);
    if m_tbPackItemList[nPackItemtId] ~= WEnv.NULL then
        if WItem:DelByIndex(nItemIdx, 1) == WEnv.RETCODE_SUCCESS then
            WAward:Give(m_tbPackItemList[nPackItemtId].tbItems, m_tbPackItemList[nPackItemtId].szName);
            return WEnv.RETCODE_SUCCESS;
        else
            WNpc:Talk("Thu h�i th�t b�i.", 1);
            return WEnv.RETCODE_CONSUMEERROR;
        end
    else
        WNpc:Talk("B�n trong tr�ng r�ng, kh�ng thu ���c g�.", 1);
        return WEnv.RETCODE_CONSUMEERROR;
    end
end
