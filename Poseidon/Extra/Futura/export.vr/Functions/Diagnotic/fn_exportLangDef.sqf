scriptName "fn_exportCfgFunctions.sqf:";
/*--------------------------------------------------------------------
	file: fn_exportCfgFunctions.sqf
	===============================
	Author: Julien Vida <@tom_48_97>
	Description:
--------------------------------------------------------------------*/


_functions_ac 	= [_this, 0, true, [true]] call BIS_fnc_param;
_functions_re 	= [_this, 1, true, [true]] call BIS_fnc_param;
_commands_ac	= [_this, 2, true, [true]] call bis_fnc_param;
_commands_re	= [_this, 3, true, [true]] call bis_fnc_param;

// Function
private ["_getFileName"];
_getFileName = {
	format ["O:\TMP\pte_%1_%2.txt", _this select 0, _this select 1]
};

private ["_list","_text"];
_list = [];

"bi_Console" callExtension "============ EXPORT RVE LANG DEF ============";
"bi_Console" callExtension "Begin of Operations";
"bi_Console" callExtension "";


if (_functions_ac) then
{
	private ["_targetFile"];
	_targetFile = "O:\TMP\pte_fnc_AC.txt";
	"bi_Logger" callExtension format ["%1<<trunc<</* productVersion: %2 %3 %4*/", _targetFile, productVersion select 1, productVersion select 2, productVersion select 3];
	{
		_child = configname _x;
		{
			_childChild = configname _x;	/* :-P */
			{
				[_list, configname _x] call BIS_fnc_arrayPush;
				"bi_Logger" callExtension format["%2<<app<<{'trigger': 'BIS_fnc_%1', 'contents': 'BIS_fnc_%1'},", configname _x, _targetFile];
			} forEach ((configfile >> "cfgFunctions" >> _child >> _childChild) call BIS_fnc_returnchildren);
		} forEach ((configfile >> "cfgFunctions" >> _child) call BIS_fnc_returnchildren);
	} forEach ((configfile >> "cfgFunctions") call BIS_fnc_returnchildren);
};

if (_functions_re) then
{
	private ["_targetFile"];
	_targetFile = "O:\TMP\pte_fnc_RE.txt";
	"bi_Logger" callExtension format ["%1<<trunc<< ", _targetFile, tostring [13, 10]];
	"bi_Logger" callExtension format ["%1<<appLine<<(?i:BIS_fnc_(", _targetFile];
	{
		"bi_Logger" callExtension format ["%1<<appLine<<%2|", _targetFile, _x];
	} forEach _list;
	"bi_Logger" callExtension format ["%1<<appLine<<))", _targetFile, _x];
};
"bi_Console" callExtension "End of Operations";

if (true) exitWith {/* code */};

if (_commands_ac) then
{
	private ["_targetFile"];
	_targetFile = ["cmd","AC"] call _getFileName;
	{
		"bi_Logger" callExtension format["%2<<app<<{'trigger': '%1', 'contents': '%1'},", _x, _targetFile];
	} forEach supportInfo "l";
};

if (_commands_re) then
{
	private ["_targetFile"];
	_targetFile = ["cmd","RE"] call _getFileName;
	{
		"bi_Logger" callExtension format ["%1<<appLine<<%2|", _targetFile, _x];
	} forEach supportInfo "l";
};

