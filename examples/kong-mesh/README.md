# Kong Mesh

Kong Mesh is built on top of Kuma and Envoy. To create a seamless experience, Kong Mesh follows the same installation and configuration procedures as Kuma, but with Kong Mesh-specific binaries.

## Requirements

- Kubernetes >= `1.24.0`
- Kustomize >= `v3.6.1`
- [cert-manager](https://github.com/sighupio/fury-kubernetes-ingress/tree/master/katalog/cert-manager)

> Cert Manager is required since we need TLS certificates to be injected in data planes

## Image repository and tag

* Kuma Control Plane: `docker.io/kong/kuma-cp`
* Kuma Data Plane: `docker.io/kong/kuma-dp`
* Kuma Init: `docker.io/kong/kuma-init`

## Deployment

> To deploy Kong Mesh you will need a License from Kong

Before deploy, you have to create some resources: follow the [example](../../examples/kong-mesh/multi-cluster/README.md) to learn how.

