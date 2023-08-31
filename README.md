# Crucible Common Devspace 
### Requirements
- `Docker Desktop` Docker Engine should suffice

its best to install [brew](https://brew.sh) on your os and install the dependencies through brew. 
- `kubectl`
- `kind`
- `yq`
- `devspace-cli`
- `openssl`
## Bootstrap a Kubernetes Cluster

### Bootstrap 
1. `devspace run prep`
1. `devspace run bootstrap`

This will bootstrap a kind cluster named `crucible (kind-crucible)` with an nginx ingress.  

> **_Note:_** you may need to create a dummy kind cluster to run the initial commands `kind create cluster -n dummy` devspace needs an existing kubectl context in order to run the `prep` and `bootstrap` commands. Cleanup the cluster with `kind delete cluster -n dummy` once you've run the `prep` and `bootstrap` commands



### Cleanup 
To destroy the cluster and your development environment run 
`devspace run clean`

## Development  
run `devspace deploy` to get a working environment with all dependencies. 


### Import the SSL root-ca 
you will need to find instructions on how to import certificates based on your OS, on linux certificates are managed by the browsers. `devspace run prep`. an `ssl` folder is created at `./development/ssl` import the `root-ca.pem` into your certificate store

## Devspace Dependency
This repo can be used in other projects as a devspace dependency. Specify this repo under the `dependencies` section of your `devspace.yaml`

```yaml
  dependencies:
    crucible-common:
      git: https://github.com/sei-noconnor/crucible-common-devspace.git
      branch: main
      overwriteVars: true
```

When using this repo as a dependency `.env` files and their values are not used you will need to specify these variables in the `variables` section of your `devspace.yaml` file

```yaml
vars:
  DEVSPACE_WORKING_DIR: $(echo "$PWD")
  DOMAIN: "crucible.dev"
  ADMIN_PASS: "P@ssw0rd1!"
  POSTGRES_SERVER: postgres-postgresql.default.svc.cluster.local
  POSTGRES_USER: postgres
  POSTGRES_PASS: postgres
  INGRESS_NAMESPACE: ingress-nginx
  OAUTH_PROVIDER: keycloak
  OAUTH_AUTHORITY_URL: realms/crucible
```

commands are not inherited in the devspace UI if you want to use commands from this repo in a dependent repo UI you will need to create the commands in the `commands` section of the `devspace.yaml` file and proxy them through devspace this is not necessary if you are using the command line. 

```yaml
commands:
  prep:
    devspace run crucible-common.prep
```

