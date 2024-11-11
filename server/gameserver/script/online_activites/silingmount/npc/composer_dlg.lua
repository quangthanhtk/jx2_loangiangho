Import("\\script\\warlord\\preload.lua");
Include("\\script\\online_activites\\silingmount\\string.lua");
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\silingmount\\silingmount.lua")
Include("\\script\\pet\\forget_pet_skill.lua")
Include("\\script\\pet\\pet_get_booklv5.lua")
Include("\\script\\pet\\pet_get_booklv6.lua")
Include("\\script\\pet\\pet_get_booklv7.lua")
Include("\\script\\vng\\bandonghanh6\\bandonghanh6.lua")
function main()
	-- if (gf_CheckEventDateEx(VET_SILING_MOUNT_ACTIVITY_ID) ~= 1) then
	-- 	return
	-- end
	local strTitle = VET_TB_SILING_NPC_DLG[6];
	local tbOpt = 
	{
--		format("%s/%s",VET_TB_SILING_NPC_DLG[7],"ComposeSilingMount"),
--		format("%s/%s",VET_TB_SILING_NPC_DLG[8],"VET_SilingMountEvolution_Dlg"),
--		format("%s/%s",VET_TB_SILING_NPC_DLG[9],"VET_SilingMountRestore_Dlg"),
--		"Ta mu�n ��i S�ch B�n ��ng H�nh C�p 6./pet_changebooklv6",
		--"Mua tr�ng pet B�ch Y�u Nguy�n Th�n./buy_bachyeunguyenthan", --LongDaiKa: ��ng t�nh n�ng
--		"Mua Chi�u Y�u K� (PET si�u c�p c�p 7)./buy_chieuyeuky",
		"B� k� n�ng h� tr� c�a ��ng h�nh./ForgetPetSkillMain",
		"��i k� n�ng Th� C�ng 5 l�y Kim Ng�c Di�p./pet_getbooklv5",
		"��i k� n�ng Th� C�ng 6 l�y Kim Ng�c Di�p./pet_getbooklv6",
		"��i k� n�ng Th� C�ng 7 l�y Kim Ng�c Di�p./pet_getbooklv7",
		format("%s/%s",VET_TB_SILING_NPC_DLG[3],"gf_DoNothing"),
	};
	Say(strTitle, getn(tbOpt), tbOpt);
end