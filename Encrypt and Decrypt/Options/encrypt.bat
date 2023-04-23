@echo off
title Encrypt by Kryptide
setlocal enabledelayedexpansion
color 0C
:loop
type ASCII\encrypt_art.txt
echo.


rem Set variables
set "openssl_path=C:\Program Files\OpenSSL-Win64\bin\openssl.exe"  rem Update this with the path to your OpenSSL executable
set "dir=%cd%\File(s) to Encrypt"  rem Use the current directory as the default directory

rem List files in directory
echo Files in directory: %dir%
set "num=0"
for /f "delims=" %%f in ('dir /b "%dir%" ^| findstr /v /i "\.enc$"') do (
  set /a "num+=1"
  echo [!num!] %%~nxf
)

rem Prompt for file selection
set /p "selection=Enter the number of the file you want to encrypt: "

rem Get selected file
set "selected_file="
set "num=0"
for /f "delims=" %%f in ('dir /b "%dir%" ^| findstr /v /i "\.enc$"') do (
  set /a "num+=1"
  if !num! equ %selection% (
    set "selected_file=%dir%\%%~f"
    goto :break
  )
)
:break

if not defined selected_file (
  echo Invalid selection
  pause
  cls
  goto :loop
)

rem Encrypt file
set "encrypted_file=%selected_file%.enc"
"%openssl_path%" aes-256-cbc -salt -iter 100000 -in "%selected_file%" -out "%encrypted_file%" -pbkdf2


if errorlevel 1 (
echo [7mPASSWORDS DO NOT MATCH [0m
echo.
echo [91m
pause
cls
goto :loop
)


echo Please wait, encrypting file...
ping -n 2 localhost > nul


echo File encrypted successfully: %encrypted_file%

rem Ask user if they want to delete original file
set "delete_original="
set /p "delete_original=Do you want to delete the original file? (y/n): "

if /i "%delete_original%"=="y" (
    del "%selected_file%"
    echo Original file deleted.
) else (
    echo Original file not deleted.
)

rem Ask user if they want to encrypt another file
set "encrypt_another="
set /p "encrypt_another=Do you want to encrypt another file? (y/n): "

if /i "%encrypt_another%"=="y" (
    cls
    goto :loop
)

if /i "%encrypt_another%"=="n" (
    exit
)






endlocal
exit /b
