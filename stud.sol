pragma solidity >=0.7.0 <0.8.0;

contract stud {
    
    struct Student {
        uint ID;       // Changed to uint for non-negative values
        string fName;
        string lName;
        uint marks;    // Changed to uint for marks
    }

    address owner;
    uint public stdCount = 0;
    mapping(uint => Student) public stdRecords;

    modifier onlyOwner {
        require(owner == msg.sender, "Only the owner can execute this.");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addNewRecords(uint _ID, string memory _fName, string memory _lName, uint _marks) public onlyOwner {
        stdCount = stdCount + 1;
        stdRecords[stdCount] = Student(_ID, _fName, _lName, _marks);
    }

    // Modified bonusMarks function to apply bonus to specific student by ID
    function bonusMarks(uint _ID, uint _bonus) public onlyOwner {
        stdRecords[_ID].marks += _bonus;
    }
}

/*
The contract stores and manages student records using a Student struct, which holds the ID, first name, last name, and marks.

The owner (who deploys the contract) can add new students using the addNewRecords function.

The contract keeps track of the number of students added via the stdCount variable.

The bonusMarks function allows the owner to add bonus marks to the most recent student record.

The onlyOwner modifier ensures that only the contract owner can add records and apply bonuses.
*/