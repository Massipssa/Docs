# Python Scope & Name Resolution (LEGB)

A compact, practical guide to how Python resolves names (the **LEGB** rule), common gotchas, and patterns to write clearer, less‑buggy code.

---

## TL;DR — LEGB in one minute

* **L — Local**: Names created inside the current function or comprehension.
* **E — Enclosing**: Names in any outer function scopes (for nested functions/closures).
* **G — Global**: Names at module (file) level.
* **B — Builtins**: Names available from the `builtins` module (e.g., `len`, `print`).

**Resolution order:** Python searches **L → E → G → B**. The **first match wins**.

> Tip: A *bare* name (no attribute/dot) follows LEGB. Attribute access (e.g., `obj.x`) does not.

---

## Quick Mental Model

* **Local** = inside the current `def` / `lambda` (and, in Python 3, inside comprehension scopes).
* **Enclosing** = surrounding `def`s (nearest outward) used by closures.
* **Global** = top‑level names in the current module.
* **Builtins** = final fallback from `builtins`.

---

## Minimal Examples

### 1) L, E, G, B in action

```python
x = "global x"

def outer():
    x = "enclosing x"
    def inner():
        x = "local x"
        return x
    return inner()

print(outer())  # local x
print(x)        # global x
```

If `inner` doesn’t assign `x`, it resolves to the enclosing value:

```python
def outer():
    x = "enclosing x"
    def inner():
        return x   # resolves to enclosing x
    return inner()
```

### 2) `global` — rebind a module‑level name from inside a function

```python
count = 0

def bump():
    global count
    count += 1

bump(); bump()
print(count)  # 2
```

> Without `global`, `count += 1` raises `UnboundLocalError` because assignment marks `count` as local.

### 3) `nonlocal` — rebind a name in an enclosing (non‑global) scope

```python
def counter():
    n = 0
    def inc():
        nonlocal n
        n += 1
        return n
    return inc

c = counter()
print(c(), c(), c())  # 1 2 3
```

### 4) Mutating vs. reassigning

```python
items = []

def add(a):
    items.append(a)  # mutates the object bound to global `items`

def reset():
    global items     # reassignment needs `global`
    items = []
```

### 5) Comprehension & generator scope (Python 3)

* List/set/dict comprehensions and generator expressions have their **own** scope in Python 3. The loop variable **does not leak**.

```python
x = "global"
vals = [x for x in range(3)]
print(x)    # "global"
```

### 6) Class scope gotcha

A class body has a namespace during execution, but it is **not** an *enclosing* scope for methods. Methods must access class attributes via `self` or the class name.

```python
x = "module"
class C:
    x = "class attr"
    def f(self):
        return C.x, self.x  # qualify explicitly
```

### 7) Closures & loop‑variable capture (common pitfall)

```python
funcs = [lambda: i for i in range(3)]
print([f() for f in funcs])  # [2, 2, 2] (all capture final i)
```

Fix by binding the current value as a default argument:

```python
funcs = [lambda i=i: i for i in range(3)]
print([f() for f in funcs])  # [0, 1, 2]
```

### 8) Default‑argument evaluation time

Default parameter values are evaluated **once** at function definition time (not at call time). Avoid mutable defaults:

```python
def add(item, items=[]):   # 🚫 DONT
    items.append(item)
    return items
```

Better:

```python
def add(item, items=None):
    items = [] if items is None else items
    items.append(item)
    return items
```

### 9) `exec`, `import *`, and scope hygiene

`exec()` and `from module import *` can obscure where names come from and confuse linters/tools. Avoid in production.

---

## Inspecting Runtime Scopes

* `locals()` → snapshot of local names.
* `globals()` → module namespace.
* `vars(obj)` → an object’s attribute dict.
* `import builtins` → inspect builtin names.
* `inspect.getclosurevars(func)` → analyze captured names in a closure.

---

## Debugging Playbook

