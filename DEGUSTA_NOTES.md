## Chapter 2: 'Ethereum Basics'
- I created a Contract Fauset.sol
  - using remix: https://remix.ethereum.org
  - [Contract 0x48fe6e50befbdf04c139d3212168f62cd68fe771Created]
  - https://ropsten.etherscan.io/tx/0x59f7d0715db8fa3276857a96f50d9a2010b92845f3f2266b96709dca55b40dfb

## Chapter 3: 'Ethereum Clients'
- Aqui fala como instalar um Ethereum Cliente e baixar um full node - eu não vou fazer
- Remote Ethereum Clients : don't store the full blockchain (aka "Wallets")
- "Unlike Bitcoin addresses, which are encoded in the user interface of all clients to include a built-in checksum to protect against mistyped addresses, Ethereum addresses are presented as raw hexadecimal without any checksum."
- "The Inter exchange Client Address Protocol (ICAP) is an Ethereum address encoding that is partly compatible with the International Bank Account Number (IBAN) encoding"
  - "Hex Encoding with Checksum in Capitalization (EIP-55)...can validate it and detect errors with a 99.986% accuracy."
  - Esse EIP-55 é mto genial, só seguindo o exemplo do livro pra entender mesmo

### Chapter 6: 'Transactions'
- designated Burn address: https://etherscan.io/address/0x000000000000000000000000000000000000dEaD

### Chapter 7: 'Smart Contracts and Solidity'
- A contract’s code cannot be changed. However, a contract can be “deleted,” removing the code and its internal state (storage) from its address, leaving a blank account.
  - Any transactions sent to that account address after the contract has been deleted do not result in any code execution.
  - That operation costs “negative gas,” a gas refund, thereby incentivizing the release of network client resources from the deletion of stored state.
  - Deleting a contract in this way does not remove the transaction history (past) of the contract.
  - The SELFDESTRUCT capability will only be available if the contract author programmed the smart contract to have that functionality.
- Solidity Docs: https://docs.soliditylang.org/en/latest/installing-solidity.html
- Examples: https://solidity-by-example.org/
- Compile:
  > $ solc --optimize --bin code/Solidity/Faucet.sol
- produce the ABI for our Faucet.sol:
  > $ solc --abi code/Solidity/Faucet.sol
- note: "Additional error-checking code like this will increase gas consumption slightly, but it offers better error reporting than if omitted. You will need to find the right balance between gas consumption and verbose error checking based on the expected use of your contract. In the case of a Faucet contract intended for a testnet, we’d probably err on the side of extra reporting even if it costs more gas. Perhaps for a mainnet contract we’d choose to be frugal with our gas usage instead."

### Chapter 8: 'Smart Contracts and Vyper'
- Solidity developers do have access to libraries like [SafeMath] as well as Ethereum smart contract security analysis tools like [Mythril OSS].

### Chapter 9: 'Smart Contract Security'
- Ethernaut
  - Ethernaut is a Web3/Solidity based wargame inspired in overthewire.org, to be played in the Ethereum Virtual Machine. Each level is a smart contract that needs to be 'hacked'.
  - https://github.com/OpenZeppelin/ethernaut
