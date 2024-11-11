tItem = {
    [PackItemId(2,1,31194)] = {--������
        [1] = {
            { 3084, "T�ng_Ti�m ph�ng c� Thanh Long T��ng Qu�n" },
            { 3085, "T�ng_Ti�m v� kh� Thanh Long T��ng Qu�n" },
            { 3086, "T�ng_Ti�m trang s�c Thanh Long T��ng Qu�n" },
            { 3087, "T�ng_Ti�m ph�ng c� Thanh Long Nguy�n So�i" },
            { 3088, "T�ng_Ti�m v� kh� Thanh Long Nguy�n So�i" },
            { 3089, "T�ng_Ti�m trang s�c Thanh Long Nguy�n So�i" },
        },
        [2] = {
            { 3090, "Li�u_Ti�m ph�ng c� Thanh Long T��ng Qu�n" },
            { 3092, "Li�u_Ti�m trang s�c Thanh Long T��ng Qu�n" },
            { 3091, "Li�u_Ti�m v� kh� Thanh Long T��ng Qu�n" },
            { 3093, "Li�u_Ti�m ph�ng c� Thanh Long Nguy�n So�i" },
            { 3094, "Li�u_Ti�m v� kh� Thanh Long Nguy�n So�i" },
            { 3095, "Li�u_Ti�m trang s�c Thanh Long Nguy�n So�i" },
        },
	},
	
	[PackItemId(2,1,31294)] = {--����֮��
        [1] = {
            {3102,"Ti�m Ph�ng C� T�ng-Uy H� T��ng Qu�n"},
            {3103,"Ti�m V� Kh� T�ng-Uy H� T��ng Qu�n"},
            {3104,"Ti�m Trang S�c T�ng-Uy H� T��ng Qu�n"},
            {3105,"Ti�m Ph�ng C� T�ng-Uy H� Nguy�n So�i"},
            {3106,"Ti�m V� Kh� T�ng-Uy H� Nguy�n So�i"},
            {3107,"Ti�m Trang S�c T�ng-Uy H� Nguy�n So�i"},
        },
        [2] = {
            {3108,"Ti�m Ph�ng C� Li�u-Uy H� T��ng Qu�n"},
            {3109,"Ti�m V� Kh� Li�u-Uy H� T��ng Qu�n"},
            {3110,"Ti�m Trang S�c Li�u-Uy H� T��ng Qu�n"},
            {3111,"Ti�m Ph�ng C� Li�u-Uy H� Nguy�n So�i"},
            {3112,"Ti�m V� Kh� Li�u-Uy H� Nguy�n So�i"},
            {3113,"Ti�m Trang S�c Li�u-Uy H� Nguy�n So�i"},
        },
    },
    [PackItemId(2,1,31514)] = {--��ȸ��
        [1] = {
			{3116,"Ti�m Ph�ng C� T�ng-Chu T��c T��ng"},	
			{3117,"Ti�m V� Kh� T�ng-Chu T��c T��ng"},	
			{3118,"Ti�m Trang S�c T�ng-Chu T��c T��ng"},	
			{3119,"Ti�m Ph�ng C� T�ng-Chu T��c So�i"},	
			{3120,"Ti�m V� Kh� T�ng-Chu T��c So�i"},	
			{3121,"Ti�m Trang S�c T�ng-Chu T��c So�i"},	
        },
        [2] = {
			{3122,"Ti�m Ph�ng C� Li�u-Chu T��c T��ng"},	
			{3123,"Ti�m V� Kh� Li�u-Chu T��c T��ng"},	
			{3124,"Ti�m Trang S�c Li�u-Chu T��c T��ng"},	
			{3125,"Ti�m Ph�ng C� Li�u-Chu T��c So�i"},	
			{3126,"Ti�m V� Kh� Li�u-Chu T��c So�i"},	
			{3127,"Ti�m Trang S�c Li�u-Chu T��c So�i"},	
        },
    },
}

tItem[PackItemId(2,1,31195)] = tItem[PackItemId(2,1,31194)]	--��������
tItem[PackItemId(2,1,31295)] = tItem[PackItemId(2,1,31294)]	--��������
tItem[PackItemId(2,1,31515)] = tItem[PackItemId(2,1,31514)]	--��ȸ����

function open_qinglong_equipshop()
	open_equipshop(PackItemId(2,1,31194), nil)
end

function open_huwei_equipshop()
	open_equipshop(PackItemId(2,1,31294), nil)
end

function open_zhuque_equipshop()
	open_equipshop(PackItemId(2,1,31514), nil)
end

function OnUse(nItemIndex)
	local g,d,p = GetItemInfoByIndex(nItemIndex)
	local id = PackItemId(g,d,p)
	return open_equipshop(id, nil)
end

function open_equipshop(nItemPackId, nIdx)
	local nType = 1
	if GetTask(704) < 0 then --���� ��
		nType = 2
	end
	local t = tItem[nItemPackId][nType]
	if not t then return end
	if not nIdx and getn(t) > 1 then
		if getn(t) > 1 then
			local tSay = {}
			local szTitle = "��i hi�p mu�n m� ti�m n�o??"
			for i=1, getn(t) do
				local tt = t[i]
				tinsert(tSay, format("%s/#open_equipshop(%d,%d)", tt[2], nItemPackId, i))
			end
			tinsert(tSay, format("%s/nothing", "Ra kh�i"))
			Say(szTitle, getn(tSay), tSay)
			
			return
		else
			nIdx = 1
		end
	end
	local tShop = t[nIdx]
	if tShop then
		SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", tShop[1], tShop[2] or ""))
	end
end