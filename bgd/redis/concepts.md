https://medium.com/@madhukaudantha/microservice-architecture-and-design-patterns-for-microservices-e0e5013fd58a

### Docker image 
```docker run --name redis-server -d redis```

* Master / Slave architecture 

### Basic commands: 
- Start cli ```redis-cli```
- Check connection ```ping```
- Quit connection ```QUIT```
- Set and get value: 
    ```SET foo 100```
    ```GET foo```
- Increment or decrement ```INCR / DECR foo``` ==> 101 / 100
- Check if exists ```EXISTS foo```
- Delete ```DEL foo```
- Clear all ```FLUSHALL```
- Set expire ```EXPIRE foo 50``` ==> will expire in 50 seconds
- Remaing time to expire ```TTL foo ```
- Set value with experation ```SETEX  time key value```