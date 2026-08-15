class CfgVehicles {
    class Land_atm_01_F;
    class CLASS(walletMartAtm): Land_atm_01_F {
        class AE3_Equipment {
            displayName = ECSTRING(assets,WalletMartAtm_DisplayName);
            init = QUOTE(call FUNC(initAtmActions));
        };

        class AE3_Device {
            displayName = ECSTRING(assets,WalletMartAtm_DisplayName);
            defaultPowerLevel = 0;

            init = "(_this + [configFile >> 'AE3_FilesystemObjects']) call AE3_armaos_fnc_device_initComplete;";

            turnOnAction = "call AE3_network_fnc_dhcp_onTurnOn; call AE3_armaos_fnc_computer_turnOn;";
            turnOnActionCondition = "[_this] call AE3_armaos_fnc_computer_isFree";
            turnOffAction = "call AE3_armaos_fnc_computer_turnOff;";
            turnOffActionCondition = "[_this] call AE3_armaos_fnc_computer_isFree";
            standByAction = "call AE3_armaos_fnc_computer_standby;";
            standByActionCondition = "[_this] call AE3_armaos_fnc_computer_isFree";

            class AE3_PowerInterface {
                internal = 0;
            };

            class AE3_Consumer {
                powerConsumption = 0.03/3600;
            };
        };

        class AE3_InternalDevice {
            displayName = ECSTRING(assets,WalletMartAtm_DisplayName);
            defaultPowerLevel = 1;

            turnOnAction = "_this + [true] call AE3_power_fnc_turnOnBatteryAction";
            turnOffAction = "";

            class AE3_PowerInterface {
                internal = 1;
            };

            class AE3_Battery {
                capacity = 0.1;
                recharging = 0.05/3600;
                level = 0.1;
                internal = 1;
            };
        };
    };
};
