// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable{
     string[] public myArray;
    constructor() ERC20("DegenToken","DGN"){ myArray = new string[](4);

        myArray[0] = "Item 1";
        myArray[1] = "Item 2";
        myArray[2] = "Item 3";
        myArray[3] = "Item 4";}

    function mint(address recipient, uint256 amount) external onlyOwner{
        _mint(recipient,amount);
    }

    function transfer(address recipient,uint256 amount) public override returns (bool){
        require(amount > 0,"Amount must be greater than zero.");
        _transfer(_msgSender(),recipient,amount);
        return true;
    }

    function redeem(uint256 itemId,uint256 amount) public payable  {
          require(
            bytes(myArray[itemId]).length > 0,
            "Item does not exist"
        );

        require(
            balanceOf(msg.sender) > 0,
            "Insufficient balance"
        );
        _burn(_msgSender(),amount);
    }

    function checkBalance(address account) external view returns (uint256){
        return balanceOf(account);
    }
}
