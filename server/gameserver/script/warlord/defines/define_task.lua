----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-07-30
--- Description: File n�y d�ng �� ��ng k� task cho nh�n v�t
--- task bit id 1-31, value 0-1
--- task byte id 1-3, value 0-255
----------------------------------------------------------------------------------------------------
WTASKID_BEGIN = 4000; -- Task b�t ��u s� d�ng
----------------------------------------------------------------------------------------------------

WTASKID_CURRENT_DATE = 4001; -- L�u ng�y yyyymmdd hi�n t�i c�a server v�o nh�n v�t, d�ng �� check c�c ho�t ��ng theo ng�y
WTASKID_CURRENT_LANGUAGE = 4002; -- L�u ng�n ng� c�a nh�n v�t

WTASKID_GMSTATE_BIT = 4003; -- L�u theo bit tr�ng th�i t�nh n�ng c�a gm/admin/mod, h� tr� �c t�i �a 31 tr�ng th�i
WTASKID_GMSTATE_BIT_GMBUFF = 1;
WTASKID_GMSTATE_BIT_UNUSE = 2;
WTASKID_GMSTATE_BIT_UNUSE = 3;
WTASKID_GMSTATE_BIT_UNUSE = 4;
WTASKID_GMSTATE_BIT_UNUSE = 5;
WTASKID_GMSTATE_BIT_UNUSE = 6;
WTASKID_GMSTATE_BIT_UNUSE = 7;

WTASKID_PLAYERSTATE_BIT = 4004; -- L�u theo bit tr�ng th�i t�nh n�ng c�a player, h� tr� �c t�i �a 31 tr�ng th�i
WTASKID_PLAYERSTATE_BIT_NEWBIE = 1;
WTASKID_PLAYERSTATE_BIT_CAMLOGIN = 2;
WTASKID_PLAYERSTATE_BIT_CAMCHAT = 3;
WTASKID_PLAYERSTATE_BIT_BATGIAM = 4;
WTASKID_PLAYERSTATE_BIT_BUFFTEST = 5;
WTASKID_PLAYERSTATE_BIT_GIVECODETEST = 6;
WTASKID_PLAYERSTATE_BIT_ACTIVETESTCARD = 7;
WTASKID_PLAYERSTATE_BIT_DISABLE_EFFECT = 8;
WTASKID_PLAYERSTATE_BIT_FINISHTASK_NEWBIE_GIVEDAILY2 = 9;

WTASKID_LAST_MAC_PART1 = 4005; -- L�u 1/3 n�a ��u chu�i mac m� h�a c�a nh�n v�t
WTASKID_LAST_MAC_PART2 = 4006; -- L�u 1/3 n�a sau chu�i mac m� h�a c�a nh�n v�t
WTASKID_LAST_MAC_PART3 = 4007; -- L�u 1/3 n�a sau chu�i mac m� h�a c�a nh�n v�t
WTASKID_CURRENT_MAC_PART1 = 4008; -- L�u 1/3 n�a ��u chu�i mac m� h�a c�a nh�n v�t
WTASKID_CURRENT_MAC_PART2 = 4009; -- L�u 1/3 n�a sau chu�i mac m� h�a c�a nh�n v�t
WTASKID_CURRENT_MAC_PART3 = 4010; -- L�u 1/3 n�a sau chu�i mac m� h�a c�a nh�n v�t

WTASKID_RUONG_BNL_DAILY_COUNT = 4011; -- L�u s� l�n m� r��ng B�t Nh� L�n m�i ng�y s� reset
WTASKID_RUONG_LSB_DAILY_COUNT = 4012; -- L�u s� l�n m� r��ng B�t Nh� L�n m�i ng�y s� reset
WTASKID_RUONG_DHC_DAILY_COUNT = 4013; -- L�u s� l�n m� r��ng B�t Nh� L�n m�i ng�y s� reset
WTASKID_RUONG_KDYV_DAILY_COUNT = 4014; -- L�u s� l�n m� r��ng B�t Nh� L�n m�i ng�y s� reset

