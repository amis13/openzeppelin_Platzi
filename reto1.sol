// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract reto is AccessControl {


    bytes32 rolAdmin = keccak256("ROL_ADMIN");
    bytes32 rolWriter = keccak256("ROL_WRITER");

    constructor(){
        _grantRole(rolAdmin, msg.sender );
    }

    uint256 number;

    function store(uint256 num) public {
        require( hasRole(rolWriter, msg.sender), "Esta funcion solo puede ser utilizada por el WRITER" );
        number = num;
    }

    function retrieve() public view returns (uint256){
        return number;
    }

    modifier onlyWriter(){
         require( hasRole( rolWriter, msg.sender ), "Esta funcion solo puede ser utilizada por el WRITER" );

         _;
     }

    modifier onlyAdmin(){
         require( hasRole( rolAdmin, msg.sender ), "Esta funcion solo puede ser utilizada por el ADMIN" );

         _;
     }


    function agregarWriter(address account ) public onlyAdmin() {
        _grantRole(rolWriter, account );
    }
    
    function quitarRol(address account ) public onlyAdmin() {
        _revokeRole( rolWriter, account );
    }


}
