--**************************************************************************************************************
-- Global Task
--**************************************************************************************************************
GLB_TSK_SERVER_ID = 1023 -- ServerID
GLB_TASK_NEWRES_SONG = 1024 -- Th�i gian T�ng Nguy�n So�i k�ch ho�t x2 T�i Nguy�n Chi�n
GLB_TASK_NEWRES_LIAO = 1025 -- Th�i gian Li�u Nguy�n So�i k�ch ho�t x2 T�i Nguy�n Chi�n
GLB_TASK_SUMMON_SONG = 1034 -- Th�i gian k�ch ho�t g�i boss phe T�ng
GLB_TASK_SUMMON_LIAO = 1035 -- Th�i gian k�ch ho�t g�i boss phe T�ng
GLB_TASK_PROMOTION = 1037 --l�u th�i gian khi mua v�t ph�m khuy�n m�i h�ng ng�y


local nDate = tonumber(date("%y%m%d"))

--- Task translife
TRANSLIFE_TASK_ID = 1538
TRANSLIFE_BYTE_COUNT = 1
TRANSLIFE_BYTE_FACTION = 2

--**************************************************************************************************************
-- Temp Task
--**************************************************************************************************************
-- D� �o�n thi ��u
--TSK_TMP_SELECT_COUNT = 108 -- S� ��i �� ch�n
--TSK_TEAM_LIST_1 = 109 -- List team �� ch�n 1
--TSK_TEAM_LIST_2 = 110 -- List team �� ch�n 2
--TSK_TMP_CHOICE = 117 -- Lo�i h�nh d� �o�n �� ch�n

-- T�i nguy�n chi�n
TSK_TIME_KICHHOAT_TNC =  2285 --l�u time k�ch ho�t h� tr� ��o nhanh t�i nguy�n chi�n
TSK_TMP_NEWRES = 108 -- Thu th�p t�i nguy�n
TSK_TEMP_SONGLIAO_BET = 109 -- D� �o�n T�ng Li�u

TSK_TMP_TRANS_NEILI = 110 -- B�c ��u truy�n c�ng thu�t
TSK_TMP_PRACTICE_NEILI = 117 -- B�c ��u d��ng sinh thu�t
TSK_TMP_NEILI_TYPE_SP = 205 -- Ph�n lo�i D��ng Sinh & Truy�n C�ng ��c bi�t

TSK_TMP_BHTA6_VOTE = 118 -- Vote BHTA 5

TSK_TMP_PET_INDEX = 119 -- L�u index c�a pet
TSK_TMP_PET_ENEMY_INDEX= 129 -- L�u index pet c�a ��i th�
TSK_TMP_ENEMY_INDEX= 201 -- L�u index c�a ��i th�
TSK_TMP_FRUIT_INDEX = 208 -- Mua tr�i c�y NPC ���ng Minh Th�nh
TSK_TMP_CHUYENDOITRANGBI = 209
--**************************************************************************************************************
-- Task ID
--**************************************************************************************************************
-- TASK BAO HIEM: 2665

-- TASK NEW SERVER
local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
if nServerID == 104 and (nDate >= 160315 and nDate <= 160525) then
    --if nDate >= 151019 and nDate <= 151218 then
    --	TSK_HOATDONGNEWSERVER = 1534
    --	TSK_HOATDONGNEWSERVER_NHANTHUONG = 2157
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
    --	TSK_BONUS_CONLON = 2185
    --else
    --	TSK_HOATDONGNEWSERVER = 2665
    --	TSK_HOATDONGNEWSERVER_NHANTHUONG = 2665
    --	TSK_CONGHIENBANG = 2665
    --	TSK_TOP_LEVEL = 2665
    --	TSK_TOP_AWARD = 2665
    --	TSK_BONUS_CONLON = 2665
end
if nServerID == 128 and (nDate >= 200318 and nDate <= 200518) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 127 and (nDate >= 200101 and nDate <= 200301) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 126 and (nDate >= 191107 and nDate <= 200107) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 125 and (nDate >= 190905 and nDate <= 191105) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 124 and (nDate >= 190711 and nDate <= 190911) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 123 and (nDate >= 190501 and nDate <= 190701) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 122 and (nDate >= 190307 and nDate <= 190507) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 121 and (nDate >= 190101 and nDate <= 190302) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 120 and (nDate >= 181115 and nDate <= 190115) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 119 and (nDate >= 180907 and nDate <= 181109) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 118 and (nDate >= 180713 and nDate <= 180915) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 117 and (nDate >= 180504 and nDate <= 180704) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 116 and (nDate >= 180309 and nDate <= 180511) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 115 and (nDate >= 180101 and nDate <= 180301) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 114 and (nDate >= 171115 and nDate <= 180117) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 113 and (nDate >= 170915 and nDate <= 171117) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 112 and (nDate >= 170712 and nDate <= 170915) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 111 and (nDate >= 170512 and nDate <= 170715) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 110 and (nDate >= 170310 and nDate <= 170512) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 109 and (nDate >= 170101 and nDate <= 170301) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 108 and (nDate >= 161111 and nDate <= 170111) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 106 and (nDate >= 160715 and nDate <= 160919) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
if nServerID == 107 and (nDate >= 160805 and nDate <= 161015) then
    TSK_CONGHIENBANG = 2185
    TSK_TOP_LEVEL = 2545
    TSK_TOP_AWARD = 2276
