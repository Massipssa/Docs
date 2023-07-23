## Behavior Driven Development Test

- Based on three 
  - Context (Given): starting state
  - Event (When): what user does 
  - Outcomes (Then): expected results 

- Can be written at any time 
  - Before 
  - During 
  - After 
    
  
## Test types

- **Unit**
  - Doest interact with external word
  - It helps to: 
    - Understand the system that we're building 
    - Document the code
    - Design the units 
    - Protect against regression
- **Integration:**
  - Focus integrating different layers of the application, that means no mocking is involved
  - Ideally, they should be keep separated from unit tests and should not run along with unit tests  
  - Two types     
    - Component
    - System
      - To realize test we can use for example in memory databases
- **Functional**
  - Test the functionality of an application (create account, delete user, ...)
  - Verify only the functionality purpose
    
- Unit tests
  - Arrange
  - Act
  - Assert
  

## Python 
- Main Components
  - Test Case 
  - Test Suite 
  - Test Feature (setUp and tearDown)
  - Test Runner 

- Unittest
  - ``python -m unittest discover``
  
  - Pytest
    - **fixtures:** are functions that create data or test doubles or initialize some system state
      for the test suite.
    - ``pytest``
    - Filtering
      - Run one test ``pytest -v tests/my-directory/test_demo.py::TestClassName::test_specific_method``
    - Uses ``pytest.ini`` as config file
    - Uses ``conftest.py`` to define fixtures
    - Marking is useful for categorizing by subsystem or dependencies
        - Run tests having mark ``pytest -m mark_name``
        - Do not run tests having mark ``pytest -m "not mark_name"``
        - Custom markers can be used
    

## Java

- Unit tests in Maven are managed by Surefire plugin and Integration test are managed by Failsafe plugin
- Integration test names end by IT (convention in Java) which allows Maven to separate them from unit tests 


- Define tests standard
  - Test types
  - Code coverage  
- Put code quality check as step in CI/CD pipeline
- Add code review in dev process
- Apply SOLD and Twelve principals
