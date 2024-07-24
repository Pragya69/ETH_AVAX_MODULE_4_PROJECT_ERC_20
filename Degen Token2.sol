pragma solidity ^0.8.23;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    
    mapping(address => uint256) public swordsOwned;
    mapping(string => uint256) public itemRedemptionRates;
    mapping(address => mapping(string => uint256)) public itemsOwned;

    constructor() ERC20("Degen", "DGN") {
        _mint(msg.sender, 10 * (10 ** uint256(decimals())));
    }

    function setItemRedemptionRate(string memory itemName, uint256 rate) public onlyOwner {
        itemRedemptionRates[itemName] = rate;
    }

    function redeemItem(string memory itemName, uint256 quantity) public {
        uint256 cost = itemRedemptionRates[itemName] * quantity;
        require(balanceOf(msg.sender) >= cost, "Not enough tokens to redeem for the item");

        itemsOwned[msg.sender][itemName] += quantity;
        _burn(msg.sender, cost);
    }

    function checkItemsOwned(address user, string memory itemName) public view returns (uint256) {
        return itemsOwned[user][itemName];
    }

    function mintTokens(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function checkBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    function burnTokens(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Not enough tokens to burn");
        _burn(msg.sender, amount);
    }

    function transferTokens(address to, uint256 amount) public {
        require(to != address(0), "Invalid address");
        require(balanceOf(msg.sender) >= amount, "Not enough tokens to transfer");
        _transfer(msg.sender, to, amount);
    }
}
