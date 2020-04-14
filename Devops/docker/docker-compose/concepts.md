### Docker compose ###

* Tool for defining and running multi-container Docker applications
* Allows to handle multiple containers at once 


### Features
* **Preserve volume** : if it finds any containers from previous runs,it copies volumes from old container to new container 
* **Recreate only changed container**: when restart a service that has not changed, compose uses existing containers
* **Uses var envirnments**

### Commands 
* Run

     ```docker-compose up```

* Run in the background
    
    ```docker-compose up -d```

* Start

    ```docker-compose -f /path/to/docker-compose-file.yaml start```

* Stop

    ```docker-compose stop```

* Down: this will distroy evrything expect the volumes 

    ```docker-compose down```