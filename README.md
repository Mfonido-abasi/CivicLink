# CivicLink Smart Contract

This repository contains the Solidity smart contract `CivicLink.sol`.

## Overview

The `CivicLink` smart contract provides basic social networking functionalities on the blockchain. It allows users to:

* **Post to a Forum:** Users can publish text messages to a public list of posts. Each post includes the author's address, the message content, and a timestamp.
* **View All Posts:** Anyone can retrieve a list of all posts made to the forum.
* **Send Messages:** Users can send private messages to other Ethereum addresses. Each message includes the sender's address, the message content, and a timestamp.
* **View Inbox:** Users can retrieve a list of all private messages sent to their address.

## Contract Details

### Structs

* **`Post`**: Represents a forum post with the following fields:
    * `author` (`address`): The Ethereum address of the user who created the post.
    * `message` (`string`): The text content of the post.
    * `timestamp` (`uint256`): The Unix timestamp of when the post was created.

* **`Message`**: Represents a private message with the following fields:
    * `sender` (`address`): The Ethereum address of the user who sent the message.
    * `content` (`string`): The text content of the message.
    * `timestamp` (`uint256`): The Unix timestamp of when the message was sent.

### State Variables

* `posts` (`Post[] public`): A publicly accessible array storing all the forum posts.
* `inbox` (`mapping(address => Message[]) public`): A mapping where each Ethereum address maps to an array of `Message` structs received by that address.

### Events

* `NewPost(address indexed author, string message, uint time)`: Emitted when a new post is successfully added to the forum.
* `NewMessage(address indexed from, address indexed to, string content, uint time)`: Emitted when a new private message is sent to a user.

### Functions

* `postToForum(string calldata _message) external`: Allows the caller to create a new post on the forum with the provided message. Emits the `NewPost` event.
* `getAllPosts() external view returns (Post[] memory)`: Returns an array containing all the posts currently on the forum. This is a read-only function and does not cost gas.
* `sendMessage(address _to, string calldata _content) external`: Allows the caller to send a private message with the given content to the specified Ethereum address. Emits the `NewMessage` event.
* `getInbox() external view returns (Message[] memory)`: Returns an array of all private messages received by the caller. This is a read-only function and does not cost gas.

## Deployment

This contract can be deployed to any EVM-compatible blockchain (e.g., Ethereum Sepolia testnet) using tools like Remix, Hardhat, or Truffle.

**Using Remix (Recommended for initial deployment):**

1.  Open Remix in your browser: [https://remix.ethereum.org/](https://remix.ethereum.org/)
2.  Create a new file named `CivicLink.sol`.
3.  Paste the contract code into the editor.
4.  Compile the contract using the Solidity compiler tab.
5.  Deploy the contract using the "Deploy & Run Transactions" tab, ensuring you are connected to the desired network (e.g., Sepolia via MetaMask).

## Interacting with the Contract

Once deployed, you can interact with the contract using:

* **Remix:** Use the "Deployed Contracts" section in the "Deploy & Run Transactions" tab to call the contract's functions.
* **Web3 Libraries (e.g., ethers.js, web3.js):** Integrate with your frontend application using a Web3 JavaScript library, providing the contract's address and ABI.

## Getting the ABI

The ABI (Application Binary Interface) is necessary for external applications to interact with the contract. You can obtain the ABI from:

* **Remix:** In the "Solidity compiler" tab, after successful compilation, you can copy the ABI from the "Compilation Details" section.
* **Hardhat/Truffle:** These development environments typically generate the ABI in the `artifacts` directory after compilation.

## Future Enhancements

Possible future enhancements for this contract could include:

* User profiles and identities.
* Following/friend relationships.
* More sophisticated message filtering and sorting.
* Moderation features.
* Integration with off-chain storage solutions for richer content.

## License

MIT
