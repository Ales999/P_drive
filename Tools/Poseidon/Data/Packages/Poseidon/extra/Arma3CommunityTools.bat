:::::::::::::::::::::::::::::::::::::::::
::	Author: Tom_48_97
::  (c) 2013 Tom4897.info
::	Description:
::	Usage:
::	Wiki:
:::::::::::::::::::::::::::::::::::::::::
:: Small kid, after this line, GET OUT OF MY CODE ;-)
setlocal DisableDelayedExpansion
@echo off
cls

if "%1" EQU "WAVToLIP" goto:special
if "%1" EQU "WAVToWSS" goto:special
if "%1" EQU "WSSDecoder" goto:special
if "%1" EQU "mikero" goto:mikero
if "%1" EQU "pboProject" goto:pboProject
if "%1" EQU "Eliteness" goto:Eliteness
if "%1" EQU "DePew" goto:DePew
if "%1" EQU "DeRap" goto:DeRap
if "%1" EQU "DeWrp" goto:DeWrp
if "%1" EQU "DeWss" goto:DeWss
if "%1" EQU "ExtractPbo" goto:ExtractPbo
if "%1" EQU "MakePbo" goto:MakePbo
if "%1" EQU "install" goto:install

if %1 EQU p goto:p
if "%2" EQU "" (set key="HKEY_CURRENT_USER\Software\bohemia interactive\%1") else (set key="HKEY_CURRENT_USER\Software\bohemia interactive\%1 %2")
if "%1" EQU "arma3tools" set key="HKEY_CURRENT_USER\Software\bohemia interactive\arma 3 tools"
if "%1" EQU "AddonBuilder" set key="HKEY_CURRENT_USER\Software\bohemia interactive\arma 3 tools"

set PathToDir=0
For /F "Tokens=2* skip=2" %%A In ('REG QUERY %key% /v "Path"') Do (set PathToDir=%%B)
echo %PathToDir%
if "%PathToDir%" EQU "0" exit /1
set gui=0

@For /F "Tokens=2* skip=2" %%A In ('REG QUERY %key% /v "gui"') Do (set gui=%%B)

if "%1" EQU "ObjectBuilder" set gui=ObjectBuilder.exe
if "%1" EQU "TerrainBuilder" set gui=TerrainBuilder.exe
if "%1" EQU "AddonBuilder" set gui=AddonBuilder\addonBuilder.exe
if "%1" EQU "arma3tools" set gui=Arma3Tools.exe
echo %PathToDir%\%gui%
if "%gui%" NEQ "0" set command=%PathToDir%\%gui% & goto:run_command
if "%gui%" EQU "0" set command=explorer "%PathToDir%" & goto:run_command

exit /1

:run_command
if "%gui%" EQU "0" goto:Explore
if "%gui%" NEQ "0" goto:Launch

:explore
%command%
exit /1

:p
if exist "p:" (explorer p:) else (explorer o:)
exit /1

:Launch
title stdout %1
cd "%PathToDir%"
pushd "%PathToDir%"
echo %gui%
echo ------------
cd
start "" %gui% && endlocal && exit /B
exit

:mikero
if not exist "C:\Program Files (x86)\Mikero\DePboTools\bin" goto:nothingToDo
explorer "C:\Program Files (x86)\Mikero\DePboTools\bin"
exit

:pboProject
:DePew
:DeRap
:DeWrp
:DeWss
:ExtractPbo
:MakePbo
:Eliteness
if not exist "C:\Program Files (x86)\Mikero\DePboTools\bin\%1.exe" goto:nothingToDo
start "" "C:\Program Files (x86)\Mikero\DePboTools\bin\%1.exe" && endlocal && exit /B
exit

:install
set key="HKEY_CURRENT_USER\Software\bohemia interactive\Poseidon Tools"
For /F "Tokens=2* skip=2" %%A In ('REG QUERY %key% /v "Path"') Do (set PathToDir=%%B)
title stdout %1
cd "%PathToDir%"
pushd "%PathToDir%"
start "" "%PathToDir%\install.exe" && endlocal && exit /B
exit

:special
set PathToDir=0
if "%1" EQU "WAVToLIP" set key="HKEY_CURRENT_USER\Software\bohemia interactive\sound tools"
if "%1" EQU "WAVToWSS"  set key="HKEY_CURRENT_USER\Software\bohemia interactive\sound tools"
if "%1" EQU "WSSDecoder"  set key="HKEY_CURRENT_USER\Software\bohemia interactive\sound tools"
For /F "Tokens=2* skip=2" %%A In ('REG QUERY %key% /v "Path"') Do (set PathToDir=%%B)
echo %PathToDir%
if "%PathToDir%" EQU "0" exit /1
if "%1" EQU "WAVToLIP" set gui=WAVToLIPGUI
if "%1" EQU "WAVToWSS"  set gui=WAVToWSSGUI
if "%1" EQU "WSSDecoder"  set gui=WSSDecoderGUI
title stdout %1
cd "%PathToDir%"
pushd "%PathToDir%"
start "" "%gui%" && endlocal && exit /B
exit

:nothingToDo
exit