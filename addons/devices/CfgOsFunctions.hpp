class CfgOsFunctions {
    class balance {
        path = "/bin/balance";
        description = "Show your WalletMart account balance";
        man = "balance: prints your current banked WalletMart balance.";
        code = QUOTE(call FUNC(osBalance));
    };
    class cash {
        path = "/bin/cash";
        description = "Show your cash on hand";
        man = "cash: prints your current cash on hand.";
        code = QUOTE(call FUNC(osCash));
    };
};
