TCallFuture = {
	data = {},
}
function TCallFuture:insertevent(second, func, ...)
	tinsert(self.data, {second, func, arg, PlayerIndex, SubWorld});
end
function TCallFuture:breathe()
	local oldPlayerIdx = PlayerIndex;
	local oldSubWorld = SubWorld;
	for i = 1, getn(self.data) do
		local data = self.data[i];
		if data then
			data[1] = data[1] - 1;
			if data[1] <= 0 then
				PlayerIndex = data[4];
				SubWorld = data[5];
				data[2](gf_UnPack(data[3]));
				tremove(self.data, i);
				i = i - 1;
			end
		end
	end
	PlayerIndex = oldPlayerIdx;
	SubWorld = oldSubWorld;
end