1. **Reproduce** the error (e.g., `UnboundLocalError`).
2. **Probe** with `print(locals())` or a debugger (`pdb`, `breakpoint()`), right before the failing line.
3. **Check assignments**: any assignment to a bare name makes it local unless declared `global`/`nonlocal`.
4. **Watch for captures** in comprehensions/loops—use the default‑arg trick to freeze values.
5. **Lint** with `ruff`/`flake8`; add `mypy` for static checks.

---

## Best Practices & Patterns

* Prefer **explicit parameters** over reading/writing globals.
* Keep functions **small and pure**; return values instead of mutating outer state.
* Use `nonlocal` **sparingly**; consider returning new state from inner functions instead.
* For closures inside loops, use the **default‑argument capture** pattern (`lambda i=i: ...`).
* Avoid mutation of shared global state; if necessary, **encapsulate** in objects with clear APIs.
* Avoid `from module import *` and `exec()`; prefer explicit imports and names.
* Don’t shadow builtins (`list`, `id`, `str`, …). If you must, alias: `from typing import List as TList`.

---

## Common Pitfalls — Checklist

* [ ] `UnboundLocalError` due to assignment before use.
* [ ] Unexpected closure capture in loops/comprehensions.
* [ ] Mutable default args causing shared state.
* [ ] Assuming class body variables act as an enclosing scope for methods.
* [ ] Name shadowing of builtins (`list`, `id`, `str`, etc.).

---

## Glossary

* **Binding**: associating a name with an object in a namespace.
* **Namespace**: a mapping from names to objects (e.g., module `globals()`).
* **Closure**: a function that captures variables from its enclosing scope.

---

## Further Reading

