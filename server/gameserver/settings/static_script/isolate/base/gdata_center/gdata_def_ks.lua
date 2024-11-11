--Include by \settings\static_script\isolate\gdata_center\gdata_impl.lua

--define all gdata here
function GdataImpl:define_all_gdata_ks()
	self:define_gdata("gDebug", "table with show_msg(szMsg) show_debug_msg(szMsg, bHidePrint=0)")
	self:define_gdata("gVal2String", "gVal2String(value, ind='') support number string table function(string code)")
	self:define_gdata("gInherit", "gInherit(base) table copy")
	self:define_gdata("g_last_login_player_info", "test gdata watch event, last login player info")
end

