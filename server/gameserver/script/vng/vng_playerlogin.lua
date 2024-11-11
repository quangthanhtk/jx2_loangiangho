Include("\\script\\online\\chuyen_sinh\\translife_head.lua")
Include("\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua")
Import("\\script\\lib\\globalfunctions.lua") 
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2_head.lua")
szLogTitle = "TAI XUAT GIANG HO"
function vng_playerlogin_init()
	if GetPlayerRebornParam(0) > 0 then
		gf_SetTaskByte(1538,1,5)
	end
	VNG_Pet_Effect()
	VNG_ThangTienPhucSinh()
	CS7_Trigger_Init()
end


function vng_merge_server()
--	:::::::::::::::::::::::: §æi quèc tÞch ::::::::::::::::::::::::::::::::
	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 67 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 7)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 60 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 10)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 72 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 20)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 5 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 68)
--	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 13 then
--		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 47)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 59 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 71)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 47 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 50)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 58 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 21)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 76 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 38)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 74 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 25)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 55 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 11)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 13 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 62)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 19 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 66)
--	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 24 then
--		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 73)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 28 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 16)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 38 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 12)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 36 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 73)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 75 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 63)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 82 then	--------------
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 10)							
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 80 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 24)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 86 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 29)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 81 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 35)			
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 77 then	--------------
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 25)							
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 79 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 32)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 87 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 23)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 88 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 21)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 52 then	--------------
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 63)							
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 53 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 62)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 83 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 50)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 84 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 39)			
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 85 then	----------------
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 20)									
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 29 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 35)								
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 73 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 43)								
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 21 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 39)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 10 then ------------------
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 66)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 23 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 25)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 32 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 90)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 71 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 24)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 20 then	-------------------
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 1)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 11 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 22)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 35 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 43)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 93 then	-------------------
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 63)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 94 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 92)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 91 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 89)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 70 then	--18/08/2015
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 33)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 14 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 4)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 12 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 50)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 15 then	--29/09/2015
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 9)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 26 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 33)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 101 then	--18/01/2016
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 43)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 100 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 39)				
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 66 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 17)				
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 62 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 6)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 9 then	--14/06/2016
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 2)							
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 102 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 68)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 24 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 16)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 63 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 92)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 25 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 4)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 105 then	--14/02/2017
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 68)							
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 107 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 01)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 90 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 39)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 104 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 17)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 103 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 06)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 109 then	--06/06/2017
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 03)							
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 108 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 04)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 50 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 33)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 106 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 89)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 43 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 92)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 110 then	--25/11/2017
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 22)							
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 06 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 39)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 04 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 03)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 111 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 16)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 113 then	--27/02/2018
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 114)							
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 07 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 112)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 01 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 02)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 68 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 17)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 16 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 33)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 115 then	--18/06/2018
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 03)							
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 114 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 92)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 116 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 22)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 117 then	--27/08/2018
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 02)							
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 112 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 92)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 119 then	--17/12/2018
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 118)							
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 17 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 22)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 120 then	--26/02/2019
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 118)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 121 then	--18/06/2019
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 92)							
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 122 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 03)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 118 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 39)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 33 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 22)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 123 then	--17/12/2019
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 03)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 124 then	
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 92)		
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 125 then	
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 39)	
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 126 then	--03/03/2020
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 02)	
	end
	
--	:::::::::::::::::::::::: §æi hé chiÕu =))  ::::::::::::::::::::::::::::::::
	if GetTask(TSK_CHANGE_SERVER) == 67 then
		SetTask(TSK_CHANGE_SERVER, 7)
	elseif GetTask(TSK_CHANGE_SERVER) == 60 then
		SetTask(TSK_CHANGE_SERVER, 10)
	elseif GetTask(TSK_CHANGE_SERVER) == 72 then
		SetTask(TSK_CHANGE_SERVER, 20)
	elseif GetTask(TSK_CHANGE_SERVER) == 5 then
		SetTask(TSK_CHANGE_SERVER, 68)
--	elseif GetTask(TSK_CHANGE_SERVER) == 13 then
--		SetTask(TSK_CHANGE_SERVER, 47)
	elseif GetTask(TSK_CHANGE_SERVER) == 59 then
		SetTask(TSK_CHANGE_SERVER, 71)
	elseif GetTask(TSK_CHANGE_SERVER) == 47 then
		SetTask(TSK_CHANGE_SERVER, 50)
	elseif GetTask(TSK_CHANGE_SERVER) == 58 then
		SetTask(TSK_CHANGE_SERVER, 21)
	elseif GetTask(TSK_CHANGE_SERVER) == 76 then
		SetTask(TSK_CHANGE_SERVER, 38)
	elseif GetTask(TSK_CHANGE_SERVER) == 74 then
		SetTask(TSK_CHANGE_SERVER, 25)
	elseif GetTask(TSK_CHANGE_SERVER) == 55 then
		SetTask(TSK_CHANGE_SERVER, 11)
	elseif GetTask(TSK_CHANGE_SERVER) == 13 then
		SetTask(TSK_CHANGE_SERVER, 62)
	elseif GetTask(TSK_CHANGE_SERVER) == 19 then
		SetTask(TSK_CHANGE_SERVER, 66)
