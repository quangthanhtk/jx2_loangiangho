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
--		"Ta muèn ®æi S¸ch B¹n §ång Hµnh CÊp 6./pet_changebooklv6",
		--"Mua trøng pet B¸ch Yªu Nguyªn ThÇn./buy_bachyeunguyenthan", --LongDaiKa: ®ãng tÝnh n¨ng
--		"Mua Chiªu Yªu Kú (PET siªu cÊp cÊp 7)./buy_chieuyeuky",
		"Bá kü n¨ng hç trî cña ®ång hµnh./ForgetPetSkillMain",
		"§æi kü n¨ng Thó C­ng 5 lÊy Kim Ngäc DiÖp./pet_getbooklv5",
		"§æi kü n¨ng Thó C­ng 6 lÊy Kim Ngäc DiÖp./pet_getbooklv6",
		"§æi kü n¨ng Thó C­ng 7 lÊy Kim Ngäc DiÖp./pet_getbooklv7",
		format("%s/%s",VET_TB_SILING_NPC_DLG[3],"gf_DoNothing"),
	};
	Say(strTitle, getn(tbOpt), tbOpt);
end