#include "..\script_component.hpp"
/*
 * Author: tsalaroth
 * Hacking Station interactions
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hacking_fnc_stationActions
 *
*/

private _storeDataAction = [
    QGVAR(storeData),
    localize LSTRING(StoreDataAction),
    QPATHTOEF(icons,data\circuit_board_ca.paa),
    {
        params ["_target", "_player"];

        [_player, _target] call FUNC(dumpData);
    },
    {
        params ["_target", "_player"];
        [[QCLASS(hackingKit)]] call EFUNC(common,hasItem)
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

[QCLASS(hackStation), 0, [], _storeDataAction] call ACEFUNC(interact_menu,addActionToClass);
