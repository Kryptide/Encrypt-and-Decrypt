@echo off
color B
title Encrypt and Decrypt By Kryptide


:menu
cls
type ASCII\main_art.txt
echo.
echo Encrypt and Decrypt Main Menu
echo -----------------------------
echo 1. Encrypt File
echo 2. Decrypt File
echo 3. Install/Check For OpenSSL (Required)
echo 4. More Batch Files
echo 5. Exit

set /p choice=Enter your choice (1-5):

if "%choice%"=="1" goto option1
if "%choice%"=="2" goto option2
if "%choice%"=="3" goto option3
if "%choice%"=="4" goto option4
if "%choice%"=="5" goto option5

echo Invalid choice. Please try again.
pause
goto menu

:option1
echo Loading Encryption Tool...
ping -n 2 localhost > nul
start Options\encrypt.bat
goto menu

:option2
echo Loading Decryption Tool...
ping -n 2 localhost > nul
start Options\decrypt.bat
goto menu

:option3
echo Loading OpenSSL Tool...
ping -n 2 localhost > nul
start OpenSSL\opensslcheck.bat
goto menu

:option4
echo Opening GitHub...
ping -n 2 localhost > nul
start https://github.com/Kryptide/
goto :menu

:option5
echo Exiting...
ping -n 2 localhost > nul
exit



:exit
echo Goodbye!
