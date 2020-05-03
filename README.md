# argocd-helm-secrets

Custom Argo CD Docker image with [sops](https://github.com/mozilla/sops) and ([helm-secrets](https://github.com/zendesk/helm-secrets)).


## Docker Hub

[ventx/argocd-helm-secrets](https://cloud.docker.com/u/ventx/repository/docker/ventx/argocd-helm-secrets)


## Docker image

* Base Image: [argoproj/argocd](https://hub.docker.com/r/argoproj/argocd):[v1.5.3](https://hub.docker.com/layers/argoproj/argocd/v1.5.3/images/sha256-60edd3283acbfc83cc6e23218c3882d512273f4a3073940b1619f8d8be9c6a1e?context=explore)
* OS: debian:10-slim _([Debian Buster](https://www.debian.org/releases/buster/))_


## Installed Packages (apt)

* [curl](https://packages.debian.org/buster/curl)
* [wget](https://packages.debian.org/buster/wget)


## Installed Packages (go binaries)

* [sops](https://github.com/mozilla/sops) `v3.5.0`


# Helm Plugins

* [helm-secrets](https://github.com/zendesk/helm-secrets) `2.0.2`
