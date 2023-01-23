// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.10;

/// 1. Deploy ForceSend and ForceSendReceiver
/// 2. Call `ForceSend.selfDestructAndSend` with the ForceSendReceiver
///    address as the `recipient` argument, and pass some non-zero ETH
///    value in the transaction (so that msg.value > 0)
/// 3. Call `ForceSendReceiver.getBalance` and see how its balance increased.

contract ForceSend {

    /// @notice receives some ETH and immediately self destructs,
    /// force-sending the ETH to the recipient
    function selfDestructAndSend(address recipient) external payable {
        selfdestruct(payable(address(recipient)));
    }
}

contract ForceSendReceiver {
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