end
-- X�a Khu�t Nguy�n B�i
--TSK_XOA_KHUATNGUYENBOI = 2188 -- H�t s� d�ng --Bit 1: first login; Bit 2: Nhan lai 1 lan mien phi
--TSK_XOA_YEUQUYET = 2188		--ch�y ��n 26/7/2018
-- Kim x� th�ng 1
--TSK_KIMXATHANG1 = 2188	-- H�t s� d�ng --
--================= Ph�c Sinh 3
TSK_PHUCSINH3_SUPPORT =  2715		--1234567890: 0=nh�n ngo�i trang mi�n ph�, 9=nh�n Ng�c B�i K� N�ng, 8=nh�n Khu�t Nguy�n B�i
--================= Ph�c Sinh 2
--TSK_PHUCSINH2 = 2175	-- ABB
-- A: tr�ng th�i nh�n th� th�ch
-- BB: t�ng s� l�n ho�n th�nh nhi�m v�
--TSK_PHUCSINH2_COUNT = 2176	-- ABBCDDD
-- A: S� l�n ho�n th�nh nv trong ng�y
-- BB: ID nhi�m v� �ang nh�n
-- C: tr�ng th�i ho�n th�nh nhi�m v�
-- DDD: b� ��m b��c nhi�m v�
-- Event trang b� Kim X�
--TSK_EVENTKIMXA = 2540 -- Expired
TSK_EVENTKIMXA_NHANTHUONG = 2545 -- Expired
--Ph�c sinh B�n ��ng H�nh l�n 2
TSK_PET_PSLAN2_TASK_1 = 2175 	--a111222333: a (x�c ��nh c� PS); 111 (160 BNN); 222(240 h�t gi�ng); 333(320 t� linh)
TSK_PET_PSLAN2_TASK_2 = 2176		--a111222333: a (x�c ��nh nh�n nv PS); 111 (999 ng�i sao); 222 (160 n�a oa); 333 (600 ph�o hoa)
-- Event trang b� Kim X� Li�n Server
--TSK_KIMXA_ALLSERVER_POINT = 2660
--TSK_KIMXA_ALLSERVER_AWARD = 2540

-- Sinh t� v� ng�
--TSK_SINHTUVONGA1 = 2700 -- GAABCCDDD
-- AA: B� ��m ph�n th��ng 
-- B: Tr�ng th�i nh�n h� tr� m�i ng�y
-- CC: �i�m n�p m�i ng�y
-- DDD: �i�m hi�n c�
--G: x�c ��nh qua n�y reset �i�m n�p m�i ng�y
--TSK_SINHTUVONGA2 = 2701 -- YYMMDD: ng�y h�t h�n
--TSK_SINHTUVONGA3 = 2713 -- AxxxxxxxB; A: tr�ng th�i nh�n n.v�; B: nhi�m v� C�ng T�
--TSK_SINHTULAN3A = 2700
--TSK_SINHTULAN3B = 2701
--TSK_SINHTULAN3C = 2713
--TSK_SINHTULAN3A092015 = 2172
--TSK_SINHTULAN3B092015 = 2282
--TSK_SINHTULAN3C092015 = 2430
--nhi�m v� book15
TSK_Book_CountPoint = 2282			----local nCur_point = TSK_Book_CountPoint ; �i�m hi�n t�i
TSK_Book_CountMissDaily_1 = 2430	----s� l��ng nhi�m v� h�ng ng�y ho�n th�nh
TSK_Book_CountMissDaily_2 = 2701	----s� l��ng nhi�m v� h�ng ng�y ho�n th�nh
TSK_Book_Lev_Award = 2172	--TSK_Book_Lev_Award = 2172	
--local nCur_Lev_ByTsk = VNG_GetTaskPos(TSK_Book_Lev_Award, 2, 1) ; lev s�ch hi�n t�i - l�u tr�n task
--local nCur_Award_ByTsk = VNG_GetTaskPos(TSK_Book_Lev_Award, 4, 3) ; award s�ch hi�n t�i - l�u tr�n task

-- Nhi�m v� ��ng h�nh
TSK_DONGHANH = 2189
-- Byte 1 + Byte2: s� l��ng nhi�m v� ho�n th�nh; 
-- Byte 3: Lo�i nhi�m v� �ang nh�n; 
-- Bit 25: Tr�ng th�i ho�n th�nh nhi�m v�.
-- Bit 26: Tr�ng th�i nh�n th��ng m�i ng�y
-- Bit 27: Tr�ng th�i nh�n th��ng cu�i
TSK_DONGHANH_COUNT = 2283
-- Byte 1: S� l�n nh�n nv ��ng h�nh trong ng�y, reset m�i ng�y
-- Byte 2: S� l�n ho�n th�nh c�n l�i c�a nhi�m v� c� y�u c�u s� l��ng
-- Nh�n h� tr� qu�n c�ng
TSK_HOTROQUANCONG = 2284
-- Thu ��i nguy�n li�u Qu�n D�ng
TSK_THUQUANDUNG = 2187 -- ABCDDE
-- A: Ph�n th��ng cu�i m� r�ng event
-- B: S� l�n n�p kem que m�i ng�y
-- C: S� l�n n�p siro m�i ng�y
-- DD: S� l�n n�p qu�n d�ng m�i ng�y
-- E: Ph�n th��ng cu�i qu�n d�ng m�i ng�y

-- ��i th��ng Th�i H� Huy�n C�nh (daily resset); Byte1: ��i trang s�c; Byte2: ��i ph�n th��ng;
TSK_THAIHU_DOITHUONG = 1794
-- 16/4 den 21/4
--TSK_DOINGUYENLIEU = 2743  -- ABBB: A=>0/1: check nh�n th��ng cu�i; BBB=> s� l�n ��i nguy�n li�u
-- Task nh�n th��ng CNDSK
--TSK_GIVE_AWARD_CNDSK = 2669
BIT_KARAOKE2011 = 1

-- Task ��i v�t ph�m event h�ng th�ng
--TSK_GIVE_EVENT_ITEM = 2430	--==> d�ng cho nhi�m v� VBonus 7/2014

-- Task ��ng k� Long H� Tranh H�ng
--TASK_DANGKY_BHTA9 = 2743			
-- TASK_LHTH = 2283 -- D�ng ��n h�t ng�y 2013-07-03
---- Task nh�n th��ng Bang Ch� Tinh Anh
--TSK_BANGCHUTINHANH = 2743 -- 1: �� nh�n; 0: ch�a nh�n

