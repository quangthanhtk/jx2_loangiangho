-- ====================== ÎÄ¼þÐÅÏ¢ ====================== 
                                                          
-- ½£ÏÀÇéÔµonlineII Èý¼¶É±ÊÖ°ü¹ü½Å±¾                  
-- Edited by Starry                                 
-- 2005/12/5 PM 14:09                                    
                                                          
-- ======================================================
function OnUse()

local i = 0;
local j = 0;
local k = 0; 
local nCount = 0;
local nLuckyNum = 0;
local nNum = 0; 

	----VËt phÈm t¹m ®ãng
	do	Talk(1,"","V©t phÈm t¹m thêi kh«ng thÓ sö dông!")	return end
	--------------------
	if DelItem(2,1,207,1) ~= 1 then
		return 0
	end
	
	--100%³ö¸ß¼¶Ò©Æ·:3¸ö¾Å×ª
	--AddItem(1,0,32,3,1);
	
	--50%³ö½ðÎý
	if random(1,100) <= 50 then
		AddItem(2,1,149,1,1);
	end;
	
	--50%³öÔÉÌú
	if random(1,100) <= 50 then
		AddItem(2,2,8,1,1);
	end;
	
	--50%³öÔÉÌúËéÆ¬
	if random(1,100) <= 50 then
		AddItem(2,2,7,1,1);
	end;
		
	--50%³öÐ¡¿é½ðÎý
	if random(1,100) <= 50 then
		AddItem(2,1,148,1,1);
	end;
	
	--14%³öÉñÃØÎïÆ·
	if random(1,100) <= 14 then
		local m = random(1,getn(SecretItem));
			AddItem(SecretItem[m][1],SecretItem[m][2],SecretItem[m][3],1,1);
	end; 
	
	nNum = random(1,1000);
	--20.3%³ö¶¨ÖÆ×°±¸
	if nNum <= 203 then
	
		for i=1,getn(KillerBagData) do
			nCount = nCount + KillerBagData[i][1];
		end;
		
		nLuckyNum = random(1,nCount);
		nCount = 0;
		
		for i=1,getn(KillerBagData) do
			nCount = nCount + KillerBagData[i][1];
			if nCount>=nLuckyNum then
				k = getn(KillerBagData[i]);
				j = random(2,k);
				return AddItem(KillerBagData[i][j][1],KillerBagData[i][j][2],KillerBagData[i][j][3],KillerBagData[i][j][4],KillerBagData[i][j][5],KillerBagData[i][j][6],KillerBagData[i][j][7],KillerBagData[i][j][8],KillerBagData[i][j][9],KillerBagData[i][j][10],KillerBagData[i][j][11]);					
			end;
		end;
	end;
	
end;

KillerBagData = {
	--5¼¶»¤Éí,5¼¶½äÖ¸:¾­ÑéÌá¸ß3%;
	[1] = {14,{0,102,5,1,1,2,99,0,0,0,0},{0,102,15,1,1,2,99,0,0,0,0}},
	--5¼¶»¤Éí,5¼¶½äÖ¸:¼õÐèÇó2
	[2] = {29,{0,102,5,1,1,2,109,0,0,0,0},{0,102,15,1,1,2,109,0,0,0,0}},
	--40¼¶ÎäÆ÷,5¼¶»¤Éí,5¼¶½äÖ¸:Á¦Á¿13	¸ù¹Ç13	Éí·¨13;ÄÚ¹¦13	¸ù¹Ç13	¶´²ì13;¶´²ì13	Éí·¨13	¸ù¹Ç13
	[3] = {51,{0,102,5,1,1,5,95,5,94,5,96},
						{0,102,15,1,1,5,95,5,94,5,96},
						{0,102,5,1,1,5,98,5,94,5,97},
						{0,102,15,1,1,5,98,5,94,5,97},
						{0,102,5,1,1,5,97,5,96,5,94},
						{0,102,15,1,1,5,97,5,96,5,94},
						{0,0,8,1,1,3,86,4,98,2,64},
						{0,2,21,1,1,3,86,4,98,2,64},
						{0,0,8,1,1,3,85,4,95,2,63},
						{0,1,47,1,1,3,85,4,96,2,63},
						{0,9,80,1,1,3,85,4,97,2,63},
						{0,2,21,1,1,5,42,4,98,1,99},
						{0,10,69,1,1,3,86,4,98,2,64},
						{0,8,91,1,1,3,86,4,98,2,64},
						{0,5,34,1,1,3,85,4,95,2,63},
						{0,3,58,1,1,3,85,4,95,2,63},
						{0,6,102,1,1,3,85,4,95,2,63},
						{0,4,113,1,1,3,85,4,96,2,63},
						{0,11,6,1,1,3,86,4,98,2,64},
						{0,7,6,1,1,3,85,4,96,2,63},
					},
	}

SecretItem = {
	--Áú¹Ç
	[1] = {2,1,116},
	--Ê¬ÍõÀß¹Ç
	[2] = {2,1,118},
	--²ÔÀÇÑÀ
	[3] = {2,1,113},
	--À×Ñ×½ðÉ³
	[4] = {2,1,146},
	--·ÀË®ÓÍ³ñ
	[5] = {2,1,114},
	--ÌìÒÂÎÞ·ì
	[6] = {2,1,147},
	--Ä«ÓÍ
	[7] = {2,1,136},
	--È¾ÁÏ
	[8] = {2,1,153},		
}
