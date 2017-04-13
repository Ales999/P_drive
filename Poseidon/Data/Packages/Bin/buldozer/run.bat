@echo off
setLocal enableextensions enabledelayedexpansion
SET appExe=buldozer.exe
SET appName=buldozer
:: =========================== CHECK OS VERSION ===========================
ver | findstr /i "5\.0\." > nul
IF %ERRORLEVEL% EQU 0 goto find_path
ver | findstr /i "5\.1\." > nul
IF %ERRORLEVEL% EQU 0 goto find_path
ver | findstr /i "5\.2\." > nul
IF %ERRORLEVEL% EQU 0 goto find_path
ver | findstr /i "6\.0\." > nul
IF %ERRORLEVEL% EQU 0 goto find_path
ver | findstr /i "6\.1\." > nul
IF %ERRORLEVEL% EQU 0 goto find_path
ver | findstr /i "6\.2\." > nul
IF %ERRORLEVEL% EQU 0 goto find_path

:: =========================== FIND PATH ===========================
:find_path
SET buldozerpath="p:\"

:: =========================== START ===========================
:run_program
echo %buldozerpath%
SET appParam= -window -buldozer -world=empty
SET run="%appName%" "%buldozerpath%\%appExe%" "%appParam%" "%*"
echo %run%
START %run% && ENDLOCAL && exit

:error
color 47
cls
echo ====================  CRITICAL ========================
echo Oxygen 2 was not found on this computer
echo ====================  CRITICAL ========================
pause
echo  press any key to exit
exit 