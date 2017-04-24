@rem ScriptType: console,silent

@echo OFF
setLocal enableextensions enabledelayedexpansion

::-----------------------------------
:: PARAMETERS
For /F "Tokens=2* skip=2" %%A In ('REG QUERY "HKEY_CURRENT_USER\Software\Bohemia Interactive\arma 3 tools" /v "path"') Do (set __DIRECTORY__="%%B")
if defined __DIRECTORY__ (set "__DIRECTORY__=%__DIRECTORY__%") else (set __DIRECTORY__=%~dp0)
set __DRIVE__=%__DIRECTORY__:~0,2%
::-----------------------------------
:: FIX PARAMETERS
set __DRIVE__=%__DRIVE__:"=%
set __DIRECTORY__=%__DIRECTORY__:"=%
::-----------------------------------
:: Main
%__DRIVE__%:
cd "%__DIRECTORY__%"
if exist FSMEditor (cd FSMEditor)
start FSMEditor.exe %*  && ENDLOCAL && exit
endLocal
exit /B 1