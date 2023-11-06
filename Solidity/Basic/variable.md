# Variable Types

So now that we know about state variables and local variables, let's dig a little deeper and learn a bit about the different types of variables you will encounter as well as their default values.

## Reading and Writing a State Variable

You have learned what variables are, so let's explore how to use them! In the code below, you can see an example of what’s called a get function and a set function. Put simply, a get function returns the value of a state variable. A set function, on the other hand, assigns a value to a state variable.

```javascript
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.9;

contract Storage {

   uint number;

    // takes a value _number and assigns it to the state variable number
    function setNumber(uint _number) public {
          number = _number;
    }

    // returns the value of the state variable number
    function getNumber() public view {
        return number;
    }
 }
```

---
