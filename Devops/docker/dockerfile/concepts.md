### Architecture 
* Components 
    * 

### Image ###
* Pull an image
     ```bash 
        docker pull image_name
    ```
* Build an image
    ```bash 
        docker build --rm --build-arg ARG_NAME="value" \
         --build-arg HTTP_PROXY=http://user:pass@proxy.lon.example.com \
         -t image_name:tag .
    ```

### Container ###
    ```bash
        # List running containers
            docker ps  
        # Rename containe  
            docker rename <old_name> <new_name>
        # Stop container
            docker container stop <container_name> 
        # Delete a container
            docker rm <container_name>
        # Remove container and its volume
            docker rm -v <container_name>
        # Port used by container 
            docker port <container_name> 
    ```    

* Run container 
    
    ```bash
    docker run -it -d \
        -p 8080:8080 --name containr_name \
        image_name command_to_run
    ```

* Go to the container: 

    ```bash
        docker exec -ti <container_name> bash
    ```

### Storage ###

Three types of storage can be used to store the data generaded and used by the container 

* Volumes 
    *   When that container stops or is removed, the volume still exists 
    *   Multiple containers can mount the same volume simultaneously, either read-write or read-only
    *   Volumes are only removed when you explicitly remove them   
* Bind amount 
    *   The file or directory is referenced by its full path on the host machine 
    *   The file or directory does not need to exist on the Docker host already. It is created on demand if it does not yet exist
    *   You can’t use Docker CLI commands to directly manage bind mounts
* tmpfs amount 

<img src="../types-of-mounts.png"/>

#### Volume commands ####
* Create a volume 

    ```docker volume create my_volume```

* List a volume 

    ```docker volume ls```

* Remove a volume 

    ```docker volume rm my_volume```

* Inspect a volume 

    ```docker volume inspect my_volume```
    
* Prune all volumes : remove all unused volumes 

    ``` docker volume prune ```

### Neworking

* The neworks that can be used by container
    * None 
    * Host
    * Bridge (**default**)
    * Overlay
    * Macvlan

* Create network 
    
    ```bash 
        docker network --driver bridge my_network
    ```
* To specify wich network a container should use, flag ***--net***

    ```bash
        docker run my_container --net=my_network    
    ```
* With **docker-compose**, if network was not specified, compose automatically sets up a new network and attaches all deployed services to that network

### Registry ###

* login 
    ```
        docker login -u user -p password host.registy.com
    ```
* logout 

    ```
        docker logout host.registy.com 
    ```

Is a instance of Registry image runs within Docker

*   Deploy registry server 
    
    ```docker run -d -p 5000:5000 --restart=always --name registry registry:2```

1. Pull image from DockerHub
    
    ```docker pull ubuntu:16.04```

2. Tag the image
    
    ```docker tag ubuntu:16.04 localhost:5000/my-ubuntu```

3. Push the image to local registry

    ```docker push localhost:5000/my-ubuntu``` 

4. Remove chached image 
    
    ```docker remove ubuntu:16.04``` 

    ```docker remove localhost:5000/my-ubuntu``` 

5. Pull the image from local registry

    ```docker pull localhost:5000/my-ubuntu```  

*   Log to registry
    
    ```docker login -u username -p password localhost:8080```
