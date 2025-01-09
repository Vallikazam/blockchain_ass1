// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Функция для получения Ether
    receive() external payable {}

    // Функция для проверки баланса контракта
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Функция для вывода всех средств владельцем
    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        payable(owner).transfer(address(this).balance);
    }
}
