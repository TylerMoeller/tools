@echo off
::::
:: Windows Startup Script. Starts Task Manager minimized and maps network shares.

::::
::Settings
::::
	set SERVER=
	set SHARE1=
	set SHARE2=
	set SHARE3=
	set SHARE4=

::::
:: Start Task Manager minimized
::::

	for /F "tokens=1" %%A in ('tlist -p taskmgr.exe') do if %%A EQU -1 @echo Starting Task Manager...&&start /min taskmgr

REM Map Drives

	echo Deleting old drive mappings...
	net use * /D /Y 1>nul 2>nul

	echo Mapping drives...
	echo.
	echo.
	dir /B \\%SERVER%\%SHARE4% 1>nul
	if %ERRORLEVEL%==1 goto :ERROR

:MAPDRIVES

::::
:: Attempt to map each drive twice before erroring out
::::
	set count=0
	if %count% geq 2 goto :ERROR
	set /A count=count+1

	net use W: \\%SERVER%\%SHARE1% 1>nul
	net use X: \\%SERVER%\%SHARE2% 1>nul
	net use Y: \\%SERVER%\%SHARE3% 1>nul
	net use Z: \\%SERVER%\%SHARE4% 1>nul

	for %%A in (%SHARE1% %SHARE2% %SHARE3% %SHARE4%) do (
		for /F "tokens=1" %%B in ('net use ^| find /I "%%A"') do if "%%B" equ "OK" (
			echo \\%SERVER%\%%A mapped succesfully
		) else (
			goto :MAPDRIVES
		)
	)

	net use
	timeout /t 5 1>nul
goto :EOF

:ERROR
	echo.
	echo.
	echo   ::::::::::::::::::::::::::::
	echo   :: ERROR                  ::
	echo   :: Unable to map drives...::
	echo   ::::::::::::::::::::::::::::
	echo.
pause
goto :EOF
