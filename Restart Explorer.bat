::Created by NEMIX

@echo off
title Explorer Restarter
echo [96m[   Launched "Explorer Restarter"   ][33m

>nul taskkill /F /IM explorer.exe
>nul start "" explorer.exe

echo.
echo [92m[   EXPLORER RESTARTED!   ][33m
echo.
pause
exit