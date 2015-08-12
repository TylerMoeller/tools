@echo off
set DT=

for /f "skip=1 delims=" %%A in ('wmic os get localdatetime') do (
	if not defined DT set DT=%%A
)

set YYYY=%DT:~0,4%
set YY=%DT:~2,2%
set MM=%DT:~4,2%
set DD=%DT:~6,2%
set HH=%DT:~8,2%
set SS=%DT:~10,2%
set MS=%DT:~12,6%
set /a GMT=%DT:~21,5%/60

echo Date: %MM%/%DD%/%YYYY%

if %HH% gtr 12 (set /a H = %HH% - 12&&set AMPM=PM) else (set AMPM=AM)

echo 24hr: %HH%:%SS%.%MS% (GMT %GMT%)
echo 12hr:  %H%:%SS%.%MS% %AMPM% (GMT %GMT%)