WTASKID_NEWBATTLE_MERIT_POINT = 701; -- �i�m c�ng tr�ng chi�n tr��ng
WTASKID_NEWBATTLE_EXPAWARD_DAILY_COUNT = 761; -- Nh�n th��ng 1 l�n exp chi�n tr��ng ch�nh h�ng ng�y
WTASKID_NEWBATTLE_LASTDATA_DATE = 4015; -- Ghi l�i ng�y tham gia chi�n tr��ng
WTASKID_NEWBATTLE_LASTDATA_BYTE = 4016; -- Ghi l�i d� li�u c�a tr�n cu�i, h� tr� t�i �a �c 3 id
WTASKID_NEWBATTLE_LASTDATA_BYTE_JOINHOUR = 1; -- Ghi l�i gi� v�o chi�n tr��ng
WTASKID_NEWBATTLE_LASTDATA_BYTE_JOINMIN = 2; -- Ghi l�i ph�t v�o chi�n tr��ng
WTASKID_NEWBATTLE_LASTDATA_BYTE_RANK = 3; -- Ghi l�i h�ng c�a tr�n cu�i, h� tr� �c gi� tr� 0-255

WTASKID_PLAYERSTATE_CAMLOGIN_TOTALTIME = 4017;
WTASKID_PLAYERSTATE_CAMLOGIN_REMAINING = 4018;
WTASKID_PLAYERSTATE_CAMCHAT_TOTALTIME = 4019;
WTASKID_PLAYERSTATE_CAMCHAT_REMAINING = 4020;
WTASKID_PLAYERSTATE_BATGIAM_TOTALTIME = 4021;
WTASKID_PLAYERSTATE_BATGIAM_REMAINING = 4022;

WTASKID_NEWBIE_AWARD_GIVE_STATUS = 4023; -- Ghi l�i tr�ng th�i nh�n qu� c�p theo th� t� t�ng d�n

WTASKID_WEBSERVICE_BYTE = 4024; -- Ghi l�i tr�ng th�i nh�p pass
WTASKID_WEBSERVICE_BYTE_VERIFY_FAILED_COUNT = 1; -- s� l�n nh�p sai pass
WTASKID_WEBSERVICE_BYTE_UNUSE = 2;
WTASKID_WEBSERVICE_BYTE_UNUSE = 3;

WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT = 4025; -- L�u theo d�ng bit c�c ph�n th��ng top �� nh�n
WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_MERIT = 1;
WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_LEVEL = 2;
WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_UNUSE = 3;
WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_UNUSE = 4;
WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_UNUSE = 5;
WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_UNUSE = 6;
WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_UNUSE = 7;

