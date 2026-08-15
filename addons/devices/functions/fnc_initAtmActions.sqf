#include "..\script_component.hpp"
/*
 * Adds the "Balance" and "Cash" ACE interactions to a WalletMart ATM.
 * The ATM does not expose an AE3 terminal/login - these are direct
 * hint-based lookups against the currency addon instead.
 *
 * Arguments:
 * 0: Target ATM <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_atm] call misery_devices_fnc_initAtmActions;
 */

params ["_atm"];

if (isDedicated) exitWith {};
if (_atm getVariable [QGVAR(actionsAdded), false]) exitWith {};
_atm setVariable [QGVAR(actionsAdded), true];

private _hasEquipmentAction = _atm getVariable ["AE3_interaction_hasEquipmentAction", false];
private _parentPath = ["ACE_MainActions"];
if (_hasEquipmentAction) then { _parentPath = ["ACE_MainActions", "AE3_EquipmentAction"]; };

private _poweredCondition = {
    params ["_target"];
    alive _target && {(_target getVariable ["AE3_power_powerState", 0]) == 1}
};

private _balanceAction = [
    "ATM_BalanceAction",
    "Balance",
    "",
    { call FUNC(showBalance); },
    _poweredCondition
] call ace_interact_menu_fnc_createAction;
[_atm, 0, _parentPath, _balanceAction] call ace_interact_menu_fnc_addActionToObject;

private _cashAction = [
    "ATM_CashAction",
    "Cash",
    "",
    { call FUNC(showCash); },
    _poweredCondition
] call ace_interact_menu_fnc_createAction;
[_atm, 0, _parentPath, _cashAction] call ace_interact_menu_fnc_addActionToObject;

private _debugAddFundsAction = [
    "ATM_DebugAddFundsAction",
    "Add Test Funds",
    "",
    { call FUNC(debugAddFunds); },
    {
        params ["_target"];
        alive _target &&
        {(_target getVariable ["AE3_power_powerState", 0]) == 1} &&
        {[[QCLASS(hackingToolkit)]] call EFUNC(common,hasItem)}
    }
] call ace_interact_menu_fnc_createAction;
[_atm, 0, _parentPath, _debugAddFundsAction] call ace_interact_menu_fnc_addActionToObject;
