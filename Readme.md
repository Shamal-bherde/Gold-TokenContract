## Documentation

## Deployment of TokenContract.sol on REMIX-IDE

    1) Select the TokenContract in the "Solidity Compiler" tab.
    2) Choose the desired compiler version (e.g., 0.8.19) and compile the contract.
    3) Go to the "Deploy & Run Transactions" tab use Injected Metamask and connect to the Polygon Mumbai TestNet.
    4) Select the TokenContract in the contract dropdown.
    5) Enter the constructor parameters: tokenName, tokenSymbol, tokenDecimals, and initialSupply.
    6) Click the "Deploy" button to deploy the TokenContract.
    7) Call TotalSupply, decimals, name, symbol.
    8) Transact the Transfer Function pass Recipient address and the amount of tokens you want to transfer from Deployer of the contract.
    9) Approve the spender address with amount of tokens using the spender itself so that he can spend particular amount of tokens on allowance.
    10) Transact the transferFrom function from the approved spender address to the recipient address along with the number of tokens using the spender address. 

## Deployment and Verification Steps using Hardhat 

    1) Create a folder Solidity under TokenContract 
    2) Do npm
    3) Install Packages by using - npm install  
    4) check the version of installed hardhat by using - npx hardhat --version
    5) Compile the TokenContract.sol file by using - npx hardhat compile
    6) To run the Scripts use npx hardhat run --network polygon scripts/deploy.js

    7) The contract is verified using the Etherscan API KEY from the REMIX Compiler you can check the details here 

        https://mumbai.polygonscan.com/address/0x1fA7e0D457A4414A8b2f50Ea9bCDEBA79aD2440D
        
    8) Go to the PolygonScan in the Read Contract details we can retrieved the details of all functions like 

        name, decimals, symbol, totalSupply, balanceOF

    9) In the write Contract 

        1) Call Transfer function pass recipient Address and amount of tokens to transfer 

            Recipient address = 0x44fd2B1FE5B35E337F261CF97Ad1DD67928A2622
            amount = 100000000000000000000

            From = 0x5c1a24353e4019250e0898541ffea5a6030c07d1 

            Link for transactionHash- 
            https://mumbai.polygonscan.com/tx/0x0cfb35bf70c54d0621aeae51a500126235653cc74a89d33cabdcecc59aea2a22

        2) Call Approve Function 
         
            Spender Address = 0x44fd2B1FE5B35E337F261CF97Ad1DD67928A2622
            amount = 100000000000000000000

            call using Spender Address

            Link for TransactionHash - 
            https://mumbai.polygonscan.com/tx/0x9a2a52163ed2daf284e06a8b10881b34d98fc752028fbbc68b88e4e3702d6762

        3) Call TransferFrom Function 

            Spender Address = 0x44fd2B1FE5B35E337F261CF97Ad1DD67928A2622
            Receiver Address = 0x2Bf2699C4cC1ae4F1d0456B1eD1d20b6f05Ed70F
            Amount = 10000000000000000000

            Call using Spender Address 

            Link for TransactionHash - 
            https://mumbai.polygonscan.com/tx/0xcfa04c3679423c5aa2410700e74da82dcaf8efe538858965b5eb283549467f68