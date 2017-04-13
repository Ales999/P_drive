:::::::::::::::::::::::::::::::::::::::::
::	Author: Tom_48_97
::  (c) 2013 Tom4897.info
::	Description: 
::	Usage:
::	Wiki:
:::::::::::::::::::::::::::::::::::::::::
:: Small kid, after this line, GET OUT OF MY CODE ;-)
@echo off

SET _=%cd%
SET arma3log_dir=%userprofile%\AppData\Local\Arma 3

%arma3log_dir:~0,2%
cd %userprofile%\AppData\Local\Arma 3
for /f "delims=" %%x in ('dir /od /a-d /b arma3diag*.rpt') do set recent=%%x
cd %poseidon_dir:~0,2%
echo %recent%
%_:~0,2%
For /F "Tokens=2* skip=2" %%A In ('REG QUERY "HKEY_CURRENT_USER\Software\bohemia interactive\Poseidon Tools" /v "path"') Do (set PoseidonPath=%%B)
@START "%PoseidonPath%\poseidon.exe" "%userprofile%\AppData\Local\Arma 3\%recent%"
exit