@rem ScriptType: console,silent
@rem File: A:\BI Tools\cpp project\icons\icons\bin\Release\poseidon.dll

::@echo OFF
setLocal enableextensions enabledelayedexpansion

:: =========================== FIND PATH ===========================
:find_path
:v64_path_a3
For /F "Tokens=2* skip=2" %%A In ('REG QUERY "HKLM\SOFTWARE\Wow6432Node\Bohemia Interactive\Arma 3" /v "MAIN"') Do (set a3path=%%B)
IF NOT DEFINED a3path (GOTO v32_path_a3) ELSE (GOTO contruct_cmd)
:v32_path_a3
For /F "Tokens=2* skip=2" %%C In ('REG QUERY "HKLM\SOFTWARE\Bohemia Interactive\Arma 3" /v "MAIN"') Do (set a3path=%%D)
IF NOT DEFINED a3path (GOTO uac_PATH_a3) ELSE (GOTO contruct_cmd)
:uac_PATH_a3
@FOR /F "tokens=2* delims=	 " %%I IN ('REG QUERY "HKLM\SOFTWARE\Wow6432Node\Bohemia Interactive\Arma 3" /v "MAIN"') DO (SET a3path=%%J)
IF NOT DEFINED a3path (GOTO std_PATH_a3) ELSE (GOTO contruct_cmd)
:std_PATH_a3
@FOR /F "tokens=2* delims=	 " %%K IN ('REG QUERY "HKLM\SOFTWARE\Bohemia Interactive\Arma 3" /v "MAIN"') DO (SET a3path=%%L)
IF NOT DEFINED a3path (GOTO a3_no_installed) ELSE (GOTO contruct_cmd)


:: =========================== CONTRUCTOR ===========================
:contruct_cmd
:: CONFIG
SET appName=POSEIDON -
SET appVersion=0.59.325
SET appMod="-mod=@debug;Kart;Curator;Heli;Mark;"
SET appDebug=-window -noSplash -showScriptErrors -enableHT -filePatching
SET appExe=arma3.exe
if exist "%a3path%\arma3diag.exe" set appExe=arma3diag.exe
if exist "O:\Arma3\" (
	SET a3path=O:\Arma3\
	SET appExe=Arma3Int_DX11.exe
)
if exist "%a3path%" (SET TRUE=1) ELSE (goto error_path)
if exist "%a3path%" (SET TRUE=1) ELSE (goto error_path)

:: START LINE
SET a3Run="%appName%" "%a3path%\%appExe%" %appMod% %appDebug% -ORIG="%appName%" "%*"
goto log_success

:: =========================== LOGS ===========================
:log_success
goto RUN

:: =========================== ERRORS ===========================
:os_unsupported
endLocal
exit /B 1

:a3_no_installed
endLocal
exit /B 4

:a3oa_no_installed
endLocal
exit /B 3

:error_path
endLocal
exit /B 2

:: =========================== EOF ===========================
:RUN
START %a3Run% && ENDLOCAL && exit
:eof
ENDLOCAL
exit /B 0