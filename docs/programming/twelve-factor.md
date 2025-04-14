## Twelve Factor

1. **Codebase**
    - Git repo per application
    - An app should have its own git repo and should not share this repo with any other apps
2. **Dependencies**
    - App should always explicitly declare all its dependencies (using tool like maven), it doesn't suppose
    that the dependencies will be available at system level 
3. **Configurations**
    - App should externalize all such configurations that vary between deployments 
    - Storage of configuration in environment
4. **Backing services**
    - Treat all such backing services as attached resources
    - No code change is needed when the service change 
5. **Build, Release, Run**
    - Separate the process of converting the codebase into running application
    - Build: compile the code and create docker image
    - Release: push the image to registry
    - Run: pull the image and run it in the container 
6. **Process - Stateless Apps**
    - Any data needs to persist must be ub backing services like database in order to allow the scaling out of 
  the application 
7. **Port binding**
8. **Concurrency**
9. **Disposability**
    - Maximize robustness with fast startup and graceful shutdown
    - If the application is under increasing load we should be able to start and stop the application
    rapidly to scale up and scale down 
10. **Dev / Prod parity**
    - Keep the gap between environments as minimal as possible
    -  A containerized application is expected to behave the same, no matter where we run it (Use docker) 
11. **Logs**
    - Publish logs as event streams
12. **Admin process**
    - Keep admin scripts together with app codebase
