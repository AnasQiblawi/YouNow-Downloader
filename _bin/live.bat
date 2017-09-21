@echo off

set user=%1
set user_id=%2
set broadcast_id=%3

title Recording [ User : %user% ] [ Brodcast : %broadcast_id% ]
cls

echo +-----------------------------------------------------------------^>
echo ^|  Recording [ User : %user% ] [ Brodcast : %broadcast_id% ]
echo +-----------------------------------------------------------------^>
echo ^|           Press Ctrl+C and write "n" to stop
echo +-----------------------------------------------------------------^>
echo.


if not exist "../videos/%user%" md "../videos/%user%"

for /f "tokens=1,2,3" %%a in ('xidel -q -e "join(($json).media/(host,app,stream))" ../_temp/%user%.txt') do (
    set host=%%a
    set app=%%b
    set stream=%%c
)

set rtmp=rtmp:^/^/%host%%app%/%stream%

set filename=%user%_live_%broadcast_id%



:::::::::::: Extra Info ::::::::::::::
for /f  %%z in ('xidel -q -e "($json).userlevel" ../_temp/%user%.txt') do set userlevel=%%z
for /f  %%y in ('xidel -q -e "($json).awsUrl" ../_temp/%user%.txt') do set awsUrl=%%y
for /f  %%y in ('xidel -q -e "($json).totalFans" ../_temp/%user%.txt') do set totalFans=%%y
for /f  %%y in ('xidel -q -e "($json).viewers" ../_temp/%user%.txt') do set viewers=%%y
for /f  %%y in ('xidel -q -e "($json).fans" ../_temp/%user%.txt') do set fans=%%y
for /f  %%y in ('xidel -q -e "($json).likes" ../_temp/%user%.txt') do set likes=%%y
for /f  %%y in ('xidel -q -e "($json).shares" ../_temp/%user%.txt') do set shares=%%y
for /f  %%y in ('xidel -q -e "($json).points" ../_temp/%user%.txt') do set points=%%y
for /f  %%y in ('xidel -q -e "($json).country" ../_temp/%user%.txt') do set country=%%y
for /f  %%y in ('xidel -q -e "($json).tags" ../_temp/%user%.txt') do set tags=%%y
for /f  %%y in ('xidel -q -e "($json).display_viewers" ../_temp/%user%.txt') do set=%%y
::____________________________________________________::



::::::::::::::::::: Creat Folder :::::::::::::::::
if not exist "../videos/%user%/%broadcast_id%_[Live]" md "../videos/%user%/%broadcast_id%_[Live]"
::____________________________________________________::



:::::::::::  Data ::::::::::: Anas Qiblawi
echo		- - - User - - -					>>Data/data_live.txt
echo	Username	:	%user%					>>Data/data_live.txt
echo	User ID		:	%user_id%				>>Data/data_live.txt
echo	Brodcast ID	:	%broadcast_id%			>>Data/data_live.txt
echo	User level	:	%userlevel%				>>Data/data_live.txt
echo	Country		:	%country%				>>Data/data_live.txt
echo		- - - RTMP - - -					>>Data/data_live.txt
echo	Host		:	%host%					>>Data/data_live.txt
echo	App		:	%app%						>>Data/data_live.txt
echo	Stream		:	%stream%				>>Data/data_live.txt
echo	RTMP		:	%rtmp%					>>Data/data_live.txt
echo	Filename	:	%filename%				>>Data/data_live.txt
echo	Thumbnail	:	%awsUrl%				>>Data/data_live.txt
echo		- - - Video - - -					>>Data/data_down.txt
echo	Total Fans	:	%totalFans%				>>Data/data_live.txt
echo	Fans		:	%fans%					>>Data/data_live.txt
echo	Viewers		:	%viewers%				>>Data/data_live.txt
echo	Likes		:	%likes%					>>Data/data_live.txt
echo	Shares		:	%shares%				>>Data/data_live.txt
echo	Points		:	%points%				>>Data/data_live.txt
echo	Tags		:	%tags%					>>Data/data_live.txt
echo ------------------------------------------->>Data/data_live.txt
::::::::::: Save in Same Folder ::::::::::::::::::::::::::::::::
echo		- - - User - - -					>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo	Username	:	%user%					>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo	User ID		:	%user_id%				>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo	Brodcast ID	:	%broadcast_id%			>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo	User level	:	%userlevel%				>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo	Country		:	%country%				>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo		- - - RTMP - - -					>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo	Host		:	%host%					>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo	App		:	%app%						>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo	Stream		:	%stream%				>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo	RTMP		:	%rtmp%					>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo	Filename	:	%filename%				>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo	Thumbnail	:	%awsUrl%				>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo		- - - Video - - -					>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo	Total Fans	:	%totalFans%				>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo	Fans		:	%fans%					>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo	Viewers		:	%viewers%				>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo	Likes		:	%likes%					>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo	Shares		:	%shares%				>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo	Points		:	%points%				>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo	Tags		:	%tags%					>>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
echo ------------------------------------------->>../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%_data.txt
::::::::::::::: Show on Screan:::::::::::::::::
echo -------------------------------------------
echo		- - - User - - -					
echo	Username	:	%user%
echo	User ID		:	%user_id%
echo	Brodcast ID	:	%broadcast_id%
echo	User level	:	%userlevel%
echo	Country		:	%country%
echo		- - - RTMP - - -					
echo	Host		:	%host%
echo	App		:	%app%
echo	Stream		:	%stream%
echo	RTMP		:	%rtmp%
echo	Filename	:	%filename%
echo	Thumbnail	:	%awsUrl%
echo		- - - Video - - -
echo	Total Fans	:	%totalFans%
echo	Fans		:	%fans%	
echo	Viewers		:	%viewers%
echo	Likes		:	%likes%	
echo	Shares		:	%shares%
echo	Points		:	%points%
echo	Tags		:	%tags%
echo -------------------------------------------
::____________________________________________________::