-- L�u c�c v�t ph�m nh�n t� th� t�n th�
WTASKID_NEWBIE_BIT_GIVE_STATUS = 4026;
WTASKID_NEWBIE_BIT_GIVE_AMHUYET = 1;
WTASKID_NEWBIE_BIT_GIVE_THANHLONGTUONG = 2;
WTASKID_NEWBIE_BIT_GIVE_THANHLONGSOAI = 3;
WTASKID_NEWBIE_BIT_GIVE_VOSONGCHIENTHAN = 4;
WTASKID_NEWBIE_BIT_GIVE_VANSUC3 = 5;
WTASKID_NEWBIE_BIT_GIVE_KIMXA6 = 6;
WTASKID_NEWBIE_BIT_GIVE_KIMXA3 = 7;
WTASKID_NEWBIE_BIT_GIVE_SM3 = 8;
WTASKID_NEWBIE_BIT_GIVE_SM4 = 9;
WTASKID_NEWBIE_BIT_GIVE_SM5 = 10;
WTASKID_NEWBIE_BIT_GIVE_THUONGHAIDICHAU = 11;
WTASKID_NEWBIE_BIT_GIVE_BOTTRANCHAU = 12;
WTASKID_NEWBIE_BIT_GIVE_CHUYENSINH = 13;
WTASKID_NEWBIE_BIT_GIVE_HOACANH_90 = 14;
WTASKID_NEWBIE_BIT_GIVE_MATTICHBIDIEN = 15;
WTASKID_NEWBIE_BIT_GIVE_MATTICHTHUONG = 16;
WTASKID_NEWBIE_BIT_GIVE_DIEMLUYENMATTICH = 17;
WTASKID_NEWBIE_BIT_GIVE_KINHMACHVOTHANH = 18;
WTASKID_NEWBIE_BIT_GIVE_KINHMACHDONGNHAN = 19;
WTASKID_NEWBIE_BIT_GIVE_KINHMACHNGANNHAN = 20;
WTASKID_NEWBIE_BIT_GIVE_CHANKHI = 21;
WTASKID_NEWBIE_BIT_GIVE_TINVAT = 22;
WTASKID_NEWBIE_BIT_GIVE_HIEUBANG = 23;
WTASKID_NEWBIE_BIT_GIVE_VANG = 24;
WTASKID_NEWBIE_BIT_GIVE_DANHHIEU = 25;
WTASKID_NEWBIE_BIT_GIVE_DUOCPHAM = 26;
WTASKID_NEWBIE_BIT_GIVE_SUADO = 27;
WTASKID_NEWBIE_BIT_GIVE_MAIDAMAGE = 28;
WTASKID_NEWBIE_BIT_GIVE_DAQUY = 29;
WTASKID_NEWBIE_BIT_GIVE_NGOAITRANG = 30;
WTASKID_NEWBIE_BIT_GIVE_THUCUOI = 31;
--WTASKID_NEWBIE_BIT_GIVE_CHUTUOCTUONG = 32;

WTASKID_NEWBIE_BIT_GIVE2_STATUS = 4027; -- L�u c�c v�t ph�m nh�n t� th� t�n th�, v� nhi�u qu� n�n th�m task
WTASKID_NEWBIE_BIT_GIVE2_PHUCSINHPET1 = 1;
WTASKID_NEWBIE_BIT_GIVE2_PHUCSINHPET2 = 2;
WTASKID_NEWBIE_BIT_GIVE2_HACBACHKY = 3;
WTASKID_NEWBIE_BIT_GIVE2_SACHPET5 = 4;
WTASKID_NEWBIE_BIT_GIVE2_SPECROUTE = 5;
WTASKID_NEWBIE_BIT_GIVE2_SETBUFF = 6;
WTASKID_NEWBIE_BIT_GIVE2_CHIENCUONG = 7;
--WTASKID_NEWBIE_BIT_GIVE2_TAYTAMLUYENLO = 8;
WTASKID_NEWBIE_BIT_GIVE_THUONGHAIDICHAU6 = 8;
WTASKID_NEWBIE_BIT_GIVE2_DIEUDUONG = 9;
WTASKID_NEWBIE_BIT_GIVE2_YEUQUYET = 10;
WTASKID_NEWBIE_BIT_GIVE2_THANHANH = 11;
WTASKID_NEWBIE_BIT_GIVE2_COKIMTHACH = 12;
WTASKID_NEWBIE_BIT_GIVE2_TUCHAN = 13;
WTASKID_NEWBIE_BIT_GIVE2_LUUKIM = 14;
WTASKID_NEWBIE_BIT_GIVE2_THIENVANTHACH = 15;
WTASKID_NEWBIE_BIT_GIVE2_TTTT = 16;
WTASKID_NEWBIE_BIT_GIVE2_DAIDINHHON = 17;
WTASKID_NEWBIE_BIT_GIVE2_NLKIMXA = 18;
WTASKID_NEWBIE_BIT_GIVE2_HOACANH_150 = 19;
WTASKID_NEWBIE_BIT_GIVE2_BOTTRANCHAU = 20;
WTASKID_NEWBIE_BIT_GIVE2_KIMXA7 = 21;
WTASKID_NEWBIE_BIT_GIVE2_DANHHIEU = 22;
WTASKID_NEWBIE_BIT_GIVE2_TAYTAMLUYENLO3 = 24;
WTASKID_NEWBIE_BIT_GIVE2_KIMXA8 = 25;

