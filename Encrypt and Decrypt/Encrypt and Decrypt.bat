@echo off
color B


:menu
cls
type ASCII\main_art.txt
echo.
echo Main Menu
echo ---------
echo 1. Encrypt File
echo 2. Decrypt File
echo 3. Install/Check For OpenSSL (Required)
echo 4. Exit

set /p choice=Enter your choice (1-4):

if "%choice%"=="1" goto option1
if "%choice%"=="2" goto option2
if "%choice%"=="3" goto option3
if "%choice%"=="4" goto exit

echo Invalid choice. Please try again.
pause
goto menu

:option1
echo You want to Encrypt a File...
start Options\encrypt.bat
goto menu

:option2
echo You want to Decrypt a File...
start Options\decrypt.bat
goto menu

:option3
echo Install/Check OpenSSL...
start OpenSSL\opensslcheck.bat
goto menu

:exit
echo Goodbye!