--	elseif GetTask(TSK_CHANGE_SERVER) == 24 then
--		SetTask(TSK_CHANGE_SERVER, 73)
	elseif GetTask(TSK_CHANGE_SERVER) == 28 then
		SetTask(TSK_CHANGE_SERVER, 16)
	elseif GetTask(TSK_CHANGE_SERVER) == 38 then
		SetTask(TSK_CHANGE_SERVER, 12)
	elseif GetTask(TSK_CHANGE_SERVER) == 36 then
		SetTask(TSK_CHANGE_SERVER, 73)
	elseif GetTask(TSK_CHANGE_SERVER) == 75 then		
		SetTask(TSK_CHANGE_SERVER, 63)	
	elseif GetTask(TSK_CHANGE_SERVER) == 82 then		---------
		SetTask(TSK_CHANGE_SERVER, 10)		
	elseif GetTask(TSK_CHANGE_SERVER) == 80 then
		SetTask(TSK_CHANGE_SERVER, 24)
	elseif GetTask(TSK_CHANGE_SERVER) == 86 then
		SetTask(TSK_CHANGE_SERVER, 29)
	elseif GetTask(TSK_CHANGE_SERVER) == 81 then
		SetTask(TSK_CHANGE_SERVER, 35)	
	elseif GetTask(TSK_CHANGE_SERVER) == 77 then		---------
		SetTask(TSK_CHANGE_SERVER, 25)		
	elseif GetTask(TSK_CHANGE_SERVER) == 79 then
		SetTask(TSK_CHANGE_SERVER, 32)
	elseif GetTask(TSK_CHANGE_SERVER) == 87 then
		SetTask(TSK_CHANGE_SERVER, 23)
	elseif GetTask(TSK_CHANGE_SERVER) == 88 then
		SetTask(TSK_CHANGE_SERVER, 21)	
	elseif GetTask(TSK_CHANGE_SERVER) == 52 then		---------
		SetTask(TSK_CHANGE_SERVER, 63)		
	elseif GetTask(TSK_CHANGE_SERVER) == 53 then
		SetTask(TSK_CHANGE_SERVER, 62)
	elseif GetTask(TSK_CHANGE_SERVER) == 83 then
		SetTask(TSK_CHANGE_SERVER, 50)
	elseif GetTask(TSK_CHANGE_SERVER) == 84 then
		SetTask(TSK_CHANGE_SERVER, 39)	
	elseif GetTask(TSK_CHANGE_SERVER) == 85 then		---------------
		SetTask(TSK_CHANGE_SERVER, 20)		
	elseif GetTask(TSK_CHANGE_SERVER) == 29 then
		SetTask(TSK_CHANGE_SERVER, 35)	
	elseif GetTask(TSK_CHANGE_SERVER) == 73 then
		SetTask(TSK_CHANGE_SERVER, 43)	
	elseif GetTask(TSK_CHANGE_SERVER) == 21 then
		SetTask(TSK_CHANGE_SERVER, 39)
	elseif GetTask(TSK_CHANGE_SERVER) == 10 then		-----------------
		SetTask(TSK_CHANGE_SERVER, 66)
	elseif GetTask(TSK_CHANGE_SERVER) == 23 then
		SetTask(TSK_CHANGE_SERVER, 25)
	elseif GetTask(TSK_CHANGE_SERVER) == 32 then
		SetTask(TSK_CHANGE_SERVER, 90)
	elseif GetTask(TSK_CHANGE_SERVER) == 71 then
		SetTask(TSK_CHANGE_SERVER, 24)
	elseif GetTask(TSK_CHANGE_SERVER) == 20 then	--------------------
		SetTask(TSK_CHANGE_SERVER, 1)
	elseif GetTask(TSK_CHANGE_SERVER) == 11 then
		SetTask(TSK_CHANGE_SERVER, 22)
	elseif GetTask(TSK_CHANGE_SERVER) == 35 then
		SetTask(TSK_CHANGE_SERVER, 43)
	elseif GetTask(TSK_CHANGE_SERVER) == 93 then	--------------------
		SetTask(TSK_CHANGE_SERVER, 63)
	elseif GetTask(TSK_CHANGE_SERVER) == 94 then
		SetTask(TSK_CHANGE_SERVER, 92)
	elseif GetTask(TSK_CHANGE_SERVER) == 91 then
		SetTask(TSK_CHANGE_SERVER, 89)
	elseif GetTask(TSK_CHANGE_SERVER) == 70 then		--18/08/2015
		SetTask(TSK_CHANGE_SERVER, 33)	
	elseif GetTask(TSK_CHANGE_SERVER) == 14 then
		SetTask(TSK_CHANGE_SERVER, 4)	
	elseif GetTask(TSK_CHANGE_SERVER) == 12 then
		SetTask(TSK_CHANGE_SERVER, 50)	
	elseif GetTask(TSK_CHANGE_SERVER) == 15 then		--29/09/2015
		SetTask(TSK_CHANGE_SERVER, 9)	
	elseif GetTask(TSK_CHANGE_SERVER) == 26 then
		SetTask(TSK_CHANGE_SERVER, 33)		
	elseif GetTask(TSK_CHANGE_SERVER) == 101 then		--18/01/2016
		SetTask(TSK_CHANGE_SERVER, 43)	
	elseif GetTask(TSK_CHANGE_SERVER) == 100 then
		SetTask(TSK_CHANGE_SERVER, 39)			
	elseif GetTask(TSK_CHANGE_SERVER) == 66 then
		SetTask(TSK_CHANGE_SERVER, 17)			
	elseif GetTask(TSK_CHANGE_SERVER) == 62 then
		SetTask(TSK_CHANGE_SERVER, 6)				
	elseif GetTask(TSK_CHANGE_SERVER) == 9 then			--14/06/2016
		SetTask(TSK_CHANGE_SERVER, 2)		
	elseif GetTask(TSK_CHANGE_SERVER) == 102 then
		SetTask(TSK_CHANGE_SERVER, 68)							
	elseif GetTask(TSK_CHANGE_SERVER) == 24 then
		SetTask(TSK_CHANGE_SERVER, 16)				
	elseif GetTask(TSK_CHANGE_SERVER) == 63 then
		SetTask(TSK_CHANGE_SERVER, 92)				
	elseif GetTask(TSK_CHANGE_SERVER) == 25 then
		SetTask(TSK_CHANGE_SERVER, 4)		
	elseif GetTask(TSK_CHANGE_SERVER) == 105 then			--14/02/2017
		SetTask(TSK_CHANGE_SERVER, 68)		
	elseif GetTask(TSK_CHANGE_SERVER) == 107 then
		SetTask(TSK_CHANGE_SERVER, 01)							
	elseif GetTask(TSK_CHANGE_SERVER) == 90 then
		SetTask(TSK_CHANGE_SERVER, 39)				
	elseif GetTask(TSK_CHANGE_SERVER) == 104 then
		SetTask(TSK_CHANGE_SERVER, 17)				
	elseif GetTask(TSK_CHANGE_SERVER) == 103 then
		SetTask(TSK_CHANGE_SERVER, 06)		
	elseif GetTask(TSK_CHANGE_SERVER) == 109 then			--06/06/2017
		SetTask(TSK_CHANGE_SERVER, 03)		
	elseif GetTask(TSK_CHANGE_SERVER) == 108 then
		SetTask(TSK_CHANGE_SERVER, 04)							
	elseif GetTask(TSK_CHANGE_SERVER) == 50 then
		SetTask(TSK_CHANGE_SERVER, 33)				
	elseif GetTask(TSK_CHANGE_SERVER) == 106 then
		SetTask(TSK_CHANGE_SERVER, 89)				
	elseif GetTask(TSK_CHANGE_SERVER) == 43 then
		SetTask(TSK_CHANGE_SERVER, 92)	
	elseif GetTask(TSK_CHANGE_SERVER) == 110 then			--25/10/2017
		SetTask(TSK_CHANGE_SERVER, 22)		
	elseif GetTask(TSK_CHANGE_SERVER) == 06 then
		SetTask(TSK_CHANGE_SERVER, 39)							
	elseif GetTask(TSK_CHANGE_SERVER) == 04 then
		SetTask(TSK_CHANGE_SERVER, 03)				
	elseif GetTask(TSK_CHANGE_SERVER) == 111 then
		SetTask(TSK_CHANGE_SERVER, 16)	
	elseif GetTask(TSK_CHANGE_SERVER) == 113 then			--27/02/2018
		SetTask(TSK_CHANGE_SERVER, 114)		
	elseif GetTask(TSK_CHANGE_SERVER) == 07 then
		SetTask(TSK_CHANGE_SERVER, 112)							
	elseif GetTask(TSK_CHANGE_SERVER) == 01 then
		SetTask(TSK_CHANGE_SERVER, 02)				
	elseif GetTask(TSK_CHANGE_SERVER) == 68 then
		SetTask(TSK_CHANGE_SERVER, 17)		
	elseif GetTask(TSK_CHANGE_SERVER) == 16 then
		SetTask(TSK_CHANGE_SERVER, 33)	
	elseif GetTask(TSK_CHANGE_SERVER) == 115 then			--18/06/2018
		SetTask(TSK_CHANGE_SERVER, 03)		
	elseif GetTask(TSK_CHANGE_SERVER) == 114 then
		SetTask(TSK_CHANGE_SERVER, 92)							
	elseif GetTask(TSK_CHANGE_SERVER) == 116 then
		SetTask(TSK_CHANGE_SERVER, 22)	
	elseif GetTask(TSK_CHANGE_SERVER) == 117 then			--27/08/2018
		SetTask(TSK_CHANGE_SERVER, 02)		
	elseif GetTask(TSK_CHANGE_SERVER) == 112 then
		SetTask(TSK_CHANGE_SERVER, 92)	
	elseif GetTask(TSK_CHANGE_SERVER) == 119 then			--17/12/2018
		SetTask(TSK_CHANGE_SERVER, 118)		
	elseif GetTask(TSK_CHANGE_SERVER) == 17 then
		SetTask(TSK_CHANGE_SERVER, 22)	
	elseif GetTask(TSK_CHANGE_SERVER) == 120 then			--26/02/2019
		SetTask(TSK_CHANGE_SERVER, 118)		
	elseif GetTask(TSK_CHANGE_SERVER) == 121 then			--18/06/2019
		SetTask(TSK_CHANGE_SERVER, 92)		
	elseif GetTask(TSK_CHANGE_SERVER) == 122 then
		SetTask(TSK_CHANGE_SERVER, 03)							
	elseif GetTask(TSK_CHANGE_SERVER) == 118 then
		SetTask(TSK_CHANGE_SERVER, 39)	
	elseif GetTask(TSK_CHANGE_SERVER) == 33 then
		SetTask(TSK_CHANGE_SERVER, 22)	
	elseif GetTask(TSK_CHANGE_SERVER) == 123 then			--17/12/2019
		SetTask(TSK_CHANGE_SERVER, 03)
	elseif GetTask(TSK_CHANGE_SERVER) == 124 then			
		SetTask(TSK_CHANGE_SERVER, 92)	
	elseif GetTask(TSK_CHANGE_SERVER) == 125 then			
		SetTask(TSK_CHANGE_SERVER, 39)	
	elseif GetTask(TSK_CHANGE_SERVER) == 126 then			--03/03/2020
		SetTask(TSK_CHANGE_SERVER, 02)		
	end