-- Task n�p tr�i c�y nh�n ch�n kh�
TSK_GETQIBYFRUIT = 2747 -- Byte 1: reset ng�y; Bit 9: nh�n th��ng n�p nhi�u tr�i c�y; Bit 10 ��n 30: n�p m�i lo�i tr�i c�y
--Task nhi�m v� l�m gi�u m�i ng�y (ko gi�i h�n th�i gian)						--Task support chuy�n sinh mi�n ph� �ng T� v� Ph�ng T�							-- Task VBonus: mua v�t ph�m gi�m gi� 
TSK_LAMGIAU = 2693 --bit 1-12
--TSK_DaoRuongCanhTy = 2693	--(06/02/2020 - 13/02/2020)/(21/01/2020 - 27/01/2020)														--TSK_SUPPORT_CHUYENSINH = 2693													
TSK_Type_HHVHtoAMHUYET = 4607 -- chuyen task VNG sang task cuoi cung cua day KS	--s� d�ng v� tr� th� 6 cho vi�c ch�n lo�i trang s�c c�n n�ng c�p
-- VBonus: ��nh d�ng: ABCDmmdd; A, B, C, D: S� l��ng item �� mua theo t�ng lo�i; H�t h�n 01/8/2013
--TSK_VBONUS_SaleOff = 2282
--TSK_SUPPORT_CHUYENSINH = 2188	--h�t s� d�ng
--Bit 1(N� oa), 2(Th�i h� huy�n c�nh), 3(T�ng ki�m), 4(L��ng S�n), 5(Th�y L�i), 6(H�t gi�ng), 7(B�t Nh� Nh�), 8(B�t Nh� L�n), 9(C�y T� Linh), 10(Nh�n M�n R�c L�a), 11(gh�p T�ng R��ng), 12(tr�ng th�i nh�n nhi�m v�), 13(trang th�i nh�n th��ng)
-- Chuy�n sinh
TRANSLIFE_MISSION_ID = 1537
TRANSLIFE_TASK_ID = 1538
TRANSLIFE_BYTE_COUNT = 1
TRANSLIFE_BYTE_FACTION = 2
TRANSLIFE_BYTE_FLAG_LEVEL = 3
TRANSLIFE_BYTE_SAVE_LEVEL = 4
--- Chuy�n sinh 5
-- 80 TMT , 45 LSB , 69 C�y T� Linh
TRANSLIFE_TASK_5_1 = 2677
-- N� Oa B�o H�p , ��nh d�u ti�u di�t L�nh H��ng L�ng
TRANSLIFE_TASK_5_2 = 2678

TRANSLIFE_TASK_34 = 2279 -- Nhi�m v� chuy�n sinh 3,4
-- ��nh d�u s� l�n ho�n th�nh theo h� s� 10
TRANSLIFE_TASK_34_FLAG = 2542
TRANSLIFE_BYTE_TASK1 = 1 -- T�i nguy�n chi�n
TRANSLIFE_BYTE_TASK2 = 2 -- H�t gi�ng
TRANSLIFE_BYTE_TASK3 = 3 -- B�t nh� nh�
TRANSLIFE_BYTE_TASK4 = 4 -- B�t nh� l�n

TSK_SETQC_NEWSERVER = 2158

TSK_SERVER_ID = 2280 -- ��nh danh Server ID cho role
TSK_SERVER_ID_CUR = 1
TSK_SERVER_ID_NEW = 2
TSK_SERVER_ID_JUNGONG = 3
TSK_SERVER_ID_TIME = 2281

-- Bang h�i tinh anh 
TSK_BHTA6_6E8 = 2665
TSK_BHTA6_2E8 = 2666
TSK_BHTA6_WEEKLYAWARD = 2667
TASK_BHTA6 = 2668
BYTE_BHTA6_GET_TALK = 1
BYTE_BHTA6_GET_TOP10 = 2
TASKID_JYBHZ_USE_HONGBAO = 2702
TASKID_JYBHZ_GET_HONGBAO = 2703

-- Task nh�n th��ng tr�ng C�y T� Linh
TSK_AWARD_4SOUL = 2183
TSK_AWARD_4SOUL_DATE = 2182

-- Task s� d�ng tr�i c�y
TSK_USEFRUIT_DATE = 2184
TSK_USEFRUIT_EXP = 2177
TSK_USEFRUIT_FLAG_1 = 2178
TSK_USEFRUIT_FLAG_2 = 2179
TSK_USEFRUIT_FLAG_3 = 2180
TSK_USEFRUIT_FLAG_4 = 2181

-- Task ��n b� qu�n c�ng
TSK_JUNGONG_PUNISH = 2152
TSK_JUNGONG_PUNISH_DATE = 2153
TSK_JUNGONG_LIMIT = 2155

-- Ng�i Sao May M�n
TSK_LUCKY_STAR_201011 = 2661

-- Tr�ng ng�u nhi�n
--TSK_RANDOMIZE_EGG = 2172

-- Ph�o hoa CNDSK
FIREWORK_CNDSK_USE = 2493
FIREWORK_CNDSK_TIME = 2494

-- NV STD
KH_QUEST_TSK = 1533
FIREWORK_IDOL_USE = 2495
FIREWORK_IDOL_TIME = 2496

-- ��n b� qu�n c�ng
--TSK_SET_QUANCONG = 2660

-- Valentine 2011
--TSK_VALENTINE_GET_FLAG_2011 = 2662
--TSK_VALENTINE_USE_FLAG_2011 = 2663
--TSK_VALENTINE_USED_EXP_2011 = 2664
TRIGGER_USER_DEFINE_VALENTINE_2011 = 2517
TRIGGER_TB_DEFINE_VALENTINE_2011 = 1506

