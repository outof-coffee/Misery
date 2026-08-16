#include "..\script_component.hpp"
/*
 * Author: tsalaroth
 * Re-apply AE3 laptop filesystem states from stored missionNamespace hashmap
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hacking_fnc_applyStorageStates;
 */

if (!isServer) exitWith {};

private _masterStorageMap = missionNamespace getVariable [QGVAR(storageStates), createHashMap];
if (count _masterStorageMap isEqualTo 0) exitWith {};

{
    _y params ["_className", "_savedFilesystem", "_savedPosASL"];

    [
        {
            params ["_className", "_savedPosASL"];
            (nearestObjects [ASLToAGL _savedPosASL, [_className], 2]) isNotEqualTo []
        },
        {
            params ["_className", "_savedFilesystem", "_savedPosASL"];
            private _matchedLaptop = (nearestObjects [ASLToAGL _savedPosASL, [_className], 2]) select 0;
            _matchedLaptop setVariable ["AE3_filesystem", _savedFilesystem, true];
        },
        [_className, _savedFilesystem, _savedPosASL],
        0.2
    ] call CBA_fnc_waitUntilAndExecute;
} forEach _masterStorageMap;
