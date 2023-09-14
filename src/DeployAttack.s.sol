// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {Attack} from "../src/Attack.sol";

contract DeployAttack is Script {
    function run() external returns (Attack) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        Attack attack = new Attack();

        vm.stopBroadcast();

        return (attack);
    }
}
