FROM argoproj/argocd:v1.5.3

ARG HELM3=v3.2.0
ARG HELM_SECRETS=2.0.2

USER root

# Install dependencies
RUN apt-get update \ 
  && apt-get install -y curl sudo wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Helm3
RUN wget -qO- https://get.helm.sh/helm-${HELM3}-linux-amd64.tar.gz | tar -xzO linux-amd64/helm > /usr/local/bin/helm3 \
  && chmod +x /usr/local/bin/helm3

# Install helm-secrets
RUN helm plugin install https://github.com/futuresimple/helm-secrets --version ${HELM_SECRETS} \
  && mkdir -p /home/argocd/.local/share/helm/plugins/helm-secrets \
  && mv /root/.local/share/helm/plugins/helm-secrets /home/argocd/.local/share/helm/plugins/helm-secrets \
  && mkdir -p /home/argocd/.cache/helm/plugins/https-github.com-futuresimple-helm-secrets \
  && mv /root/.cache/helm/plugins/https-github.com-futuresimple-helm-secrets /home/argocd/.cache/helm/plugins/ \
  && ln -fs /home/argocd/.cache/helm/plugins/https-github.com-futuresimple-helm-secrets /home/argocd/.local/share/helm/plugins/ \
  && chown -R argocd:argocd /home/argocd/.local \
  && chown -R argocd:argocd /home/argocd/.cache \
  && SUDO_FORCE_REMOVE=yes apt-get remove sudo -y

USER argocd
