// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract allStruct {
    struct MyStruct {
        uint256 age;
        string name;
        bool sex;
    }

    MyStruct public myStruct;

    function insert(uint256 _age, string memory _name, bool _sex) public {
        myStruct.age = _age;
        myStruct.name = _name;
        myStruct.sex = _sex;
    }

    function getter() public view returns (uint256) {
        return myStruct.age;
    }

    function postGetter() public view returns (MyStruct memory) {
        return myStruct;
    }

    function homogenousGetter() public view returns (string memory) {
        return myStruct.name;
    }

    // struct as array
    MyStruct[] public twoStructs;

    function setStruct(uint256 _age, string memory _name) public {
        twoStructs.push(MyStruct({age: _age, name: _name, sex: true}));
    }

    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) public {
        todos.push(Todo(_text, false));

        todos.push(Todo({text: _text, completed: false}));

        Todo memory todo;
        todo.text = _text;

        todos.push(todo);
    }

    function get(
        uint256 _index
    ) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function updateText(uint256 _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function toggleCompleted(uint256 _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }

    struct AnotherStruct {
        uint id;
        string name;
    }

    AnotherStruct[1] public myStructArray;

    function setAnotherStruct(uint _id, string memory _name) public {
        myStructArray[0] = AnotherStruct(_id, _name);
    }

    function getStruct() public view returns (uint, string memory) {
        AnotherStruct memory s = myStructArray[0];
        return (s.id, s.name);
    }
}
