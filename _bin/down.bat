@echo off
:::https://www.younow.com/halilsoyletmez/76381298/0/FiJ7yMwx/b/November-24,-2015
::  HLS Download command
:: ffmpeg -i "url"  -c copy -absf aac_adtstoasc file.mkv
:: Watch HLS m3u8 online
::http://demo.jwplayer.com/stream-tester/
::https://www.hlsplayer.net/
::https://www.dianshibo.com/fetch.php
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



set user=%1
set user_id=%2
set broadcast_id=%3
set num=_%4





title Downloading [ User : %user% ] [ Brodcast : %broadcast_id% ]
cls
echo +-----------------------------------------------------------------^>
echo ^|  Downloading [ User : %user% ] [ Brodcast : %broadcast_id% ]
echo +-----------------------------------------------------------------^>
echo ^|           Press Ctrl+C and write "n" to stop
echo +-----------------------------------------------------------------^>
echo.

set dir=temp%num%

if not exist "../videos/%user%" md "../videos/%user%"

md "../_temp/%dir%"



:::::::::::::: User_id :::::::::::::::::::::::::::::::::
goto :normal
 :FindUserId
wget -q  --retry-connrefused --no-check-certificate http://api.younow.com/php/api/broadcast/info/curId=0/user=%user% -O ../_temp/new_user.txt
for /f %%a in ('xidel -q ../_temp/new_user.txt -e "($json).userId"') do set user_id=%%a
del "../_temp/new_user.txt" >NUL
 :normal
::____________________________________________________::



:: session
wget -q  --retry-connrefused --no-check-certificate http://www.younow.com/php/api/younow/user -O ../_temp/%dir%/session.txt
:: b_info
wget -q  --retry-connrefused --no-check-certificate http://www.younow.com/php/api/post/get/entityId=%broadcast_id%/deepLink=b/channelId=%user_id% -O ../_temp/%dir%/b_info.txt
:: rtmp
wget -q  --retry-connrefused --no-check-certificate http://www.younow.com/php/api/broadcast/videoPath/broadcastId=%broadcast_id% -O ../_temp/%dir%/rtmp.txt

:: session
for /f %%a in ('xidel -q -e "($json).session" ../_temp/%dir%/session.txt') do set session=%%a



:: mydate:::::::::::::::::::::::::::::::::::::::::::::::::::::
:: mytime
for /f "tokens=1,2" %%a in ('xidel -q -e "($json).posts().media.broadcast.dateAired" ../_temp/%dir%/b_info.txt') do (
    set mydate=%%a
    set mytime=%%b
)
::if %mydate%==""    goto :FindUserId
::__________________________________________________________::


:::::::::::::::::::::::::::__  Data __::::::::::::::::::::::::::::
for /f "tokens=1,2,3" %%a in ('xidel -q -e "join(($json)/(server,stream,hls))" ../_temp/%dir%/rtmp.txt') do (
set play=%%a%%b
set hls=%%c
)
:: RTMP
set rtmp=%play%?sessionId=%session%
::________________________________________________________::






::::::: extra data :::::
for /f %%z in ('xidel -q -e "($json).broadcastThumbnail" ../_temp/%dir%/rtmp.txt') do set broadcastThumbnail=%%z
for /f %%y in ('xidel -q -e "($json).timeAgo" ../_temp/%dir%/rtmp.txt') do set timeAgo=%%y
for /f %%y in ('xidel -q -e "($json).totalViewers" ../_temp/%dir%/rtmp.txt') do set totalViewers=%%y
for /f %%y in ('xidel -q -e "($json).totalChats" ../_temp/%dir%/rtmp.txt') do set totalChats=%%y
for /f %%y in ('xidel -q -e "($json).totalLikes" ../_temp/%dir%/rtmp.txt') do set totalLikes=%%y
for /f %%y in ('xidel -q -e "($json).videoAvailable" ../_temp/%dir%/rtmp.txt') do set videoAvailable=%%y
for /f %%y in ('xidel -q -e "($json).shares" ../_temp/%dir%/rtmp.txt') do set shares=%%y
for /f %%y in ('xidel -q -e "($json).tags" ../_temp/%dir%/rtmp.txt') do set tags=%%y
::____________________________________________________::




