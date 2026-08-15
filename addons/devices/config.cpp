#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            QCLASS(common),
            QCLASS(assets),
            QCLASSAE3(power),
            QCLASSAE3(network),
            QCLASSAE3(filesystem),
            QCLASSAE3(interaction),
            QCLASSAE3(armaos)
        };
        authors[] = {"tsalaroth"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
