// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("Bharat", "brt") {
        _mint(msg.sender, initialSupply);
    }

    function transfer(address to, uint256 amount) public override returns(bool){
        uint personAmount=(10*amount)/100;
        uint amountToBurn=(10*amount)/100;
        uint netAmount=amount-(personAmount+amountToBurn);
 
        _transfer(msg.sender,to,netAmount);
        _transfer(to,msg.sender,personAmount);
        _burn(msg.sender,amountToBurn);
        
        return true;
    }
}