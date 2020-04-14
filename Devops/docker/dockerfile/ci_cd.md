### Aws 
### Install Jenkins in AWS 
* Créer une instance EC2
* Install java 
* Install docker 
    ```sudo curl -fsSL get.docker.com | /bin/bash```
* Add jenkins user to docker group (Docker command will be executed with user jenkins inside docker)
    ```sudo usermod -aG docker jenkins```
* Restart jenkins 
    ```sudo systemctl restart jenkins```

### Create Kubernetes cluster 
* Master with 2 workers 

* Add Kubernates plugin **Kubernetes Continuous Deploy** to Jenkins 
* Go to Jenkins Credentials 
* Add Kubernetes configuratio (kubeconfig)
    * Add crential file located in K8s master 
* Or with kubectl we can make jenkins takll with K8s


### TeamCity 
* Docker image 

```docker run -it --name teamcity-server-instance  \
    -p 8111:8111 \
    jetbrains/teamcity-server```

    -v <path-to-data-directory>:/data/teamcity_server/datadir \
    -v <path-to-logs-directory>:/opt/teamcity/logs  \