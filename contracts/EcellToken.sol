// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract EcellToken is ERC20, Ownable{
    // uint256 private tokenSupply = 0;
    constructor() ERC20("EcellToken", "ECELL"){
        _mint(msg.sender, 10000*10**uint256(decimals()));
        // tokenSupply+=10000*10**uint256(decimals);
        // return tokenSupply();
    }
    function getMoreTokens(uint quantity) public onlyOwner{
        _mint(msg.sender, quantity*10**uint256(decimals()));
        // tokenSupply+=quantity;
        // return tokenSupply();
    }

    // function transferToken(address _to, uint _value) public returns (bool success){
    //     require(_to != address(0));
    //     require(_value <= balanceOf(msg.sender));
    //     require(msg.sender != _to);
    //     _transfer(msg.sender, _to, _value);
    //     return true;
    // }

    // function getSupply() public view returns(uint256){
    //     return _tokenSupply;
    // }
}