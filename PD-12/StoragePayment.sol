pragma solidity ^0.6.0;

/// @title StoragePayments for ethereum to store in contract
/// @author Karan k
/// @notice dont use this contract for real use it only implements the basics to show some working function for the assignment
/// @dev All functions work in remix javascript vm only tested here
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/access/Ownable.sol";

contract StoragePayment is Ownable {

/// @author Karan K
/// @notice deposit ethereum in the smart contract for only the owner and can request the balance of the smart contract, also features a kill function to kill all in the contract
/// @dev workin
/// @param sender sender of the value that is gonna be in the contract
/// @param amount value of the what is stroed
/// @return balance

event Deposit(address sender, uint amount, uint balance);
//@notice function has not yet been made for Withdraw
event Withdraw(uint amount, uint balance);
event Transfer(address to, uint amount, uint balance);

 constructor() public Ownable() {
  
 }
 
 function deposit() public payable onlyOwner{
     emit Deposit(msg.sender, msg.value, address(this).balance);
 }
 
 
 function getBalance() public view returns (uint){
     return address(this).balance;
 }
 //
 function transfer(address payable _to, uint _amount) public onlyOwner{
     _to.transfer(_amount);
 }
}