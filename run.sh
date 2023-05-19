#!/bin/bash

# Define a versão do Go a ser baixada
GO_VERSION="1.17.2"

# Define o nome do arquivo compactado do Go
GO_ARCHIVE="go${GO_VERSION}.linux-amd64.tar.gz"

# Define o URL para download do Go
GO_URL="https://golang.org/dl/${GO_ARCHIVE}"

# Define o diretório de instalação do Go
GO_INSTALL_DIR="/usr/local"

# Baixa o arquivo do Go
wget ${GO_URL}

# Extrai o arquivo do Go
tar -C ${GO_INSTALL_DIR} -xzf ${GO_ARCHIVE}

# Adiciona as variáveis de ambiente do Go ao arquivo ~/.bashrc
echo "export GOROOT=${GO_INSTALL_DIR}/go" >> ~/.bashrc
echo "export GOPATH=\$HOME/go" >> ~/.bashrc
echo "export PATH=\$PATH:\$GOROOT/bin:\$GOPATH/bin" >> ~/.bashrc

# Atualiza as variáveis de ambiente no shell atual
export GOROOT=${GO_INSTALL_DIR}/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Remove o arquivo compactado do Go
rm ${GO_ARCHIVE}

# Instala o pacote desejado
go install github.com/foxboron/sbctl/cmd/sbctl@latest

# Executa o binário do pacote instalado
$($GOROOT/bin/go env GOPATH)/bin/sbctl

echo "Go ${GO_VERSION} foi baixado, as variáveis de ambiente foram configuradas e o pacote foi instalado."
echo "Por favor, abra um novo terminal para que as alterações tenham efeito."

