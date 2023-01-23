const { getContractAddress } = require("@ethersproject/address");

// Call as:
// node computeDeploymentAddress.js --address 0xf70ea3180a62B6EfC92324c8B9c64b32d6d64fb8 --nonce 10
const address = process.argv[3];
const nonce = process.argv[5];

const futureAddress = getContractAddress({
  from: address,
  nonce: nonce,
});

console.log(`Precomputed deployment address: ${futureAddress}`);
// Precomputed deployment address: ...
