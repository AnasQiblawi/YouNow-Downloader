:: Logo
::http://photo2text.com/index.php

:: User profile cover
:: https://cdn.younow.com/php/api/channel/getCover/channelId=%user_id%

:: profile picture
:: https://cdn.younow.com/php/api/channel/getImage/channelId=%user_id%
:: http://cdn.younow.com/php/api/younow/dashboard

:: get user data
:: old
:: http://www.younow.com/php/api/broadcast/info/user=%user%
:: http://bcm.younow.com/broadcast/info/user=%user%
::New
:: https://api.younow.com/php/api/broadcast/info/curId=0/user=%user%

::---------------	Other Useful Links	--------------
::
::https://www.younow.com/php/api/younow/trendingUsers/
::
::
::  Brodcast No. 1 for %user_name%
::https://www.younow.com/php/api/post/getBroadcasts/startFrom=1/channelId=%user_id%
::----
::https://www.younow.com/php/api/younow/user
::----
::  Get Moments
::https://www.younow.com/php/api/moment/profile/channelId=%user_id%/createdBefore=0/records=50
:: Moment Video
::https://hls.younow.com/momentsplaylists/live/%moment_id%/%moment_id%.m3u8
::----
::  linux YN Downloader
::https://github.com/truethug/YouNow_Downloader-mac-linux
::----
::  Website For Recent Brodcasts of user
::http://younow.c0de.com.br/recent-broadcasts.php?profile=%user_name%


::----------------------------------------------------

@echo off
setlocal EnableDelayedExpansion

::::: Coloring ::::
@echo off
:: setlocal disableDelayedExpansion
set q=^"
:::::::::::::::::::
title YouNow Downloader - Anas Qiblawi
mode con  cols=138  lines=35
mode con  cols=138


if exist "_temp" (
    rd /s /q _temp 2>NUL
    md _temp 2>NUL
) else md _temp

if not exist "videos" md videos

cd _bin

set num1=1
set num2=1




cls

