Include("\\script\\missions\\cangjianshanzhuang\\jt_npc.lua")

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua"); --LongDaiKa: th�m v�o �� d�ng g_WCFG
----------------------------------------------------------------------------------------------------

function main()
	if g_WCFG_VANKIEMTRUNG:IsDateOpen(1) ~= WEnv.TRUE then
		return WEnv.RETCODE_NOTOPEN;
	end

	return wjz_entry_npc_main()
end