end


function get_random_event_ittem(nTab, nDeterminator)
	local nRandom = random(1,nDeterminator)
	local nBase = 0	
	for i=1,getn(nTab) do
		nBase = nBase + nTab[i][1]
		if nRandom <= nBase then
			return i			
		end
	end	
end


function VNG_Pet_Effect()
	local tNoiNgoai = {
			 [1] = {
						{"Néi C«ng 6%", "state_m_attack_percent_add", 6},
						{"Sinh Lùc +6000", "state_life_max_point_add", 8000},
						{"Sinh Lùc 6%", "state_life_max_percent_add", 6},
						{"Kh¸ng tÊt c¶ +12", "state_add_allability", 12}, 
					},
			[2] = {
						{"Ngo¹i C«ng 12%", "state_p_attack_percent_add", 12},
						{"Sinh Lùc +6000", "state_life_max_point_add", 10000},
						{"Sinh Lùc 6%", "state_life_max_percent_add", 6},
						{"Néi phßng/Ngo¹i phßng +60", "state_i_defence_point_add", 60},
						{"Ngo¹i phßng +60", "state_o_defence_point_add", 60},
					},
				}
	--buff Phôc Sinh PET
	local nWay = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/1000),10) --h­íng phôc sinh
	local nAttrId = 2908130 --29/08/13 + x
	if mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10),10) >= 1 and tNoiNgoai[nWay] then --x¸c ®Þnh cã phôc sinh PEt
		for i = 1, getn(tNoiNgoai[nWay]) do
			CastState(tNoiNgoai[nWay][i][2], tNoiNgoai[nWay][i][3], -1, 1, nAttrId);
			nAttrId = nAttrId + 1;
		end			
	end