-- B�n ��ng H�nh
TASK_VNG_PET = 2560 -- 2 s� ��u l�u c�p c�a pet, c�c s� sau l�u �i�m n�ng c�p
TASK_VNG_PET_QUEST = 2561 -- C� ch�a ng�y th�ng �� reset task c�a pet
TASK_VNG_PET_TIME = 2562
TASK_VNG_PET_GODPOINT = 1535 -- 2 s� ��u l�u s� l�n ho�n th�nh nhi�m v� linh l�c, c�c s� sau l�u �i�m linh l�c
TASK_VNG_PET_INFO = 1536 -- L�u s� l�n nhi�m v� train pet,  l�u gi�i t�nh pet,  l�u lo�i pet
BYTE_PET_INFO_TRAIN = 1
BYTE_PET_INFO_SEX = 2
BYTE_PET_INFO_TYPE = 3
TASK_PET_TRAIN_TIME = 1541

TASK_ROSE_WAR = 2157

-- V� L�m B�o H�p
TSK_VLBH_EXP = 2744		--old: 2674
-- L�u th�ng reset  th�ng tu�n 
TSK_VLBH_MARK = 2745		--old: 2672
-- L�u th�i gian gi�n c�ch
TSK_VLBH_TIME = 2673
--L�u �i�m ch�n kh�
TSK_VLBH_QI = 2729
--L�u �i�m c�ng tr�ng
TSK_VLBH_QUANCONG = 2756
--S� l�n nh�n VLBH trong ng�y & tu�n
TSK_VLBH_Qty = 2730 -- ��nh d�ng: xxxyyy; xxx: s� l�n nh�n trong tu�n; yyy: s� l�n nh�n trong ng�y
-- L�u th�i gian gi�n c�ch 2
TSK_VLBH_TIME2 = 2732

-- Ni�n th� T12/2010
TSK_NIENTHU20101201_TIME = 2175
TSK_NIENTHU20101201_INFO = 2176

-- B�n ��ng H�nh chi�n ��u
TASK_PET_FIGHT = 1542 -- S� ��u l�u k�t qu� tr�n ��u, c�c s� c�n l�i l�u index c� thi ��u

-- B�n ��ng H�nh v��t Th�i H�
TSK_PET_TAIXU_DATE = 2173  -- S� ��u ti�n ch�a tr�ng th�i pet trong Th�i H�, s� th� 2 ghi s� l�n tham gia mi�n ph�, s� th� 3 ghi s� l�n tham gia tr� ph�, 6 ch� s� ti�p theo ghi ng�y th�ng n�m tham gia
TSK_PET_TAIXU_POINT = 2174 -- S� th� 1 t�i th� 3 ch�a t�ng l�n nh�t,�� v��t qua, c�c s� c�n l�i ch�a �i�m v��t �i
TSK_PET_TAIXU_INFO = 2177
-- ��nh d�u 
TSK_THAIHU_DAY = 2706

-- Bo sung event thang 8/2010
--EVENT201009_GIVE_CAKE = 2430
--VET_201009_01_TASK_FLAG = 2429
--VET_201009_01_BIT_LIMIT = 1
--VET_201009_01_BIT_METHOD = 2
--VET_201009_01_BIT_METHOD_CONFIRM = 3
--VET_201009_01_BYTE_TYPE = 2
--VET_1000_THANGLONG_TIME = 2428

-- T�i Nguy�n Chi�n
TSK_TRANS_POINT_ALLOW = 2711 --l�u gi� tr� b�o l�u, ko cho ph�p tham gia chi�n tr��ng
TSK_NEWRES_CALC_DAILY = 2712 -- l�u gi� tr� �� ��nh gi� qu�n h�m �� tham gia TNC h�ng ng�y
TSK_GET_THUOC_TIME = 2663 --l�u gi� tr� reset ng�y c�a l�y thu�c v� kick ho�t x2
TSK_GET_THUOC = 2662 -- L�y s� cu�i l�u l�i vi�c �� nh�n thu�c
TSK_NEWRES_DATE = 2148 -- Th�i gian nh�n nhi�m v�
TSK_NEWRES_POINT = 2149 -- S� �i�m t�ch l�y ���c
TSK_NEWRES_FINISH = 2161 -- Flag ho�n th�nh nhi�m v�
BYTE_NEWRES_STATE = 1 -- Tr�ng th�i c�a nhi�m v� 0: ko c� nhi�m v�, 1: �� nh�n nhi�m v�, 2: �� ho�n th�nh nhi�m v�
BYTE_NEWRES_DONE = 2 -- S� l�n ho�n th�nh nhi�m v� trong ng�y
BYTE_NEWRES_DOUBLE_EXP = 3 -- S� l�n k�ch ho�t x2 exp trong ng�y, ch� d�nh cho Nguy�n So�i

TSK_GET_DHTN = 2164	--TSK_SONGLIAO_BET_1 = 2164 -- D� �o�n T�ng Li�u ��t 1
TSK_GIVE_DHTN = 2165	--TSK_SONGLIAO_BET_2 = 2165 -- D� �o�n T�ng Li�u ��t 2

TSK_GET_NEILI_EXP = 2166 -- B�c ��u Truy�n C�ng - nh�n
TSK_GIVE_NEILI_EXP = 2167 -- B�c ��u Truy�n C�ng - cho

TSK_GET_NEILI_EXP_SP = 2679 -- B�c ��u Truy�n C�ng ��c Bi�t - nh�n
TSK_GIVE_NEILI_EXP_SP = 2680 -- B�c ��u Truy�n C�ng ��c Bi�t - cho

