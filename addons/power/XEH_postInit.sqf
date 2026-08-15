#include "script_component.hpp"

if (isServer) then {
    call FUNC(initLightSources);

    if (isClass (missionConfigFile >> "CfgGradPersistence")) then {
        {
            [_x] call GRADFUNC(persistence,blacklistClasses);
        } forEach (EGVAR(devices,laptops) + EGVAR(devices,solarPanels) + EGVAR(devices,batteryPacks) + EGVAR(devices,generators));
    };
};

if !(hasInterface) exitWith {};

["CBA_loadingScreenDone", {
    call FUNC(generatorInteractions);
}] call CBA_fnc_addEventHandler;
