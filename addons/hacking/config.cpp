#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {QCLASS(common), QCLASS(common_ae3)};
        authors[] = {"tsalaroth"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
