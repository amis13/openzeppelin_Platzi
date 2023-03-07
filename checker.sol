// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165Checker.sol";

contract checker {

      using ERC165Checker for address;
      
      modifier onlyERC20(address _direccion) {
            require(_direccion.supportsInterface(type(IERC20).interfaceId),"La Direccion no es compatible, no es un token ERC20");
            _;
      }
      modifier onlyERC721 (address _direccion){
            require(_direccion.supportsInterface(type(IERC721).interfaceId),"La Direccion no es compatible, no es un token ERC721");
            _;
      }

      function verificarERC20(address _direccion) onlyERC20(_direccion) public view returns(string memory) {
            return "La Direccion es compatible, es un token ERC20";
      }

      function verificarERC721(address _direccion) onlyERC721(_direccion) public view returns(string memory) {
           return "La Direccion es compatible, es un token ERC721";
      } 
}
