@REM Installing the winget tool..

if winget -v (echo "Winget tool is already installed.") else (Install-Module -Name Microsoft.WinGet.Client)

@REM U are able to choose what do you want to install: apps/drivers/all.
set /p choice=What do you want to install ? (all/apps/drivers):

@REM Checking the choice of user.
if %choice%==all | %choice%==All goto apps && goto drivers
if %choice%==apps | %choice%==Apps goto apps
if %choice%==drivers | %choice%==Drivers goto drivers

:apps

@REM Installing VLC media player.
if winget list vlc (echo "Vlc media player is already installed") else (winget install "vlc")

@REM Installing Visual Studio Code.
if winget list vscode (echo "Visual Studio Code is already installed") else (winget install "vscode")

@REM Installing Google Chrome.
if winget list chrome (echo "Google Chrome is already installed") else (winget install "Google Chrome")

@REM Installing Spotify.
if winget list Spotify (echo "Spotify is already installed") else (winget install "Spotify")

@REM Installing Keeweb.
if winget list Keeweb (echo "Keeweb is already installed") else (winget install "Keeweb")

:drivers

@REM start \drivers\ ***.exe

@REM start \drivers\ ***.exe

@REM start \drivers\ ***.exe 