@echo off
setlocal EnableDelayedExpansion

set "URL=https://github.com/sykhangdha/OpenCL-AMD-fix/raw/refs/heads/main/OpenCL.dll"
set "TEMPFILE=%TEMP%\OpenCL.dll"
set "DEST=C:\Windows\System32\OpenCL.dll"

:: Check for admin rights
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo.
    echo ================================
    echo  This script MUST be run as administrator!
    echo  Right-click and select "Run as Administrator"
    echo ================================
    pause
    exit /b
)

echo.
echo ================================
echo This script will install OpenCL.dll to System32.
echo The DLL comes from:
echo   %URL%
echo
echo It uses the official OpenCL runtime from:
echo   https://github.com/KhronosGroup/OpenCL-SDK/releases/tag/v2024.10.24
echo ================================
echo.

echo Do you want to continue with the installation? (Y/N)
choice /C YN /N
if errorlevel 2 (
    echo Installation cancelled.
    pause
    exit /b
)

echo.
echo Downloading OpenCL.dll...
curl -L -o "%TEMPFILE%" "%URL%" 2>nul

if not exist "%TEMPFILE%" (
    echo.
    echo ================================
    echo  Download failed!
    echo  Please manually download the file from:
    echo  %URL%
    echo  Then copy it to:
    echo  %DEST%
    echo ================================
    pause
    exit /b
)

:: Try to copy immediately
echo.
echo Attempting to copy OpenCL.dll to System32...
copy /Y "%TEMPFILE%" "%DEST%" >nul

if %errorlevel% NEQ 0 (
    echo.
    echo ================================
    echo  ERROR: The process cannot access the file because it is being used by another process.
    echo  This likely means OpenCL.dll is already in use on your system.
    echo  Please try rebooting your PC to see if the error is resolved.
    echo ================================
    echo File replacement scheduled. If rebooting does not resolve the issue, try manual replacement.
    echo ================================
    
    :: PowerShell command to schedule file replacement
    powershell -Command ^
    "Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager' -Name 'PendingFileRenameOperations' -Value ([string[]]@('%TEMPFILE%', '\??\%DEST%'))"

    pause
    exit /b
)

echo.
echo ================================
echo   OpenCL.dll installed successfully!
echo ================================
pause