:::::::::::::::::::::::::::__ Creat Folder :::::::::::::::::
if not exist "../videos/%user%/%broadcast_id%_[Archive]" md "../videos/%user%/%broadcast_id%_[Archive]"
::____________________________________________________::





:::::::::::::::::: Data ::::::::::::::::::::::::::::::::::
echo		- - - User - - -					>>Data/data_down.txt
echo	Username	:	%user%					>>Data/data_down.txt
echo	User ID		:	%user_id%				>>Data/data_down.txt
echo	Brodcast ID	:	%broadcast_id%			>>Data/data_down.txt
echo		- - - Video - - -					>>Data/data_down.txt
echo	Available	:	%videoAvailable%		>>Data/data_down.txt
echo	Time Ago	:	%timeAgo%				>>Data/data_down.txt
echo	Viewers		:	%totalViewers%			>>Data/data_down.txt
echo	Chats		:	%totalChats%			>>Data/data_down.txt
echo	Likes		:	%totalLikes%			>>Data/data_down.txt
echo	Shares		:	%shares%				>>Data/data_down.txt
echo	Tags		:	%tags%					>>Data/data_down.txt
echo		- - - RTMP - - -					>>Data/data_down.txt
echo	My Date		:	%mydate%				>>Data/data_down.txt
echo	My Time		:	%mytime%				>>Data/data_down.txt
echo	Session ID	:	%session%				>>Data/data_down.txt
echo	Play		:	%play%					>>Data/data_down.txt
echo	RTMP		:	%rtmp%					>>Data/data_down.txt
echo	HLS		:	%hls%					>>Data/data_down.txt
echo	Thumbnail	:	%broadcastThumbnail%	>>Data/data_down.txt
echo ___________________________________________>>Data/data_down.txt
:::::::::::Save in Same Folder::::::::::::::::::::::::::::::::
echo		- - - User - - -					>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo	Username	:	%user%					>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo	User ID		:	%user_id%				>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo	Brodcast ID	:	%broadcast_id%			>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo		- - - Video - - -					>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo	Available	:	%videoAvailable%		>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo	Time Ago	:	%timeAgo%				>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo	Viewers		:	%totalViewers%			>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo	Chats		:	%totalChats%			>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo	Likes		:	%totalLikes%			>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo	Shares		:	%shares%				>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo	Tags		:	%tags%					>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo		- - - RTMP - - -					>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo	My Date		:	%mydate%				>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo	My Time		:	%mytime%				>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo	Session ID	:	%session%				>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo	Play		:	%play%					>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo	RTMP		:	%rtmp%					>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo	HLS		:	%hls%					>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo	Thumbnail	:	%broadcastThumbnail%	>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
echo ___________________________________________>>../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%_data.txt
::::::::::::::: Show on Screan:::::::::::::::::
echo ___________________________________________
echo		- - - Down - - -					
echo	Username	:	%user%
echo	User ID		:	%user_id%
echo	Brodcast ID	:	%broadcast_id%
echo		- - - Video - - -
echo	Available	:	%videoAvailable%
echo	Thumbnail	:	%broadcastThumbnail%
echo	Time Ago	:	%timeAgo%
echo	Viewers		:	%totalViewers%
echo	Chats		:	%totalChats%
echo	Likes		:	%totalLikes%
echo	Shares		:	%shares%
echo	Tags		:	%tags%
echo		- - - RTMP - - -
echo	Date		:	%mydate%
echo	Time		:	%mytime%
echo	Session ID	:	%session%
echo	Play		:	%play%
echo	RTMP		:	%rtmp%
echo	HLS		:	%hls%
echo ___________________________________________
::____________________________________________________::





