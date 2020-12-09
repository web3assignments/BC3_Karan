pragma solidity 0.6.0;
pragma experimental ABIEncoderV2;

//Oude versie nieuwe versie bevat een struct met meer properties van het profiel die bestaat uit meerdere dingen
contract ProfileContract {
    
    //event aanroepen
    event NewProfile(uint profileId, string name, string adres, uint age);

    //Prijs om een profiel te kopen
    uint price = 2;
    //prijs voor het kopen van profielen boven de 1000 stuks
    uint bulkPrice = 1;

    //wordt later aangepast om alleen digits van 0 tot 100 te generate
    uint ageDigits = 16;
    uint ageModulus = 10 ** ageDigits;
    
    bool checkResults;
    //de struct wordt in een later stadia gebruikt!
    struct Person{
        string name;
        string adres;
        uint age;
    }
    
    Person[] public persons;
    
    //simpel mapping voorbeeld die zombies gaf
    mapping (uint => address) public profileToOwner;
    mapping (address => uint) OwnersProfileCount;
    
    //Aanmaken van profiles, geeft volgensmij nog een errror door de bigfunction die wordt gebruikt
    function _createProfile(string memory _name, string memory _adres, uint _age) public {
        uint id = persons.length-1;
        profileToOwner[id] = msg.sender;
        OwnersProfileCount[msg.sender]++;
        emit NewProfile(id, _name, _adres, _age);
        assert(id >= 1); 
        checkResults = true;
    }

    //Generen van random profile age
    function _generateRandomProfileAge(string memory _prf) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_prf)));
        return rand % ageModulus;
    }

    //aanmaken van de random profiles
    function createRandomProfile(string memory _name, string memory _adres) public{
        uint randName = _generateRandomProfileAge(_name);
        _createProfile(_name,_adres,randName);
    }
    
    
    //Terugkrijgen van de profielen
    function GetProfile() public view returns (string memory _name){
       if(checkResults == true){ 
             return _name ; 
         } 
         else{ 
             return "No profile exist"; 
         } 
        //return Profile;
    }
    //bepalen of het aantal personen boven de 100 of onder de 100 voor de juiste prijs
    function priceForProfile() public view returns (uint) {
        if(persons.length < 100)
        {
            return (price);
        }
        
        else{
            return (bulkPrice);
        }
    }
    
}





