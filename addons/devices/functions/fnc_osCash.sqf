#include "..\script_component.hpp"
/*
 * AE3 terminal command: prints the calling player's cash on hand.
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
 * [_atm, [], "cash"] call misery_devices_fnc_osCash;
 */

params ["_computer", "_options", "_commandName"];

private _cash = ACE_player getVariable [QEGVAR(currency,funds), 0];
private _cashFormatted = [_cash, 1, 2, true] call CBA_fnc_formatNumber;

[_computer, format ["Cash: %1 %2", EGVAR(currency,symbol), _cashFormatted]] call AE3_armaos_fnc_shell_stdout;
