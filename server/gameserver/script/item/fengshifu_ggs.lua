Include("\\script\\class\\ktabfile.lua");
Include("\\script\\paycoin_head.lua")

tabCorpseRevival = new(KTabFile, "\\settings\\skill\\corpse_revival.txt");

tItems = {
	{"Ti�u Dao Phong Thi Ph� (H�a K� L�n)", {1,7,46}, 50000 },
	{"Ti�u Dao Phong Thi Ph� (Li�t Nham Li Long)", {1,7,154}, 50000 },
	{"Ti�u Dao Phong Thi Ph� (Th��ng Th�n Doanh Thi�n)", {1,7,148}, 3000000},
	{"Ti�u Dao Phong Thi Ph� (B�c L�c L�m Minh Ch�)", {1,7,147}, 2500000},
	{"Ti�u Dao Phong Thi Ph� (Ng�u nhi�n)", {1,7,10000}, 1000},
}

function OnUse(nParticular)
	local tItem = getItem(nParticular);
	if not tItem then return 0 end
	local nRet = pc_pay_addtask(tItem[3]);
	if nRet ~= 1 then
		return nRet;
	end

	--����ͷ�ʬ�����ñ�
	--���ʽ��[particular] = {{lower = range_lower_1, upper = range_upper_1, probability = probability_1}, ..., {lower = range_lower_n, upper = range_upper_n, probability = probability_n}},
	--���У�particular����ʬ����ϸ�ࣻrange_lower_n����n�������Χ���ޣ�range_upper_n����n�������Χ���ޣ�probability_n����n�������Χ�ĸ��ʣ���Χ�е��������
	--�����Χ�е�ȡֵ����Ӧ��"corpse_revival.txt"�г���ͷ��ĵڼ���
	--�磺[10000] = {{lower = 41, upper = 70, probability = 60}, {lower = 71, upper = 71, probability = 10}, {lower = 72, upper = 81, probability = 30}}
	--ϸ��Ϊ10000�ķ�ʬ����
	--�г�"corpse_revival.txt"�г���ͷ��ĵ�41�е���70��ʬ��ĸ���Ϊ60 / (60 + 10 + 30) * 100% = 60%������[41, 70]��ÿ���кŵĸ���Ϊ60% / (70 - 41 + 1) = 2%
	--�г���71��ʬ��ĸ���Ϊ10 / (60 + 10 + 30) * 100% = 10%
	--�г���72�е���81��ʬ��ĸ���Ϊ30 / (60 + 10 + 30) * 100% = 30%������[72, 81]��ÿ���кŵĸ���Ϊ30% / (81 - 72 + 1) = 3%
	local tParticularRandom = {
	[10000] = {{lower = 1, upper = 46, probability = 2730},{lower = 47, upper = 50, probability = 190},{lower = 51, upper = 145, probability = 5640},{lower = 146, upper = 148, probability = 9},{lower = 150, upper = 150, probability = 1},{lower = 152, upper = 175, probability = 1430}}
	}

	if (tParticularRandom[nParticular] ~= nil) then
		local bRandomSuccessful = 0;

		local nTotalProbability = 0;

		local n = 0;
		while (tParticularRandom[nParticular][n + 1] ~= nil) do
			nTotalProbability = nTotalProbability + tParticularRandom[nParticular][n + 1]["probability"];
			n = n + 1;
		end

		if (nTotalProbability > 0) then
			local rand = random(nTotalProbability);
			for i = 1, n do
				if (rand <= tParticularRandom[nParticular][i]["probability"]) then
					nParticular = random(tParticularRandom[nParticular][i]["lower"], tParticularRandom[nParticular][i]["upper"]);
					bRandomSuccessful = 1;
					break;
				else
					rand = rand - tParticularRandom[nParticular][i]["probability"];
				end
			end
		end

		if (bRandomSuccessful == 0) then
			return 0;
		end
	end

	local szTemplateName = tostring(tabCorpseRevival:getCell(nParticular + 1, "NpcTemplateName"));
	local nSubwordID, nPX, nPY = GetWorldPos();
	if CreateNpcCorpse(szTemplateName, nSubwordID, nPX, nPY, 9 * 60) > 0 then
		return 1;
	else
		return 0;
	end
end

function getItem(nParticular)
	for i = 1, getn(tItems) do
		if nParticular == tItems[i][2][3] then
			return tItems[i];
		end
	end
end
