--<<stage v0.1 doc>>--
-- 2010-01-15 by �׷�
--[�������ýӿ�]--


----------------------------------------------------

-- ���ٱ��������滺��������ݲ����ùر���ʾ
-- ��������ϵͳ�����������

function allclear()
	local i;
	for i=1,32 do
		bgnull(i);
		fgnull(i);
		texfgnull(i);
	end
	for i=1,4 do
		oggunload(i);
		wavunload(i);
	end
	mp3unload(1);
	mp3unload(2);
	i = nil;
	text("");
	name("");
	textclear();
	dialoginit();
	sysMode(EVENT_MODE);
	SetSceneColor(0,0,0,0);
end

-- �Գ������ݳ�ʼ��
function stageinit()
	allclear();	-- ���ͼ������
	local i;
	for i=1,32 do
		delrect(i);
		dellockbyindex(i);
	end
	setmovescr("");
	setdialogscr("");
	i = nil;
end

function stageclear()
	stageinit();
end

function stagefindinit(file)
	Include(file);
end

function stagelockinit(file)
	Include(file);
end

function stagemovescr(file)
	setmovescr(file);
end

function stagedialogscr(file)
	setdialogscr(file);
end

---------------------------------------------
Print("stage.lua Init success.\n");