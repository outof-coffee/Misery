#include "..\script_component.hpp"
/*
 * Author: tsalaroth
 * Transfers a unit's carried fob balance to a target unit's fob balance
 *
 * Arguments:
 * 0: Unit giving the balance <OBJECT>
 * 1: Target unit receiving the balance <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call misery_devices_fnc_giveFobMoney
 */

params ["_unit", "_target"];

if (isNull _target) exitWith {};

private _balance = _unit getVariable [QGVAR(fobBalance), 0];

if (_balance <= 0) exitWith {
    hintSilent format ["%1", localize LSTRING(NoFobBalance)];
};

private _targetBalance = _target getVariable [QGVAR(fobBalance), 0];

_target setVariable [QGVAR(fobBalance), _targetBalance + _balance, true];
_unit setVariable [QGVAR(fobBalance), 0, true];

hintSilent format ["%1", localize LSTRING(FobMoneyGiven)];
