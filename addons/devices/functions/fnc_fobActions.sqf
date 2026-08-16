#include "..\script_component.hpp"
/*
 * Author: tsalaroth
 * WalletMart Fob interactions
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_devices_fnc_fobActions
 *
*/

private _giveFobMoneyAction = [
    QGVAR(giveFobMoney),
    localize LSTRING(GiveFobMoneyAction),
    QPATHTOEF(icons,data\circuit_board_ca.paa),
    {
        params ["_target", "_player"];

        [_player, _target] call FUNC(giveFobMoney);
    },
    {
        params ["_target", "_player"];

        private _targetItems = [[_target, true, true, true, true, true, true] call CBA_fnc_uniqueUnitItems] call EFUNC(common,lowerCaseArray);

        ([[QCLASS(walletFob)]] call EFUNC(common,hasItem)) && {(toLowerANSI QCLASS(walletFob)) in _targetItems}
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

[QUOTE(CAManBase), 0, [], _giveFobMoneyAction] call ACEFUNC(interact_menu,addActionToClass);
