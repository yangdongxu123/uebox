@echo off
setlocal
cd /d "%~dp0"
title Unreal Box Launcher
if not exist "tmp\environment\pnpm.cmd" (
  echo [ERROR] Local runtime is missing: tmp\environment\pnpm.cmd
  pause
  exit /b 1
)
if not exist "node_modules\electron\dist\electron.exe" (
  echo [ERROR] Dependencies are missing. Install the project environment first.
  pause
  exit /b 1
)
set "ELECTRON_RUN_AS_NODE="
echo Starting Unreal Box. Keep this console open while using the app.
call "%~dp0tmp\environment\pnpm.cmd" dev
set "launchResult=%ERRORLEVEL%"
if not "%launchResult%"=="0" (
  echo.
  echo [ERROR] Unreal Box exited with code %launchResult%.
  pause
)
exit /b %launchResult%
