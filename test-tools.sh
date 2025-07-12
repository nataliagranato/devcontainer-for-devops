#!/bin/bash

set -e

echo "=== Testando ferramentas DevOps instaladas ==="
echo

# Função para testar uma ferramenta
test_tool() {
    local tool_name=$1
    local command=$2
    local expected_pattern=$3
    
    echo "🔍 Testando $tool_name..."
    
    if command -v "${command%% *}" &> /dev/null; then
        output=$(eval "$command" 2>&1 || echo "Erro ao executar comando")
        if [[ $output =~ $expected_pattern ]]; then
            echo "✅ $tool_name: OK"
            echo "   Versão: $output"
        else
            echo "❌ $tool_name: Erro - output inesperado"
            echo "   Output: $output"
            return 1
        fi
    else
        echo "❓ $tool_name: Comando não encontrado (pode não estar instalado neste ambiente)"
        return 0  # Continue testing other tools
    fi
    echo
}

# Testando cada ferramenta
echo "Iniciando testes das ferramentas..."
echo

test_tool "Docker CLI" "docker --version" "Docker version"
test_tool "kubectl" "kubectl version --client=true --output=yaml" "clientVersion"
test_tool "KinD" "kind version" "kind"
test_tool "Helm" "helm version --short" "v3"
test_tool "K9s" "k9s version --short" "Version"
test_tool "Terraform" "terraform version" "Terraform v"
test_tool "OpenTofu" "tofu version" "OpenTofu v"
test_tool "terraform-docs" "terraform-docs version" "terraform-docs version"
test_tool "Terragrunt" "terragrunt --version" "terragrunt version"
test_tool "Golang" "go version" "go version"
test_tool "AWS CLI" "aws --version" "aws-cli"
test_tool "Ansible" "ansible --version" "ansible"
test_tool "Packer" "packer version" "Packer v"
test_tool "Vault CLI" "vault version" "Vault v"
test_tool "Pulumi" "pulumi version" "v"
test_tool "Chef Workstation" "chef --version" "Chef Workstation version"
test_tool "Puppet" "puppet --version" "^[0-9]+\."
test_tool "yq" "yq --version" "yq"
test_tool "stern" "stern --version" "stern version"
test_tool "httpie" "http --version" "HTTPie"
test_tool "tfsec" "tfsec --version" "tfsec version"
test_tool "kubescape" "kubescape version" "v"
test_tool "kube-bench" "kube-bench version" "version"
test_tool "Azure CLI" "az version" "azure-cli"
test_tool "Google Cloud SDK" "gcloud version" "Google Cloud SDK"
test_tool "GitHub CLI" "gh version" "gh version"
test_tool "kubectx" "kubectx --help" "usage"
test_tool "kubens" "kubens --help" "usage"
test_tool "Kustomize" "kustomize version" "v"
test_tool "Sops" "sops --version" "sops"
test_tool "Minikube" "minikube version" "minikube version"
test_tool "Skaffold" "skaffold version" "v"
test_tool "Task" "task --version" "Task version"
test_tool "promtool" "promtool --version" "promtool, version"
test_tool "pre-commit" "pre-commit --version" "pre-commit"
test_tool "make" "make --version" "GNU Make"
test_tool "jq" "jq --version" "jq-"
test_tool "curl" "curl --version" "curl"

echo "=== Teste concluído ==="
echo "✅ Teste das ferramentas concluído. Verifique as mensagens acima para detalhes de cada ferramenta."