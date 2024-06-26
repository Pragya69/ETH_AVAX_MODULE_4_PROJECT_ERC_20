# ETH_AVAX_MODULE_4_PROJECT_ERC_20

# Degen Gaming ERC20 Token
# Introduction

This is a smart contract for the Degen Gaming ERC20 token deployed on the Avalanche network. The contract provides functionality for minting new tokens, transferring tokens, redeeming tokens for in-game items, checking token balances, and burning tokens.


## Contract Details

- Token Name: Degen Token
- Token Symbol: DEGEN
-   Decimals: 18
- Total Supply: 0 (initially)

## Functions

`1) Minting new tokens`

The owner of the contract can mint new tokens by calling the `mint` function, specifying the recipient's address and the desired token amount.

 `2)Transferring tokens`

Players can transfer their tokens to others by calling the `transfer` function, specifying the recipient's address and the token amount to be transferred.

`3) Redeeming tokens`

Players can redeem their tokens for in-game items in the in-game store by calling the `redeem` function and specifying the token amount to be redeemed. Additional logic for item redemption should be implemented in the contract.

`4)Checking token balance`

Players can check their token balance at any time by calling the `balanceOf` function and providing their account address.

`5) Burning tokens`

Anyone can burn their own tokens by calling the `burn` function and specifying the amount of tokens to be burned.

## Deployment

The contract has been deployed on the Avalanche network for Degen Gaming.
<pre>
For the deployment on your own pc follow the steps: 
1)First write the contract on the remix.
2)Add a network account on Metamask.
3)Make sure that the required avax is present in your account.
4)When the metamask has enough avax then select the environment as "Injected Provider" in remix.
5)So finally at the last step deploy it.
6)To verify copy the address of deployment and paste it into "Snowtrace Fauji Testnet".
</pre>

## Interacting with the Contract using Remix

After deploying the DEGEN token contract to the Avalanche Fuji Test Network, you can interact with the contract using Remix. Here are the steps to get started:

1. Open the [Remix](https://remix.ethereum.org/) online IDE in your browser.

2. In the "File Explorer" section, locate the `DegenToken.sol` file and open it.

3. In the "Deployed Contracts" section, click on the contract named `DegenToken`.

4. In the "At Address" input field, enter the contract address obtained during deployment.

5. Click the "At Address" button to load the contract instance.

6. You can now interact with the DEGEN token contract through the provided functions.

   - Use the `balanceOf` function to check the token balance of a specific address.
   - Use the `transfer` function to send DEGEN tokens from your address to another address.
   - Use the `approve` function to allow another address to spend a specific amount of DEGEN tokens on your behalf.
   - Use the `transferFrom` function to transfer DEGEN tokens on behalf of another address.
   - Use the `mint` function (accessible only to the contract owner) to mint new DE

GEN tokens.
   - Use the `burn` function to burn a specific amount of your DEGEN tokens.

7. Set the required parameters for each function and click the corresponding button to execute the transaction.

8. Confirm the transaction details and sign the transaction in MetaMask.

9. Wait for the transaction to be confirmed on the Avalanche network.

10. You can view the transaction status and emitted events in the Remix console.

## Authors

PRAGYA
https://www.linkedin.com/in/pragya-299103231/
21BCS9346@cuchd.in

## License

The Degen Gaming Token contract is licensed under the MIT License. See the [`LICENSE`](LICENSE) file for more information.