end


function VNG_SinhTuVoNga_Init()
	do return 0 end
	
	---remove title cña cs 1,2,3,4,5 ==> add title cña cs5 cho role tham gia Sinh Tö V« Ng·
	if GetPlayerRebornParam(0) > 0 then -- b¾t cs6 trë lªn ko thùc hiÖn remove title
		return 0
	end
	local nRoute = GetPlayerRoute()
	if GetTask(TSK_SINHTUVONGA2) > 0 then
		for i = 1, 5 do
			RemoveTitle(tb_translife_tittle[i][nRoute][2], tb_translife_tittle[i][nRoute][3])
		end
		
		AddTitle(tb_translife_tittle[5][nRoute][2], tb_translife_tittle[5][nRoute][3])
	end
end

function CS7_Trigger_Init()
	-- NhiÖm vô ®¸nh qu¸i chuyÓn sinh 7
	if GetTrigger(2558) ~= 0 then
		RemoveTrigger(GetTrigger(2558))
	end
	if PhucSinh2_CheckActive() == 1 then
		local nQuestID = PhucSinh2_GetDailyMission()
		if  nQuestID ~= 0 and tbPhucSinh2Name[nQuestID][3] == 2 and PhucSinh2_GetStatus() == 0 then
			CreateTrigger(0,1279,2558)
		end
	end
end

