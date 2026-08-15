#include "..\script_component.hpp"
/*
 * AE3 terminal command: prints the calling player's banked WalletMart balance.
 *
 * Arguments:
 * 0: Computer <OBJECT>
 * 1: Options <ARRAY>
 * 2: Command name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_atm, [], "balance"] call misery_devices_fnc_osBalance;
 */

params ["_computer", "_options", "_commandName"];

private _balance = ACE_player getVariable [QEGVAR(currency,bankedFunds), 0];
private _balanceFormatted = [_balance, 1, 2, true] call CBA_fnc_formatNumber;

[_computer, format ["Balance: %1 %2", EGVAR(currency,symbol), _balanceFormatted]] call AE3_armaos_fnc_shell_stdout;
