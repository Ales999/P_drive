::/*--------------------------------------------------------------------
::	Author: Julien `Tom_48_97` VIDA <@tom_48_97>
::--------------------------------------------------------------------*/
if not exist %1 (call %fnc%haltOnError [%~n0] workDirSet "%1" doesn't exist!)
set _=%1
cd %_%
pushd %_%
chdir /d %1