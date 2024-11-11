Include("\\settings\\static_script\\isolate\\base\\gdata_center\\export_base.lua")

_gDebug = {
	enableDebug = 0,
	is_debug = [[@
		function(self)
			return self.enableDebug
		end
	]],
	show_msg = [[@
    	function (self, szMsg)
        	print(szMsg)
        	self:show_debug_msg(szMsg, 1)
        end
    ]],
    show_debug_msg = [[@
         function(self, szMsg, bHidePrint)
        	if self:is_debug() == 1 then
        		if not bHidePrint or bHidePrint==0 then
        			print(szMsg)
        		end
        		WriteLog(szMsg)
        	end
        end
    ]],
}

fn_export_gdata("gDebug", _gDebug)