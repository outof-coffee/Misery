#include "script_component.hpp"

if !(hasInterface) exitWith {};

["CBA_loadingScreenDone", {
    call FUNC(fobActions);
}] call CBA_fnc_addEventHandler;