* Python docs — *Naming and binding*: [https://docs.python.org/3/reference/executionmodel.html#naming-and-binding](https://docs.python.org/3/reference/executionmodel.html#naming-and-binding)
* Scoping of generator/comprehension variables — see PEP 289 history and Python 3 behavior.
* Tools: `inspect`, `pdb`, `ruff`/`flake8`, `mypy`.

---

### Try‑It Snippets (copy/paste)

**Probe locals**

```python
def demo():
    x = 1
    print("locals:", locals())
```

**Freeze loop variable**

```python
funcs = []
for i in range(3):
    funcs.append(lambda i=i: i)
assert [f() for f in funcs] == [0, 1, 2]
```

**Safe default pattern**

```python
def append_safe(x, bucket=None):
    bucket = [] if bucket is None else bucket
    bucket.append(x)
    return bucket
```

---

## Advanced Notes & Edge Cases

### What counts as a *binding*?

The following statements **bind** names in the current local scope (unless marked otherwise):

* `assignment` (including tuple unpacking): `x = 1`, `a, b = b, a`
* `augmented assignment`: `x += 1` (also marks `x` local unless `global`/`nonlocal`)
* `def`, `class`: bind the function/class name in the surrounding scope
* `import` / `from ... import ...` (bind imported names)
* `except <Exc> as e`: binds `e` **in the `except` block scope only**
* `for` loop target in a function: binds in function local scope
* `with ... as x`: binds `x` in the current block
* `match` / `case` pattern variables: bind inside the `case` block
* `:=` *walrus* operator: binds in the **nearest enclosing scope** where the expression appears (comprehensions have their own scope in Py3)
* `del name`: unbinds (removes) a name from the current scope

> `global name` means assignments go to the **module** scope.
>
> `nonlocal name` means assignments go to the **nearest enclosing function** scope; the name **must already exist** there.

### `global` is per‑module

`global` refers to the current module’s namespace—not all modules.

```python
# mod_a.py
x = 0

def set_via_global():
    global x
    x = 99

# mod_b.py
import mod_a

mod_a.set_via_global()
print(mod_a.x)  # 99
```

To write another module’s global from *here*, assign its attribute: `mod_a.x = 5`.

### Shadowing builtins (and how to escape it)

A global or local can shadow a builtin:

```python
len = 42
print(len)      # 42
# print(len([1,2]))  # TypeError
```

Escape hatch:

```python
import builtins
print(builtins.len([1,2]))  # 2
```

Prefer not to shadow builtins; use different names.

### Comprehensions & `:=` (walrus) in Py3

Comprehensions have their own scope; `:=` binds **inside** that scope:

```python
x = 'module'
vals = [y := x.upper() for x in 'ab']  # here, `x` is the loop var, local to comp
print('module x =', x)   # still 'module'
print(vals, y)           # ['A','B'] and NameError (y not bound outside)
```

### `match` / `case` pattern variables

Pattern names bind **within the `case` block** only:

```python
def describe(t):
    match t:
        case (x, y):  # binds x,y here
            return x + y
    # x, y not defined here
```

### Classes are mappings, not enclosing scopes

Inside a class body, *simple* names refer to the class namespace while executing, but methods later look up via attribute access.

```python
class C:
    k = 10
    lst = []
    lst.append(1)   # ok: class body executes top‑to‑bottom
    def f(self):
        return self.k      # attribute lookup at runtime
```

### Introspection: freevars & cellvars

```python
def make():
    x = 1
    def inner():
        return x
    return inner

f = make()
print(f.__code__.co_freevars)  # ('x',)
```

For deeper analysis:

```python
import inspect
inspect.getclosurevars(f)
```

### Performance tidbits (micro)

Local lookups are faster than globals/builtins. If you’re in a hot loop:

```python
from math import sqrt
s = 0.0
for i in range(10_000):
    s += sqrt(i)   # local name `sqrt` is a fast lookup
```

Optimize only when profiling says so.

---

## Exercises (with expected outputs)

1. **UnboundLocal**

```python
n = 10

def f():
    n += 1
    return n
```

* **Q:** What error and why?
* **A:** `UnboundLocalError` — assignment marks `n` local, read happens before assignment.

2. **Closure capture**

```python
funcs = [lambda: i for i in range(4)]
print([f() for f in funcs])
```

* **Expected:** `[3, 3, 3, 3]`
* **Fix:** `lambda i=i: i` → `[0,1,2,3]`

3. **Class scope**

```python
x = 'module'
class C:
    x = 'class'
    def show(self):
        return x
```

* **Q:** What does `C().show()` return?
* **A:** `'module'` — bare name resolves via LEGB in the method’s scope; use `self.x` or `C.x` to access class attr.

4. **Comprehension leakage**

```python
for i in range(3):
    pass
print(i)

j = 99
[j for j in range(1)]
print(j)
```

* **Expected (Py3):** first `print(i)` → `2` (loop binds in function/module scope).
  Second `print(j)` → `99` (comprehension has its own scope; `j` not overwritten).

5. **Walrus in conditions**

```python
if (m := 3) > 2:
    pass
print(m)
```

* **Expected:** `3` — bound in the current scope (not a comprehension).

---

## One‑Page Cheat Sheet

**LEGB:** Local → Enclosing → Global → Builtins

**Binders:** `=`, `+=`, `def`, `class`, `import`, `except ... as`, `for` target, `with ... as`, `match`/`case` names, `:=` (scope‑aware), `del` (unbinds).

**Keywords:**

* `global x` → write to module scope
* `nonlocal x` → write to nearest enclosing function scope (must already exist)

**Do:**

* Pass values as params; avoid globals
* Use default‑arg capture in closures inside loops
* Use `None` sentinel for optional mutable params
* Lint (ruff/flake8) + type‑check (mypy)

**Don’t:**

* Shadow builtins (`list`, `id`, `str`, ...)
* Use `from module import *` / `exec` in production
* Rely on class body as enclosing scope for methods

**Introspect:** `locals()`, `globals()`, `vars(obj)`, `inspect.getclosurevars(f)`

---

## FAQ

**Q:** Why does `nonlocal` raise `SyntaxError: no binding for nonlocal`?
**A:** The name must already exist in a **non‑global** enclosing function scope.

**Q:** Why does a comprehension not overwrite my outer loop variable?
**A:** In Python 3, comprehensions run in their own scope; the loop variable doesn’t leak.

**Q:** How can I modify a module‑level constant safely for tests?
**A:** Prefer dependency injection (pass it as a parameter) or patch the attribute explicitly in tests (`monkeypatch.setattr(mod, 'NAME', value)`).
