const hre = require("hardhat");

async function main() {

  // Get the contract factory
  const TokenContract = await hre.ethers.getContractFactory("TokenContract");

  // Deploy the contract
  const tokenContract = await TokenContract.deploy(
    "Gold CryptoToken", 
    "Gold",
    18,
    ethers.utils.parseEther("100") 
  );

  // Wait for the contract to be mined
  await tokenContract.deployed();

  // Log the deployed contract address
  console.log("TokenContract deployed to:", tokenContract.address);

  // Wait for a certain period before verifying the contract (e.g., 2 minutes)
  console.log("Waiting for 2 minutes before verifying the contract...");
  await new Promise(resolve => setTimeout(resolve, 2 * 60 * 1000));

  // Verify Contract
  await hre.run("verify:verify" , 
                  {address : tokenContract.address,
                    constructorArguments: ["Gold CryptoToken", "Gold", 18, ethers.utils.parseEther("100") ]
                  }
               )
}
                              
// Run the deployment
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
