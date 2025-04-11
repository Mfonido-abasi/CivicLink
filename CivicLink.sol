// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CivicLink {
    struct Post {
        address author;
        string message;
        uint timestamp;
    }

    struct Message {
        address sender;
        string content;
        uint timestamp;
    }

    Post[] public posts;
    mapping(address => Message[]) public inbox;

    event NewPost(address indexed author, string message, uint time);
    event NewMessage(address indexed from, address indexed to, string content, uint time);

    function postToForum(string calldata _message) external {
        posts.push(Post(msg.sender, _message, block.timestamp));
        emit NewPost(msg.sender, _message, block.timestamp);
    }

    function getAllPosts() external view returns (Post[] memory) {
        return posts;
    }

    function sendMessage(address _to, string calldata _content) external {
        inbox[_to].push(Message(msg.sender, _content, block.timestamp));
        emit NewMessage(msg.sender, _to, _content, block.timestamp);
    }

    function getInbox() external view returns (Message[] memory) {
        return inbox[msg.sender];
    }
}
