#include "..\script_component.hpp"
/*
 * Author: tsalaroth
 * Copies a target laptop's filesystem onto the acting player and marks it compromised
 *
 * Arguments:
 * 0: Unit performing the theft <OBJECT>
 * 1: Target laptop <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call misery_hacking_fnc_stealData
 */

params ["_unit", "_target"];

if (isNull _target) exitWith {};

private _filesystemData = _target getVariable ["AE3_filesystem", []];

_unit setVariable [QGVAR(stolenData), _filesystemData, false];

_target setVariable [QGVAR(compromised), true, true];

hintSilent format ["%1", localize LSTRING(DataStolen)];
