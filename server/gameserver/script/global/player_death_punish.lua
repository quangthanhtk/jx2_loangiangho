
Include("\\script\\online\\jpz_event\\first_tong\\first_tong_func.lua")
Include("\\script\\global\\battlefield_callback.lua")

function handle_event(data, para)
	local nMapId, HitMeNpcIndex, DeathPunish, Enmity = unpack(data)
	return OnDeath(HitMeNpcIndex, DeathPunish, Enmity)
end
function OnDeath(HitMeNpcIndex, DeathPunish, Enmity)
	if Enmity > 0 then
		DoEnmityDeath(HitMeNpcIndex, DeathPunish)
	else
		DoNormalDeath(HitMeNpcIndex, DeathPunish)
	end
end

function DoEnmityDeath(HitMeNpcIndex, DeathPunish)
	
	--��ȡʤ���ܷ�route
	local nOldPIdx = PlayerIndex;
	local nLoseRoute = GetPlayerRoute()--��������
	PlayerIndex = NpcIdx2PIdx(HitMeNpcIndex)--ʹ��PlayerIndex
	local nWinRoute = GetPlayerRoute() --ʤ������
	PlayerIndex = nOldPIdx
	
	--PKʤ��ͳ��
	local nPKStatWinKey = nWinRoute*100+nLoseRoute
	local nPKStatLoseKey = nLoseRoute * 100 + nWinRoute
	AddRuntimeStat(15,3,nPKStatWinKey,1)
	AddRuntimeStat(15,4,nPKStatWinKey,1)
	AddRuntimeStat(15,4,nPKStatLoseKey,1)
end

function DoNormalDeath(HitMeNpcIndex, DeathPunish)
	if DeathPunish > 0 then		-- �������ͷ�
		first_tong_event();
		DoHonorPunish();
		HitMePlayerIndex = NpcIdx2PIdx(HitMeNpcIndex)
		if HitMePlayerIndex > 0 then
			if Zgc_pub_week_day() == 0 then --����		
				local nlv = GetLevel();
				if nlv < 60 then  --60�����²�ͳ��
					return
				end 			
				local nWeek = GetWeekSequence(7,0);
				local nOldIndex = PlayerIndex;
				local nFactionOne = GetPlayerFaction();
				PlayerIndex = HitMePlayerIndex;
				local nFactionTwo = GetPlayerFaction();
				PlayerIndex = nOldIndex;
				if nFactionOne ~= nFactionTwo then
					if GetTask(921) ~= nWeek then --�µ�һ������ս��ʼ����ʼ��˫������
						SetTask(917,0);
						SetTask(918,0);
						SetTask(921,nWeek);
						PlayerIndex = HitMePlayerIndex;
						SetTask(917,0);
						SetTask(918,0);
						SetTask(921,nWeek);	
						PlayerIndex = nOldIndex;				
					end
					SetTask(918,GetTask(918)+1);
					PlayerIndex = HitMePlayerIndex;
					SetTask(917,GetTask(917)+1);	
					PlayerIndex = nOldIndex;
				end
			end
		end		
	else
		HitMePlayerIndex = NpcIdx2PIdx(HitMeNpcIndex)
		if HitMePlayerIndex > 0 then
			if Zgc_pub_week_day() == 0 then	--����
				local nlv = GetLevel();
				if nlv < 60 then  --60�����²�ͳ��
					return
				end 				
				local nWeek = GetWeekSequence(7,0);
				local nOldIndex = PlayerIndex;
				local nFactionOne = GetPlayerFaction();
				PlayerIndex = HitMePlayerIndex;
				local nFactionTwo = GetPlayerFaction();
				PlayerIndex = nOldIndex;
				if nFactionOne ~= nFactionTwo then				
					if GetTask(921) ~= nWeek then --�µ�һ������ս��ʼ����ʼ��˫������
						SetTask(917,0);
						SetTask(918,0);
						SetTask(921,nWeek);
						PlayerIndex = HitMePlayerIndex;
						SetTask(917,0);
						SetTask(918,0);
						SetTask(921,nWeek);	
						PlayerIndex = nOldIndex;				
					end
					SetTask(918,GetTask(918)+1);
					PlayerIndex = HitMePlayerIndex;
					SetTask(917,GetTask(917)+1);	
					PlayerIndex = nOldIndex;
				end
			end
		end
	end
