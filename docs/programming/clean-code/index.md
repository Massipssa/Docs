# Clean Code

Writing clean code means producing software that is easy to read, maintain, and extend. Clean code principles help teams collaborate effectively and reduce bugs over time.

## Naming

- **Use meaningful names:** Choose names that clearly describe the purpose or usage of variables, functions, and classes.
- **Avoid disinformation:** Do not use names that mislead or confuse.
- **Use pronounceable names:** Names should be easy to say and remember.
- **Be consistent:** Follow naming conventions and patterns throughout your codebase.
- **Use searchable names:** Prefer names that are easy to find with search tools.

## Error Handling

- **Use exceptions rather than return codes:** Exceptions make error handling explicit and harder to ignore.
- **Catch relevant exceptions:** Handle only those exceptions you can meaningfully respond to.
- **Provide context in exceptions:** Include informative error messages that describe the failed operation and the reason for failure.
- **Define custom exceptions:** Create your own exception types for specific error scenarios.
- **Wrap third-party APIs:** Encapsulate external libraries to minimize dependencies and make future changes easier.
  - Wrapping makes it easier to mock dependencies in tests.
  - Reduces coupling to vendor-specific API designs.
- **Avoid returning null:** Prefer returning empty collections or Option/Maybe types.
- **Avoid passing null:** Use default values or optional parameters to prevent null-related bugs.

## Unit Tests

- **Write automated tests:** Ensure your code is covered by meaningful unit tests.
- **Test edge cases:** Cover both typical and unusual scenarios.
- **Keep tests independent:** Each test should run in isolation.
- **Use descriptive test names:** Make it clear what each test verifies.
- **Refactor tests:** Maintain test code quality just like production code.

---
*Clean code is not just about style—it's about building reliable, maintainable software that stands
