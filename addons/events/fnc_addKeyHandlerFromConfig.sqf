/* ----------------------------------------------------------------------------
Function: CBA_fnc_addKeyHandlerFromConfig

Description:
	Adds an action to a keyhandler, read from config
	
Parameters:
	_component - Classname under "CfgSettings" >> "CBA" >> "events" [String].
	_action - Action classname [String].
	_code - Code to execute upon event [Code].
	_type - "DOWN" (default) = keyDown,  "UP" = keyUp [String].

Returns:

Examples:
	(begin example)
		["cba_sys_nvg", "nvgon", { _this call myAction }] call CBA_fnc_addKeyHandlerFromConfig
	(end)

Author:
	Sickboy
---------------------------------------------------------------------------- */
#include "script_component.hpp"
SCRIPT(addKeyHandlerFromConfig);

private ["_key", "_type"];
PARAMS_3(_component,_action,_code);
_type = if (count _this > 3) then { _this select 3 } else { "DOWN" };

_key = [_component, _action] call CBA_fnc_readKeyFromConfig;
if (_key select 0 > -1) exitWith
{
	 [_key select 0, _key select 1, _code, _type] call CBA_fnc_addKeyHandler;
	 true;
};

false;
