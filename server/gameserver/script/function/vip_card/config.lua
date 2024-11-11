--vip card config

--1Ħ�ɿ�  12-22~1-19
--2ˮƿ��  1-20-~2-18
--3˫�㿨  2-19~3-20
--4����  3-21~4-19
--5��ţ��  4-20~5-20
--6˫�ӿ�  5-21~6-21
--7��з��  6-22~7-22
--8ʨ�ӿ�  7-23~8-22
--9��Ů��  8-23~9-22
--10��ӿ� 9-23~10-23
--11��Ы�� 10-24~11-22
--12���ֿ� 11-23~12-21
--\settings\vip_card.txt
--CUR_VIP_CARD_INDEX 1~12
CUR_VIP_CARD_INDEX = tonumber(date("%m"))
CURRENT_MONTH_YEAR = tonumber(date("%Y%m"))
CUR_VIP_CARD_START_DATE = tonumber(CURRENT_MONTH_YEAR .. "01")
CUR_VIP_CARD_END_DATE = tonumber(CURRENT_MONTH_YEAR .. 31)




----------------------------------------------------------------------------
function is_in_valid_date(bNotify)
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < CUR_VIP_CARD_START_DATE or nDate > CUR_VIP_CARD_END_DATE then
		if bNotify and 1 == bNotify then
			Talk(1,"",format("Hi�n kh�ng ph�i th�i gian k�ch ho�t Th� VIP, h�y k�ch ho�t v�o %s~%s", show_date(CUR_VIP_CARD_START_DATE), show_date(CUR_VIP_CARD_END_DATE)))
		end
		return 0
	end
	return 1
end

function show_date(nDate)
	local _date = tonumber(nDate)
	local d = mod(_date, 100)
	_date = floor(_date/100)
	local m = mod(_date, 100)
	_date = floor(_date/100)
	local y = _date
	local s = format("%d/%d/%d", d, m, y)
	return s
end
