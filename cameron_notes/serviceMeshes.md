# Service Mesh Comparison

## Linkerd
### Pros:
- Great traffic viewing/control
- supports external connections
### Cons:
- Doesnt support websockets
- large memory footprint per node agent(due to JVM)
#### Notes: 
- linkerd2 is written in Rust/Golang, which helps
mitigate the memory issues, and aims to support more protocols. 
- Future use is moving towards linkerd2

## Consul
### Pros:
- Easy to connect Consul to machines/services *outside* the K8s cluster 
- no centralized control plane(install is a single binary)
so it can be used to control/throttle performance
- more modular; supports Envoy for data plane
- Easy Security(Built-in encryption)
- Used on the most stacks(according to stackshare)
### Cons:
- default proxy is lacking in features; all but requires use of another proxy(e.g. Envoy/Traefik)
#### Notes:
- Documentation was not great when issues were encountered; There were necessary details to make it work that it didn't mention
- Consul can be deployed with or without k8s

## Istio
### Pros:
- Large, full of features and widely used.
- Works well with helm charts
- Default setup is stable and easy to set up
- Built to work very well with k8s
### Cons:
- Due to how big it is, there can be a steep learning curve for attaching to different services/using other modules/changing config

### Best for:
- Telemetry: Linkerd
- Security: Consul

## Current Verdict:
Consul is the most modular, and actively maintained.
The documentation itself can be lacking at times but if you're willing to mess with it then it is definitely the most scalable,
and it is the most lightweight of these options.