echo.
echo.
echo.
echo.
call :c  0a "                                                            OOOOOOOOOG                                                           " /n
call :c  0a "                                                      GOOOOOOOOOOOOOOOOOOOO                                                      " /n
call :c  0a "     OOOOOOOOOOOOOOO             OOOOOOOOOOOOOOO   OOOOOOOOOOOOOOOOOOOOOOOOOOOG          OOOOOOOOOOOOOOO          OOOOOOOOOOOOOOO" /n
call :c  0a "      OOOOOOOOOOOOOOO           OOOOOOOOOOOOOOO  OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO        OOOOOOOOOOOOOOO          OOOOOOOOOOOOOOO" /n
call :c  0a "       OOOOOOOOOOOOOOO         OOOOOOOOOOOOOOO OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO      OOOOOOOOOOOOOOO          OOOOOOOOOOOOOOO" /n
call :c  0a "         OOOOOOOOOOOOOOC      OOOOOOOOOOOOOOO OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO     OOOOOOOOOOOOOOO          OOOOOOOOOOOOOOO" /n
call :c  0a "          OOOOOOOOOOOOOOG    OOOOOOOOOOOOOO GOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO   OOO    OOOOOOOOOOOOOOO          OOOOOOOOOOOOOOO" /n
call :c  0a "           OOOOOOOOOOOOOOO  OOOOOOOOOOOOOO  OOOOOOOOOOOOOOOOOOOOOOOOOOOOC    OO  COOOO   OOOOOOOOOOOOOOO          OOOOOOOOOOOOOOO" /n
call :c  0a "            OOOOOOOOOOOOOOOOOOOOOOOOOOOOO  OOOOOOOOOOOOOOOOOOOOCOOO   OO     O   OOOOOO  OOOOOOOOOOOOOOO          OOOOOOOOOOOOOOO" /n
call :c  0a "             COOOOOOOOOOOOOOOOOOOOOOOOOO  OOOOOOOOOOOOOOOOO       OO   O  C  O   OOOOOOO OOOOOOOOOOOOOOO          OOOOOOOOOOOOOOO" /n
call :c  0a "               OOOOOOOOOOOOOOOOOOOOOOO    OOOOOOO  OOO  CO    OO   O   O  O      OOOOOOO OOOOOOOOOOOOOOO          OOOOOOOOOOOOOOO" /n
call :c  0a "                OOOOOOOOOOOOOOOOOOOOO     OOOOOO    OO   O    OO   O   G  OO     OOOOOOO OOOOOOOOOOOOOOO          OOOOOOOOOOOOOOO" /n
call :c  0a "                 OOOOOOOOOOOOOOOOOOO      OOOOOO     O   O    OO   OO     OO     OOOOOOO OOOOOOOOOOOOOOO          OOOOOOOOOOOOOOO" /n
call :c  0a "                  OOOOOOOOOOOOOOOOO       OOOOOO         O    OO   OO    COOOGOOOOOOOOOO OOOOOOOOOOOOOOO          OOOOOOOOOOOOOOO" /n
call :c  0a "                   OOOOOOOOOOOOOOO         OOOOO   O     OO       GOO OOOOOOOOOOOOOOOOO  OOOOOOOOOOOOOOO          OOOOOOOOOOOOOOO" /n
call :c  0a "                   OOOOOOOOOOOOOOO         OOOOOC  OO    OOO    OOOOOOOOOOOOOOOOOOOOOOO  OOOOOOOOOOOOOOO          OOOOOOOOOOOOOOO" /n
call :c  0a "                   OOOOOOOOOOOOOOO          OOOOO  OOO OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO    OOOOOOOOOOOOOOO        OOOOOOOOOOOOOOOO" /n
call :c  0a "                   OOOOOOOOOOOOOOO           OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO     OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO " /n
call :c  0a "                   OOOOOOOOOOOOOOO            OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO       OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  " /n
call :c  0a "                   OOOOOOOOOOOOOOO              OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO          OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO   " /n
call :c  0a "                   OOOOOOOOOOOOOOO                OOOOOOOOOOOOOOOOOOOOOOOOOOOOOO              OOOOOOOOOOOOOOOOOOOOOOOOOOOOOO     " /n
call :c  0a "                   OOOOOOOOOOOOOOO                   OOOOOOOOOOOOOOOOOOOOOOOO                    OOOOOOOOOOOOOOOOOOOOOOOO        " /n
call :c  0a "                                                         OOOOOOOOOOOOOOOO                              GOOOOOOOOOOO              " /n
echo.
echo.
call :c  07 "                                                                                          Made by             " /n
call :c  0C "                                                                                               Anas Qiblawi   " /n
echo.
echo.


::::: Check Internet
	call :c  03 " Connecting . ."
 :check_internet
SET Connected=false
FOR /F "usebackq tokens=1" %%A IN (`PING google.com`) DO (
    :: Check the current line for the indication of a successful connection.
    IF /I "%%A"=="Reply" SET Connected=true
)
:: Check if a success was found.
IF  "%Connected%"=="true" (
	goto :begin) else (
	call :c  03 " ."
	Ping -n 2 8.8.4.4 -w 1000 >nul
	goto :check_internet
)
::_____________________________________::



:begin

cls
	   ECHO.                                                _______________________________________
call :c 0E "    ----------------------------------------- |                                         | --------------------------------------- " /n
call :c 0E "           YouNow video downloader            |   This script helps you to download     |          Made by  : Anas Qiblawi       " /n
call :c 0E "    ----------------------------------------- |  YouNow.com broadcasts and live streams | --------------------------------------- " /n
call :c 0E "    ----------------------------------------- | _______________________________________ | --------------------------------------- " /n
echo(
call :c  0F " Paste broadcast URL or username below (right click - Paste) and press Enter " /n
echo.
call :c  0F " Example 1:"&call :c 0B "  https://www.younow.com/tinawoodsss/54726312/1877623/1043/b/June-22,-2015 " /n
echo.
call :c  0F " Example 2:"&call :c 0B "  https://www.younow.com/6angk/112750456/1824417/affcd9iq/b/hola " /n
echo.
call :c  0F " Example 3:"&call :c 0B "  tinawoodss " /n
)





