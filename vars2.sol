pragma solidity 0.7.0;

contract Enums {
enum status {created, approvaed, provisioned, rejected, delated}

status myStatus = status.provisioned;

    function returnEnum() internal returns (status)
    {
        status stat = status.created;
        return stat;
    }

    function returnEnumInt() internal returns (uint)
    {
        status stat = status.approvaed;
        return uint(stat);
    }

    function passByValue() internal returns (uint)
    {
        status stat = myStatus;
        myStatus = status.rejected;

        return uint(myStatus);
    }
    function assignInterger() private returns (uint)
    {
        status stat = myStatus;

        myStatus = status(2);
        return uint(myStatus);
    }

}

contract GeneralMapping {

    mapping (uint => address) Names;

    uint counter;

    function addtoMapping(address addressDetails) internal returns (uint)
    {
        counter = counter + 1;
        Names[counter] = addressDetails;

        return counter;
    }

    function getMappingMember(uint id) internal returns (address)
    {
        return Names[id];
    }
}

contract MappingLooping {
    
    mapping (uint => address) Names;

    uint counter;

    function addtoMapping(address addressDetails) internal returns (uint)
    {
        counter = counter + 1;

        Names[counter] = addressDetails;

        return counter;

    }

    function getMappingMember(uint id) private returns (address[])
    {
        address[] memory localBytes = new address[](counter);
        for(uint i=1; i<= counter; i++){
            localBytes[i - 1] = Names[i];
        }

        return localBytes;
    }
}