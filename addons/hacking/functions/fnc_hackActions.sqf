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

private _hackAction = [
    QGVAR(hackLaptop),
    localize LSTRING(HackAction),
    QPATHTOEF(icons,data\circuit_board_ca.paa),
    {
        params ["_target", "_player"];

        [_player, _target] call FUNC(hackLaptop);
    },
    {
        params ["_target", "_player"];
        if (_target getVariable [QGVAR(compromised), false]) exitWith { false };

        [[QCLASS(hackingToolkit)]] call EFUNC(common,hasItem)
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

{
    [_x, 0, [QUOTE(ACE_MainActions)], _hackAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach EGVAR(common_ae3,laptops);
