--导出或编译全局符号

function __Val2String(value, ind)
	ind = ind or ""
	if type(value) == "table" then
		local str = '{'
		local tmp_ind = ind..' '
		for k,v in value do
			str = str .. tmp_ind .. '['..__Val2String(k)..'] = ' .. __Val2String(v, tmp_ind) .. ','
		end
		str = str .. ind .. '}'
		return str;
	elseif type(value) == 'function' then
		return '"#FUNCTION"';
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

function fn_export_gdata(name, data)
	if t_isolate_batch_export_gdata then --有导出列表就导出
		t_isolate_batch_export_gdata[name] = data	
	end
	--不管什么情况都先在本地编译
	local szCode = format("%s=%s", name, __Val2String(data))
	--print("fn_export_gdata", name, t_isolate_batch_export_gdata, getn(t_isolate_batch_export_gdata or{}), CALL_SCRIPT_NAME)
	return ExecuteScript(szCode)
end