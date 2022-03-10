::Created by NEMIX

@echo off
title IP Reset
echo [96m IP Reset
echo.
echo [33m Processing, please wait . . .

>nul ipconfig /release
>nul ipconfig /Renew

echo [92m IP changed successfully!
echo [33m
pause
exit
