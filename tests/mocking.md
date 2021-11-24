- Mock: dummy implementation of interface or class
- Defines the output for methods
- Tow types of testing
  - State
  - Behavior (method was called once, ...)
  
```java
 @Mock
 private Myservice myService;
 
 public void testMyFunc() {
  when(myService.getId()).thenReturn(10); 
  ...
 }
```
