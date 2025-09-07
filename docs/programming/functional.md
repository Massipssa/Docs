#  Functional Programming

- Pure functions
    - Given the same inputs, always return the same output
    - Perform no observable side effects

!!! info
    What is a side effect?
    A side effect is any observable interaction other than returning a value.
    - **Examples:** reading/writing mutable state, I/O (files, network, console/logging), reading the clock or random numbers, throwing exceptions, process exit.
    - **Why it matters:** side effects break referential transparency and make code harder to reason about and test.
    - **FP approach:** keep a pure core and isolate effects at the edges, often by modeling them as values (e.g., IO/Task/Future, algebraic effects) and composing them explicitly.

- Immutability
    - Data isn’t modified in place; new values are created instead

- No shared mutable state
    - Avoid hidden coupling; simplifies reasoning and concurrency

- Higher-order functions
    - Take functions as arguments and/or return functions

- Referential transparency
    - Any expression can be replaced by its value without changing behavior