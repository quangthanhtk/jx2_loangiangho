----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item tói/r­¬ng më ra c¸c vËt phÈm con
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_tbPackItemList = {
    [PackItemId(2, 1, 40021)] = { szName = "Tói Kü N¨ng B§H Lv1",
                                  tbItems = {
                                      { tbProp = { 2, 150, 1 }, nStack = 1, nRate = 6.666666666666667 }, -- Ch©n khÝ hé thÓ CÊp 1
                                      { tbProp = { 2, 150, 5 }, nStack = 1, nRate = 6.666666666666667 }, -- Ých Thä Diªn D­¬ng CÊp 1
                                      { tbProp = { 2, 150, 9 }, nStack = 1, nRate = 6.666666666666667 }, -- C­êng Th©n B¸ ThÓ CÊp 1
                                      { tbProp = { 2, 150, 13 }, nStack = 1, nRate = 6.666666666666667 }, -- ¢m Phong Thùc Cèt CÊp 1
                                      { tbProp = { 2, 150, 17 }, nStack = 1, nRate = 6.666666666666667 }, -- HuyÒn Vò V« Song CÊp 1
                                      { tbProp = { 2, 150, 21 }, nStack = 1, nRate = 6.666666666666667 }, -- V« Hµnh V« T­¬ng CÊp 1
                                      { tbProp = { 2, 150, 25 }, nStack = 1, nRate = 6.666666666666667 }, -- Kim Linh Phô ThÓ CÊp 1
                                      { tbProp = { 2, 150, 29 }, nStack = 1, nRate = 6.666666666666667 }, -- Méc Linh Phô ThÓ CÊp 1
                                      { tbProp = { 2, 150, 33 }, nStack = 1, nRate = 6.666666666666667 }, -- Thuû Linh Phô ThÓ CÊp 1
                                      { tbProp = { 2, 150, 37 }, nStack = 1, nRate = 6.666666666666667 }, -- Ho¶ Linh Phô ThÓ CÊp 1
                                      { tbProp = { 2, 150, 41 }, nStack = 1, nRate = 6.666666666666667 }, -- Thæ Linh Phô ThÓ CÊp 1
                                      { tbProp = { 2, 150, 45 }, nStack = 1, nRate = 6.666666666666667 }, -- Ph¸ Kh«ng Tr¶m ¶nh CÊp 1
                                      { tbProp = { 2, 150, 49 }, nStack = 1, nRate = 6.666666666666667 }, -- S¸t th­¬ng gia n©ng cÊp 1
                                      { tbProp = { 2, 150, 53 }, nStack = 1, nRate = 6.666666666666667 }, -- Khinh Linh TÊn TËt  CÊp 1
                                      { tbProp = { 2, 150, 57 }, nStack = 1, nRate = 6.666666666666667 }, -- V« H×nh Chi Cæ CÊp 1
                                  },
    },
    [PackItemId(2, 1, 40022)] = { szName = "Tói Kü N¨ng B§H Lv2",
                                  tbItems = {
                                      { tbProp = { 2, 150, 2 }, nStack = 1, nRate = 6.666666666666667 }, -- Ch©n khÝ hé thÓ CÊp 2
                                      { tbProp = { 2, 150, 6 }, nStack = 1, nRate = 6.666666666666667 }, -- Ých Thä Diªn D­¬ng CÊp 2
                                      { tbProp = { 2, 150, 10 }, nStack = 1, nRate = 6.666666666666667 }, -- C­êng Th©n B¸ ThÓ CÊp 2
                                      { tbProp = { 2, 150, 14 }, nStack = 1, nRate = 6.666666666666667 }, -- ¢m Phong Thùc Cèt CÊp 2
                                      { tbProp = { 2, 150, 18 }, nStack = 1, nRate = 6.666666666666667 }, -- HuyÒn Vò V« Song CÊp 2
                                      { tbProp = { 2, 150, 22 }, nStack = 1, nRate = 6.666666666666667 }, -- V« Hµnh V« T­¬ng CÊp 2
                                      { tbProp = { 2, 150, 26 }, nStack = 1, nRate = 6.666666666666667 }, -- Kim Linh Phô ThÓ CÊp 2
                                      { tbProp = { 2, 150, 30 }, nStack = 1, nRate = 6.666666666666667 }, -- Méc Linh Phô ThÓ CÊp 2
                                      { tbProp = { 2, 150, 34 }, nStack = 1, nRate = 6.666666666666667 }, -- Thuû Linh Phô ThÓ CÊp 2
                                      { tbProp = { 2, 150, 38 }, nStack = 1, nRate = 6.666666666666667 }, -- Ho¶ Linh Phô ThÓ CÊp 2
                                      { tbProp = { 2, 150, 42 }, nStack = 1, nRate = 6.666666666666667 }, -- Thæ Linh Phô ThÓ CÊp 2
                                      { tbProp = { 2, 150, 46 }, nStack = 1, nRate = 6.666666666666667 }, -- Ph¸ Kh«ng Tr¶m ¶nh CÊp 2
                                      { tbProp = { 2, 150, 50 }, nStack = 1, nRate = 6.666666666666667 }, -- S¸t th­¬ng gia n©ng cÊp 2
                                      { tbProp = { 2, 150, 54 }, nStack = 1, nRate = 6.666666666666667 }, -- Khinh Linh TÊn TËt  CÊp 2
                                      { tbProp = { 2, 150, 58 }, nStack = 1, nRate = 6.666666666666667 }, -- V« H×nh Chi Cæ CÊp 2
                                  },
    },
    [PackItemId(2, 1, 40023)] = { szName = "Tói Kü N¨ng B§H Lv3",
                                  tbItems = {
                                      { tbProp = { 2, 150, 3 }, nStack = 1, nRate = 6.666666666666667 }, -- Ch©n khÝ hé thÓ CÊp 3
                                      { tbProp = { 2, 150, 7 }, nStack = 1, nRate = 6.666666666666667 }, -- Ých Thä Diªn D­¬ng CÊp 3
                                      { tbProp = { 2, 150, 11 }, nStack = 1, nRate = 6.666666666666667 }, -- C­êng Th©n B¸ ThÓ CÊp 3
                                      { tbProp = { 2, 150, 15 }, nStack = 1, nRate = 6.666666666666667 }, -- ¢m Phong Thùc Cèt CÊp 3
                                      { tbProp = { 2, 150, 19 }, nStack = 1, nRate = 6.666666666666667 }, -- HuyÒn Vò V« Song CÊp 3
                                      { tbProp = { 2, 150, 23 }, nStack = 1, nRate = 6.666666666666667 }, -- V« Hµnh V« T­¬ng CÊp 3
                                      { tbProp = { 2, 150, 27 }, nStack = 1, nRate = 6.666666666666667 }, -- Kim Linh Phô ThÓ CÊp 3
                                      { tbProp = { 2, 150, 31 }, nStack = 1, nRate = 6.666666666666667 }, -- Méc Linh Phô ThÓ CÊp 3
                                      { tbProp = { 2, 150, 35 }, nStack = 1, nRate = 6.666666666666667 }, -- Thuû Linh Phô ThÓ CÊp 3
                                      { tbProp = { 2, 150, 39 }, nStack = 1, nRate = 6.666666666666667 }, -- Ho¶ Linh Phô ThÓ CÊp 3
                                      { tbProp = { 2, 150, 43 }, nStack = 1, nRate = 6.666666666666667 }, -- Thæ Linh Phô ThÓ CÊp 3
                                      { tbProp = { 2, 150, 47 }, nStack = 1, nRate = 6.666666666666667 }, -- Ph¸ Kh«ng Tr¶m ¶nh CÊp 3
                                      { tbProp = { 2, 150, 51 }, nStack = 1, nRate = 6.666666666666667 }, -- S¸t th­¬ng gia n©ng cÊp 3
                                      { tbProp = { 2, 150, 55 }, nStack = 1, nRate = 6.666666666666667 }, -- Khinh Linh TÊn TËt  CÊp 3
                                      { tbProp = { 2, 150, 59 }, nStack = 1, nRate = 6.666666666666667 }, -- V« H×nh Chi Cæ CÊp 3
                                  },
    },
    [PackItemId(2, 1, 40024)] = { szName = "Tói Kü N¨ng B§H Lv4",
                                  tbItems = {
                                      { tbProp = { 2, 150, 4 }, nStack = 1, nRate = 6.666666666666667 }, -- Ch©n khÝ hé thÓ CÊp 4
                                      { tbProp = { 2, 150, 8 }, nStack = 1, nRate = 6.666666666666667 }, -- Ých Thä Diªn D­¬ng CÊp 4
                                      { tbProp = { 2, 150, 12 }, nStack = 1, nRate = 6.666666666666667 }, -- C­êng Th©n B¸ ThÓ CÊp 4
                                      { tbProp = { 2, 150, 16 }, nStack = 1, nRate = 6.666666666666667 }, -- ¢m Phong Thùc Cèt CÊp 4
                                      { tbProp = { 2, 150, 20 }, nStack = 1, nRate = 6.666666666666667 }, -- HuyÒn Vò V« Song CÊp 4
                                      { tbProp = { 2, 150, 24 }, nStack = 1, nRate = 6.666666666666667 }, -- V« Hµnh V« T­¬ng CÊp 4
                                      { tbProp = { 2, 150, 28 }, nStack = 1, nRate = 6.666666666666667 }, -- Kim Linh Phô ThÓ CÊp 4
                                      { tbProp = { 2, 150, 32 }, nStack = 1, nRate = 6.666666666666667 }, -- Méc Linh Phô ThÓ CÊp 4
                                      { tbProp = { 2, 150, 36 }, nStack = 1, nRate = 6.666666666666667 }, -- Thuû Linh Phô ThÓ CÊp 4
                                      { tbProp = { 2, 150, 40 }, nStack = 1, nRate = 6.666666666666667 }, -- Ho¶ Linh Phô ThÓ CÊp 4
                                      { tbProp = { 2, 150, 44 }, nStack = 1, nRate = 6.666666666666667 }, -- Thæ Linh Phô ThÓ CÊp 4
                                      { tbProp = { 2, 150, 48 }, nStack = 1, nRate = 6.666666666666667 }, -- Ph¸ Kh«ng Tr¶m ¶nh CÊp 4
                                      { tbProp = { 2, 150, 52 }, nStack = 1, nRate = 6.666666666666667 }, -- S¸t th­¬ng gia n©ng cÊp 4
                                      { tbProp = { 2, 150, 56 }, nStack = 1, nRate = 6.666666666666667 }, -- Khinh Linh TÊn TËt  CÊp 4
                                      { tbProp = { 2, 150, 60 }, nStack = 1, nRate = 6.666666666666667 }, -- V« H×nh Chi Cæ CÊp 4
                                  },
    },
    [PackItemId(2, 1, 40025)] = { szName = "Tói Kü N¨ng B§H Lv5",
                                  tbItems = {
                                      { tbProp = { 2, 150, 82 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Linh Quang NhÊt ThiÓm CÊp 1
                                      { tbProp = { 2, 150, 83 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Ng­ng ThÇn QuyÕt CÊp 1
                                      { tbProp = { 2, 150, 84 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Kinh §µo QuyÕt CÊp 1
                                      { tbProp = { 2, 150, 85 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Nguyªn Thñy B¹o Né CÊp 1
                                      { tbProp = { 2, 150, 86 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- ThiÕt Bè Sam CÊp 1
                                      { tbProp = { 2, 150, 67 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Ch©n khÝ hé thÓ CÊp 5
                                      { tbProp = { 2, 150, 68 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Ých Thä Diªn D­¬ng CÊp 5
                                      { tbProp = { 2, 150, 69 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- C­êng Th©n B¸ ThÓ CÊp 5
                                      { tbProp = { 2, 150, 70 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- ¢m Phong Thùc Cèt CÊp 5
                                      { tbProp = { 2, 150, 71 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- HuyÒn Vò V« Song CÊp 5
                                      { tbProp = { 2, 150, 72 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- V« Hµnh V« T­¬ng CÊp 5
                                      { tbProp = { 2, 150, 73 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Kim Linh Phô ThÓ CÊp 5
                                      { tbProp = { 2, 150, 74 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Méc Linh Phô ThÓ CÊp 5
                                      { tbProp = { 2, 150, 75 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Thuû Linh Phô ThÓ CÊp 5
                                      { tbProp = { 2, 150, 76 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Ho¶ Linh Phô ThÓ CÊp 5
                                      { tbProp = { 2, 150, 77 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Thæ Linh Phô ThÓ CÊp 5
                                      { tbProp = { 2, 150, 78 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Ph¸ Kh«ng Tr¶m ¶nh CÊp 5
                                      { tbProp = { 2, 150, 79 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- S¸t th­¬ng gia n©ng cÊp 5
                                      { tbProp = { 2, 150, 80 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- Khinh Linh TÊn TËt  CÊp 5
                                      { tbProp = { 2, 150, 81 }, nStack = 1, nStatus = 4, nRate = 5.0 }, -- V« H×nh Chi Cæ CÊp 5
                                  },
    },
    [PackItemId(2, 1, 40027)] = { szName = "Tói Linh Chi Tôc MÖnh Hoµn",
                                  tbItems = {
                                      { tbProp = { 1, 0, 30012 }, nStack = 10 }, -- Linh Chi Tôc MÖnh Hoµn
                                  },
    },
    [PackItemId(2, 1, 40028)] = { szName = "Tói Dao Tr× §¹i Hoµn §¬n",
                                  tbItems = {
                                      { tbProp = { 1, 0, 30013 }, nStack = 10 }, -- Dao Tr× §¹i Hoµn §¬n
                                  },
    },
    [PackItemId(2, 1, 40029)] = { szName = "Tói TuyÕt S©m Ph¶n KhÝ Hoµn",
                                  tbItems = {
                                      { tbProp = { 1, 0, 30014 }, nStack = 10 }, -- TuyÕt S©m Ph¶n KhÝ Hoµn
                                  },
    },
    [PackItemId(2, 1, 40031)] = { szName = "R­¬ng Thiªn Th¹ch Tinh Th¹ch Khãa",
                                  tbItems = {
                                      { tbProp = { 2, 1, 1009 }, nStack = 100, nStatus = 4 }, -- Thiªn Th¹ch Tinh Th¹ch
                                  },
    },
    [PackItemId(2, 1, 40037)] = { szName = "Tói Kü N¨ng B§H Lv6",
                                  tbItems = {
                                      { tbProp = { 2, 150, 102 }, nStack = 1, nRate = 5.0 }, -- Linh Quang ThiÓm Lv2
                                      { tbProp = { 2, 150, 103 }, nStack = 1, nRate = 5.0 }, -- Ng­ng ThÇn QuyÕt Lv2
                                      { tbProp = { 2, 150, 104 }, nStack = 1, nRate = 5.0 }, -- Kinh §µo QuyÕt Lv2
                                      { tbProp = { 2, 150, 105 }, nStack = 1, nRate = 5.0 }, -- Nguyªn Thñy B¹o Né Lv2
                                      { tbProp = { 2, 150, 106 }, nStack = 1, nRate = 5.0 }, -- ThiÕt Bè Sam Lv2
                                      { tbProp = { 2, 150, 87 }, nStack = 1, nRate = 5.0 }, -- Ch©n KhÝ Hé ThÓ Lv6
                                      { tbProp = { 2, 150, 88 }, nStack = 1, nRate = 5.0 }, -- Ých Thä Diªn D­¬ng Lv6
                                      { tbProp = { 2, 150, 89 }, nStack = 1, nRate = 5.0 }, -- C­êng Th©n B¸ ThÓ Lv6
                                      { tbProp = { 2, 150, 90 }, nStack = 1, nRate = 5.0 }, -- ¢m Phong Thùc Cèt Lv6
                                      { tbProp = { 2, 150, 91 }, nStack = 1, nRate = 5.0 }, -- HuyÒn Vò V« Song Lv6
                                      { tbProp = { 2, 150, 92 }, nStack = 1, nRate = 5.0 }, -- Ngò Hµnh V« T­íng Lv6
                                      { tbProp = { 2, 150, 93 }, nStack = 1, nRate = 5.0 }, -- Kim Linh Phô ThÓ Lv6
                                      { tbProp = { 2, 150, 94 }, nStack = 1, nRate = 5.0 }, -- Méc Linh Phô ThÓ Lv6
                                      { tbProp = { 2, 150, 95 }, nStack = 1, nRate = 5.0 }, -- Thñy Linh Phô ThÓ Lv6
                                      { tbProp = { 2, 150, 96 }, nStack = 1, nRate = 5.0 }, -- Háa Linh Phô ThÓ Lv6
                                      { tbProp = { 2, 150, 97 }, nStack = 1, nRate = 5.0 }, -- Thæ Linh Phô ThÓ Lv6
                                      { tbProp = { 2, 150, 98 }, nStack = 1, nRate = 5.0 }, -- Ph¸ Kh«ng Tr¶m ¶nh Lv6
                                      { tbProp = { 2, 150, 99 }, nStack = 1, nRate = 5.0 }, -- S¸t Th­¬ng Gia T¨ng Lv6
                                      { tbProp = { 2, 150, 100 }, nStack = 1, nRate = 5.0 }, -- Khinh Linh TÊn TËt Lv6
                                      { tbProp = { 2, 150, 101 }, nStack = 1, nRate = 5.0 }, -- V« H×nh Chi Cæ Lv6
                                  },
    },
    [PackItemId(2, 1, 40038)] = { szName = "Tói Kü N¨ng B§H Lv7",
                                  tbItems = {
                                      { tbProp = { 2, 150, 107 }, nStack = 1, nRate = 5.0 }, -- Ch©n KhÝ Hé ThÓ Lv7
                                      { tbProp = { 2, 150, 108 }, nStack = 1, nRate = 5.0 }, -- Ých Thä Diªn D­¬ng Lv7
                                      { tbProp = { 2, 150, 109 }, nStack = 1, nRate = 5.0 }, -- C­êng Th©n B¸ ThÓ Lv7
                                      { tbProp = { 2, 150, 110 }, nStack = 1, nRate = 5.0 }, -- ¢m Phong Thùc Cèt Lv7
                                      { tbProp = { 2, 150, 111 }, nStack = 1, nRate = 5.0 }, -- HuyÒn Vò V« Song Lv7
                                      { tbProp = { 2, 150, 112 }, nStack = 1, nRate = 5.0 }, -- Ngò Hµnh V« T­íng Lv7
                                      { tbProp = { 2, 150, 113 }, nStack = 1, nRate = 5.0 }, -- Kim Linh Phô ThÓ Lv7
                                      { tbProp = { 2, 150, 114 }, nStack = 1, nRate = 5.0 }, -- Méc Linh Phô ThÓ Lv7
                                      { tbProp = { 2, 150, 115 }, nStack = 1, nRate = 5.0 }, -- Thñy Linh Phô ThÓ Lv7
                                      { tbProp = { 2, 150, 116 }, nStack = 1, nRate = 5.0 }, -- Háa Linh Phô ThÓ Lv7
                                      { tbProp = { 2, 150, 117 }, nStack = 1, nRate = 5.0 }, -- Thæ Linh Phô ThÓ Lv7
                                      { tbProp = { 2, 150, 118 }, nStack = 1, nRate = 5.0 }, -- Ph¸ Kh«ng Tr¶m ¶nh Lv7
                                      { tbProp = { 2, 150, 119 }, nStack = 1, nRate = 5.0 }, -- S¸t Th­¬ng Gia T¨ng Lv7
                                      { tbProp = { 2, 150, 120 }, nStack = 1, nRate = 5.0 }, -- Khinh Linh TÊn TËt Lv7
                                      { tbProp = { 2, 150, 121 }, nStack = 1, nRate = 5.0 }, -- V« H×nh Chi Cæ Lv7
                                      { tbProp = { 2, 150, 122 }, nStack = 1, nRate = 5.0 }, -- Linh Quang ThiÓm Lv3
                                      { tbProp = { 2, 150, 123 }, nStack = 1, nRate = 5.0 }, -- Ng­ng ThÇn QuyÕt Lv3
                                      { tbProp = { 2, 150, 124 }, nStack = 1, nRate = 5.0 }, -- Kinh §µo QuyÕt Lv3
                                      { tbProp = { 2, 150, 125 }, nStack = 1, nRate = 5.0 }, -- Nguyªn Thñy B¹o Né Lv3
                                      { tbProp = { 2, 150, 126 }, nStack = 1, nRate = 5.0 }, -- ThiÕt Bè Sam Lv3
                                  },
    },
    [PackItemId(2, 1, 40044)] = { szName = "Tói B¨ng Th¹ch",
                                  tbItems = {
                                      { tbProp = { 2, 1, 149 }, nStack = 100 }, -- B¨ng Th¹ch
                                  },
    },
    [PackItemId(2, 1, 40045)] = { szName = "Tói M¶nh B¨ng Th¹ch",
                                  tbItems = {
                                      { tbProp = { 2, 1, 148 }, nStack = 100 }, -- M¶nh B¨ng Th¹ch
                                  },
    },
    [PackItemId(2, 1, 40051)] = { szName = "Tói TÈy T©m Th¹ch Lv6",
                                  tbItems = {
                                      { tbProp = { 2, 1, 30526 }, nStack = 100 }, -- TÈy T©m Th¹ch Lv6
                                  },
    },
    [PackItemId(2, 1, 40052)] = { szName = "Tói LuyÖn L« ThiÕt Lv6",
                                  tbItems = {
                                      { tbProp = { 2, 1, 30532 }, nStack = 100 }, -- LuyÖn L« ThiÕt Lv6
                                  },
    },
    [PackItemId(2, 1, 40054)] = { szName = "Tói NguyÖt Hoa Chi Tinh",
                                  tbItems = {
                                      { tbProp = { 2, 1, 3219 }, nStack = 100 }, -- NguyÖt Hoa Chi Tinh
                                  },
    },
    [PackItemId(2, 1, 40056)] = { szName = "Tói M¶nh BÝ §iÓn 25",
                                  tbItems = {
                                      { tbProp = { 2, 1, 40047 }, nStack = 100 }, -- M¶nh BÝ §iÓn 25
                                  },
    },
    [PackItemId(2, 1, 40057)] = { szName = "Tói M¶nh BÝ §iÓn 27",
                                  tbItems = {
                                      { tbProp = { 2, 1, 40048 }, nStack = 100 }, -- M¶nh BÝ §iÓn 27
                                  },
    },
    [PackItemId(2, 1, 40058)] = { szName = "Tói M¶nh BÝ §iÓn 30",
                                  tbItems = {
                                      { tbProp = { 2, 1, 40049 }, nStack = 100 }, -- M¶nh BÝ §iÓn 30
                                  },
    },
    [PackItemId(2, 1, 40059)] = { szName = "Tói M¶nh BÝ §iÓn 32",
                                  tbItems = {
                                      { tbProp = { 2, 1, 40050 }, nStack = 100 }, -- M¶nh BÝ §iÓn 32
                                  },
    },
    [PackItemId(2, 1, 40060)] = { szName = "Tói M¶nh Tïy BiÕn Ch©u 7",
                                  tbItems = {
                                      { tbProp = { 2, 1, 40046 }, nStack = 100 }, -- M¶nh Tïy BiÕn Ch©u 7
                                  },
    },
    [PackItemId(2, 1, 40061)] = { szName = "R­¬ng M¶nh Tïy BiÕn Ch©u 7",
                                  tbItems = {
                                      { tbProp = { 2, 1, 40046 }, nStack = 1000 }, -- M¶nh Tïy BiÕn Ch©u 7
                                  },
    },
    [PackItemId(2, 1, 40117)] = { szName = "Tói Thiªn V¨n Th¹ch",
                                  tbItems = {
                                      { tbProp = { 2, 201, 13 }, nStack = 5 }, -- Thiªn V¨n Th¹ch
                                  },
    },
    [PackItemId(2, 1, 40118)] = { szName = "Tói TÈy T©m Th¹ch Lv7",
                                  tbItems = {
                                      { tbProp = { 2, 1, 31402 }, nStack = 10 }, -- TÈy T©m Th¹ch Lv7
                                  },
    },
    [PackItemId(2, 1, 40119)] = { szName = "Tói LuyÖn L« ThiÕt Lv7",
                                  tbItems = {
                                      { tbProp = { 2, 1, 31401 }, nStack = 10 }, -- LuyÖn L« ThiÕt Lv7
                                  },
    },
    [PackItemId(2, 1, 40120)] = { szName = "Tói Thiªn Cang LÖnh",
                                  tbItems = {
                                      { tbProp = { 2, 95, 204 }, nStack = 10 }, -- Thiªn Cang LÖnh
                                  },
    },
    [PackItemId(2, 1, 40121)] = { szName = "Tói Thiªn M«n Kim LÖnh",
                                  tbItems = {
                                      { tbProp = { 2, 1, 30370 }, nStack = 10 }, -- Thiªn M«n Kim LÖnh
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
            WNpc:Talk("Thu håi thÊt b¹i.", 1);
            return WEnv.RETCODE_CONSUMEERROR;
        end
    else
        WNpc:Talk("Bªn trong trèng rçng, kh«ng thu ®­îc g×.", 1);
        return WEnv.RETCODE_CONSUMEERROR;
    end
end