WTASKID_PLANT_GIVEWATER_LAST_POS = 4028; -- l�u v� tr� t��i n��c cu�i c�ng

WTASKID_CODETEST_BYTE_TASK = 4029; -- l�u nhi�m v� alphatest
WTASKID_CODETEST_BYTE_TASK_BATNHALON = 1;
WTASKID_CODETEST_BYTE_TASK_VANTIEU = 2;
WTASKID_CODETEST_BYTE_TASK_TAINGUYENCHIEN = 3;

WTASKID_CODETEST_BIT_GIVE_STATUS = 4030; -- l�u tr�ng th�i nh�n giftcode nhi�m v� 1-31 m�c
WTASKID_CODETEST_BIT_GIVE_MOC1 = 1;
WTASKID_CODETEST_BIT_GIVE_MOC2 = 2;
WTASKID_CODETEST_BIT_GIVE_MOC3 = 3;
WTASKID_CODETEST_BIT_GIVE_MOC4 = 4;

WTASKID_RUONG_HOATDONG_DAILY_COUNT = 4031; -- L�u s� l�n m� r��ng ho�t ��ng m�i ng�y s� reset

WTASKID_DUATOP_AWARD_GIVE_RHD_STATUS_BIT = 4032; -- L�u theo d�ng bit c�c ph�n th��ng top �� nh�n
WTASKID_DUATOP_AWARD_GIVE_RHD_STATUS_BIT_TOP_YESTERDAY = 1;

WTASKID_TANGKIEM_BYTE = 4033 -- Task fix ��p ph�n th��ng t�ng ki�m;
WTASKID_TANGKIEM_BYTE_GIVE_STAGE_AWARD_STATUS = 1;

-- Task nhi�m v� nh�n �� h�ng n�y
WTASKID_DAILYTASK_BYTE = 4034; 
WTASKID_DAILYTASK_BYTE_CTC_DONE = 1; -- S� l�n tham gia chi�n tr��ng ch�nh
WTASKID_DAILYTASK_BYTE_CTP_DONE = 2; -- S� l�n tham gia chi�n tr��ng ph�
WTASKID_DAILYTASK_BYTE_TNC_DONE = 3; -- S� l�n ho�n th�nh t�i nguy�n chi�n

-- Task nh�n h� tr� 1 l�n m�i ng�y
WTASKID_NEWBIE_GIVEDAILY_BIT = 4035;
WTASKID_NEWBIE_GIVEDAILY_BIT_VANG = 1;
WTASKID_NEWBIE_GIVEDAILY_BIT_BIDIEN = 2;
WTASKID_NEWBIE_GIVEDAILY_BIT_TUCHAN = 3;
WTASKID_NEWBIE_GIVEDAILY_BIT_LICHLUYEN = 4;
WTASKID_NEWBIE_GIVEDAILY_BIT_MANHMACGIA = 5;
WTASKID_NEWBIE_GIVEDAILY_BIT_SACHKYNANGPET = 6;
WTASKID_NEWBIE_GIVEDAILY_BIT_THUONGHAIDICHAU = 7;
WTASKID_NEWBIE_GIVEDAILY_BIT_BOTTRANCHAU = 8;
WTASKID_NEWBIE_GIVEDAILY_BIT_DAMAI = 9;
WTASKID_NEWBIE_GIVEDAILY_BIT_TTTT= 10;
WTASKID_NEWBIE_GIVEDAILY_BIT_TAYTAMLUYENLO = 11;
WTASKID_NEWBIE_GIVEDAILY_BIT_LUUKIM = 12;
WTASKID_NEWBIE_GIVEDAILY_BIT_THIENVANTHACH = 13;
WTASKID_NEWBIE_GIVEDAILY_BIT_COKIMTHACH = 14;
WTASKID_NEWBIE_GIVEDAILY_BIT_DAQUY = 15;
WTASKID_NEWBIE_GIVEDAILY_BIT_VANSUC3 = 16;
WTASKID_NEWBIE_GIVEDAILY_BIT_TAYTAMLUYENLO5 = 17;
WTASKID_NEWBIE_GIVEDAILY_BIT_TCL = 18;
WTASKID_NEWBIE_GIVEDAILY_BIT_TMKL = 19;
WTASKID_NEWBIE_GIVEDAILY_BIT_TAYTAMLUYENLO7 = 20;
WTASKID_NEWBIE_GIVEDAILY_BIT_SACHKYNANGPET6 = 21;
WTASKID_NEWBIE_GIVEDAILY_BIT_NLHOACANH = 22;
WTASKID_NEWBIE_GIVEDAILY_BIT_HUYETBODE = 23;

