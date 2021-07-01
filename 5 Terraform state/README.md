## Terraform state example using Kubernetes

- We explored terraform state in earlier example, here we would like to understand how the declarative way of terraform can be used to make changes to infrastructure 
- It is assumed that you are using [minikube](https://minikube.sigs.k8s.io/docs/) to setup your K8s cluster
- We aim to create kubernetes cluster with below configuration:<br>
    1. A K8s namespace (named nginx)
    2. A K8s service for us interact
    3. A deployment for creating our PODs (which creates it via replica set)
    <br>
    <br>

- Our manifest will have 2 scalable replicas of nginx images, which can be controlled via the labels i.e *app = "MyTestApp"*
- Service type is a NodePort service which exposes to port 30201, which can be customized to any port between (30000 - 32767)

- You may use,
    > minikube service list<br>

    to ascertain the URL to which the minikube is configured to expose your service, or alternatively may below to open your service URL,

    > minikube service nginx -n nginx
