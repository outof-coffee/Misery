#include "..\script_component.hpp"
/*
 * Adds the "Use Terminal" ACE interaction to a WalletMart ATM. Modeled on
 * AE3_interaction_fnc_initLaptop but without the pickup/lid-animation
 * behavior, since the ATM is a static structure, not a portable laptop.
 * Wallet account seeding is not wired in yet - future work.
 *
 * Arguments:
 * 0: Target ATM <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_atm] call misery_devices_fnc_initAtmTerminal;
 */

params ["_atm"];

if (isServer && {!(_atm getVariable [QGVAR(commandsInstalled), false])}) then {
    _atm setVariable [QGVAR(commandsInstalled), true];
    [_atm, ["balance", "cash"], false, false, []] call AE3_armaos_fnc_computer_initWithCommands;
};

if (isDedicated) exitWith {};
if (_atm getVariable [QGVAR(actionsAdded), false]) exitWith {};
_atm setVariable [QGVAR(actionsAdded), true];

private _hasEquipmentAction = _atm getVariable ["AE3_interaction_hasEquipmentAction", false];
private _parentPath = ["ACE_MainActions"];
if (_hasEquipmentAction) then { _parentPath = ["ACE_MainActions", "AE3_EquipmentAction"]; };

private _useAction = [
    "AE3_UseTerminalAction",
    localize "STR_AE3_ArmaOS_Config_UseDisplayName",
    "",
    {
        params ["_target", "_player"];
        _target setVariable ["AE3_computer_mutex", _player, true];
        [_target] spawn AE3_armaos_fnc_terminal_init;
    },
    {
        params ["_target", "_player"];
        alive _target &&
        {(_target getVariable ["AE3_power_powerState", 0]) == 1} &&
        {[_target] call AE3_armaos_fnc_computer_isFree}
    }
] call ace_interact_menu_fnc_createAction;
[_atm, 0, _parentPath, _useAction] call ace_interact_menu_fnc_addActionToObject;
