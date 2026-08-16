#include "..\script_component.hpp"
/*
 * Author: tsalaroth
 * Server side compromise-state grabber for AE3 laptops
 * Creates a hashmap that is stored in a GRAD persistence trackable missionNamespace variable
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hacking_fnc_grabCompromiseStates;
 */

if (!isServer) exitWith {};

private _masterCompromiseMap = createHashMap;

{
    {
        private _laptop = _x;

        if (_laptop getVariable [QEGVAR(persistence,isCargo), false]) then { continue };

        if (_laptop getVariable [QGVAR(compromised), false]) then {
            private _key = _laptop call BIS_fnc_objectVar;

            _masterCompromiseMap set [_key, [typeOf _laptop, getPosASL _laptop]];
        };
    } forEach (allMissionObjects _x);
} forEach EGVAR(devices,laptops);

missionNamespace setVariable [QGVAR(compromiseStates), _masterCompromiseMap, true];
