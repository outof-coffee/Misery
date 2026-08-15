#include "..\script_component.hpp"
/*
 * Author: tsalaroth
 * Laptop hacking interactions
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hacking_fnc_hackActions
 *
*/

private _hackToolkitMenu = [
    QGVAR(hackToolkit_MainMenu),
    localize LSTRING(HackToolkitMenu),
    QPATHTOEF(icons,data\circuit_board_ca.paa),
    {},
    {
        params ["_target", "_player"];
        [[QCLASS(hackingToolkit)]] call EFUNC(common,hasItem)
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _hackAction = [
    QGVAR(hackLaptop),
    localize LSTRING(HackAction),
    "",
    {
        params ["_target", "_player"];

        [_player, _target] call FUNC(hackLaptop);
    },
    {true},
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _checkStatusAction = [
    QGVAR(checkStatus),
    localize LSTRING(CheckStatusAction),
    "",
    {
        params ["_target", "_player"];

        [_target] call FUNC(checkCompromiseStatus);
    },
    {true},
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _hackingKitMenu = [
    QGVAR(hackingKit_MainMenu),
    localize LSTRING(RealToolkitMenu),
    QPATHTOEF(icons,data\circuit_board_ca.paa),
    {},
    {
        params ["_target", "_player"];
        [[QCLASS(hackingKit)]] call EFUNC(common,hasItem)
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _stealDataAction = [
    QGVAR(stealData),
    localize LSTRING(StealDataAction),
    "",
    {
        params ["_target", "_player"];

        [_player, _target] call FUNC(stealData);
    },
    {true},
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _createWalletAction = [
    QGVAR(createWallet),
    localize LSTRING(CreateWalletAction),
    "",
    {
        params ["_target", "_player"];

        [_target] call EFUNC(devices,createWalletmartUser);
    },
    {true},
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

private _listWalletsAction = [
    QGVAR(listWallets),
    localize LSTRING(ListWalletsAction),
    "",
    {
        params ["_target", "_player"];

        [_target] call FUNC(listWallets);
    },
    {true},
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

{
    [_x, 0, [QUOTE(ACE_MainActions)], _hackToolkitMenu] call ACEFUNC(interact_menu,addActionToClass);
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(hackToolkit_MainMenu)], _hackAction] call ACEFUNC(interact_menu,addActionToClass);
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(hackToolkit_MainMenu)], _checkStatusAction] call ACEFUNC(interact_menu,addActionToClass);
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(hackToolkit_MainMenu)], _createWalletAction] call ACEFUNC(interact_menu,addActionToClass);
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(hackToolkit_MainMenu)], _listWalletsAction] call ACEFUNC(interact_menu,addActionToClass);
    [_x, 0, [QUOTE(ACE_MainActions)], _hackingKitMenu] call ACEFUNC(interact_menu,addActionToClass);
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(hackingKit_MainMenu)], _stealDataAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach EGVAR(devices,laptops);
