@echo off

set user=%1
set user_id=%2
set broadcast_id=%3
set rtmp=%4
set host=%5
set app=%6
set stream=%7

title Straeming [ User : %user% ] [ Brodcast : %broadcast_id% ]

cls

echo.
echo +-------------------------------------------------^>
echo ^|  Streaming %user% #%broadcast_id%
echo +-------------------------------------------------^>
echo ^|  		Press Ctrl+C to stop
echo +-------------------------------------------------^>
echo.



echo -------------------------------------------
echo		- - - Live - - -					
echo	Username	:	%user%
echo	User ID		:	%user_id%	
echo	Brodcast ID	:	%broadcast_id%
echo	Host		:	%host%
echo	App		:	%app%
echo	Stream		:	%stream%
echo	RTMP		:	%rtmp%
echo -------------------------------------------
echo.


ffplay -i %rtmp%



pause
exit