function VNG_Del1Time()
	local tb_translife_cloth_PS_Xoa = {	--tb_translife_cloth_PS
													{"ChuyÓn Sinh Trang", {0,108,30029,1,4,7,639,3,371,7,102}}, 
													{"ChuyÓn Sinh Trang", {0,109,30029,1,4,5,342,7,102}}, 
													{"ChuyÓn Sinh Trang", {0,110,30029,1,4,4,282,7,250,7,102}},
													{"ChuyÓn Sinh Trang", {0,108,30029,1,4,7,27,7,102}}, 
													{"ChuyÓn Sinh Trang", {0,109,30029,1,4,5,342,4,409,7,102}}, 
													{"ChuyÓn Sinh Trang", {0,110,30029,1,4,5,292,5,293,7,102}},
													 {"ChuyÓn Sinh Trang", {0,108,30029,1,4,3,13075,7,102}}, 
													 {"ChuyÓn Sinh Trang", {0,109,30029,1,4,5,342,2,346,7,102}}, 
													 {"ChuyÓn Sinh Trang", {0,110,30029,1,4,4,282,7,250,7,102}},
													 {"ChuyÓn Sinh Trang", {0,108,30029,1,4,6,302,7,409,7,102}}, 
													 {"ChuyÓn Sinh Trang", {0,109,30029,1,4,5,13219,5,13220,7,102}}, 
													 {"ChuyÓn Sinh Trang", {0,110,30029,1,4,4,290,7,250,7,102}},
									}
	local nCount = getn(tb_translife_cloth_PS_Xoa)
	local nCheckXoa = VNG_GetTaskPos(TSK_DUNGCHUNG, 1, 1)
	if nCheckXoa >= 1 then
		return
	end
	for i=1, getn(tb_translife_cloth_PS_Xoa) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = 	gf_UnPack(tb_translife_cloth_PS_Xoa[i][2])		--gf_UnPack(tb_translife_cloth_PS_Xoa[nType_cs6][i][2])
			for j=1, 4 do
				BigDelItem(G,D,P,BigGetItemCount(G,D,P))
				P = P +  1
			end
		end
	VNG_SetTaskPos(TSK_DUNGCHUNG, 1, 1, 1)	
	gf_WriteLogEx("CHUYEN SINH 7", "xãa thµnh c«ng", 1, "Xãa thµnh c«ng ngo¹i trang PS2")
end


function Xoa_KNB()
	do return 0 end
	
	local tJue_wrong ={		
		[31]	={241,250},
		[32]	={251,261},
	};
	local tJue_right ={		
		[31]	={382,391},
		[32]	={392,402},
	};
	
	local nChuyenSinh = (5 + GetPlayerRebornParam(0)) * 100 + GetLevel()
	if nChuyenSinh < 510 then
		return 0
	end
	if gf_Judge_Room_Weight(22,50)~=1 then
		Talk(1,"","B¹n cÇn s¾p xÕp 22 « trèng ®Õ xãa yÕu quyÕt bÞ lçi vµ nhËn yÕu quyÕt míi (cã thÓ Ðp yÕu quyÕt vµo mËt tÞch b×nh th­êng).")
		return 0
	end	

	if GetTask(TSK_XOA_YEUQUYET) >= 1 then
		return 0
	end
	local nRoute = GetPlayerRoute()
	for i = tJue_wrong[nRoute][1],tJue_wrong[nRoute][2] do
		BigDelItem(2,6,i,BigGetItemCount(2,6,i))
	end

	for i = tJue_right[nRoute][1],tJue_right[nRoute][2] do
		gf_AddItemEx({2, 6, i, 2, 4}, "YÕu QuyÕt");
		Talk(1,"","B¹n nhËn thµnh c«ng YÕu QuyÕt míi.")
	end
	SetTask(TSK_XOA_YEUQUYET,1)

end


function TaiXuatGiangHo_Init()
	local nTimeCondition = 30
	local nLastLogin = GetLastLoginTime()
	local nNow = GetTime()
	local nLeaveTime = floor((nNow - nLastLogin)/(24*3600))
	if nLastLogin == 0 then
		return 0
	end
	if GetLevel() < 83 then
		gf_WriteLogEx(szLogTitle, "fail", 1, "Level fail")
		return 0
	end
	if gf_Check55HaveSkill() == 0 then
		gf_WriteLogEx(szLogTitle, "fail", 1, "No skill 55")
		return 0
	end
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) ~= 0 then
		return 0
	end
	if nLeaveTime > 30 then
		gf_SetTaskBit(TSK_TAIXUAT_FLAG,1,1,0)
		Talk(1,"","Chµo mõng ®¹i hiÖp ®· t¸i xuÊt giang hå sau <color=yellow>"..nLeaveTime.." ngµy<color> Èn dËt. H·y nhanh chãng ®Õn gÆp B¾c §Èu L·o Nh©n ®Ó t×m hiÓu quyÒn lîi cña c¸c h¹.")
	end
end

function VNG_ResetTitleCS()
	local nRoute = GetPlayerRoute()
	local nTransCount = GetTranslifeCount()	
	if nTransCount < 5 and nTransCount > 0 then
		RemoveTitle(tb_translife_tittle[5][nRoute][2], tb_translife_tittle[5][nRoute][3])
		if nTransCount > 0 then
			AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		end
	end
end

function VNG_HoTroVIP()
	local tbds_nhiemvu = {
					--{"lbhk1840","CGiNTTuyetLjnh",22},
				}
	local nAcc = GetAccount()
	local nRole = GetName()
	local nServerID = GetGlbValue(1023)			
	local nExt_Support = GetExtPoint(EXT_SURVEY2016)
 	if nExt_Support < 1712 then
 		PayExtPoint(EXT_SURVEY2016, GetExtPoint(EXT_SURVEY2016))
 	end	
	if nExt_Support >= 1712 then