--Task nh�n th��ng m�c �i�m c�ng tr�ng
WTASKID_MERITPOINT_AWARD_BIT = 4036;
WTASKID_MERITPOINT_AWARD_BIT_100K = 1;
WTASKID_MERITPOINT_AWARD_BIT_200K = 2;
WTASKID_MERITPOINT_AWARD_BIT_300K = 3;
WTASKID_MERITPOINT_AWARD_BIT_500K = 4;
WTASKID_MERITPOINT_AWARD_BIT_1000K = 5;
WTASKID_MERITPOINT_AWARD_BIT_2000K = 6;
WTASKID_MERITPOINT_AWARD_BIT_3000K = 7;
WTASKID_MERITPOINT_AWARD_BIT_4000K_OLD = 8;
WTASKID_MERITPOINT_AWARD_BIT_5000K_OLD = 9;
WTASKID_MERITPOINT_AWARD_BIT_6000K = 10;
WTASKID_MERITPOINT_AWARD_BIT_8000K = 11;
WTASKID_MERITPOINT_AWARD_BIT_10000K = 12;
WTASKID_MERITPOINT_AWARD_BIT_5000K = 13;
WTASKID_MERITPOINT_AWARD_BIT_4000K=14;

--Task nhi�m v� ��c th� l�m 1 l�n
WTASKID_NEWBIE_GIVEDAILY2_BIT = 4037;
WTASKID_NEWBIE_GIVEDAILY2_BIT_VANG = 1;
WTASKID_NEWBIE_GIVEDAILY2_BIT_BIDIEN = 2;
WTASKID_NEWBIE_GIVEDAILY2_BIT_TUCHAN = 3;
WTASKID_NEWBIE_GIVEDAILY2_BIT_LICHLUYEN = 4;
WTASKID_NEWBIE_GIVEDAILY2_BIT_MANHMACGIA = 5;
WTASKID_NEWBIE_GIVEDAILY2_BIT_SACHKYNANGPET = 6;
WTASKID_NEWBIE_GIVEDAILY2_BIT_THUONGHAIDICHAU = 7;
WTASKID_NEWBIE_GIVEDAILY2_BIT_BOTTRANCHAU = 8;
WTASKID_NEWBIE_GIVEDAILY2_BIT_DAMAI = 9;
WTASKID_NEWBIE_GIVEDAILY2_BIT_TTTT= 10;
WTASKID_NEWBIE_GIVEDAILY2_BIT_TAYTAMLUYENLO = 11;
WTASKID_NEWBIE_GIVEDAILY2_BIT_LUUKIM = 12;
WTASKID_NEWBIE_GIVEDAILY2_BIT_THIENVANTHACH = 13;
WTASKID_NEWBIE_GIVEDAILY2_BIT_COKIMTHACH = 14;
WTASKID_NEWBIE_GIVEDAILY2_BIT_DAQUY = 15;
WTASKID_NEWBIE_GIVEDAILY2_BIT_VANSUC3 = 16;
WTASKID_NEWBIE_GIVEDAILY2_BIT_TAYTAMLUYENLO7 = 17;

