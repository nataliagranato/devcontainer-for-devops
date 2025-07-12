# O que é um DevContainer?

Um **DevContainer** é uma funcionalidade do Visual Studio Code que permite configurar um ambiente de desenvolvimento isolado dentro de um contêiner Docker. Ele é definido por arquivos de configuração, como `devcontainer.json`, que especificam a imagem base, ferramentas, extensões e configurações necessárias para o desenvolvimento. 

Ao usar um DevContainer, você garante que todos os desenvolvedores de um projeto tenham o mesmo ambiente, eliminando problemas de inconsistência entre máquinas e simplificando o processo de configuração.

## Benefícios do DevContainer

- **Isolamento**: O ambiente de desenvolvimento é executado dentro de um contêiner, separado do sistema operacional do desenvolvedor.
- **Reprodutibilidade**: O ambiente pode ser recriado facilmente em qualquer máquina com Docker e VS Code.
- **Produtividade**: Ferramentas e dependências já configuradas economizam tempo e esforço.
- **Consistência**: Todos os desenvolvedores utilizam o mesmo ambiente, reduzindo erros relacionados a diferenças de configuração.

Este repositório contém uma configuração de DevContainer projetada para tarefas de **DevOps**, com ferramentas como Docker CLI, Kubernetes, Helm e KinD pré-instaladas, além de extensões úteis para o VS Code.

## Funcionalidades do DevContainer

O DevContainer configurado neste repositório oferece as seguintes funcionalidades:

1. **Ambiente Isolado**:
   - O DevContainer utiliza um contêiner Docker como ambiente de desenvolvimento, garantindo que as dependências e configurações não interfiram no sistema operacional do desenvolvedor.

2. **Ferramentas Pré-Instaladas**:
   - **Docker CLI**: Para gerenciar contêineres e imagens Docker.
   - **kubectl**: Para interagir com clusters Kubernetes.
   - **KinD (Kubernetes in Docker)**: Para criar e gerenciar clusters Kubernetes locais.
   - **Helm**: Para gerenciar pacotes Kubernetes.
   - **K9s**: Para monitorar e gerenciar clusters Kubernetes via terminal.
   - **Terraform**: Para infraestrutura como código (IaC).
   - **OpenTofu**: Alternativa open-source ao Terraform para IaC.
   - **terraform-docs**: Para gerar documentação de módulos Terraform.
   - **Terragrunt**: Para gerenciar configurações Terraform em larga escala.
   - **Golang**: Linguagem de programação Go para desenvolvimento de ferramentas DevOps.
   - **AWS CLI v2**: Para interagir com serviços da Amazon Web Services.
   - **Azure CLI**: Para interagir com serviços da Microsoft Azure.
   - **Google Cloud SDK (gcloud)**: Para interagir com serviços do Google Cloud Platform.
   - **GitHub CLI (gh)**: Para interagir com GitHub via linha de comando.
   - **Ansible**: Para automação de configuração e gerenciamento de infraestrutura.
   - **Packer**: Para criação de imagens de máquinas automatizadas.
   - **Pulumi**: Para infraestrutura como código usando linguagens de programação modernas.
   - **Chef Workstation**: Para automação de configuração usando Chef.
   - **Puppet**: Para automação de configuração e gerenciamento de sistemas.
   - **Stern**: Para logs multi-pod no Kubernetes.
   - **yq**: Para processamento de arquivos YAML.
   - **jq**: Para processamento de dados JSON.
   - **curl**: Para transferência de dados via HTTP/HTTPS.
   - **httpie**: Cliente HTTP amigável para linha de comando.
   - **promtool**: Para validação de configurações do Prometheus.
   - **tfsec**: Análise de segurança estática para Terraform.
   - **kubescape**: Scanner de segurança para clusters Kubernetes.
   - **kube-bench**: Verificador de segurança para Kubernetes baseado no CIS Benchmark.
   - **kubectx**: Para alternar entre contextos do Kubernetes facilmente.
   - **kubens**: Para alternar between namespaces do Kubernetes facilmente.
   - **Kustomize**: Para personalização de configurações Kubernetes.
   - **Sops**: Para criptografia de secrets em arquivos de configuração.
   - **Vault CLI**: Para gerenciamento de secrets usando HashiCorp Vault.
   - **Minikube**: Para executar Kubernetes localmente.
   - **Skaffold**: Para desenvolvimento iterativo em Kubernetes.
   - **pre-commit**: Para execução de hooks Git antes de commits.
   - **make**: Para automação de builds e tarefas.
   - **Task**: Alternativa moderna ao make para automação de tarefas.

3. **Configuração Automática**:
   - O script `post-create.sh` é executado automaticamente após a criação do DevContainer, configurando:
     - Verificação de conectividade com o Docker.
     - Criação de um cluster Kubernetes local usando KinD.
     - Ajustes no contexto do `kubectl` para facilitar o uso.

4. **Extensões do VS Code**:
   - Extensões úteis para desenvolvimento DevOps, como:
     - Docker
     - Kubernetes
     - YAML
     - Code Spell Checker
     - GitHub Copilot

5. **Mapeamento de Portas**:
   - As portas necessárias para o funcionamento do cluster Kubernetes e outras ferramentas são encaminhadas automaticamente:
     - Porta `6443` para o servidor API do Kubernetes.
     - Porta `2375` para o Docker.

6. **Permissões e Usuário**:
   - O usuário `vscode` é configurado com permissões adequadas para executar comandos Docker e Kubernetes sem necessidade de senha.

## Importância de um Ambiente Isolado

Ter um ambiente isolado como este é essencial para o desenvolvimento e testes em projetos DevOps, pois:

- **Consistência**: Garante que todos os desenvolvedores utilizem o mesmo ambiente, eliminando problemas relacionados a diferenças de configuração entre máquinas.
- **Segurança**: Mantém o ambiente de desenvolvimento separado do sistema operacional principal, reduzindo riscos de alterações indesejadas.
- **Reprodutibilidade**: Permite recriar o ambiente de forma rápida e confiável, facilitando a colaboração e a integração contínua.
- **Produtividade**: Ferramentas e dependências já configuradas economizam tempo e esforço, permitindo que os desenvolvedores foquem no código.

## Como Usar

1. Certifique-se de ter o Docker instalado e em execução no seu sistema.
2. Abra este repositório no VS Code.
3. Quando solicitado, escolha "Reabrir no DevContainer".
4. Aguarde a configuração automática do ambiente.
5. Após a configuração, você terá acesso a todas as ferramentas e configurações necessárias para começar a trabalhar.

## Utilizando no GitHub Codespaces

Se preferir, você pode usar este DevContainer diretamente no **GitHub Codespaces**, sem a necessidade de configurar o ambiente localmente. Basta abrir o repositório no Codespaces e o ambiente será configurado automaticamente, garantindo a mesma experiência de desenvolvimento.

---

Feito com ❤️ para facilitar o desenvolvimento de containers, testes e empacotamento para Kubernetes.