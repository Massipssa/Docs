# Functional Programming

Functional programming (FP) is a programming paradigm that emphasizes pure functions, immutability, and composition. FP produces code that is easier to reason about, test, and parallelize by minimizing hidden state and side effects.

## Core principles

- Pure functions  
  - Deterministic: same inputs → same outputs.  
  - No observable side effects (no I/O, mutable global state, time, random values).

- Immutability  
  - Data structures are not mutated in place; new values are produced instead.

- No shared mutable state  
  - Avoid global/mutable state to reduce coupling and concurrency bugs.

- Higher-order functions  
  - Functions accept other functions or return them (map, filter, reduce, decorators).

- Referential transparency  
  - Expressions can be replaced by their evaluated value without changing program behavior.

## Side effects — definition & handling

A side effect is any observable interaction besides returning a value (I/O, logging, DB, mutating arguments, reading time/random, raising uncaught exceptions). Best practice: keep a small, isolated impure edge (input/output) and a pure core that performs computation.

## Practical examples (Python)

Pure function:

```python
def add(a: int, b: int) -> int:
    return a + b
```

Impure function (avoid for core logic):

```python
GLOBAL = 0
def add_and_store(a: int, b: int) -> int:
    global GLOBAL
    GLOBAL = a + b           # side effect
    print(GLOBAL)            # I/O side effect
    return GLOBAL
```

Immutability with dataclasses:

```python
from dataclasses import dataclass

@dataclass(frozen=True)
class User:
    user_id: int
    email: str
```

Higher-order function / composition:

```python
from functools import reduce

def compose(*funcs):
    def composed(x):
        return reduce(lambda v, f: f(v), reversed(funcs), x)
    return composed
```

Use map/filter instead of loops:

```python
emails = list(map(lambda u: u.email.lower(), users))
active = list(filter(lambda u: u.is_active, users))
```

## Patterns & libraries

- Use small pure transformation functions; isolate I/O at boundary layers.  
- Use immutable containers: tuples, frozenset, frozen dataclasses.  
- Use libraries: `toolz`, `funcy`, `returns` (Maybe/Result types) for composition and safer error handling.  
- Prefer built-in functions and list/dict comprehensions for clarity and speed.

## Benefits

- Easier unit testing (pure functions require no fixtures/mocks).  
- Better concurrency/safety (no shared mutable state).  
- Clear reasoning and smaller cognitive load for each unit of code.

## Trade-offs & caveats

- Some FP patterns can be less familiar to teams.  
- Excessive immutability copies can cost performance; measure before optimizing.  
- Interop with imperative systems (DB, frameworks) requires clear boundaries.

## Testing & teaching tips

- Write small tests for pure functions; test composition rather than plumbing.  
- Use property-based tests (Hypothesis) to validate invariants.  
- Demonstrate moving side effects outside the pure core (IO at edges).

## Quick checklist for converting code to FP-style

- Identify pure core computations and extract them.  
- Replace in-place mutations with pure transforms returning new values.  
- Wrap side effects in a thin adapter layer.  
- Add unit tests for pure functions before integration tests.