-- Task ghi l�i s� l�n s� d�ng NSMM
-- do b� bug s� d�ng v��t qu� s� l�n n�n ph�t sinh th�m 2 task m�i k�t h�p check v�i task c�
WTASKID_USE_NUOA_DAILY = 4038;
WTASKID_USE_NGOISAO_DAILY = 4039;

-- Task nhi�m v� h�ng tu�n
WTASKID_CURRENT_WEEK = 4040;
WTASKID_WEEKLYTASK_BYTE = 4041;
WTASKID_WEEKLYTASK_BYTE_CTC_DONE = 1;
WTASKID_WEEKLYTASK_BYTE_CTP_DONE = 2;
WTASKID_WEEKLYTASK_BYTE_TNC_DONE = 3;
WTASKID_WEEKLYTASK2_BYTE = 4042;
WTASKID_WEEKLYTASK2_BYTE_BNL_DONE = 1;
WTASKID_WEEKLYTASK2_BYTE_VANTIEU_DONE = 2;
WTASKID_WEEKLYTASK2_BYTE_CUOPTIEU_DONE = 3;
WTASKID_WEEKLYTASK2_BYTE_BNN_DONE = 4;
WTASKID_WEEKLYTASK2_BYTE_HATGIONG_DONE = 5;

-- Task tr�ng th�i nh�n th��ng m�i tu�n
WTASKID_WEEKLYTASK_GIVE_BIT = 4043;
WTASKID_WEEKLYTASK_GIVE_BIT_DANHHIEU = 1;
WTASKID_WEEKLYTASK_GIVE_BIT_MANHBIDIEN = 2;
WTASKID_WEEKLYTASK_GIVE_BIT_DICHAU = 3;
WTASKID_WEEKLYTASK_GIVE_BIT_TAYTAMLUYENLO = 4;
WTASKID_WEEKLYTASK_GIVE_BIT_TCL = 5;
WTASKID_WEEKLYTASK_GIVE_BIT_TMKL = 6;
WTASKID_WEEKLYTASK_GIVE_BIT_TAYTAMLUYENLO7 = 7;
WTASKID_WEEKLYTASK_GIVE_BIT_Vang = 8;
WTASKID_WEEKLYTASK_GIVE_BIT_THANHLONGHON = 9;

-- Task nhi�m v� t�n th� 1
WTASKID_SUPPORT1_TASK_BYTE = 4044;
WTASKID_SUPPORT1_TASK_BYTE_CTC_DONE = 1;
WTASKID_SUPPORT1_TASK_BYTE_CTP_DONE = 2;
WTASKID_SUPPORT1_TASK_BYTE_TNC_DONE = 3;
WTASKID_SUPPORT1_TASK2_BYTE = 4045;
WTASKID_SUPPORT1_TASK2_BYTE_BNL_DONE = 1;
WTASKID_SUPPORT1_TASK2_BYTE_VANTIEU_DONE = 2;
WTASKID_SUPPORT1_TASK2_BYTE_CUOPTIEU_DONE = 3;
WTASKID_SUPPORT1_TASK2_BYTE_BNN_DONE = 4;

