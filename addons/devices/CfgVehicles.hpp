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
            turnOffAction = "call AE3_armaos_fnc_computer_turnOff;";
            standByAction = "call AE3_armaos_fnc_computer_standby;";

            class AE3_PowerInterface {
                internal = 0;
            };

            class AE3_Consumer {
                powerConsumption = 0.03/3600;
            };
        };
    };
};
