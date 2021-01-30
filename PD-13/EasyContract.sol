pragma solidity >=0.4.22 <0.8.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "remix_accounts.sol";
import "../EasyContract.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract testSuite {
 EasyContract easy;
 
    /// 'beforeAll' runs before all other tests
    /// More special functions are: 'beforeEach', 'beforeAll', 'afterEach' & 'afterAll'
    function beforeAll() public {
        easy = new EasyContract();
    }

   function startValueNumbers() public returns (bool){
       return Assert.equal(easy.getNumbers(), 10, "Startvalue should be 10");
   }
   
  function testNewValueNumbers110() public returns (bool){
      easy.setNumbers(110);
      return Assert.equal(easy.getNumbers(), 110, "value should be 110");
  }
  function testNewValueNumbers220() public returns (bool){
      easy.setNumbers(220);
      return Assert.equal(easy.getNumbers(), 220, "value should be 220");
  }
  
   function testNewValueNumbers330() public returns (bool){
      easy.setNumbers(330);
      return Assert.equal(easy.getNumbers(), 330, "value should be 330");
  }
  
 
  //this should fail because the number should be random
  function GenRandomNumberShouldFail() public {
      Assert.equal(easy.randModulus(5), 5, "needs to be almost random");
  }
  
}
