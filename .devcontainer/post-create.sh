#!/bin/bash

set -e

# Função para verificar se o Docker está funcionando
check_docker() {
  echo "Verificando conectividade com o Docker..."
  if ! docker info > /dev/null 2>&1; then
    echo "ERRO: Não foi possível conectar ao Docker. Verifique se o socket está mapeado corretamente."
    return 1
  fi
  echo "Conectividade com Docker OK!"
  return 0
}

# Função para criar um cluster KinD
create_kind_cluster() {
  echo "Criando cluster KinD..."
  
  # Verificar se já existe um cluster com este nome
  if kind get clusters 2>/dev/null | grep -q "devcontainer-cluster"; then
    echo "Cluster 'devcontainer-cluster' já existe."
    return 0
  fi

  # Configuração do cluster KinD com mapeamento de portas
  cat > /tmp/kind-config.yaml << EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
EOF

  kind create cluster --name devcontainer-cluster --config /tmp/kind-config.yaml
  
  echo "Configurando o contexto do kubectl..."
  mkdir -p $HOME/.kube
  kind get kubeconfig --name devcontainer-cluster > $HOME/.kube/config
  
  return 0
}

# Instalar dependências do projeto
install_project_deps() {
  echo "Instalando dependências adicionais do projeto..."
  # Adicione comandos adicionais aqui
}

# Execução principal
main() {
  echo "Iniciando configuração do ambiente de desenvolvimento..."
  
  if check_docker; then
    create_kind_cluster
    install_project_deps
    echo "Ambiente de desenvolvimento configurado com sucesso!"
  else
    echo "Falha ao configurar o ambiente de desenvolvimento."
    exit 1
  fi
}

# Executar o script principal
main