set start=0

echo.
echo. # URL or username (leave blank to quit): 
set /p url= || goto end
echo.

set url_="%url%"

if not %url_:younow.com=% == %url_% (
	goto normal
) else (
	goto username
)

:normal

for /f "tokens=3,4,5 delims=/" %%a in ("%url%") do (
    set user=%%a
    set broadcast_id=%%b
    set user_id=%%c
)
:::::::::::::: Find User_id :::::::::::::::::::::::::::::::::
set error=0
wget -q  --retry-connrefused --no-check-certificate http://api.younow.com/php/api/broadcast/info/curId=0/user=%user% -O ../_temp/new_user.txt
for /f %%a in ('xidel -q ../_temp/new_user.txt -e "($json).userId"') do set user_id=%%a
del "../_temp/new_user.txt" >NUL
::____________________________________________________::

start down.bat %user% %user_id% %broadcast_id% b%num1%

echo.   - - - - - -
echo.
call :c 0a "	Username	:	%user%		" /n			
call :c 0a "	User ID		:	%user_id%	" /n	
call :c 0a "	broadcast id	:	%broadcast_id%" /n
echo.
echo - OK^^! Started downloading in a separate window.
echo.
echo.

set /a num1+=1
pause
goto begin

:username
set error=0
wget -q --retry-connrefused --no-check-certificate http://api.younow.com/php/api/broadcast/info/curId=0/user=%url% -O ../_temp/%url%.txt

for /f %%a in ('xidel -q ../_temp/%url%.txt -e "($json).userId"') do set user_id=%%a

for /f %%a in ('xidel -q ../_temp/%url%.txt -e "($json).errorCode"') do set error=%%a


if not exist "Data" md Data
:::::::::::  Data ::::::::::: Anas Qiblawi
echo	thumbnail	:	http://cdn.younow.com/php/api/channel/getImage/channelId=%url% >>Data/data_start.txt
echo	Username	:	%url%					>>Data/data_start.txt
echo	User ID		:	%user_id%				>>Data/data_start.txt
echo	Error		:	%error%					>>Data/data_start.txt
:::::::::::::::::::::::::::::::::::::::::::
::if %error%==0 (
::set status=Online
::set StatusColor=0a
::) else (
::set status=Offline
::set StatusColor=0C
::)
::call :c %StatusColor% "	Status		:	%status%	" /n
echo	-----------------------------------------
call :c 0a "	Username	:	%url%		" /n			
call :c 0a "	User ID		:	%user_id%	" /n	
if 	%error%==0 (
call :c 0a "	Status		:	Online		" /n
) else (
call :c 0C "	Status		:	Offline		" /n
)
::call :c 0C "	Status		:	Offline	" /n
::goto :Offline
:: :Online
::call :c 0a "	Status		:	Online		" /n
:: :Offline
echo	-----------------------------------------
:::::::::::::::::::::::::::::::::::::::::::


if %error%==0 (
    goto live
) else (
    goto list
)

:live
set input=

set /p input="[LIVE] %url% is broadcasting now^! Start recording (y/n)? "

if "%input%"=="" (
    del /q "../_temp/%url%*.txt" 2>NUL
	
    goto begin
)

if "%input%"=="y" (
    goto liveyes
) else (
    goto list
)    

:liveyes

for /f %%a in ('xidel -q ../_temp/%url%.txt -e "($json).broadcastId"') do set broadcast_id=%%a

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo	Brodcast ID	:	%broadcast_id%			>>Data/data_start.txt
echo ------------------------------------------->>Data/data_start.txt
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

