@REM Created by Kobeep https://github.com/Kobeep.

@REM Installing the winget tool..

if EXIST "%ProgramFiles%\WindowsPowerShell\Modules\Microsoft.WinGet.Client" (
  echo Winget tool is already installed.
) else (
  echo Installing winget tool...
  powershell -ExecutionPolicy Bypass -Command Install-Module -Name Microsoft.WinGet.Client
)

@REM Reading applications from apps.md file
setlocal EnableDelayedExpansion

for /F "delims=" %%a in ('type "apps.md"') do (
  set app=%%a
  if not defined app (
    goto :eof
  )

  @REM Installing application using winget
  if winget list !app! (
    echo !app! is already installed.
  ) else (
    winget install --silent !app!git config --global user.email "you@example.com"
  git config --global user.name "Your Name"