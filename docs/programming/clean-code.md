# Naming

- Variables
    - Avoid disinformation (meaningfully names)
    - Use Pronounceable Names
  
## Error handling

- **Use exception rather than return codes**
    - It's easy to forget to check exception, to avoid that throw the exception
- **Catch relevant exceptions**
- **Provide context to the exception**
    - Create informative error messages and pass them along with your exceptions
    - Mention the operation that failed and the type of the failure
- Define you custom exceptions
- Wrap the third-party API is a best practice best because you minimize your dependencies upon it 
    - You can choose to move to different library without much penalty
    - Makes it easier to mock 
    - Aren't tied to a particular vendor API design choices

- Don't return null
- Don't pass null

## Unit Tests
