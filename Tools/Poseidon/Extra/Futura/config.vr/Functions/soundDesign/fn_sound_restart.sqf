scriptName "fn_sound_restart";
/*
	Author: Julien `Tom_48_97` VIDA

	Description:
	Describe your function

	Parameter(s):
	#0 OBJECT - Description

	Returns:
	BOOL - TRUE when done
*/

private ["_configFile"];
_configFile = [_this, 0, getText(missionConfigFile >> "configFile"), ["STRING"]] call bis_fnc_param;
if (typeName "STRING" != typeName _configFile) exitWith {false};
diag_mergeConfigFile [_configFile];
diag_log [_configFile + " has been merged."];
failMission "LOSER";
true