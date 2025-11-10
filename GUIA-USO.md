# Guia Rápido de Uso

## Instalação

```bash
# Clonar ou baixar o projeto
cd desafio-api-qa

# Instalar dependências
npm install
```
## Importar no Postman (para testar manualmente)

1. Abra o Postman
2. Clique em **Import**
3. Selecione os arquivos:
   - `collections/ServeRest-API-Tests.postman_collection.json`
   - `environments/serverest-env.postman_environment.json`
4. Selecione o environment "ServeRest Environment" no canto superior direito
5. Execute os testes clicando em "Run collection"

## Visualizar Relatórios

Após executar os testes, o relatório HTML é gerado em:
```
reports/report.html
```

Abra o arquivo no navegador para ver os resultados detalhados.

## Estrutura dos Testes

- **CT-001**: Login válido (deve passar)
- **CT-002**: Login inválido (deve passar)
- **CT-003**: Criar usuário (deve passar)
- **CT-004**: Email duplicado (deve passar)
- **CT-005**: Criar produto admin (depende do CT-001)
- **CT-006**: Criar produto sem auth (deve passar)
- **CT-007**: Criar carrinho (depende do CT-005)
- **CT-008**: Estoque insuficiente (depende do CT-005)
- **CT-009**: Concluir compra (Deletar carrinho) 

## Troubleshooting

### Newman não encontrado
```bash
npm install -g newman newman-reporter-html
```

### Testes falhando
- Verifique sua conexão com a internet
- API ServeRest pode estar fora do ar
- Tente executar novamente após alguns minutos
