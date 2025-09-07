## What's KISS

**KISS** stands for **Keep It Simple and Stupid** — a key design principle in software engineering (and many other fields).
It promotes simplicity over unnecessary complexity.

## The Core Idea

:::tip
    The simplest solution is often the best one.
:::

- Don't overengineer.
- Don’t add things you might need later.
- Aim for clarity, not cleverness.

## Example (Scala)

- Without KISS – Overengineered

```scala
def add(a: Int, b: Int): Int = {
  val result = Some(a + b)
  result.getOrElse(throw new RuntimeException("Unexpected error"))
}
```

- With KISS – Simple and clear

```scala
def add(a: Int, b: Int): Int = a + b
```

## Common Violations of KISS

- Adding design patterns where they're not needed
- Overuse of abstractions or indirection
- Overengineering for features that don't exist yet

## Summary

KISS reminds us to avoid complexity for its own sake. In practice, it means writing clean, direct code that does the job — and nothing more.
