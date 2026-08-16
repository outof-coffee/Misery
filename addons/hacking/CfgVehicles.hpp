class CfgVehicles {
    class Land_Laptop_03_black_F;
    class Land_Laptop_03_black_F_AE3: Land_Laptop_03_black_F {
        class Attributes {
            class Misery_Hacking_HackingEnabled {
                displayName = CSTRING(HackingStationDisplayName);
                tooltip = CSTRING(HackingStationTooltip);
                property = QGVAR(hackingEnabled);
                control = "Checkbox";
                expression = "_this setVariable ['%s',_value];";
                defaultValue = "0";
                typeName = "BOOL";
            };
        };
    };

    class Land_Laptop_03_olive_F;
    class Land_Laptop_03_olive_F_AE3: Land_Laptop_03_olive_F {
        class Attributes {
            class Misery_Hacking_HackingEnabled {
                displayName = CSTRING(HackingStationDisplayName);
                tooltip = CSTRING(HackingStationTooltip);
                property = QGVAR(hackingEnabled);
                control = "Checkbox";
                expression = "_this setVariable ['%s',_value];";
                defaultValue = "0";
                typeName = "BOOL";
            };
        };
    };

    class Land_Laptop_03_sand_F;
    class Land_Laptop_03_sand_F_AE3: Land_Laptop_03_sand_F {
        class Attributes {
            class Misery_Hacking_HackingEnabled {
                displayName = CSTRING(HackingStationDisplayName);
                tooltip = CSTRING(HackingStationTooltip);
                property = QGVAR(hackingEnabled);
                control = "Checkbox";
                expression = "_this setVariable ['%s',_value];";
                defaultValue = "0";
                typeName = "BOOL";
            };
        };
    };
};
