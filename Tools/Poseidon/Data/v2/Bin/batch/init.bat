::/*--------------------------------------------------------------------
::	Author: Julien `Tom_48_97` VIDA <@tom_48_97>
::--------------------------------------------------------------------*/
if [c_init] EQU [1] goto:c_init_done
:c_init_script
if [%con_title%] EQU [] set con_title=Poseidon Tool
prompt [%con_title%]:
cls
@echo off
color 02
set myBase=%~dp0
for %%f in ("%myBase%") do (set myBase=%%~sf)
cd Functions
set fnc=%cd%\
for %%f in ("%fnc%") do (set fnc=%%~sf)
cd %myBase%
cd ..
cd ..
cd ..
cd ..
set instDir=%cd%
for %%f in ("%instDir%") do (set instDir=%%~sf)
set main=%instDir%\PoseidonMain.exe
set c_init=1
title %con_title%
call %fnc%IRideAnUnicorn
echo /*-----------------------------------------------------------------------------
echo 	                  %con_title%
echo -----------------------------------------------------------------------------*/
echo.
prompt [%con_title%]:
rem %fnc%workDirSet %instDir%
cd %instDir%
pushd %instDir%
:c_init_done