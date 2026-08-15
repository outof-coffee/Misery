#include "..\script_component.hpp"
/*
 * Author: tsalaroth
 * Lists the wallet files found in a target laptop's wallet folder
 *
 * Arguments:
 * 0: Target laptop <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call misery_hacking_fnc_listWallets
 */

params ["_target"];

if (isNull _target) exitWith {};

private _walletFolder = [_target] call EFUNC(devices,getWalletFolder);

if (_walletFolder isEqualTo []) exitWith {
    hintSilent format ["%1", localize LSTRING(NoWalletsFound)];
};

private _walletFiles = keys (_walletFolder select 0);

if (_walletFiles isEqualTo []) exitWith {
    hintSilent format ["%1", localize LSTRING(NoWalletsFound)];
};

hintSilent format ["%1:\n%2", localize LSTRING(WalletsFound), (_walletFiles joinString "\n")];