-- Task tr�ng th�i nh�n th��ng nhi�m v� h� tr� t�n th�
WTASKID_SUPPORT1_GIVE_BIT = 4046;
WTASKID_SUPPORT1_GIVE_BIT_BUACUONGHOA = 1;
WTASKID_SUPPORT1_GIVE_BIT_MANHBIDIEN27 = 2;
WTASKID_SUPPORT1_GIVE_BIT_MANHBIDIEN30 = 3;
WTASKID_SUPPORT1_GIVE_BIT_DICHAU = 4;
WTASKID_SUPPORT1_GIVE_BIT_THIENTHACHTINHTHACH = 5;
WTASKID_SUPPORT1_GIVE_BIT_DAIDINHHON = 6;
WTASKID_SUPPORT1_GIVE_BIT_CHANVOHONTHACH = 7;

-- Task m� r��ng
WTASKID_RUONG_QUY_MAO_OPEN_COUNT = 4047;

-- Task gi�i h�n m� r��ng b�ng h�nh th�c c� th� c� d�ng AAAABBBB, AAAA l� gi�i h�n m� b�ng xu, BBBB l� gi�i h�n m� b�ng v�ng
WTASKID_BACHBAORUONG_OPENTYPE_LIMIT = 4048;

-- Task treo m�y online nh�n th��ng
WTASKID_TREO_ONLINE_MIN_DAILY_COUNT = 4049;
WTASKID_TREO_ONLINE_NHAN_THUONG_BIT = 4050;
WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY1_10M = 1;
WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY1_20M = 2;
WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY1_1H = 3;
WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY1_2H = 4;
WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY2_10M = 5;
WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY2_20M = 6;
WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY2_1H = 7;
WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY2_2H = 8;
WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY3_10M = 9;
WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY3_20M = 10;
WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY3_1H = 11;
WTASKID_TREO_ONLINE_NHAN_THUONG_BIT_DAY3_2H = 12;

-- Task m� r��ng boss TNC
WTASKID_OPENBOX_BOSSTNC_LASTTIME = 4051;
WTASKID_OPENBOX_BOSSTNC_TODAY = 4052;

-- Task ghi l�i tr�ng th�i nh�n th��ng m�c ho�t ��ng Th�nh Ho� ��n
WTASKID_THANHHOADAN_ACCUMULATE_BIT_GIVE= 4053;
WTASKID_THANHHOADAN_ACTIVE_FIRE_COUNT = 4054;

WTASKID_LEVEL_AWARD_BIT = 4055
WTASKID_LEVEL_AWARD_BIT_LV73 = 1;
WTASKID_LEVEL_AWARD_BIT_LV799 = 2;
WTASKID_LEVEL_AWARD_BIT_LV1095= 3;
WTASKID_LEVEL_AWARD_BIT_LV1096= 4;
WTASKID_LEVEL_AWARD_BIT_LV1097= 5;
WTASKID_LEVEL_AWARD_BIT_LV1098= 6;
WTASKID_LEVEL_AWARD_BIT_LV1099= 7;
WTASKID_LEVEL_AWARD_BIT_LV1094= 8;
WTASKID_LEVEL_AWARD_BIT_LV1093= 9;
WTASKID_LEVEL_AWARD_BIT_LV1092= 10;