:::: Stream live video ::::::
start  /min play.bat %url% %user_id% %broadcast_id% %rtmp% %host% %app% %stream%
::_________________________________::


:::::: Creat Folder :::::::::::
if not exist "../videos/%user%/%broadcast_id%_[Live]" md "../videos/%user%/%broadcast_id%_[Live]"
::________________________________::


::::::::::::::: Save Streaming Thumbnail ::::::::::::::::
::if not exist ../videos/%user%/%broadcast_id%.jpg (wget -q --retry-connrefused --no-check-certificate %awsUrl%  --directory-prefix=../videos/%user%)
if exist ../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%.jpg (
goto :Skip_Thumbnail
move /y ../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%.jpg  ../videos/%user%/%broadcast_id%_[Live]/%filename%.jpg
) else (
wget -q --retry-connrefused --no-check-certificate %awsUrl%  --directory-prefix=../videos/%user%/%broadcast_id%_[Live]
move /y ../videos/%user%/%broadcast_id%_[Live]/%broadcast_id%.jpg  ../videos/%user%/%broadcast_id%_[Live]/%filename%.jpg
)
 :Skip_Thumbnail
::____________________________________________________::


:::::::::::: Folder Thumbnail ::::::::::::::::::::::::::
echo [ViewState]				 >../videos/%user%/%broadcast_id%_[Live]/desktop.ini
echo FolderType=Pictures		>>../videos/%user%/%broadcast_id%_[Live]/desktop.ini
echo Logo=%broadcast_id%.jpg	>>../videos/%user%/%broadcast_id%_[Live]/desktop.ini
echo Mode=						>>../videos/%user%/%broadcast_id%_[Live]/desktop.ini
echo Vid=						>>../videos/%user%/%broadcast_id%_[Live]/desktop.ini
attrib +h ../videos/%user%/%broadcast_id%_[Live]/desktop.ini
::____________________________________________________::


:::::: check old  Video ::::::
set a=0
 :exist
if exist ../videos/%user%/%broadcast_id%_[Live]/%filename%_[%a%].flv (
set /a a=a+1
) else (goto :new)
goto :exist
::___________________________::

::::: Recorde Video ::::::::::
 :new
rtmpdump -v -o ../videos/%user%/%broadcast_id%_[Live]/%filename%_[%a%].flv -r "%rtmp%"
::________________________________::


del /q "../_temp/%user%*.txt" 2>NUL



echo.
echo +-----------------------------------------------------------^>
echo ^|  Done^! Saved in %user%'s folder as %filename%
echo +-----------------------------------------------------------^>
echo.


exit