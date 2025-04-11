// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TodoList {
    uint256 public taskCount = 0;

    struct Task {
        uint256 id;
        string description;
        bool completed;
    }

    mapping(uint256 => Task) public tasks;

    event TaskCreated(uint256 id, string description, bool completed);
    event TaskCompleted(uint256 id, bool completed);

    function createTask(string memory _description) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _description, false);
        emit TaskCreated(taskCount, _description, false);
    }

    function completeTask(uint256 _id) public {
        Task storage task = tasks[_id];
        task.completed = true;
        emit TaskCompleted(_id, true);
    }

    function getTask(uint256 _id) public view returns (Task memory) {
        return tasks[_id];
    }
}
