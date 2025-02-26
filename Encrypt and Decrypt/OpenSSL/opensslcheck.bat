@echo off
color 03
title OpenSSL Installer/Checker by Kryptide
setlocal
type ASCII\openssl_art.txt 
echo.
rem Set variables
set "openssl_url=https://slproweb.com/download/Win64OpenSSL_Light-3_4_1.exe"
set "openssl_file=%temp%\Win64OpenSSL.exe"
set "openssl_path=%SystemDrive%\Program Files\OpenSSL-Win64\bin\openssl.exe"

rem Check if OpenSSL is already installed
echo Checking if OpenSSL is already installed...
if exist "%openssl_path%" (
echo OpenSSL is already installed. Checking if the PATH has been set...
  timeout 6 >nul
  start OpenSSL\path_check.bat
  exit
)

rem Download OpenSSL installer package
echo Downloading OpenSSL installer package...
powershell -command "(New-Object System.Net.WebClient).DownloadFile('%openssl_url%', '%openssl_file%')"

rem Run OpenSSL installer package
echo Running OpenSSL installer...
start /wait "" "%openssl_file%"

rem Check if OpenSSL was installed successfully
echo Checking if OpenSSL was installed successfully...
if exist "%openssl_path%" (
  echo OpenSSL was installed successfully
) else (
  echo OpenSSL installation failed
  exit
)

rem Delete OpenSSL installer package
echo Deleting OpenSSL installer package...
del "%openssl_file%"

rem Check to make sure OpenSSL has been added to PATH
set "new_path=%SystemDrive%\Program Files\OpenSSL-Win64\bin\openssl.exe"

rem Check if the new path is already in the PATH environment variable
echo %PATH% | %SystemRoot%\System32\find.exe /C "%new_path%" >nul
if %errorlevel% equ 0 (
    echo The path %new_path% is already in the PATH environment variable.
) else (
    rem Add the new path to the PATH environment variable
    setx PATH "%PATH%;%new_path%"
    echo The path %new_path% has been added to the PATH environment variable.
)

pause
exit
endlocal
