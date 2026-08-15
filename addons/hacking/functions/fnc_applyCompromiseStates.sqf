#include "..\script_component.hpp"
/*
 * Author: tsalaroth
 * Re-apply AE3 laptop compromise states from stored missionNamespace hashmap
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hacking_fnc_applyCompromiseStates;
 */

if (!isServer) exitWith {};

private _masterCompromiseMap = missionNamespace getVariable [QGVAR(compromiseStates), createHashMap];
if (count _masterCompromiseMap isEqualTo 0) exitWith {};

{
    _y params ["_className", "_savedPosASL"];

    [
        {
            params ["_className", "_savedPosASL"];
            (nearestObjects [ASLToAGL _savedPosASL, [_className], 2]) isNotEqualTo []
        },
        {
            params ["_className", "_savedPosASL"];
            private _matchedLaptop = (nearestObjects [ASLToAGL _savedPosASL, [_className], 2]) select 0;
            _matchedLaptop setVariable [QGVAR(compromised), true, true];
        },
        [_className, _savedPosASL],
        0.2
    ] call CBA_fnc_waitUntilAndExecute;
} forEach _masterCompromiseMap;