end

function first_tong_event()
	if is_first_tong_jpz_open() == 0 then
		return
	end
	if check_time() == 1 and check_place() == 1 then
		SetDeathPunish(0);
	end;
end


tPunishCfg = {--�����������۳�����ֵ
		--{once,max}
		{10, 1000},
		{25, 2500},
		{50, 5000},
		{100, 10000},
		{250, 25000},
		{400, 40000},
	}
function DoHonorPunish()
	SetRankPoint(5, 701, 1)	-- ˥��������SetRankPoint��ʱ��Ž���,����Ҫ��˥��,�ٿ�
	CalcBattleRank()
	
	local nEverRank = 0
	if GetTask(765) >= 15 then
		nEverRank = 6
	elseif GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 5
	elseif GetTask(767) + GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 4
	end
	local nCurRank = abs(GetTask(704))
	if nCurRank < nEverRank then
		nCurRank = nEverRank
	end

	if nCurRank <= 3 then
		return
	end
	
	local song_or_liao = 1
	local nHonor = GetTask(701)
	if nHonor < 0 then
		nHonor = -nHonor
		song_or_liao = -1
	end
	
	local t = tPunishCfg[nCurRank]
	if t then
		local nOnce, nMax = unpack(t)
		local nTodayPunish = GetTask(771)
		if nTodayPunish >= nMax then
			Msg2Player(format("T� vong tr� �i�m c�ng tr�ng trong ng�y ��t t�i �a %d", nMax))
			return
		end
		local nDel = min(nOnce, nHonor)
		nHonor = nHonor - nDel
		nHonor = nHonor * song_or_liao
		nTodayPunish = nTodayPunish + nDel
		SetTask(701, nHonor)
		SetTask(771, nTodayPunish)
		Msg2Player(format("B�n t� vong �� t�n th�t %d �i�m c�ng tr�ng", nDel))
	end
end

--�������ƣ��ܼ����㺯��
--��        �ܣ����ؽ��������ڼ�
function Zgc_pub_week_day()
	local num_return = 0
	num_return = floor((GetTime() - 57600)/86400)
	num_return = num_return - (floor(num_return/7) * 7)
	if num_return >= 2 then
		num_return = num_return - 2
	else
		num_return = num_return + 5
	end
	return num_return
end

function GetTimeZoneInfo()
	local nCurTime = GetTime();
	local nTimeZoneDiff = floor((nCurTime - MkTime(GmTime(nCurTime)))/3600);
	return nTimeZoneDiff;
end;

--�����ܵ�����
function GetWeekSequence(nWeekDay,nHour,nCurTime)
	nWeekDay = nWeekDay or 1;
	nHour = nHour or 0;
	nCurTime = nCurTime or GetTime();
	local nTimeZoneDiff = GetTimeZoneInfo();
	nCurTime = nCurTime + nTimeZoneDiff*3600;		--����ʱ��
	nCurTime = nCurTime - 4*24*3600;	--���뵽1970��1��1�գ������ģ���ĵ�һ����һ�賿��
	local nWeekSecond = 7*24*3600;	--һ�ܶ�����
	local nOffset = ((nWeekDay-1)*24+nHour)*3600;	--����ƫ��ʱ��
	local nTotalTime = nCurTime - nOffset;	--��������ʱ��
	local nWeekSeq = floor(nTotalTime/nWeekSecond);	--�����ܵ�����
	return nWeekSeq;
end;
