
if isfiletrue(GetPubValueFilePath())==1 then goto(*end); end

--==========================================

*newdata

callmenuoff();

amp_pubsave();

say("[c=ffffff]ϵͳΪ��һ������,���ڴ������������ļ�,���Ժ�[|=02].[|=02].[|=02].[|=02].[|=02].[/c]");

playfile("successed.wav",1);

pause(10);

say("[c=ffffff]�����ɹ������밴ԲȦ��������[/c]");

callmenuon();

goto(*exit);

--==========================================

*end

callmenuoff();

amp_pubload();	-- ��ȡ����ϵͳ����

say("[c=ffffff]�������빫�������ļ�,���Ժ�[|=02].[|=02].[|=02].[|=02].[|=02].[/c]");

playfile("successed.wav",1);

pause(10);

say("[c=ffffff]����ɹ������밴ԲȦ��������[/c]");

callmenuon();

goto(*exit);

--==========================================

*exit
textclear();
stopfile("wav",1);
exit();
