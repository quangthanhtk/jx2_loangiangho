Include("\\settings\\static_script\\isolate\\base\\gdata_center\\export_base.lua")

--定义一个继承函数
_gInherit = [[@
function (base)
	local derive = {}
	local foo = function(t,i)
		return %base[i]
	end
	settag(derive,newtag())
	settagmethod(tag(derive),"index",foo)
	for i,v in base do
		if type(v) == "table" then
			derive[i] = gInherit(v)
		end
	end
	return derive
end
]]


fn_export_gdata("gInherit", _gInherit)