<!-- markdownlint-disable MD033 -->
<h1>
    <img src="https://github.com/sighupio/fury-distribution/blob/main/docs/assets/fury-epta-white.png?raw=true" align="left" width="90" style="margin-right: 15px"/>
    Kubernetes Fury Kuma
</h1>
<!-- markdownlint-enable MD033 -->

![Release](https://img.shields.io/badge/Latest%20Release-v1.0.0-blue)
![License](https://img.shields.io/github/license/sighupio/fury-kubernetes-kuma?label=License)
![Slack](https://img.shields.io/badge/slack-@kubernetes/fury-yellow.svg?logo=slack&label=Slack)

<!-- <KFD-DOCS> -->

**Kubernetes Fury Kuma** add-on module for the [Kubernetes Fury Distribution (KFD)][kfd-repo] adds Kuma and Kong Mesh to your KFD cluster.

If you are new to KFD please refer to the [official documentation][kfd-docs] on how to get started with KFD.

## Overview

**Kubernetes Fury Kuma** add-on module deploys a service mesh into a Kubernetes cluster. A service mesh allows to transparently add capabilities like observability, traffic management, and security to applications, without modifying their source code. These capabilities are of great value when running microservices at scale or under strict security requirements.

### Kuma

This module features Kuma Service Mesh. It's a modern control plane for microservices and service mesh for Kubernetes and VMs, with support for multiple meshes in one cluster.

Read more on [Kuma docs][kuma-docs-site].

### Kong Mesh

Kong Mesh is an enterprise-grade service mesh built on top of Kuma.

Read more on [Kong Mesh docs][kong-mesh-docs-site].

## Packages

Kubernetes Fury Service Mesh provides the following packages:

| Package                                  | Version   | Description                                                                                                                                                               |
| ---------------------------------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Kong Mesh](katalog/kong-mesh) | `v2.6.5` | Kong Mesh package. Includes `standalone` and `multi-cluster` setup. |
| [Kuma](katalog/kuma) | `v2.6.5` | Kuma package. Includes `standalone` and `multi-cluster` setup. |

## Compatibility

| Kubernetes Version |   Compatibility    | Notes           |
| ------------------ | :----------------: | --------------- |
| `1.24.x`           | :white_check_mark: | No known issues |
| `1.25.x`           | :white_check_mark: | No known issues |
| `1.26.x`           | :white_check_mark: | No known issues |
| `1.27.x`           | :white_check_mark: | No known issues |

Check the [compatibility matrix][compatibility-matrix] for additional information about previous releases of the modules.

## Usage

### Prerequisites

| Tool                                    | Version    | Description                                                                                                                                                    |
| --------------------------------------- | ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [furyctl][furyctl-repo]                 | `>=0.6.0`  | The recommended tool to download and manage KFD modules and their packages. To learn more about `furyctl` read the [official documentation][furyctl-repo].     |
| [kustomize][kustomize-repo]             | `>=3.9.1`  | Packages are customized using `kustomize`. To learn how to create your customization layer with `kustomize`, please refer to the [repository][kustomize-repo]. |
| [KFD Monitoring Module][kfd-monitoring] | `>=1.11.1` | To have functioning metrics, dashboards and alerts.                                                            |
| [KFD Logging Module][kfd-logging]       | `>=1.7.1`  | When using tracing, ElasticSearch / OpenSearch is used as storage.                                                                                             |
| [KFD Ingress Module][kfd-ingress]       | `>=2.0.0`  | To automate the handling of CA and certificates.                                                                                             |

### Kuma deployment

1. To start using Kubernetes Fury Kuma, add to your `Furyfile.yml` the module as a base, you can also specify the single package:

```yaml
bases:
    - name: kuma/kuma
      version: v1.0.0
```

> See `furyctl` [documentation][furyctl-repo] for additional details about `Furyfile.yml` format.

2. Execute the following command to download the packages to your machine:

```bash
furyctl vendor -H
```

3. Inspect the downloaded packages under `./vendor/katalog/kuma` to get familiar with the content.

4. Define a `kustomization.yaml` with that includes the `./vendor/katalog/kuma` directory as a resource:

```yaml
resources:
    - ./vendor/katalog/kuma/kuma/standalone
```

> You can point to one of the predefined setups (`standalone`, `multi-cluster/global-control-plane` or `multi-cluster/zone-control-plane`) here.
> For additional details follow the [examples](examples/kuma/multi-cluster/README.md).

### Kong Mesh deployment

1. To start using Kubernetes Fury Service Mesh, add to your `Furyfile.yml` the module as a base, you can also specify the single package:

```yaml
bases:
    - name: kuma/kong-mesh
      version: v1.0.0
```

> See `furyctl` [documentation][furyctl-repo] for additional details about `Furyfile.yml` format.

2. Execute the following command to download the packages to your machine:

```bash
furyctl vendor -H
```

3. Inspect the downloaded packages under `./vendor/katalog/kuma` to get familiar with the content.

4. Define a `kustomization.yaml` with that includes the `./vendor/katalog/kuma` directory as a resource:

```yaml
resources:
    - ./vendor/katalog/kuma/kong-mesh/standalone
```

> You can point to one of the predefined setups (`standalone`, `multi-cluster/global-control-plane` or `multi-cluster/zone-control-plane`) here.
> For additional details follow the [examples](examples/kong-mesh/multi-cluster/README.md).
> :warning: You will need a valid license to use Kong Mesh. If you don't have it, please use Kuma instead.

<!-- links -->
[kfd-repo]: https://github.com/sighupio/fury-distribution
[kuma-docs-site]: https://kuma.io/docs
[kong-mesh-docs-site]: https://docs.konghq.com/mesh/latest/
[furyctl-repo]: https://github.com/sighupio/furyctl
[kustomize-repo]: https://github.com/kubernetes-sigs/kustomize
[kfd-docs]: https://docs.kubernetesfury.com/docs/distribution/
[compatibility-matrix]: https://github.com/sighupio/fury-kubernetes-kuma/blob/master/docs/COMPATIBILITY_MATRIX.md

[kfd-monitoring]: https://github.com/sighupio/fury-kubernetes-monitoring
[kfd-logging]: https://github.com/sighupio/fury-kubernetes-logging
[kfd-ingress]: https://github.com/sighupio/fury-kubernetes-ingress
<!-- </KFD-DOCS> -->

<!-- <FOOTER> -->
## Contributing

Before contributing, please read first the [Contributing Guidelines](docs/CONTRIBUTING.md).

### Reporting Issues

In case you experience any problems with the module, please [open a new issue](https://github.com/sighupio/fury-kubernetes-kuma/issues/new/choose).

### Kong Mesh docs

Refer to [./docs/kong-mesh/README.md](./docs/kong-mesh/README.md)

## License

This module is open-source and it's released under the following [LICENSE](LICENSE)
<!-- </FOOTER> -->
