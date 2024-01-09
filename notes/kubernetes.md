# Kubernetes

### Which services do we need to make use of in order to deploy FE and BE?
We need to make FE service and BE service `Load Balancer` so that:
- Frontend can be accessible publicly (i.e. use port 80 for FE)
- FE can reach BE because it tries to make requests to `localhost:8080`. So, its worth mentioning that we need to use port `Load Balancer;8080` for BE.

### How to handle communication between pods/services?
If they are part of same node in EKS, you can use `Load Balancer` or `Node Port` for communication. We will use `Load Balancer` because we have our application configured to send requests to a specific `address:port`. Otherwise we'd have to keep updating the `port` in FE application so that it can communicate at a randomly generated port for BE. 

### Do we need an ingress?
<s>No, we don't have to. We can simply use `port:80` in FE `service.yaml`.</s>

Edit: Using it now to make whole app accessible from a single host. But still not a requirement.
```
FE: /
BE: /api
```

### Do we need to port forward the service inside EKS so that they are accessible internally and externally?
Yes we do need to port forward it to access ArgoCD, Prometheus and Grafana because their `service.yaml` keeps them private for security reasons. And we can only access it locally using `kubectl`.

But, if we really want those dashboards public, we'd have to use an ingress to access them.
