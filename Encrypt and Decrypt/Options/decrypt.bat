@echo off
color 0A
title Decrypt by Kryptide
:decrypt_file
type ASCII\decrypt_art.txt
echo.
setlocal enabledelayedexpansion

rem Set variables
set "dir=%CD%\File(s) to Decrypt"  rem Use the current directory as the default directory
set "openssl_path=%SystemDrive%\Program Files\OpenSSL-Win64\bin\openssl.exe"  rem Update this with the path to your OpenSSL executable

rem List encrypted files in directory
echo Encrypted files in directory: %dir%
set "num=0"
for %%f in ("%dir%\*.enc") do (
  set /a "num+=1"
  echo [!num!] %%~nxf
)

rem Prompt for file selection
set /p "selection=Enter the number of the file you want to decrypt: "

if not defined selection (
    echo Please enter the [number] that corresponds with the file you wish to decrypt.
    pause
    cls
    goto :decrypt_file
)

rem Get selected file
set "selected_file="
set "num=0"
for %%f in ("%dir%\*.enc") do (
  set /a "num+=1"
  if !num! equ %selection% (
    set "selected_file=%%~f"
    goto :break
  )
)
:break

if not defined selected_file (
  echo Invalid selection.
  pause
  cls
  goto :decrypt_file
)

rem Decrypt file
set "decrypted_file=%selected_file:.enc=%"
"%openssl_path%" aes-256-cbc -d -iter 100000 -in "%selected_file%" -out "%decrypted_file%" -pbkdf2

if errorlevel 1 (
echo [7mINCORRECT PASSWORD [0m
echo.
echo [92m
pause
cls
goto :decrypt_file
)

echo Please wait, decrypting file...
ping -n 2 localhost > nul

echo File decrypted successfully: %decrypted_file%

rem Ask user if they want to delete encrypted file
set /p "delete_encrypted_file=Do you want to delete the encrypted file? (y/n): "

if /i "%delete_encrypted_file%"=="y" (
    del "%selected_file%"
    echo Encrypted file deleted successfully.
) else (
    echo Encrypted file not deleted.
)

rem Ask user if they want to decrypt another file
set /p "decrypt_another_file=Do you want to decrypt another file? (y/n): "

if /i "%decrypt_another_file%"=="y" (
    cls
    goto :decrypt_file
) else (
    exit
)

endlocal
exit /b
