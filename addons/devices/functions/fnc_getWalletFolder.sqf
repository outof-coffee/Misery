#include "..\script_component.hpp"
/*
 * Author: tsalaroth
 * Resolves the raw wallet folder object from a target laptop's filesystem, bypassing permission checks
 *
 * Arguments:
 * 0: Target laptop <OBJECT>
 *
 * Return Value:
 * Wallet folder object [content, owner, permissions] <ARRAY>, or [] if not found
 *
 * Example:
 * [cursorObject] call misery_devices_fnc_getWalletFolder
 */

params ["_target"];

if (isNull _target) exitWith {[]};

private _filesystem = _target getVariable ["AE3_filesystem", []];

if (_filesystem isEqualTo []) exitWith {[]};

private _walletFolder = [];

try {
    _walletFolder = [["home", "walletmart", "wallet"], _filesystem] call AE3_filesystem_fnc_resolvePntr;
} catch {};

_walletFolder
