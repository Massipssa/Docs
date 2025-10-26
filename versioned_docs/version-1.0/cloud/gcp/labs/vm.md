## steps 

````shell
gloud auth list 
gloud config list project 
gcloud config set compute/region us-central1
export REGION=us-central1
export ZONE=us-central1-f
gcloud compute instances create gcelab2 --machine-type e2-medium --zone=$ZONE
````
