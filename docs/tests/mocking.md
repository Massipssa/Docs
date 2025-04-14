- Mock: dummy implementation of interface or class
- Defines the output for methods
- Tow types of testing
  - State
  - Behavior (method was called once, ...)
- Spy: ??
  
```java
 @Mock
 private Myservice myService;
 
 public void testMyFunc() {
  // theReturn: return value from mock
  // AnyString, AnyInt
  when(myService.getId()).thenReturn(10); 
  ...
  // doReturn ... when 
  
  
  // verify
  // ArgumentMatchers, times, never, atLeastOnce, atLeast
  
  
 }
```
