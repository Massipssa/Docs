# Schema Registry

* The main values:
    - Rgister schema
    - Enable schema evolution

* Schema are managed in subject
    - Ex: ```http://localhost:8081/subjects/<topicname-value>```

* Producer only contacts Schema Registry on the first schema write
* Consumer only contacts Schema Registry on the first schema id read

* Client applications have the ability to registry the schema autmatically when they write to topic, this is convinient for developpement but to be disabled for production
    - ```auto.register.schemas=false```

## Compatibility Mode

- Backward
- Backward_transitive
- Forward
- Forward_transitive
- Full
- Full_transitive
-  None

## APIs:

* Subject
    - GET all subjects: ```http://localhost:8081/subjects/```
    - GET all version of subject: ```http://localhost:8081/subjects/<topicname-value>/versions```
    - GET specfic version of subject: ```http://localhost:8081/subjects/<topicname-name>/versions/<version-id>```

* Config
    - ````http://localhost:8081/config/<topicname-value>````