TSK_PRATICE_NEILI_EXP_TYPE_1 = 2168 -- B�c ��u D��ng Sinh - lo�i 1
TSK_PRATICE_NEILI_EXP_TYPE_2 = 2169 -- B�c ��u D��ng Sinh - lo�i 2
TSK_PRATICE_NEILI_EXP_TYPE_3 = 2170 -- B�c ��u D��ng Sinh - lo�i 3
TSK_PRATICE_NEILI_EXP_TYPE_4 = 2171 -- B�c ��u D��ng Sinh - lo�i 4

TSK_PRATICE_NEILI_EXP_TYPE_1_SP = 2681 -- B�c ��u D��ng Sinh ��c Bi�t  - lo�i 1
TSK_PRATICE_NEILI_EXP_TYPE_2_SP = 2682 -- B�c ��u D��ng Sinh ��c Bi�t  - lo�i 2
TSK_PRATICE_NEILI_EXP_TYPE_3_SP = 2683 -- B�c ��u D��ng Sinh ��c Bi�t  - lo�i 3
TSK_PRATICE_NEILI_EXP_TYPE_4_SP = 2684 -- B�c ��u D��ng Sinh ��c Bi�t  - lo�i 4

TSK_GOLDEN_CARD_CREATE_TIME = 2185
TSK_MASTER_SKILL = 2186

TSK_BUY_GOLDEN_CARD = 2435

-- Task s� d�ng T�n M�o ��i H�ng Bao
TSK_DAHONGBAO_201101 = 2429
TSK_DAHONGBAO_201101_TIME = 2428

-- Task promotion CSM 5.0
TSK_AWARD_CSM5 = 2670
TSK_AWARD_CSM5_ACTIVE_TIME = 2671
-- Task Quay s� may m�n
TSK_LUCKY_DRAW = 2705
--TASK_DELL_TUYETCAU = 2668
-- ��i qu�n c�ng huy ho�ng b�ng Ti�n L�
--TASK_LIMIT_JUNGONG = 2276


--TSK_SELECT_TYPE = 2148 -- Check t�ng bit xem �� d� �o�n k�t qu� n�o
--TSK_SILVER_WIN = 2149 -- S� Ti�n L� t�ch l�y ���c
--TSK_LIST_16_1 = 2161 -- List 16 ��i 1
--TSK_LIST_16_2 = 2162 -- List 16 ��i 2
--TSK_LIST_8_1 = 2163 -- List 8 ��i 1
--TSK_LIST_8_2 = 2164 -- List 8 ��i 1

-- Task ghi l�i s� ti�n �� c��c cho t�ng lo�i h�nh
--TSK_SILVER_BET_1 = 2165
--TSK_SILVER_BET_2 = 2166
--TSK_SILVER_BET_3 = 2167
--TSK_SILVER_BET_4 = 2168
--TSK_SILVER_BET_5 = 2169
--TSK_SILVER_BET_6 = 2170
--TSK_SILVER_BET_7 = 2171
--TSK_SILVER_BET_8 = 2172

-- Task ghi l�i ��i �� ch�n
--TSK_BET_01 = 2173
--TSK_BET_02 = 2174
--TSK_BET_03 = 2175
--TSK_BET_04 = 2176
--TSK_BET_05 = 2177
--TSK_BET_06 = 2178
--TSK_BET_07 = 2179
--TSK_BET_08 = 2180
--TSK_BET_09 = 2181
--TSK_BET_10 = 2182
--TSK_BET_11 = 2183
--TSK_BET_12 = 2184
--TSK_BET_13 = 2185
--TSK_BET_14 = 2186
--TSK_BET_15 = 2187

--TSK_SILVER_2_EXP = 2188

-- Vinh danh t��ng s�
TSK_GLORY = 2277
BYTE_GLORY_DATE =1 -- Ng�y nh�n th��ng
BYTE_GLORY_COUNT = 2 -- S� l�n nh�n th��ng

-- Th�nh Ch� ��i h�ng bao
--TSK_EXCHANGE_HONGBAO = 2278
--BYTE_EXCHANGE_HONGBAO_DATE = 1
--BYTE_EXCHANGE_HONGBAO_SMALL = 2
--BYTE_EXCHANGE_HONGBAO_BIG = 3

-- ��i ��nh H�n t�i D� Th�o
--TSK_EXCHANGE_DING7 = 2430

-------------------------------
-- S� l�n s� d�ng b� hoa chi�n th�ng trong ho�t ��ng karaoke
TSK_KARAOKE = 2665
-- Tasktemp l�u nType ng��i b�nh ���c b�nh ch�n
-- Task Temp l�u lev c�a item khi n�ng c�p T� quang Vi�m ��
TSK_TEMP_TQVD = 202
--TSK_KARAOKETEMP =202 

--S� l�n s� d�ng b�nh trung thu trong ho�t ��ng  B�nh ch�n s�ng t�c truy�n tranh
TSK_TRUYENTRANH = 2665

-- L�u tr�ng th�i k�ch ho�t HKLB c�a ng��i ch�i
TSK_HKLB_FLAG =  2431
BYTE_HKLB_STATUS = 1
BYTE_HKLB_LEVELAWARD = 2

--  Task nh�n th��ng h�ng ng�y
TSK_HKLB_DAILYAWARD =  2434

--  Task nh�n th��ng ng�y v�ng
--TSK_HKLB_GOLDENDAYAWARD = 2538

--  Task ��i item C�a h�ng V� L�m Ti�n B�i
TSK_HKLB_POINT = 1534
--TSK_HKLB_EXCHANGE = 2539
--TSK_HKLB_REWARD = 2540

-- Task k�ch ho�t V� L�m Chi�n H�u
TSK_HKLB_VLCH = 2187

-- Task l�u s� l�n m� r��ng trong t�n l�ng
--TSK_HKLB_OPENPBOX = 2671

--- Task s� l�n ��i kem trong ng�y Even th�ng 7 
--TKS_KSOCOLA_TIMES = 2675
--  ��nh d�u reset �i�m qu�n c�ng khi chuy�n Server
TSK_CHANGE_SERVER = 2676

