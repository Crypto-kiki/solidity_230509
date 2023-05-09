// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract Note {
    function forLoop() public pure returns(uint) {
        uint a;

        for(uint i = 1; i < 6; i++) {
            a = a + i;
        }

        return a;
        // 결과값 : 15
    }

    function forLoop2() public pure returns(uint, uint) {
        uint a;
        uint i;

        for(i = 1; i < 6; i++) {
            a = a + i;
        }
        
        return (a, i);
        /* 결과값
        a   i
        0   0
        1   1
        3   2
        6   3
        10  4
        15  5
        */
    }

    function forLoop3() public pure returns(uint, uint) {
        uint a;
        uint i;

        for(i=1; i<=5; i++) {
            a = a + i;
        }

        return (a, i);
    }
    // i<=n 으로 표기하면 n+1까지 감.
    // i<n 으로 표기하면 n까지만 감.

        /*결과값
        a   i
        0   0
        1   1
        3   2
        6   3
        10  4
        15  5
            6    
        */
}