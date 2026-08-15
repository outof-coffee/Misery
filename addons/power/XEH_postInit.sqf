#include "script_component.hpp"

if (isServer) then {
    call FUNC(initLightSources);

    if (isClass (missionConfigFile >> "CfgGradPersistence")) then {
        {
            [_x] call GRADFUNC(persistence,blacklistClasses);
        } forEach (EGVAR(common_ae3,laptops) + EGVAR(common_ae3,solarPanels) + EGVAR(common_ae3,batteryPacks) + EGVAR(common_ae3,generators));
    };
};

if !(hasInterface) exitWith {};

["CBA_loadingScreenDone", {
    call FUNC(generatorInteractions);
}] call CBA_fnc_addEventHandler;
