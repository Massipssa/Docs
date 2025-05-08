## What Is YAGNI?

**YAGNI** stands for **You Aren’t Gonna Need It** — a key principle from Agile and Extreme Programming (XP) that advises:

>
    Don’t implement something until it’s actually needed.


## Core Idea

- Don’t build features, methods, or abstractions ***just in case***.
- Only write code when there’s a real, immediate need.



## Example

- **Violating YAGNI**

```python
def send_notification(user, method="email", retries=3):
    if method == "email":
        print(f"Sending email to {user}")
    elif method == "sms":
        print(f"Sending SMS to {user}")
    # In reality, only 'email' is ever used in the app
```

You spent time building support for sms and retries, but you don’t use them.
This is extra logic to maintain, test, and potentially fix in the future — **wasted effort**.


-  **YAGNI Applied**

```python
def send_email(user):
    print(f"Sending email to {user}")
```
You can always refactor later if you do need SMS or retries. But until then, this is simpler, easier to test, and easier
to maintain.


## Common Violations

- Writing code for features "you might need later"
- Adding configuration or flags for future use
- Building complex inheritance or plugin systems early

## Summary

YAGNI = Don’t do extra work for hypothetical needs.
Build what you need now, not what you think you might need.