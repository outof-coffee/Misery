#include "..\script_component.hpp"
/*
 * Author: tsalaroth
 * Marks a target AE3 laptop as compromised
 *
 * Arguments:
 * 0: Unit performing the hack <OBJECT>
 * 1: Target laptop <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call misery_hacking_fnc_hackLaptop
 */

params ["_unit", "_target"];

if (isNull _target) exitWith {};

_target setVariable [QGVAR(compromised), true, true];
