#include "..\script_component.hpp"
/*
 * Author: tsalaroth
 * Stores stolen data carried by a player onto a Hacking Station
 *
 * Arguments:
 * 0: Unit storing the data <OBJECT>
 * 1: Target hacking station <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call misery_hacking_fnc_dumpData
 */

params ["_unit", "_station"];

if (isNull _station) exitWith {};

private _stolenData = _unit getVariable [QGVAR(stolenData), []];

if (_stolenData isEqualTo []) exitWith {
    hintSilent format ["%1", localize LSTRING(NoDataToStore)];
};

private _storedData = _station getVariable [QGVAR(dumpedData), []];
_storedData pushBack _stolenData;
_station setVariable [QGVAR(dumpedData), _storedData, true];

_unit setVariable [QGVAR(stolenData), [], false];

hintSilent format ["%1", localize LSTRING(DataStored)];
