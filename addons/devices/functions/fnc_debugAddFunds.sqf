#include "..\script_component.hpp"
/*
 * Debug action: adds 100 to the calling player's banked WalletMart balance.
 * Only reachable by players carrying the Hacking Debug Tool.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call misery_devices_fnc_debugAddFunds;
 */

[100, true] call EFUNC(currency,modifyMoney);

hint "Debug: added 100 to banked balance.";