:::::::::::::::::::::::::::::::::::::::__ Save broadcast Thumbnail ::::::::::::::::
if exist ../videos/%user%/%broadcast_id%_[Archive]/%broadcast_id%.jpg (goto :Skip_Thumbnail) else (
wget -q --retry-connrefused --no-check-certificate %broadcastThumbnail%  --directory-prefix=../videos/%user%/%broadcast_id%_[Archive]
)
 :Skip_Thumbnail
::____________________________________________________::




::::::::::::::::::::::::::::::_____ Folder Thumbnail _______::::::::::::::::::::::::::
echo [ViewState]				 >../videos/%user%/%broadcast_id%_[Archive]/desktop.ini
echo FolderType=Pictures		>>../videos/%user%/%broadcast_id%_[Archive]/desktop.ini
echo Logo=%broadcast_id%.jpg	>>../videos/%user%/%broadcast_id%_[Archive]/desktop.ini
echo Mode=						>>../videos/%user%/%broadcast_id%_[Archive]/desktop.ini
echo Vid=						>>../videos/%user%/%broadcast_id%_[Archive]/desktop.ini
attrib +h  ../videos/%user%/%broadcast_id%_[Archive]/desktop.ini
::____________________________________________________::


:::::::::::::::::::::::::::::::::::::__ FileName __::::::::::::::::::::::::::::::::::::::::
:: RTMP -- 
set filename=%user%_%broadcast_id%_%mydate%_%mytime:~0,2%-%mytime:~3,2%
:: HLS -- 
::set hlsfilename=%user%_%broadcast_id%_%mydate%_%mytime:~0,2%-%mytime:~3,2%.mkv
::___________________________________::


::::::::::::::::::::::::::::___ check old  Video _____::::::
set a=0

 :Checkrtmp
if exist  "../videos/%user%/%broadcast_id%_[Archive]/%filename%_[%a%].flv"  (
set /a a=a+1
goto :Checkrtmp
) else (goto :Checkhls)

 :Checkhls
if exist  "../videos/%user%/%broadcast_id%_[Archive]/%filename%_[%a%].mkv"  (
set /a a=a+1
goto :Checkhls
) else (goto :new)
 :new
::__________________________________________________::



::::::::::::::::::::::::::::::::::::::::__ Resume __:::::::::::::::::::::::::
::set resume=
::if  exist  "../videos/%user%/%broadcast_id%_[Archive]/%filename%_[%a%].flv" (set resume=--resume)
::____________________________________________________::




::::::::::::::::::::::::::::::::::::::::___ RTMP OR HLS __::::::::::::::::::::
if %play%==rtmp://archive.younow.com:1935/bnowvods3/_definst_/mp4:amazons3/younowvideosplaylist.m3u8  (
goto :HLS_Download)  else  (goto :RTMP_Download)
::____________________________________________________::



::::::::::::::::::::::::::::::::::::::::::: Downloading :::::::::::::::::::::::::
:: RTMP ::
 :RTMP_Download
rtmpdump %resume% -v -o "../videos/%user%/%broadcast_id%_[Archive]/%filename%_[%a%].flv" -r "%rtmp%" -p "http://www.younow.com/" 
goto :END
:: HLS ::
 :HLS_Download
:: http://www.dianshibo.com/fetch.php/
::ffmpeg -i "%hls%?sessionId=%session%" -c copy -absf aac_adtstoasc "../videos/%user%/%broadcast_id%_[Archive]/%hlsfilename%"
ffmpeg -i "%hls%?sessionId=%session%" -c copy -absf aac_adtstoasc "../videos/%user%/%broadcast_id%_[Archive]/%filename%_[%a%].mkv"
 :END
::____________________________________________________::



rd /s /q "../_temp/%dir%" 2>NUL



echo.
echo +-----------------------------------------------------------^>
echo ^|  Done^! Saved in %user%'s folder as %filename%
echo +-----------------------------------------------------------^>
echo.
pause
exit


