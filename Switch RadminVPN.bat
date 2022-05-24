@echo off
echo [101;93mSwitch Radmin VPN[0m
echo [44mCreated by NEMIX[0m
echo.

::Your Path to RadminVPN
set rvppath="C:\Program Files (x86)\Radmin VPN\RvRvpnGui.exe"

::Timeout
set timeout=5
:func
set /p ask=[33m[on / off]: [0m
if "%ask%"=="on" goto start
if "%ask%"=="off" goto stop
if "%ask%"=="" goto misscomm
if "%ask%"=="x"     exit
if "%ask%"=="close" exit
if "%ask%"=="end"   exit


:misscomm
echo [31mIncorrect Command[0m
goto func

::Start Radmin
:start
echo [33m
sc config RvControlSvc start= demand
net start RvControlSvc
echo [33mStarting RadminVPN Client . . .
echo.
start "" %rvppath%
>nul timeout /t 1 /nobreak
start "" %rvppath%
echo [92m[   RadminVPN has Started!   ][0m
echo.
goto menu-if-on

::Stop Radmin
:stop
echo.
echo [33mStopping RadminVPN (Client and Service) . . .
taskkill /F /IM "RvRvpnGui.exe"
net stop RvControlSvc
sc config RvControlSvc start= disabled
echo.
echo [92m[   RadminVPN has Stopped!   ][0m
echo.
goto menu-if-off

:menu-if-on
echo [33mSelect command: [0m
echo [96m[ off ][0m
echo [96m[ [31mx / close[96m ][0m
set /p ask=[92mCommand: [0m
if "%ask%"=="off" goto stop
if "%ask%"=="x"     exit
if "%ask%"=="close" exit
goto end

:menu-if-off
echo [33mSelect command: [0m
echo [96m[ on ][0m
echo [96m[ [31mx / close[96m ][0m
set /p ask=[92mCommand: [0m
if "%ask%"=="on" goto start
if "%ask%"=="x"     exit
if "%ask%"=="close" exit
goto end

:end
rem timeout /t %timeout%
pause
exit