-- Task ��n b� ng�y 30-9-2011
--TSK_DENBU_20110930 = 2700
-- TSK_BKL_BONUS = 2700
-- Task ��n b� ng�y 30-9-2011 l�n 2
--TSK_DENBU2_20110930 = 2701
--TSK_TRAOGIAI_CS1_20120404 = 2701

-- Task tr�ng hoa
--TSK_TRONGHOA = 2704
-- Task l�u ng�y v� s� l�n ��i m�t t�ch trong ng�y
--TSK_MATTICH_HIGHT = 2707
TSK_MATTICH_HIGHT_NEW = 2710
TSK_MATTICH_HIGHT_CHOOSE = 2708
TSK_XOAITEM = 2709

---------------------------------------------------------
-- L�u tr�ng th�i k�ch ho�t BKLB c�a ng��i ch�i
TSK_BKLB_FLAG =  2714
BYTE_BKLB_BOX = 1
BYTE_BKLB_LEVELAWARD = 2

--  Task nh�n th��ng h�ng ng�y
--TSK_BKLB_DAILYAWARD =  2715

--  Task nh�n th��ng ng�y v�ng
TSK_BKLB_GOLDENDAYAWARD = 2716

--  Task ��i item C�a h�ng V� L�m Ti�n B�i
TSK_BKLB_POINT = 2717
TSK_BKLB_EXCHANGE = 2718
TSK_BKLB_REWARD = 2719

-- Task k�ch ho�t V� L�m Chi�n H�u
TSK_BKLB_VLCH = 2721
-- Task kick ho�t BKLB + task count
TSK_BKLB_ACTIVE = 2722
TSK_BKLB_COUNT = 2723
TSK_BKLB_START = 2724
--Task xoa trung task HKLB
--TSK_BKLB_HAVETASK = 2725
-- Task ��i �i�m ch�n kh� h�ng ng�y
TSK_CHANGE_CHANKHI = 2726
-- Task ��nh d�u �� n�p N� Oa khi l�m nhi�m v� Th��ng H�i
TSK_CHECK_BAOHAP = 2735
--Task l�u gi� tr� reset ng�y c�a B�nh Thi�n H�
TSK_RESET_DATE = 2736
--Task l�u gi� tr� nh�n item c�a B�nh Thi�n H�
TSK_BTH_EXCHANGE = 2737
--Task l�u gi� tr� nh�n th��ng T�ng Li�u
TSK_TL_AWARD = 2741
TSK_TL_DATE = 2742
--Task reset m�i ng�y
TSK_EVERY_DATE = 2738
--Task l�u gi� tr� kick ho�t VIP c�a Th� N��ng + Ph�o Hoa
--TSK_LUCKY_DAOHUU_NEW_THANG4 = 2739		--TSK_ACTIVE_VIP_THONUONG = 2739
TSK_NHIEMVUTHANG4 = 2740		 --TSK_ACTIVE_VIP_PHAOHOA = 2740
--TSK_COUNT_EVERYDAY = 2746
--Chu�i nhi�m v� Chuy�n Sinh ��n
TSK_CSD_COUNT_A = 2753		--300 nv s� m�n (x) - 30 l�n th�i h� (y) - 81 t�i nguy�n chi�n (z) - 30 l�n L��ng S�n (w)		- wwzzyyxxx
TSK_CSD_COUNT_B = 2749		--300 h�t gi�ng (x) - 33 l�n Tr� An (y) - 33 l�n Th�y l�i (z)			- zzyyxxx
TSK_CSD_COUNT_C = 2750		--181 B�t nh� nh� (x) - 99 b�t nh� to (y) - 99 c�y t� linh (z)		- zzyyxxx
TSK_CSD_ALLOW = 2751
TSK_CSD = 2752	--��nh d�u �� nh�n item csd
--Chu�i nhi�m v� M�nh Thi�n Th�ch
TSK_MTT_COUNT = 2754		--150 h�t gi�ng (x) - 10 C�ng T� (y)	- 10 l�n Th�y L�i (z) - 1 nh�n nhi�m v� (w)- 1 nh�n th��ng (b)	- bwzzyyxxx
TSK_EVERY_WEEK = 2755	--2 s� cu�i l�u s� tu�n
--Chu�i nhi�m v� Chuy�n Sinh 6
TSK_CS6_COUNTA = 2757	--30 C�ng t� (x) - 30 Tr� An (y) - 150 B�t nh� nh� (z) - 150 H�t gi�ng (w)		- wwwzzzyyxx
TSK_CS6_COUNTB = 2758	--30 Th�y l�i (x) - 30 Luy�n ��n (y) - 150 T� Linh (z) - 160 Ng�i Sao May M�n (w)		- wwwzzzyyxx
TSK_CS6_COUNTC = 2759	--20 TNC (x) - 20 TMT (y) - 15 LSB (z)		- zzyyxx
TSK_CS6_GET1TIME = 2685		--nh�n item 1 l�n duy nh�t sau khi chuy�n sinh -- 3s� cu�i, 4 s� ti�p ghi s� N� oa
TSK_CS6_TULINH = 2687		--nh�n v� l�m ti�p nhi�m v� chuy�n sinh 6
TSK_CS6_DaoQuy_XoaQuy = 2688	--AAAABBBB:  AAAA: s� l��ng Ti�u Lam �ao Qu�; BBBB: s� l��ng Ti�u Lam Xoa Qu�
TSK_CS6_SaMac_TamBao = 2692	-- AAAABBBB: AAAA: s� l��ng Sa M�c H�nh Nh�n; BBBB: s� l��ng T�m B�o Nh�n
TSK_CS6_KiemTien_DichTien = 2690	-- AAAABBBB: AAAA: s� l��ng Ki�m Ti�n T�; BBBB: s� l��ng ��ch Ti�n T�
TSK_CS6_LiLong_HoaHo = 2691	-- AAAABBBB: AAAA: s� l��ng Li�t Nhan Li Long; BBBB: s� l��ng X�ch Luy�n H�a H�
---------------------------------------------------------
-- L�u tr�ng th�i �i�m may m�n c�a ng��i ch�i
TSK_EVENT_PHU_MOI_THANG =  2698
--TSK_LUCKY_DAOHUU_NEW_THANG4 = 2739	
--BYTE_POINT_LUCKY = 1
--BYTE_ACCEPT_LUCKY = 2
--BYTE_TIME_VM =3
-----------------------------------------------------------
TSK_PET_PS_GIAIDOAN_A = 2538	--xxxFFFcddg: x = 160 c�y t� linh, F = 160 c�y b�t nh� nh�, c = h��ng Ph�c Sinh, dd = s� l�n ph�c sinh, g = .....
TSK_PET_PS_GIAIDOAN_B = 2539	--aabbccddeg: g = (1,2,3) chu�i nhi�m v�), e = x�c ��nh c� PET Ph�c Sinh, dd = 30 l�n C�ng T�, cc = 30 l�n Tr� An, bb = 30 l�n Th�y L�i, aa = 3 l�n luy�n ��n
---------------------------------------------------------
EXT_POINT_CLTV = 5	--Ch� T�n V��ng L�nh
--TSK_CTVL_START = 2664  --khai b�o Task
TSK_CTVL_ALL = 2665		--khai b�o task: 0987654321: 1:k�ch ho�t CTVL;	2: �� x�y d�ng bang trong tu�n	3: �� nh�n th��ng BHCT trong tu�n		4: nh�n th��ng t� ��i trong ng�y		65: check lev nh�n th��ng PS0 	7: nh�n trang b� HN	8: kich ho�t Bang h�i Ch� T�n		9: nh�n th��ng PS1 90	0: nh�n th��ng PS2 75
--TSK_CTVL_COUNT = 2666	--0987654321: 		321: b� ��m b��c nhi�m v�	4: tr�ng th�i ho�n th�nh nhi�m v�		65: l�u ID nhi�m v� m�i ng�y �ang th�c hi�n	7: s� l�n ho�n th�nh nhi�m v� trong ng�y		8: tr�ng th�i nh�n th� th�ch		9: nh�n th��ng m�i ng�y c�a old server

