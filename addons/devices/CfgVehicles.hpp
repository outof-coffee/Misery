class CfgVehicles {
    class House_F;

    class CLASS(hackStation): House_F {
        armor = 3;
        displayName = CSTRING(HackStation_DisplayName);
        scope = 2;
        scopeCurator = 2;
        numberOfDoors = 0;
        placement = "vertical";
        destrType = "DestructNo";
        cost = 0;
        vehicleClass = QCLASS(Objects);
        mapSize = 2;
        model = QPATHTOEF(assets,data\models\medievalanvil.p3d);
        textSingular = "Hacking Station";
    };
};
