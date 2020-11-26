pragma solidity >=0.5.0 <0.6.0;
pragma experimental ABIEncoderV2;

//Oude versie nieuwe versie bevat een struct met meer properties van het profiel die bestaat uit meerdere dingen
contract ProfileContract {
    //Prijs om een profiel te kopen
    uint price = 2;
    //prijs voor het kopen van profielen boven de 1000 stuks
    uint bulkPrice = 1;

    //profiel de een persoon op de site kan aanmaken
    string public Profile;

    //de struct wordt in een later stadia gebruikt!
    struct Person{
        string name;
        string adres;
        uint leeftijd;
    }
    
    //BestaandeProfielen die ingezien kunnen worden later door admins
    function BestaandeProfielen(string memory gemaakteProfielen) public {
        Profile = gemaakteProfielen;
    }

    //aanmaken van het profiel
    function SetProfile(string memory newProfiel) public {
    
        Profile = newProfiel;
    }

    //Terugkrijgen van de profielen
    function GetProfile() public view returns (string memory){
       
        return Profile;
    }

}