#include "..\script_component.hpp"
/*
 * Adds the "Banking" ACE interaction to a WalletMart ATM. The ATM does not
 * expose an AE3 terminal/login - this opens the shared currency bank dialog
 * instead, which already shows both cash and banked balances.
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

private _bankingAction = [
    "ATM_BankingAction",
    "Banking",
    "",
    { createDialog QCLASS(banking_ui); },
    _poweredCondition
] call ace_interact_menu_fnc_createAction;
[_atm, 0, _parentPath, _bankingAction] call ace_interact_menu_fnc_addActionToObject;

private _debugAddFundsAction = [
    "ATM_DebugAddFundsAction",
    "Add Test Funds",
    "",
    { call FUNC(debugAddFunds); },
    {
        params ["_target"];
        alive _target &&
        {(_target getVariable ["AE3_power_powerState", 0]) == 1} &&
        {[[QCLASS(hackingDebugTool)]] call EFUNC(common,hasItem)}
    }
] call ace_interact_menu_fnc_createAction;
[_atm, 0, _parentPath, _debugAddFundsAction] call ace_interact_menu_fnc_addActionToObject;
