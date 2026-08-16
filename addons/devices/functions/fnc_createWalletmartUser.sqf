#include "..\script_component.hpp"
/*
 * Author: tsalaroth
 * Creates a "walletmart" user account on a target laptop, with a placeholder wallet file
 *
 * Arguments:
 * 0: Target laptop <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call misery_devices_fnc_createWalletmartUser
 */

params ["_target"];

if (!isServer) exitWith {};

if (isNull _target) exitWith {};

[_target, "walletmart", "walletmart123"] call AE3_armaos_fnc_computer_addUser;

private _filesystem = _target getVariable ["AE3_filesystem", []];

try {
    [[], _filesystem, "/home/walletmart/wallet", "walletmart", "walletmart"] call AE3_filesystem_fnc_createDir;
} catch {};

try {
    [[], _filesystem, "/home/walletmart/wallet/ref_0x0.txt", "0", "walletmart", "walletmart"] call AE3_filesystem_fnc_createFile;
} catch {};

_target setVariable ["AE3_filesystem", _filesystem, true];
