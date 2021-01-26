if (window.ethereum) {
  window.web3 = new Web3(ethereum);
  try {
      // ask user for permission
      await ethereum.enable();
      // user approved permission
  } catch (error) {
      // user rejected permission
      console.log('user rejected permission');
  }
}
  else if (window.web3) {
    window.web3 = new Web3(window.web3.currentProvider)
  }
  else {
    window.alert('Geen metamask gedetecteerd')
  }
  console.log (window.web3.currentProvider)
  
  
  // Contract adress van de deployment op Rinkeby en de ABI
  var contractAddress = '0x1EB3369778844bB246AE47b3f498a3be747EAA7E';
  var abi = JSON.parse( '[{"constant":true,"inputs":[],"name":"getInfo","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_info","type":"string"}],"name":"setInfo","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"}]' );
  
  //contract instance
  contract = new web3.eth.Contract(abi, contractAddress);
  
  // Accounts
  var account;
  
  web3.eth.getAccounts(function(err, accounts) {
    if (err != null) {
      alert("Error retrieving accounts.");
      return;
    }
    if (accounts.length == 0) {
      alert("No account found! Make sure the Ethereum client is configured properly.");
      return;
    }
    account = accounts[0];
    console.log('Account: ' + account);
    web3.eth.defaultAccount = account;
  });
  
  //Versturen van berichten
  function registerSetInfo() {
    info = $("#newInfo").val();
    contract.methods.setInfo (info).send( {from: account}).then( function(tx) { 
      console.log("Transaction: ", tx); 
    });
    $("#newInfo").val('');
  }
  
  //Ophalen van berichten
  function registerGetInfo() {
    contract.methods.getInfo().call().then( function( info ) { 
      console.log("info: ", info);
      document.getElementById('lastInfo').innerHTML = info;
    });    
  }