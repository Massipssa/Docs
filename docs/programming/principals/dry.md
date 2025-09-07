**Don't Repeat Yourself** is a fundamental software engineering principle that encourages avoiding code
duplication. The idea is:

"Every piece of knowledge should have a single, unambiguous, authoritative representation within a system."
— The Pragmatic Programmer

:::danger
    DRY ≠ Over-Abstraction

    Be careful: too much DRY can lead to over-engineering (creating generic code that's hard to understand). Strike a balance.
:::

## Why DRY Matters

- Less duplication means fewer bugs
- Easier to update/change (change in one place not in multiple places)
- Improves readability and maintainability

## Violating DRY (bad practice)

```scala
println("Connecting to database...")
// ... more code
println("Connecting to database...") // Repeated logic
```

## Applying DRY (good practice)

```scala
def connectMessage(): Unit = println("Connecting to database...")

connectMessage()
// ... more code
connectMessage()
```
