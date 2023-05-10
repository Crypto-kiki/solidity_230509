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


    uint[4] c;
    uint count;

    function pushA(uint _n) public {
        c[count++] = _n;
    }

    function getC() public view returns(uint[4] memory) {
        return c;
    }

    function forLoop4() public view returns(uint) {
        uint a;
        for(uint i=0;i<4;i++) {
            a=a+c[i];
        }

        return a;
    }

    function forLoop5() public view returns(uint) {
        uint a;
        for(uint i=0; i<c.length;i++) {
            a=a+c[i];
        }

        return a;
    }

    uint[] d;
    
    function pushd(uint _n) public {
        d.push(_n);
    }

    function getD() public view returns(uint[] memory) {
        return d;
    }

    function forLoop6() public view returns(uint) {
        uint a;
        for(uint i=0;i<d.length;i++) {
            a=a+d[i];
        }

        return a;
    }
}


contract fixedArray {
    uint[] a;
    uint[4] b; // push, pop은 array의 길이를 변경시키기 때문에 사용할 수 없음.

    function getALength() public view returns(uint) {
        return a.length;
    }

    function pushA(uint _a) public {
        a.push(_a);
    }

    function getA() public view returns(uint[] memory) {
        return a;
    }

    function getBLength() public view returns(uint) {
        return b.length;
    }

    function pushB(uint _b) public {
        // b.push(_b);  이렇게 하면 에러가 발생함. 정적인 자리수는 자리수까지 정해줘야 함.
        b[_b] = _b;  // 그럼 보통 인풋값을 2개 쓰겠네? 몇번째 자리n, 넣을 값 m 보통 2개! 아래처럼
    }

    function pushB_B(uint _n, uint _b) public {
        b[_n] = _b;
    }

    // 하지만 아래같이 인풋 값 하나만 써서 아래처럼 할 수 도 있음. 함수를 실행시킬 때 마다 count++하고 넣을 값만 입력!;
    uint count;

    function pushB2(uint _n) public {
        b[count++] = _n;
        // count에 _n을 넣고 count에 +1 함. 즉, count 0번째 자리에 _n을 넣고 count에 1을 더함.
        // 따라서 출력해보면 [1, 0, 0, 0]이 나옴.
    }


    function pushB3(uint _n) public {
        b[++count] = _n;
        // ++ 하고 count 에 _n을 넣음. 따라서 처음 실행하면 count 빈값이였던 0에 + 1한 1번째 자리에 _n을 넣음.
        // 따라서 출력해보면 [0, 1, 0, 0]이 나옴.
    }

    function getB() public view returns(uint[4] memory) {
        // fixed array도 리턴값은 memory 붙여줘야 함.
        return b;
    }

    function getCount() public view returns(uint) {
        return count;
    }
}


contract forLoopAndFixedArray {
    uint[4] c;
    uint count;

    function pushA(uint _n) public {
        c[count++] = _n;
    }

    function getC() public view returns(uint[4] memory) {
        return c;
    }

    function forLoop() public view returns(uint) {
        uint a;
        for(uint i = 0; i < c.length; i++) {
            a = a + c[i];
        }

        return a;
    }
}