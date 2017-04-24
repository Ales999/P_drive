:::::::::::::::::::::::::::::::::::::::::
::	Author: Tom_48_97
::  (c) 2013 Tom4897.info
::	Description: 
::	Usage:
::	Wiki:
:::::::::::::::::::::::::::::::::::::::::
:: Small kid, after this line, GET OUT OF MY CODE ;-)
@echo OFF
For /F "Tokens=2* skip=2" %%A In ('REG QUERY "HKEY_CURRENT_USER\Software\bohemia interactive\Poseidon Tools" /v "path"') Do (set PoseidonPath=%%B)
@START "%PoseidonPath%\poseidon.exe" "%userprofile%\AppData\Local\ArmA 2 OA\arma2oa.RPT"
exit