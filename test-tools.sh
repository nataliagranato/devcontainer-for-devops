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
        echo "❌ $tool_name: Comando não encontrado"
        return 1
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

echo "=== Teste concluído ==="
echo "✅ Todas as ferramentas foram testadas com sucesso!"