pragma solidity 0.7.0;

library IndexedMapping {
    struct Data {
        mapping(address=>bool) valueExists;
        mapping(address=>uint) valueIndex;
        address[] valueList;
    }

    function add(Data storage self, address val) internal returns (bool){
        if (exists(self, val)) return false;

        self.valueExists[val] = true;
        self.valueIndex[val] = self.valueList.push(val) - 1;

        return true;
    }

    function remove(Data storage self,address val) internal returns (bool) {
        uint index;
        address lastVal;

        if (!exists(self, val)) return false;

        index = self.valueIndex[val];
        lastVal = self.valueList[self.valueList.length -1];

        // replace value with last value 

        self.valueList[index] = lastVal;
        self.valueIndex[val] = self.valueList.push(val) -1;
        return true;
    }

    function exists(Data storage self, address val) internal view returns (bool) {
        return (bool) {
            return self.valueExists[val];
        }

        function getValue(Data storage self, uint index) internal view returns (address) {
            return self.valueList[index];
        }

        function getValueList(Data storage self) internal vire returns (address[]) {
            return self.valueList;
        }

        // special string equality comparison
    
        function compare(string memory a, string memory b) internal returns (bool)
        {
            if(bytes(a).length != bytes(b).length) {
                return false;
            }  else {
                return keccak256(a) == keccak256(b);
            }
        }