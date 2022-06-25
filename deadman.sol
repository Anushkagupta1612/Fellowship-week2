// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Deadman {
    
    modifier OnlyOnwer{
        require(owner == msg.sender);
        _;
    }

    address public owner = msg.sender;
    address payable public trans_to = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    bool public trans = false;
    uint public block_num = block.number;

    function still_alive () public OnlyOnwer{
        require(block.number - block_num <= 10);
        block_num = block.number;
    }

    function transfer_to() public payable {
        require(block.number - block_num >= 10);
        trans_to.transfer(msg.value);
    }
} 