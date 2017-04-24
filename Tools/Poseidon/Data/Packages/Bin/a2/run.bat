@rem ScriptType: console,silent
@rem File: A:\BI Tools\cpp project\icons\icons\bin\Release\poseidon.dll

@echo OFF
setLocal enableextensions enabledelayedexpansion

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
goto os_unsupported

:: =========================== FIND PATH ===========================
:find_path
:v64_path_a2
For /F "Tokens=2* skip=2" %%A In ('REG QUERY "HKLM\SOFTWARE\Wow6432Node\Bohemia Interactive Studio\ArmA 2" /v "MAIN"') Do (set a2path=%%B)
IF NOT DEFINED a2path (GOTO v32_path_a2) ELSE (GOTO v64_path_a2oa)
:v32_path_a2
For /F "Tokens=2* skip=2" %%C In ('REG QUERY "HKLM\SOFTWARE\Bohemia Interactive Studio\ArmA 2" /v "MAIN"') Do (set a2path=%%D)
IF NOT DEFINED a2path (GOTO uac_PATH_A2) ELSE (GOTO v64_path_a2oa)
:uac_PATH_A2
@FOR /F "tokens=2* delims=	 " %%I IN ('REG QUERY "HKLM\SOFTWARE\Wow6432Node\Bohemia Interactive Studio\ArmA 2" /v "MAIN"') DO (SET a2path=%%J)
IF NOT DEFINED a2path (GOTO std_PATH_A2) ELSE (GOTO v64_path_a2oa)
:std_PATH_A2
@FOR /F "tokens=2* delims=	 " %%K IN ('REG QUERY "HKLM\SOFTWARE\Bohemia Interactive Studio\ArmA 2" /v "MAIN"') DO (SET a2path=%%L)
IF NOT DEFINED a2path (GOTO a2_no_installed) ELSE (GOTO v64_path_a2oa)
:v64_path_a2oa
For /F "Tokens=2* skip=2" %%E In ('REG QUERY "HKLM\SOFTWARE\Wow6432Node\Bohemia Interactive Studio\ArmA 2 OA" /v "MAIN"') Do (set a2oapath=%%F)
IF NOT DEFINED a2oapath (GOTO v32_path_a2oa) ELSE (GOTO contruct_cmd)
:v32_path_a2oa
For /F "Tokens=2* skip=2" %%G In ('REG QUERY "HKLM\SOFTWARE\Bohemia Interactive Studio\ArmA 2 OA" /v "MAIN"') Do set (a2oapath=%%H)
IF NOT DEFINED a2oapath (GOTO uac_PATH_A2OA) ELSE (GOTO contruct_cmd)
:uac_PATH_A2OA
@FOR /F "tokens=2* delims=	 " %%M IN ('REG QUERY "HKLM\SOFTWARE\Wow6432Node\Bohemia Interactive Studio\ArmA 2 OA" /v "MAIN"') DO (SET a2oapath=%%N)
IF NOT DEFINED a2oapath (GOTO std_PATH_A2OA) ELSE (GOTO contruct_cmd)
:std_PATH_A2OA
@FOR /F "tokens=2* delims=	 " %%O IN ('REG QUERY "HKLM\SOFTWARE\Bohemia Interactive Studio\ArmA 2 OA" /v "MAIN"') DO (SET a2oapath=%%P)
IF NOT DEFINED a2oapath (GOTO a2oa_no_installed) ELSE (GOTO contruct_cmd)

:: =========================== CONTRUCTOR ===========================
:contruct_cmd
:: CONFIG 
SET appName=POSEIDON - 
SET appVersion=0.62
SET appMod="-mod=@debug;dev"
SET appDebug=-window -noSplash -showScriptErrors
SET appExe=arma2oa.exe
if exist "%a2oapath%" (SET TRUE=1) ELSE (goto error_path)
if exist "%a2path%" (SET TRUE=1) ELSE (goto error_path)

:: START LINE
SET a2Run="%appName%" "%a2oapath%\%appExe%" "%*" %appMod% %appDebug% -comment="Started from %appName% %appVersion%"
goto log_success

:: =========================== LOGS ===========================
:log_success
goto RUN

:: =========================== ERRORS ===========================
:os_unsupported
endLocal
exit /B 1

:a2_no_installed
endLocal
exit /B 4

:a2oa_no_installed
endLocal
exit /B 3

:error_path
endLocal
exit /B 2

:: =========================== EOF ===========================
:RUN
START %a2Run% && ENDLOCAL && exit
:eof
exit /B 0