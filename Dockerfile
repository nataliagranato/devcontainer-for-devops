# Usar uma imagem base com suporte ao Docker
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04

# Instalar dependências básicas
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Instalar Docker CLI
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list \
    && apt-get update && apt-get install -y docker-ce-cli

# Instalar KinD
RUN curl -Lo /usr/local/bin/kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64 \
    && chmod +x /usr/local/bin/kind

# Instalar Helm
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Configurar permissões para o usuário vscode
RUN groupadd docker && usermod -aG docker vscode

# Definir usuário padrão
USER vscode