#include "..\script_component.hpp"
/*
 * Author: tsalaroth
 * Checks and displays whether a target AE3 laptop has been compromised
 *
 * Arguments:
 * 0: Target laptop <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call misery_hacking_fnc_checkCompromiseStatus
 */

params ["_target"];

if (isNull _target) exitWith {};

private _isCompromised = _target getVariable [QGVAR(compromised), false];

private _msg = [localize LSTRING(StatusClean), localize LSTRING(StatusCompromised)] select _isCompromised;

hintSilent format ["%1", _msg];
