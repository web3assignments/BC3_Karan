pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/// @author Karan Banker
contract karantoken is ERC20 {
    
    constructor() public ERC20("BankerTokenx", "BTX") {
        _mint(msg.sender, 10000 * (10 ** uint256(decimals())));
    }
}