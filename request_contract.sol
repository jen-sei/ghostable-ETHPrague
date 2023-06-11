//SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "@api3/airnode-protocol/contracts/rrp/requesters/RrpRequesterV0.sol";



contract Requester is RrpRequesterV0 {
    mapping(bytes32 => bool) public incomingFulfillments;
    mapping(bytes32 => int256) public fulfilledData;

    constructor(address _rrpAddress) RrpRequesterV0(_rrpAddress) {}

// The main makeRequest function that will trigger the Airnode request.

    function makeRequest(
        address airnode,
        bytes32 endpointId,
        address sponsor,
        address sponsorWallet,
        bytes calldata parameters
        
    ) external {
        bytes32 requestId = airnodeRrp.makeFullRequest(
            airnode,
            endpointId,
            sponsor,
            sponsorWallet,
            address(this),
            this.fulfill.selector,
            parameters
        );
        incomingFulfillments[requestId] = true;
    }

    function fulfill(bytes32 requestId, bytes calldata data)
        external
        onlyAirnodeRrp
    {
        require(incomingFulfillments[requestId], "No such request made");
        delete incomingFulfillments[requestId];
        int256 decodedData = abi.decode(data, (int256));
        fulfilledData[requestId] = decodedData;
    }
}



interface OracleInterface {
    function getData() external view returns (uint256);
}

contract MyContract {
    uint256 public oracleData;
    address public oracleAddress;
    OracleInterface public oracle;

    constructor(address _oracleAddress) {
        oracleAddress = 0x2ab9f26E18B64848cd349582ca3B55c2d06f507d;
        oracle = OracleInterface(_oracleAddress);
    }

    function readOracleData() public {
        oracleData = oracle.getData();
    }
}


// Export data

contract DataExporter {
    OracleInterface public oracle;
    
    event DataExported(uint256 data);

    constructor(address _oracleAddress) {
        oracle = OracleInterface(_oracleAddress);
    }

    function exportData() public {
        uint256 data = oracle.getData();
        emit DataExported(data);
    }
}