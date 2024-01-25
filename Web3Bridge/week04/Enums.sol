// Anytime you are declaring a memory or dynamic array, you must specify the array length

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Enum {
    // Enum representing shipping status
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    // Default value is the first element listed in
    // definition of the type, in this case "Pending"
    Status public status;

    // Rurns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4

    // Hint: The returned value for enum is always unit, it is now you the developer that will know what that particular unit/number represnts in your enum
    function get() public view returns (Status) {
        return status;
    }

    function getName() public view returns (Status, string memory) {
        if (status == Status.Shipped) {
            return (status, "Shipped");
        }
        if (status == Status.Accepted) {
            return (status, "Accepted");
        }
        if (status == Status.Rejected) {
            return (status, "Rejected");
        }

        if (status == Status.Canceled) {
            return (status, "Canceled");
        }

        return (status, "Pending");
    }

    // TODO: check between getName and getName2 which is more gas efficient

    function getName2() public view returns (Status, string memory) {
        string[5] memory statusName = [
            "Pending",
            "Shipped",
            "Accepted",
            "Rejected",
            "Canceled"
        ];

        return (status, statusName[uint8(status)]);
    }

    // Update status by passing uint into input
    function set(Status _status) public {
        status = _status;
    }

    function pending() public {
        status = Status.Pending;
    }

    function shipped() public {
        status = Status.Shipped;
    }

    // You can update to a specific enum like this
    function cancel() public {
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }
}
