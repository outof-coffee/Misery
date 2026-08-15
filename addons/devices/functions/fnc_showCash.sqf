#include "..\script_component.hpp"
/*
 * Shows the calling player's cash on hand via hint.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call misery_devices_fnc_showCash;
 */

private _cash = ACE_player getVariable [QEGVAR(currency,funds), 0];
private _cashFormatted = [_cash, 1, 2, true] call CBA_fnc_formatNumber;

hint format ["Cash: %1 %2", EGVAR(currency,symbol), _cashFormatted];
