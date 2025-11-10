#!/bin/bash

# Script para executar os testes da API ServeRest

echo "====================================="
echo "  Executando Testes - API ServeRest  "
echo "====================================="
echo ""

# Verifica se Newman está instalado
if ! command -v newman &> /dev/null
then
    echo "Newman não está instalado!"
    echo "Instale com: npm install -g newman"
    exit 1
fi

# Criar pasta de reports se não existir
mkdir -p reports

# Executar os testes
newman run collections/ServeRest-API-Tests.postman_collection.json \
  -e environments/serverest-env.postman_environment.json \
  -r cli,html \
  --reporter-html-export reports/report-$(date +%Y%m%d-%H%M%S).html \
  --color on

echo ""
echo "====================================="
echo "  Execução finalizada!"
echo "  Confira o relatório em: reports/"
echo "====================================="
