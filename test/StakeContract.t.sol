// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Contract.sol";
import "../src/MockToken.sol";

contract CounterTest is Test {
    StakeContract public stakeContract;
    MockToken public token;
    uint256 public constant AMOUNT = 1e18;
    function setUp() public {
        stakeContract = new StakeContract();
        token = new MockToken();
    }
    
    function testStakingTokens(uint16 amount) public {
        token.approve(address(stakeContract), amount);
        bool success = stakeContract.stake(amount, address(token));
        assertTrue(success);
    }
}
