
--<<event v0.1 doc>>--
-- 2010-02-16 by �׷�
--[�Խű����Ż���һЩ����]--

-- run(file)
-- jump(file)
-- goto(*label)
-- loop()
-- Include(file)
-- wait(tm)
-- pause(tm)
-- exit()
-- scrstackdebug()
-- scrstacksize()

-- ��������
-- {
	EVENT_MODE = 0;
	SELECT_MODE = 1;
	FIND_MODE = 2;
	MATCH_MODE = 3;
	MENU_MODE = 4;
	LOAD_MODE = 5;
	SAVE_MODE = 6;

	-- ϵͳ����
	SYSTEM_MODE = EVENT_MODE;
-- }

--------------------------------------------------

function stacknull()
	local i;
	for i=1,scrstacksize() do
		exit();
	end
	selectbuttonfini();	-- ��շ�֧��
	i = nil;
end

function sysMode(m)
	SYSTEM_MODE = m;
	if m==FIND_MODE or m==MATCH_MODE or m==MENU_MODE or m==LOAD_MODE or m==SAVE_MODE then
		SetGameMode(USER_MODULE);
	else
		SetGameMode(DEFAULT_MODULE);
	end
	--print("ϵͳ״̬:" .. SYSTEM_MODE);
end

--------------------------------------------------
Print("script.lua Init success.\n");