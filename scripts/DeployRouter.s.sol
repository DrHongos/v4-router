// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import {IPoolManager} from "v4-core/src/interfaces/IPoolManager.sol";
import {OpinologosRouter} from "../src/UniswapV4Router04.sol";                          // my router
import "permit2/src/interfaces/IPermit2.sol";

contract DeployRouter is Script {
    IPoolManager constant POOLMANAGER = IPoolManager(address(
        0x00B036B58a818B1BC34d502D3fE730Db729e62AC    // sepolia pool manager (https://docs.unichain.org/docs/technical-information/contract-addresses)
    ));
    ISignatureTransfer permit2 = ISignatureTransfer(address(0x000000000022D473030F116dDEE9F6B43aC78BA3));
  
    function setUp() public {}

    function run() public {
        // Start broadcasting all transactions to the chain
        vm.startBroadcast();

    //constructor(IPoolManager manager, ISignatureTransfer _permit2)
        OpinologosRouter router = new OpinologosRouter(POOLMANAGER, permit2); 

        vm.stopBroadcast(); // Optional, to stop broadcasting
    }

}
