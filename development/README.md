## bootstrap a kubernetes cluster. 
### Requirements
- `kubectl`
- `Docker Desktop` Docker Engine should suffice
- `kind`
- `yq`
- `devspace-cli`
- `openssl`

### Bootstrap 
1. `devspace run prep`
1. `devspace run bootstrap`

This will bootstrap a kind cluster named `crucible (kind-crucible)` with an nginx ingress.  

### Cleanup 
To destroy the cluster and your development environment run 
`devspace run clean`

## Deveopment 
run `devspace run-pipline ordered-deploy` to get a working environment with all dependencies. 
