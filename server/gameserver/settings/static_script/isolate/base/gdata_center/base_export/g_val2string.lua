Include("\\settings\\static_script\\isolate\\base\\gdata_center\\export_base.lua")

_gVal2String = [[@
function (value, ind)
	ind = ind or ""
	if type(value) == "table" then
		local str = '{'
		local tmp_ind = ind..' '
		for k,v in value do
			str = str .. tmp_ind .. '['..gVal2String(k)..'] = ' .. gVal2String(v, tmp_ind) .. ','
		end
		str = str .. ind .. '}'
		return str;
	elseif type(value) == 'function' then
		return '"#FUNCTION"'
	elseif type(value) == 'string' then
		if strsub(value,1,1) == '@' then
			return strsub(value,2)
		else
			value = gsub(value, "\\", "\\\\")
			return '"'..value..'"'
		end
	elseif type(value) == 'boolean' then
		return '"'..tostring(value)..'"'
	else
		return tostring(value)
	end
end
]]

fn_export_gdata("gVal2String", _gVal2String)