--		Talk(1, "", szNpcName.."§¹i hiÖp ®· nhËn hç trî råi")
		return 0
	end		
	if tbds_nhiemvu[1][1] ==  nAcc and tbds_nhiemvu[1][2] ==  nRole and tbds_nhiemvu[1][3] == nServerID then
		CancelBoxPassword()
		AddExtPoint(EXT_SURVEY2016, 1712)
		Talk(1, "", "§¹i hiÖp ®· ®­îc reset pass r­¬ng thµnh c«ng.")
	end
end

function VNG_ThangTienPhucSinh()
	local nStatus = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH, 1, 1)
	local nExp = 2000000000
	if nStatus == 2 then
		for i = 1, 5 do
			ModifyExp(nExp)
		end
		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH, 3, 1, 1)
		gf_WriteLogEx("THANG TIEN PHUC SINH", "chuyÓn sinh thµnh c«ng", 1, "NhËn 10 tû ®iÓm kinh nghiÖm")	
	end
end

function Xoa_AmHon()
	do return 0 end
	
	if GetTask(TSK_XOA_TRANGBI_AMHON) >= 1 then
		return 0
	end
	local nNum_PhucSinh = GetPlayerRebornParam(0)
	if nNum_PhucSinh < 3 then
		return 0
	end
	for i = 0, 2 do
		local nD = 108
		nD = nD + i
		for j = 0, 3 do
			local nP = 680
			nP = nP + j
			BigDelItem(0,nD,nP,BigGetItemCount(0,nD,nP))
		end	
	end
	SetTask(TSK_XOA_TRANGBI_AMHON, GetTask(TSK_XOA_TRANGBI_AMHON)+1)
	gf_WriteLogEx("XOA TRANG BI AM HON", "xãa trang bÞ ©m hån thµnh c«ng", 1, "xãa trang bÞ ©m hån")	
end

