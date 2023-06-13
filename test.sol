pragma solidity 0.8.7;

contract SimpleCurrency {
    address owner;
    mapping(address => uint256) balances;

    constructor() {
        owner = msg.sender;
    }

    function mint(address _address, uint256 _amount) public {
        require(msg.sender == owner, "Not the owner");
        balances[_address] += _amount;
    }

    function transfer(address _to, uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }

    function balanceOf(address _address) public view returns (uint256) {
        return balances[_address];
    }