------TASK HAY SU DUNG------
--TSK_CUOCCHIENHOAHONG = 2733	--Task cu�c chi�n hoa h�ng (23/04/2015 - 26/04/2015)
--TSK_DUATOPSERVERCANHAN = 2733 --Task �ua top bang h�i li�n server (Byte 1,2)(21/01/2015 - 28/02/2015)
--TSK_DENBU_HOAPHUNG = 2733	-- Task ��n b� server H�a Ph�ng (byte 3 v� 4) (24/10/2014 - 5/12/2014)
--TSK_QUAYSOMAYMAN = 2733	-- Task quay s� may m�n n�m m�i (5/1/2015)
--TSK_NHIEMVUCDKEY = 2540 --Task nh�n th��ng m�i ng�y nhi�m v� PVP CD KEY (Byte 1)
--TSK_DUDOAN_BHTA12 = 2540 -- Task d� �o�n BHTA12 (05/11/2014 - 28/11/2014) (Byte 2, 3) --h�t s� d�ng
--TSK_BAORUONG_TAINGUYEN = 2540	--Task th�nh ch� nh�n th��ng 25 b�o r��ng (Byte 2)	--h�t s� d�ng
--TSK_HOTROKCL = 2540		--Task h� tr� nh�n th��ng KCL (28/1/2015 - 29/1/2015)	(Byte 4)
--TSK_NHIEMVUTRONGCAY = 2540	--Task nhi�m v� tr�ng c�y (25/4/2015 - 1/5/2015)	(Byte 1,2,3,4)
--TSK_DENBU_TIENPHUNG = 2704  --Task ��n b� c�ng tr�ng Ti�n Ph�ng ng�y 25/04/2015
--TSK_EVENTTHANG8 = 2704	--Task event ph� th�ng 8/2015. h�t h�n ng�y 28/08/2015
--TSK_EVENTTHANG9 = 2704	--Task event ng�y 2 th�ng 9 n�m 2015, h�t h�n ng�y 2/9/2015
--TSK_XOA_TRANGBI_AMHON = 2704	--Task x�a trang b� �m H�n, h�t h�n ng�y 20/9/2015
--TSK_KINHMACH_THANG9 = 2704	--Task event ph� Kinh m�ch ��ng nh�n th�ng 9 n�m 2015, h�t h�n ng�y 30/9/2015
--TSK_EVENTTHANG9 = 2540	--Task event ph� th�ng 9 n�m 2015, h�t h�n ng�y 30/9/2015
--TSK_KIMXA092015 = 2733	--Task event ��i trang b� kim x� th�ng 9 n�m 2015, h�t h�n ng�y 11/10/2015
--TSK_EVENT_NIEMVUI = 2704	--Task event ng�y 2 th�ng 9 n�m 2015, h�t h�n ng�y 8/10/2015
--TSK_MATTICH_TIEUDAO = 2540	--Task event ph� th�ng 9 n�m 2015, h�t h�n ng�y 30/10/2015 (v� tr� 1,2 : event m�t t�ch ti�u dao)
--TSK_MATTICH_TIEUDAO = 2540	--Task event ph� th�ng 11 n�m 2015, h�t h�n ng�y 30/11/2015 (v� tr� 3,4,5 : event m�t t�ch trao tay) ********
--TSK_MATTICH_TIEUDAO = 2540	--nh�n ��n b� chi�n tr��ng(h�t h�n ng�y 20/11/2015, v� tr� th� 7), Task event ph� Hallowen, h�t h�n ng�y 30/10/2015 (v� tr� 6,7 : event Hallowen)
--TSK_EVENT_CUONGHOAPHU = 2704	--Task event ��i c��ng h�a ph�, h�t h�n ng�y 06/11/2015
--TSK_EVENTCHINH_MORONG = 2733	--Bit 1,2,3,4 s� d�ng nh�n ph�n th��ng cu�i 
TSK_EVENTCHINH_MORONG = 2540	--Bit 1,2,3,4 s� d�ng nh�n ph�n th��ng cu�i 
TSK_VANGDANHTHIENHA_DUATOP = 2733	--A0002 Bit 1,2,3 (th�ng c�p t�i m�y ch� m�i) ; Bit: 4,5,6,7,8 (ph�n th��ng th�ng c�p Minh Gi�o); Bit: 9,10 (nh�n th��ng top bang h�i: th�nh vi�n, bang ch�); Bit: 11 (��ng k� nh�n th��ng top 3 Minh Gi�o)
TSK_TT_VANGDANHTHIENHA_DUATOP = 2666	--Th�ng ti�n t�i m�y ch� m�i
--TSK_EVENT_112015 = 2704	--event ��i linh th�ch(s� d�ng v� tr� 3-8, h�t h�n ng�y 27/11/2015);  event ��i �i�m ch�n kh�(s� d�ng v� tr� 1,2 - h�t h�n ng�y 30/11/2015)
TSK_DOIVATBAU = 2704 	--A0004--v� tr� 1-8: l�u �i�m t�ch l�y ��i v�t b�u ng�y 14/2/2017 - 21/02/2017
--TSK_TRAOTHUONG_BHTA15 = 2739 --trao th��ng BHTA 15 ng�y 22-23/6/2016
--TSK_CUOCCHIENHOAHONG = 2739 --A0001; b�nh ch�n BHTA21 ng�y 10-15/05/2019;b�nh ch�n BHTA17 ng�y 11-15/05/2017;  b�nh ch�n BHTA16 ng�y 27-20/10/2016
--TSK_TRAOTHUONG_BHTA15 = 2739 --A0004 nh�n danh hi�u 22/4 --A0003 trao th��ng BHTA 16 ng�y 07-07/12/2016
TSK_HOTRO_QUANCONG = 2739 --A0005: nh�n h� tr� qu�n c�ng all server
--��ng k� chuy�n server
--TSK_ChuyenServer = 2739	--m� 1 ng�y 15/05/2019
-------------------
--Event online nh�n th��ng T�t 2019 (01/02/2019-14/02/2019)--Event online nh�n th��ng T�t 2018 (13/02/2018-23/02/2018)
--TSK_Award_2018 = 2739 -- set date online nh�n th��ng 2020 --A0006: set date online nh�n th��ng 022018 
TSK_GET_THIETTINH = 2660 --task nh�n thi�t tinh khi gia nh�p c�n l�n ki�m 7/2018 (s� d�ng lu�n)
--TSK_CUONGHOA_VANSUC = 2188	--Ch�y ��n 31/10/2019
-------------------
TSK_CHOOSE_CHOICE = 2664 --task d�ng �� ��nh d�u d�ng ch�n �� ch�n
--TSK_NOEL_DIEUDUONG = 2725	--event Noel ��i di�u d��ng
------------------
--TSK_GIAPNGO_1 = 2725	--event ��o r��ng gi�p ng�: H: nh�n th��ng k�ch ho�t CDPB, gggg: s� l�n k�ch ho�t Chi�u D� Ph�p B�o, Y: nh�n th��ng k�ch ho�t TABB, xxxx: s� l�n k�ch ho�t Tuy�t Anh B� B�o
--TSK_GIAPNGO_2 = 2666	-- E: nh�n th��ng cu�i khi �� nh�n th��ng 3 lo�i tr�n; H: nh�n th��ng k�ch ho�t XTCV, gggg: s� l�n k�ch ho�t xich Th� C� V�t
--===========Th�ng Ti�n Ph�c Sinh ======
TSK_THANGTIEN_PHUCSINH = 2725	--0987654321: 1:nh�n nv-ho�n th�nh nv; 32:t�ng �i�m t�ch l�y; 54:�i�m ��i trong ng�y; 6:s� l�n tham gia Th�i H�; 7: s� l�n tham gia th� n��ng; 8: s� l�n tham gia T�ng Li�u; 9: x�c ��nh reset qua ng�y
--=========== T�ch l�y online ==========
IP_ONLINE_TIME = 2536
IP_TIME_START = 2537
--task mua b�nh ��c ch� (s� d�ng 2 v� tr� ��u)
TSK_BUY_BANHDACCHE = 2743
--=================================
--========= TAI XUAT GIANG HO =======
if nDate >= 140221 and nDate <= 140320 then
    TSK_TAIXUAT_FLAG = 2162
    TSK_TAIXUAT_MISSION1 = 2163
    TSK_TAIXUAT_MISSION2 = 2666
else
    TSK_TAIXUAT_FLAG = 2665
    TSK_TAIXUAT_MISSION1 = 2665
    TSK_TAIXUAT_MISSION2 = 2665
end
--================ 123 Pay ==========
--TSK_123PAY1 = 2664
--TSK_123PAY2 = 2675
--================= Nhi�m v� ��i trang b� Thi�n Chi - B�ch Kim Vi�m �� ==============
TSK_TC_BK_VD = 2707		--0987654321: 1-nh�n nv vd2tcvd; 2-nh�n nv tcvd2bkvd
--3-3BNL;4-4TL;5-9HG;6-8TMT;7-8TMT;8-1BNL;9-1TL;0-1HG
--================= nhi�m v� VBonus 7/2014
--TSK_nvVBonus = 2430		--==> d�ng cho nhi�m v� VBonus 7/2014
-- funtion reset task t�i playerloginin.lua
--task tr�ng: 2664, 2675