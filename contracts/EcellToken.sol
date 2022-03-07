// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract EcellToken is ERC20, Ownable{
    constructor() ERC20("EcellToken", "ECELL"){
        _mint(msg.sender, 10000 * (10**uint256(decimals())));
    }
    function getMoreTokens(uint quantity) public onlyOwner{
        _mint(msg.sender, quantity);
    }   
}