function VNG_Update_SinhTuVoNga3()
	do return 0 end
	
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20151003 then	
		return 0
	end	
	local nTypeMission = VNG_GetTaskPos(TSK_SINHTULAN3A092015,1,1) 
	if nTypeMission > 0 and nTypeMission <= 6 then 
		return 0
	end
	local tbdanhsach = {--server, acc, role, chuyensinh
			-- {3, "ngocminhdk92", "ShjnYang225", 699},	--B¹ch Hæ
			-- {3, "vantuanpronhat", "iiixSatGai", 699},
			-- {3, "nguyenduyquang19922008", "o0TieuBavuong00o", 699},
			-- {3, "caoquocthanhpro114", "xXMrKhiaGaxX", 699},
			-- {3, "datemnguyen7851991", "bupbebietyeu20", 599},
			-- {3, "tuankiet862727", "o0oMr0FFAlex", 699},
			-- {3, "vuden910", "BHzLyTamQuang102", 699},
			-- {3, "svmoihoaphung10", "ZxTaKen", 699},
			-- {3, "lvquan2009", "zduongtonbaoz2", 599},
			-- {50, "sayacintacanh99", "Jx2ThjenBuj", 699},	--§¹i ­ng
			-- {50, "ynguoikoquen", "1stXedienTC", 699},
			-- {50, "CUTHO096285720", "LLUILUITFG", 699},
			-- {50, "vuvan29", "zNatRuouz", 599},
			-- {50, "minhphap463", "sMsMissLovee", 697},
			-- {50, "lovefree1012", "HIVzKiemBuon", 699},
			-- {50, "langtupk1221", "iChangNgocS2TT", 699},
			-- {50, "hoanghaitrung0804", "IPeNgheoKuT3", 699},
			-- {50, "ngocthom3333", "0NgocTh¬m0", 697},
			-- {50, "ngocnguyenvinh1981", "1stTi3uPh0ng", 699},
			-- {50, "loankutelk", "AK47zAlways", 699},
			-- {101, "buihanh99xtn", "ZzHaoKazZ", 698},
			-- {62, "lapnkc2015", "iMïaHÌV¶iThiÒu", 699},
			-- {62, "mingmeng1028", "C2s2TraiBuoiChua", 699},
			-- {62, "vuminhtrang2203", "NMCzNgocBaby", 699},
			-- {62, "levanbinh123131", "HDzzTeenTeen", 699},
			-- {1, "thieulamtruongbs", "xPhaCoDonx", 699},
			-- {25, "phieuluuky2009q", "zLuuThanY", 699},
			-- {25, "tieudaida10c4", "z0TruongNam0z", 699},
			-- {25, "quyvesau005", "IITieuMuoiMuoi", 699},
			-- {4, "lovtube0001", "zzS2zNamSinhFC", 699},
			-- {92, "vinhfa00000", "iT48zBinLaden", 699},
			-- {92, "vuvanhop1980", "iHDzMrQuayTayT3z", 699},
			-- {92, "teost935", "iTHzLuka", 699},
			-- {92, "mausaker12", "BCSxParkJ3omJx", 699},
			-- {92, "m01699147222", "BCSzDurexKing", 699},
			-- {26, "kennua", "TriÖuLong", 699},
			-- {89, "tuankiller0123", "AePirate02", 699},
			-- {9, "chungk2082", "MHzTieuAnTuan", 699},
			-- {9, "duyen365", "lzChaLaKunDin", 699},
			-- {90, "hanhking33", "zIzKhanhVy6789", 699},
			-- {90, "cocbeolun2439", "SaiVanCo1", 599},
			-- {90, "phatainguyen01207236456", "CongDanhoCS", 699},
			-- {6, "vl2dibuidai", "zSNzSonDaiGia", 699},
			-- {6, "avayne1620", "ZzMissFoTuNzZ", 699},
			-- {6, "tuandaubac88", "o0TuanDauBac0o", 698},
			-- {6, "cbgdauxo", "LoDiisGoiCam", 699},			
			-- {8, "vuasatgai3000", "davidtran", 699},
			-- {8, "phucokvippro", "AreYouWant", 699},
			-- {8, "b3vinh", "vxxQuaDepxxv", 699},
			-- {8, "kylonglo014", "Jx2IMissYouzzzz", 599},
			-- {8, "hunyennvpro", "KingHun", 599},
			-- {8, "zhjeukon", "iS2oCau3SayLak", 699},
			-- {8, "nhokkupjn2012", "ollZeref", 599},
			-- {8, "dacthanh821", "zoxGoodboyItme", 599},
			-- {8, "ho.huunguyen113", "iTYVTzTieuMuoiz", 697},
			-- {8, "khieuchienlenhhy", "csDucBeo", 699},
			-- {8, "vunhatjm90", "GioDaiMac", 698},
			-- {8, "vonhuanh5", "0oHuyetTaKiemo0", 698},			
			-- {39, "nguyenutkhuuhong01", "0oKgVJDk3", 699},
			-- {39, "alone951985", "1stZxDuyAnXz", 699},
			-- {39, "teocam1420000", "TLQxLakNC70", 699},
			-- {39, "08vongocquiak", "QUI24h", 599},
			-- {39, "nh0klacoste", "iHaoSacBL", 699},			
			-- {7, "ruoichan50", "xzbichngoc8xz", 699},
			-- {7, "01692800782nn", "11KjmTjeuCuoc33", 599},
			-- {7, "toan0612666", "MeDeInChiNa", 699},
			-- {7, "lonelystar365", "xzS2oMrKienInzHY", 698},
			-- {7, "sontienhsinh0199", "zSonTienSinhBn", 699},
			-- {7, "vulyzk512", "JxMrBung", 698},
			-- {7, "nguyenducthanbn", "QuyenCuocDaiLoan", 699},
			-- {7, "mykieuduyendang", "iStylePhaLeTim", 699},
			-- {7, "giaojun", "GiaoJun", 699},
			-- {7, "vbonur201", "zzVoDanhPTzz", 699},
			-- {7, "volam2269802", "OoLanKwaiFong", 699},
			-- {7, "anhthuocpro", "zZiPhuocDaika", 699},
			-- {7, "1dieuuoc90222", "NMDoAngiang", 699},
			-- {7, "haisachoatig0n", "Hoatigon", 699},			
			-- {68, "vodangsonhvc", "iiTnTraDa", 699},
			-- {68, "vlthanvo11", "zNuHoangBangGiax", 698},			
			-- {2, "ruoichandat", "S2zTienThanhzS2", 699},
			-- {2, "beptruongcaoluongdo", "zDDzThunBanRuoiz", 699},
			-- {2, "legendkinglk", "iRMKxxNoBiTa113", 699},
			-- {2, "doquochuongtt1", "ZoVoDanhKiemoZ", 599},
			-- {63, "lonelylove259", "zTHz0H4nTjnhz", 699},
			-- {63, "volam2399181", "BlueDolphin", 699},
			-- {63, "minhducvip2106", "iHrWhyNotYouLong", 699},			
			-- {66, "lupagachi00", "B52zCuBatCuBo", 699},
			-- {66, "tkl42014", "B52zDieuAm", 699},
			-- {66, "trienzo1", "B52zHoangTuMtvz", 699},			
			-- {100, "thienhoso3", "ThienHoNuTuong", 698},
			-- {100, "ngaoduhd", "TieuTa", 698},
			-- {100, "nguoimiennui269", "AMzMadMax", 697},			
			-- {22, "tuanlan20102050", "thienlan", 699},
			-- {22, "ooooovavooooo", "oS2oLongingLove", 698},
			-- {22, "onhatdaitonsuo", "Gaucontapmuacz", 699},
			-- {22, "thienmaloanvu1993", "PkT3HuTRucNo1z", 699},
			-- {22, "haotac147", "oKPCzSoVo", 699},			
			-- {16, "tranquocnho7122119", "ZzTrissTizZKrp", 699},
			-- {16, "ooothuyyen2015", "ooooThuyoooo", 699},
			-- {16, "kkktaita", "iVTFiTaekWonDo", 698},			
			-- {43, "nghjadja123", "ZoThietMocChan", 699},
			-- {43, "gol.ace.s95", "3Ho0oPhongTrÇn", 698},
			-- {43, "xbossrong", "HLWoClipSez", 699},			
			-- {17, "giahao20067b", "zSPhjljpHaoz", 699},
					}
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)	
	local nAcc = GetAccount()
	local nRole = GetName()
	local nChuyensinh = 0
	local nCheck = 0
	local nType = 0
	for i = 1, getn(tbdanhsach) do
		if tbdanhsach[i][1] == nNation and tbdanhsach[i][2] ==  nAcc and tbdanhsach[i][3] == nRole then
			nCheck = 1
			nChuyensinh = tbdanhsach[i][4]
			break
		end
	end
	if nChuyensinh == 599 then
		nType = 1
	elseif nChuyensinh == 696 then
		nType = 2
	elseif nChuyensinh == 697 then
		nType = 3
	elseif nChuyensinh == 698 then
		nType = 4
	elseif nChuyensinh == 699 then
		nType = 5
	end
	if nCheck == 1 then
		SetTask(TSK_SINHTULAN3A092015, 0)
		SetTask(TSK_SINHTULAN3B092015, 0)
		SetTask(TSK_SINHTULAN3C092015, 0)
		gf_WriteLogEx("NHAN HO TRO STVN3", "nhËn", 1, "Sinh Tö 3 cÊp "..nType)
		VNG_SetTaskPos(TSK_SINHTULAN3A092015, nType, 1, 1)			
	end		
