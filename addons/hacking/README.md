# Hacking

Turns an AE3 laptop into a hacking station. No per-object setup - any laptop
whose classname is in this list gets it automatically:

```sqf
// addons/devices/XEH_preInit.sqf
GVAR(laptops) = [
    "Land_Laptop_03_black_F_AE3",
    "Land_Laptop_03_olive_F_AE3",
    "Land_Laptop_03_sand_F_AE3"
];
```

To make another laptop classname a hacking station, add it to that array.
