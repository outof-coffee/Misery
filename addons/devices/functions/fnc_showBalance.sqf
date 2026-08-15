#include "..\script_component.hpp"
/*
 * Shows the calling player's banked WalletMart balance via hint.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call misery_devices_fnc_showBalance;
 */

private _balance = ACE_player getVariable [QEGVAR(currency,bankedFunds), 0];
private _balanceFormatted = [_balance, 1, 2, true] call CBA_fnc_formatNumber;

hint format ["Balance: %1 %2", EGVAR(currency,symbol), _balanceFormatted];
