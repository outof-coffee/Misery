#include "..\script_component.hpp"
/*
 * Author: tsalaroth
 * Marks a target AE3 laptop as an enabled hacking station
 *
 * Arguments:
 * 0: Target laptop <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call misery_hacking_fnc_enableHackingStation
 */

params ["_target"];

if (isNull _target) exitWith {};

_target setVariable [QGVAR(hackingEnabled), true, true];