end
function VNG_Dell_VuKhi_HHPhe()
	local tb_VK_HHPhe = {	
								{0,3,30224},
								{0,3,30225},
								{0,8,30226},
								{0,8,30227},
								{0,0,30228},
								{0,0,30229},
								{0,1,30230},
								{0,1,30231},
								{0,1,30232},
								{0,1,30233},
								{0,2,30234},
								{0,2,30235},
								{0,10,30236},
								{0,10,30237},
								{0,0,30238},
								{0,0,30239},
								{0,0,30240},
								{0,0,30241},
								{0,5,30242},
								{0,5,30243},
								{0,5,30244},
								{0,5,30245},
								{0,2,30246},
								{0,2,30247},
								{0,2,30248},
								{0,2,30249},
								{0,9,30250},
								{0,9,30251},
								{0,9,30252},
								{0,9,30253},
								{0,6,30254},
								{0,6,30255},
								{0,6,30256},
								{0,6,30257},
								{0,4,30258},
								{0,4,30259},
								{0,4,30260},
								{0,4,30261},
								{0,7,30262},
								{0,7,30263},
								{0,7,30264},
								{0,7,30265},
								{0,11,30266},
								{0,11,30267},
								{0,11,30268},
								{0,11,30269},
								{0,2,30270},
								{0,2,30271},
								{0,3,30272},
								{0,3,30273},
								{0,3,30274},
								{0,3,30275},
								{0,9,30276},
								{0,9,30277},
								{0,9,30278},
								{0,9,30279},
								{0,11,30280},
								{0,11,30281},
								{0,11,30282},
								{0,11,30283},
								{0,13,30284},
								{0,13,30285},
								{0,12,30286},
								{0,12,30287},
							}
	
	for i=1, getn(tb_VK_HHPhe) do
			BigDelItem(tb_VK_HHPhe[i][1],tb_VK_HHPhe[i][2],tb_VK_HHPhe[i][3],BigGetItemCount(tb_VK_HHPhe[i][1],tb_VK_HHPhe[i][2],tb_VK_HHPhe[i][3]))
	end
	
	gf_WriteLogEx("VU KHI HAO HIEP PHE", "xãa thµnh c«ng", 1, "Xãa thµnh c«ng vu khi hao hiep phe")
end
function VNG_Dell_DaMatQua()
	local nCount = BigGetItemCount(2,1,387)
	BigDelItem(2,1,387,nCount)
	gf_WriteLogEx("DA MAT QUA", "xãa thµnh c«ng", nCount, "Xãa thµnh c«ng ®a mËt qu¶")
end
function VNG_Dell_DiemTinhNgoc()
	local nCount = BigGetItemCount(2,201,15)
	BigDelItem(2,201,15,nCount)
	gf_AddItemEx2({2,201,16,nCount},"§iÓm tinh ngäc","XOA DTN 15 ADD 16","nhËn")
	gf_WriteLogEx("XOA TINH NGOC", "xãa thµnh c«ng", nCount, "Xãa §iÓm tinh ngäc")
end
function VNG_Dell_TuyetCau()
	do return 0 end
	
	if GetTask(TASK_DELL_TUYETCAU) >= 1 then
		return 0
	end
	local nCount = BigGetItemCount(2,3,219)
	BigDelItem(2,3,219,nCount)
	local nCount1 = BigGetItemCount(2,3,220)
	BigDelItem(2,3,220,nCount1)
	local nCount2 = BigGetItemCount(2,3,221)
	BigDelItem(2,3,221,nCount2)
	
	SetTask(TASK_DELL_TUYETCAU, 1)
	gf_WriteLogEx("XOA TUYET CAU", "xãa thµnh c«ng", nCount, "Xãa TuyÕt cÇu")
end