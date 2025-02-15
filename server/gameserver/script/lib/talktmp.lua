-- 对话模板

Include("\\script\\lib\\hash_callback.lua")
Include("\\script\\lib\\message.lua")

tTalk = {
	check = function(tTalk) end,	-- 检查 如果返回nil则直接退出
	commonSel = 0,					-- 每页都有的选项(从后面数n个)
	sel = {},						-- 选项
	makeSure = nil,					-- 确认 (默认选项和最后一个选项不需要确认)
}
function temp_Talk(self, nPage)
	if type(self) == "string" then
		self = GetTable(self);
	end
	if not self then return end
	if self.check and self.check(self) == nil then return end

	nPage = nPage or 0;
	local commonSel = self.commonSel or 0;
	local nLinePerPage = self.nLinePerPage or gLinePerPage or 10;
	local tSel = {}
	local nMin = 1 + nPage * nLinePerPage;
	local nMax = min( nMin + nLinePerPage - 1, getn(self.sel) - commonSel);
	for i=nMin, nMax do
		local callback = getcallback(self.sel[i][2], self);
		if callback then
			if self.makeSure
				and ((commonSel == 0 and i < getn(self.sel) - commonSel)
					or (commonSel > 0 and i <= getn(self.sel) - commonSel)) then
				callback = format('#makeSure("%s", %d, "%s")', HashTable(self), i, callback);
			end
			tinsert(tSel, format("%s/%s", self.sel[i][1], callback));
		end
	end
	local bReturn = 0;
	if nPage > 0 then
		tinsert(tSel, format("Trang trc/#temp_Talk('%s', %d)", HashTable(self), nPage - 1));
	end
	if nMax < getn(self.sel) - commonSel then
		tinsert(tSel, format("Trang k�/#temp_Talk('%s', %d)", HashTable(self), nPage + 1));
	end
	for i = getn(self.sel) - commonSel + 1,  getn(self.sel) do
		tinsert(tSel, format("%s/%s", self.sel[i][1], getcallback(self.sel[i][2], self)));
	end
	suSay( self.msg, getn(tSel), tSel);
end

function makeSure(self, nSel, cb)
	if type(self) == "string" then
		self = GetTable(self);
	end
	if not self then return end
	suSay(self.msg.."\n".."Чi hi謕 ch鋘 l� <color=gold>"..self.sel[nSel][1].."<color>\n i hi謕 x竎 nh ch�?",
		2,
		"ng v藋/"..cb,
		"Ta suy ngh� th猰 m閠 l竧/nothing");
end

function getcallback(cb, t)
	local tp = type(cb);
	if tp == "string" then return cb end
	if tp == "table" then return format("#temp_Talk('%s')",HashTable(cb)) end
	if tp == "function" then return cb(t) end
end
