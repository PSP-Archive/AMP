
-- 2009-11-06 by �׷�
--[Ĭ��״̬�¶԰����Ĵ���]--

-----------------------------------------------------

-- ���ĳ�������Ƿ���
-- key		����,KEY_CROSS,KEY_CIRCLE,KEY_START,KEY_SELECT
-- ����ֵ1��0
-- KeyDown(key)
----------------------------------

-- ���ĳ�������Ƿ�̧��
-- key		����,KEY_CROSS,KEY_CIRCLE,KEY_START,KEY_SELECT
-- ����ֵ1��0
-- KeyUp(key)
----------------------------------

-- ��ʼ������
-- KeyInit()
----------------------------------



--------------------------
-----����Ϊ����������-----
--------------------------

------------------------------------------------------

--<Ĭ��״̬�±�ÿһ֡����,δ���>--

function KeySwitch()

	showfps();	-- ֡�����ڴ���Ϣ
	local gamemode = GetGameMode();

	if gamemode==DEFAULT_MODULE then

		sys_call_menu();
		TextWaitKey(KEY_CIRCLE);

		MsgBoxHide();	-- ���ضԻ���

	elseif gamemode==SPEED_MODULE then
		if KeyDown(KEY_CROSS)==1 then
			SetGameMode(DEFAULT_MODULE);
		end
	elseif gamemode==BG_MODULE then
		MsgBoxUnhide();		-- ���ؾ���ģ��
	end

	gamemode = nil;
end

function showfps()
	if DEBUG==1 then
		ShowFps();
	end
end

function callmenu()
	if TextFinish()==1 or TextWaitKeyTrue()==1 then
		if KeyDown(KEY_START)==1 then
			drawmenu();
		end
	end
end

function MsgBoxHide()
	if TextFinish()==1 or TextWaitKeyTrue()==1 then
		if KeyDown(KEY_SQUARE)==1 then
			texthide();
		end
	end
end

function MsgBoxUnhide()
	if KeyDown(KEY_CROSS)==1 then
		textunhide();
	end
end

function menu_be_hide()
	--Print("�˵�����������.\n");
end

function callmenuon()
	sys_call_menu = callmenu;
end

function callmenuoff()
	sys_call_menu = menu_be_hide;
end

sys_call_menu = callmenu;

--------------------------------------
Print("keyswitch.lua Init success.\n");