# Tests — BDD, TDD and Practical Testing Guide

This document describes test types, workflows (BDD/TDD), tooling and practical examples for Python projects. It focuses on actionable guidelines, pytest examples, CI integration and strategies to keep tests fast, reliable and maintainable.

---

## Principles & workflows

- Behavior Driven Development (BDD)  
  - Structure: Given (context) — When (event) — Then (outcome).  
  - Purpose: clarify behavior with examples; useful for acceptance tests and specifications.  
  - Use: feature files, plain-language scenarios, or tests written using the BDD style.

- Test Driven Development (TDD)  
  - Cycle: Red (write failing test) → Green (make it pass) → Refactor (clean code).  
  - Benefits: small incremental design, regression protection, better API design.

---

## Test types (the pyramid)

- Unit tests (fast, isolated)
  - Test a single unit of code, no external I/O.
  - Use mocks/stubs for external dependencies.
  - Run frequently (pre-commit, local runs, PR checks).

- Integration tests (slower, real integrations)
  - Verify interaction between components (DB, HTTP, filesystem).
  - Prefer lightweight/in-memory or containerized resources.
  - Run in CI (separate job) or nightly.

- End-to-end / Functional / Acceptance tests (slowest)
  - Validate full system behavior from user/API perspective.
  - Use real services or production-like environments.
  - Run in staging or nightly pipelines.

- Property-based testing (Hypothesis)
  - Tests invariants across many inputs; useful for edge-cases.

---

## Test design guidelines

- Keep unit tests deterministic and fast (`<100ms` ideally).
- Test behavior, not implementation details.
- Name tests clearly: ``test_<unit>__<scenario>__<expected>``.
- Use small fixtures; avoid large shared mutable state.
- Avoid flakiness: isolate external networks, control time, use retries cautiously.
- Prefer composition of small pure functions (easy to test).

---

## Python tooling overview

- pytest: modern test runner. Features: fixtures, parametrization, markers.
- unittest: Python stdlib runner; still useful for compatibility.
- coverage.py: measure test coverage (report and enforce thresholds).
- Hypothesis: property-based testing.
- tox: run tests across interpreters/environments.
- pre-commit: run linters and quick checks before commit.
- Docker / Testcontainers: isolated integration tests.

---

## pytest basics & examples

- Run all tests:
  - `pytest -q`

- Run a single test:
  - `pytest -q tests/test_module.py::test_specific_case`

- Run tests with marker:
  - `pytest -q -m integration`

- Example `conftest.py` (fixture scope and cleanup):

```python title="tests/conftest.py"

import pytest
from pyspark.sql import SparkSession

@pytest.fixture(scope="session")
def spark():
    spark = SparkSession.builder.master("local[1]").appName("tests").getOrCreate()
    yield spark
    spark.stop()

@pytest.fixture
def temp_dir(tmp_path):
    return tmp_path / "data"
```

- Example unit test:

```python title="tests/test_utils.py"
from mypkg.utils import normalize_email

def test_normalize_email_lowercases_and_strips():
    assert normalize_email(" Alice@Example.COM ") == "alice@example.com"
```

- Parametrized test:

```python
import pytest

@pytest.mark.parametrize("input_,expected", [
    ("A", "a"),
    (" B ", "b"),
])
def test_normalize_param(input_, expected):
    assert normalize_email(input_) == expected
```

---

## Mocks, doubles and isolation

- Use `unittest.mock` or `pytest-mock` to replace external calls.
- Mock at integration boundaries (HTTP, DB clients) not inside core logic.
- Example:

```python
from unittest.mock import MagicMock
client = MagicMock()
client.get.return_value.json.return_value = {"id": 1}
```

---

## Integration tests strategies

- Lightweight approaches:
  - Use in-memory DBs (SQLite) for schema-level tests.
  - Use fixtures to spin up ephemeral services (docker-compose, testcontainers).
- CI: run integration tests in separate job with longer timeout and service dependencies.

---

## Acceptance / BDD examples

- Use plain pytest with clear Given/When/Then comments or a BDD framework (behave, pytest-bdd).
- Example style (pytest with comments):

```python
def test_user_signup_flow(client, db):
    # Given: a new user payload
    payload = {"email": "u@example.com", "password": "pass"}
    # When: posting to signup endpoint
    resp = client.post("/signup", json=payload)
    # Then: user exists and response is 201
    assert resp.status_code == 201
    assert db.users.find_one({"email": "u@example.com"}) is not None
```

---

## Property-based testing (Hypothesis)

- Use Hypothesis for invariants and boundary cases:

```python
from hypothesis import given, strategies as st

@given(st.text(), st.integers(min_value=0, max_value=100))
def test_transform_invariant(s, n):
    # assert invariants hold for many random inputs
    result = my_transform(s, n)
    assert isinstance(result, str)
```

---

## Coverage & quality gates

- Measure coverage: `pytest --cov=mypkg --cov-report=xml`.
- Enforce minimum coverage in CI (e.g., fail if < 80%).
- Combine with linters (flake8, pylint), formatters (black), and static type checks (mypy).

---

## CI integration tips

- Separate jobs:
  - quick unit tests (fast)
  - integration tests (with services)
  - e2e/acceptance tests (staging)
- Cache virtualenvs and package layers to speed builds.
- Use service containers (Postgres, Kafka) in CI when needed.
- Inject secrets via CI secrets; avoid committing credentials.

---

## Flaky tests & mitigation

- Identify flaky tests and mark with a flaky marker.
- Use retries sparingly (pytest-rerunfailures) after investigating root cause.
- Common causes: timing, race conditions, reliance on external network, shared state.

---

## Test organisation & naming

- Directory layout:
  - tests/unit/...
  - tests/integration/...
  - tests/e2e/...
- Test file naming: `test_<module>.py`
- Test function naming: `test_<function>__<scenario>__<expected>`

---

## Example CI job snippet (GitHub Actions)
```yaml
# filepath: .github/workflows/ci.yml
name: CI
on: [push, pull_request]
jobs:
  unit-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Set up Python
        uses: actions/setup-python@v4
        with: python-version: "3.11"
      - name: Install deps
        run: |
          python -m pip install --upgrade pip
          pip install -r requirements-dev.txt
      - name: Run tests
        run: pytest -q
      - name: Coverage
        run: pytest --cov=mypkg --cov-report=xml
```

---

## Debugging failing tests

- Reproduce locally with same Python version and environment.
- Increase logging level to see details.
- Use `pytest -k <testname> -q -s` to run interactively.
- Capture failing state artifacts (DB dump, logs, temp files) in CI artifacts.

---

## Testing checklist (pre-PR)

- [ ] Unit tests added/updated for new logic.
- [ ] Integration tests for new integrations.
- [ ] Tests are deterministic and pass locally.
- [ ] Linting and type checks pass.
- [ ] Coverage not decreased below threshold.
- [ ] No secrets in tests or fixtures.

---

## Further reading & tools

- pytest docs: https://docs.pytest.org/
- Hypothesis: https://hypothesis.readthedocs.io/
- Testcontainers (for Python): https://github.com/testcontainers/testcontainers-python
- Martin Fowler on TDD/BDD and testing strategies.

---

Keep tests fast and focused. Use TDD for small API design, BDD for specification/acceptance, and a layered approach (unit → integration → e2e) to achieve reliable, maintainable test suites.
