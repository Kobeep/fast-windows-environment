@echo off
REM ==========================================
REM Originally created by Kobeep (https://github.com/Kobeep)
REM ==========================================

REM Check for administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Please run this script as Administrator.
    pause
    exit /b 1
)

REM Check if winget is installed using 'where'
where winget >nul 2>&1
if %errorlevel% neq 0 (
    echo Winget is not installed. Installing winget...
    powershell -ExecutionPolicy Bypass -Command "Install-Module -Name Microsoft.WinGet.Client -Force -Scope AllUsers"
    if %errorlevel% neq 0 (
        echo Failed to install winget. Exiting.
        pause
        exit /b 1
    )
) else (
    echo Winget is already installed.
)

REM Check if the apps.md file exists
if not exist "apps.md" (
    echo The file apps.md was not found. Please ensure it exists in this directory.
    pause
    exit /b 1
)

setlocal EnableDelayedExpansion

REM Loop to install applications from the apps.md file
for /F "usebackq delims=" %%a in ("apps.md") do (
    set "app=%%a"
    if "!app!"=="" (
        REM Skip empty lines
        goto :continue
    )
    REM Check if the application is already installed
    winget list --name "!app!" >nul 2>&1
    if errorlevel 1 (
        echo Installing !app!...
        winget install --silent --name "!app!" --accept-source-agreements --accept-package-agreements
        if errorlevel 1 (
            echo Failed to install !app!.
        ) else (
            echo Application !app! installed successfully.
        )
    ) else (
        echo Application !app! is already installed.
    )
    :continue
)
endlocal
pause
