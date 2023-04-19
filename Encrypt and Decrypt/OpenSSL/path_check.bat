@echo off
color 03
type ASCII\openssl_art.txt 
echo.
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
echo exiting in 6 seconds...
timeout 6 >nul
exit
