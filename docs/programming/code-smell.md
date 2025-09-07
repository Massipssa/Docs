# Code smell

- **Code duplication**
- **Feature envy**
    - Method makes multiple calls to methods and attributes of another class, which means that the method isn't in 
    the right class
    - Solution
        - Move the method, or some part of the method to the right class 
- **God class (Winnebago)**
    - Class with a lot of attributes and dependencies to other classes. It's du to the fact that we're able 
      to design a correct architecture for the code
    - Solutions
        - Divide and rule
        - Use abstract classes

- **Large class**
  
- **Long method**
  
- **Long parameter list**
    - Solutions
        - Remove parameters that resulted from the call to another objet and use the objet as parameter
        - Group the parameters which could form a separate method 
    

- **cyclomatic complexity**