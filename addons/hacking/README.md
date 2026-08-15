# Hacking

Adds ACE interactions for compromising AE3 laptops and moving data/funds around via two carried items and a WalletMart fob. There is no step to "turn a laptop into a hacking station" — every AE3 laptop `devices` tracks (`Land_Laptop_03_black_F_AE3`, `Land_Laptop_03_olive_F_AE3`, `Land_Laptop_03_sand_F_AE3`) already supports every interaction below as soon as it's placed in Eden. The only thing a mission maker controls is who has access to which item; there's no CBA setting or config entry to enable the actions themselves.

## Items (defined in `assets`)

- **Hacking Debug Tool** (`hackingToolkit`) — unlocks the "Debug Tools" submenu on any laptop. For testing, not intended for real play.
- **Hacking Toolkit** (`hackingKit`) — unlocks the real "Hacking Toolkit" submenu.
- **WalletMart Fob** (`walletFob`) — required by both parties for "Give Fob Money."

Give these to a unit the same way as any other Misery item: Eden loadout, Arsenal, or a script.

## Debug Tools menu (requires Hacking Debug Tool)

- **Debug Hack** — marks the target laptop `compromised`. Always available, even if already compromised.
- **Check Status** — hints whether the target laptop is currently marked `compromised`.
- **Create Wallet** — creates a `walletmart` user account on the target laptop (via AE3's `AE3_armaos_fnc_computer_addUser`) and seeds `/home/walletmart/wallet/ref_0x0.txt` with a placeholder balance.
- **List Wallets** — lists the files in the target laptop's `/home/walletmart/wallet` folder by reading the raw `AE3_filesystem` structure directly, bypassing AE3's own permission-checked listing functions.

## Hacking Toolkit menu (requires Hacking Toolkit)

- **Steal Data** — copies the target laptop's `AE3_filesystem` onto the acting player (a transient, player-local variable) and marks the laptop `compromised`.

## Give Fob Money (requires WalletMart Fob, both parties)

A target-unit ACE action available on other players. Transfers the acting player's entire carried fob balance to the target's balance. The action doesn't appear unless both units are carrying a WalletMart Fob.

## Persistence

Two GRAD persistence toggles, both off by default, under **Misery Persistence** in the CBA settings menu:

- **Save AE3 storage (Hacking)** — persists each tracked laptop's `AE3_filesystem` across a GRAD save/restore.
- **Save compromise state (Hacking)** — persists which laptops are marked `compromised`.

## Not yet built

- Nothing connects stolen data or fob balances to Misery's `currency` addon — funds moved via these actions are separate from real player currency.
- No mechanism reads back data captured by "Steal Data" once it's on the player.
