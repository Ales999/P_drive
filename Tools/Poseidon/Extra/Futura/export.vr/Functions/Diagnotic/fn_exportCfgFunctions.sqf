scriptName "fn_exportCfgFunctions_POSEIDON";
/*
	Author: Julien `Tom_48_97` VIDA
	Description:
	Parameter(s):
	Returns:
*/

_functions_ac 	= [_this, 0, true, [true]] call BIS_fnc_param;
_functions_re 	= [_this, 1, true, [true]] call BIS_fnc_param;
_commands	= [_this, 2, true, [true]] call bis_fnc_param;

private ["_list","_text"];
_list = [];

if (_functions_ac) then
{
	private ["_targetFile"];
	_targetFile = "O:\TMP\pte_fnc_AC.txt";
	"bis_poseidon" callExtension format ["%1<<trunc<</* productVersion: %2 %3 %4*/", _targetFile, productVersion select 1, productVersion select 2, productVersion select 3];
	{
		_child = configname _x;
		{
			_childChild = configname _x;	/* :-P */
			{
				[_list, configname _x] call BIS_fnc_arrayPush;
				"bis_poseidon" callExtension format["%2<<app<<{'trigger': 'BIS_fnc_%1', 'contents': 'BIS_fnc_%1'},", configname _x, _targetFile];
			} forEach ((configfile >> "cfgFunctions" >> _child >> _childChild) call BIS_fnc_returnchildren);
		} forEach ((configfile >> "cfgFunctions" >> _child) call BIS_fnc_returnchildren);
	} forEach ((configfile >> "cfgFunctions") call BIS_fnc_returnchildren);
};

if (_functions_re) then
{
	private ["_targetFile"];
	_targetFile = "O:\TMP\pte_fnc_RE.txt";
	"bis_poseidon" callExtension format ["%1<<trunc<< ", _targetFile, tostring [13, 10]];
	"bis_poseidon" callExtension format ["%1<<appLine<<(?i:BIS_fnc_(", _targetFile];
	{
		"bis_poseidon" callExtension format ["%1<<appLine<<%2|", _targetFile, _x];
	} forEach _list;
	"bis_poseidon" callExtension format ["%1<<appLine<<))", _targetFile, _x];
};

if (_commands) then
{

};