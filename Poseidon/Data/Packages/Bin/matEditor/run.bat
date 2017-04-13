@echo off
setLocal enableextensions enabledelayedexpansion
SET appExe=MatEditor.exe
SET appName=Matrial Editor
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
set VALUE_NAME="MAIN"



:: =========================== FIND PATH ===========================
:find_path
:v64_path
For /F "Tokens=2* skip=2" %%A In ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Bohemia Interactive Studio\Oxygen 2 Personal Edition" /v "MAIN"') Do (set oxygenpath=%%B)
IF NOT DEFINED oxygenpath (GOTO v32_path) ELSE (GOTO run_program)

:v32_path
For /F "Tokens=2* skip=2" %%A In ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Bohemia Interactive Studio\Oxygen 2 Personal Edition" /v "MAIN"') Do (set oxygenpath=%%B)
IF NOT DEFINED oxygenpath (GOTO uac_path) ELSE (GOTO run_program)

:uac_path
For /F "Tokens=2* skip=2" %%A In ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Bohemia Interactive\Oxygen 2 Personal Edition" /v "MAIN"') Do (set oxygenpath=%%B)
IF NOT DEFINED oxygenpath (GOTO error) ELSE (GOTO run_program)

:std_path
For /F "Tokens=2* skip=2" %%A In ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Bohemia Interactive\Oxygen 2 Personal Edition" /v "MAIN"') Do (set oxygenpath=%%B)
IF NOT DEFINED oxygenpath (GOTO v32_path) ELSE (GOTO run_program)

:: =========================== START ===========================
:run_program
echo %oxygenpath%
SET run="%appName%" "%oxygenpath%\%appExe%" "%*"
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