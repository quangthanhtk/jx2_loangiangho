--=============================================
--create by baiyun 2010.1.7
--describe:Խ�ϰ�������Ʒ ���Ҵ��¼� �ű��ļ�
--=============================================

Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\online_activites\\head\\activity_normal_define.lua")
--�������Ի�
Include("\\script\\online_activites\\201211\\christmas_tree.lua")
Include("\\script\\online_activites\\201305\\plant_flower.lua")
Include("\\script\\online_activites\\201309\\plant_flower.lua")
Include("\\script\\online_activites\\201410\\plant_flower.lua")
Include("\\script\\online_activites\\201501\\item_shijinzongzi.lua")
Include("\\script\\online_activites\\201501\\gouhuo.lua")
Include("\\script\\online_activites\\201502\\item_xunchun.lua")
Include("\\script\\online_activites\\201503\\shangpinxiangshui.lua")
Include("\\script\\online\\viet_event\\event_notify_pouch.lua") 
Include("\\script\\function\\vip_card\\vc_head.lua")

function OnUse(nItemIdx)
	SelectSay()
end

