require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("dotenv").config();

const polygonURL = process.env.Polygon_Url ; 
const privateKey = process.env.Private_Key ;
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY;

module.exports = {
  solidity: "0.8.19",
  networks: {
    polygon: {
      url: polygonURL ,
      accounts: [privateKey],
    },
  },
  etherscan: {
    apiKey: ETHERSCAN_API_KEY,
  },
};
