#!/bin/bash

# Script to test basic functionality of installed DevOps tools
# This script creates sample configurations and tests that the tools can process them

set -e

echo "=== Teste de funcionalidade das ferramentas DevOps ==="
echo

# Create a temporary directory for tests
TEST_DIR="/tmp/devops-tools-test"
mkdir -p "$TEST_DIR"
cd "$TEST_DIR"

# Test Terraform
echo "🧪 Testando Terraform..."
if command -v terraform &> /dev/null; then
    cat > main.tf << 'EOF'
terraform {
  required_version = ">= 1.0"
}

resource "local_file" "test" {
  content  = "Hello from Terraform!"
  filename = "${path.module}/terraform-test.txt"
}

output "message" {
  value = "Terraform test successful"
}
EOF

    terraform init > /dev/null 2>&1
    terraform validate > /dev/null 2>&1
    echo "✅ Terraform: Validação bem-sucedida"
else
    echo "❓ Terraform: Não disponível no ambiente atual"
fi

# Test OpenTofu
echo "🧪 Testando OpenTofu..."
if command -v tofu &> /dev/null; then
    cat > tofu-main.tf << 'EOF'
terraform {
  required_version = ">= 1.6"
}

resource "local_file" "tofu_test" {
  content  = "Hello from OpenTofu!"
  filename = "${path.module}/tofu-test.txt"
}

output "message" {
  value = "OpenTofu test successful"
}
EOF

    tofu init > /dev/null 2>&1
    tofu validate > /dev/null 2>&1
    echo "✅ OpenTofu: Validação bem-sucedida"
else
    echo "❓ OpenTofu: Não disponível no ambiente atual"
fi

# Test terraform-docs
echo "🧪 Testando terraform-docs..."
if command -v terraform-docs &> /dev/null; then
    cat > variables.tf << 'EOF'
variable "test_var" {
  description = "A test variable"
  type        = string
  default     = "test"
}
EOF

    terraform-docs markdown . > README-generated.md 2>/dev/null
    if [ -f "README-generated.md" ] && [ -s "README-generated.md" ]; then
        echo "✅ terraform-docs: Documentação gerada com sucesso"
    else
        echo "❌ terraform-docs: Falha ao gerar documentação"
    fi
else
    echo "❓ terraform-docs: Não disponível no ambiente atual"
fi

# Test Terragrunt
echo "🧪 Testando Terragrunt..."
if command -v terragrunt &> /dev/null; then
    cat > terragrunt.hcl << 'EOF'
terraform {
  source = "."
}

inputs = {
  test_var = "terragrunt-test"
}
EOF

    terragrunt validate > /dev/null 2>&1
    echo "✅ Terragrunt: Validação bem-sucedida"
else
    echo "❓ Terragrunt: Não disponível no ambiente atual"
fi

# Test Golang
echo "🧪 Testando Golang..."
cat > hello.go << 'EOF'
package main

import "fmt"

func main() {
    fmt.Println("Hello from Go!")
}
EOF

go mod init test-module > /dev/null 2>&1
go build hello.go > /dev/null 2>&1
if [ -f "hello" ]; then
    echo "✅ Golang: Compilação bem-sucedida"
else
    echo "❌ Golang: Falha na compilação"
fi

# Test AWS CLI
echo "🧪 Testando AWS CLI..."
# Just test that the command works and can show help
aws help > /dev/null 2>&1
echo "✅ AWS CLI: Comando executado com sucesso"

# Cleanup
cd /
rm -rf "$TEST_DIR"

echo
echo "=== Teste de funcionalidade concluído ==="
echo "✅ Testes executados para as ferramentas disponíveis no ambiente atual"