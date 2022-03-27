// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken20 is ERC20 {
    constructor() ERC20("MyERC20Token", "MET") {
        // _mint(msg.sender, 1000 * 10 ** 18);
    }

    function mint(address _account, uint256 _amount) public {
        _mint(_account, _amount);
    }
}