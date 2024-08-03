// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    event ItemRedeemed(address indexed user, uint256 amount, string item);

    // Mapping to keep track of available items and their corresponding token cost
    mapping(string => uint256) public items;

    constructor() ERC20("DegenToken", "DGN") {
        // Example items with their token cost
        items["Sword"] = 100;
        items["Shield"] = 150;
        items["Potion"] = 50;
    }

    function mint(address recipient, uint256 amount) external onlyOwner {
        _mint(recipient, amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(amount > 0, "Amount must be greater than zero.");
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function redeem(uint256 amount, string calldata item) external {
        require(amount > 0, "Amount must be greater than zero.");
        require(items[item] > 0, "Item does not exist.");
        require(amount >= items[item], "Insufficient tokens to redeem this item.");

        _burn(_msgSender(), amount);
        // Logic to deliver the item to the player goes here

        emit ItemRedeemed(_msgSender(), amount, item);
    }

    function checkBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }

    // Function to add new items to the store
    function addItem(string calldata itemName, uint256 tokenCost) external onlyOwner {
        items[itemName] = tokenCost;
    }

    // Function to remove items from the store
    function removeItem(string calldata itemName) external onlyOwner {
        delete items[itemName];
    }
}
