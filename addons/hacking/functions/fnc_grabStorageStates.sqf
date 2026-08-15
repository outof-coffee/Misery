#include "..\script_component.hpp"
/*
 * Author: tsalaroth
 * Server side filesystem state grabber for AE3 laptops
 * Creates a hashmap that is stored in a GRAD persistence trackable missionNamespace variable
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hacking_fnc_grabStorageStates;
 */

if (!isServer) exitWith {};

private _masterStorageMap = createHashMap;

{
    {
        private _laptop = _x;

        if (_laptop getVariable [QEGVAR(persistence,isCargo), false]) then { continue };

        private _filesystemData = _laptop getVariable ["AE3_filesystem", []];

        if (_filesystemData isNotEqualTo []) then {
            private _key = _laptop call BIS_fnc_objectVar;

            _masterStorageMap set [_key, [typeOf _laptop, _filesystemData, getPosASL _laptop]];
        };
    } forEach (allMissionObjects _x);
} forEach EGVAR(common_ae3,laptops);

missionNamespace setVariable [QGVAR(storageStates), _masterStorageMap, true];
