// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

/* 이름, 생일, 번호를 담은 구조체 Student 이들의 데이터를 관리하는 array
students에 Student를 넣을 수 있는 함수
n번째 학생을 반환해주는 함수
n번째 학생의 이름을 반환해주는 함수를 구현하세요.
*/

contract quize {
    struct Student {
        string name;
        uint birth;
        uint number;
    }

    Student[] students;

    function pushStudent(string memory _name, uint _birth, uint _number) public {
        students.push(Student(_name, _birth, _number));
    }

    function getN(uint _n) public view returns(Student memory) {
        return students[_n - 1];
    }

    function getName(uint _n) public view returns(string memory) {
        return students[_n - 1].name;
    }
}