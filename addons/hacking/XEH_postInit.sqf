#include "script_component.hpp"

if !(hasInterface) exitWith {};

["CBA_loadingScreenDone", {
    call FUNC(hackActions);
    call FUNC(stationActions);
}] call CBA_fnc_addEventHandler;
