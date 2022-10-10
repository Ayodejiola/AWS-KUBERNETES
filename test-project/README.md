# Test Project

Python - Flask Web App, which reads the current RAM and CPU usage and a React frontend which shows the statistics in the browser

# Docker Compose Deployment
## How to run ?
Ensure you have docker compose installed
### Step 1
`cd test-project`

### Step 2
`docker-compose up --build`



# Kubernetes Deployment
## How to run ?
Ensure you have `docker and kubernetes cluster setup with kubectl cli access` installed
### Step 1 (Building backend Image)
Build your docker image and push to a public docker registry

`cd test-project/api`

`docker build -t <REPOSITORY_NAME>:<TAG> .`

### Step 2 (Building backend Image)
Build your docker image and push to a public docker registry

`cd test-project/sys-stats`

`docker build -t <REPOSITORY_NAME>:<TAG> .`

example
    `docker build -t test-project/test:fe .`


### Step 3 (push image to registry)
Build your docker image and push to a public docker registry

`cd test-project/sys-stats`

`docker image push <REPOSITORY_NAME>:<TAG>`

example
    `docker image push test-project/test:fe`

### Step 4 (deploy to kubernetes)
Build your docker image and push to a public docker registry

`cd deployment/kubernetes`

`kubectl create ns development && kubectl apply -f .`



# Terraform Deployment


### Step 1 (Initialize terraform)
Initialize the teraform modules

`cd deployment/terraform`

`teraform init`

Enter your AWS SECRET and AWS ACCESS KEY


### Step 2 (Terraform plan)
Preview Infrasture changes
NB: Rename secrets.tfvars and attach your aws secert key and access id

`cd deployment/terraform`

`teraform plan`


### Step 3 (Terraform apply)
Apply changes on aws account

`cd deployment/terraform`

`teraform apply`

