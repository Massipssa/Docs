
````shell
gcloud config set compute/region us-central1
gcloud config set compute/zone us-central1-f

# create the cluster
gcloud container clusters create --machine-type=e2-medium --zone=us-central1-f lab-cluster 

# get credentials 
gcloud container clusters get-credentials lab-cluster 

# deploy hello app 
kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0
kubectl expose deployment hello-server --type=LoadBalancer --port 8080
kubectl get service

# delete the cluster 
gcloud container clusters delete lab-cluster 
````
