* ``` docker build ``` command builds an image from dockerfile and context
* The build’s context is the set of files at a specified location PATH or URL
    *   ***PATH:*** is a directory on your local filesystem
    *   ***URL:*** is a Git repository location
* Context are processed recursively 
* Use ```.dockerignore``` to increase build performance 
* Each command in dockerfile causes a new image to be created
* To accelerate the docker build process significantly see Caches 
* ```docker build -f /path/to/a/Dockerfile -t image_repo/image_tag```

### Commands

* **FROM**: definir l'image de base (une seule fois dans un dockerfile)
* **ENV**: set up environement variable 
    * Note a variable : ```${variable_name}```
    * Default value :
        *   ```${variable:-word}``` indicates that if variable is set then the result will be that value. If variable is not set then word will be the result
        *   ```${variable:+word}``` indicates that if variable is set then word will be the result, otherwise the result is the empty string
* **ARG**:
* **RUN**: execute command within a current image 
* **WORKDIR**: changer le répertoire de travail. Toutes les commandes qui suivent seront exécutées dans ce réperoitre 
* **EXPOSE**: 
    * Open port on the docker image
    * TCP and UDP protocols can be specified ```(e.g. EXPOSE 80/udp)``` if not sepecified  default is TCP
* **VOLUME**: le volume a partager  
* **LABEL**: add metadata to the image 
* **MAINTAINER (Deprecated):** maitainer is to be set in LABAL maintainer="kerrache.massipssa@gmail.com"
* **LABEL Remarks**:  set label
* **COPY**: data/httpd.conf /etc/httpd/conf/httpd.conf
* **ADD**: data/html.tar.gz /var/www/html/ 
    difference between COYP and ADD, that add will extract .tar.gz in the destination folder 
* **CMD & ENTRYPOINT**: to define executable once docker is up
    *   **ENTYPOINT**: allows to configure a container that will run as an executable
    *   **CMD**: 
        *   Executes commands if container runs without arguments   
        *   Defines additional parameters that are required for ENTRYPOINT 
* **USER**: define the user to be used when running the image and for any RUN, CMD and ENTRYPOINT instructions that follow it in the Dockerfile 
* **ONBUILD**: 
* **STOPSIGNAL**: number to send to container to exit


### How to pass env to image 
1. Using ```-e VAR_ENV_NAME=value```
2. Load from system env variables, just specfiy the name of variable ```-e VAR_ENV_NAME```
3. From file ```--env-file=env_file_name``` 