start  live.bat %url% %user_id% %broadcast_id%
echo.
echo - OK^^! Started recording in a separate window.

goto continue

:list

wget -q --retry-connrefused --no-check-certificate http://www.younow.com/php/api/post/getBroadcasts/startFrom=%start%/channelId=%user_id% -O ../_temp/%url%_json.txt

xidel -q -e '($json).posts().media.broadcast/join((videoAvailable,broadcastId,broadcastLengthMin,ddateAired),"-")' ../_temp/%url%_json.txt>../_temp/%url%_list.txt


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ------------------------------------------->>Data/data_start.txt
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


set idx=1
set videos=
set all=

goto :Check_list

 :List_checked_1
echo.
echo You can download these broadcasts:
echo.
goto :List_checked_2

 :Check_list
for /f "tokens=1 delims=-" %%z in (../_temp/%url%_list.txt) do (goto :List_checked_1)
 
 :List_checked_2

for /f "tokens=1,2,3,4 delims=-" %%a in (../_temp/%url%_list.txt) do (
    if %%a==1 (
        call :c 06 " !idx!. %%d [%%c] " /n
        set videos[!idx!]=%%b
        set all=!all!!idx!,
    )
    set /a idx+=1
)


if "%all%"=="" (
	echo.
    call :c 0C " - There's nothing to show . " /n
	echo.
	echo.
    del /q "../_temp/%url%*.txt" 2>NUL
	pause
    goto begin   
)


set input=

echo.
echo Type comma separated numbers, "all" to download everything,
set /p input=""n" to list next 10 broadcasts or leave blank to return: "

if "%input%"=="" (
    del /q "../_temp/%url%*.txt" 2>NUL
    goto begin
)

if "%input%"=="n" (
    set /a start+=10
    echo.
    goto list
)

if "%input%"=="all" (
    set input=%all%
)

echo.
for %%a in (%input%) do (
    start  down.bat %url% %user_id% !videos[%%a]! !num2!
    echo - OK^^! Started downloading in a separate window.
    set /a num2+=1
)

:continue
set input=
echo.
set /p input="Continue working with %url% (y/n)? "

if "%input%"=="y" (
    echo.
    goto list
) else (
    del /q "../_temp/%url%*.txt" 2>NUL
    goto begin
)

:end
echo.
pause
exit


::__________________________________________________________________::
::::: Coloring ::::

:c
setlocal enableDelayedExpansion


:colorPrint Color  Str  [/n]
setlocal
set "s=%~2"
call :colorPrintVar %1 s %3
exit /b

:colorPrintVar  Color  StrVar  [/n]
if not defined DEL call :initColorPrint
setlocal enableDelayedExpansion
pushd .
':
cd \
set "s=!%~2!"
:: The single blank line within the following IN() clause is critical - DO NOT REMOVE
for %%n in (^"^

^") do (
  set "s=!s:\=%%~n\%%~n!"
  set "s=!s:/=%%~n/%%~n!"
  set "s=!s::=%%~n:%%~n!"
)
for /f delims^=^ eol^= %%s in ("!s!") do (
  if "!" equ "" setlocal disableDelayedExpansion
  if %%s==\ (
    findstr /a:%~1 "." "\'" nul
    <nul set /p "=%DEL%%DEL%%DEL%"
  ) else if %%s==/ (
    findstr /a:%~1 "." "/.\'" nul
    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%"
  ) else (
    >colorPrint.txt (echo %%s\..\')
    findstr /a:%~1 /f:colorPrint.txt "."
    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"
  )
)
if /i "%~3"=="/n" echo(
popd
exit /b


:initColorPrint
for /f %%A in ('"prompt $H&for %%B in (1) do rem"') do set "DEL=%%A %%A"
<nul >"%temp%\'" set /p "=."
subst ': "%temp%" >nul
exit /b


:cleanupColorPrint
2>nul del "%temp%\'"
2>nul del "%temp%\colorPrint.txt"
>nul subst ': /d
exit /b

