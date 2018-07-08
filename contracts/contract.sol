pragma solidity ^0.4.18;

contract Owned {
    address owner;

    function Owned() public {
        owner = msg.sender;
    }

   modifier onlyOwner {
       require(msg.sender == owner);
       _;
   }
}

contract Courses is Owned {

    struct Instructor {
        uint tid;
        string Pname;
        string Description;
        string Location;
        string Status;
    }
    uint public count = 0;

    mapping (address => Instructor) instructors;
    address[] public instructorAccts;

    event instructorInfo(
        address _address,
        uint tid,
       string Pname,
       string Description,
       string Location,
       string Status
    );

    function setInstructor(address _address, uint _tid, string _Pname,string _Description, string _Location, string _Status) onlyOwner public {
        var instructor = instructors[_address];
        instructor.tid = _tid;
        instructor.Pname = _Pname;
        instructor.Description=_Description;
        instructor.Location = _Location;
        instructor.Status = _Status;

        instructorAccts.push(_address) -1;
        instructorInfo(_address ,_tid,_Pname,_Description, _Location, _Status);
        count++;

    }

    function getInstructors() view public returns(address[]) {
        return instructorAccts;
    }

    function getInstructor(address _address) view public returns (uint, string,string, string,string) {
        return (instructors[_address].tid, instructors[_address].Pname, instructors[_address].Description, instructors[_address].Location,instructors[_address].Status);
    }
    function updateCustomerStatus(address _address, string Status) {
        instructors[_address].Status = Status;
    }

    function countInstructors() view public returns (uint) {
        return instructorAccts.length;
    }
    function getInstructorById(uint _tid) view public returns (uint , string,string , string, string)
    {
        for(var i=0;i<=count;i++)
        {
            if(instructors[i].tid==_tid)

                 return (instructors[i].tid, instructors[i].Pname,instructors[i].Pname, instructors[i].Location, instructors[i].Status);
        }

    }

}