WTASKID_RUONG_BNN_DAILY_COUNT = 4056; -- L�u s� l�n m� r��ng B�t Nh� Nh� m�i ng�y s� reset
---Task gi�i h�n g�i Thanh v�n ��i ph�
WTASKID_THANHVANDAIPHU_LIMIT =4057;
----Task Th��ng n�ng ��ng N�ng ��ng
WMISSION_AWARD_NANGDONG=4058;
WMISSION_AWARD_BIT_DAILY_NANGDONG_BATNHA =1;
WMISSION_AWARD_BIT_DAILY_NANGDONG_VANTIEU =2;
WMISSION_AWARD_BIT_DAILY_NANGDONG_CHIENTRUONGPHU =3;
WMISSION_AWARD_BIT_DAILY_NANGDONGCHIENTRUONGCHINH =4;
WMISSION_AWARD_BIT_NANGDONG_GIANHAPPHAI=5;
WMISSION_AWARD_BIT_NANGDONG_GIANHAPBANG=6;
WMISSION_AWARD_BIT_NANGDONG_GIANHAPPHEPHAI=7;
WMISSION_AWARD_BIT_NANGDONG_500_THIENKIEULENH=11;
WMISSION_AWARD_BIT_NANGDONG_1000_THIENKIEULENH=12;
WMISSION_AWARD_BIT_NANGDONG_1500_THIENKIEULENH=13;
WMISSION_AWARD_BIT_NANGDONG_2000_THIENKIEULENH=14;
--TASKID_LUCKYBOX_AWARD=4059 --- �� define � lib/define
--TASKID_LUCKYBOX_COUNT=4060 -- �� define � lib/define- Ti�p t�c th� n�i ti�p =4061
WMISSION_AWARD_NANGDONG_CHECK=4061;
WMISSION_AWARD_NANGDONG_TKL_CHECK=4062;
WMISSION_TASK_BOSS_DHC_CHECK=4063;
WTASKID_AWARD_TASK_TOPSERVER_STATUS=4064;
WTASKID_AWARD_TASK_TOPHOACANH_STATUS=4065;
WTASKID_AWARD_TASK_GIANGSINHFEE_STATUS=4066;
WTASKID_TASK_HOAMACHVIPT12_STATUS=4067;
WTASKID_HOTROHANGTHANG2024_OLD =4068;
WTASKID_QHTUONG_UNLIMIT2024_TONG=4069;
WTASKID_QHTUONG_UNLIMIT2024_LIEU=4070;
WTASKID_MAMNGUQUA2024=4071;
WTASKID_TIENXUMAYMAN2024=4072;
WTASKID_CHUCPHUCMAYMAN2024=4073;
TASKID_HOTRO_NEW_2024_STATUS=4074;
TASKID_SAVE_CONGTRANG_DUATOP_2024=4075;
TASKID_SAVE_CONGTRANG_DUATOP_2024_STATUS=4076;
TASKID_BIT_CHECK_RESET_DUATOP_2024_STATUS=11;
TASKID_BIT_CHECK_RECOVER_DUATOP_2024_STATUS=12;
WTASKID_BAO_LUU_CT_DATE = 4077; -- using yp
WTASKID_BAO_LUU_CT_RANK = 4078; -- using yp
WTASKID_BAO_LUU_CT_POINT = 4079; -- using yp
WTASKID_OPENBOX_BOSSTET2024_LASTTIME=4080;
WTASKID_OPENBOX_BOSSTET2024_TODAY=4081;
WTASKID_GIVEBACK_HONOR=4082;
WTASKID_RUONG_TANGKIEM_DAILY_COUNT=4083;
WTASKID_RUONG_THAIHU_DAILY_COUNT=4084;
WTASKID_DAYLY_THAIHU_DAILY_COUNT=4085;
WTASKID_DAYLY_TANGKIEM_DAILY_COUNT=4086;
WTASKID_DAYLY_VANTIEU_DAILY_COUNT=4087;
WTASKID_DAYLY_BATNHALON_DAILY_COUNT=4088;
WTASKID_NHAN_THUONG_HOAMACHCANH=4090;
WTASKID_NHAN_THUONG_BIT_165HMC = 1;
WTASKID_NHAN_THUONG_BIT_170HMC = 2;
WTASKID_NHAN_THUONG_BIT_175HMC = 3;
WTASKID_NHAN_THUONG_BIT_180HMC = 4;
WTASKID_NHAN_THUONG_BIT_190HMC = 5;
WTASKID_NHAN_THUONG_BIT_200HMC = 6;

WTASKID_NHAN_THUONG_BIAVIAHE=4091;
WTASKID_NHAN_THUONG_BIADAHU=4092;
WTASKID_DAYLY_TNC_DAILY_COUNT=4093; ---task new chua su dung
WTASKID_HOTROHANGTHANG2024 =4094;
WTASKID_DAYLY_CAYTULINH =4095;
