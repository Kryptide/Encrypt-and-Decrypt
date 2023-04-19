@echo off
color 0A
type ASCII\decrypt_art.txt
echo.
setlocal enabledelayedexpansion

rem Set variables
set "dir=%CD%\File(s) to Decrypt"  rem Use the current directory as the default directory
set "openssl_path=C:\Program Files\OpenSSL-Win64\bin\openssl.exe"  rem Update this with the path to your OpenSSL executable

rem List encrypted files in directory
echo Encrypted files in directory: %dir%
set "num=0"
for %%f in ("%dir%\*.enc") do (
  set /a "num+=1"
  echo [!num!] %%~nxf
)

rem Prompt for file selection
set /p "selection=Enter the number of the file you want to decrypt: "

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
  echo Invalid selection
  pause
  exit /b 1
)

rem Decrypt file
set "decrypted_file=%selected_file:.enc=%"
"%openssl_path%" aes-256-cbc -d -iter 100000 -in "%selected_file%" -out "%decrypted_file%" -pbkdf2

echo File decrypted successfully: %decrypted_file%

rem Ask user if they want to delete encrypted file
set /p "delete_encrypted_file=Do you want to delete the encrypted file? (y/n): "

if /i "%delete_encrypted_file%"=="y" (
    del "%selected_file%"
    echo Encrypted file deleted successfully.
    pause
    exit
) else (
    echo Encrypted file not deleted.
    pause
    exit
)

endlocal
exit /b
